import 'package:flutter/material.dart';

SelectOpctionImageDialog(
  BuildContext context,
  Function() pickImage,
  Function() takePhoto,
) {
  return showDialog(
    context: context,
    builder:
        (BuildContext context) => AlertDialog(
          title: Text('Seleccione una opción'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                pickImage();
              },
              child: Text('Galeria', style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                takePhoto();
              },
              child: Text('Foto', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
  );
}
