return {
	'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
	dependencies = {
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		{'L3MON4D3/LuaSnip'},
	},
	config = function()
		local lsp_zero = require('lsp-zero')
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({buffer = bufnr})
		end)
		lspconfig.lua_ls.setup({})
		lspconfig["html"].setup({
		  capabilities = capabilities,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
		  capabilities = capabilities,
		})

		-- configure css server
		lspconfig["cssls"].setup({
		  capabilities = capabilities,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
		  capabilities = capabilities,
		})


		lspconfig["prismals"].setup({
		  capabilities = capabilities,
		})

		lspconfig["emmet_ls"].setup({
		  capabilities = capabilities,
		  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})
		local cmp = require('cmp')
		local cmp_action = require('lsp-zero').cmp_action()

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				-- `Enter` key to confirm completion
				['<CR>'] = cmp.mapping.confirm({select = false}),

				-- Ctrl+Space to trigger completion menu
				['<C-Space>'] = cmp.mapping.complete(),

				-- Navigate between snippet placeholder
				['<C-f>'] = cmp_action.luasnip_jump_forward(),
				['<C-b>'] = cmp_action.luasnip_jump_backward(),

				-- Scroll up and down in the completion documentation
				['<C-u>'] = cmp.mapping.scroll_docs(-4),
				['<C-d>'] = cmp.mapping.scroll_docs(4),
			})
		})

	end
}
