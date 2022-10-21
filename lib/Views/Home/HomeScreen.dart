import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Utility/CommandMethod.dart';
import '../Dashboard/Dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _permissionStatus;

  @override
  void initState() {
    _listenForPermissionStatus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: _onBackPressed, child: Scaffold(body: Dashboard()));
  }
  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit App'),
          actions: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: roundedButton("No", const Color(0xFF546E7A),
                  const Color(0xFFFFFFFF)),
            ),
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: roundedButton(" Yes ", const Color(0xFF546E7A),
                    const Color(0xFFFFFFFF)),
              ),
            ),
          ],
        )) ??
        false;
  }
  void _listenForPermissionStatus() async {
    var permission = Permission.storage;
    final status = await permission.request().isGranted;
    // setState() triggers build again
    setState(() {
      _permissionStatus = status;
    });
  }
}

