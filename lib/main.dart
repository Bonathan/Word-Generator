// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import'dart:convert';

void main() => runApp(MyApp());

String genText = (WordPair.random()).asPascalCase;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'Generator',
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: App(),
        ),
      );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          GeneratedText(),
          LikeButton(),
      ],
    );
  }
}


class GeneratedText extends StatefulWidget {
  @override
  _GeneratedTextState createState() => _GeneratedTextState();
}

class _GeneratedTextState extends State<GeneratedText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Text(
              genText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          NeumorphicButton(
            child: Text(
              "Generate",
              style: TextStyle(
                fontSize: 30,
                /*fontWeight: FontWeight.200,*/
              ),
            ),
            onPressed: () {
              setState(() {
                genText = (WordPair.random()).asPascalCase;
              }
              );
            },
            style: NeumorphicStyle(
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              depth: 4,
              lightSource: LightSource.topLeft,
              color: Colors.grey[300],
              surfaceIntensity: 0.1,
            ),
          ),
          /*RaisedButton(
            color: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text('Generate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w200)
            ),
            onPressed: () {
              setState(() {
                  genText = (WordPair.random()).asPascalCase;
                }
              );
            },
          )*/
        ],
      )
    );
  }
}

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 50),
      alignment: Alignment.bottomCenter,
      child: IconButton(
        icon: Icon(Icons.favorite_border),
        onPressed: () {},
      ),
    );
  }
}
