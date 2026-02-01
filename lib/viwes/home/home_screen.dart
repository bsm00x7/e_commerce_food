import 'package:e_commerce_food/manger/mager_image.dart';
import 'package:e_commerce_food/manger/manger_name.dart';
import 'package:e_commerce_food/model/item_model.dart';
import 'package:e_commerce_food/services_ads_storage_local/preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _categories = [
    'All',
    'Salad Combo',
    'Berry Combo',
    'Mango Combo',
  ];

  // Dummy data — replace with your real data source
  final List<ItemModel> _recommendedItems = [
    ItemModel(
      imgPath: ManagerImage.honeyLimeCombo,
      title: 'Honey lime combo',
      price: 2000,
    ),
    ItemModel(
      imgPath: ManagerImage.berryMangoCombo,
      title: 'Berry mango combo',
      price: 2000,
    ),
  ];

  final Set<int> _favorites = {};
  final Set<int> _cartItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              ListTile(
                leading: const Icon(Icons.drag_handle_rounded, size: 48),
                iconColor: const Color(0xff070648),
                trailing: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF0F0F0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1a000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 40,
                    color: Color(0xffFFA451),
                  ),
                ),
                title: Text(
                  'Welcome, ${PreferenceManager().getString(MangerName.firstName)}',
                  style: GoogleFonts.robotoSerif(fontSize: 24),
                ),
              ),
              const SizedBox(height: 44),

              /// Search Bar
              SearchBar(
                hintText: "Search for fruit salad combos",
                leading: const Icon(Icons.search, size: 40),
                keyboardType: TextInputType.name,
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 40, vertical: 17),
                ),
                backgroundColor: const WidgetStatePropertyAll(
                  Color(0xffF5F5F5),
                ),
                elevation: const WidgetStatePropertyAll(0),
                hintStyle: const WidgetStatePropertyAll(
                  TextStyle(color: Color(0xffB4B4C0), fontSize: 24),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              /// Category Filter Buttons
              SizedBox(
                height: 60,
                child: ListView.separated(
                  itemCount: _categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final bool isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xff6A1B9A)
                                : const Color(0xffE0E0E0),
                            width: isSelected ? 2.0 : 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected
                                  ? const Color(0x1a6A1B9A)
                                  : const Color(0x0d000000),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            _categories[index],
                            style: GoogleFonts.robotoSerif(
                              fontSize: 16,
                              color: isSelected
                                  ? const Color(0xff6A1B9A)
                                  : const Color(0xff333333),
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 10);
                  },
                ),
              ),

              const SizedBox(height: 30),

              /// Recommended Combo Title + Divider
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended Combo",
                  style: GoogleFonts.roboto(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: 0.25,
                  alignment: Alignment.centerLeft,
                  child: Divider(
                    color: const Color(0xffFFA451),
                    thickness: 4,
                    height: 4,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// Recommended Item Cards
              SizedBox(
                height: 400,
                child: Row(
                  children: List.generate(_recommendedItems.length, (index) {
                    final ItemModel item = _recommendedItems[index];
                    final bool isFavorited = _favorites.contains(index);
                    final bool isInCart = _cartItems.contains(index);
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: index < _recommendedItems.length - 1
                              ? 14.0
                              : 0.0,
                        ),
                        child: Card(
                          color: Colors.white,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Image
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Image.asset(
                                        item.imgPath,
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                color: const Color(0xffF5F5F5),
                                                child: const Icon(
                                                  Icons.broken_image_outlined,
                                                  color: Color(0xffB4B4C0),
                                                ),
                                              );
                                            },
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.title,
                                            style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff333333),
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 6),

                                          /// Price & Add Button Row
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              /// Price in Naira
                                              Text(
                                                '₦ ${item.price.toStringAsFixed(0)}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: const Color(
                                                    0xffFFA451,
                                                  ),
                                                ),
                                              ),

                                              /// Add to Cart Button
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (isInCart) {
                                                      _cartItems.remove(index);
                                                    } else {
                                                      _cartItems.add(index);
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: const Color(
                                                      0xffFFA451,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    isInCart
                                                        ? Icons.check
                                                        : Icons.add,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              /// Favorite Button (top-right overlay)
                              Positioned(
                                top: 8,
                                right: 8,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isFavorited) {
                                        _favorites.remove(index);
                                      } else {
                                        _favorites.add(index);
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                        alpha: 0.85,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      isFavorited
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 40,
                                      color: const Color(0xffFFA451),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
