import 'package:equatable/equatable.dart';

class Promo extends Equatable{
 final int id;
 final String imageUrl;
 final String title;
 final String description;

  Promo({required this.id, required this.imageUrl, required this.title, required this.description});
  
  @override
  // TODO: implement props
  List<Object?> get props => [id,description,imageUrl,title];

  static List<Promo> promos = [
    Promo(
      id: 1,
      title: 'FREE Delivery on Your First 3 Orders.',
      description:
          'Place an order of \$10 or more and the delivery fee is on us',
      imageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    ),
    Promo(
      id: 2,
      title: '20% off on Selected Restaurants.',
      description: 'Get a discount at more than 200+ restaurants',
      imageUrl:
          'https://images.unsplash.com/photo-1428515613728-6b4607e44363?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    )
  ];


}