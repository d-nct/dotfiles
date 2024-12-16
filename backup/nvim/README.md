# 📝 **Configuração do Neovim**

## 📦 **Resumo dos Plugins**

| **Plugin**               | **Descrição**                                                                                       |
|--------------------------|-----------------------------------------------------------------------------------------------------|
| **catppuccin**           | Tema elegante e personalizável para o Neovim.                                                       |
| **completions**          | Configuração de autocompletar com suporte a `nvim-cmp`.                                             |
| **gitsigns**             | Mostra informações de Git (adicionadas, modificadas, removidas) no gutter.                          |
| **lsp-config**           | Configurações do Language Server Protocol (LSP) para autocompletar e diagnósticos em tempo real.    |
| **neorg**                | Ferramenta para organização e anotações em Markdown/Org-mode.                                       |
| **neo-tree**             | Gerenciador de arquivos em árvore para navegação eficiente.                                         |
| **none-ls**              | Integração com ferramentas de linting e formatação como `null-ls`.                                  |
| **pandoc_autorender**    | Renderização automática de arquivos Markdown com Pandoc.                                            |
| **tagbar**               | Exibe uma barra lateral com uma lista de símbolos (funções, classes) do arquivo atual.              |
| **telescope**            | Ferramenta de busca e navegação avançada com interface amigável.                                    |
| **treesitter**           | Melhor destaque de sintaxe e parsing para várias linguagens.                                        |
| **vim-obsession**        | Plugin para gerenciar sessões do Neovim com facilidade.                                             |

## ⚙️ **Principais Comandos**

| **Modo** | **Comando**             | **Atalho**        | **Descrição**                                               | **Personalizado?** |
|:---------|:------------------------|:------------------|:------------------------------------------------------------|:------------------:|
| n        | `:NeoTreeShow`          |                   | Abre o gerenciador de arquivos **neo-tree**.                |                    |
| n        | `:Telescope find_files` |                   | Busca rápida por arquivos no projeto atual.                 |                    |
| n        | `:Telescope live_grep`  | `<leader>fg`      | Busca por texto dentro dos arquivos do projeto.             | X                  |
| n        |                         | `<leader>gf`      | Chama o formatter                                           | X                  |
| n        |                         | `C-p`             | fzf files                                                   | X                  |
| n        | `:TagbarToggle`         | `C-n`             | Abre/fecha a barra lateral com símbolos do código.          | X                  |
| n        |                         | `C-M`             | Abre/fecha diretórios na Tagbar.                            | X                  |
| n        | `:Gitsigns blame_line`  |                   | Mostra o autor da linha atual no Git.                       |                    |
| n        | `:LspInfo`              |                   | Mostra informações dos servidores LSP em execução.          |                    |
| n        | `:Neorg index`          |                   | Abre o índice principal do **neorg**.                       |                    |
| n        | `:Obsession`            | `<leader>g`       | Inicia uma nova sessão com o **vim-obsession**.             | X                  |
| n        |                         | `gq`              | Autoident                                                   |                    |
| n        |                         | `;`               | `:` (para executar comandos)                                | X                  |
| i        |                         | `jk`              | Sai do **Insert Mode**                                      | X                  |
| t        |                         | `<ESC>`           | Sai do **Terminal Mode**                                    | X                  |

## 🛠️ **Configurações Importantes**

- **Ativar destaque de sintaxe com `treesitter`**:
  ```lua
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "markdown", "python" },
    highlight = { enable = true }
  }
  ```

- **Configurar tema `catppuccin`**:
  ```lua
  require'catppuccin'.setup()
  vim.cmd 'colorscheme catppuccin'
  ```

## 📁 **Estrutura do Diretório**

```
.config/nvim/
├── init.lua
├── lazy-lock.json
├── lua
│   ├── plugins
│   │   ├── catppuccin.lua
│   │   ├── completions.lua
│   │   ├── gitsigns.lua
│   │   ├── lsp-config.lua
│   │   ├── neorg.lua
│   │   ├── neo-tree.lua
│   │   ├── none-ls.lua
│   │   ├── pandoc_autorender.lua
│   │   ├── tagbar.lua
│   │   ├── telescope.lua
│   │   ├── treesitter.lua
│   │   └── vim-obsession.lua
│   ├── plugins.lua
│   └── vim-options.lua
└── README.md
```

## 🚀 **Dicas de Uso**

- **Navegue facilmente** entre arquivos e símbolos com **`neo-tree`** e **`tagbar`**.
- **Busque tudo** com **`telescope`** usando comandos como `:Telescope find_files` e `:Telescope live_grep`.
- **Gerencie sessões** com **`vim-obsession`** para manter seu progresso salvo.
- **Aprimore sua escrita Markdown** com **`pandoc_autorender`** e pré-visualize com **`MarkdownPreview`**.
