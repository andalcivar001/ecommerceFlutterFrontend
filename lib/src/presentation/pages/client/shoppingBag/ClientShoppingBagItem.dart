import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:flutter/material.dart';

class ClientShoppingBagItem extends StatelessWidget {
  ClientShoppingBagBloc? bloc;
  ClientShoppingBagState? state;
  Product? product;

  ClientShoppingBagItem(this.bloc, this.state, this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      // height: 80,
      child: Row(
        children: [
          _imageProduct(),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textProduct(),
              SizedBox(height: 5),
              _actionAddAndSubstract(),
            ],
          ),
          Spacer(),
          Column(children: [_textPrice(), _iconRemove()]),
        ],
      ),
    );
  }

  Widget _imageProduct() {
    return product != null
        ? Container(
          width: 70,
          child:
              product!.image1!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image: product!.image1!,
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  )
                  : Container(),
        )
        : Image.asset('assets/img/no-image.png', width: 80);
  }

  Widget _textProduct() {
    return Container(
      width: 185,
      child: Text(
        product?.name ?? 'Título del producto',
        // overflow:  TextOverflow.ellipsis, // si el texto es muy largo lo corta con ...
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textPrice() {
    return product != null
        ? Text(
          '\$${product!.price * product!.quantity!}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        )
        : Container();
  }

  Widget _iconRemove() {
    return IconButton(
      onPressed: () {
        bloc?.add(RemoveItemClientShoppingBag(product: product!));
      },
      icon: Icon(Icons.delete, color: Colors.red),
    );
  }

  Widget _actionAddAndSubstract() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            bloc?.add(SubstractClientShoppingBag(product: product!));
          },
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Text('-', style: TextStyle(fontSize: 20)),
          ),
        ),
        Container(
          width: 35,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: Text(
            product?.quantity.toString() ?? '',
            style: TextStyle(fontSize: 20),
          ),
        ),
        GestureDetector(
          onTap: () {
            bloc?.add(AddItemClientShoppingBag(product: product!));
          },
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Text('+', style: TextStyle(fontSize: 20)),
          ),
        ),
      ],
    );
  }
}
