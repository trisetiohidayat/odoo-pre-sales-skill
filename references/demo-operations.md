# Demo Operations

Use this reference to make demos easier to run repeatedly across prospects.

## Traceability Matrix

Create `<demo_slug>/docs/traceability-matrix.md` mapping:

- BRQ requirement
- inferred Odoo app/config
- custom module or mock
- seeded demo data
- screenshot evidence
- validation check
- status and gap notes

Each must-have BRQ item should trace to at least one demo artifact or an explicit gap.

## Demo Variants

Create `<demo_slug>/docs/demo-variants.md` with presenter flows for:

- `quick-demo`: short value walkthrough.
- `executive-demo`: business outcomes, screenshots, dashboards, risk/ROI.
- `functional-demo`: end-to-end process steps by user role.
- `technical-demo`: architecture, custom modules, scripts, validation, deployment.

Each variant should list duration, audience, required screenshots, and demo script sections.

## Rehearsal Checklist

Create `<demo_slug>/reports/rehearsal-check.md` for the 30-minute pre-meeting check:

- Odoo server running on expected port.
- Correct database loaded.
- Login credentials work.
- No fresh tracebacks in logs.
- Screenshots exist.
- Backup exists.
- Browser opens login/shop/key backend page.
- Demo script and fallback screenshots are available.

## Error Recovery Playbook

Create `<demo_slug>/docs/error-recovery.md` covering:

- Odoo fails to start.
- Port conflict.
- DB locked or missing.
- Module install/upgrade traceback.
- Login failure.
- Website/POS blank page.
- Browser automation blocked.
- Restore latest backup and rerun validation.

Each section should include symptom, likely cause, commands to inspect, and recovery steps.

## Cross-Demo Index

Maintain root-level `presales-index.json` when multiple demo folders exist. Include:

- demo slug
- company/client
- database
- URL/port
- Odoo version
- status
- last build timestamp
- handover path
- validation status
- notes

Update it after each successful build or material status change.
