import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterResponse extends StatelessWidget {
  RegisterBlocCubit? bloc;

  RegisterResponse(this.bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc?.responseStream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        if (state is Loading) {
          print('LOADING....');
          return Center(child: CircularProgressIndicator(color: Colors.red));
        } else if (state is Error) {
          Fluttertoast.showToast(
            msg: state.message,
            toastLength: Toast.LENGTH_LONG,
          );
        } else if (state is Success) {
          Fluttertoast.showToast(
            msg: 'Registro exitoso',
            toastLength: Toast.LENGTH_LONG,
          );
        }
        return Container();
      },
    );
  }
}
