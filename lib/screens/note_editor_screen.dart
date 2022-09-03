import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notetake/style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  @override
  Widget build(BuildContext context) {
    int colorId = Random().nextInt(AppStyle.cardsColor.length);
    TextEditingController titleEditController = TextEditingController();
    TextEditingController contentEditController = TextEditingController();
    String date = DateTime.now().toString();
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[colorId],
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Add a new Note',
          style: TextStyle(color: Colors.black),
        ),
        titleSpacing: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleEditController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Note Title'),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 8.0),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: contentEditController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection('notes').add({
            'note_title': titleEditController.text,
            'date_creation': date,
            'note_content': contentEditController.text,
            'note_color_id': colorId
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print('Failed to add new Note due to $error'));
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
