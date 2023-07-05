CREATE
(start:Control {name:"Start"}),
(print_working_dir:Action {name:"Print the current working directory", tool:"VirtualShell", params:"The 'pwd' command only.\nCommand:"}),
(list_current:Action {name:"List the current directory to look for the file", tool:"VirtualShell", params:"The ls command to list the current directory.\nCommand:"}),
(is_file_present:Decision {name:"Check the presence of the file", question:"Is the file present?"}),
(ask_folder:Action {name:"Ask where to find the file", tool:"AskUser", params:"Ask in {language} the folder location where to find the file\nQuestion:"}),
(list_folder:Action {name:"List the given folder to look for the file", tool:"VirtualShell", params:"The ls command to list the given directory\nCommand:"}),
(is_folder_present:Decision {name:"Check the presence of the folder", question:"Is the folder present?"}),
(get_absolute_path:Action {name:"Get the absolute path of the file", tool:"Predict", params:"The absolute path of the file.\nFile Absolute Path:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(print_working_dir),
(print_working_dir)-[:NEXT]->(list_current),
(list_current)-[:NEXT]->(is_file_present),
(is_file_present)-[:YES]->(get_absolute_path),
(is_file_present)-[:NO]->(ask_folder),
(ask_folder)-[:NEXT]->(list_folder),
(list_folder)-[:NEXT]->(is_file_present),
(get_absolute_path)-[:NEXT]->(end)

