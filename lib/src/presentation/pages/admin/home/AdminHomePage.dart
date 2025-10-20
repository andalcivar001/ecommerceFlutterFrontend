import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/AdminCategoryListPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/AdminProductLIstPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  AdminHomeBloc? _bloc;
  List<Widget> pageList = <Widget>[
    AdminCategoryListPage(),
    AdminProductListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminHomeBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      drawer: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Text(
                    'Menu de Administrador',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(color: Colors.blueAccent),
                ),
                ListTile(
                  title: Text('Categorias'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc?.add(AdminChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Productos'),
                  selected: state.pageIndex == 1,
                  onTap: () {
                    _bloc?.add(AdminChangeDrawerPage(pageIndex: 1));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Cerrar sesión'),
                  onTap: () {
                    _bloc?.add(AdminLogout());
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      'login',
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
    );
  }
}
