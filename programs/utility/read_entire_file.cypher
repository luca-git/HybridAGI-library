CREATE
(start:Control {name:"Start"}),
(read_file:Action {name:"Read the given file (multiple times to scroll)", tool:"ReadFile", params:"The path of the file to read.\nFile to Read:"}),
(is_the_file_ended:Decision {name:"Is the file entirely read?", purpose:"Check if the file have been read entirely. If you find [...] at the end it means no."}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(read_file),
(read_file)-[:NEXT]->(is_the_file_ended),
(is_the_file_ended)-[:NO]->(read_file),
(is_the_file_ended)-[:YES]->(end)