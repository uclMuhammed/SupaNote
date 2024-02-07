import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/constructor/note_constructo.dart';
import '../core/decoration/box_decoration.dart';

class NoteScreenView extends StatefulWidget {
  const NoteScreenView({super.key});

  @override
  State<NoteScreenView> createState() => _NoteScreenViewState();
}

final future = Supabase.instance.client;

class _NoteScreenViewState extends State<NoteScreenView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: future.from('noteapp').select(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var myNotes = snapshot.data!.toList();

        return GridView.count(
          crossAxisCount: 2,
          children: myNotes
              .map(
                (note) => (Map<String, dynamic> note) {
                  var noteList = Note(
                      checkbox: note['checkbox'],
                      id: note['id'],
                      time: note['time'],
                      title: note['title'],
                      contents: note['contents'],
                      noteid: note['noteid'],
                      favorite: note['favorite'],
                      password: note["password"]);

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        debugPrint(noteList.checkbox.toString());
                      },
                      onLongPress: () async {
                        if (noteList.checkbox == false) {
                          await future.from('noteapp').update({
                            'checkbox': noteList.checkbox = true
                          }).eq('id', noteList.id.toString());
                          setState(() {
                            note['checkbox'] == true;
                          });
                        } else {
                          await future.from('noteapp').update({
                            'checkbox': noteList.checkbox = false
                          }).eq('id', noteList.id.toString());
                          setState(() {
                            note['checkbox'] == false;
                          });
                        }
                      },
                      child: Container(
                        decoration: noteCardDecoration(),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    noteList.title.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    noteList.contents.toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        noteList.time
                                            .toString()
                                            .replaceRange(16, null, "")
                                            .replaceAll(RegExp(r'T'), ' - '),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                            Checkbox(
                                value: noteList.checkbox,
                                onChanged: (value) async {
                                  setState(() {
                                    noteList.checkbox = value;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  );
                }(note),
              )
              .toList(),
        );
      },
    );
  }
}
