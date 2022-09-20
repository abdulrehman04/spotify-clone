import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/globals/long_button.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:spotify_clone/view%20models/login%20view%20model/login_view_model.dart';
import 'package:stacked/stacked.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: ksecondaryClr,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/logo_grey.png',
                      height: 55,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    poppinsText(
                      'Millions of songs.',
                      size: 35,
                      color: Colors.white,
                      weight: FontWeight.w600,
                    ),
                    poppinsText(
                      "Free on Spotify",
                      size: 35,
                      color: Colors.white,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    longButton("Continue with Google", () async {
                      model.googleLogin();
                    }),
                    SizedBox(
                      height: 15.h,
                    ),
                    longButton("Continue with Facebook", null),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
