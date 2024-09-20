import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibSHOP/components/screens/cartpage.dart';
import 'package:wibSHOP/components/screens/guide.dart';
import 'package:wibSHOP/components/screens/card.dart';
import 'package:wibSHOP/components/screens/product_details.dart';
import 'package:wibSHOP/components/screens/product_display.dart';
import 'package:wibSHOP/components/screens/profileAccount.dart';
import 'package:wibSHOP/components/screens/register.dart';
import 'package:wibSHOP/components/screens/login.dart';
import 'package:wibSHOP/components/screens/splash_screen.dart';
import 'package:wibSHOP/services/product_provider.dart';
import 'package:wibSHOP/utils/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TMyAppTheme.lightTheme,
      darkTheme: TMyAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/cart': (context) => const CartPage(),
        '/guide': (context) => const GuideScreen(),
        '/profile': (context) => const Profileaccount(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
      home: const SplashScreen(),
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  bool _isSearchVisible = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(
        context, ['/home', '/guide', '/cart', '/profile'][index]);
  }

  @override
  Widget build(BuildContext context) {
    final productsAsyncValue = ref.watch(productsProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          // ignore: unused_result
          ref.refresh(productsProvider);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Wibshop'),
              backgroundColor: const Color.fromARGB(255, 238, 200, 245),
              pinned: true,
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const AccountSheet(),
                    );
                  },
                  icon: const Icon(Icons.person),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearchVisible = !_isSearchVisible;
                    });
                  },
                  icon: Icon(
                    _isSearchVisible ? Icons.close : Icons.search,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: _isSearchVisible ? _buildSearchBar() : null,
              ),
            ),
            SliverToBoxAdapter(
              child: _buildCategoryList(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 350,
                child: ProductCard(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Popular Products",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            productsAsyncValue.when(
              data: (products) {
                products.shuffle();
                return SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                name: product.name,
                                image: product.image,
                                price: product.price,
                                description: product.description,
                              ),
                            ),
                          );
                        },
                        child: ProductDisplay(
                          image: product.image,
                          name: product.name,
                          price: product.price,
                          description: product.description,
                        ));
                  },
                );
              },
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stackTrace) => SliverToBoxAdapter(
                child: Center(child: Text('Error: $error')),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Guide'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.purple,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 4,
              color: Colors.grey,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for products",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryItem(
              label: 'Trousers', imageUrl: "asset/images/tone-jeans-men.jpg"),
          SizedBox(width: 10),
          CategoryItem(label: 'Skirts', imageUrl: 'asset/images/skirt.jpg'),
          SizedBox(width: 10),
          CategoryItem(label: 'Shirts', imageUrl: 'asset/images/shirts.jpg'),
          SizedBox(width: 10),
          CategoryItem(label: 'T-Shirts', imageUrl: 'asset/images/t-shirt.jpg'),
          SizedBox(width: 10),
          CategoryItem(label: 'Jackets', imageUrl: 'asset/images/jacket.jpg'),
          SizedBox(width: 10),
          CategoryItem(label: 'Bags', imageUrl: 'asset/images/bags.jpg'),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String label;
  final String imageUrl;

  const CategoryItem({super.key, required this.label, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

class AccountSheet extends StatelessWidget {
  const AccountSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Account Options",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("Login"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            leading: const Icon(Icons.app_registration),
            title: const Text("Register"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/register');
            },
          ),
        ],
      ),
    );
  }
}
