<img width="1280" height="640" alt="label-works" src="label-works.png" />

## Technical Details
Coded in:
- Typst (using [cades](https://typst.app/universe/package/cades/) package)
- JSON

## Dependencies
- Typst
- `Spleen 32x64` Font (found in [fcambus/spleen](https://github.com/fcambus/spleen/releases))

## Project Goals
- Track techincal details
- Track changes
- Provide documentation
- Give each item with a label an individual identifier

## How does it work?
Each label is rendered with 4 fields:
| Field | What is it? | Example |
|----------------|----------------------|--------|
| ID | Item ID              | `NYC_srv_edge_01` |
| name | Description          | `Edge Compute Node` |
| zone | Zone                 | `DATACENTER-A` |
| locator | Locator              | `RACK-01-U3` |

A QR-Code is rendered which combines the base-url and the ID. I designed this around the idea that each item will have it's own static hosted documentation that can keep track of its:
- Repairs
- Replacements
- Configurations
- Incident reports
- FAQs
- etc...

## How do you use it?
1. Configure the `labels.json` file to specify your items and your documentation base URL.
2. Render your labels using `typst compile labels.typ`
3. Print the `labels.pdf` file on to sticker A4 paper.
4. Cut on dashed-lines and apply!

## How do you configure it?

This example configuration (note the optional per-item `url` override used for the printer). The `base-url` and per-item `url` can include `%id%`, `%locator%`, `%name%`, or `%zone%` placeholders which will be substituted in the QR code URL. If the `base-url` contains no placeholders, `%id%` will be appended automatically for backward compatibility.

```json
{
  "base-url": "https://docs.example.com/items/%zone%/%id%",
  "items": [
    {
      "id": "NYC_srv_edge_01",
      "name": "Edge Compute Node",
      "zone": "DATACENTER-A",
      "locator": "RACK-01-U3"
    },
    {
      "id": "AMS_switch_core_01",
      "name": "Core Network Switch",
      "zone": "NETWORK",
      "locator": "RACK-02-U1"
    },
    {
      "id": "BER_ap_02",
      "name": "Wireless Access Point",
      "zone": "OFFICE",
      "locator": "CEILING-Z2",
      "url": "https://docs.example.com/wifi/%locator%/%name%"
    },
    {
      "id": "PAR_printer_01",
      "name": "Document Printer",
      "zone": "ADMIN",
      "locator": "ROOM-204",
      "url": "https://docs.example.com/printers/%locator%/%name%"
    }
  ]
}
```

### URL placeholders
Both `base-url` and item-level `url` support the following placeholders:
- `%id%` → the item ID
- `%locator%` → the locator value
- `%name%` → the label name/description
- `%zone%` → the zone value

Item-level `url` takes precedence over `base-url` for that label.

Would render:

<img width="3508" height="2480" alt="labels" src="labels.png" />

## To-Do
- [ ] Implement QR code URL override
- [ ] Code simple item management script
