import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int index;

  static var prices;

  Price({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.index,
  });

  @override
  List<Object?> get props => [id, name, description, imageUrl, index];

  factory Price.fromSnapshot(Map<String, dynamic> snap) {
    return Price(
      id: snap['id'].toString(),
      name: snap['name'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      index: snap['index'],
    );
  }

  static List<Price> categories = [
    Price(
      id: '1',
      name: 'Drinks',
      description: 'This is a test description',
      imageUrl: 'assets/juice.png',
      index: 0,
    ),
    Price(
      id: '2',
      name: 'Pizza',
      description: 'This is a test description',
      imageUrl: 'assets/pizza.png',
      index: 1,
    ),
    Price(
      id: '3',
      name: 'Burgers',
      description: 'This is a test description',
      imageUrl: 'assets/burger.png',
      index: 2,
    ),
    Price(
      id: '4',
      name: 'Burgers',
      description: 'This is a test description',
      imageUrl: 'assets/burger.png',
      index: 3,
    ),
  ];
}