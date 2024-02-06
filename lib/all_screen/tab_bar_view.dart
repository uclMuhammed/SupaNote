import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/decoration/box_decoration.dart';

FutureBuilder<List<Map<String, dynamic>>> noteScreeView(
    PostgrestFilterBuilder<List<Map<String, dynamic>>> _future) {
  return FutureBuilder<List<Map<String, dynamic>>>(
    future: _future,
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      final myNotes = snapshot.data!.toList();
      return GridView.count(
        crossAxisCount: 2,
        children: myNotes
            .map(
              (note) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: noteCardDecoration(),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              note['title'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              note['contents'],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  note['time']
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
                      Checkbox(value: note['checkbox'], onChanged: (value) {}),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      );
    },
  );
}
