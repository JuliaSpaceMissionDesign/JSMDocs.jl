using Documenter, LibGit2, Pkg
using MultiDocumenter

include("make.jl")

clonedir = ("--temp" in ARGS) ? mktempdir() : joinpath(@__DIR__, "clones")
outpath = mktempdir()
@info """
Cloning packages into: $(clonedir)
Building aggregate site into: $(outpath)
"""

external_urls = Dict()

docs = Any[
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(@__DIR__,"build"),  
        path = "Home",
        name = "Home", 
        giturl = "", 
        branch = "", 
        fix_canonical_url = false, 
    )
]

# Ordering Matters!
docsmodules = [
    "Core" => [
        "Ephemerides", 
        "Tempo", 
        "FrameTransformations",
        "CalcephEphemeris"
    ]
    "Developer Tools" => 
    [
        "JSMDInterfaces", 
        "JSMDUtils",
        "SMDGraphs"
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
    custom_scripts = [
        "https://www.googletagmanager.com/gtag/js?id=G-K7LNGMSXLE",
        Docs.HTML("""
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-K7LNGMSXLE');
        """),
    ],
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