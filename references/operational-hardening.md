# Operational Hardening

Use this reference when packaging the final pre-sales demo.

## Template Generator

Create or reuse a scaffold helper that generates the full `<demo_slug>/` folder tree and placeholder files before writing content. It should create docs, config, scripts, tests, reports, screenshots, backups, logs, data, assets, and custom-addons directories.

## Reusable Odoo Seed Helper

Create reusable seed helpers inside the generated custom addon or `<demo_slug>/scripts/` for:

- search-or-create records
- users and groups
- partners/customers/vendors
- products, attributes, categories, images
- journals, payment methods, warehouses, routes
- SO/PO/invoice/payment/POS/return sample records
- config parameters and integration mock records

Prefer ORM helpers over copy-pasted hook code. Helpers must be idempotent.

## Demo Quality Scoring

Write `<demo_slug>/reports/readiness-score.md` with a 0-100 score and pass/fail table for:

- discovery completeness
- solution mapping completeness
- master data completeness
- transaction completeness
- visual readiness
- integration mock/live readiness
- validation pass rate
- screenshot coverage
- handover completeness

Do not claim the demo is complete if critical categories fail.

## Rollback Strategy

Before risky module upgrades or rebuilds:

- create a timestamped backup in `<demo_slug>/backups/`
- run upgrade/init
- inspect logs
- if failure is blocking, restore the latest known-good backup or document why restore was skipped

Write rollback steps and latest backup path in `handover.md`.

## Security and Access Checklist

Write `<demo_slug>/reports/security-access-check.md` covering:

- demo users are not all administrators
- portal users cannot access backend menus
- credentials are demo-only and documented
- API keys/tokens are placeholders unless explicitly provided
- no real personal data is seeded without user approval
- custom record rules do not lock out admin

## Localization Checklist

Write `<demo_slug>/reports/localization-check.md` covering country-specific setup:

- company country/address/currency
- chart of accounts/localization modules
- taxes/fiscal positions
- invoice numbering assumptions
- tax identity placeholders such as NPWP/PKP when Indonesia is in scope
- e-invoicing/e-Faktur/Coretax assumptions
- payment localization such as QRIS placeholders

## Performance Sanity Check

Write `<demo_slug>/reports/performance-check.md` with basic timings and HTTP status for:

- `/web/login`
- `/shop` when Website/eCommerce is in scope
- one product page when website products exist
- one backend/custom menu URL when accessible

Flag tracebacks, blank pages, or very slow responses.

## Pitch Deck or Export

Create a lightweight sales export from `proposal-summary.md`, `gap-analysis.md`, `implementation-estimate.md`, and screenshot evidence. Prefer Markdown (`<demo_slug>/docs/pitch-outline.md`) unless the user asks for PPTX.

## Client Risk Register

Write `<demo_slug>/docs/risk-register.md` with risks, impact, likelihood, mitigation, owner, and next decision. Include data, integration, compliance, customization, deployment, adoption/change management, and timeline risks.
