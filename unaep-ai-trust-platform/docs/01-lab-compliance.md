# LAB-01 to LAB-05 compliance

## Scope

UNAEP adapts the original five-lab progression into an Azure-first university Student Services + Admissions CRM reference implementation.

| Lab | Original engineering objective | UNAEP implementation | Verification status |
|---|---|---|---|
| LAB-01 | API contracts, classification, validation and controlled LLM use | FastAPI, Pydantic contracts, Foundry classifier, health/401/422 path | Implemented; local/runtime verification required per environment |
| LAB-02 | Chatbot + tools + CRM + explicit confirmation before sensitive writes | Agent Framework tools, CRM status, propose/confirm write flow | Implemented |
| LAB-03 | Resumable batch, idempotency, isolated failures | `batch/process_leads.py`, fingerprints, skip-completed behavior | Implemented |
| LAB-04 | Real captures, deterministic evaluation, negative/security cases, optional judge | 100-case suite, DeepEval ToolCorrectness, Tool Permission gate, GEval, Jev | Implemented; observed evidence accumulates through runs |
| LAB-05 | Cloud deployment, persistence, secrets, identity, observability and trace evidence | Docker, ACR, Container Apps, Blob, Managed Identity, Langfuse, Confident AI | Implementation path present; cloud evidence is generated only after deployment |

## Current local checkpoint

The most recent local V3 report showed:
- all requested Python/runtime packages installed successfully;
- `pytest`: **4 passed in 0.68 s**;
- final marker: **`UNAEP_LOCAL_TESTS_OK`**.

This proves the local installation/unit-test gate. It does **not** by itself prove external cloud integrations, hosted evaluation or red-team results.

## Release principle

A component is considered **100% verified** only when:
1. code exists;
2. execution succeeds;
3. evidence is captured;
4. quality/security thresholds pass;
5. the governance gate reports PASS.
