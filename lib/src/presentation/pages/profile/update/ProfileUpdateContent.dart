import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

class ProfileUpdateContent extends StatelessWidget {
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;
  User? user;

  ProfileUpdateContent(this.bloc, this.state, this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _imageBackground(context),
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _imageProfile(),
                // Spacer(),
                _cardProfileInfo(context),
              ],
            ),
          ),
        ),
        DefaultIconBack(marginLeft: 15, marginTop: 50),
      ],
    );
  }

  Widget _cardProfileInfo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            _textFieldName(),
            _textFieldLastName(),
            _textFieldPhone(),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 10, top: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {},
                child: Icon(Icons.check, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Nombre',
        icon: Icons.person,
        //   errorText: snapshot.error?.toString(),
        onChanged: (text) {
          bloc?.add(ProfileUpdateNameChanged(name: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.name.error;
        },
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Apellido',
        icon: Icons.person_outline,
        //   errorText: snapshot.error?.toString(),
        onChanged: (text) {
          bloc?.add(
            ProfileUpdateLastNameChanged(lastName: BlocFormItem(value: text)),
          );
        },
        validator: (value) {
          return state.lastName.error;
        },
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Teléfono',
        icon: Icons.phone,
        //   errorText: snapshot.error?.toString(),
        onChanged: (text) {
          bloc?.add(
            ProfileUpdatePhoneChanged(phone: BlocFormItem(value: text)),
          );
        },
        validator: (value) {
          return state.phone.error;
        },
      ),
    );
  }

  Widget _imageProfile() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      width: 150,
      child: AspectRatio(
        aspectRatio: 1 / 1,

        child: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/img/user.png',
            image:
                'https://www.jeancoutu.com/globalassets/revamp/photo/conseils-photo/20160302-01-reseaux-sociaux-profil/photo-profil_301783868.jpg',

            fit: BoxFit.cover,
            fadeInDuration: Duration(seconds: 1),
          ),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background3.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
