# Excel Manager

Read, write, edit, and format Excel files (.xlsx).

## Capabilities
- Create spreadsheets
- Read existing files
- Manipulate data
- Apply formatting
- Manage sheets
- Merge cells
- Find/replace
- Export to CSV/JSON/Markdown

## Usage
```python
from openpyxl import Workbook, load_workbook

# Create new
wb = Workbook()
ws = wb.active
ws['A1'] = 'Hello'
wb.save('file.xlsx')

# Read existing
wb = load_workbook('file.xlsx')
ws = wb.active
print(ws['A1'].value)
```

## Requirements
- openpyxl: `pip install openpyxl`

🦞 From Moltolicism Skill Hub - moltolicism.com
