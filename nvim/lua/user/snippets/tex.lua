-- CONFIGURACIONES DE SNIPPETS PARA LATEX
local ls = require("luasnip") local s = ls.snippet local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep 

return {

  -- ENTORNOS --
  s("beg", {
    t("\\begin{"), i(1), t("}"),
    t({ "", "\t" }), i(0),
    t({ "", "\\end{" }), rep(1), t("}"),
  }),
  
  s("chap", { t("\\chapter{"), i(1), t("}"), i(0) }),
  s("sec",  { t("\\section{"), i(1), t("}"), i(0) }),
  s("sub",  { t("\\subsection{"), i(1), t("}"), i(0) }),
  s("ssub", { t("\\subsubsection{"), i(1), t("}"), i(0) }),
  
  s("mk",   { t("$"), i(1), t("$"), i(0) }),
  s("dm",   { t("\\["), t({ "", "\t" }), i(1), t({ "", "\\]" }), i(0) }),

  s("def", {
    t("\\begin{definicion}"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{definicion}" }),
    i(0),
  }),

  s("thm", {
    t("\\begin{teorema}"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{teorema}" }),
    i(0),
  }),

  s("prop", {
    t("\\begin{proposicion}"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{proposicion}" }),
    i(0),
  }),

  s("lem", {
    t("\\begin{lema}"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{lema}" }),
    i(0),
  }),

  s("cor", {
    t("\\begin{corolario}"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{corolario}" }),
    i(0),
  }),

  s("exmp", {
    t("\\begin{ejemplo}"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{ejemplo}" }),
    i(0),
  }),

  s("nts", {
    t("\\begin{nota}"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{nota}" }),
    i(0),
  }),

  s("pf", {
    t("\\begin{proof}"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{proof}" }),
    i(0),
  }),

  s("enum", {
    t("\\begin{enumerate}[label=\\Roman*.]"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{enumerate}" }),
    i(0),
  }),

  s("lbl", { t("\\label{"), i(1), t("}") }),
  -- FIN DE ENTORNOS --
  
  -- LETRAS GRIEGAS --
  s("al",  { t("\\alpha") }),
  s("be",  { t("\\beta") }),
  s("ga",  { t("\\gamma") }),
  s("de",  { t("\\delta") }),
  s("ep",  { t("\\epsilon") }),
  s("vep", { t("\\varepsilon") }),
  s("ze",  { t("\\zeta") }),
  s("et",  { t("\\eta") }),
  s("th",  { t("\\theta") }),
  s("vth", { t("\\vartheta") }),
  s("io",  { t("\\iota") }),
  s("ka",  { t("\\kappa") }),
  s("la",  { t("\\lambda") }),
  s("mu",  { t("\\mu") }),
  s("nu",  { t("\\nu") }),
  s("xi",  { t("\\xi") }),
  s("pi",  { t("\\pi") }),
  s("rho", { t("\\rho") }),
  s("si",  { t("\\sigma") }),
  s("tau", { t("\\tau") }),
  s("up",  { t("\\upsilon") }),
  s("phi", { t("\\phi") }),
  s("vph", { t("\\varphi") }),
  s("chi", { t("\\chi") }),
  s("psi", { t("\\psi") }),
  s("om",  { t("\\omega") }),

  s("Ga", { t("\\Gamma") }),
  s("De", { t("\\Delta") }),
  s("Th", { t("\\Theta") }),
  s("La", { t("\\Lambda") }),
  s("Xi", { t("\\Xi") }),
  s("Pi", { t("\\Pi") }),
  s("Si", { t("\\Sigma") }),
  s("Ph", { t("\\Phi") }),
  s("Ps", { t("\\Psi") }),
  s("Om", { t("\\Omega") }),
  -- FIN DE LETRAS GRIEGAS --
  
  -- LETRAS ESTILIZADAS -- 
  s("cal",  { t("\\mathcal{"), i(1), t("}") }),
  s("frak", { t("\\mathfrak{"), i(1), t("}") }),
  s("scr",  { t("\\mathscr{"), i(1), t("}") }),
  s("bb",   { t("\\mathbb{"), i(1), t("}") }),
  s("txt", { t("\\text{"), i(1), t("}") }),

  s("bf",   { t("\\textbf{"), i(1), t("}") }),
  s("it",   { t("\\textit{"), i(1), t("}") }),
  -- FIN DE LETRAS ESTILIZADAS -- 
  
  -- LÓGICA
  s("imp",  { t("\\implies ") }),
  s("iff",  { t("\\iff ") }),
  s("fa",   { t("\\forall ") }),
  s("ex",   { t("\\exists ") }),
  s("lor",  { t("\\lor ") }),
  s("land", { t("\\land ") }),
  s("lnot", { t("\\lnot ") }),
  s("neq",  { t("\\neq ") }),
  -- FIN DE LÓGICA

  -- TEORÍA DE CONJUNTOS -- 
  s("set",   { t("\\{"), i(1), t("\\}") }),
  s("in",    { t("\\in ") }),
  s("notin", { t("\\notin ") }),
  s("cc",    { t("\\subseteq ") }),
  s("uu",    { t("\\cup ") }),
  s("nn",    { t("\\cap ") }),
  s("pc",    { t("\\times ") }),
  s("UU",    { t("\\bigcup ") }),
  s("NN",    { t("\\bigcap ") }),
  s("PC",    { t("\\bigtimes ") }),
  s("to",    { t("\\to ") }),
  s("dom",   { t("\\dom ") }),
  s("cod",   { t("\\cod ") }),
  s("ran",   { t("\\ran ") }),
  s("circ",  { t("\\circ ") }),
  s("cong",  { t("\\cong") }),
  s("sim",   { t("\\sim ") }),
  s("le",    { t("\\le ") }),
  s("ge",    { t("\\ge ") }),
  s("leq",   { t("\\leq ") }),
  s("geq",   { t("\\geq ") }),
  -- FIN DE TEORÍA DE CONJUNTOS --
  
  -- ESPACIOS MÉTRICOS, NORMAS Y PRODUCTOS INTERNOS -- 
  s("dist", { t("d("), i(1), t(", "), i(2), t(")") }),
  s("ball", { t("B_{"), i(1), t("}("), i(2), t(")") }),
  s("cball", { t("\\overline{B}_{"), i(1), t("}("), i(2), t(")") }),
  s("inp", { t("\\langle "), i(1), t(", "), i(2), t(" \\rangle") }),
  s("norm", { t("\\|"), i(1), t("\\|_{"), i(2), t("}") }),
  -- FIN DE ESPACIOS MÉTRICOS, NORMAS Y PRODUCTOS INTERNOS --
  
  -- TOPOLOGÍA 
  s("cl", { t("\\cl") }),
  s("int", { t("\\int") }),
  s("fr", { t("\\fr") }),
  s("ext", { t("\\ext") }),
  -- FIN DE TOPOLOGÍA 

  -- TEORÍA DE CATEGORÍAS 
  s("hom", { t("\\Hom"), i(1), t("}("), i(2), t(", "), i(3), t(")") }),
  s("obj", { t("\\Ob("), i(1), t(")") }),
  s("func", { i(1), t(" : \\mathcal{"), i(2), t("} \\to \\mathcal{"), i(3), t("}") }),

  s("cSet", { t("\\mathbf{Set}") }),
  s("cTop", { t("\\mathbf{Top}") }),
  s("cGrp", { t("\\mathbf{Grp}") }),
  s("cAb", { t("\\mathbf{Ab}") }),
  s("cRng", { t("\\mathbf{Ring}") }),
  s("cMod", { t("\\mathbf{Mod}") }),
  s("cVect", { t("\\mathbf{Vect}") }),
  -- FIN DE TEORÍA DE CATEGORÍAS 
  
  -- ÁLGEBRA 
  s("nsub", { t("\\triangleleft ") }),
  s("oplus", { t("\\oplus ") }),
  s("Oplus", { t("\\bigoplus ") }),
  s("otim", { t("\\otimes ") }),
  s("Otim", { t("\\bigotimes ") }),
  s("gen", { t("\\langle "), i(1), t(" \\rangle") }),
  s("ker", { t("\\ker ") }),
  s("aut", { t("\\Aut("), i(1), t(")") }),
  s("deg", { t("["), i(1), t(" : "), i(2), t("]") }),
  -- FIN DE ÁLGEBRA
  
  -- OPERADORES -- 
  s("tint",    { t("\\topint ") }),
  s("sum",    { t("\\sum ") }),
  s("prod",   { t("\\prod ") }),
  s("lim",    { t("\\lim ") }),
  -- FIN DE OPERADORES -- 

  -- GENERALES -- 
  s("td",  { t("^{"), i(1), t("}") }),
  s("sb",  { t("_{"), i(1), t("}") }),
  s("ff",  { t("\\frac{"), i(1), t("}{"), i(2), t("}") }),
  s("bin", { t("\\binom{"), i(1), t("}{"), i(2), t("}") }),
  s("lr",  { t("\\left( "), i(1), t("\\right)") }),
  s("lr[", { t("\\left[ "), i(1), t("\\right]") }),
  s("lr{", { t("\\left\\{ "), i(1), t("\\right\\}") }),
  s("lra", { t("\\left\\langle "), i(1), t("\\right\\rangle") }),
  s("abs", { t("\\left| "), i(1), t("\\right|") }),
  s("inf", { t("\\infty") }),
  -- FIN DE GENERALES --

  -- MATEMÁTICAS ACTUARIALES (SEGURO DE VIDA) --
  
  -- 1. Probabilidades y Mortalidad
  s("lx", { t("l_{"), i(1, "x"), t("}") }),
  s("dx", { t("d_{"), i(1, "x"), t("}") }),
  s("px", { t("_{"), i(1, "t"), t("}p_{"), i(2, "x"), t("}") }),
  s("qx", { t("_{"), i(1, "t"), t("}q_{"), i(2, "x"), t("}") }),
  s("ex", { t("e_{"), i(1, "x"), t("}") }),
  s("excirc", { t("\\mathring{e}_{"), i(1, "x"), t("}") }), -- Esperanza de vida completa
  s("mux", { t("\\mu_{"), i(1, "x"), t("}") }),
  
  -- 2. Seguros de Vida
  s("Ax", { t("A_{"), i(1, "x"), t("}") }),
  s("Axn", { t("A_{"), i(1, "x"), t(":\\overline{"), i(2, "n"), t("|}") }), -- Seguro dotal
  s("Axterm", { t("A^1_{"), i(1, "x"), t(":\\overline{"), i(2, "n"), t("|}") }), -- Seguro temporal
  s("Axpure", { t("A_{"), i(1, "x"), t(":\\overline{"), i(2, "n"), t("|^1}") }), -- Dotal puro (alternativo)
  s("Ex", { t("_{"), i(1, "n"), t("}E_{"), i(2, "x"), t("}") }), -- Dotal puro (notación E)
  
  -- 3. Anualidades
  s("anx", { t("a_{"), i(1, "x"), t("}") }), -- Vencida
  s("aadx", { t("\\ddot{a}_{"), i(1, "x"), t("}") }), -- Anticipada
  s("anxn", { t("a_{"), i(1, "x"), t(":\\overline{"), i(2, "n"), t("|}") }), -- Vencida temporal
  s("aadxn", { t("\\ddot{a}_{"), i(1, "x"), t(":\\overline{"), i(2, "n"), t("|}") }), -- Anticipada temporal
  
  -- 4. Primas y Reservas
  s("Px", { t("P_{"), i(1, "x"), t("}") }),
  s("Pxn", { t("P_{"), i(1, "x"), t(":\\overline{"), i(2, "n"), t("|}") }),
  s("Vx", { t("_{"), i(1, "t"), t("}V_{"), i(2, "x"), t("}") }),
  
  -- 5. Valores de Conmutación
  s("Dx", { t("D_{"), i(1, "x"), t("}") }),
  s("Nx", { t("N_{"), i(1, "x"), t("}") }),
  s("Sx", { t("S_{"), i(1, "x"), t("}") }),
  s("Cx", { t("C_{"), i(1, "x"), t("}") }),
  s("Mx", { t("M_{"), i(1, "x"), t("}") }),
  s("Rx", { t("R_{"), i(1, "x"), t("}") }),
  
  -- FIN DE MATEMÁTICAS ACTUARIALES --


  -- PRESETS RÁPIDAS
  s("pset", {
        t({
            "\\documentclass[11pt, letterpaper]{scrartcl}",
            "\\usepackage[utf8]{inputenc}",
            "\\usepackage[spanish]{babel}",
            "\\usepackage{amsmath, amssymb, amsthm, amsfonts, mathrsfs}",
            "\\usepackage{geometry}",
            "\\geometry{margin=1in}",
            "",
            "\\usepackage{parskip}",
            "",
            "\\theoremstyle{definition}",
            "\\newtheorem{prob}{Problema}",
            "",
            "\\newenvironment{solucion}",
            "  {\\begin{proof}[\\textbf{Solución}]\\renewcommand{\\qedsymbol}{$\\blacksquare$}}",
            "  {\\end{proof}}",
            "",
            "\\title{"}), i(1, "Título del Pset"), t({ "}",
            "\\author{César Pérez Amador}",
            "\\date{\\today}",
            "",
            "\\begin{document}",
            "\\maketitle",
            "",
            "\\section*{Ejercicios}",
            "",
            "\\begin{prob}",
            "    "}), i(2, "Enunciado del problema aquí..."), t({"",
            "\\end{prob}",
            "",
            "\\begin{solucion}",
            "    "}), i(3, "Desarrollo de la solución..."), t({"",
            "\\end{solucion}",
            "",
            "\\end{document}"
        }),
    }),

    s("zk", {
    t({
      "\\documentclass[11pt, letterpaper]{article}",
      "",
      "% Importa el preámbulo centralizado",
      "\\input{../Resumenes/preamble.tex}",
      "",
      "% ==============================================================================",
      "% METADATOS DE LA NOTA",
      "% ==============================================================================",
      "\\title{\\sffamily\\bfseries "
    }),
    i(1, "Nombre del Concepto"),
    t({
      "}",
      "\\author{\\large César Pérez Amador}",
      "\\date{\\small \\today}",
      "",
      "\\begin{document}",
      "\\maketitle",
      "",
      "\\begin{abstract}",
      "    \\noindent "
    }),
    i(2, "Idea central del concepto en 3 o 4 líneas..."),
    t({
      "",
      "\\end{abstract}",
      "",
      "\\vspace{1em}",
      "",
      "% ==============================================================================",
      "% DESARROLLO",
      "% ==============================================================================",
      "",
      "    "
    }),
    i(0),
    t({
      "",
      "",
      "\\end{document}"
    }),
  }),
  -- FIN DE PRESETS

}
