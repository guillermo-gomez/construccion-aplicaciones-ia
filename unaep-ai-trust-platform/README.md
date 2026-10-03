# UNAEP AI Trust Platform — Reference Implementation

> Public portfolio/reference implementation derived from the five AI application labs.
> Tenant IDs, subscription IDs, API keys, secrets and private institutional data are intentionally excluded.
> Synthetic POC data is used unless a runtime environment explicitly connects an authoritative enterprise system.

Purpose: close every previously identified LTM/EPAM gap except:
1. Google ADK / Vertex AI
2. AWS Bedrock / AgentCore

Those two are intentionally deferred for future cloud replicas.

## What is included
- Microsoft Foundry / Agent Framework
- FastAPI
- Academic / Administrative / Finance / Admissions CRM
- explicit confirmation before CRM writes
- Azure AI Search/RAG adapter
- resumable batch processing
- DeepEval deterministic evaluation
- Confident AI hosted reporting
- Foundry-backed GEval judge
- Jev-as-a-Judge
- deterministic Tool Permission gate
- Langfuse tracing
- DeepTeam red teaming
- AI Governance Release Gate
- MCP server
- full A2A server path using Agent Framework A2AExecutor + official a2a-sdk routes
- Docker
- Azure Container Apps / ACR / Blob bootstrap
- GitHub Copilot repository instructions, CI, and AI-SDLC metric collection
- React + Three.js trust dashboard

## Important accuracy rule
The implementation path is complete, but **do not report 100% verified coverage until
the external services are connected and all evidence gates pass**.

## Recommended gate sequence
1. Install dependencies.
2. Run pytest.
3. Start FastAPI and validate health/401/422.
4. Validate CRM propose/confirm write control.
5. Run the 100-case suite.
6. Run Tool Permission gate.
7. Run GEval with Foundry.
8. Configure and run Jev.
9. Configure Confident AI and submit hosted run.
10. Configure Langfuse and capture real trace IDs.
11. Run DeepTeam.
12. Validate MCP.
13. Activate full A2A hosting using `agent-framework-a2a`.
14. Build Docker.
15. Deploy Azure Container Apps/ACR/Blob/Managed Identity.
16. Run Governance Gate.
17. Build/run React + Three.js dashboard.

## Local start
```powershell
python -m pip install -r .\requirements.txt
python -m pytest -q
python -m uvicorn app.api:app --reload --port 8000
```

Swagger:
```text
http://127.0.0.1:8000/docs
```

## External evaluation / observability credentials
Do not paste secrets into chat, source files, screenshots, commits, or the React frontend.

- Confident AI: `CONFIDENT_API_KEY`
- Langfuse: `LANGFUSE_PUBLIC_KEY`, `LANGFUSE_SECRET_KEY`, `LANGFUSE_BASE_URL`
- Jev / TypeSafe AI: `TYPESAFE_API_KEY`

## MCP
```powershell
python -m app.mcp_server
```

## A2A
```powershell
python -m app.a2a_server
```
Then validate:
```text
http://127.0.0.1:9999/.well-known/agent-card.json
```

## Azure AI Search / RAG
After creating/configuring an Azure AI Search service:
```powershell
python .\scripts\create_search_index.py
```

## AI-assisted SDLC metrics
```powershell
python .\metrics\collect_ai_sdlc_metrics.py --copilot-assisted-commits 0
```
Replace `0` only with observed Copilot-assisted commit evidence.

## Deferred intentionally
- Google ADK / Vertex AI
- AWS Bedrock / AgentCore

## Repository documentation
- [`docs/01-lab-compliance.md`](docs/01-lab-compliance.md) — LAB-01…LAB-05 mapping.
- [`docs/02-architecture-l4-l7.md`](docs/02-architecture-l4-l7.md) — L4/L5/L6/L7 architecture.
- [`docs/03-configuration-timing.md`](docs/03-configuration-timing.md) — setup timing baseline.
- [`docs/04-evaluation-observability-governance.md`](docs/04-evaluation-observability-governance.md) — evaluation/observability/governance.
- [`docs/05-security-and-secrets.md`](docs/05-security-and-secrets.md) — security and secret handling.
- [`docs/06-operations-runbook.md`](docs/06-operations-runbook.md) — execution runbook.
- [`docs/07-role-coverage-ltm-epam.md`](docs/07-role-coverage-ltm-epam.md) — LTM/EPAM capability coverage.
- [`docs/08-roadmap.md`](docs/08-roadmap.md) — future cloud replicas.
- [`docs/09-github-repository.md`](docs/09-github-repository.md) — repository structure and sanitization.

## Full source snapshot
The complete sanitized V3 working source is preserved under `source-archive/` as Base64 chunks with a restore script. This keeps the full working tree in GitHub while the browsable documentation remains lightweight.