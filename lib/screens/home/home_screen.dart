import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/shared/widgets/custom_action_chip.dart';
import 'package:food_delivery_app/shared/widgets/rating_model.dart';
import 'package:food_delivery_app/state/home/home_bloc.dart';

part '_home_food_categories.dart';
part '_home_restaurant_filters.dart';

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
      appBar: AppBar(),
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
                  SizedBox(height: 16.0,),
                  _RestaurantFilters(),
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
