# Evidence and Integration Mocks

## Screenshot Evidence

After Odoo starts and validation passes, capture screenshots that prove the demo can be presented.

Save screenshots under `<demo_slug>/screenshots/` with stable names:

- `01-login.png`
- `02-apps-or-menu.png`
- `03-website-shop.png` when Website/eCommerce is in scope.
- `04-product-page.png` when products/images are important.
- `05-pos-config-or-session.png` when POS is in scope.
- `06-sales-order-or-invoice.png` when Sales/Accounting is in scope.
- `07-custom-flow.png` for custom modules such as omnichannel return.
- `08-dashboard-or-report.png` when reporting is in scope.

Rules:

- Prefer browser automation screenshots. If browser tooling is blocked, use HTTP checks and write the limitation to `validation-report.md`.
- Do not mark screenshot workflow complete if pages are blank, unauthorized, or show tracebacks.
- Add a screenshot index table to `<demo_slug>/docs/handover.md` or `<demo_slug>/reports/validation-report.md`.
- Re-run screenshots after fixing frontend or data issues.

## Integration Mock Workflow

When integrations are requested but real credentials are absent, create a visible mock instead of leaving the flow as prose only.

Common mock targets:

- QRIS/payment gateway: placeholder merchant ID/API key, demo payment method, mock payment status/log record.
- e-Faktur/Coretax: localization modules installed, demo checklist/XML generation step, placeholder tax identity clearly marked.
- Shipping/courier: delivery carrier, tracking reference, mock delivery status, exception scenario if relevant.
- Marketplace: mock channel/order reference, import status, and reconciliation note.
- WhatsApp/chat/API: mock endpoint/config parameter, request/response log model or checklist row.

Rules:

- Never pretend a mock is a live integration.
- Put mock records in a clearly named model, checklist, or config parameter.
- Add mock assumptions and next steps to `gap-analysis.md`, `proposal-summary.md`, and `handover.md`.
- Include mock records in validation checks and `data-manifest.md`.
