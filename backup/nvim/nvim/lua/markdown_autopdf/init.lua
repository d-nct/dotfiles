local M = {}

local markdown_autopdf_enabled = true

local function compile_markdown_to_pdf()
  if not markdown_autopdf_enabled then
    return
  end

  local filepath = vim.fn.expand("%:p")
  local filedir = vim.fn.expand("%:p:h")
  local filename = vim.fn.expand("%:t:r")
  local output_pdf = filedir .. "/" .. filename .. ".pdf"

  if vim.fn.expand("%:e") ~= "md" then
    return
  end

  local command = string.format("pandoc '%s' -o '%s' --pdf-engine=pdflatex", filepath, output_pdf)
  vim.fn.jobstart(command, { detach = true })

end

local function toggle_markdown_autopdf()
  markdown_autopdf_enabled = not markdown_autopdf_enabled
  if markdown_autopdf_enabled then
    print("Compilação automática de Markdown para PDF: ATIVADA")
  else
    print("Compilação automática de Markdown para PDF: DESATIVADA")
  end
end

function M.setup()
  local group = vim.api.nvim_create_augroup("MarkdownAutoPDF", { clear = true })

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = "*.md",
    callback = compile_markdown_to_pdf,
  })

  vim.api.nvim_create_user_command('ToggleMarkdownPDF', toggle_markdown_autopdf, {})

  vim.keymap.set("n", "<leader>tm", toggle_markdown_autopdf, { noremap = true, silent = true, desc = "Toggle Markdown Auto PDF" })
end

return M
