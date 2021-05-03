import 'package:flutter/material.dart';

class CustomImput extends StatelessWidget {
  final IconData icono;
  final String textoAtras;
  final TextEditingController controlTexto;
  final TextInputType tipoTeclado;
  final bool password;

  const CustomImput({
    Key key,
   @required this.icono,
   @required this.textoAtras,
    this.controlTexto,
    this.tipoTeclado = TextInputType.text,
    this.password = false
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
             padding: EdgeInsets.only(top: 5,bottom: 5,right: 20,left: 5),
             margin: EdgeInsets.only(bottom: 20),
             decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0,5),
                  blurRadius: 5,
                ),
              ]
          ),
          child: TextField(
            controller: this.controlTexto,
            autocorrect: false,
            keyboardType: this.tipoTeclado,
            obscureText: this.password,
            decoration: InputDecoration(
              prefixIcon: Icon(this.icono),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.textoAtras,
            ),
          ),
        );

  }
}
