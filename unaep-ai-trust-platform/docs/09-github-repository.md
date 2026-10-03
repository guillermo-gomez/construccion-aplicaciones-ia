# GitHub repository structure

This project is stored as a self-contained reference implementation under:

```text
unaep-ai-trust-platform/
```

inside the source learning repository so that the original LAB-01…LAB-05 material remains preserved.

## Why a subfolder

The implementation is an Azure/UNAEP adaptation of the five-lab progression rather than a replacement of the original lab code. Keeping it in a dedicated subfolder preserves:
- original training material;
- traceability from lab objectives to the UNAEP implementation;
- a clean path for future Google ADK/Vertex AI and AWS Bedrock/AgentCore replicas.

## Public repository sanitization

This export intentionally removes or parameterizes:
- Azure subscription IDs;
- tenant IDs;
- tenant-specific Foundry project endpoints;
- API keys and secrets;
- local `.env` files;
- runtime evidence that may contain sensitive payloads;
- bytecode/cache files.

All environment-specific values must be injected at runtime.

## Branch workflow

- implementation branch: `feature/unaep-ai-trust-platform`
- review through pull request;
- merge only after repository review and CI.

## Documentation index

See the project `README.md` and the numbered files in `docs/`.

## Full-source preservation

The complete sanitized V3 working tree is preserved in `source-archive/` as Base64 chunks plus a restore script. This allows the exact package to be reconstructed without committing secrets or tenant-specific configuration.
