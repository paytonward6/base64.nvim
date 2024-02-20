local utils = require("base64.utils")

local M = {}

local function base64_line(line, format, algorithm)
    if format == "yaml" then
        local split_line  = utils.split(line, ":")
        local key = split_line[1]
        local value = vim.trim(split_line[2])

        local result = algorithm(value)

        return key .. ": " .. result
    else
        return algorithm(line)
    end
end

function M.base64(start, last, args, algorithm)
    local lines = vim.api.nvim_buf_get_lines(0, start-1, last, false)

    local to_output = {}
    for _, line in ipairs(lines) do
        table.insert(to_output, base64_line(line, args, algorithm))
    end
    vim.api.nvim_buf_set_lines(0, start-1, last, false, to_output)
end

return M
