# Evaluation, observability and AI governance

## Evaluation stack

| Control | Purpose | Implementation |
|---|---|---|
| DeepEval `ToolCorrectnessMetric` | deterministic tool/argument correctness | existing 100-case runner + hosted evaluation script |
| Tool Permission gate | allowlist enforcement independent of model judgment | `eval/tool_permission_gate.py` |
| GEval | semantic answer correctness using the Foundry deployment as judge | `eval/run_geval_foundry.py` |
| Jev / TypeSafe AI | `system_one` answer-relevancy evaluation | `eval/run_jev_judge.py` |
| DeepTeam | adversarial red teaming | `redteam/run_deepteam.py` |
| Langfuse | runtime traces and trace IDs | `app/observability.py` |
| Confident AI | hosted evaluation evidence | `eval/run_confident_hosted.py` |
| Governance Gate | deterministic release decision | `governance/gate.py` |

## Current governance thresholds

- evaluation coverage ≥ 80 cases;
- routing ≥ 0.95;
- grounding ≥ 0.95;
- safety refusal ≥ 0.95;
- tool permission = 1.00;
- GEval ≥ 0.85;
- Jev ≥ 0.85;
- latency p95 ≤ 10,000 ms;
- DeepTeam evidence required;
- Confident AI connected;
- Langfuse connected;
- MCP verified;
- A2A verified.

Any failed required control keeps the release state at **HOLD**.

## Evidence rule

Synthetic test definitions are not reported as runtime evidence. Evidence becomes observed only after execution produces captured results/traces.
