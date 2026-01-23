-- CONFIGURACIONES DE SNIPPETS PARA LATEX
local ls = require("luasnip") local s = ls.snippet local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep 

return {
  -- ==========================================
  -- 1. ESTRUCTURA BÁSICA
  -- ==========================================
  
  s("beg", {
    t("\\begin{"), i(1), t("}"),
    t({ "", "\t" }), i(0),
    t({ "", "\\end{" }), rep(1), t("}"),
  }),
  
  s("sec",  { t("\\section{"), i(1), t("}"), i(0) }),
  s("sub",  { t("\\subsection{"), i(1), t("}"), i(0) }),
  s("ssub", { t("\\subsubsection{"), i(1), t("}"), i(0) }),
  
  s("mk", { t("$"), i(1), t("$"), i(0) }),
  s("dm", { t("\\["), t({ "", "\t" }), i(1), t({ "", "\\]" }), i(0) }),

  -- ==========================================
  -- 1.1 ENTORNOS AMSTHM
  -- ==========================================

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

  s("lem", {
    t("\\begin{lema}"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{lema}" }),
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

  s("prop", {
    t("\\begin{proposicion}"),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{proposicion}" }),
    i(0),
  }),

  s("code", {
    t("\\begin{lstlisting}[language="),
    i(1, "Python"),
    t(", caption="),
    i(2, "Ejemplo en Python"),
    t({ "]", "" }),
    i(0, "def saludo():\n    print(\"Hola Mundo\")"),
    t({ "", "\\end{lstlisting}" }),
  }),

  
  s("algo", {
    t({ "\\begin{algorithm}", "\\caption{" }), i(1, "Título del Algoritmo"), t({ "}", "\\begin{algorithmic}[1]", "    \\Require " }), i(2, "Entrada"),
    t({ "", "    \\Ensure " }), i(3, "Salida"),
    t({ "", "", "    \\State " }), i(4, "Cuerpo del algoritmo"),
    t({ "", "", "    \\State \\Return " }), i(5, "resultado"),
    t({ "", "\\end{algorithmic}", "\\end{algorithm}" }),
  }),
  
  
  -- ==========================================
  -- 2. CÁLCULO Y OPERACIONES
  -- ==========================================
  
  s("ff", { t("\\frac{"), i(1), t("}{"), i(2), t("}") }),
  s("bn", { t("\\binom{"), i(1), t("}{"), i(2), t("}") }),
  s("sq",  { t("\\sqrt{"), i(1), t("}") }),
  s("td",  { t("^{"), i(1), t("}") }),
  s("sb", { t("_{"), i(1), t("}") }),
  
  s("dint", { t("\\int_{"), i(1, "-\\infty"), t("}^{"), i(2, "\\infty"), t("} ") }),
  s("int",  { t("\\int ") }),

  s("sum",  { t("\\sum_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("} ") }),
  s("prod", { t("\\prod_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("} ") }),
  s("lim",  { t("\\lim_{"), i(1, "x"), t("\\to "), i(2, "\\infty"), t("} ") }),

  s("df",   { t("\\frac{d}{d"), i(1, "x"), t("} ") }),
  s("part", { t("\\frac{\\partial}{\\partial "), i(1, "x"), t("} ") }),

  -- ==========================================
  -- 2.1 ECUACIONES DIFERENCIALES (SOLO LAS CLAVE)
  -- ==========================================

  -- Derivada de orden n
  s("dfn", {
    t("\\frac{d^{"), i(1, "n"), t("}}{d"),
    i(2, "x"), t("^{"), rep(1), t("}} ")
  }),

  -- Lineal de primer orden
  s("lin1", {
    t("\\frac{dy}{dx} + "), i(1, "P(x)"),
    t("y = "), i(2, "Q(x)")
  }),

  -- Lineal de segundo orden
  s("lin2", {
    t("\\frac{d^2y}{dx^2} + "), i(1, "a"),
    t("\\frac{dy}{dx} + "), i(2, "b"),
    t("y = "), i(3, "g(x)")
  }),

  -- Factor integrante
  s("fi", {
    t("\\mu("), i(1, "x"),
    t(") = e^{\\int "), i(2, "P(x)"), t("\\,dx}")
  }),

  -- Condición inicial
  s("ci", {
    t("y("), i(1, "0"), t(") = "), i(2)
  }),

  -- Transformada de Laplace
  s("lap",  { t("\\mathcal{L}\\{"), i(1), t("\\}") }),
  s("ilap", { t("\\mathcal{L}^{-1}\\{"), i(1), t("\\}") }),

  -- ==========================================
  -- 3. ANÁLISIS (DELTA–EPSILON)
  -- ==========================================

  s("deleps", {
    t("\\forall\\,\\varepsilon > 0,\\; \\exists\\,\\delta > 0\\; \\text{tal que si } "),
    t("0 < |x - "), i(1, "a"), t("| < \\delta"),
    t("\\text{ entonces } "),
    t("|f(x) - "), i(2, "L"), t("| < \\varepsilon")
  }),

  -- Letras Griegas Minúsculas
  s("al", { t("\\alpha") }),
  s("be", { t("\\beta") }),
  s("ga", { t("\\gamma") }),
  s("de", { t("\\delta") }),
  s("ep", { t("\\epsilon") }),
  s("vep", { t("\\varepsilon") }),
  s("ze", { t("\\zeta") }),
  s("et", { t("\\eta") }),
  s("th", { t("\\theta") }),
  s("vth", { t("\\vartheta") }),
  s("io", { t("\\iota") }),
  s("ka", { t("\\kappa") }),
  s("la", { t("\\lambda") }),
  s("mu", { t("\\mu") }),
  s("nu", { t("\\nu") }),
  s("xi", { t("\\xi") }),
  s("pi", { t("\\pi") }),
  s("rho", { t("\\rho") }),
  s("si", { t("\\sigma") }),
  s("tau", { t("\\tau") }),
  s("up", { t("\\upsilon") }),
  s("phi", { t("\\phi") }),
  s("vph", { t("\\varphi") }),
  s("chi", { t("\\chi") }),
  s("psi", { t("\\psi") }),
  s("om", { t("\\omega") }),

  -- Letras Griegas Mayúsculas (las que no son iguales al latín)
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

  -- ==========================================
  -- 4. CONJUNTOS Y LÓGICA
  -- ==========================================
  
  s("RR", { t("\\mathbb{R}") }),
  s("QQ", { t("\\mathbb{Q}") }),
  s("ZZ", { t("\\mathbb{Z}") }),
  s("NN", { t("\\mathbb{N}") }),
  s("CC", { t("\\mathbb{C}") }),

  s("cc",    { t("\\subset ") }),
  s("inn",   { t("\\in ") }),
  s("notin", { t("\\not\\in ") }),
  s("uu",    { t("\\cup ") }),
  s("nn",    { t("\\cap ") }),
  s("set",   { t("\\{"), i(1), t("\\}") }),
  s("emp",   { t("\\emptyset") }),

  s("imp", { t("\\implies ") }),
  s("iff", { t("\\iff ") }),
  s("fa",  { t("\\forall ") }),
  s("ex",  { t("\\exists ") }),
  s("lor", { t("\\lor ") }),
  s("land", { t("\\land ") }),
  
  -- ==========================================
  -- 5. PARÉNTESIS Y VISUAL
  -- ==========================================
  
  s("lr",  { t("\\left( "), i(1), t(" \\right)") }),
  s("lr[", { t("\\left[ "), i(1), t(" \\right]") }),
  s("lr{", { t("\\left\\{ "), i(1), t(" \\right\\}") }),
  s("lra", { t("\\left\\langle "), i(1), t(" \\right\\rangle") }),
  s("norm",{ t("\\|"), i(1), t("\\|") }),
  s("abs", { t("|"), i(1), t("|") }),

  s("bf",  { t("\\textbf{"), i(1), t("}") }),
  s("it",  { t("\\textit{"), i(1), t("}") }),
  s("txt", { t("\\text{"), i(1), t("}") }),

  s("inf", { t("\\infty") }),
  s("cd",  { t("\\cdot") }),

  -- ==========================================
  -- 6. AUTOMATIZACIÓN REGEX
  -- ==========================================
  
  s({ trig = "([a-zA-Z])(%d+)", regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      return snip.captures[1] .. "_{" .. snip.captures[2] .. "}"
    end)
  }),

  s({ trig = "([a-zA-Z])vv", regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      return "\\vec{" .. snip.captures[1] .. "}"
    end)
  }),



  -- ==========================================
  -- 7. PROBABILIDAD Y ESTADÍSTICA
  -- ==========================================
  
  s("fsig",  { t("\\mathcal{F}") }),
  s("prob",  { t("P("), i(1), t(")") }),
  s("P",     { t("\\mathbb{P}") }),
  s("EE",    { t("\\mathbb{E}["), i(1), t("]") }),
  s("Var",   { t("\\text{Var}("), i(1), t(")") }),
  s("cov",   { t("\\text{Cov}("), i(1), t(", "), i(2), t(")") }),
  
  s("espprob", {
    t("("), t("\\Omega, "), t("\\mathcal{F}, "), t("\\mathbb{P}"), t(")")
  }),

  s("va",    { t("X: \\Omega \\to "), i(1, "\\mathbb{R}") }),
  s("convp", { t("\\xrightarrow{P}") }),
  s("convd", { t("\\xrightarrow{d}") }),
  s("convas",{ t("\\xrightarrow{c.s.}") }),

  s("dist",  { t("\\sim "), i(1) }),
  s("normal",{ t("\\mathcal{N}("), i(1, "\\mu"), t(", "), i(2, "\\sigma^2"), t(")") }),
  s("binom", { t("\\text{Bin}("), i(1, "n"), t(", "), i(2, "p"), t(")") }),
  s("pois",  { t("\\text{Poisson}("), i(1, "\\lambda"), t(")") }),
  
  s("pc", {
    t("P("), i(1, "A"), t(" | "), i(2, "B"), t(")"), i(0)
  }),

  s("pdef", {
    t("P("), i(1, "A"), t(" | "), i(2, "B"), t(") = \\frac{P("), 
    rep(1), t(" \\cap "), rep(2), t(")}{P("), rep(2), t(")}"), i(0)
  }),

  s("bayes", {
    t("P("), i(1, "A_i"), t("|"), i(2, "B"), t(") = "),
    t("\\frac{P("), rep(2), t("|"), rep(1), t(")P("), rep(1), t(")}{\\sum_{j=1}^{n} P("), rep(2), t("|A_j)P(A_j)}"), i(0)
  }),

  s("fig", {
    t({ "\\begin{figure}[ht]", "    \\centering", "    \\incfig{" }),
    i(1, "nombre_de_la_figura"),
    t({ "}", "    \\caption{" }),
    i(2, "descripción"),
    t({ "}", "    \\label{fig:" }),
    f(function(args) return args[1][1]:gsub("%s+", "-"):lower() end, {1}),
    t({ "}", "\\end{figure}" }),
  }),
}
