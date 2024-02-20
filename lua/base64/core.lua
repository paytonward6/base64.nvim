local utils = require("base64.utils")

local M = {}

local function build_command(line, mode)
    local command = "echo -n ".. vim.fn.shellescape(line) .. " | base64"

    if mode ==  "decode" then
        command = command .. " -d"
    end
    return command
end

local function base64_line(line, format, mode)
    if format == "yaml" then
        local split_line  = utils.split(line, ":")
        local key = split_line[1]
        local value = vim.trim(split_line[2])

        local command = build_command(value, mode)

        local result = vim.fn.system(command)
        return key .. ": " .. vim.trim(result)
    else
        local command = build_command(vim.trim(line), mode)
        local result = vim.fn.system(command)
        return vim.trim(result)
    end
end

function M.base64(start, last, args, mode)
    local lines = vim.api.nvim_buf_get_lines(0, start-1, last, false)

    local to_output = {}
    for _, line in ipairs(lines) do
        table.insert(to_output, base64_line(line, args, mode))
    end
    vim.api.nvim_buf_set_lines(0, start-1, last, false, to_output)
end

return M
