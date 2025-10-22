import 'package:ecommerce_flutter/src/presentation/pages/profile/info/ProfileInfoContent.dart';
import 'package:flutter/material.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileInfoContent());
  }
}
