import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_app/data/models/category.dart';
import 'package:furniture_app/data/models/product.dart';
import 'package:furniture_app/data/repository/interfaces/I_home.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final IHome? homeRepository;

  DashboardBloc(this.homeRepository) : super(LoadingDashboard());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    List<Category> categories = await homeRepository!.categories;
    List<Product> products = await homeRepository!.products;
    if (event is LoadDashboard) {
      yield LoadingDashboard();
      yield DashboardLoadedState(
          categories: categories, products: products, index: 0);
    } else if (event is OnTapCategory) {
      yield LoadingDashboard();
      List<Product> productList = await homeRepository!.func(event.categoryId);
      yield DashboardLoadedState(
          categories: categories, index: event.index, products: productList);
    }
  }
}
