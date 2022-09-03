import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notetake/style/app_style.dart';

Widget cardNote(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: AppStyle.cardsColor[doc['note_color_id']],
          borderRadius: BorderRadius.circular(8.0)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc['note_title'],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 4.0),
            Text(
              doc['date_creation'],
              style: AppStyle.dateTitle,
            ),
            const SizedBox(height: 8.0),
            Text(
              doc['note_content'],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
  );
}
