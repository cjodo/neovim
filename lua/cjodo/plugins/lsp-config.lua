-- Neovim 0.11+ LSP configuration (no lspconfig.setup)

------------------------------------------------------------
-- Capabilities
------------------------------------------------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
	"cssls",
	"emmet_language_server",
	"html",
	"lua_ls",
	"gopls",
	"ts_ls",
	"astro",
	"yamlls",
	"mdx_analyzer",
	"rust_analyzer",
	"protols",
	"buf_ls",
	"bashls",
	"intelephense"
}

------------------------------------------------------------
-- LSP Attach (replaces on_attach)
------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf

		local nmap = function(keys, func, desc)
			if desc then desc = "LSP: " .. desc end
			vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
		end

		nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

		nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

		nmap("K", vim.lsp.buf.hover, "Hover Documentation")
		nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

		nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
			vim.lsp.buf.format()
		end, { desc = "Format current buffer with LSP" })
	end,
})

------------------------------------------------------------
-- Mason
------------------------------------------------------------
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

------------------------------------------------------------
-- LSP Server Configs (vim.lsp.config)
------------------------------------------------------------

-- Emmet
vim.lsp.config.emmet_language_server = {
	capabilities = capabilities,
	filetypes = {
		"js",
		"css",
		"html",
		"javascriptreact",
		"typescriptreact",
		"php",
		"templ",
		"astro",
	},
	init_options = {
		syntaxProfiles = {
			javascript = "jsx",
		},
	},
}

-- TypeScript
vim.lsp.config.ts_ls = {
	capabilities = capabilities,
	root_dir = vim.fs.root(0, { "package.json" }),
	single_file_support = false,
}

-- PHP (Intelephense)
vim.lsp.config.intelephense = {
	capabilities = capabilities,
	filetypes = { "php" },
	root_dir = function()
		return vim.loop.cwd()
	end,
}

-- Lua
vim.lsp.config.lua_ls = {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

vim.lsp.config['cssls']= {
	capabilities = capabilities,
	filetypes = {
		"astro",
	}
}

vim.lsp.config['astro']= {
	capabilities = capabilities,
	filetypes = {
		"astro",
	}
}

-- vim.lsp.config['astro-language-server']()

vim.lsp.enable(servers)

------------------------------------------------------------
-- Return empty table for lazy.nvim
------------------------------------------------------------
return {}

