import 'package:flutter/material.dart';
import '../models/order.dart';
import '../widgets/bottom_nav_bar.dart';

class OrderMonitoringPage extends StatefulWidget {
  const OrderMonitoringPage({super.key});

  @override
  State<OrderMonitoringPage> createState() => _OrderMonitoringPageState();
}

class _OrderMonitoringPageState extends State<OrderMonitoringPage> {
  int _currentNavIndex = 3;
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_open_rounded), // Tambahkan tombol Back
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/'); // Kembali ke main.dart
          },
        ),
        title: const Text('My Orders'),
      ),
      body: Column(
        children: [
          _buildTabs(),
          Expanded(
            child: _selectedTabIndex == 0
                ? _buildActiveOrders()
                : _buildCompletedOrders(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
          
          if (index == 0) {
            Navigator.pushNamed(context, '/page1'); // Home
          } else if (index == 1) {
            Navigator.pushNamed(context, '/page3'); // Chat
          } else if (index == 2) {
            Navigator.pushNamed(context, '/page4'); // Wishlist
          } else if (index == 4) {
            Navigator.pushNamed(context, '/profile'); // Profile
          }
        },
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF212121),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = 0;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _selectedTabIndex == 0
                      ? const Color(0xFF8D6E63)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Active',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _selectedTabIndex == 0
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = 1;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _selectedTabIndex == 1
                      ? const Color(0xFF8D6E63)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Completed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _selectedTabIndex == 1
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveOrders() {
    final activeOrders = dummyOrders
        .where((order) =>
            order.status != OrderStatus.completed &&
            order.status != OrderStatus.cancelled &&
            order.status != OrderStatus.returned)
        .toList();

    if (activeOrders.isEmpty) {
      return _buildEmptyState('No active orders',
          'Your active orders will appear here', Icons.receipt_long);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: activeOrders.length,
      itemBuilder: (context, index) {
        final order = activeOrders[index];
        return _buildOrderCard(order, index);
      },
    );
  }

  Widget _buildCompletedOrders() {
    final completedOrders = dummyOrders
        .where((order) =>
            order.status == OrderStatus.completed ||
            order.status == OrderStatus.cancelled ||
            order.status == OrderStatus.returned)
        .toList();

    if (completedOrders.isEmpty) {
      return _buildEmptyState('No completed orders',
          'Your order history will appear here', Icons.history);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: completedOrders.length,
      itemBuilder: (context, index) {
        final order = completedOrders[index];
        return _buildOrderCard(order, index);
      },
    );
  }

  Widget _buildEmptyState(String title, String subtitle, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: const Color(0xFF8D6E63),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/page1');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8D6E63),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
            child: const Text('Browse Items'),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Order order, int index) {
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #${order.id}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: order.statusColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    order.statusText,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Ordered on: ${order.formattedOrderDate}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Text(
              'Rental Period: ${order.formattedRentalPeriod}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: Colors.grey),
            const SizedBox(height: 12),
            ...order.items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          index == 0 ? 
                          (order.items.indexOf(item) == 0
                            ? 'https://i.pinimg.com/474x/5a/30/77/5a3077264fbfa9dc589031c61949e31c.jpg'
                            : 'https://i.pinimg.com/474x/76/df/60/76df605745f33be1445eb79b0b39899e.jpg')
                            : index == 1 ? 
                            (order.items.indexOf(item) == 0
                            ? 'https://i.pinimg.com/474x/90/ad/7a/90ad7a3ab31edb304ec65fbf2b9e1ac1.jpg'
                            : 'https://i.pinimg.com/474x/d2/be/4d/d2be4d4a75330e4a8722c222106468b9.jpg')
                            : 'https://i.pinimg.com/474x/92/94/12/929412f874e090d6993119e6aa33d3f6.jpg',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${item.quantity} x \$${item.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 12),
            const Divider(color: Colors.grey),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '\$${order.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF8D6E63),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // View order details
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3E2723),
                    ),
                    child: const Text('View Details'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: order.status == OrderStatus.inUse
                        ? () {
                            Navigator.pushNamed(context, '/transaction2');
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8D6E63),
                      disabledBackgroundColor: Colors.grey.shade800,
                    ),
                    child: Text(
                      order.status == OrderStatus.inUse
                          ? 'Return Items'
                          : 'Track Order',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

