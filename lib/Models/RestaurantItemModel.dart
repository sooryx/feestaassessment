class RestaurantItem{
  final String imageUrl;
  final String title;
  final String category;
  final double price;
  final int deliveryTime;
  final double distance;
  final double rating;
  final String discountInfo;
  final String offerInfo;

  RestaurantItem(
      {required this.imageUrl,
      required this.title,
      required this.category,
      required this.price,
      required this.deliveryTime,
      required this.distance,
      required this.rating,
      required this.discountInfo,
      required this.offerInfo});
}