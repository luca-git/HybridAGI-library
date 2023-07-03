CREATE
(start:Control {name:"Start"}),
(answer:Action {name:"Answer the given objective", tool:"Predict", params:"Answer the given objective without additionnal information. Let's think this out in a step by step way to be sure we have the right answer.\nAnswer:"}),
(is_the_answer_right:Decision {name:"Is the answer right?", purpose:"Check if the Answer is correct considering the given objective. Let's think this out in a step by step way to be sure we have the right answer."}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(answer),
(answer)-[:NEXT]->(is_the_answer_right),
(is_the_answer_right)-[:NO]->(answer),
(is_the_answer_right)-[:YES]->(end)