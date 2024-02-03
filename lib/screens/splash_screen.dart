import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_pet/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
        (route) => false,
      );
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/background.png'),
          Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 42,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 22,
              ),
              const SizedBox(
                height: 73,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Helping you\nto keep ",
                  style: GoogleFonts.manrope(
                      fontSize: 24,
                      color: Color(0xFFDEE1FE),
                      letterSpacing: 3.5 / 100,
                      height: 152 / 100),
                  children: const [
                    TextSpan(
                        text: "your bestie",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800)),
                    TextSpan(text: "\nstay healthy!"),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
