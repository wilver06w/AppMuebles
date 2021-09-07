import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:storenike/Utils/constants.dart';
import 'package:storenike/models/product.dart';

class DetailsMuebles extends StatelessWidget {
  final Product product;

  DetailsMuebles({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          icon: SvgPicture.asset('assets/icons/back.svg'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          aAtras.toUpperCase(),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ProductPoster(
                    size: _size,
                    image: product.image,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ColorDot(
                        fillColor: Color(0xFF80989A),
                        isSelected: true,
                      ),
                      ColorDot(
                        fillColor: kSecondaryColor,
                      ),
                      ColorDot(
                        fillColor: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Text(
                    product.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Text(
                    product.description,
                    style: TextStyle(
                      color: kTextLightColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(kDefaultPadding),
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
            decoration: BoxDecoration(
              color: kColorAmarilloBoton,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/chat.svg'),
                SizedBox(width: kDefaultPadding / 2),
                Text(
                  cChat,
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                FlatButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/shopping-bag.svg',
                    height: 18,
                  ),
                  label: Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.fillColor,
    this.isSelected = false,
  }) : super(key: key);

  final Color fillColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
      padding: EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? fillColor : Colors.transparent,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
        ),
      ),
    );
  }
}

class ProductPoster extends StatelessWidget {
  const ProductPoster({
    Key? key,
    required Size size,
    required this.image,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: _size.width * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: _size.width * 0.7,
            width: _size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Hero(
            tag: image,
            child: Image.asset(
              image,
              width: _size.width * 0.7,
              height: _size.width * 0.7,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
