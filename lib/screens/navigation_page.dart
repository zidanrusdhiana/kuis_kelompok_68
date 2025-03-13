import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Quiz 1: UI'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Color(0xFF3E2723)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'No Kelompok Praktikum: 68',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Camp Gear Rental',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8D6E63),
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _buildNavigationButton(
                    context, 
                    'Home', 
                    Icons.home, 
                    '/page1'
                  ),
                  _buildNavigationButton(
                    context, 
                    'Item Details', 
                    Icons.inventory_2, 
                    '/page2'
                  ),
                  _buildNavigationButton(
                    context, 
                    'Chat', 
                    Icons.chat, 
                    '/page3'
                  ),
                  _buildNavigationButton(
                    context, 
                    'Wishlist', 
                    Icons.favorite, 
                    '/page4'
                  ),
                  _buildNavigationButton(
                    context, 
                    'Cart', 
                    Icons.shopping_cart, 
                    '/page5'
                  ),
                  _buildNavigationButton(
                    context, 
                    'Packages', 
                    Icons.local_offer, 
                    '/page6'
                  ),
                  _buildNavigationButton(
                    context, 
                    'Profile', 
                    Icons.person, 
                    '/profile'
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8D6E63),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF212121).withOpacity(0.7),
                  border: Border.all(color: const Color(0xFF8D6E63)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    _buildTransactionButton(
                      context, 
                      'Order Monitoring', 
                      Icons.receipt_long, 
                      '/transaction1'
                    ),
                    const SizedBox(height: 12),
                    _buildTransactionButton(
                      context, 
                      'Checkout', 
                      Icons.shopping_cart_checkout_rounded, 
                      '/checkout'
                    ),
                    const SizedBox(height: 12),
                    _buildTransactionButton(
                      context, 
                      'Returns', 
                      Icons.assignment_return, 
                      '/transaction2'
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
    BuildContext context, 
    String label, 
    IconData icon, 
    String route
  ) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF8D6E63),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(icon, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pushNamed(context, route);
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionButton(
    BuildContext context, 
    String label, 
    IconData icon, 
    String route
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color(0xFF3E2723),
      ),
    );
  }
}

