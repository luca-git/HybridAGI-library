CREATE
(start:Control {name:"Start"}),
// Generate the specification using tree of thought prompting
(generate_spec:Action {name:"Generate the specification of the program", tool:"Predict", params:"
Imagine three different experts are writing the specification of the program.
All experts will write down 1 step of their thinking, then share it with the group.
Then all experts will go on to the next step, etc.
If any expert realises they're wrong at any point then they leave.
Experts Reasoning:"}),
// Review the specification
(review_spec:Action {name:"Review the specification", tool:"Predict", params:"
Imagine that you are a pragmatic principal engineer at Google.
You have been asked to review the experts specification

You have been asked to give feedback on the following:
- Is there anything that might not work the way intended by the instructions?
- Is there anything in the specification missing for the program to work as expected?
- Is there anything that can be simplified without significant drawback?

You are asked to make educated assumptions for each unclear item.
For each of these, communicate which assumptions you'll make when implementing the feature.

Think step by step to make sure we don't miss anything.
Review:"}),
// Reiterate the specification
(reiterate_spec:Action {name:"Reiterate the specification of the program", tool:"Predict", params:"
Based on the above conversation, please reiterate the specification for the program.
If things can be improved, please incorporate the improvements.
Remove any additionnal information.
Specification:"}),
// Tell the User about the specification
(tell_spec:Action {name:"Tell the specification to the User", tool:"Speak", params:"The specification in {language}.\nSpecification:"}),
// Ask if the user is satisfied
(ask_if_satisfied:Action {name:"Ask the User if they are satisfied with the specification", tool:"AskUser", params:"Ask the User if they are satisfied with the specification in {language}.\nQuestion:"}),
(is_satisfied:Decision {name:"Check if the User is satified with the specification", question:"Is the User satisfied with the specification? Let's think this out in a step by step way to be sure we have the right answer"}),
// Ask a Review from the User
(ask_review:Action {name:"Ask the User to Review the specification", tool:"AskUser", params:"Ask the User to Review the specification in {language}.\nQuestion:"}),
// Write down the specification for later use
(write_spec:Action {name:"Write the specification into a file for later use", tool:"WriteFile", params:"
The .txt file of the specification using the following format:
FILENAME
```LANG
CONTENT
```

Where the following tokens must be replaced such that:
FILENAME is the lowercase file name including the file extension.
LANG is the language of the file's content and CONTENT is the content.
Input:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(generate_spec),
(generate_spec)-[:NEXT]->(review_spec),
(review_spec)-[:NEXT]->(reiterate_spec),
(reiterate_spec)-[:NEXT]->(tell_spec),
(tell_spec)-[:NEXT]->(ask_if_satisfied),
(ask_if_satisfied)-[:NEXT]->(is_satisfied),
(is_satisfied)-[:YES]->(write_spec),
(is_satisfied)-[:NO]->(ask_review),
(ask_review)-[:NEXT]->(reiterate_spec),
(write_spec)-[:NEXT]->(end)