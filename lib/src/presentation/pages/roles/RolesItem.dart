import 'package:ecommerce_flutter/src/domain/models/Role.dart';
import 'package:flutter/material.dart';

class RolesItem extends StatelessWidget {
  Role role;
  RolesItem(this.role);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // convierte la imagen en clic
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          role.route,
          (route) => false,
        );
      },
      child: Column(
        children: [
          Container(
            height: 100,
            child: FadeInImage(
              fit: BoxFit.contain,
              image: NetworkImage(role.image),
              fadeInDuration: Duration(seconds: 2),
              placeholder: AssetImage(
                'assets/img/no-image.png',
              ), // esto en caso que la imagen de la url ya no retorne o no funcione
            ),
          ),
          Text(
            role.name,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
