# Full sanitized source archive

The complete sanitized UNAEP V3 working tree is stored here as Base64 text chunks because the GitHub connector in this environment writes UTF-8 text files rather than binary ZIP files.

## Contents

- `chunk_01.b64` … `chunk_11.b64`
- `restore.ps1`

The restored ZIP SHA-256 must be:

```text
01f7157523708f4aa76d861892ae654f4acef27b1260b6740fe11ac4a612c19a
```

## Restore on Windows PowerShell

From this directory:

```powershell
.\restore.ps1
```

The script reconstructs:

```text
unaep-ai-trust-platform-source.zip
```

and validates its SHA-256 before reporting success.

## Security

The archived source is the **public-sanitized export**. Tenant IDs, subscription IDs, API keys, local `.env`, runtime evidence with sensitive payloads, caches and private institutional data were deliberately excluded or parameterized before archiving.
