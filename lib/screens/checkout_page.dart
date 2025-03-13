import 'package:flutter/material.dart';
import '../models/camping_item.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _selectedPaymentMethod = 'Credit Card';

  // Contoh data produk yang dipesan
  final List<CartItem> _orderedItems = dummyItems.take(2).map((item) => CartItem(item: item, quantity: 1)).toList();

  double get _subtotal => _orderedItems.fold(0, (sum, item) => sum + (item.item.price * item.quantity));
  final double _tax = 5.00;
  final double _deliveryFee = 10.00;
  double get _total => _subtotal + _tax + _deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddressSection(),
            const SizedBox(height: 20),
            _buildPaymentMethodSection(),
            const SizedBox(height: 20),
            _buildOrderDetails(),
            const SizedBox(height: 20),
            Expanded(child: _buildOrderSummary()),
          ],
        ),
      ),
    );
  }

  // Bagian alamat statis yang fleksibel
  Widget _buildAddressSection() {
    return SizedBox(
      width: double.infinity, // Mengisi seluruh lebar layar
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF212121),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'John Doe\n123 Camping Street\nOutdoor City, CA 94123\nPhone: +1 (555) 123-4567',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }


  // Bagian metode pembayaran
  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Method',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedPaymentMethod,
          dropdownColor: const Color(0xFF212121),
          items: ['Credit Card', 'PayPal', 'Bank Transfer'].map((String method) {
            return DropdownMenuItem<String>(
              value: method,
              child: Text(method, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF212121),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // Daftar produk yang dibeli
  Widget _buildOrderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Column(
          children: _orderedItems.map((cartItem) => _buildCartItem(cartItem)).toList(),
        ),
      ],
    );
  }

  Widget _buildCartItem(CartItem cartItem) {
    final item = cartItem.item;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: const Color(0xFF212121),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2FtcGluZyUyMHRlbnR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '\$${item.price.toStringAsFixed(2)} x ${cartItem.quantity}',
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Text(
          '\$${(item.price * cartItem.quantity).toStringAsFixed(2)}',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Ringkasan pesanan di bagian bawah
  Widget _buildOrderSummary() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF212121),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _buildSummaryRow('Subtotal', _subtotal),
              _buildSummaryRow('Tax', _tax),
              _buildSummaryRow('Delivery Fee', _deliveryFee),
              const Divider(color: Colors.grey),
              _buildSummaryRow('Total', _total, isBold: true),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/transaction1'); // Redirect ke Order Monitoring
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8D6E63),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text(
            'Place Order',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(color: isBold ? const Color(0xFF8D6E63) : Colors.white, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

// Model CartItem agar bisa digunakan dalam daftar produk
class CartItem {
  final CampingItem item;
  int quantity;

  CartItem({required this.item, required this.quantity});
}
