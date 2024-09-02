import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample order data
    final orders = [
      {'date': '2024-08-10', 'number': 'ORD123456', 'status': 'Delivered'},
      {'date': '2024-08-05', 'number': 'ORD123455', 'status': 'Shipped'},
      {'date': '2024-07-30', 'number': 'ORD123454', 'status': 'Pending'},
      {'date': '2024-07-25', 'number': 'ORD123453', 'status': 'Cancelled'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: Color.fromARGB(255, 238, 200, 245),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            elevation: 4.0,
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              title: Text('Order Number: ${order['number'] as String}'),
              subtitle: Text('Date: ${order['date'] as String}'),
              trailing: Text(
                order['status'] as String,
                style: TextStyle(
                  color: _getStatusColor(order['status'] as String),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailPage(
                      orderNumber: order['number'] as String,
                      orderDate: order['date'] as String,
                      orderStatus: order['status'] as String,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Shipped':
        return Colors.blue;
      case 'Pending':
        return Colors.orange;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}

class OrderDetailPage extends StatelessWidget {
  final String orderNumber;
  final String orderDate;
  final String orderStatus;

  const OrderDetailPage({
    super.key,
    required this.orderNumber,
    required this.orderDate,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    // Sample details data
    final orderDetails = [
      {'item': 'T-Shirt', 'quantity': 2, 'price': '\$20'},
      {'item': 'Jeans', 'quantity': 1, 'price': '\$40'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        backgroundColor: Color.fromARGB(255, 238, 200, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Number: $orderNumber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Date: $orderDate',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Status: $orderStatus',
              style:
                  TextStyle(fontSize: 16, color: _getStatusColor(orderStatus)),
            ),
            SizedBox(height: 20),
            Text(
              'Order Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: orderDetails.length,
                itemBuilder: (context, index) {
                  final item = orderDetails[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                    title: Text(item['item'] as String),
                    subtitle: Text('Quantity: ${item['quantity']}'),
                    trailing: Text(item['price'] as String),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Shipped':
        return Colors.blue;
      case 'Pending':
        return Colors.orange;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
