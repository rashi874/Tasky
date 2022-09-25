import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/const.dart';
import 'package:tasky/home/home_screen.dart';

class LoginInfo extends StatelessWidget {
  const LoginInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Person> list = [
    //   Person(
    //     iconses: Icons.person,
    //     title: 'Name',
    //     subtitle: 'Alanwalker',
    //   ),
    // ];
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // appBar: AppBar(
      //   elevation: 0,
      //   // centerTitle: true,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         'Tasky',
      //         style: GoogleFonts.sniglet(
      //             fontSize: 25, fontWeight: FontWeight.w600),
      //       ),
      //       const Icon(
      //         Icons.app_registration,
      //         size: 15,
      //       )
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tasky',
                  style: GoogleFonts.sniglet(
                      fontSize: 27, fontWeight: FontWeight.w600),
                ),
                const Icon(
                  Icons.app_registration,
                  size: 20,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                // height: 380,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // image: DecorationImage(
                    //   fit: BoxFit.scaleDown,
                    //   image: AssetImage(bot),
                    // ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(188, 186, 186, 186),
                        blurRadius: 1.0,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Please Add your Detailes',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(subimg), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(168, 136, 201, 244)
                                  .withOpacity(.6),
                            ),
                          ),
                          const Positioned(
                            left: 50,
                            top: 50,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color.fromARGB(255, 37, 94, 250),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: TextformfieldLogin(
                          // iconses: Icons.person,
                          subtitles: 'rashid',
                          titles: 'name',
                        ),
                      ),
                      // Image.asset(
                      //   bot,
                      //   height: 300,
                      //   // color: const Color.fromARGB(206, 255, 255, 255),
                      //   // colorBlendMode: BlendMode.modulate,
                      // ),
                      // Stack(
                      //   children: [
                      //     Container(
                      //       // height: 80,
                      //       // width: 80,
                      //       decoration: BoxDecoration(
                      //         image: const DecorationImage(
                      //             image: AssetImage(subimg), fit: BoxFit.cover),
                      //         borderRadius: BorderRadius.circular(20),
                      //         color: const Color.fromARGB(168, 136, 201, 244)
                      //             .withOpacity(.6),
                      //       ),
                      //     ),
                      //     const Positioned(
                      //       left: 50,
                      //       top: 50,
                      //       child: CircleAvatar(
                      //         radius: 15,
                      //         backgroundColor: Color.fromARGB(255, 37, 94, 250),
                      //         child: Icon(
                      //           Icons.edit,
                      //           size: 20,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // ListView.builder(
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return Padding(
                      //       padding: const EdgeInsets.symmetric(horizontal: 10),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: TextformfieldLogin(
                      //           titles: list[index].title,
                      //           subtitles: list[index].subtitle,
                      //           iconses: list[index].iconses,
                      //         ),
                      //       ),

                      //       // ListTile(
                      //       //   leading: Icon(
                      //       //     list[index].iconses,
                      //       //     size: 28,
                      //       //   ),
                      //       //   title: Text(list[index].title),
                      //       //   subtitle: Text(list[index].subtitle),
                      //       // ),
                      //     );
                      //   },
                      //   itemCount: list.length,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton.icon(
                          // style: ButtonStyle(backgroundColor: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
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
}

class TextformfieldLogin extends StatelessWidget {
  final String titles;
  final String subtitles;
  // IconData iconses;

  const TextformfieldLogin({
    Key? key,
    required this.titles,
    required this.subtitles,
    // required this.iconses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //     titles,
        //     style: TextStyle(fontSize: 16),
        //   ),
        // ),
        Material(
          color: const Color.fromARGB(255, 99, 99, 99).withOpacity(0.1),
          elevation: 0.5,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              border: InputBorder.none,
              // label: Text(titles),
              hintText: subtitles,
            ),
          ),
        ),
      ],
    );
  }
}
