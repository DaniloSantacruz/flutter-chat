import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String titulo;
  final Function onpressed;

  const BotonAzul({
    Key key,
    @required this.titulo,
    @required this.onpressed
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child:  RaisedButton(
          elevation: 2,
          highlightElevation: 5,
          color: Colors.white,
          shape: StadiumBorder(),
          child: Container(
            width: double.infinity,
            height: 55,
            child: Center(
              child: Text(
                this.titulo,
                style: TextStyle(
                    fontSize: 17
                ),
              ),
            ),
          ),
          onPressed: this.onpressed,
      ),
    );
  }
}
