import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text controller
  final TextEditingController textController = TextEditingController();

  // Open dialog box to add a note
  void openNoteBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Note'),
        content: TextField(
          decoration: InputDecoration(hintText: 'Enter your note'),
          controller: textController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Add a new note
              FirestoreService().addNote(textController.text);
              // Clear the text controller
              textController.clear();
              // Close the box
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CrudWK"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNoteBox(context), // Call openNoteBox with context
        child: const Icon(Icons.add),
      ),
    );
  }
}
