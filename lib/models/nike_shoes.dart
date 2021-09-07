class NikeShoes {
  NikeShoes(this.model, this.oldPrice, this.currentPrice, this.images,
      this.modelNumber, this.color);

  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;
}

final shoes = <NikeShoes>[
  NikeShoes(
    'AIR MAX 90 EZ BLACK',
    149,
    299,
    [
      'assets/images/shoes1_1.png',
      'assets/images/shoes1_2.png',
      'assets/images/shoes1_3.png'
    ],
    90,
    0xFFF6F6F6,
  ),
  NikeShoes(
    'AIR MAX 270 Gold',
    199,
    349,
    [
      'assets/images/shoes2_1.png',
      'assets/images/shoes2_2.png',
      'assets/images/shoes2_3.png'
    ],
    270,
    0xFFFCF5E,
  ),
  NikeShoes(
    'AIR MAX 95 EZ Red',
    299,
    399,
    [
      'assets/images/shoes3_1.png',
      'assets/images/shoes3_2.png',
      'assets/images/shoes3_3.png'
    ],
    95,
    0xFFFEEFEF,
  ),
  NikeShoes(
    'AIR MAX 98',
    149,
    299,
    [
      'assets/images/shoes4_1.png',
      'assets/images/shoes4_2.png',
      'assets/images/shoes4_3.png'
    ],
    98,
    0xFFEDF3FE,
  ),
];
