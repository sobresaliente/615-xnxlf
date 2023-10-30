return {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
	dependencies = { 'nvim-lua/plenary.nvim'},
	config = function() 
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
		vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
		vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})
	end
}

