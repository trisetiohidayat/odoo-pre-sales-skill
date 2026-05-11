# Advanced Pre-Sales Artifacts

Use this reference for mature, automation-friendly Odoo pre-sales demos.

## Artifact Schema and Versioning

Create `<demo_slug>/demo-manifest.json` with:

- `schema_version`
- `demo_slug`
- company/client name
- Odoo version and edition
- database name
- key paths
- standard modules
- custom modules
- docs/reports/scripts/tests list
- validation status
- last build timestamp

Keep it machine-readable and update it after rebuilds.

## Machine-Readable BRQ

Create `<demo_slug>/docs/BRQ.yaml` or `BRQ.json` alongside `BRQ.md`. Include company profile, scope, pain points, processes, inferred apps, custom gaps, integrations, assumptions, and open questions.

## Decision Log

Create `<demo_slug>/docs/decision-log.md` with date, decision, options considered, reason, impact, and owner. Use it for default-vs-custom, mock-vs-live, skipped features, ports, deployment, and data assumptions.

## Acceptance Criteria

Create `<demo_slug>/docs/acceptance-criteria.md` with pass/fail criteria per flow. Each criterion should state setup, action, expected result, and verification evidence.

## Known Issue Tracker

Create `<demo_slug>/reports/known-issues.md` for warnings, skipped checks, missing optional dependencies, port conflicts, browser limitations, unresolved data, and non-blocking Odoo log warnings.

## Custom Module Lint

Create or document a lint step that checks:

- manifest syntax and required keys
- dependency modules
- Python imports and hook exports
- XML parse and duplicate XML IDs
- access CSV model references
- missing `static/description/icon.png`
- hardcoded paths
- install/upgrade log tracebacks

Write output to `<demo_slug>/reports/module-lint.md`.

## Odoo Shell Smoke Snippets

Create `<demo_slug>/tests/smoke-snippets.py` or include snippets in `validate-demo.py` for checking products, images, POS config, website publish, users, invoices, stock, custom records, and integration mocks.

## Data Anonymization and Privacy

Create `<demo_slug>/reports/privacy-check.md` confirming:

- no personal data scraped from public sources unless approved
- demo contacts are synthetic or user-provided
- public company research is cited
- API keys/secrets are placeholders unless explicitly provided
- screenshots do not expose unrelated local data

## Competitive Positioning

Create `<demo_slug>/docs/competitive-positioning.md` comparing the proposed Odoo approach against spreadsheets, disconnected point solutions, or likely ERP alternatives. Keep claims evidence-based.

## Cost Model

Create `<demo_slug>/docs/cost-model.md` covering license assumptions, implementation effort, integration effort, support, optional phases, and unknowns requiring commercial confirmation.

## Change Management Plan

Create `<demo_slug>/docs/change-management.md` covering stakeholder roles, training, UAT, adoption risks, cutover communication, and post-go-live support.

## Migration and Import Plan

Create `<demo_slug>/docs/migration-plan.md` covering master data, opening balances, products, partners, stock, historical transactions, source systems, cleaning risks, and import validation.

## Deployment Options

Create `<demo_slug>/docs/deployment-options.md` comparing local/source, on-prem, cloud VM, Odoo.sh, and SaaS/Odoo Online where relevant. Include tradeoffs and constraints.

## Post-Demo Follow-Up

Create `<demo_slug>/docs/follow-up.md` with stakeholder feedback questions, missing data requests, decision points, next meeting agenda, and required technical access.
