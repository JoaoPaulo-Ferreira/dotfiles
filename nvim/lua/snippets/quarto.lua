local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return (
    {
        -- s("pc", fmta([[
        -- ```{python}
        -- <>
        -- ```
        -- ]], {
        --     i(1)
        -- })),
        --

        s("qinit", fmta([[
        ---
        title: "<>"
        author: "Joao Paulo Soares"
        date: "<>"
        date-format: long
        format: html
        ---
        <>
        ]], {
            i(1),
            f(function() return os.date("%d %m %Y") end, {}, {}),
            i(0)
        }))
    }
)
