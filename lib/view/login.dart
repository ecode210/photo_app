import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_app/view/home.dart';
import 'package:photo_app/viewmodel/photo.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey _sliderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                width: size.width,
                child: CarouselSlider.builder(
                  key: _sliderKey,
                  slideBuilder: (index) {
                    return buildSlider(index);
                  },
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  slideIndicator: CircularSlideIndicator(
                    currentIndicatorColor: Colors.teal,
                    indicatorBackgroundColor: Colors.grey.shade200,
                    padding: const EdgeInsets.only(top: 500),
                  ),
                  scrollPhysics: const BouncingScrollPhysics(),
                  slideTransform: const DefaultTransform(),
                  initialPage: 0,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.qr_code_2_rounded,
                      color: Colors.teal,
                      size: 70,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "NFT Photo App",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.teal,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: Colors.grey..shade900,
                      thickness: 1,
                      indent: 50,
                      endIndent: 50,
                    ),
                    const SizedBox(height: 10),
                    BouncingWidget(
                      onPressed: () {
                        Provider.of<Photo>(context, listen: false)
                            .googleLogin()
                            .then((credential) {
                          if (credential.user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          }
                        });
                      },
                      scaleFactor: 0.2,
                      child: Container(
                        height: 50,
                        width: size.width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Sign in with Google",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSlider(int index) {
    switch (index) {
      case 0:
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: Image.asset(
            "assets/jpg/login1.jpg",
            fit: BoxFit.cover,
          ),
        );
      case 1:
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: Image.asset(
            "assets/jpg/login2.jpg",
            fit: BoxFit.cover,
          ),
        );
      case 2:
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: Image.asset(
            "assets/jpg/login3.jpg",
            fit: BoxFit.cover,
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
