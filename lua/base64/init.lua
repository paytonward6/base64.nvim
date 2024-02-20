local core = require("base64.core")
local algo = require("base64.algo")

local M = {}

local function shared_entrypoint(context, algorithm)
    core.base64(context.line1, context.line2, context.args, algorithm)
end

local function decode(context)
    shared_entrypoint(context, algo.decode)
end

local function encode(context)
    shared_entrypoint(context, algo.encode)
end

local function completion(line)
    local formats = {"yaml"}
    return vim.tbl_filter(function(val)
        return vim.startswith(val, line)
    end, formats)
end

function M.setup()
    vim.api.nvim_create_user_command("Base64Decode", decode, {
        nargs = "?",
        range = true,
        complete = completion
    })

    vim.api.nvim_create_user_command("Base64Encode", encode, {
        nargs = "?",
        range = true,
        complete = completion
    })
end

return M
