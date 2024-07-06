import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/note_model.dart';

class NoteView extends StatelessWidget {
  const NoteView(
      {super.key,
      required this.note,
      required this.index,
      required this.onNoteDeleted});

  final Note note;
  final int index;

  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Delete this?'),
                      content: Text('Note ${note.title} will be deleted'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              onNoteDeleted(index);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Delete')),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'))
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              note.note,
              style: const TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
