#let separator() = {
  line(length: 100%, stroke: rgb(0, 0, 0, 75))
}

#let vseparator() =  {
  set text(fill: rgb(0, 0, 0, 200))
  [ | ]
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
        == #edu.name
        #eval(edu.degree, mode: "markup") #vseparator() #eval(edu.grade, mode: "markup")
      ],
      [ 
        #set align(right)
        === #edu.start -- #edu.end
        #edu.location
      ] 
    )

    for point in edu.points {
      [ - #eval(point, mode: "markup") ] 
    }
  }
}

#let display_work_experience(ex) = {
  [ = Work Experience ]
  separator()
  for job in ex {
    grid(
      columns: 2,
      gutter: 1fr,
      [
        == #job.company
        #emph(job.role) #vseparator() #emph(job.team)
      ], 
      [
        #set align(right)
        === #job.start -- #job.end
        #job.location
      ]
    )

    for point in job.points {
      [ - #eval(point, mode: "markup") ] 
    }
    [ - *Technologies:* #job.technologies.join(", ")]
  }
}

#let display_projects(projects) = {
  [ = Projects ]
  separator()
}

#let display_skills(skills) = {
  [ = Skills ]
  separator()
  for (section, values) in skills.pairs() {
    strong(section + ": ")
    values.join(" " + sym.circle.filled.tiny + " ")
    linebreak()
  }
}

#let display_languages(languages) = {
  [ = Languages ]
  separator()
  languages.join(", ")
}

#let cv(data) = {
  [ = #data.name ]
  display_links(data.links)
  display_education(data.education)
  display_work_experience(data.work_experience)
  // display_projects(data.projects)
  display_skills(data.skills)
  display_languages(data.languages)
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
