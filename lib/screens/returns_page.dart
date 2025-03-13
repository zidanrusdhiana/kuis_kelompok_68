import 'package:flutter/material.dart';
import '../models/order.dart';
import '../widgets/bottom_nav_bar.dart';

class ReturnsPage extends StatefulWidget {
  const ReturnsPage({super.key});

  @override
  State<ReturnsPage> createState() => _ReturnsPageState();
}

class _ReturnsPageState extends State<ReturnsPage> {
  int _currentNavIndex = 0;
  int _currentStep = 0;
  final Order _order = dummyOrders.firstWhere(
    (order) => order.status == OrderStatus.inUse,
    orElse: () => dummyOrders.first,
  );
  final TextEditingController _notesController = TextEditingController();
  bool _isItemDamaged = false;
  final List<bool> _selectedItems = [true, true];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Return Items'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderInfo(),
              const SizedBox(height: 24),
              _buildReturnStepper(),
            ],
          ),
        ),
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
          } else if (index == 3) {
            Navigator.pushNamed(context, '/page5'); // Cart
          } else if (index == 4) {
            Navigator.pushNamed(context, '/profile'); // Profile
          }
        },
      ),
    );
  }

  Widget _buildOrderInfo() {
    return Card(
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
                  'Order #${_order.id}',
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
                    color: _order.statusColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _order.statusText,
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
              'Rental Period: ${_order.formattedRentalPeriod}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: Colors.grey),
            const SizedBox(height: 12),
            const Text(
              'Items to Return:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            ...List.generate(
              _order.items.length,
              (index) => CheckboxListTile(
                value: _selectedItems[index],
                onChanged: (value) {
                  setState(() {
                    _selectedItems[index] = value!;
                  });
                },
                title: Text(
                  _order.items[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'Quantity: ${_order.items[index].quantity}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                secondary: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    index == 0 
                      ? 'https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2FtcGluZyUyMHRlbnR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'
                      : 'https://images.unsplash.com/photo-1510672981848-a1c4f1cb5ccf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2FtcGluZyUyMHN0b3ZlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                activeColor: const Color(0xFF8D6E63),
                checkColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReturnStepper() {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF8D6E63),
              background: const Color(0xFF212121),
              onSurface: Colors.white,
            ),
      ),
      child: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() {
              _currentStep++;
            });
          } else {
            // Submit return request
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Return request submitted successfully!'),
                backgroundColor: Color(0xFF8D6E63),
              ),
            );
            Navigator.pushNamed(context, '/transaction1');
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8D6E63),
                    ),
                    child: Text(
                      _currentStep == 2 ? 'Submit' : 'Continue',
                    ),
                  ),
                ),
                if (_currentStep > 0) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: details.onStepCancel,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF8D6E63)),
                      ),
                      child: const Text('Back'),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('Select Return Location'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose where you want to return the items:',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                _buildLocationOption(
                  'Store Drop-off',
                  'Return items to our physical store',
                  Icons.store,
                  true,
                ),
                const SizedBox(height: 12),
                _buildLocationOption(
                  'Pickup Service',
                  'We\'ll pick up the items from your location',
                  Icons.local_shipping,
                  false,
                ),
              ],
            ),
            isActive: _currentStep >= 0,
            state: _currentStep > 0
                ? StepState.complete
                : StepState.indexed,
          ),
          Step(
            title: const Text('Item Condition'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please indicate the condition of the items:',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text(
                    'Are any items damaged?',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: _isItemDamaged,
                  onChanged: (value) {
                    setState(() {
                      _isItemDamaged = value;
                    });
                  },
                  activeColor: const Color(0xFF8D6E63),
                ),
                if (_isItemDamaged) ...[
                  const SizedBox(height: 12),
                  TextField(
                    controller: _notesController,
                    decoration: const InputDecoration(
                      labelText: 'Describe the damage',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF8D6E63)),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add photo of damage
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Add Photo'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3E2723),
                    ),
                  ),
                ],
              ],
            ),
            isActive: _currentStep >= 1,
            state: _currentStep > 1
                ? StepState.complete
                : StepState.indexed,
          ),
          Step(
            title: const Text('Confirm Return'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please review your return details:',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                _buildConfirmationItem(
                  'Order ID:',
                  _order.id,
                ),
                _buildConfirmationItem(
                  'Return Method:',
                  'Store Drop-off',
                ),
                _buildConfirmationItem(
                  'Items to Return:',
                  '${_selectedItems.where((item) => item).length} of ${_order.items.length}',
                ),
                _buildConfirmationItem(
                  'Damaged Items:',
                  _isItemDamaged ? 'Yes' : 'No',
                ),
                if (_isItemDamaged && _notesController.text.isNotEmpty)
                  _buildConfirmationItem(
                    'Damage Notes:',
                    _notesController.text,
                  ),
                const SizedBox(height: 16),
                const Text(
                  'By submitting, you confirm that you are returning the selected items in the condition described above.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            isActive: _currentStep >= 2,
            state: StepState.indexed,
          ),
        ],
      ),
    );
  }

  Widget _buildLocationOption(
    String title,
    String subtitle,
    IconData icon,
    bool isSelected,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? const Color(0xFF8D6E63) : Colors.grey,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: RadioListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        secondary: Icon(
          icon,
          color: isSelected ? const Color(0xFF8D6E63) : Colors.grey,
        ),
        value: isSelected,
        groupValue: true,
        onChanged: (value) {
          // Toggle selection
        },
        activeColor: const Color(0xFF8D6E63),
      ),
    );
  }

  Widget _buildConfirmationItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

