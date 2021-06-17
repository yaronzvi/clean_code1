import 'package:first_proj/data/model/Restaurant/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:first_proj/utils/size_config.dart';

import '../home_states_events.dart';

class RestaurantsListView extends StatelessWidget {
  final BaseHomeState state;

  const RestaurantsListView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state.runtimeType) {
      case LoadingState:
        return _circularProgress();
      case RestaurantsListResult:
        final restaurants = (state as RestaurantsListResult).restaurants;
        return _restaurantsListView(restaurants);
      case ErrorState:
        final message = (state as ErrorState).message;
        return _errorState(message);
      default: //will be InitialState
        return _firstTime();
    }
  }

  Widget _firstTime() {
    return Center(
      child: Text(
          "Please press at the top button to load Restaurants Restaurants :)"),
    );
  }

  Widget _errorState(String? message) {
    return Text(
      message ?? "Failed load Restaurants",
      style: TextStyle(color: Colors.red),
    );
  }

  Widget _circularProgress() {
    return Center(
      child: SizedBox(
          height: SizeConfig.screenHeight / 5,
          width: SizeConfig.screenHeight / 5,
          child: CircularProgressIndicator()),
    );
  }

  Widget _restaurantsListView(List<Restaurant> restaurants) {
    return ListView.separated(
      itemCount: restaurants.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,
      ),
      itemBuilder: (context, index) => _restaurantItem(restaurants[index]),
    );
  }

  Widget _restaurantItem(Restaurant restaurant) {
    return ListTile(
      leading: Icon(Icons.account_box_rounded),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(restaurant.id.toString()),
          Text("${restaurant.name}"),
          Text("${restaurant.address}"),
          Text("${restaurant.description}"),
          Text("${restaurant.remarks}"),
        ],
      ),
    );
  }
}
