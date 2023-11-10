using Documenter
using Pkg: Pkg

# Fix for https://github.com/trixi-framework/Trixi.jl/issues/668
# to allow building the docs locally
if (get(ENV, "CI", nothing) != "true") &&
   (get(ENV, "JULIA_DOC_DEFAULT_ENVIRONMENT", nothing) != "true")
    push!(LOAD_PATH, dirname(@__DIR__))
end

using TestPackage01

# Define module-wide setups such that the respective modules are available in doctests
DocMeta.setdocmeta!(TestPackage01,
                    :DocTestSetup, :(using TestPackage01); recursive = true)

# Copy some files from the top level directory to the docs and modify them
# as necessary
open(joinpath(@__DIR__, "src", "license.md"), "w") do io
    # Point to source license file
    println(io, """
    ```@meta
    EditURL = "https://github.com/fepaul-book/My-RSE-in-Julia.jl/blob/main/LICENSE.md"
    ```
    """)
    # Write the modified contents
    println(io, "# License")
    println(io, "")
    for line in eachline(joinpath(dirname(@__DIR__), "LICENSE"))
        line = replace(line, "[LICENSE.md](LICENSE.md)" => "[License](@ref)")
        println(io, "> ", line)
    end
end

# Make documentation
makedocs(modules = [TestPackage01],
         sitename = "My-RSE-in-Julia.jl",
         format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true",
                                  canonical = "https://fepaul-book.github.io/My-RSE-in-Julia.jl/stable"),
         # Explicitly specify documentation structure
         pages = [
             "Home" => "index.md",
             "API reference" => "api_reference.md",
             "License" => "license.md",
         ])

deploydocs(repo = "github.com/fepaul-book/My-RSE-in-Julia.jl",
           devbranch = "main",
           push_preview = true)