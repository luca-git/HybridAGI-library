// This program is based on https://github.com/AntonOsika/gpt-engineer
// MIT License Copyright (c) 2023 Anton Osika
CREATE
(start:Control {name:"Start"}),
(generate_spec:Action {name:"Generate the specification of the program", tool:"Predict", params:"
You are a super smart developer. You have been asked to make a specification for a program.
Think step by step to make sure we get a high quality specification and we don't miss anything.
First, be super explicit about what the program should do, which features it should have
and give details about anything that might be unclear. **Don't leave anything unclear or undefined.**

Second, lay out the names of the core classes, functions, methods that will be necessary,
as well as a quick comment on their purpose.

This specification will be used later as the basis for the implementation.
Specification:"}),
(review_spec:Action {name:"Review the specification", tool:"Predict", params:"
You are a pragmatic principal engineer at Google.
You have been asked to review a specification for a new feature

You have been asked to give feedback on the following:
- Is there anything that might not work the way intended by the instructions?
- Is there anything in the specification missing for the program to work as expected?
- Is there anything that can be simplified without significant drawback?

You are asked to make educated assumptions for each unclear item.
For each of these, communicate which assumptions you'll make when implementing the feature.

Think step by step to make sure we don't miss anything.
Review:"}),
(reiterate_spec:Action {name:"Reiterate the specification of the program", tool:"Predict", params:"Based on the specification Review, please reiterate the specification for the program. If things can be improved, please incorporate the improvements.\nSpecification:"}),
(is_satisfied_with_the_spec:Decision {name:"Check if you are satisfied with the specification", question:"Are you satisfied with the specification? Let's think this out in a step by step way to be sure we have the right answer"}),
(write_spec:Action {name:"Write the specification into a file for later use", tool:"WriteFile", params:"The name of the .txt file to save the specification followed by the double quoted final version of the specification, without punctuation between them.\nInput:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(generate_spec),
(generate_spec)-[:NEXT]->(review_spec),
(review_spec)-[:NEXT]->(reiterate_spec),
(reiterate_spec)-[:NEXT]->(is_satisfied_with_the_spec),
(is_satisfied_with_the_spec)-[:YES]->(write_spec),
(is_satisfied_with_the_spec)-[:NO]->(reiterate_spec),
(write_spec)-[:NEXT]->(end)