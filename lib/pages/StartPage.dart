// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../providers/global_provider.dart';
import '../pages/_AllPages.dart';

class StartPage extends StatefulWidget {
  const StartPage({ super.key });

  @override
  State createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  _StartPageState() {
    Utils.log('<<< ( StartPage.dart ) init >>>', 2, true );
  }

  // (this page) variables
  static const String _fileName = 'StartPage.dart';
  
  // (this page) init and dispose
  @override
  void initState() {
    super.initState();
    Utils.log('( $_fileName ) initState()');
    WidgetsBinding.instance.addPostFrameCallback((_) => _addPostFrameCallbackTriggered(context));
  }

  @override
  void dispose() {
    Utils.log('( $_fileName ) dispose()');
    super.dispose();
  }

  // (this page) methods
  void _buildTriggered() {
    Utils.log('( $_fileName ) _buildTriggered()');
  }
  
  void _addPostFrameCallbackTriggered( context ) {
    Utils.log('( $_fileName ) _addPostFrameCallbackTriggered()');
  }

  // (this page) build
  @override
  Widget build(BuildContext context) {

    _buildTriggered();

    return WillPopScope(
      onWillPop: () async {
        Utils.log('( $_fileName ) WillPopScope() triggered');
        return true;    // true allows back button (false denies)
      },
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                floating: true,
                snap: true,
                title: Text('FAQQER'),
                centerTitle: true,
                automaticallyImplyLeading: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                      Text('SLIVER', style: TextStyle(fontSize: 600)),
                      
                  ]
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  child: Text(' I am Drawer'),
                  curve: SawTooth(12),
                ),
              ],
            ),
          ),          
        ),
      ),
    );
  }
}