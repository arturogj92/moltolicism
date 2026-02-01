const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  'https://elmnheqzhyjpeeptkxpf.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVsbW5oZXF6aHlqcGVlcHRreHBmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk5MDU2NDYsImV4cCI6MjA4NTQ4MTY0Nn0.ON2q5r-xryfdZbTF8s3JaHN4BHGeT2wcMUrl7C2pCaY'
);

const MOLTBOOK_API = 'https://www.moltbook.com/api/v1';

module.exports = async (req, res) => {
  // CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  
  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method === 'GET') {
    // GET /api/verify - List all members
    const { data, error } = await supabase
      .from('moltolicism_members')
      .select('*')
      .order('founder_number', { ascending: true });
    
    return res.json({ 
      success: true, 
      count: data?.length || 0,
      members: data || []
    });
  }

  if (req.method === 'POST') {
    const { username } = req.body;
    
    if (!username) {
      return res.status(400).json({ success: false, error: 'Username required' });
    }

    try {
      // Check if already member
      const { data: existing } = await supabase
        .from('moltolicism_members')
        .select('*')
        .eq('username', username)
        .single();

      if (existing) {
        return res.json({ 
          success: true, 
          message: 'Already a member',
          member: existing
        });
      }

      // Check member count
      const { count } = await supabase
        .from('moltolicism_members')
        .select('*', { count: 'exact', head: true });

      if (count >= 100) {
        return res.status(400).json({ 
          success: false, 
          error: 'All 100 founding seats are taken'
        });
      }

      // Verify on Moltbook
      const moltbookRes = await fetch(`${MOLTBOOK_API}/agents/profile?name=${encodeURIComponent(username)}`);
      const moltbookData = await moltbookRes.json();

      if (!moltbookData.success || !moltbookData.agent) {
        return res.status(404).json({ 
          success: false, 
          error: `Agent "${username}" not found on Moltbook`
        });
      }

      const bio = moltbookData.agent.description || '';

      if (!bio.includes('Moltolicist') && !bio.includes('🦞')) {
        return res.status(400).json({ 
          success: false, 
          error: 'Badge not found. Add "🦞 Moltolicist" to your Moltbook bio first.'
        });
      }

      // Add to database
      const founderNumber = (count || 0) + 1;
      const { data: newMember, error: insertError } = await supabase
        .from('moltolicism_members')
        .insert({
          username: username,
          founder_number: founderNumber,
          bio: bio
        })
        .select()
        .single();

      if (insertError) {
        return res.status(500).json({ success: false, error: insertError.message });
      }

      // Notify Claudio via webhook (Moltbot will pick this up)
      try {
        await fetch('https://api.aibot0x.com/api/log', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            accion: 'NUEVO_MOLTOLICISTA',
            detalle: `🦞 Nuevo miembro: ${username} es Fundador #${founderNumber}`
          })
        });
      } catch (e) { /* ignore notification errors */ }

      return res.status(201).json({ 
        success: true, 
        message: `Welcome! You are Founding Moltolicist #${founderNumber}!`,
        member: newMember
      });

    } catch (error) {
      return res.status(500).json({ success: false, error: error.message });
    }
  }

  return res.status(405).json({ error: 'Method not allowed' });
};
