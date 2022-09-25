import 'package:flutter/material.dart';
import '../widgets/topbanner.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TopBanner(
                colorses:
                    const Color.fromARGB(121, 248, 249, 246).withOpacity(.6),
                title: 'Daily motivation',
                subtitle:
                    'The question isn,t who going\nto let me,it s who going to stop me!',
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Events',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'June',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      // tileColor: Colors.green,
                      title: Text('Rony s wedding'),
                      subtitle: Text('12.30pm'),
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundColor: Color.fromARGB(255, 239, 237, 237),
                        child: Text(
                          '7',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor:
        //     const Color.fromARGB(255, 35, 35, 35),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  insetPadding: const EdgeInsets.all(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  scrollable: true,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.remove,
                        size: 40,
                        color: Colors.grey,
                      ),
                      Text(
                        'Create Event',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  content: SizedBox(
                    height: 400,
                    width: 380,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Event Title'),
                                TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        134, 218, 218, 218),
                                    // prefixIcon: Icon(Icons.account_box),
                                    contentPadding: const EdgeInsets.all(7),
                                    border: InputBorder.none,
                                    hintText: 'John wedding tommorrow',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    labelText: 'Remind me',
                                    // icon: Icon(Icons.account_box),
                                  ),
                                ),
                              ],
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(134, 218, 218, 218),
                                prefixIcon:
                                    const Icon(Icons.date_range_rounded),
                                contentPadding: const EdgeInsets.all(7),
                                border: InputBorder.none,
                                hintText: '1 June',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                labelText: 'Due Date',
                                // icon: Icon(Icons.message),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(134, 218, 218, 218),
                                prefixIcon: const Icon(Icons.timelapse_rounded),
                                contentPadding: const EdgeInsets.all(7),
                                border: InputBorder.none,
                                hintText: '10:30pm',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                labelText: '10.30pm',
                                // icon: Icon(Icons.account_box),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(134, 218, 218, 218),
                                prefixIcon: const Icon(
                                    Icons.replay_circle_filled_rounded),
                                contentPadding: const EdgeInsets.all(7),
                                border: InputBorder.none,
                                hintText: 'once',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                labelText: 'Repeat',
                                // icon: Icon(Icons.email),
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                child: const Text('save'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
              // showModalBottomSheet<void>(
              //   shape:
              //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Container(
              //       height: 450,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(25),
              //         color: Color.fromARGB(168, 255, 255, 255).withOpacity(.6),
              //       ),
              //       child: Center(
              //         child: Padding(
              //           padding: const EdgeInsets.all(20.0),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             // mainAxisSize: MainAxisSize.min,
              //             children: <Widget>[
              //               const Text('Create Event'),
              //               TextFormField(
              //                 decoration: InputDecoration(
              //                   filled: true,
              //                   fillColor: Color.fromARGB(134, 218, 218, 218),
              //                   // prefixIcon: Icon(Icons.search),
              //                   contentPadding: EdgeInsets.all(10),
              //                   border: InputBorder.none,
              //                   hintText: 'John wedding tommorrow',
              //                   enabledBorder: UnderlineInputBorder(
              //                     borderSide: BorderSide(color: Colors.white),
              //                     borderRadius: BorderRadius.circular(12),
              //                   ),
              //                 ),
              //               ),
              //               ElevatedButton(
              //                 child: const Text('save'),
              //                 onPressed: () => Navigator.pop(context),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}
