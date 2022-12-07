local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- spell check
  -- b.code_actions.cspell,
  -- b.diagnostics.cspell,
  b.diagnostics.codespell,
  b.diagnostics.misspell,
  b.diagnostics.write_good,
  b.code_actions.proselint,

  -- webdev stuff
  b.diagnostics.eslint_d,
  b.code_actions.eslint_d,
  b.formatting.eslint_d,
  -- b.formatting.deno_fmt.with({
  --   	filetypes = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact" }, 
  -- }),
  -- TODO: install romejs if possible
  b.formatting.prettierd.with {
    filetypes = { "html", "markdown", "css" },
  },

  -- Lua
  b.formatting.stylua,

  -- rust
  b.formatting.rustfmt.with {
    extra_args = { "--edition", "2018" },
  },

  -- go
  b.diagnostics.revive,
  b.formatting.gofmt,

  -- proto buf
  b.diagnostics.protolint,
}

null_ls.setup {
  on_attach = function(client)
    -- format on save
    require("lsp-format").on_attach(client)
  end,
  sources = sources,
}
