import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/const.dart';
import 'package:tasky/home/widgets/home_screen.dart';

class LoginInfo extends StatefulWidget {
  const LoginInfo({Key? key}) : super(key: key);

  @override
  State<LoginInfo> createState() => _LoginInfoState();
}

class _LoginInfoState extends State<LoginInfo> {
  final tcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 400,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      newbanner,
                    ),
                  ),
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tasky',
                            style: GoogleFonts.sniglet(
                              fontSize: 27,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.app_registration,
                            size: 20,
                            color: Colors.white,
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Please Add your Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Material(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.9),
                            elevation: 0.5,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: TextFormField(
                              controller: tcontroller,
                              // obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 13),
                                border: InputBorder.none,
                                // label: Text(titles),
                                hintText: 'name',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please type Username';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            checkLogin();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => HomeScreen(
                                        name: tcontroller.text.trim())));
                          },
                          label: const Text('Continue'),
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Image.asset(
            //   subimg,
            //   color: const Color.fromARGB(206, 255, 255, 255),
            //   colorBlendMode: BlendMode.modulate,
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> checkLogin() async {
    final _username = tcontroller.text;
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.setString('saved_value', tcontroller.text);
  }

  Future<void> getSavedData(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    final savedValue = sharedprefs.getString('saved_value');
    if (savedValue != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) => HomeScreen(name: savedValue.toString())));
    }
  }
}
