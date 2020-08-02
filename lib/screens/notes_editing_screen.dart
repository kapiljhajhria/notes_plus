import 'package:flutter/material.dart';
import 'package:notes_plus/modules/notes_class.dart';

class EditingNotes extends StatefulWidget {
  Note currNote;

  EditingNotes({Key key, this.currNote}) : super(key: key);

  @override
  _EditingNotesState createState() => _EditingNotesState();
}

class _EditingNotesState extends State<EditingNotes> {
  Note currNote;
  TextEditingController titleController;
  TextEditingController noteTextController;

  @override
  void initState() {
    currNote = widget.currNote;
    titleController = TextEditingController();
    noteTextController = TextEditingController();
    noteTextController.text = currNote.noteText;
    titleController.text = currNote.title;
//    noteTextController.text=currNote.noteText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
            title: Text(currNote.title),
            leading: IconButton(icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.pop(context, currNote),)
        ),
        body: TextField(
          onChanged: (val) {
            currNote.noteText = val;
            currNote.updateNote(val);
          },
          controller: noteTextController,

        ),
      ),
      onWillPop: () async {
        Navigator.pop(context, currNote);
        return false;
      },
    );
  }
}
