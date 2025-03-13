import 'package:flutter/material.dart';
import '../models/camping_item.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu_open_rounded), // Tambahkan tombol Back
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/'); // Kembali ke main.dart
                },
              ),
              floating: false,
              pinned: true,
              backgroundColor: const Color(0xFF3E2723).withOpacity(0.5),
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Camp Gear Rental',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF3E2723), Colors.black],
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart), // Ikon Cart
                  onPressed: () {
                    Navigator.pushNamed(context, '/page5'); // Navigasi ke CartPage
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline), // Ikon Profile
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchBar(),
                    const SizedBox(height: 20),
                    _buildPromoBanner(),
                    const SizedBox(height: 20),
                    _buildCategoryList(),
                    const SizedBox(height: 20),
                    const Text(
                      'Popular Items',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = dummyItems[index];
                    return _buildItemCard(item, index);
                  },
                  childCount: dummyItems.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
          
          // Navigate to different pages based on index
          if (index == 1) {
            Navigator.pushNamed(context, '/page3'); // Chat
          } else if (index == 2) {
            Navigator.pushNamed(context, '/page4'); // Wishlist
          } else if (index == 3) {
            Navigator.pushNamed(context, '/transaction1'); // Cart
          } else if (index == 4) {
            Navigator.pushNamed(context, '/profile'); // Profile
          }
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF212121),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF8D6E63), width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search for camping gear...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
              onSubmitted: (value) {
                // Handle search
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.grey),
            onPressed: () {
              // Show filter options
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity, // Memastikan lebar penuh
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 16), // Opsional, agar ada sedikit padding dari tepi layar
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF8D6E63), Color(0xFF3E2723)],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Opacity(
                opacity: 0.6,
                child: Image.network(
                  'https://i.pinimg.com/474x/30/e0/b5/30e0b58329d45ce9c517b9345840f72b.jpg',
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '20% OFF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'on Weekend Packages',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/page6');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF3E2723),
                  ),
                  child: const Text('View Packages'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildCategoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: _selectedCategoryIndex == index
                        ? const Color(0xFF8D6E63)
                        : const Color(0xFF212121),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF8D6E63),
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: _selectedCategoryIndex == index
                          ? Colors.white
                          : Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildItemCard(CampingItem item, int index) {
    // Daftar gambar untuk produk (akan digunakan secara bergantian)
    List<String> productImages = [
      'https://i.pinimg.com/474x/5a/30/77/5a3077264fbfa9dc589031c61949e31c.jpg',
      'https://i.pinimg.com/736x/55/5c/d8/555cd89b3bcb338dc20f3145322d0f73.jpg',
      'https://i.pinimg.com/474x/76/df/60/76df605745f33be1445eb79b0b39899e.jpg',
      'https://i.pinimg.com/474x/90/ad/7a/90ad7a3ab31edb304ec65fbf2b9e1ac1.jpg',
      'https://i.pinimg.com/474x/92/94/12/929412f874e090d6993119e6aa33d3f6.jpg',
      'https://i.pinimg.com/474x/d2/be/4d/d2be4d4a75330e4a8722c222106468b9.jpg',
    ];

    // Pilih gambar berdasarkan index produk (gunakan modulo untuk looping)
    String productImage = productImages[index % productImages.length];

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/page2');
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6, // Menyesuaikan tinggi gambar
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  productImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 6, // Menyesuaikan tinggi teks
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        Text(
                          ' ${item.rating} (${item.reviewCount})',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(), // Menghindari overflow dengan memberikan ruang dinamis
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${item.price.toStringAsFixed(2)}/day',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF8D6E63),
                          ),
                        ),
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}