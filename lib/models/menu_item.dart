import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  const MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        price,
      ];

  static List<MenuItem> menuItems = [
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 2,
      restaurantId: 1,
      name: '4 Formaggi',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 3,
      restaurantId: 1,
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
   
    
  ];
}