local ls = require("luasnip") -- Import the LuaSnip module
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Javascript
ls.add_snippets("javascript", {
    -- log for console.log()
    s("log", {
        t("console.log("),
        i(1, "message"),
        t(");"),
    }),
})
