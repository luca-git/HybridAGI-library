CREATE
(start:Control {name:"Start"}),
(answer:Action {name:"Answer the given objective", tool:"Predict", params:"Answer in {language} to the given objective ignoring the previous Answer if any. Let's think this out in a step by step way to be sure we have the right answer.\nAnswer:"}),
(is_there_enought_answer:Decision {name:"Is there enought different answer to vote?", purpose:"Check the consitency of the Answer by predicting it multiple times to then vote for the best. Let's think this out in a step by step way to be sure we have the right answer."}),
(vote_for_best_answer:Action {name:"Vote for the best Answer", tool:"Predict", params:"Analyze the faulty logic of each Answer and pick the right one. Let's think this out in a step by step way to be sure we have the right answer.\nAnswer:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(answer),
(answer)-[:NEXT]->(is_there_enought_answer),
(is_there_enought_answer)-[:NO]->(answer),
(is_there_enought_answer)-[:YES]->(vote_for_best_answer),
(vote_for_best_answer)-[:NEXT]->(end)