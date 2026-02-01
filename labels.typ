#set page(
  paper: "a4",
  margin: 1cm,
  flipped: true
)

#import "@preview/cades:0.3.1": qr-code

#set text(font: "Spleen 32x64")

// Load data and render dynamically
#let data = json("labels.json")
#let base-url = data.at("base-url")

// Configuration constants
#let qr-size = 2cm
#let row-gutter = 10pt

#let large(body) = {
  set text(18pt)
  body
}

#let small(body) = {
  set text(8pt)
  body
}

#let label(ID, name, zone, locator, qr-url) = block(
  stroke: 0.8pt,
  inset: 6pt,
  width: 100%,
  height: auto,
)[
  #large(ID)
  #v(-15pt)
  #line(length: 100%, stroke: 0.8pt)
  #v(-8pt)
  #grid(
    columns: (1.7fr, 1fr),
    column-gutter: 6pt,
    row-gutter: -4pt,
    stroke: 0pt,
    align: (left + top, center + horizon),
    [#name #v(-4pt) #text(fill: rgb("#949494"))[Zone:] #upper(zone) #v(-4pt) #locator],
    [#qr-code(qr-url, width: qr-size)]
  )
]

// Load data and render dynamically
#let items = data.items
#let has-vars(url) = {
  url.contains("%id%") or url.contains("%locator%") or url.contains("%name%") or url.contains("%zone%")
}
#let expand-url(url, id, locator, name, zone) = {
  url
    .replace("%id%", id)
    .replace("%locator%", locator)
    .replace("%name%", name)
    .replace("%zone%", zone)
}
#align(center + horizon)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr,),
    stroke: (paint: black.lighten(70%), thickness: 0.3pt, dash: "dashed"),
    column-gutter: 0pt,
    row-gutter: 0pt,
    ..items.map(item => {
      let base_template = if has-vars(base-url) { base-url } else { base-url + "%id%" }
      let raw_url = if item.keys().contains("url") { item.at("url") } else { base_template }
      let qr_url = expand-url(raw_url, item.id, item.locator, item.name, item.zone)
      [#label(item.id, item.name, item.zone, item.locator, qr_url)]
    })
  )
]
