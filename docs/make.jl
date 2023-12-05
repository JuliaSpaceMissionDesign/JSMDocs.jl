using JSMDocs
using Documenter

const CI = get(ENV, "CI", "false") == "true"

makedocs(;
    authors="Andrea Pasquale <andrea.pasquale@polimi.it> and Michele Ceresoli <michele.ceresoli@polimi.it>",
    sitename="JSMD Docs",
    modules=[JSMDocs],
    format=Documenter.HTML(; 
        prettyurls=CI, 
        highlights=["yaml"], 
        assets=["assets/init.js"],
        ansicolor=true
    ),
    pages=[
        "index.md",
        "Ecosystem" => [
            "Mission" => "ecosystem/mission.md"
        ],
        # "Guidelines" => nothing,
        # "Encyclopedia" => [
        #     "Models" => [
        #         "Time" => "encyclopedia/astro/time.md",
        #         "Frames" => "encyclopedia/astro/frames/index.md",
        #         "Gravity" => "encyclopedia/astro/gravity/index.md"
        #     ]
        # ]
    ],
    clean=true,
)
