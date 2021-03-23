part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState extends Equatable {}

class LoadingDashboard extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardLoadedState extends DashboardState {
  final List<Category>? categories;
  final List<Product>? products;
  final int? index;

  DashboardLoadedState({this.categories, this.products,this.index});
  @override
  List<Object?> get props => [categories, products];
}

class CategoryChangeState extends DashboardState {
  final int? index;
  final List<Product>? productList;

  CategoryChangeState({this.index, this.productList});

  @override
  List<Object?> get props => [index, productList];
}
