using JSMDocs
using Documenter

const CI = get(ENV, "CI", "false") == "true"

makedocs(;
    authors="Andrea Pasquale <andrea.pasquale@polimi.it> and Michele Ceresoli <michele.ceresoli@polimi.it>",
    sitename="Julia Space Mission Design",
    modules=[JSMDocs],
    format=Documenter.HTML(; 
        prettyurls=CI, 
        highlights=["yaml"], 
        assets=["assets/init.js"],
        ansicolor=true
    ),
    pages=[
        "Home" => "index.md",
        "Ecosystem" => [
            "Roadmap" => "ecosystem/roadmap.md"
        ],
        "Guidelines" => nothing,
        "Encyclopedia" => [
            "Models" => [
                "Time" => "encyclopedia/astro/time.md",
                "Frames" => "encyclopedia/astro/frames/index.md",
                "Gravity" => "encyclopedia/astro/gravity.md"
            ]
        ]
    ],
    clean=true,
)

deploydocs(;
    repo="github.com/JuliaSpaceMissionDesign/JSMDocs.jl", branch="gh-pages"
)