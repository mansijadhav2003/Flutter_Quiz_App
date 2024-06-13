
import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:QuizApp()
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;
  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State {
  List allQuestions = [
    const SingleQuestionModel(
      question: "Who developed the Python language?",
      options: ["Zim Den","Guido van Rossum","Niene Stom","Wick van Rossum"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "In which language is Python written?",
      options: ["C","English","PHP","All of the above"],
      answerIndex: 0,
    ),
    const SingleQuestionModel(
      question: "Which of the following declarations is incorrect?",
      options: ["_x = 2","__x = 3","__xyz__ = 5","None of above"],
      answerIndex: 3,
    ),
    const SingleQuestionModel(
      question: "Which keyword is used for function in Python language?",
      options: ["Function","def","Fun","Define"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "Which of the following is the correct extension of the Python file?",
      options: [" .python"," .pl"," .py"," .p"],
      answerIndex: 2,
    ),
  ];
  int quizIndex = 0;
  bool questionScreen = true;
  int selectAnswer = -1;
  int correctCount = 0;
  bool ishome=false;
  String msg="";
  MaterialStateProperty<Color?> checkAns(int bthIndex) {
    if (selectAnswer != -1) {
      if (bthIndex == allQuestions[quizIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (bthIndex == selectAnswer) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validScreen() {
    if (selectAnswer == -1) {
      return;
    }
    if (selectAnswer == allQuestions[quizIndex].answerIndex) {
      correctCount += 1;
    }
    if (selectAnswer != -1) {
      if (quizIndex == allQuestions.length - 1) {
         setState(() {
        questionScreen = false;
        });
      }
      selectAnswer = -1;
      setState(() {
        quizIndex += 1;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if(ishome==false){
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.network("https://tse4.mm.bing.net/th?id=OIP.dJToM1TiZiJA0GYwzDHwjQHaHY&pid=Api&P=0&h=180",
            height: 300,
            width: 400,
            ),
            const Text("PYTHON QUIZ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    ishome=true;
                  });   
                },
               style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                    )
                ),    
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
          ),
      );
    }else{
    if (questionScreen== true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
        
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Questions : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${quizIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: Text(
                allQuestions[quizIndex].question,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,

                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (selectAnswer == -1) {
                    setState(() {
                      selectAnswer = 0;
                      msg="";
                    }
                    );
                  }
                },
                style: ButtonStyle(backgroundColor: checkAns(0)),
                child: Text(
                  "A)${allQuestions[quizIndex].options[0]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (selectAnswer == -1) {
                    setState(() {
                      selectAnswer = 1;
                    });
                  }
                },
                style: ButtonStyle(backgroundColor: checkAns(1)),
                child: Text(
                  "B)${allQuestions[quizIndex].options[1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (selectAnswer == -1) {
                    setState(() {
                      selectAnswer = 2;
                    });
                  }
                },
                style: ButtonStyle(backgroundColor: checkAns(2)),
                child: Text(
                  "C)${allQuestions[quizIndex].options[2]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (selectAnswer == -1) {
                    setState(() {
                      selectAnswer = 3;
                    });
                  }
                },
                style: ButtonStyle(backgroundColor: checkAns(3)),
                child: Text(
                  "D)${allQuestions[quizIndex].options[3]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            validScreen();
          },
          backgroundColor: Colors.blue,
          
          child: const Icon(
            Icons.forward,
            color: Colors.black,
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Quiz App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.network(
                "https://tse3.mm.bing.net/th?id=OIP.lfHu-jh9r3dJvWLvKw1dbAHaG3&pid=Api&P=0&h=180",
                
              ),
              const SizedBox(
                height: 10,
              ),
             
              const Text(
                " CONGRATULATIONS!",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
                const Text(
                  "Your Score",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "$correctCount/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  onPressed: () {
                    quizIndex = 0;
                    //questionScreen = true;
                    questionScreen=true;
                    selectAnswer = -1;
                    correctCount = 0;
                    setState(() {});
                  },
                  child: const Text(
                    "Practice Again",
                  )
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  onPressed: () {
                    quizIndex = 0;
                    //questionScreen = true;
                    ishome=false;
                    questionScreen=true;
                    selectAnswer = -1;
                    correctCount = 0;
                    setState(() {});
                  },
                  child: const Text(
                    "HOME",
                  )
                ),
            ],
          ),
      );
    }
    }
}
  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
