import 'package:flutter/material.dart';


void main() {
  runApp(Anil());
}

class Anil extends StatefulWidget {
  Anil({super.key});

  @override
  State<Anil> createState() => _AnilState();
}

class _AnilState extends State<Anil> {
  TextEditingController _controller = TextEditingController();

  int cnt = 0;
  List<String> text11 = [
    'salom aleykum',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  child: Image.asset(
                                    'images/person.jpeg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                               const Padding(
                                  padding:  EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Anil"),
                                      Text(
                                        "Online - Last seen, 2.02pm",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  color: Colors.green,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.video_camera_front_outlined,
                                  color: Colors.green,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.more_vert_outlined,
                                  color: Colors.green,
                                  size: 35,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/whatsap.jpeg"
                              ),
                          fit: BoxFit.cover)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 300,
                          child: ListView.builder(
                            itemCount: text11.length,
                            itemBuilder: (context, index) {
                              return chat(
                                textname: text11[index],
                                color1: Colors.green,
                                color2: Colors.green,
                                widthcont: 100,
                                cross: CrossAxisAlignment.end,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'сообщений... ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            text11.add(_controller.text);
                            _controller.clear();
                          });
                        },
                        icon: Icon(Icons.send)),
                    prefixIcon: Icon(Icons.emoji_emotions_outlined),
                  ),
                  controller: _controller,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget chat(
      {required String textname,
      required Color color1,
      required Color color2,
      required double widthcont,
      String texttime = "",
      required CrossAxisAlignment cross}) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: cross,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                  color: color1, borderRadius: BorderRadius.circular(25)),
              child: Container(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                child: Text(textname),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              alignment: Alignment.topLeft,
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: color2, borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              texttime,
              style: TextStyle(color: Colors.grey[400], fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
