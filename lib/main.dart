import 'package:destini/story_brain.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Destini(),
  );
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain story = StoryBrain();

  void logicChoice1() {
    setState(() {
      story.storyLogicChoice1();
    });
  }

  void logicChoice2() {
    setState(() {
      story.storyLogicChoice2();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    story.getStory(),
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                    onPressed: () {
                      logicChoice1();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      story.getChoice1(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: isSingleButton(story.makeButtonVisible()),
                  child: TextButton(
                    onPressed: () {
                      logicChoice2();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      story.getChoice2(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
