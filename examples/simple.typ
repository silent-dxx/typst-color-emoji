#import "../cm.typ"

#let udl0 = underline.with(
  stroke: 1.5pt + red,
  offset: 2pt,
)

#show raw.where(block: false): box.with(
  fill: aqua.lighten(80%),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

#text(2.0em)[
  = Typst Color Emoji Simple Demo
]

\

////////////////////////////////////
#[
  #show:udl0
  #text(size: 2.0em)[
    \1. 2.0em fonts
  ]
]

#text(2.0em)[
  Hello
  #cm.o("cat.face")
  #cm.o("heart.beat")
  #cm.o("face.grin")
  #cm.o("hand.ok")
  #cm.o("panda")
]

\

////////////////////////////////////
#[
  #show:udl0
  #text(size: 2.0em)[
    \2. 3.0em fonts
  ]
]

#text(3.0em)[
  World
  #cm.t("cat.face")
  #cm.t("heart.beat")
  #cm.t("face.grin")
  #cm.t("hand.ok")
  #cm.t("panda")
]
#cm.t("cat.face")

\

////////////////////////////////////
#[
  #show:udl0
  #text(size: 2.0em)[
    \3. default fonts
  ]
]

#lorem(10)
#cm.t("cat.face")
#cm.t("heart.beat")
#cm.t("face.grin")
#cm.t("hand.ok")
#cm.t("panda")

\

////////////////////////////////////
#[
  #show:udl0
  #text(size: 2.0em)[
    \4. \#emoji + \#em.t + \#em.o
  ]
]

`face.grin:` #emoji.face.grin #cm.t("face.grin") #cm.o("face.grin")

`face.joy :` #emoji.face.joy #cm.t("face.joy") #cm.o("face.joy")

////////////////////////////////////
#pagebreak()

#set text(size: 2.0em)

= Emoji List

#let line = ()
#for (i, v) in cm.cm-dic {
  cm.t(i)
  line.push(i)

  if line.len() == 20 {
    for i2 in line {
      cm.o(i2)
    }

    line = ()
  }
}
#parbreak()
#for i2 in line {
  cm.o(i2)
}
