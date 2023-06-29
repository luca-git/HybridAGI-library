CREATE
(start:Control {name:"Start"}),
(ask_question:Action {name:"Ask question to clarify the objective", tool:"AskUser", params:"Pick one question to clarify the objective and ask it in {language}\nQuestion:"}),
(is_anything_unclear:Decision {name:"Is there anything unclear in the objective?", purpose:"Find out if there is anything unclear in the objective. Let's think this out in a step by step way to be sure we have the right answer."}),
(clarify:Action {name:"Clarify the given objective", tool:"Predict", params:"The clarified objective.\Objective:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(ask_question),
(ask_question)-[:NEXT]->(is_anything_unclear),
(is_anything_unclear)-[:MAYBE]->(ask_question),
(is_anything_unclear)-[:YES]->(ask_question),
(is_anything_unclear)-[:NO]->(clarify),
(clarify)-[:NEXT]->(end)