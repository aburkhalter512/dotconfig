require('mason').setup({
    registries = {
        "github:mason-org/mason-registry"
    }
})

local registry = require('mason-registry')
registry.refresh()

local function setup_package(package_name)
    local pkg = registry.get_package('helm-ls')
    if (not pkg:is_installed()) then
        pkg:install()
    end
end

setup_package('helm-ls')


