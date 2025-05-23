return {
  dir = "~/.config/nvim/lua/markdown_autopdf",  -- Caminho do plugin local
  config = function()
    require("markdown_autopdf").setup()
  end,
}
