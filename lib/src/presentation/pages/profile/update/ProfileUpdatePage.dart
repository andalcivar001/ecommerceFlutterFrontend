import 'package:ecommerce_flutter/src/presentation/pages/profile/update/ProfileUpdateContent.dart';
import 'package:flutter/material.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileUpdateContent(null));
  }
}
