import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:udemy2/models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(uid: '1',nombre: 'Juan Carlos',email: 'test1@gmail.com',onLine: true),
    Usuario(uid: '2',nombre: 'Maritzas',email: 'test2@gmail.com',onLine: true),
    Usuario(uid: '3',nombre: 'Adriana',email: 'test3@gmail.com',onLine: false),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Mi Nombre',style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app,color: Colors.black87,),
          onPressed: (){},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle,color: Colors.teal,),
            //child: Icon(Icons.offline_bolt,color: Colors.red,),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon(Icons.check,color: Colors.teal,),
          waterDropColor: Colors.teal,
        ),
        child: _ListViewUsuarios(),
      )
    );
  }

  ListView _ListViewUsuarios() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_,i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_,i) => Divider(),
        itemCount: usuarios.length
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
          title: Text(
            usuario.nombre,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text(usuario.email),
          leading: CircleAvatar(
            child: Text(
              usuario.nombre.substring(0,2),
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            backgroundColor: Colors.teal,
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: usuario.onLine ? Colors.teal : Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        );
  }

  _cargarUsuarios() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
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
///