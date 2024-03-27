using JSMDocs
using Documenter
using DocumenterCitations

bib = CitationBibliography(
    joinpath(@__DIR__, "src", "refs.bib");
    style=:numeric
)

const CI = get(ENV, "CI", "false") == "true"

makedocs(;
    authors="Andrea Pasquale <andrea.pasquale@polimi.it> and Michele Ceresoli <michele.ceresoli@polimi.it>",
    sitename="JSMD Documentation",
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
        "Encyclopedia" => [
            "Models" => [
                "Gravity" => [
                    "Spherical Harmonics" =>"encyclopedia/astro/gravity/harmonics.md"
                ]
            ],
            "References" => "references.md"
        ]
    ],
    clean=true,
    plugins=[bib, ]
)
