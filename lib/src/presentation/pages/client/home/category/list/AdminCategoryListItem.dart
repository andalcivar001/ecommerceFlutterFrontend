import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/category/list/bloc/ClientCategoryListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/category/list/bloc/ClientCategoryListEvent.dart';
import 'package:flutter/material.dart';

class ClientCategoryListItem extends StatelessWidget {
  ClientCategoryListBloc? bloc;
  Category? category;
  ClientCategoryListItem(this.bloc, this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   'client/product/list',
        //   arguments: category,
        // );
      },
      child: Card(
        child: Column(
          children: [
            category != null
                 ? Conta  iner(
                  width: 70,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image: category!.image!,
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
                )
                : Container(),
          ],
        ),
      )
    );
  }
}
