-- [[ plug.lua ]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    -- [[ Theme ]]
    use { 'mhinz/vim-startify' }
    use { 'DanilaMihailov/beacon.nvim' }
     --use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
    use {'Mofiqul/dracula.nvim'}
    
    -- Typst
    use {'kaarmu/typst.vim', ft = {'typst'}}

    -- Rust
    use 'rust-lang/rust.vim'

    -- Lualine
    use {'nvim-lualine/lualine.nvim',
            requires = {'nvim-tree/nvim-web-devicons', opt = true }
        }
end)

-- config = {
--  package_root = vim.fn.stdpath('config') .. '/site/pack'
-- }


