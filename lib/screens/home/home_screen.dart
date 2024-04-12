import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/shared/widgets/custom_action_chip.dart';
import 'package:food_delivery_app/shared/widgets/main_nav_bar.dart';
import 'package:food_delivery_app/shared/widgets/rating_model.dart';
import 'package:food_delivery_app/shared/widgets/restaurant_preview_card.dart';
import 'package:food_delivery_app/shared/widgets/section_title.dart';
import 'package:food_delivery_app/state/home/home_bloc.dart';

part '_home_food_categories.dart';
part '_home_restaurant_filters.dart';
part '_home_featured_restaurants.dart';
part '_home_popular_restaurants.dart';
part '_home_shops_nearby.dart';
part '_home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      bottomNavigationBar: const MainNavBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.initial ||
              state.status == HomeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == HomeStatus.loaded) {
            return const SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _FoodCategories(),
                  SizedBox(
                    height: 16.0,
                  ),
                  _RestaurantFilters(),
                  _FeaturedRestaurants(),
                  _ShopsNearby(),
                  _PopularRestaurants(),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Something went wrong!',
              ),
            );
          }
        },
      ),
    );
  }
}
