import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> items = [
    {"icon": SvgPicture.asset("assets/icon/bottom1.svg"), "label": "Home"},
    {"icon": SvgPicture.asset("assets/icon/bottom2.svg"), "label": "MapView"},
    {"icon": SvgPicture.asset("assets/icon/bottom3.svg") ,"label": "Pro"},
    {"icon": SvgPicture.asset("assets/icon/bottom4.svg"), "label": "Set"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.black.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
   
              duration: const Duration(milliseconds: 300),
              width: 90, 
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(05),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                

                    items[index]['icon'],
                
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isSelected ? 1.0 : 0.0,
                    child: isSelected
                        ? Padding(
                            padding: const EdgeInsets.only(left: 02),
                            child: Text(
                              items[index]['label'],
                              style: const TextStyle(color: Colors.deepPurple, fontSize: 10),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
