import 'package:flutter/material.dart';
import 'package:storenike/NikeShoesDetails/nike_shoes_details.dart';
import 'package:storenike/models/nike_shoes.dart';

class InicioShoesStore extends StatelessWidget {
  Future<void> onShoesPressed(
      NikeShoes nikeShoesItem, BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 900),
        pageBuilder: (context, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: NikeShoesDetails(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/nikelogo.png',
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: shoes.length,
                    itemBuilder: (context, index) {
                      final shoesItems = shoes[index];
                      return NikeShoesItem(
                        shoesItem: shoesItems,
                        press: () {
                          onShoesPressed(shoesItems, context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: kToolbarHeight,
            duration: Duration(milliseconds: 600),
            child: Container(
              // color: Colors.red,
              color: Colors.white.withOpacity(
                0.7,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.home_outlined,
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.favorite_border,
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(
                          'assets/images/nikelogo.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NikeShoesItem extends StatelessWidget {
  final NikeShoes shoesItem;
  final VoidCallback press;

  NikeShoesItem({Key? key, required this.shoesItem, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 290.0;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Color(shoesItem.color),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: itemHeight * 0.65,
                  child: FittedBox(
                    child: Text(
                      shoesItem.modelNumber.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black12.withOpacity(0.04),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 100,
                child: Image.asset(
                  shoesItem.images.first,
                  height: itemHeight * 0.65,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      shoesItem.model,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${shoesItem.oldPrice.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${shoesItem.currentPrice.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
