import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/menu_item.dart';

import 'category_model.dart';




class Restaurant extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;


  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.tags,
    required this.menuItems,
  
    this.deliveryTime = 10,
    this.priceCategory = '\$',
    this.deliveryFee = 10,
    this.distance = 15,
  });

  

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      imageUrl,
      tags,
      menuItems,
      deliveryTime,
      priceCategory,
      deliveryFee,
      distance,
    ];

  
  }

static List<Restaurant> restaurants=[
  Restaurant(
    id: 1, 
    name: 'Bamboo', 
    description: 'so nice', 
    imageUrl: 'https://media.timeout.com/images/105846896/image.jpg', 
    menuItems: MenuItem.menuItems.where((menuItem) => menuItem.restaurantId == 1).toList(),
    deliveryTime: 30,
    deliveryFee: 2.99,
    distance: 0.1,
    tags: MenuItem.menuItems.where((menuItem) => menuItem.restaurantId == 1).map((menuItem) => menuItem.category).toSet().toList(), 
    ),
  Restaurant(
    id: 2, 
    name: 'Bamboo', 
    description: 'so nice', 
    imageUrl: 'https://media.timeout.com/images/105846896/image.jpg', 
    menuItems: MenuItem.menuItems.where((menuItem) => menuItem.restaurantId == 2).toList(),
    tags: MenuItem.menuItems.where((menuItem) => menuItem.restaurantId == 2).map((menuItem) => menuItem.category).toSet().toList(), 
    deliveryTime: 30,
    deliveryFee: 2.99,
    distance: 0.1,
    ),
  Restaurant(
    id: 3, 
    name: 'Bamboo', 
    description: 'so nice', 
    imageUrl: 'https://media.timeout.com/images/105846896/image.jpg', 
    menuItems: MenuItem.menuItems.where((menuItem) => menuItem.restaurantId == 3).toList(),
    tags: MenuItem.menuItems.where((menuItem) => menuItem.restaurantId == 3).map((menuItem) => menuItem.category).toSet().toList(),
    deliveryTime: 30,
    deliveryFee: 2.99,
    distance: 0.1,
    ),
    Restaurant(
    id: 4, 
    name: 'Bamboo', 
    description: 'so nice', 
    imageUrl: 'https://media.timeout.com/images/105846896/image.jpg', 
    menuItems: MenuItem.menuItems.where((menuItem) => menuItem.restaurantId == 4).toList(),
    tags: MenuItem.menuItems.where((menuItem) => menuItem.restaurantId == 4).map((menuItem) => menuItem.category).toSet().toList(), 
    deliveryTime: 30,
    deliveryFee: 2.99,
    distance: 0.1,
    )
];
}