import 'dart:async';

import 'package:flutter/material.dart';
import 'package:googleads/screens/authenticate/sign_in.dart';
class Wrapper extends StatefulWidget {
  const Wrapper({Key? key ,required this.title}) : super(key: key);
  final String title;
  @override
  _WrapperState createState() => _WrapperState();
}
class _WrapperState extends State<Wrapper> {
  bool _isVisible = false ;
  _WrapperState(){
    new Timer(const Duration(milliseconds: 2000) , (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SignIn()) ,(route)=>false) ;
      });
    }) ;

    new Timer(
      Duration(milliseconds: 10),() {
        setState(() {
          _isVisible = true ;
        });}  ) ;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: new BoxDecoration(
gradient: new LinearGradient(colors: [Theme.of(context).accentColor,Theme.of(context).primaryColor],
begin: const FractionalOffset(0, 0),
  end: const FractionalOffset(1.0, 0.0) ,
  stops: [0.0 , 1.0],
  tileMode: TileMode.clamp ,
),
      ),
      child : AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140.0 ,
            width: 140.0,
            child: Center(
              child: ClipOval(
                child : Icon(Icons.train , size:128,)
              )
            ),
              decoration: BoxDecoration(
              shape: BoxShape.circle,
            color : Colors.white ,
            boxShadow :[
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 2.0 ,
                offset : Offset(5.0, 3.0) ,
                spreadRadius: 2.0,
              )

            ]
          ),
          )
        )
      )
    );
  }
}
