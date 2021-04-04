part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddProductEvent extends CartEvent {
  final Product? product;

  AddProductEvent({this.product});

  @override
  List<Object?> get props => [product];
}

class RemoveProductEvent extends CartEvent {
  final Product? product;

  RemoveProductEvent({this.product});
  @override
  List<Object?> get props => [product];
}

class RemoveItemEvent extends CartEvent {
  final Product? product;

  RemoveItemEvent({this.product});

  @override
  List<Object?> get props => [product];
}

class RemoveAllItem extends CartEvent {}

class CheckTheCartEvent extends CartEvent {
  final Product? product;

  CheckTheCartEvent({this.product});

  @override
  List<Object?> get props => [product];
}
