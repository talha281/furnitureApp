import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:furniture_app/blocs/dashboard/bloc/dashboard_bloc.dart';
import 'package:furniture_app/components/search_box.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/routers.dart';
import 'package:furniture_app/screens/dashboard/widgets/product_card.dart';
import 'package:furniture_app/utils/navigator_class.dart';
import '../appdrawer/appdrawer.dart';
import '../cart/cart.dart';
import 'widgets/category_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: kPrimaryColor,
        drawer: AppDrawer(),
        body: SafeArea(
          bottom: true,
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: SearchBox(),
                onTap: () {
                  RouteNavigation.routeKey.currentState!
                      .pushNamed(RouteStrings.SearchBar);
                },
              ),
              // SearchBox(),
              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  return (state is DashboardLoadedState)
                      ? Container(
                          margin: EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2.5),
                          height: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.categories!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: CategoryList(
                                  index: index,
                                  selectedIndex: state.index,
                                ),
                                onTap: () {
                                  BlocProvider.of<DashboardBloc>(context).add(
                                      OnTapCategory(index,
                                          state.categories![index].categoryId));
                                },
                              );
                            },
                          ),
                        )
                      : Container();
                },
              ),
              SizedBox(height: kDefaultPadding / 2),
              Expanded(
                child: Stack(
                  children: [
                    // Our background
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),

                    BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, state) {
                        return (state is DashboardLoadedState)
                            ? (state.products!.isEmpty)
                                ? Center(
                                    child: Text(
                                    'No macthes found!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ))
                                : ListView.builder(
                                    itemCount: state.products!.length,
                                    itemBuilder: (context, index) =>
                                        ProductCard(
                                      itemIndex: index,
                                      product: state.products![index],
                                      press: () {
                                        RouteNavigation.routeKey.currentState!
                                            .pushNamed(
                                          RouteStrings.ProductPage,
                                          arguments: state.products![index],
                                        );
                                      },
                                    ),
                                  )
                            : Container();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text('Dashboard'),
      actions: <Widget>[
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            var ccart = BlocProvider.of<CartBloc>(context).cartRepository;
            return Stack(
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/icons/shopping-bag.svg',
                      color: Colors.white, height: 25),
                  onPressed: () {
                    Navigation.pushNavigation(context, CartScreen());
                  },
                ),
                (ccart.productItemList!.isNotEmpty)
                    ? Container(
                        padding: (ccart.productItemList!.length >= 10)
                            ? EdgeInsets.only(left: 19, top: 2)
                            : EdgeInsets.only(left: 21, top: 6, bottom: 8),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            ccart.productItemList!.length.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ))
                    : Container(),
              ],
            );
          },
        ),
      ],
    );
  }
}
