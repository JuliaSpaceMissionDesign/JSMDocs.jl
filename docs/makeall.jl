using Documenter, LibGit2, Pkg
using MultiDocumenter

clonedir = ("--temp" in ARGS) ? mktempdir() : joinpath(@__DIR__, "clones")
outpath = mktempdir()
@info """
Cloning packages into: $(clonedir)
Building aggregate site into: $(outpath)
"""

external_urls = Dict()

# docs = Any[
#     MultiDocumenter.MultiDocRef(
#         upstream = joinpath(clonedir, "Home"),
#         path = "home",
#         name = "Home",
#         giturl = "https://github.com/JuliaSpaceMissionDesign/JSMDocs.jl.git")]

docs = Any[
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(@__DIR__,"build"), # if docs build this is the default 
        path = "home", # where to put that in the final out folder
        name = "Home", # menu entry
        fix_canonical_url = false, # this seems to fix the error from above, but since it is not documented I do not know what it does.
    )
]
# docs = Any[]

# Ordering Matters!
docsmodules = [
    "Core" => [
        "Ephemerides", "Tempo", "FrameTransformations"
    ]
]

for group in docsmodules
    @info "Creating documentation group $(group[1])"
    docgroups = []
    for pack in group[2]
        url = "https://github.com/JuliaSpaceMissionDesign/$pack.jl.git"
        push!(
            docgroups,
            MultiDocumenter.MultiDocRef(
                upstream=joinpath(clonedir, pack),
                path=pack, 
                name=pack, 
                giturl=url,
                branch="gh-pages"
            )
        )
    end
    push!(docs, MultiDocumenter.DropdownNav(group[1], docgroups))
end

outpath = joinpath(@__DIR__, "build")

MultiDocumenter.make(outpath, docs;
    assets_dir = "docs/src/assets",
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable"],
        engine = MultiDocumenter.FlexSearch
    ),
    rootpath = "/",
    canonical_domain = "https://juliaspacemissiondesign.github.io",
    sitemap = true,
)


if "deploy" in ARGS
    @warn "Deploying to GitHub" ARGS
    gitroot = normpath(joinpath(@__DIR__, ".."))
    run(`git pull`)
    outbranch = "gh-pages"
    run(`git checkout $outbranch`)
    run(`rm -rf Home`)

    for file in readdir(outpath)
        cp(joinpath(outpath, file), joinpath(gitroot, file), force=true)
    end
    run(`rm -rf docs`)
    run(`git add .`)
    if success(`git commit -m 'Aggregate documentation'`)
        @info "Pushing updated documentation."
        run(`git push`)
        run(`git checkout master`)
    else
        @info "No changes to aggregated documentation."
    end
else
    @info "Skipping deployment, 'deploy' not passed. Generated files in docs/out." ARGS
    cp(outpath, joinpath(@__DIR__, "out"), force = true)
end