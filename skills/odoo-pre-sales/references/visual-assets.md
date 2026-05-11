# Visual Assets

Use images wherever they materially improve the Odoo pre-sales demo. Do not leave visual fields empty when a safe placeholder or generated image can be created.

## Asset Targets

- Product images: set `image_1920` on `product.template` and ensure website/POS product cards show images.
- Product category images: set category/public category images when the industry benefits from visual browsing.
- Company logo: set `res.company.logo` using an official logo only if usage is clearly allowed, otherwise use a neutral generated/demo placeholder and label it as such.
- Custom module icons: add `static/description/icon.png` to every custom module.
- Website/landing images: add banner/category images when Website/eCommerce is part of the demo.
- Partner/avatar images: optional, only if useful and not using real personal data.

## Asset Sourcing Order

1. Use user-provided images when available.
2. Use public official brand/product images only when rights and context are appropriate for a local demo, and cite the source in handover.
3. Generate neutral placeholder/demo images when no safe source is available.
4. Use simple generated icons for custom module icons rather than leaving the default Odoo icon.

## Implementation Rules

- Store all image files under `<demo_slug>/assets/` first.
- Copy module icons into each module at `static/description/icon.png`.
- Load record images through ORM hooks or XML/CSV with base64 file contents.
- Keep filenames stable and descriptive, for example `products/zara-linen-shirt.png` and `modules/zara_omnichannel_return_icon.png`.
- Prefer PNG or JPG under practical demo sizes; avoid huge files in modules.
- Do not hotlink external image URLs in Odoo demo data. Download/generate and store local assets.
- Document image sources and placeholders in `<demo_slug>/docs/handover.md`.
- Verify images render in the browser or by checking non-empty binary fields after module install.
