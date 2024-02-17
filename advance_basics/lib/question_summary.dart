import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  final Color color = const Color.fromARGB(255, 206, 168, 220);

  @override
  Widget build(BuildContext context) {
    // int right_colors = 20;
    print("this is summary data $summaryData");

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // map function always return iterable which is almost same as list but not exectly list so the Widgets that
          //accepts the list first convert iterable into list using .toList() method
          children: summaryData.map(
            (key) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //use as keyword to tell dart you knows which value it will be
                  //first telling dart that the value will be of int type and then converting the value to string
                  // due to Text widget that excepts only String values
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 20, 70),
                    child: CircleAvatar(
                        backgroundColor: (key["color"] == "correct")
                            ? const Color.fromARGB(255, 114, 197, 203)
                            : const Color.fromARGB(255, 152, 44, 80),
                        radius: 15,
                        child: Text(
                          ((key["questions_index"] as int) + 1).toString(),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        )),
                  ),
                  Expanded(
                    // margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            key["question"] as String,
                            style: TextStyle(color: color, fontSize: 16),
                          ),
                          Text(
                            key["user_answer"] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 152, 44, 80),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            key["correct_answer"] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 114, 197, 203),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ).toList(), //converting map iterable object into a list object
        ),
      ),
    );
  }
}
