import 'package:flutter/material.dart';

import 'package:udemy2/widgets/boton_azul.dart';
import 'package:udemy2/widgets/custom_input.dart';
import 'package:udemy2/widgets/labels.dart';
import 'package:udemy2/widgets/logo.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Registro',),
                _Form(),
                Labels(
                  ruta: 'login',
                  titulo: 'Ya tienes cuenta ?',
                  subtutulo: 'Ingresa ahora',

                ),
                Text('Terminos y condiciones de uso'),
                SizedBox(height: 1,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomImput(
            icono: Icons.person,
            textoAtras: 'Nombre',
            tipoTeclado: TextInputType.name,
            controlTexto:nameCtrl ,
          ),
          CustomImput(
            icono: Icons.mail_outline,
            textoAtras: 'Correo',
            tipoTeclado: TextInputType.emailAddress,
            controlTexto:emailCtrl ,
          ),
          CustomImput(
            icono: Icons.lock_outline,
            textoAtras: 'Contraseña',
            tipoTeclado: TextInputType.text,
            controlTexto: passCtrl ,
            password: true,
          ),

          BotonAzul(
            titulo: 'Ingrese',
            onpressed: (){
              print(emailCtrl.text);
              print(passCtrl.text);
            },
          ),


        ],
      ),
    );
  }
}



