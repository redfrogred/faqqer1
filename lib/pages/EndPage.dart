// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../providers/global_provider.dart';
import '../pages/_AllPages.dart';

class EndPage extends StatefulWidget {
  const EndPage({ super.key });

  @override
  State createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {

  _EndPageState() {
    Utils.log('<<< ( EndPage.dart ) init >>>', 2, true );
  }

  // (this page) variables
  static const String _fileName = 'EndPage.dart';
  final TextEditingController _textController = TextEditingController();
  
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
    _textController.dispose();
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
                    child: Text( 'Pops: ${ context.watch<Global>().getPops() }' ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFdddddd),
                  child: Center(
                    child: Text( 'Clicks: ${ context.watch<Global>().getClicks() }' ),
                  ),
                ),
              ),               
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text( 'Fruit: ' ),
                      SizedBox(
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10,0,10,0),
                          child: TextFormField(
                            
                            controller: _textController,
                            decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,                              
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 3, color: Colors.blue),
                            )),                            
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Utils.log('( $_fileName ) (event) clicked "ENTER", value = "${ _textController.text } "');
                          context.read<Global>().setFruit( _textController.text );
                        },
                        // start of button appearance settings 
                        child: Text( 'ENTER' ),
                
                      ),
                    ],
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
                        Utils.log('( $_fileName ) (event) clicked "go back to StartPage()"');
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => StartPage())
                        );                
                      },
                      // start of button appearance settings 
                      child: Text( 'Go to StartPage()' ),
              
                    ),
                  ),
                ),
              ),                            
            ],
          ),
        ),
      ),
    );
  }
}