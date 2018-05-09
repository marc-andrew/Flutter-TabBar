// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// Pages
import './pages/tabpageone.dart';
import './pages/tabpagetwo.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyTabs()
  ));
}

class MyTabs extends StatefulWidget {
  @override
  MyApp createState() => new MyApp();
}

class MyApp extends State<MyTabs> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
          iconSize: 30.0,
          color: Colors.white,
          disabledColor: Colors.white,
        ),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Account',
            iconSize: 30.0,
            color: Colors.white,
            disabledColor: Colors.white,
          ),
        ],
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(text: 'Tab 1'),
            new Tab(text: 'Tab 2'),
          ],
          // indicatorSize: TabBarIndicatorSize.label,
          // indicatorWeight: 2.0,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          // unselectedLabelColor: Colors.grey,
          // indicator: new BoxDecoration(color: Colors.pink),
        ),
        elevation: 1.0,
        backgroundColor: Color.fromARGB(255, 204, 204, 204),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new TabPageOne(),
          new TabPageTwo(),
        ],
      ),
    );
  }
}