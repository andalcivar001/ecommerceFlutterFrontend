import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ClientProductDetailContent extends StatelessWidget {
  Product? product;

  ClientProductDetailContent(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _imageSlideShow(),
        _textName(),
        _textDescription(),
        _textPrice(),
      ],
    );
  }

  Widget _textName() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 30),
      child: Text(
        product?.name ?? '',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 15),
      child: Text(
        product?.description ?? '',
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }

  Widget _textPrice() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 15),
      child: Text(
        'Precio:  ${product?.price.toString() ?? ''}',
        style: TextStyle(
          fontSize: 17,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //ImageSlideshow ... carrousel de imagenes
  Widget _imageSlideShow() {
    return ImageSlideshow(
      /// Width of the [ImageSlideshow].
      width: double.infinity,

      /// Height of the [ImageSlideshow].
      height: 300,

      ///  imagen que inicializa
      initialPage: 0,

      /// The color to paint the indicator.
      indicatorColor: Colors.blue,

      /// The color to paint behind th indicator.
      indicatorBackgroundColor: Colors.grey,

      /// The widgets to display in the [ImageSlideshow].
      /// Add the sample image file into the images folder
      children: [
        product!.image1!.isNotEmpty
            ? FadeInImage.assetNetwork(
              placeholder: 'assets/img/user_image.png',
              image: product!.image1!,
              fit: BoxFit.cover,
              fadeInDuration: Duration(seconds: 1),
            )
            : Container(),
        product!.image2!.isNotEmpty
            ? FadeInImage.assetNetwork(
              placeholder: 'assets/img/user_image.png',
              image: product!.image2!,
              fit: BoxFit.cover,
              fadeInDuration: Duration(seconds: 1),
            )
            : Container(),
      ],

      /// Called whenever the page in the center of the viewport changes.
      onPageChanged: (value) {
        print('Page changed: $value');
      },

      // esto indica cuanto tiempo se van a cambiar las imagenes
      /// Auto scroll interval.
      /// Do not auto scroll with null or 0.
      autoPlayInterval: 5000,

      // para que gire automaticamente
      isLoop: true,
    );
  }
}
