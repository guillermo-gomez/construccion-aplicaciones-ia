# Operations runbook

## Gate 1 — local installation

```powershell
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r .\requirements.txt
python -m pytest -q
```

Expected local marker after the packaged validation script:

```text
UNAEP_LOCAL_TESTS_OK
```

## Gate 2 — API

```powershell
python -m uvicorn app.api:app --reload --port 8000
```

Validate:
- `/health`;
- protected endpoint returns 401 without API key;
- Pydantic validation returns 422 for malformed requests;
- CRM propose does not mutate state;
- CRM confirm performs the controlled write.

## Gate 3 — evaluation

Run the 100-case suite, then:
- Tool Permission;
- GEval;
- Jev;
- Confident AI hosted run.

## Gate 4 — observability and red teaming

- configure Langfuse;
- obtain a real trace ID from `/api/chat`;
- execute DeepTeam and store the risk assessment.

## Gate 5 — interoperability

- validate MCP with a client/Inspector;
- validate A2A Agent Card and JSON-RPC path.

## Gate 6 — container/cloud

- build Docker image;
- push/build in ACR;
- deploy Container Apps;
- configure Managed Identity and least-privilege access;
- validate Azure Blob and Azure AI Search.

## Gate 7 — governance

Execute `governance/gate.py`. Release remains HOLD until all mandatory controls pass.
