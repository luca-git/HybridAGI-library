CREATE
(start:Control {name:"Start"}),
(answer:Action {name:"Answer the given objective", tool:"Predict", params:"Answer in {langugage} the objective given without additionnal information. Let's think this out in a step by step way to be sure we have the right answer.\nAnswer:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(answer),
(answer)-[:NEXT]->(end)