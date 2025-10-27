import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/ProfileUpdateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
  
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  ProfileUpdateBloc? _bloc;

  @override
  void initState() { // dispara una sola vez cuando la pantalla es mostrada.. es como el ngOnInit
    // TODO: implement initState
    super.initState();
    _bloc.add(ProfileUpdateInitEvent(user: user) )
  }

  @override
  Widget build(BuildContext context) { // se dispara despues del init y se dispara varias veces por ejm cada que se preciona ctrl + S
    _bloc = BlocProvider.of<ProfileUpdateBloc>(context);
    User? user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      body: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
        builder: (context, state) {
          return ProfileUpdateContent(_bloc, state, user);
        },
      ),
    );
  }
}
