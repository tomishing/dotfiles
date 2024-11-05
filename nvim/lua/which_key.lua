-- Whichkey

local wk = require('which-key')
wk.add({
    { "<leader>bz", desc = "Fuzzy search buffers" },
    { "<leader>fa", desc = "Send visual lines in R" },
    { "<leader>ff", desc = "Send current line in R" },
    { "<leader>fz", desc = "Fuzzy search files" },
    { "<leader>rd", desc = "Toggle R horizontally" },
    { "<leader>rr", desc = "Toggle R vertically" },
    { "<leader>de", desc = "Open the sessions list" },
    { "<leader>dq", desc = "Save and close the session" },
    { "<leader>td", desc = "Toggle horizontal terminal" },
    { "<leader>tt", desc = "Markdown Table" },
    { "<leader>tv", desc = "Toggle vertical terminal" },
    { "K", desc = "lsp hover" },
    { "[d", desc = "lsp diagnostic goto" },
    { "[e", desc = "lsp goto ERROR" },
    { "[h", desc = "lsp goto HINT" },
    { "[i", desc = "lsp goto INFO " },
    { "[w", desc = "lsp goto WARN" },
    { "]d", desc = "lsp diagnostic goto" },
    { "]e", desc = "lsp goto ERROR" },
    { "]h", desc = "lsp goto HINT " },
    { "]i", desc = "lsp goto INFO" },
    { "]w", desc = "lsp goto WARN" },
    { "gf", desc = "lsp formatting" },
})
