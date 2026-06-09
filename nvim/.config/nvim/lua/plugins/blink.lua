return {
  {
    "Saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "none",

        ["<C-space>"] = { "show", "show_documentation", "hide" },
        ["<C-t>"] = { "hide" },

        ["<C-e>"] = { "accept", "fallback" }, -- Ctrl E accept suggest (like zsh auto suggest :v)
        ["<Tab>"] = { "select_next", "fallback" }, -- Tab next suggest
        ["<S-Tab>"] = { "select_prev", "fallback" }, -- Shift + Tab previous suggest
      },
    },
  },
}
