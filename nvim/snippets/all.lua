local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

local date = function() return {os.date("%A, %B %d, %Y")} end
local time = function() return {os.date("%X")} end

ls.add_snippets("all",
    {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	}),
    s("adj", {
        t({"466-0827"}),
        t({"", "名古屋市昭和区川名山町128 番地4　杁中住宅１棟33号"}),
    }),
    s("ad", {
        t({"Irinaka Jyutaku #1-33, Kawanayama-cho 128-4, Showa-ku,"}),
        t({"", "Nagoya, AICHI 4660827, Japan"}),
    }),
    s("ad_work", {
        t({"464-8601"}),
        t({"", "名古屋市千種区不老町510 環境総合館"}),
        t({"", "名古屋大学アジアサテライトキャンパス学院/環境学研究科"}),
        t({"", "富田晋介"}),
    }),
    s("yaml", {
        t({"---"}),
        t({"", "title: "}), i(1),
        t({"", "tags: #"}), i(2),
        t({"", "date: "}),
        f(date),
        t({"", "time: "}),
        f(time),
        t({"", "---", ""}),
        i(0)
    }),
    s("rc", {
        t({"```{r}", ""}),
        t({"#| label: "}), i(1),
        t({"", "#| eval: true", ""}),
        t({"#| echo: true", ""}),
        t({"#| warning: false", ""}),
        t({"#| error: true", ""}),
        t({"#| message: true", ""}),
        i(2),
        t({"", "```", ""}),
        i(0)
    }),
    s("yaml_paper", {
        t({"---"}),
        t({"", "title: "}), i(1),
        t({"", "bibliography: "}),
        t({"/home/tomishing/Dropbox/Workplace/bib/mylibrary.bib"}),
        t({"", "csl: "}),
        t({"/home/tomishing/Dropbox/Workplace/bib/ecology.csl"}),
        t({"", "---", ""}),
        i(0)
    }),
    s("signiture", {
        t({"Shinsuke Tomita"}),
        t({"", "ASCI/GSES, Nagoya University, Japan"}),
    }),
    s("r_head_ay", {
        t({"---"}),
        t({"", "title: "}), i(1),
        t({"", "tags: "}), i(2),
        t({"", "date: "}),
        f(date),
        t({"", "time: "}),
        f(time),
        t({"", "---", ""}),
        t({"", "# open terminal <lead>tg"}),
        t({"", "# open r <lead>rr"}),
        t({"","# send r command <lead>ff <lead>fa"}),
        t({"", "# Land transfer between predecessor and hair"}),
        t({"", "setwd(\"/home/tomishing/Dropbox/Workplace/ay\")"}),
        t({"", "load(\".RData\")"}),
        t({"", "## library"}),
        t({"", "library(tidyverse)"}),
        t({"", "## dataset"}),
        t({"", "#- b.d.mig.area: merge(birth.death.mig.e, hh.house.area)"}),
        t({"", "#- birth.death.mig.e: birth, death, migration history for a person"}),
        t({"", "#- birth.death: list of members appeared by 2019 with birth year, death year, biological parents, and adopted parents"}),
        t({"", "#- hh.house.area: landholding history for a household"}),
        t({"", "#- land.base: original file for land events"}),
        t({"", "#- land.events.area: land events for a person"}),
        t({"", "#- land.hh.events: land events for a household"}),
        t({"", "#- relation.list"}),
        t({"", "#- land.relation"}),
        t({"", "#- land.shape.r: this is updated data for land. Newer than land.base."}, ""),
    }),
    s("qmd_yaml", {
        t({"---"}),
        t({"", "title: "}),
        t({"", "format: "}),
        t({"", "editor: "}),
        t({"", "---", ""}),
    }),
    s("temp_html", {
        t({"<!DOCTYPE html>"}),
        t({"", "<html lang=\"en\">"}),
        t({"", "    <head>"}),
        t({"", "        <meta charset=\"UTF-8\">"}),
        t({"", "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"}),
        t({"", "        <title>Document</title>"}),
        t({"", "        <link href=\"*.css\" rel=\"stylesheet\">"}),
        t({"", "        <script src=\"*.js\" defer></script>"}),
        t({"", "    </head>"}),
        t({"", "    <body>"}),
        t({"", "        <header>"}),
        t({"", "            <h1>Welcome to My Website</h1>"}),
        t({"", "        </header>"}),
        t({"", "        <main>"}),
        t({"", "            <p>This is the main content of the page.</p>"}),
        t({"", "        </main>"}),
        t({"", "        <footer>"}),
        t({"", "            <p>&copy; 2024 My Website. All Rights Reserved.</p>"}),
        t({"", "        </footer>"}),
        t({"", "    </body>"}),
        t({"", "</html>"}),
    }),
})
