local M = {}

function M.import(module)
    package.loaded[module] = nil
    return require(module)
end

return M
