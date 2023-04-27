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
        i(1),
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
        })
})
