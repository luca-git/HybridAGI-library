CREATE
(start:Control {name:"Start"}),
(is_about_making_a_software:Decision {name:"Check if the objective is about making a software", question:"Is the Objective about making a software?"}),
(write_software:Program {name:"Write the software based on the Objective", program:"program:write_software"}),
(clarify_objective:Program {name:"Clarify the Objective given by the User by asking questions", program:"program:clarify_objective"}),
(choose_difficulty:Decision {name:"Choose the most relevant difficulty to answer the objective", question:"Please choose the best suited difficulty level"}),
(tree_of_thought:Program {name:"Answer logical question using a tree of thought prompting", program:"program:tree_of_thought"}),
(chain_of_thought:Program {name:"Answer difficult question using a chain of thought", program:"program:chain_of_thought"}),
(direct_prompting:Program {name:"Answer simple question using direct prompting", program:"program:direct_prompting"}),
(tell_user_to_contribute:Decision {name:"Tell the User to contribute to HybridAGI-library because you couldn't satisfy the Objective.", tool:"Speak", params:"
Ask in {language} the User to contribute to HybridAGI-library: A library of graph based prompt programs for HybridAGI.
github: https://github.com/SynaLinks/HybridAGI-library
"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(clarify_objective),
(clarify_objective)-[:NEXT]->(is_about_making_a_software),
(is_about_making_a_software)-[:YES]->(write_software),
(is_about_making_a_software)-[:NO]->(choose_difficulty),
(choose_difficulty)-[:DIFFICULT_QUESTION]->(chain_of_thought),
(choose_difficulty)-[:LOGICAL_QUESTION]->(tree_of_thought),
(choose_difficulty)-[:IMPOSSIBLE_QUESTION]->(tell_user_to_contribute),
(choose_difficulty)-[:SIMPLE_QUESTION]->(direct_prompting),
(chain_of_thought)-[:NEXT]->(end),
(direct_prompting)-[:NEXT]->(end),
(write_software)-[:NEXT]->(end),
(tell_user_to_contribute)-[:NEXT]->(end)