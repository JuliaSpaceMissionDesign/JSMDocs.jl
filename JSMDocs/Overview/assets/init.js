require.config({
    paths: {
        'mermaid': "https://cdnjs.cloudflare.com/ajax/libs/mermaid/9.1.6/mermaid",
    }
});

require(['mermaid'], function(mermaid) { 
    var config = {
        startOnLoad:true,
        htmlLabels:true,
        callback:function(id){
            console.log(id,' rendered');
        },
        flowchart:{
            useMaxWidth: true,
            maxWidth: 1000,
            width: 120,
        }
    };
    mermaid.initialize(config)});
