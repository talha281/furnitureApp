part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable {}

class LoadDashboard extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class OnTapCategory extends DashboardEvent {
  final int index;
  final String? categoryId;

  OnTapCategory(this.index, this.categoryId);
  
  @override
  List<Object> get props => [];
  
}

