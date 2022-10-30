import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final int id;
  final String price;

  Price({required this.id, required this.price});
  
  @override
  // TODO: implement props
  List<Object?> get props => [id,price];

  static List<Price> prices = [
Price(id: 1, price: '/CFA'),
Price(id: 2, price: '/CFA'),
Price(id: 3, price: '/CFA'),

  ];

}