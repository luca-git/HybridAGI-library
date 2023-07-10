// This program is based on https://github.com/AntonOsika/gpt-engineer
// MIT License Copyright (c) 2023 Anton Osika
CREATE
(start:Control {name:"Start"}),
(summarize_philosophy:Action {name:"Summarize the coding philosophy", tool:"Predict", params:"Please summarize this text to show your understanding:
You almost always put different classes in different files.
For Python, you always create an appropriate requirements.txt file.
For NodeJS, you always create an appropriate package.json file.
You always add a comment briefly describing the purpose of the function definition.
You try to add comments explaining very complex bits of logic.
You always follow the best practices for the requested languages in terms of describing the code written as a defined
package/project.

Python toolbelt preferences:
- pytest
- dataclasses
Summary:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(summarize_philosophy),
(summarize_philosophy)-[:NEXT]->(end)