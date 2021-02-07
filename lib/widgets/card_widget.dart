import 'package:flutter/material.dart';

Widget buildIdeaCard(String imgPath, String desc, String uploadedFrom) => Card(
      color: Colors.white70,
      shadowColor: Colors.blueGrey,
      margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: NetworkImage(imgPath),
                height: 220,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                right: 16,
                left: 16,
                child: Text(
                  uploadedFrom,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              desc,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "OpenSans",
              ),
            ),
          ),
        ],
      ),
    );
