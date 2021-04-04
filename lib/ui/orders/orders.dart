import 'package:flutter/material.dart';
import 'package:furniture_app/data/models/order_model.dart';
import 'package:furniture_app/ui/orders/order_card.dart';

class Orders extends StatefulWidget {
  final List<OrderModel> orders;

  const Orders({required this.orders});
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: (widget.orders.isEmpty)
          ? Center(
              child:
                  Text('No orders Available!', style: TextStyle(fontSize: 28)),
            )
          : ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.orders.length,
              itemBuilder: (context, index) {
                return OrderCard(
                  order: widget.orders[index],
                );
              }),
    );
  }
}
