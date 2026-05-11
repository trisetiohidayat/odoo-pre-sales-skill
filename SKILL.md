---
name: odoo-pre-sales
description: "Use when running an Odoo pre-sales discovery and demo build: continuously interview the user about company, business process, BRQ, and target Odoo version; crawl/browse public company information when a company name or website is provided; disambiguate matching companies; research products, operations, sales channels, integrations, and likely business requirements needed for the Odoo project to succeed; infer needed Odoo apps/modules from evidence instead of asking the user to choose modules; write confirmed understanding to Markdown; then provision one self-contained demo output folder containing docs, config, scripts, logs, data, reports, tests, screenshots, backups, manifests, generated/collected image assets, and custom addons while reusing external Odoo source if already present; configure venv/PostgreSQL/odoo.conf, create needed custom modules with icons and visual demo data such as product images, seed demo users and end-to-end transactions, initialize the database, run module upgrades, capture screenshot evidence, generate proposal/gap/estimate/demo/risk/deployment/migration/follow-up docs, and verify Odoo starts cleanly."
---

# Odoo Pre-Sales

This skill turns a pre-sales conversation into a working Odoo demo environment.
Do not start coding before discovery is complete enough to identify the business
flows, default Odoo apps to use, and custom gaps.

## Operating Rules

- Ask business questions first. Environment setup comes after the BRQ has a clear scope.
- When the user gives a company name, search the internet for that company before finalizing company profile assumptions. If multiple plausible companies are found, list them with short descriptions and ask which one is intended.
- When a company is identified, crawl/browse public information needed to make the Odoo project successful: official website pages, product/service pages, store/catalog pages, contact/branch pages, social/company profiles, marketplace listings, job posts, docs, support pages, news, and other reputable public sources.
- Do not ask the user to manually name Odoo modules/apps. Infer standard Odoo apps from the described business process, then explain the inference for confirmation.
- Prefer default Odoo apps/modules before custom code. Custom modules exist only for gaps that default Odoo cannot cover cleanly.
- Use the user-selected Odoo version. If missing, ask for the target version and deployment target.
- Never assume database, ports, admin password, or addons path. Detect existing config when possible and confirm conflicts.
- Keep the environment reproducible: write commands, versions, addons paths, database name, and credentials placeholder into the handover doc.
- During discovery, every response must include "What I understand so far" and "What I still need to know" so the user can correct the AI before implementation.
- Put every generated pre-sales artifact under one demo output folder. Do not scatter docs, config, custom addons, scripts, logs, and data across the project root.
- Maintain Markdown artifacts as discovery progresses inside `<demo_slug>/docs/`: `BRQ.md`, `solution-mapping.md`, and later `handover.md`.
- After every module creation or XML/data change, upgrade the module and inspect logs before continuing.
- A task is not complete until Odoo starts, the target database initializes, required apps install, custom modules install, demo data loads, and the browser smoke test passes.

## Output Folder Contract

Create one self-contained output folder per pre-sales theme/client before writing any generated artifact:

```text
<demo_slug>/
├── demo-manifest.json
├── docs/
│   ├── BRQ.md
│   ├── BRQ.yaml
│   ├── solution-mapping.md
│   ├── demo-script.md
│   ├── data-manifest.md
│   ├── traceability-matrix.md
│   ├── demo-variants.md
│   ├── decision-log.md
│   ├── acceptance-criteria.md
│   ├── gap-analysis.md
│   ├── proposal-summary.md
│   ├── implementation-estimate.md
│   ├── pitch-outline.md
│   ├── risk-register.md
│   ├── competitive-positioning.md
│   ├── cost-model.md
│   ├── change-management.md
│   ├── migration-plan.md
│   ├── deployment-options.md
│   ├── follow-up.md
│   ├── error-recovery.md
│   └── handover.md
├── config/
│   └── odoo.conf
├── custom-addons/
├── assets/
│   ├── products/
│   ├── modules/
│   ├── company/
│   └── website/
├── scripts/
│   ├── init-db.sh
│   ├── start.sh
│   ├── upgrade-module.sh
│   ├── backup-db.sh
│   ├── restore-db.sh
│   ├── reset-db.sh
│   ├── rebuild-demo.sh
│   └── scaffold-demo.sh
├── tests/
│   ├── validate-demo.py
│   └── smoke-snippets.py
├── reports/
│   ├── validation-report.md
│   ├── module-lint.md
│   ├── known-issues.md
│   ├── privacy-check.md
│   ├── rehearsal-check.md
│   ├── readiness-score.md
│   ├── security-access-check.md
│   ├── localization-check.md
│   └── performance-check.md
├── screenshots/
├── backups/
├── logs/
└── data/
```

Rules:

- Derive `<demo_slug>` from company/theme and database name, for example `zara_id_demo`.
- Write all generated docs to `<demo_slug>/docs/`, not project-root `docs/`.
- Write Odoo config to `<demo_slug>/config/odoo.conf`.
- Write custom modules to `<demo_slug>/custom-addons/`.
- Write generated or collected image assets to `<demo_slug>/assets/`.
- Write helper scripts to `<demo_slug>/scripts/`.
- Write validation scripts to `<demo_slug>/tests/`.
- Write generated reports to `<demo_slug>/reports/`.
- Write screenshot evidence to `<demo_slug>/screenshots/`.
- Write database dumps/backups to `<demo_slug>/backups/`.
- Write Odoo logs and filestore/session data to `<demo_slug>/logs/` and `<demo_slug>/data/`.
- Reuse existing Odoo source, venv, and Enterprise source outside the folder when already present. Do not copy or vendor Odoo source into the demo folder unless the user explicitly asks for a fully bundled source checkout.
- Record external Odoo source, venv, and Enterprise addon paths in `<demo_slug>/docs/handover.md`.
- If legacy docs already exist in project-root `docs/`, copy or move the theme-specific docs into `<demo_slug>/docs/` and make the handover point to the folder-local copies.

## Demo Packaging Artifacts

Every finished demo must include these documents:

- `<demo_slug>/docs/demo-script.md`: step-by-step presenter script from login through critical flows.
- `<demo_slug>/docs/data-manifest.md`: all seeded users, products, partners, journals, warehouses, routes, configs, images, transactions, and custom records.
- `<demo_slug>/docs/traceability-matrix.md` and `<demo_slug>/docs/demo-variants.md`: trace BRQ to proof artifacts and support quick, executive, functional, and technical demo modes.
- `<demo_slug>/demo-manifest.json` and `<demo_slug>/docs/BRQ.yaml`: machine-readable metadata and requirements for automation.
- `<demo_slug>/docs/decision-log.md` and `<demo_slug>/docs/acceptance-criteria.md`: explain decisions and pass/fail criteria per demo flow.
- `<demo_slug>/docs/gap-analysis.md`: default Odoo coverage vs configured vs custom gaps, with reason and confidence.
- `<demo_slug>/docs/proposal-summary.md`: short pre-sales narrative, scope, business value, and covered flows.
- `<demo_slug>/docs/implementation-estimate.md`: implementation phases, assumptions, dependencies, rough timeline, and risk notes.
- `<demo_slug>/docs/pitch-outline.md`: sales-ready story assembled from proposal, gaps, estimate, and screenshots.
- `<demo_slug>/docs/risk-register.md`: client-specific risks, impact, likelihood, mitigation, owner, and next decision.
- `<demo_slug>/docs/competitive-positioning.md`, `cost-model.md`, `change-management.md`, `migration-plan.md`, `deployment-options.md`, and `follow-up.md`: commercial and delivery follow-through artifacts.
- `<demo_slug>/docs/error-recovery.md` and `<demo_slug>/reports/rehearsal-check.md`: operational playbooks for demo-day readiness and recovery.
- `<demo_slug>/docs/handover.md`: technical access, commands, paths, credentials placeholders, ports, known limitations, and troubleshooting.

Keep documents concise but demo-ready. Sales and functional users should be able to run the presentation from `demo-script.md` without reading code.

## Visual Asset Rules

Use images wherever they materially improve the demo: products, categories, company logo, website pages, and module icons. Read `references/visual-assets.md` before creating or loading image assets.

## Demo Users and Roles

Seed demo users for every major workflow in scope. Read `references/demo-data.md` for role matrix, credential rules, and validation expectations.

## End-to-End Demo Transactions

Seed complete transactions, not only master data. Read `references/demo-data.md` for the recommended PO, receipt, website sale, delivery, invoice, payment, POS, return, and KPI sequence.

## Lifecycle Scripts

Create deterministic scripts so the demo can be repeated without reconstructing commands from memory: init, start, upgrade, backup, restore, reset, rebuild, and scaffold. Scripts must be path-stable, fail fast, protect destructive actions with explicit confirmation, avoid unrelated processes, and be documented in `handover.md`.

## Functional Validation

Create `<demo_slug>/tests/validate-demo.py` or an equivalent Odoo-shell validation script and run it before completion.

The validation must check:

- Required standard modules are installed.
- Required custom modules are installed.
- Demo users exist and have expected groups.
- Products exist, are saleable, and have non-empty images when images are expected.
- Website products/categories are published when eCommerce is in scope.
- POS config exists and has payment methods.
- Warehouses/locations/journals/taxes/payment methods exist as required.
- Sample PO/SO/delivery/invoice/payment/POS/return records exist when in scope.
- Custom workflow records, dashboards, mock integration logs, or checklist rows exist.
- Config parameters and placeholders for integrations are present but clearly marked as demo.

Write validation results to `<demo_slug>/reports/validation-report.md`. The final answer should summarize pass/fail counts and any skipped checks.

## Screenshot Evidence

After Odoo starts and validation passes, capture screenshots under `<demo_slug>/screenshots/` to prove the demo can be presented. Read `references/evidence-and-integrations.md` for the required screenshot list and fallback rules.

## Integration Mock Workflow

When integrations are requested but real credentials are absent, create visible mocks and document that they are not live integrations. Read `references/evidence-and-integrations.md` for QRIS, e-Faktur/Coretax, shipping, marketplace, WhatsApp/chat, and API mock guidance.

## Industry Data Packs

Use company research and user answers to choose a primary industry pack and optional secondary pack. Read `references/industry-data-packs.md` when deciding seed data for retail, manufacturing, services, distribution, food and beverage, or education. Document the chosen pack in `solution-mapping.md` and `data-manifest.md`.

## Operational Hardening

Before final handover, apply `references/operational-hardening.md` for scaffold/template generation, reusable seed helpers, demo quality scoring, rollback strategy, security/access checks, localization checks, performance sanity checks, pitch export, and client risk register. Skip only with an explicit reason in `handover.md`.

## Advanced Artifacts

Before final handover, apply `references/advanced-artifacts.md` for `demo-manifest.json`, machine-readable BRQ, decision log, acceptance criteria, known issue tracker, custom module lint, Odoo shell smoke snippets, privacy check, competitive positioning, cost model, change management, migration plan, deployment options, and post-demo follow-up.

## Demo Operations

Before final handover, apply `references/demo-operations.md` for traceability matrix, demo variants, rehearsal checklist, error recovery playbook, and root-level `presales-index.json`.

## Discovery Phase

Run this as an iterative interview, not a one-shot questionnaire. Capture answers
in `<demo_slug>/docs/BRQ.md` as soon as useful facts are learned. Keep asking follow-up
questions until the business flow is coherent enough to infer Odoo coverage.

After each user answer:

1. Summarize what is understood so far in plain business language.
2. State which default Odoo apps/modules are currently inferred and why.
3. State likely custom gaps, if any, as hypotheses rather than final decisions.
4. Update `<demo_slug>/docs/BRQ.md` and `<demo_slug>/docs/solution-mapping.md` with the current understanding.
5. Ask the next most important 1-5 questions.
6. Offer an explicit choice:
   - "Lanjut gali kebutuhan"
   - "Cukup, lanjut solution mapping"
   - "Cukup, lanjut setup environment"

Only proceed to environment setup after the user confirms the discovery is
enough or explicitly asks to continue with assumptions.

### Company Lookup and Disambiguation

When the user provides a company name:

1. Search the internet for the company name, using location/industry hints from the user when available.
2. Prefer official company websites, LinkedIn/company profiles, business registries, app store listings, marketplace pages, or reputable directory/news sources.
3. If one clear match is found, summarize the company profile and ask the user to confirm it is the right company.
4. If multiple plausible matches are found, present a numbered list:

```markdown
| Option | Company | Source/URL | Short Description | Location/Industry Clue | Confidence |
| --- | --- | --- | --- | --- | --- |
```

5. Ask the user which option is intended before writing confirmed company facts into `<demo_slug>/docs/BRQ.md`.
6. If no reliable match is found, state that clearly, keep the company profile as user-provided, and continue discovery with explicit assumptions.
7. Do not treat internet data as final when it conflicts with the user's explanation. Use it to enrich and challenge assumptions, then ask for confirmation.

Write confirmed lookup results into `<demo_slug>/docs/BRQ.md` under Company Profile. Write unconfirmed candidates under Open Questions.

### Company Research and Crawling

After the intended company is identified, perform public research before finalizing
the BRQ and solution mapping. The goal is to discover context the user may not
mention, so the Odoo demo and custom modules target the real business.

Research targets:

- Official website: homepage, about, products/services, pricing/catalog, branches/contact, careers, support/FAQ, terms, ecommerce/shop pages.
- Public company profiles: LinkedIn, Google Business/Profile snippets, marketplace/store pages, app store pages, business directories, industry portals.
- Sales channels: website, marketplace, distributors, stores/branches, WhatsApp/contact forms, POS/retail, B2B quotation flow, ecommerce checkout.
- Operational clues: warehouses, delivery/shipping, manufacturing/service delivery, procurement, subscriptions, rental, projects, maintenance, field service.
- Customer journey: lead capture, inquiry forms, booking, quotation, order, delivery, invoice, after-sales support, warranty/returns.
- Integration hints: payment gateways, shipping carriers, marketplaces, chat/CRM widgets, accounting/tax needs, POS hardware, external portals.
- Reporting needs implied by the business: sales pipeline, inventory aging, margin, branch performance, delivery SLA, customer support SLA, production status.
- Localization/compliance clues: country, currency, tax, e-invoicing, payroll/regulatory context.

Research output:

```markdown
## Public Research Summary

| Topic | Finding | Source/URL | Relevance to Odoo | Confidence |
| --- | --- | --- | --- | --- |
```

Use findings to update:

- `<demo_slug>/docs/BRQ.md` under Company Profile, Business Model, Current Process, Integrations, Reporting Needs, and Open Questions.
- `<demo_slug>/docs/solution-mapping.md` with inferred Odoo apps/features and custom gaps.

Rules:

- Cite source URLs in the Markdown artifacts.
- Separate confirmed facts, public-research findings, and assumptions.
- Do not over-crawl private, authenticated, paywalled, or disallowed content.
- Do not scrape personal data beyond ordinary business contact/profile information relevant to the pre-sales scope.
- If public data conflicts with the user's explanation, ask for clarification and prefer the user's confirmed answer for implementation.
- If research suggests an Odoo app or custom module, explain the evidence and confidence before treating it as part of scope.

Required questions:

1. Company profile: company name, industry, country, legal entities, branches, currencies, languages, tax/localization needs.
2. Business model: what the company sells, how revenue is earned, customer types, sales channels, recurring vs one-time transactions.
3. Current process: how leads, quotations, orders, purchasing, stock, delivery, invoicing, payment, and reporting work today.
4. Pain points: bottlenecks, duplicate entry, approval delays, reporting gaps, compliance issues, manual spreadsheets.
5. Target outcome: what the demo must prove, who will attend, success criteria, and must-have flows.
6. Users and roles: departments, user roles, approval hierarchy, access restrictions.
7. Data scope: required master data, products, customers, vendors, chart of accounts, warehouses, sample transactions.
8. Odoo version and edition: target version, Community or Enterprise, source install or package/docker, OS target, PostgreSQL availability.
9. Integrations: marketplace, payment gateway, shipping, accounting/tax system, HR/payroll, POS, website, external API.
10. Custom gaps: fields, workflows, reports, dashboards, approvals, sequence formats, validations, computed values.

If the user cannot answer everything, proceed with explicit assumptions and mark them as assumptions in the BRQ.

### Module Inference Guidance

Never ask "which Odoo modules do you want?" Instead, infer from business language:

- Leads, pipeline, follow-up, sales team: infer CRM.
- Quotation, price list, sales order, invoice policy: infer Sales.
- Purchase request/order, vendors, replenishment: infer Purchase.
- Warehouses, delivery, receipts, routes, lots/serials: infer Inventory.
- Invoices, journals, taxes, payments, receivables/payables: infer Accounting/Invoicing.
- Manufacturing order, BOM, work center, production planning: infer Manufacturing.
- POS cashier, retail store, session closing: infer Point of Sale.
- Website catalog, online order, portal: infer Website/eCommerce.
- Tickets, SLA, customer complaints: infer Helpdesk.
- Timesheets, tasks, projects, milestones: infer Project/Timesheets.
- Employees, attendance, leave, payroll need: infer Employees/Time Off/Attendance and identify payroll localization risk.

When explaining inferred apps, use this format:

```markdown
## Current Odoo App Inference

| Business Signal | Inferred Odoo App | Reason | Confidence | Needs Confirmation |
| --- | --- | --- | --- | --- |
```

Confidence can be High, Medium, or Low. Low-confidence items must become follow-up questions.

## Solution Mapping

Create a mapping table:

| Business Need | Business Signal | Inferred Odoo App/Feature | Configuration | Custom Module Needed | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- |

Decision rule:

- Use configuration if the requirement is covered by Odoo settings, studio-like fields, sequences, access groups, automated actions, or standard apps.
- Create a custom module when the requirement needs model extensions, custom business logic, custom reports, importable demo data, custom menus/actions/views, security rules, scheduled jobs, or integration code.
- Split modules by business boundary, not by technical layer. Example: `presales_crm_extension`, `presales_sales_approval`, `presales_inventory_flow`.
- Revisit the mapping after each discovery round. Mark unconfirmed assumptions clearly.

## Environment Workflow

1. Inspect the machine:
   - OS, Python version, PostgreSQL status, free ports, existing Odoo folders.
   - Verify `git`, `python3`, `pip`, `psql`, and build dependencies.
   - Detect whether the requested Odoo path is a single repo or a parent folder containing multiple versions.
   - Verify the exact Odoo version with `<venv>/bin/python <odoo-bin> --version`.
   - Check requested HTTP and gevent ports with `lsof` before writing final commands. Do not kill existing processes without explicit user approval.
2. Resolve Odoo source:
   - Use the requested Odoo version branch/tag.
   - Reuse existing Odoo source and venv if present and version-compatible.
   - Keep generated config, custom addons, logs, docs, scripts, and data under the single `<demo_slug>/` output folder.
   - Keep external Odoo source paths out of `<demo_slug>/` unless a fresh clone is required and explicitly approved.
3. Create virtualenv:
   - Use a Python version compatible with the selected Odoo version.
   - Install Odoo requirements in the venv.
   - Run an import/start preflight and install missing runtime packages reported by Odoo before database init.
4. Configure PostgreSQL:
   - Create or confirm Odoo DB user.
   - Create a fresh demo database name unless the user explicitly wants reuse.
5. Write `odoo.conf`:
   - Include `addons_path` with Odoo core addons and custom addons.
   - Set `db_user`, `db_password` if needed, `http_port`, `gevent_port`, `admin_passwd`, `logfile`, and `data_dir`.
   - Use version-correct config keys. For Odoo 19 use `gevent_port`, not `longpolling_port`.
   - Keep demo suppression in init commands as `--without-demo=all`; do not put `without_demo = all` in runtime config for Odoo 19.
6. Generate custom modules only after the solution mapping is approved.
7. Initialize database:
   - Run Odoo with `-d <db> -i <modules> --stop-after-init`.
   - Include standard apps and custom modules required for the demo.
   - If upstream demo data breaks initialization, rerun with `--without-demo=all` and seed only controlled demo data.
8. Load data:
   - Master data first: company, users, partners, products, taxes, warehouses, journals.
   - Demo users and role matrix.
   - Image assets with related master data: company logo, product images, category images, and custom module icons.
   - Configuration data second: sequences, teams, stages, routes, approval rules.
   - Demo transactions last: leads, quotations, SO/PO, stock moves, invoices, payments.
9. Generate packaging artifacts:
   - `demo-manifest.json`, `BRQ.yaml`, `demo-script.md`, `data-manifest.md`, `traceability-matrix.md`, `demo-variants.md`, `decision-log.md`, `acceptance-criteria.md`, `gap-analysis.md`, `proposal-summary.md`, `implementation-estimate.md`, `pitch-outline.md`, `risk-register.md`, `error-recovery.md`, commercial/delivery docs, and `handover.md`.
10. Create lifecycle and validation scripts:
   - `scaffold-demo.sh`, `backup-db.sh`, `restore-db.sh`, `reset-db.sh`, `rebuild-demo.sh`, `tests/validate-demo.py`, and `tests/smoke-snippets.py`.
11. Start Odoo:
   - Run with the generated config.
   - Confirm port is listening and logs have no traceback.
12. Browser smoke test:
   - Open Odoo.
   - Confirm login.
   - Confirm installed apps.
   - Execute at least one critical demo flow end-to-end.
   - Capture screenshot evidence into `<demo_slug>/screenshots/`.
13. Run functional validation and write `<demo_slug>/reports/validation-report.md`.
14. Write rehearsal, readiness, module lint, known issues, privacy, security/access, localization, performance, pitch, risk, migration, deployment, cost, change, follow-up, and cross-demo index artifacts before final response.

## Preflight and Failure Prevention

Apply these checks before and after environment creation:

- Validate every `SKILL.md` YAML frontmatter after editing. YAML descriptions containing colons must be quoted.
- Treat `~/odoo` or user-provided source paths as candidates, not final paths. Discover exact source, venv, and Enterprise addon directories.
- Verify Odoo Enterprise dependency imports early. If init fails on missing packages such as `zeep`, install them in the selected venv and rerun from a clean demo DB.
- Do not rely on Odoo demo data. Enterprise/demo data can fail on unrelated dependencies; use `--without-demo=all` and create deterministic seed data in custom modules.
- For every manifest `post_init_hook`, export the function from the module root `__init__.py` with `from .hooks import post_init_hook`.
- Remember that `post_init_hook` runs on module install, not normal upgrade. If a hook is added after a module is already installed, run it through Odoo shell or reinstall/reinitialize the demo DB.
- Make hooks idempotent. Use search-or-create logic and tolerate missing optional records.
- In Odoo 19, some translated columns are JSONB. Prefer ORM/Odoo shell for validation, or cast JSONB columns to text in SQL smoke checks.
- Do not assume standard POS payment methods exist when using `--without-demo=all`. Seed journals, POS payment methods, and POS config explicitly.
- For QRIS demos, create a placeholder bank/payment method unless real credentials are provided. Mark it clearly in the handover.
- For e-Faktur/Coretax demos, install localization modules and document that production NPWP/PKP data is still required.
- On macOS, use `tmux` for long-running Odoo servers. `nohup`/`setsid` behavior may differ or `setsid` may not exist.
- If the requested HTTP port is occupied, document the owner process and run on a confirmed fallback port. Do not silently change the permanent config unless the user approves.
- If the browser automation tool is blocked, fall back to HTTP checks plus ORM/SQL validation and state the limitation.
- Always set a known admin login/password for pre-sales demos unless the user provided one.

## Custom Module Workflow

For each custom module:

1. Define module purpose and owner business flow.
2. Create standard Odoo structure:
   - `__manifest__.py`
   - `__init__.py`
   - `models/`
   - `views/`
   - `security/ir.model.access.csv`
   - optional `data/`, `demo/`, `reports/`, `wizards/`, `controllers/`
3. Keep dependencies explicit in `depends`.
4. Add fields and model logic in Python.
5. Add module icon at `static/description/icon.png`.
6. Add views/actions/menus in XML.
7. Add security access and record rules when needed.
8. Add data files and visual assets in dependency-safe order.
9. Upgrade immediately:
   - `odoo-bin -c <conf> -d <db> -u <module> --stop-after-init`
10. Read logs and fix errors before creating the next module.
11. Add a short smoke test for the module's business flow.
12. Verify required records and images exist after install. A module being `installed` is not enough.

## Data Safety Checklist

Before `--stop-after-init` or module upgrade:

- XML IDs are unique and referenced after they are defined.
- Manifest `data` ordering follows dependencies.
- `depends` includes every module that owns referenced models/views/groups.
- Required fields are provided in CSV/XML/demo data.
- Access CSV references existing model external IDs.
- Record rules do not lock out admin or demo users.
- Menus/actions reference valid IDs.
- Python imports are wired in every `__init__.py`.
- Manifest hooks are exported from module root `__init__.py`.
- Hook-added records are created during fresh install or manually backfilled if the module was already installed.
- No hardcoded absolute paths.
- Demo data is small but complete enough for the sales presentation.
- Standard records that disappear with `--without-demo=all` are explicitly seeded.
- Product/category/company/module image files exist when the demo surface supports images.
- Binary image fields are non-empty after install for records that should display images.

## Completion Criteria

The skill is complete only when all items pass:

- BRQ is written.
- Solution mapping is written.
- Demo manifest, machine-readable BRQ, demo script, data manifest, traceability matrix, demo variants, decision log, acceptance criteria, gap analysis, proposal summary, implementation estimate, pitch outline, risk register, error recovery, commercial/delivery docs, handover, and validation report are written.
- Odoo source and venv are present.
- `odoo.conf` is present and documented.
- Database initializes without traceback.
- Default apps install.
- Custom modules install or upgrade without traceback.
- Required demo/master data exists.
- Demo users and role matrix are seeded and documented.
- Required demo records are counted and documented: products, partners, POS config, payment methods, SO/PO/delivery/invoice/payment/POS/return records, custom workflow records, dashboard/checklist rows.
- Visual assets are present and verified: product images, module icons, company/logo placeholder, and website/category images when relevant.
- Integration mocks exist and are documented when real credentials/integrations are unavailable.
- Lifecycle scripts exist: scaffold, init, start, upgrade, backup, restore, reset, and rebuild.
- Functional validation script runs and writes a validation report.
- Module lint, shell smoke snippets, known issues, privacy check, rehearsal check, readiness score, security/access check, localization check, and performance sanity check are written.
- Root-level `presales-index.json` is created or updated when more than one pre-sales demo may exist.
- Rollback strategy and latest backup path are documented.
- Odoo web starts on the chosen port.
- Browser smoke test proves the critical pre-sales flow.
- Screenshot evidence is saved or the browser limitation is documented.
- Handover document contains commands to start, stop, upgrade modules, reset DB, and present the demo.

## Handover Document Template

Write a final document with:

- Client/company summary.
- Business flows covered.
- Odoo version, edition, install path, config path, database name, port.
- Installed standard apps.
- Custom modules created and why.
- Demo users and roles.
- Demo data included.
- Image assets included and source/placeholder notes.
- Demo transactions and validation evidence.
- Traceability matrix and demo variants.
- Acceptance criteria and decision log.
- Readiness score and risk register.
- Known issues, privacy, security/access, localization, module lint, and performance sanity checks.
- Screenshot index.
- Integration mocks and live-integration gaps.
- Competitive positioning, cost model, change management, migration plan, deployment options, and follow-up checklist.
- Error recovery playbook and rehearsal checklist.
- Critical demo script.
- Start/stop/upgrade/backup/restore/reset/rebuild commands.
- Known assumptions and open questions.
- Next-step implementation estimate.
