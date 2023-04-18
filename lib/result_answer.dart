import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultAnswer extends StatelessWidget {
  const ResultAnswer({super.key, required this.resultItemList});
  final List<Map<String, Object>> resultItemList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: resultItemList.map((resultItem) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: (resultItem['isCorrectAnswer'] as bool)
                      ? const Color.fromARGB(255, 248, 5, 86)
                      : const Color.fromARGB(255, 2, 62, 111),
                  child: Text(
                    resultItem['index'].toString(),
                    style: GoogleFonts.dynaPuff(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resultItem['question'].toString(),
                        style: GoogleFonts.comfortaa(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        resultItem['answer'].toString(),
                        style: GoogleFonts.comfortaa(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: (resultItem['isCorrectAnswer'] as bool)
                              ? const  Color.fromARGB(255, 86, 214, 39)
                              : const Color.fromARGB(255, 255, 104, 174),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        resultItem['expectedAnswer'].toString(),
                        style: GoogleFonts.righteous(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 114, 202, 90)),
                      ),
                      const SizedBox(
                        height: 30,)
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
