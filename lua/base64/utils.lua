local M = {}

function M.split(line, delim)
    local init = vim.fn.split(line, delim)
    local key = init[1]
    local value = ""
    if #init > 2 then
        table.remove(init, 1)
        value = vim.fn.join(init, delim)
    else
        value = init[2]
    end
    return {key, value}
end

return M
