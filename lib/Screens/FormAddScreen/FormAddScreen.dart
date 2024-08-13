
import 'package:feesta/Models/RestaurantItemModel.dart';
import 'package:feesta/Providers/Homescreen/RestaurantItemProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormAddScreen extends StatefulWidget {
  const FormAddScreen({super.key});

  @override
  _FormAddScreenState createState() => _FormAddScreenState();
}

class _FormAddScreenState extends State<FormAddScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Food Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Add New Food Item',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).primaryColor)
            ),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.image),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final price = double.tryParse(priceController.text) ?? 0.0;
                final imageUrl = imageUrlController.text;

                if (title.isNotEmpty && price > 0 && imageUrl.isNotEmpty) {
                  final newFoodItem = RestaurantItem(
                    imageUrl: imageUrl,
                    title: title,
                    category: 'Category',
                    price: price,
                    deliveryTime: 30,
                    distance: 5,
                    rating: 4.5,
                    discountInfo: '10% off',
                    offerInfo: 'Free delivery',
                  );

                  final provider = Provider.of<RestaurantItemProvider>(context, listen: false);
                  provider.addFoodItem(newFoodItem);

                  Navigator.pop(context, provider.foodItems);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Add Food Item',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
