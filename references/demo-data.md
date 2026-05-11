# Demo Data

## Demo Users and Roles

Seed demo users for every major workflow in scope. Use safe demo credentials and write them to `<demo_slug>/docs/data-manifest.md` and `<demo_slug>/docs/handover.md`.

Minimum role set when the related app is installed:

| Role | Example Login | Use In Demo | Typical Groups |
| --- | --- | --- | --- |
| Admin/Presenter | `admin` | Full setup and recovery | Settings/Admin |
| Sales | `sales.demo@example.com` | CRM, quotations, sales orders | Sales user/manager |
| Cashier | `cashier.demo@example.com` | POS session and payment | POS user |
| Warehouse | `warehouse.demo@example.com` | Receipts, delivery, inventory | Inventory user |
| Accounting | `accounting.demo@example.com` | Invoice, payment, tax/e-Faktur | Accounting user |
| Manager | `manager.demo@example.com` | Reporting, approvals, dashboards | Relevant manager groups |
| Customer Portal | `customer.demo@example.com` | Portal/order view if useful | Portal |

Rules:

- Use passwords suitable for local demo only, such as `admin` or documented placeholders.
- Do not use real employee personal data unless provided by the user for demo.
- Assign only groups needed for the workflow; avoid giving every user admin access.
- Add the role matrix to `data-manifest.md`.
- Verify each seeded user exists and can be used for the intended flow when practical.

## End-to-End Demo Transactions

Seed complete transactions, not only master data. Build the smallest coherent story that proves the pre-sales scope.

Recommended sequence:

1. Vendor and purchase order for at least one demo product.
2. Stock receipt into warehouse/store so products are available.
3. Website/eCommerce sale order using a demo customer.
4. Delivery order processed or staged according to the demo story.
5. Customer invoice generated from the sale.
6. Payment registered or simulated.
7. POS order for an in-store purchase, with configured payment method.
8. Cross-channel return/exchange/refund when omnichannel is in scope.
9. Dashboard/KPI/report rows reflecting the sample transactions.

Rules:

- Create transactions with stable references, for example `<DEMO>-PO-0001`, `<DEMO>-WEB-0001`, `<DEMO>-POS-0001`.
- Keep transaction counts small but complete enough for a live walkthrough.
- Prefer Odoo ORM in hooks or scripts over raw SQL for transactional records.
- Confirm stock, invoices, payments, and custom records are linked to the intended products/partners.
- Document every seeded transaction in `<demo_slug>/docs/data-manifest.md`.
- Reflect the exact transaction sequence in `<demo_slug>/docs/demo-script.md`.
