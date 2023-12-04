using Documenter, LibGit2, Pkg
using MultiDocumenter

clonedir = ("--temp" in ARGS) ? mktempdir() : joinpath(@__DIR__, "clones")
outpath = mktempdir()
@info """
Cloning packages into: $(clonedir)
Building aggregate site into: $(outpath)
"""

# Ordering Matters!
docsmodules = [
    "Core" => [
        "Ephemerides", "Tempo", "FrameTransformations"
    ]
]

external_urls = Dict()

docs = Any[
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, "Home"),
        path = "Overview",
        name = "Home",
        giturl = "https://github.com/JuliaSpaceMissionDesign/JSMDocs.jl.git")]

for group in docsmodules
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
                     sitemap = true,
                     canonical_domain="https://juliaspacemissiondesign.github.io",
                     search_engine = MultiDocumenter.SearchConfig(
                        index_versions = ["stable",],
                        engine = MultiDocumenter.FlexSearch))


if "deploy" in ARGS
    @warn "Deploying to GitHub" ARGS
    gitroot = normpath(joinpath(@__DIR__, ".."))
    run(`git pull`)
    outbranch = "gh-pages"
    has_outbranch = true
    run(`git checkout gh-pages`)
    # for file in readdir(gitroot; join = true)
    #     endswith(file, ".git") && continue
    #     rm(file; force = true, recursive = true)
    # end
    for file in readdir(outpath)
        cp(joinpath(outpath, file), joinpath(gitroot, file))
    end
    run(`git add .`)
    if success(`git commit -m 'Aggregate documentation'`)
        @info "Pushing updated documentation."
        if has_outbranch
            run(`git push`)
        else
            run(`git push -u origin $outbranch`)
        end
        run(`git checkout master`)
    else
        @info "No changes to aggregated documentation."
    end
else
    @info "Skipping deployment, 'deploy' not passed. Generated files in docs/out." ARGS
    cp(outpath, joinpath(@__DIR__, "out"), force = true)
end