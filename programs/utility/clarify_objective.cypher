CREATE
(start:Control {name:"Start"}),
(ask_question:Action {name:"Ask question to clarify the Objective", tool:"AskUser", params:"Pick one question to clarify the Objective and ask it in {language}\nQuestion:"}),
(is_anything_unclear:Decision {name:"Find out if there is anything unclear in the Objective", question:"Is there still anything unclear in the Objective? Let's think this out in a step by step way to be sure we have the right answer"}),
(clarify:Action {name:"Clarify the given objective", tool:"Predict", params:"The refined Objective.\nObjective:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(is_anything_unclear),
(is_anything_unclear)-[:YES]->(ask_question),
(is_anything_unclear)-[:NO]->(clarify),
(ask_question)-[:NEXT]->(is_anything_unclear),
(clarify)-[:NEXT]->(end)