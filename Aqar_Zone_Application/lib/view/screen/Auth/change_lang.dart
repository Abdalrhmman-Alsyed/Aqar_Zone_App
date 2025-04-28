
import 'package:aqar_zone_application/view/screen/Auth/login_screen.dart';
import 'package:aqar_zone_application/view/screen/Auth/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/Zone.json"), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("images/image 47.png"),
                      width: 125,
                      height: 120,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "welcome to Aqar Zone".tr(),
                      style:
                      TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              "welcome".tr(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  child: MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                      context.setLocale(Locale('en'));
                    },
                    child: Text(
                      "English",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 150,
                  height: 50,
                  child: MaterialButton(
                    height: 24,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                      context.setLocale(Locale('ar'));
                    },
                    child: Text(
                      "العربية",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
