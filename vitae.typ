#let separator() = {
  line(length: 100%, stroke: rgb(0, 0, 0, 75))
}

#let iconify_link(l) = {
  grid(
    columns: 2,
    gutter: 5pt,
    image("assets/icons/" + l.icon + ".svg", width: 12pt),
    [ #v(2pt); #link(l.url, l.display); ],
  )
}

#let display_links(links) = {
  show link: underline
  grid(
    columns: links.len(),
    gutter: 7pt,
    ..links.map(iconify_link)
  )
}

#let display_education(education) = {
  [ = Education ]
  separator()
  for edu in education {
    grid(
      columns: 2,
      gutter: 1fr,
      [ 
        === #edu.name
        #eval(edu.degree, mode: "markup")
      ],
      [ 
        #set align(right)
        === #edu.start -- #edu.end
        #edu.location
      ] 
    )

    [ - #eval(edu.grade, mode: "markup") ]
    for point in edu.description {
      [ - #eval(point, mode: "markup") ] 
    }
  }
}

#let display_experience(ex) = {
  [ = Experience ]
  separator()
}

#let cv(data) = {
  [ = #data.name ]
  display_links(data.links)
  display_education(data.education)
  display_experience(1)
}

#set page(
  paper: "a4",
  margin: (
    x: 1cm,
    y: 1.3cm
  ),
  footer: [
    #set align(right)
    #set text(size: 9pt, fill: rgb(0, 0, 0, 150))
    Last updated on - #datetime.today().display("[day] [month repr:short], [year]") 
  ]
)

#set text(font: "Calibri")
#let data = yaml("data.yaml")
#cv(data)
