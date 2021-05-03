import 'package:flutter/material.dart';
class Labels extends StatelessWidget {
  final String ruta;
  final String titulo;
  final String subtutulo;

  const Labels({

    Key key,
    @required  this.ruta,
    @required this.titulo,
    @required this.subtutulo

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.titulo,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w300
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            child: Text(this.subtutulo,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
            onTap: (){
             Navigator.pushReplacementNamed(context, this.ruta);
            },
          ),
        ],
      ),
    );
  }
}