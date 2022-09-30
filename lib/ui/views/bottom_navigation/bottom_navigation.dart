import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/app/router.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/services/custom_navigation_service.dart';
import 'package:spotify_clone/view%20models/bottom_navigation%20view%20model/bottom_navigation_view_model.dart';
import 'package:stacked/stacked.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavigationViewModel>.reactive(
        viewModelBuilder: () {
      return BottomNavigationViewModel();
    }, builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: model.pages[model.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 10.sp,
          ),
          currentIndex: model.currentIndex,
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 10.sp),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[600],
          backgroundColor: ksecondaryClr,
          onTap: (int val) {
            locator<CustomNavigationService>().updateCurrentInUseKey(val);
            model.updateIndex(val);
          },
          items: [
            bottonavItem(
              "Home",
              Icons.home,
              0,
              model,
            ),
            bottonavItem(
              "Search",
              Icons.search,
              1,
              model,
            ),
            bottonavItem(
              "Your Library",
              Icons.library_books_outlined,
              2,
              model,
            ),
          ],
        ),
      );
    });
  }

  BottomNavigationBarItem bottonavItem(title, icon, index, model) {
    return BottomNavigationBarItem(
      label: title,
      icon: Icon(
        icon,
        color: model.currentIndex != index ? Colors.grey[600] : Colors.white,
      ),
    );
  }
}
