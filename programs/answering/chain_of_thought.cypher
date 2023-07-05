CREATE
(start:Control {name:"Start"}),
(answer:Action {name:"Answer the given Objective", tool:"Predict", params:"Please only Answer the Objective. Let's think this out in a step by step way to be sure we have the right answer. Remove any additionnal information.\nAnswer:"}),
(is_the_answer_right:Decision {name:"Check if the Answer is correct", question:"Is the answer correct?"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(answer),
(answer)-[:NEXT]->(is_the_answer_right),
(is_the_answer_right)-[:NO]->(answer),
(is_the_answer_right)-[:YES]->(end)