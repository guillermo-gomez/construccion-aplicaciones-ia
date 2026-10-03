# Security and secret handling

## Core rule

**The LLM reasons; authoritative enterprise systems retain control of data and business writes.**

## Controls

- read-only agent tools for record retrieval;
- no direct LLM authorization for CRM changes;
- application-controlled `propose → confirm → write` workflow;
- HMAC-signed confirmation tokens with expiration;
- RBAC / Managed Identity for Azure runtime access;
- Key Vault / environment injection for secrets;
- explicit refusal of bulk private-record requests;
- tool allowlist evaluation;
- DeepTeam testing for PII leakage, prompt leakage, RBAC/BOLA and robustness.

## Repository hygiene

Never commit:
- Azure/API bearer tokens;
- API keys;
- `CONFIDENT_API_KEY`;
- `LANGFUSE_SECRET_KEY`;
- `TYPESAFE_API_KEY`;
- production PII/student records;
- `.env`;
- evidence files that contain sensitive runtime payloads.

This public repository intentionally uses placeholders and synthetic POC records.
