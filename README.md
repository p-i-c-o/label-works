<img width="1280" height="640" alt="label-works" src="https://github.com/user-attachments/assets/6b127015-0855-4b5a-b9fe-2062f7b92970" />

## Technical Details
Coded in:
- Typst
- JSON

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
| name | Description          | Edge Compute Node |
| zone | Zone                 | DATACENTER-A |
| locator | Locator              | `RACK-01-U3` |

## How do I use it?
1. Configure the `items.json` file to specify your items and your documentation base URL.
2. Render your labels using `typst compile labels.typ`
3. Print the `labels.pdf` file on to sticker A4 paper.
4. Cut on dashed-lines and apply!

## How do I configure it?

This example configuration:

```json
{
  "base-url": "https://docs.example.com/items/",
  "items": [
    { "id": "NYC_srv_edge_01", "name": "Edge Compute Node", "zone": "DATACENTER-A", "locator": "RACK-01-U3" },
    { "id": "AMS_switch_core_01", "name": "Core Network Switch", "zone": "NETWORK", "locator": "RACK-02-U1" },
    { "id": "ZRH_nas_01", "name": "Primary Storage Unit", "zone": "DATACENTER-B", "locator": "RACK-03-U6" },
    { "id": "LON_pdu_01", "name": "Power Distribution Unit", "zone": "POWER", "locator": "RACK-01-BACK" },
    { "id": "BER_ap_02", "name": "Wireless Access Point", "zone": "OFFICE", "locator": "CEILING-Z2" },
    { "id": "PAR_printer_01", "name": "Document Printer", "zone": "ADMIN", "locator": "ROOM-204" },
    { "id": "MAD_cart_01", "name": "Mobile Equipment Cart", "zone": "STORAGE", "locator": "AISLE-C" },
    { "id": "ROM_toolkit_01", "name": "General Tool Kit", "zone": "WORKSHOP", "locator": "DRAWER-5" }
  ]
}
```

Would render:
<img width="3508" height="2480" alt="labels" src="https://github.com/user-attachments/assets/ffef2c5e-647c-4e67-950c-5460b78eae2c" />

