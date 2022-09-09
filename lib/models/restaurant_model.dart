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
    menuItems: MenuItem.menuItems.where((menuItems) => menuItems.restaurantId == 1).toList(),
    deliveryTime: 30,
    deliveryFee: 2.99,
    distance: 0.1,
    tags: ['achu', 'fufu', 'meat'], 
    ),
  Restaurant(
    id: 2, 
    name: 'Bamboo', 
    description: 'so nice', 
    imageUrl: 'https://media.timeout.com/images/105846896/image.jpg', 
    menuItems: MenuItem.menuItems.where((menuItems) => menuItems.restaurantId == 2).toList(),
    tags: ['achu', 'fufu', 'meat'], 
    deliveryTime: 30,
    deliveryFee: 2.99,
    distance: 0.1,
    ),
  Restaurant(
    id: 3, 
    name: 'Bamboo', 
    description: 'so nice', 
    imageUrl: 'https://media.timeout.com/images/105846896/image.jpg', 
    menuItems: MenuItem.menuItems.where((menuItems) => menuItems.restaurantId == 3).toList(),
    tags: ['achu', 'fufu', 'meat'], 
    deliveryTime: 30,
    deliveryFee: 2.99,
    distance: 0.1,
    ),
    Restaurant(
    id: 3, 
    name: 'Bamboo', 
    description: 'so nice', 
    imageUrl: 'https://media.timeout.com/images/105846896/image.jpg', 
    menuItems: MenuItem.menuItems.where((menuItems) => menuItems.restaurantId == 3).toList(),
    tags: ['achu', 'fufu', 'meat'], 
    deliveryTime: 30,
    deliveryFee: 2.99,
    distance: 0.1,
    )
];
}