import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/repositories/food_category_repository.dart';
import 'package:food_delivery_app/repositories/restaurant_repository.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';
import 'package:food_delivery_app/state/home/home_bloc.dart';

void main() {
  const foodCategoryRepository = FoodCategoryRepository();
  const restaurantRepository = RestaurantRepository();

  runApp(const APpScreen(
    foodCategoryRepository: foodCategoryRepository,
    restaurantRepository: restaurantRepository,
  ));
}

class APpScreen extends StatelessWidget {
  const APpScreen({
    super.key,
    required this.foodCategoryRepository,
    required this.restaurantRepository,
  });

  final FoodCategoryRepository foodCategoryRepository;
  final RestaurantRepository restaurantRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: foodCategoryRepository),
        RepositoryProvider.value(value: restaurantRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          // Global scope
          BlocProvider(
            create: (context) => HomeBloc(
              foodCategoryRepository: foodCategoryRepository,
              restaurantRepository: restaurantRepository,
            )..add(
                LoadHomeEvent(),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'Food Delivery app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
