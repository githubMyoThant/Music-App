import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

// stf or statefulW
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url =
      "https://drive.google.com/uc?export=view&id=1u6CEOeViyOhc6Yo2ncUpZU9bdIvDPAoy";
  
  AudioPlayer audioPlayer = AudioPlayer();
  play() async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      const Text("Song is playing");
    } else {
      const Text("Something is wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'images/cute.jpg',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Pretty\'s on the Inside',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Song by Chloe Adams'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      play();
                    },
                    child: const Image(
                        height: 50,
                        image: NetworkImage(
                            'https://cdn.icon-icons.com/icons2/2226/PNG/512/play_icon_134504.png'))),
                TextButton(
                    onPressed: () async {
                      // ignore: unused_local_variable
                      int result = await audioPlayer.pause();
                    },
                    child: const Image(
                        height: 50,
                        image: NetworkImage(
                            'https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-pause-512.png'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
