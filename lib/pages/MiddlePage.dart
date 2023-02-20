// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../providers/global_provider.dart';
import '../pages/_AllPages.dart';

class MiddlePage extends StatefulWidget {
  const MiddlePage({ super.key });

  @override
  State createState() => _MiddlePageState();
}

class _MiddlePageState extends State<MiddlePage> {

  _MiddlePageState() {
    Utils.log('<<< ( MiddlePage.dart ) init >>>', 2, true );
  }

  // (this page) variables
  static const String _fileName = 'MiddlePage.dart';
  
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
        context.read<Global>().incrementPop();
        return true;    // true allows back button (false denies)
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text( _fileName ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFeeeeee),
                  child: Center(
                    //  see: https://www.youtube.com/watch?v=Mk3nsf3wTIs
                    //  old way:
                    //  child: Text( 'Pops: ${ context.watch<Global>().getPops() }' ),
                    //  new way:
                    child: Text( 'Pops: ${ Provider.of<Global>(context).getPops() } '),

                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFdddddd),
                  child: Center(
                    //  see: https://www.youtube.com/watch?v=Mk3nsf3wTIs
                    //  old way:
                    //  child: Text( 'Pops: ${ context.watch<Global>().getClicks() }' ),
                    //  new way:
                    //  child: Text( 'Pops: ${ Provider.of<Global>(context).getClicks() } '),
                    //  even newer way!
                    //  see: https://stackoverflow.com/questions/58774301/when-to-use-provider-ofx-vs-consumerx-in-flutter
                    child: Consumer<Global>(
                      builder: ( context, _, __ ) { 
                        return Text( 'Clicks: ${ Config.clicks.toString() }' );
                      },
                    ),
                  ),
                ),
              ),           
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFeeeeee),
                  child: Center(
                    child: Text( 'Fruit: ${ context.watch<Global>().getFruit() }' ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Utils.log('( $_fileName ) (event) clicked "go to EndPage()"');
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => EndPage())
                        );                
                      },
                      // start of button appearance settings 
                      child: Text( 'Go to EndPage()' ),
              
                    ),
                  ),
                ),
              ),                            
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Utils.log('( $_fileName ) (event) clicked FloatingActionButton');
              //  old way:
              //  context.read<Global>().incrementClick();          
              //  new way:
              Provider.of<Global>(context, listen: false).incrementClick();
            },
          ),
        ),
      ),
    );
  }
}