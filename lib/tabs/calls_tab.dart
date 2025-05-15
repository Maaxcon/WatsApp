import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color_constants.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Створення посилання
          Container(
            color: ColorConstants.colorWhite,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstants.colorAccent,
                  ),
                  child: Transform.rotate(
                    angle: -0.5,
                    child: const Icon(
                      Icons.link,
                      color: ColorConstants.colorWhite,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Створити посилання на дзвінок",
                      style: GoogleFonts.archivo(
                        fontSize: 16,
                        color: ColorConstants.colorBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Поділіться посиланням для дзвінка WhatsApp",
                      style: GoogleFonts.archivo(
                        fontSize: 14,
                        color: ColorConstants.color72777A,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Заголовок "Останні"
          Container(
            width: double.infinity,
            color: const Color(0xFFF2F2F2),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Останні",
              style: GoogleFonts.archivo(
                fontSize: 14,
                color: ColorConstants.color72777A,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Список дзвінків
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context, index) {
              bool isOutgoing = index % 3 == 0;
              bool isMissed = index % 3 == 1;
              
              return Container(
                color: ColorConstants.colorWhite,
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundColor: ColorConstants.colorPrimary,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    "Контакт $index",
                    style: GoogleFonts.archivo(
                      fontSize: 16,
                      color: ColorConstants.colorBlack,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        isOutgoing ? Icons.call_made : Icons.call_received,
                        size: 16,
                        color: isMissed ? Colors.red : Colors.green,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${isOutgoing ? 'Вихідний' : 'Вхідний'}${isMissed ? ' (пропущений)' : ''}",
                        style: GoogleFonts.archivo(
                          fontSize: 14,
                          color: ColorConstants.color72777A,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "12:$index",
                        style: GoogleFonts.archivo(
                          fontSize: 14,
                          color: ColorConstants.color72777A,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        index % 2 == 0 ? Icons.call : Icons.videocam,
                        color: ColorConstants.colorPrimary,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}