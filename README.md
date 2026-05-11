# Odoo Pre-Sales Skill

A Codex skill for turning Odoo pre-sales discovery into a working, validated Odoo demo environment.

This skill helps an AI agent interview a prospect, research the company, infer the right Odoo apps, identify custom gaps, generate documentation, provision a local Odoo demo, seed realistic data, and verify that the demo runs.

## Quick Install

Install the latest version into Codex:

```bash
curl -fsSL https://raw.githubusercontent.com/trisetiohidayat/odoo-pre-sales-skill/main/install.sh | bash
```

Restart Codex after installation so the new skill is discovered.

Use the skill in Codex:

```text
$odoo-pre-sales
```

## Install Options

Install a specific release or branch:

```bash
curl -fsSL https://raw.githubusercontent.com/trisetiohidayat/odoo-pre-sales-skill/main/install.sh | bash -s -- --version v0.1.0
```

Install into a custom skill directory:

```bash
curl -fsSL https://raw.githubusercontent.com/trisetiohidayat/odoo-pre-sales-skill/main/install.sh | bash -s -- --dest ~/.codex/skills
```

Overwrite an existing install:

```bash
curl -fsSL https://raw.githubusercontent.com/trisetiohidayat/odoo-pre-sales-skill/main/install.sh | bash -s -- --force
```

Install with the Codex skill installer:

```bash
python ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo trisetiohidayat/odoo-pre-sales-skill \
  --path skills/odoo-pre-sales
```

Manual install:

```bash
mkdir -p ~/.codex/skills
git clone https://github.com/trisetiohidayat/odoo-pre-sales-skill /tmp/odoo-pre-sales-skill
cp -R /tmp/odoo-pre-sales-skill/skills/odoo-pre-sales ~/.codex/skills/odoo-pre-sales
```

## What This Skill Does

- Runs iterative BRQ discovery before implementation.
- Searches public company information and asks the user to confirm ambiguous matches.
- Infers Odoo apps from business needs instead of asking the user to manually choose modules.
- Prefers standard Odoo features before custom code.
- Creates a self-contained demo output folder for each prospect or theme.
- Generates docs, config, scripts, reports, screenshots, backups, logs, data, and custom addons.
- Creates visual demo data such as product images and module icons when useful.
- Initializes the database, installs modules, upgrades custom addons, seeds demo data, and validates the environment.

## Repository Structure

```text
.
├── README.md
├── LICENSE
├── install.sh
└── skills/
    └── odoo-pre-sales/
        ├── SKILL.md
        └── references/
            ├── advanced-artifacts.md
            ├── demo-data.md
            ├── demo-operations.md
            ├── evidence-and-integrations.md
            ├── industry-data-packs.md
            ├── operational-hardening.md
            └── visual-assets.md
```

## Generated Demo Outputs

The skill creates one folder per pre-sales theme or client, for example `zara_id_demo/`.

Expected outputs include:

| Area | Output |
| --- | --- |
| Requirements | `docs/BRQ.md`, `docs/BRQ.yaml`, `docs/solution-mapping.md` |
| Sales artifacts | `docs/proposal-summary.md`, `docs/pitch-outline.md`, `docs/gap-analysis.md` |
| Delivery artifacts | `docs/implementation-estimate.md`, `docs/risk-register.md`, `docs/deployment-options.md` |
| Demo operations | `docs/demo-script.md`, `docs/demo-variants.md`, `docs/error-recovery.md` |
| Odoo runtime | `config/odoo.conf`, `custom-addons/`, `scripts/`, `data/`, `logs/` |
| Evidence | `screenshots/`, `reports/validation-report.md`, `reports/rehearsal-check.md` |
| Recovery | `backups/`, reset and restore scripts |

## Requirements

- Codex with local skills enabled.
- Odoo source checkout available locally when building demos.
- Python virtual environment suitable for the selected Odoo version.
- PostgreSQL access for local demo databases.
- Browser automation available when screenshot evidence or smoke tests are requested.

## Notes

- This repository distributes the skill only; it does not vendor Odoo source code.
- Real production credentials should not be stored in generated demo artifacts.
- When real integration credentials are unavailable, the skill should create visible mocks and document them clearly.
- Restart Codex after installing or updating the skill.

## License

MIT License. See [LICENSE](LICENSE).
