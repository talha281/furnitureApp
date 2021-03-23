part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {}

class CartEmpty extends CartState {
  @override
  List<Object> get props => [];
}

class Loading extends CartState {
  @override
  List<Object> get props => [];
  
}

class CartWithItem extends CartState {
  final CartModel? cartItem;
  final List<CartModel?>? cartItems;

  CartWithItem({this.cartItem,this.cartItems});
  
  @override
  List<Object> get props => [];
}
