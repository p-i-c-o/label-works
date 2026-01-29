# label-works
A label maker / organisational system coded in typst and json.

## Project Goals
- Track techincal details
- Track changes
- Provide documentation
- Give each item with a label an individual identifier

## How does it work?
Each label is rendered with 4 fields:
| Field | What is it? | Example |
|----------------|----------------------|--------|
| ID | Item ID              | `GVA_switch_core_1` |
| name | Description          | 10g PoE Core Switch |
| zone | Zone                 | Core Network |
| locator | Locator              | `10.0.0.1` |

## How do I use it?
1. Configure the `items.json` file to specify your items and your documentation base URL.
2. Render your labels using `typst compile labels.typ`
3. Print the `labels.pdf` file on to sticker A4 paper.

## How do I configure it?

This example configuration:

```json
{
  "base-url": "https://docs.example.com/items/",
  "items": [
    { "id": "item-001", "name": "Small Compute Node", "zone": "ZONE-A", "locator": "LOC-01" },
    { "id": "item-002", "name": "Network Switch", "zone": "ZONE-B", "locator": "LOC-02" },
    { "id": "item-003", "name": "Storage Unit", "zone": "ZONE-A", "locator": "LOC-03" },
    { "id": "item-004", "name": "Power Distribution", "zone": "ZONE-C", "locator": "LOC-04" },
    { "id": "item-005", "name": "Wireless Access Point", "zone": "ZONE-B", "locator": "LOC-05" },
    { "id": "item-006", "name": "Backup Device", "zone": "ZONE-D", "locator": "LOC-06" },
    { "id": "item-007", "name": "Peripheral Hub", "zone": "ZONE-A", "locator": "LOC-07" },
    { "id": "item-008", "name": "Monitoring Unit", "zone": "ZONE-C", "locator": "LOC-08" }
  ]
}
```

Would render:
<img width="3508" height="2480" alt="labels" src="https://github.com/user-attachments/assets/ffef2c5e-647c-4e67-950c-5460b78eae2c" />

