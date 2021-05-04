import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    Key key,
    @required this.texto,
    @required this.uid,
    @required this.animationController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: animationController ,
            curve: Curves.easeOut
        ),
        child: Container(
          child: this.uid == '123'
          ? _myMessage()
          : _notMyMessage(),
        ),
      ),
    );
  }

  _myMessage(){
  return Align(
    alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          bottom: 5,
            left: 50,
           right: 5
        ),
        child: Text(this.texto,style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
            color: Colors.teal,
                borderRadius: BorderRadius.circular(20)
        ),
        
      )
  );
  }

  _notMyMessage(){
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.only(
              bottom: 5,
              left: 5,
              right: 50
          ),
          child: Text(this.texto,style: TextStyle(color: Colors.black),),
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(20)
          ),

        )
    );
  }

}
///
///
///
///
///
///
///
///
///
///
///
///
///