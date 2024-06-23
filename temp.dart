
import 'dart:convert';
import 'dart:io';





void read_json() async {
// Specify the path to the JSON file
  print('worked');
  String filePath = 'data1.json';

  // Read the file
  File file = File(filePath);

  try {
    // Read the file contents as a string
    String fileContents = await file.readAsString();

    // Decode the JSON string
    Map<String, dynamic> jsonData = jsonDecode(fileContents);

    // Print the JSON data
    print(jsonData);
  } catch (e) {
    // Handle any errors that might occur during file read or JSON decode
    print('Error reading or parsing the file: $e');
  }
}
