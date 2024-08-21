import 'story.dart';

class StoryBrain {
  int choicePositions = 0;
  bool choice1Bool = false;
  bool choice2Bool = false;
  bool resetButton = false;
  int buttonShow = 2;

  final List<Story> _storyData = [
    Story(
        'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        'I\'ll hop in. Thanks for the help!',
        'Better ask him if he\'s a murderer first.'),
    Story(
        'He nods slowly, unphased by the question.',
        'At least he\'s honest. I\'ll climb in.',
        'Wait, I know how to change a tire.'),
    Story(
        'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        'I love Elton John! Hand him the cassette tape.',
        'It\'s him or me! You take the knife and stab him.'),
    Story(
        'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        'Restart',
        ''),
    Story(
        'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        'Restart',
        ''),
    Story(
        'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        'Restart',
        ''),
  ];

  String getStory() {
    String storyText;
    storyText = _storyData[choicePositions].storyTitle;
    return storyText;
  }

  String getChoice1() {
    String choice1;
    choice1 = _storyData[choicePositions].choiceOne;
    return choice1;
  }

  String getChoice2() {
    String choice2;
    choice2 = _storyData[choicePositions].choiceTwo;
    return choice2;
  }

  void storyLogicChoice1() {
    choice1Bool = true;

    if (choice1Bool && choicePositions == 0) {
      choicePositions = 2;
      choice1Bool = false;
    } else if (choice1Bool && choicePositions == 2) {
      choicePositions = 5;
      choice1Bool = false;
      resetButton = true;
    } else if (choice2Bool && choicePositions == 1 && choice1Bool) {
      choicePositions = 2;
    } else if (choicePositions == 5 && choice1Bool) {
      reset();
    } else if (choicePositions == 4 && choice1Bool) {
      reset();
    } else if (choicePositions == 3 && choice2Bool) {
      reset();
    }
  }

  void storyLogicChoice2() {
    choice2Bool = true;

    if (choice2Bool && choicePositions == 0) {
      choicePositions = 1;
      choice2Bool = true;
    } else if (choice2Bool && choicePositions == 1) {
      choicePositions = 3;
      resetButton = true;
    } else if (choice2Bool && choicePositions == 2) {
      choicePositions = 4;
      resetButton = true;
    }
  }

  void reset() {
    choicePositions = 0;
    resetButton = false;
  }

  int makeButtonVisible() {
    if (resetButton == false) {
      buttonShow = 2;
      return buttonShow;
    } else if (resetButton == true) {
      buttonShow = 3;
      return buttonShow;
    } else {
      return buttonShow;
    }
  }
}
