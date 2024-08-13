
import 'package:feesta/Models/RestaurantItemModel.dart';
import 'package:flutter/foundation.dart';

class RestaurantItemProvider with ChangeNotifier {
  final List<RestaurantItem> _foodItems = [
    RestaurantItem(
      imageUrl: 'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg',
      title: 'Burger',
      category: 'Fast Food',
      price: 5.99,
      deliveryTime: 15,
      distance: 2,
      rating: 4.7,
      discountInfo: '15% off',
      offerInfo: 'Buy 1 Get 1',
    ),
    RestaurantItem(
      imageUrl: 'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
      title: 'Cheese Pizza',
      category: 'Pizza',
      price: 8.99,
      deliveryTime: 20,
      distance: 4,
      rating: 4.8,
      discountInfo: '20% off',
      offerInfo: 'Free Drink',
    ),
  ];

  List<RestaurantItem> _filteredRestaurantItems = [];

  List<RestaurantItem> get foodItems => _foodItems;

  List<RestaurantItem> get filteredRestaurantItems => _filteredRestaurantItems.isEmpty
      ? _foodItems
      : _filteredRestaurantItems;

  RestaurantItemProvider() {
    _filteredRestaurantItems = _foodItems;
  }

  void addFoodItem(RestaurantItem foodItem) {
    _foodItems.add(foodItem);
    _filteredRestaurantItems = _foodItems;
    notifyListeners();
  }

  void filterFoodItems(String query) {
    if (query.isEmpty) {
      _filteredRestaurantItems = _foodItems;
    } else {
      _filteredRestaurantItems = _foodItems.where((foodItem) {
        return foodItem.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
