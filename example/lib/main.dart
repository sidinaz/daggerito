import 'package:example/app.dart';
import 'package:example/app/bootstrap/route_info.dart';
import 'package:example/minimal-app/minimal_app.dart';
import 'package:flutter/material.dart';

void main() {

//  Daggerito.configure(silent: true);

//  runApp(MinimalApp());

  runApp(
    App(
      initialUrl: RouteInfo(
//        "/public/",
//        "/public/create-user",
//        "/public/debug",
        "/app/home",
//        "/app/debug",
//        "/app/json",
//        "/app/books/",
//        "/app/books/add",
//        "/app/books/edit",
//        "/app/books/list/",
//          "/app/settings/"
      ),
    ),
  );

}
