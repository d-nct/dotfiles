-- Configuração para rodar pandoc ao salvar arquivos Markdown
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*_autorender.md", -- Aplicar apenas a arquivos .md
    callback = function()
        local file = vim.fn.expand("<afile>") -- Caminho do arquivo salvo
        local output = file:gsub("%.md$", ".pdf") -- Substituir .md por .pdf
        local command = string.format("pandoc %s -o %s --pdf-engine=pdflatex", file, output)
        vim.fn.system(command) -- Executar o comando
        -- print("Renderizado: " .. output)
    end,
})

