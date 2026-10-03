# Configuration timing baseline

## Interpretation

Three time types are intentionally separated:

- **Measured** — captured directly from execution output.
- **Calculated** — derived from observed durations/rate limits.
- **Planning baseline** — estimate for interview/project planning; not presented as measured evidence.

| Component | Status | Time type | Parameter |
|---|---|---|---:|
| Azure CLI login + subscription/project verification | Complete | Retrospective baseline | 10–20 min |
| Foundry resource/project verification | Complete | Retrospective baseline | 5–10 min |
| `gpt-5-mini` deployment | Complete | Retrospective baseline | 10–15 min |
| RBAC / 403 diagnosis + Foundry User assignment | Complete | Retrospective baseline | 15–30 min |
| Python 3.12 venv + Agent Framework | Complete | Retrospective baseline | 10–20 min |
| Academic tool | Complete | Retrospective baseline | 10–15 min |
| Administrative tool + routing correction | Complete | Retrospective baseline | 15–25 min |
| Finance tool | Complete | Retrospective baseline | 10–15 min |
| DeepEval deterministic setup | Complete | Retrospective baseline | 10–20 min |
| 5-case Foundry smoke evaluation | Complete | Calculated from observed latencies | ≈54.4 s minimum |
| Local V3 dependency installation | Complete | Retrospective baseline | 4–10 min |
| Local pytest gate | Complete | **Measured** | **0.68 s** |
| Confident AI connection | Pending | Planning baseline | 8–15 min |
| Langfuse first trace | Pending | Planning baseline | 10–20 min |
| Jev first judge | Pending | Planning baseline | 8–15 min |
| 100-case Foundry evaluation | Pending | Calculated/planning | 11–18 min |
| GEval | Pending | Planning baseline | 10–25 min |
| DeepTeam | Pending | Planning baseline | 20–45 min |
| MCP | Pending | Planning baseline | 10–20 min |
| A2A | Pending | Planning baseline | 15–25 min |
| Azure AI Search / RAG | Pending | Planning baseline | 20–35 min |
| Docker build + health | Pending | Planning baseline | 10–20 min |
| ACR + Container Apps | Pending | Planning baseline | 20–40 min |
| Blob + Managed Identity/RBAC | Pending | Planning baseline | 15–30 min |
| React/Three.js dashboard | Pending | Planning baseline | 15–30 min |
| Governance Gate | Pending | Planning baseline | 15–25 min |

## Interview parameter

For this reference-implementation pattern:

- **clean workstation/tenant:** about **6–9 hours elapsed**, typically **4–6 hours hands-on**, assuming permissions, quota and credentials are ready;
- **from the current UNAEP checkpoint:** roughly **3–5 hours elapsed** remain for external services, full evaluation/red teaming, deployment and release evidence.

Production delivery is intentionally not equated to the POC timing. Private networking, enterprise IAM, real CRM integration, security review and change management turn the effort into a multi-day/multi-sprint program.

## Measurement format for future work

```text
timestamp,component,phase,start,end,elapsed_seconds,status,evidence
```
