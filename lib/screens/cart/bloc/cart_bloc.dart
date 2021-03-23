import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/data/models/cart_model.dart';
import 'package:furniture_app/data/models/product.dart';
import 'package:furniture_app/data/repository/interfaces/i_cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository cartRepository;
  CartBloc(this.cartRepository) : super(CartEmpty());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CheckTheCartEvent) {
      CartModel? cartItem = cartRepository.checkTheCartFunc(event.product!);
      yield Loading();
      yield CartWithItem(cartItem: cartItem);
    } else if (event is AddProductEvent) {
      cartRepository.addProductItem(event.product!);
      yield Loading();
      yield theState(product: event.product);
    } else if (event is RemoveProductEvent) {
      cartRepository.removeProductItem(event.product!);
      yield Loading();
      yield theState(product: event.product);
    } else if (event is RemoveItemEvent) {
      cartRepository.removeItem(event.product!);
      yield Loading();
      yield theState(product: event.product);
    } else {
      yield theState();
    }
  }

  CartState theState({Product? product}) {
    if (cartRepository.productItemList!.isNotEmpty) {
      CartModel cartItem = cartRepository.checkTheCartFunc(product!);
      return CartWithItem(
          cartItems: cartRepository.productItemList, cartItem: cartItem);
    }
    return CartEmpty();
  }
}

