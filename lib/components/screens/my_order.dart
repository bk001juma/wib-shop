import 'package:flutter/material.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Orders'),
          backgroundColor: Color.fromARGB(255, 238, 200, 245),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Delivered'),
              Tab(text: 'Shipping'),
              Tab(text: 'Processing'),
            ],
          ),
        ),
        body: TabBarView(
          children: const [
            OrdersTab(status: 'Delivered'),
            OrdersTab(status: 'Shipping'),
            OrdersTab(status: 'Processing'),
          ],
        ),
      ),
    );
  }
}

class OrdersTab extends StatelessWidget {
  final String status;

  const OrdersTab({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    // Sample orders data with status
    final orders = [
      {
        'date': '2024-08-10',
        'items': 'T-Shirt x2, Jeans x1',
        'total': '\$60',
        'status': 'Delivered'
      },
      {
        'date': '2024-08-05',
        'items': 'Hat x1, Sunglasses x1',
        'total': '\$30',
        'status': 'Shipping'
      },
      {
        'date': '2024-07-30',
        'items': 'Shoes x1',
        'total': '\$50',
        'status': 'Delivered'
      },
      {
        'date': '2024-07-25',
        'items': 'Jacket x1',
        'total': '\$80',
        'status': 'Processing'
      },
    ].where((order) => order['status'] == status).toList();

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          elevation: 4.0,
          child: ListTile(
            contentPadding: EdgeInsets.all(16.0),
            title: Text('Date: ${order['date'] as String}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Items: ${order['items'] as String}'),
                Text(
                  'Status: ${order['status'] as String}',
                  style: TextStyle(
                    color: _getStatusColor(order['status'] as String),
                  ),
                ),
              ],
            ),
            trailing: Text(
              'Total: ${order['total'] as String}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailPage(
                    orderDate: order['date'] as String,
                    orderItems: order['items'] as String,
                    orderTotal: order['total'] as String,
                    orderStatus: order['status'] as String,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Function to determine status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Shipping':
        return Colors.orange;
      case 'Processing':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

class OrderDetailPage extends StatelessWidget {
  final String orderDate;
  final String orderItems;
  final String orderTotal;
  final String orderStatus;

  const OrderDetailPage({
    super.key,
    required this.orderDate,
    required this.orderItems,
    required this.orderTotal,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    // Sample details data for the selected order
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
              'Order Date: $orderDate',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Items: $orderItems',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Total: $orderTotal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Status: $orderStatus',
              style: TextStyle(
                fontSize: 16,
                color: _getStatusColor(orderStatus),
                fontWeight: FontWeight.bold,
              ),
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

  // Function to determine status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Shipping':
        return Colors.orange;
      case 'Processing':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
