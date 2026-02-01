# TDD para Agentes (Test-Driven Development)

Técnica para escribir código más robusto y evitar "errores de burro".

## Concepto

Escribir el TEST antes que el código. El test define qué debe pasar, luego escribes el código mínimo para pasarlo.

## Flujo TDD

```
1. 🔴 RED    - Escribe test → Ejecuta → FALLA (esperado)
2. 🟢 GREEN  - Escribe código mínimo → Ejecuta → PASA
3. 🔵 REFACTOR - Mejora el código sin romper el test
4. 🔁 REPEAT
```

## Por qué funciona para agentes

- **Feedback determinístico** - Sabes exactamente si funciona o no
- **Menos "a ver si funciona"** - El test te dice sí o no
- **Debug preciso** - Cuando falla, sabes DÓNDE falla
- **Confianza en cambios** - Refactorizas sin miedo

## Ejemplo práctico

### Sin TDD:
```python
def parse_date(text):
    # escribo código
    # pruebo manualmente
    # "parece que funciona"
    # despliego
    # FALLA en producción con caso edge
```

### Con TDD:
```python
# 1. TEST PRIMERO
def test_parse_date():
    assert parse_date("2026-02-01") == date(2026, 2, 1)
    assert parse_date("01/02/2026") == date(2026, 2, 1)
    assert parse_date("February 1, 2026") == date(2026, 2, 1)
    assert parse_date("mañana") == date.today() + timedelta(days=1)
    assert parse_date("garbage") == None  # no explota

# 2. Ejecuto → FALLA (no existe parse_date)

# 3. Escribo parse_date mínimo para pasar tests

# 4. Ejecuto → PASA

# 5. Si añado nuevo caso, añado test primero
```

## Aplicación para tareas de agente

### Antes de ejecutar un script:
```bash
# Test: verificar que el script existe y es ejecutable
test -x ./mi_script.sh && echo "OK" || echo "FAIL"

# Test: verificar dependencias
command -v curl &>/dev/null && echo "curl OK" || echo "curl MISSING"
```

### Antes de enviar mensaje:
```
# Test mental:
- ¿El target existe?
- ¿El mensaje tiene contenido?
- ¿Es el canal correcto?
```

### Antes de afirmar un dato:
```
# Test: verificar contra contexto
- ¿Qué día es? → Consultar date
- ¿Nombre correcto? → Verificar en memoria
```

## Checklist TDD para agentes

Antes de cada acción importante:

- [ ] ¿Qué debería pasar si funciona?
- [ ] ¿Qué debería pasar si falla?
- [ ] ¿Cómo verifico el resultado?
- [ ] ¿Tengo rollback si sale mal?

## Regla de oro

> "Si no puedes probar que funciona, no sabes si funciona."

---

*Skill creada: 2026-02-01*
