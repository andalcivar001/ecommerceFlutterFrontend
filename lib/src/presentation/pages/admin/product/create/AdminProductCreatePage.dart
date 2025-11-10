import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/AdminProductCreateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminProductCreatePage extends StatefulWidget {
  const AdminProductCreatePage({super.key});

  @override
  State<AdminProductCreatePage> createState() => _AdminProductCreatePageState();
}

class _AdminProductCreatePageState extends State<AdminProductCreatePage> {
  AdminProductCreateBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    // se inicializa la variable _bloc
    _bloc = BlocProvider.of<AdminProductCreateBloc>(context);
    return Scaffold(
      body: BlocListener<AdminProductCreateBloc, AdminProductCreateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            context.read<AdminCategoryListBloc>().add(
              AdminCategoryListGetCategory(),
            );
            _bloc?.add(AdminProductCreateResetForm());

            Fluttertoast.showToast(
              msg: 'La categoria fue creada correctamente',
              toastLength: Toast.LENGTH_LONG,
            );
          } else if (responseState is Error) {
            Fluttertoast.showToast(
              msg: responseState.message,
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
        child: BlocBuilder<AdminProductCreateBloc, AdminProductCreateState>(
          builder: (context, state) {
            return AdminProductCreateContent(_bloc, state);
          },
        ),
      ),
    );
  }
}
