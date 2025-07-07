

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:task1/src/constant/app_color.dart';
import 'package:task1/src/constant/asset_string.dart';
import 'package:task1/src/core/extension/context_ext.dart';
import 'package:task1/src/core/extension/datetime_formating_exten.dart';
import 'package:task1/src/feature/booking/model/bookingmodel.dart';
import 'package:task1/src/feature/booking/screen/booking_details_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<Bookingmodel> bookinginfo = dumydatabooking;
  // final DateTime _dateTime = DateTime.now();
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(Duration(days: 1));
    final String todayStr = DateFormat('dd/MM/yy').format(today);
    final List<String> filters = ['All', 'Today', 'Tomorrow', todayStr];

    return Scaffold(
      backgroundColor: const Color(0xff2b2d39),
      body: Column(
        children: [
          _buildFilterTabs(filters),
          _buildSearchBar(),
          Expanded(
            child: ListView(
              children: [
                _buildCategory("IDN Web", getFilteredBookingList()),
                _buildCategory("IDN Station", getFilteredBookingList()),
                _buildCategory("IDN Pro", getFilteredBookingList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs(List<String> filters) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...filters.map((filter) {
            bool isSelected = selectedFilter == filter;
            return GestureDetector(
              onTap: () => setState(() => selectedFilter = filter),
              child: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AssetString.powerbutton),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xff21242b),
              ),
              child: TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset("assets/icon/search-normal.svg", height: 18, width: 18),
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset("assets/icon/filter.svg", height: 40, width: 40),
          ),
        ],
      ),
    );
  }

  List<Bookingmodel> getFilteredBookingList() {
    if (selectedFilter == 'All') return bookinginfo;

    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(Duration(days: 1));

    return bookinginfo.where((booking) {
      final bookingDate = DateFormat('dd/MM/yy').format(booking.dateTime);

      if (selectedFilter == 'Today') {
        return bookingDate == DateFormat('dd/MM/yy').format(today);
      } else if (selectedFilter == 'Tomorrow') {
        return bookingDate == DateFormat('dd/MM/yy').format(tomorrow);
      } else {
        return bookingDate == selectedFilter;
      }
    }).toList();
  }

  Widget _buildCategory(String title, List<Bookingmodel> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTile(
          backgroundColor: Colors.black,
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          title: Text(title, style: context.myTextTheme.bodyMedium?.copyWith(fontSize: 14, color: AppColors.subtitleText)),
          children: [
            ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) => _buildQuoteCard(items[index]),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildQuoteCard(Bookingmodel model) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff220D0C),
            Color.fromARGB(255, 15, 7, 7),
            Color.fromARGB(255, 2, 1, 1),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(model.pitcher), radius: 25),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name, style: context.myTextTheme.bodyMedium?.copyWith(color: AppColors.white, fontSize: 12)),
                  Text("${model.ratting} (${model.totaloder})", style: context.myTextTheme.bodyMedium?.copyWith(color: AppColors.white, fontSize: 10)),
                ],
              ),
              const SizedBox(width: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(color: const Color.fromARGB(255, 216, 91, 85), borderRadius: BorderRadius.circular(5)),
                child: Text("Cancel By ${model.cancelBy}", style: context.myTextTheme.titleMedium?.copyWith(fontSize: 8, color: AppColors.white)),
              ),
              const Spacer(),
              Text("\$${model.price}", style: context.myTextTheme.bodyMedium?.copyWith(fontSize: 12, color: AppColors.white)),
            ],
          ),
          const SizedBox(height: 15),
          Text(model.worktype, style: context.myTextTheme.bodyMedium),
          const SizedBox(height: 10),
          _buildInfoRow(AssetString.note, model.note),
          const SizedBox(height: 15),
          _buildInfoRow(AssetString.loaction, model.location),
          const SizedBox(height: 15),
          _buildInfoRow(AssetString.timeicon, model.dateTime.toCustomFormattedTime()),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(model.userstatus.title, style: context.myTextTheme.titleMedium?.copyWith(fontSize: 12, color: model.userstatus.color)),
              SizedBox(
                width: 05,
              ),
                 Text(model.userstatus.newvalue, style: context.myTextTheme.titleMedium?.copyWith(fontSize: 12, )),
              const Spacer(),
              InkWell(
           onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => BookingDetailScreen(booking: model,),
    ),
  );
},

                 

                
                
                child: Text("View", style: context.myTextTheme.titleMedium?.copyWith(fontSize: 12, color: AppColors.white))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String iconPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, width: 20, height: 20),
        const SizedBox(width: 4),
        Expanded(child: Text(text, style: context.myTextTheme.bodyMedium?.copyWith(fontSize: 10))),
      ],
    );
  }
}

