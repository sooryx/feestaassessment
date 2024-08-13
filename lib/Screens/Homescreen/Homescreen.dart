import 'package:feesta/Constants/images.dart';
import 'package:feesta/Models/RestaurantItemModel.dart';
import 'package:feesta/Providers/Homescreen/RestaurantItemProvider.dart';
import 'package:feesta/Screens/FormAddScreen/FormAddScreen.dart';
import 'package:feesta/Widgets/RestaurantCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final restaurantItemProvider = context.read<RestaurantItemProvider>();
    _searchController.addListener(() {
      restaurantItemProvider.filterFoodItems(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(() {});
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildLocationInfo(),
        actions: [_buildUserInfo(context: context)],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => FormAddScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: _buildSearch(context: context),
          ),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildLocationInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AssetImages.locationIcon,
          height: 30.h,
          width: 30.w,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text('Home', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black,fontSize: 18.sp)),
            Text(
              '141, Sri Durga Nilaya Apartments...',
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUserInfo({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetImages.joinNOw),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(0.5),
              border: Border.all(width: 1, color: Colors.blue),
            ),
            child: Text(
              "S",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    final foodItemProvider = context.watch<RestaurantItemProvider>();
    final filteredItems = foodItemProvider.filteredRestaurantItems;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final restaurantItem = filteredItems[index];
        return RestaurantCard(restaurantItem: restaurantItem);
      },
    );
  }

  Widget _buildSearch({required BuildContext context}) {
    return TextField(
      controller: _searchController,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
        hintText: "Restaurant name or search....",
        hintStyle: TextStyle(color: Colors.red, fontSize: 14.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        suffixIcon: Icon(Icons.keyboard_voice_rounded,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
