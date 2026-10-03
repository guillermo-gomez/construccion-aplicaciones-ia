# L4–L7 architecture

## Layer definitions

- **L4 — Execution:** inference, routing, tools, RAG, persistence and runtime.
- **L5 — Session:** state, workflow, confirmation, checkpointing and agent handoff.
- **L6 — Interoperability:** APIs, contracts, MCP, A2A, prompts, containers and portability.
- **L7 — Governance:** identity, secrets, observability, evaluation, red teaming and release decisions.

## ArchiMate-style Mermaid

```mermaid
flowchart TB

classDef tech fill:#d9ead3,stroke:#38761d,stroke-width:1.5px,color:#1d3b16;
classDef app fill:#cfe2f3,stroke:#0b5394,stroke-width:1.5px,color:#073763;
classDef data fill:#fff2cc,stroke:#bf9000,stroke-width:1.5px,color:#7f6000;
classDef gov fill:#ead1dc,stroke:#741b47,stroke-width:1.5px,color:#4c1130;
classDef sec fill:#f4cccc,stroke:#990000,stroke-width:1.5px,color:#660000;
classDef artifact fill:#f3f3f3,stroke:#666,stroke-dasharray:4 3,color:#222;

subgraph L7["L7 — GOVERNANCE / RISK / EVIDENCE"]
direction LR
G1["<<Requirement>><br/>AI Governance Gate"]:::gov
G2["<<Assessment>><br/>DeepEval"]:::gov
G3["<<Assessment>><br/>GEval + Jev"]:::gov
G4["<<Assessment>><br/>DeepTeam"]:::sec
G5["<<Service>><br/>Confident AI"]:::gov
G6["<<Service>><br/>Langfuse"]:::gov
G7["<<Technology Service>><br/>Entra / RBAC / Managed Identity"]:::sec
G8["<<Technology Service>><br/>Key Vault"]:::sec
G9["<<Process>><br/>GitHub Actions"]:::gov
end

subgraph L6["L6 — INTEROPERABILITY / CONTRACTS"]
direction LR
I1["<<Interface>><br/>FastAPI / OpenAPI"]:::app
I2["<<Data Object>><br/>Pydantic Contracts"]:::data
I3["<<Interface>><br/>MCP 2.x"]:::app
I4["<<Interface>><br/>A2A JSON-RPC"]:::app
I5["<<Artifact>><br/>Prompts / Instructions"]:::artifact
I6["<<Artifact>><br/>JSON / JSONL Evidence"]:::artifact
I7["<<Artifact>><br/>Docker / Kubernetes"]:::artifact
I8["<<Artifact>><br/>Copilot Instructions"]:::artifact
end

subgraph L5["L5 — SESSION / STATE / WORKFLOW"]
direction LR
S1["<<Process>><br/>Intent / Domain Routing"]:::app
S2["<<Process>><br/>CRM Propose → Confirm"]:::app
S3["<<Process>><br/>Explicit Write Confirmation"]:::sec
S4["<<Process>><br/>Resumable Batch"]:::app
S5["<<Process>><br/>A2A Task / Handoff"]:::app
S6["<<Data Object>><br/>Candidate / Student State"]:::data
end

subgraph L4["L4 — EXECUTION / INFERENCE"]
direction LR
E1["<<Component>><br/>React / Three.js"]:::app
E2["<<Component>><br/>FastAPI Runtime"]:::app
E3["<<Component>><br/>Agent Framework"]:::app
E4["<<Technology Service>><br/>Microsoft Foundry"]:::tech
E5["<<Technology Service>><br/>gpt-5-mini"]:::tech
E6["<<Service>><br/>Academic/Admin/Finance"]:::app
E7["<<Service>><br/>Admissions CRM"]:::app
E8["<<Technology Service>><br/>Azure AI Search"]:::tech
E9["<<Technology Service>><br/>Azure Blob"]:::tech
E10["<<Technology Service>><br/>Container Apps"]:::tech
end

E1 --> E2 --> E3 --> E4 --> E5
E3 --> E6
E3 --> E7
E3 --> E8
E7 --> E9
E10 --> E2
S1 --> E3
S2 --> S3 --> E7
S4 --> E3
S5 --> E3
S6 --> S2
I1 --> E2
I2 --> I1
I3 --> E3
I4 --> S5
I5 --> E3
I6 --> G1
I7 --> E10
I8 --> G9
G2 -. evaluates .-> E3
G3 -. judges .-> E3
G4 -. attacks .-> E2
G5 -. evidence .-> G2
G6 -. traces .-> E3
G7 -. authorizes .-> E4
G7 -. authorizes .-> E9
G8 -. secrets .-> E10
G9 -. deploys .-> E10
G1 -. release .-> G9
```

## Azure-style Mermaid

```mermaid
flowchart LR
classDef azure fill:#e8f3ff,stroke:#0078d4,stroke-width:2px,color:#003b5c;
classDef ai fill:#efe7ff,stroke:#6b4eff,stroke-width:2px,color:#32145f;
classDef sec fill:#fff0f0,stroke:#d13438,stroke-width:2px,color:#6b0f12;
classDef data fill:#e9f7ef,stroke:#107c10,stroke-width:2px,color:#054b05;
classDef obs fill:#fff5cc,stroke:#ca8a04,stroke-width:2px,color:#713f12;
classDef dev fill:#f3f3f3,stroke:#5c5c5c,stroke-width:1.5px,color:#222;

U["👤 Student / Candidate"]:::azure
UI["🖥️ React + Three.js<br/>Trust Dashboard"]:::azure
API["🌐 FastAPI / OpenAPI"]:::azure
subgraph EXEC["L4 — Azure Execution"]
AF["🤖 Agent Framework"]:::ai
F["☁️ Microsoft Foundry"]:::azure
M["🧠 gpt-5-mini"]:::ai
TOOLS["🧩 Academic · Admin · Finance · CRM"]:::ai
SEARCH["🔎 Azure AI Search<br/>RAG"]:::azure
BLOB["🗄️ Azure Blob Storage"]:::data
ACA["☁️ Azure Container Apps"]:::azure
ACR["📦 Azure Container Registry"]:::azure
end
subgraph SESSION["L5 — Session / Workflow"]
ROUTE["🔀 Intent Router"]:::ai
CONFIRM["✅ Propose → Confirm → Write"]:::sec
BATCH["♻️ Resumable Batch"]:::dev
HANDOFF["🤝 A2A Task / Handoff"]:::ai
end
subgraph INTEROP["L6 — Interoperability"]
MCP["🔌 MCP 2.x"]:::azure
A2A["🔗 A2A JSON-RPC"]:::azure
CONTRACT["📐 Pydantic / JSON"]:::dev
DOCKER["🐳 Docker / Kubernetes"]:::dev
COPILOT["💻 GitHub Copilot"]:::dev
end
subgraph TRUST["L7 — Trust / Governance"]
ENTRA["🔐 Entra ID"]:::sec
MI["🪪 Managed Identity"]:::sec
KV["🔑 Key Vault"]:::sec
DE["🧪 DeepEval"]:::obs
GE["⚖️ GEval"]:::obs
JEV["⚖️ Jev"]:::obs
DT["🛡️ DeepTeam"]:::sec
LF["📡 Langfuse"]:::obs
CAI["📊 Confident AI"]:::obs
GG["🚦 Governance Gate"]:::sec
CICD["⚙️ GitHub Actions"]:::dev
end

U --> UI --> API --> ROUTE --> AF
AF --> F --> M
AF --> TOOLS
AF --> SEARCH
TOOLS --> CONFIRM --> BLOB
BATCH --> AF
HANDOFF --> AF
MCP --> AF
A2A --> HANDOFF
CONTRACT --> API
DOCKER --> ACA
ACR --> ACA
COPILOT --> CICD
ENTRA --> MI --> F
MI --> BLOB
KV --> ACA
DE -. evaluate .-> AF
GE -. judge .-> AF
JEV -. judge .-> AF
DT -. red team .-> API
LF -. traces .-> AF
CAI -. hosted eval .-> DE
DE --> GG
GE --> GG
JEV --> GG
DT --> GG
LF --> GG
CAI --> GG
GG --> CICD --> ACR
```
