
import 'package:final_project/formatting.dart';
import 'package:final_project/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySection extends StatefulWidget {
  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  List<CategoryItem> _categoryItems = [
    CategoryItem(iconData: Icons.woman, label: 'womens-dresses'),
    CategoryItem(iconData: Icons.face, label: 'beauty'),
    CategoryItem(iconData: Icons.home, label: 'home-decoration'),
    CategoryItem(iconData: Icons.kitchen, label: 'kitchen-accessories'),
    CategoryItem(iconData: Icons.chair, label: 'furniture'),
    CategoryItem(iconData: Icons.shopping_bag, label: 'groceries'),
    CategoryItem(iconData: Icons.local_florist, label: 'fragrances'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        right: screenWidth * 0.04,
        left: screenWidth * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(108, 76, 54, 1.0),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Implement "See All" functionality here
                },
                child: Text(
                  'See All',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(108, 76, 54, 1.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            height: screenWidth * 0.3,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _categoryItems,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData iconData;
  final String label;

  const CategoryItem({required this.iconData, required this.label});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.08;
    Formatting design = Formatting();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(108, 76, 54, 1.0),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              iconSize: iconSize,
              icon: Icon(iconData, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoryScreen(category_name: label)));
              },
            ),
          ),
          const SizedBox(height: 8),
          Container(
            //color: Colors.yellow,
            alignment: Alignment.center,
            width: iconSize + 50,
            child: Text(
              (design.toSentenceCase(label)).replaceAll("-", " "),
              style: GoogleFonts.aBeeZee(
                fontSize: screenWidth * 0.036,
                color: Colors.black,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
