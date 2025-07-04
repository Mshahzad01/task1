import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:task1/src/constant/app_color.dart';
import 'package:task1/src/constant/asset_string.dart';
import 'package:task1/src/extension/context_ext.dart';
import 'package:task1/src/feature/booking/model/bookingmodel.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String selectedFilter = 'All';
  TextEditingController searchController = TextEditingController();

  final List<Bookingmodel> bookinginfo = dumydatabooking;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2d39),
      body: Column(
        children: [
          // 🔹 Filter Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['All', 'Today', 'Tomorrow'].map((filter) {
                  bool isSelected = selectedFilter == filter;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

    
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'Search quotes...',
                      hintStyle: const TextStyle(color: Colors.white54),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AssetString.filtericon, color: Colors.white, width: 20, height: 20),
                ),
              ],
            ),
          ),
          // 🔽 Category List + Builder
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildCategory("IDN Web", bookinginfo),
                _buildCategory("IDN Station", bookinginfo),
                _buildCategory("IDN Pro", bookinginfo),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Added By You", style: TextStyle(color: Colors.white70, fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(String title, List<Bookingmodel> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTile(
          backgroundColor: Colors.transparent,
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          title: Text(title, style: context.myTextTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.subtitleText,
                  )),
          children: [
            ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                return _buildQuoteCard(items[index]);
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildQuoteCard(Bookingmodel model) {
    return Card(
      shadowColor:Color.lerp(Color(0xffB54541), Color(0xff220D0C) ,0.5),
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: const Color(0xFF1E1E1E),



      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                 CircleAvatar(backgroundImage: AssetImage(model.pitcher), radius: 20),
                const SizedBox(width: 8),



                Text(model.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
               
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(color:AppColors.red, borderRadius: BorderRadius.circular(8)),
                  child: Text("Cancel By ${model.cancelBy}",  style: context.myTextTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.subtitleText,
                  )),
                ),
                const SizedBox(width: 8),
                Text("\$${model.price}", style:   context.myTextTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.subtitleText,
                  )),
              ],
               

            ),

            
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.white70),
                const SizedBox(width: 4),
                Expanded(child: Text(model.location, style: const TextStyle(color: Colors.white70))),
              ],
            ),
            if (model.extralocation.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 4),
                child: Text(model.extralocation, style: const TextStyle(color: Colors.white38)),
              ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text("Start: ${model.distance1} km", style: context.myTextTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.subtitleText,
                  )),
                  const Spacer(),
                  Text("End: ${model.distance2} km", style: context.myTextTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.subtitleText,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.white70),
                const SizedBox(width: 4),
                Text(DateFormat('MMM dd, hh:mm a').format(model.dateTime), style:  context.myTextTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.subtitleText,
                  )),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(model.userstatus.title, style:context.myTextTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.subtitleText,
                  )),
                Text("Opened ${model.accoutopen}", style: context.myTextTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.subtitleText,
                  )),
                 Text("View", style: context.myTextTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.subtitleText,
                  ) ),
              ],
            ),
          ]
        ),
      )
    );
  }
}
