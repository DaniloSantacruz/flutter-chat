import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:udemy2/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController = TextEditingController();
  final _focusnode = FocusNode();

  List<ChatMessage> _messages = [];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Column(
            children: [
              CircleAvatar(
                child: Text('Me',style: TextStyle(fontSize: 12),),
                backgroundColor: Colors.teal,
                maxRadius: 14,
              ),
              SizedBox(height:3),
              Text('Melisa Flores',style: TextStyle(color: Colors.black87,fontSize: 12),),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: _messages.length,
                    itemBuilder: (_,i) => _messages[i],
                  reverse: true,
                ),
            ),
            Divider(height: 1),
            ///TODO: Caja de texto
            Container(
              color: Colors.white,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat(){
 return SafeArea(
   child: Container(
     margin: EdgeInsets.symmetric(horizontal: 10.0),
     child: Row(
       children: [
         Flexible(
             child: TextField(
               controller: _textController ,
               onSubmitted: _handleSubmit,
               onChanged: (String texto){
                 setState(() {
                  if (texto.trim().length > 0){
                    _estaEscribiendo = true;
                  }else{
                    _estaEscribiendo = false;
                  }
                 });
               },
               decoration: InputDecoration.collapsed(
                   hintText: 'Enviar Mensaje'
               ),
               focusNode: _focusnode ,
             )
         ),
         Container(
           margin: EdgeInsets.symmetric(horizontal: 4.0),
           child:
           Platform.isIOS
               ? CupertinoButton(
               child: Text('Enviar'),
             onPressed: _estaEscribiendo
                 ? () => _handleSubmit (_textController.text.trim())
                 : null,
           )
           :Container(
             margin: EdgeInsets.symmetric(horizontal: 4.0),
             child: IconTheme(
               data: IconThemeData(color: Colors.teal),
               child: IconButton(
                 highlightColor: Colors.transparent,
                 splashColor: Colors.transparent,
                 icon: Icon(Icons.send),
                 onPressed: _estaEscribiendo
                 ? () => _handleSubmit (_textController.text.trim())
                     : null,
               ),
             ),

           ),
         )
       ],
     ),
   ),
 );
  }

  _handleSubmit (String texto){
    if (texto.length == 0) return;
 print(texto);
 _textController.clear();
 _focusnode.requestFocus();

 final newMessage = ChatMessage(
   uid: '123',
   texto: texto,
   animationController: AnimationController(
       vsync: this,
       duration: Duration(
           milliseconds: 200
       )
   ),
 );
 _messages.insert(0, newMessage);
 newMessage.animationController.forward();

 setState(() {
   _estaEscribiendo = false;
 });
  }

  @override
  void dispose() {
   for (ChatMessage message in _messages){
     message.animationController.dispose();
   }
    super.dispose();
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