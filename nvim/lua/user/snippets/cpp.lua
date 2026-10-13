local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  s("cp", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "#pragma GCC optimize(\"O3,unroll-loops\")",
      "#pragma GCC target(\"avx2,bmi,bmi2,lzcnt,popcnt\")",
      "",
      "using ll = long long;",
      "using pii = pair<int, int>;",
      "using vi = vector<int>;",
      "#define nl '\\n'",
      "",
      "void solve() {",
      "    ",
    }),
    i(1, "// escribe la solución aquí"),
    t({
      "",
      "}",
      "",
      "int main() {",
      "    ios_base::sync_with_stdio(false);",
      "    cin.tie(NULL);",
      "",
      "#ifndef ONLINE_JUDGE",
      "    freopen(\"input.txt\", \"r\", stdin);",
      "    freopen(\"output.txt\", \"w\", stdout);",
      "#endif",
      "",
      "    int t = 1;",
      "    cin >> t;",
      "    while (t--) {",
      "        solve();",
      "    }",
      "    return 0;",
      "}",
    }),
  }),
})
