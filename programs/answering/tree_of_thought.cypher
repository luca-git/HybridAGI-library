// Program based on Tree-Of-Thought-Prompting and Chain-Of-Thought techniques
// more information on: https://github.com/dave1010/tree-of-thought-prompting
CREATE
(start:Control {name:"Start"}),
(deliberate_answer:Action {name:"Imagine experts answering the Objective", tool:"Predict", params:"
Please imagine three different experts are answering the Objective.
All experts will write down 1 step of their thinking, then share it with the group.
Then all experts will go on to the next step, etc.
If any expert realises they're wrong at any point then they leave.
Experts Reasoning:"}),
(answer:Action {name:"Answer the Objective", tool:"Predict", params:"
Based on the above conversation, please answer the Objective.
Remove any additionnal information.
Answer:"}),
(is_the_answer_right:Decision {name:"Check if the Answer is correct", question:"Is the answer correct? Let's think this out in a step by step way to be sure we have the right answer."}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(deliberate_answer),
(deliberate_answer)-[:NEXT]->(answer),
(answer)-[:NEXT]->(is_the_answer_right),
(is_the_answer_right)-[:NO]->(deliberate_answer),
(is_the_answer_right)-[:YES]->(end)