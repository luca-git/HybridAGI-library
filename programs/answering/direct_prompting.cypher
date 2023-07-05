CREATE
(start:Control {name:"Start"}),
(answer:Action {name:"Answer the given Objective", tool:"Predict", params:"Please only Answer the Objective. Let's think this out in a step by step way to be sure we have the right answer. Remove any additionnal information.\nAnswer:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(answer),
(answer)-[:NEXT]->(end)