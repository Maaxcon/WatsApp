import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color_constants.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Мій статус
        SliverToBoxAdapter(
          child: Container(
            color: ColorConstants.colorWhite,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: ColorConstants.colorPrimary,
                      child: Icon(Icons.person, color: Colors.white, size: 40),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: ColorConstants.colorAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: ColorConstants.colorWhite,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Мій статус",
                      style: GoogleFonts.archivo(
                        fontSize: 16,
                        color: ColorConstants.colorBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Натисніть, щоб додати оновлення статусу",
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
        ),
        
        // Заголовок "Оновлення"
        SliverToBoxAdapter(
          child: Container(
            color: const Color(0xFFF2F2F2),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Оновлення друзів",
              style: GoogleFonts.archivo(
                fontSize: 14,
                color: ColorConstants.color72777A,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        
        // Список оновлень друзів
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return statusModule("Друг $index", "$index хв тому");
            },
            childCount: 5,
          ),
        ),

        // Заголовок "Переглянуті оновлення"
        SliverToBoxAdapter(
          child: Container(
            color: const Color(0xFFF2F2F2),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Переглянуті оновлення",
              style: GoogleFonts.archivo(
                fontSize: 14,
                color: ColorConstants.color72777A,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        
        // Список переглянутих оновлень
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return statusModule("Переглянуто $index", "сьогодні, ${10 + index}:00");
            },
            childCount: 3,
          ),
        ),
      ],
    );
  }

  Widget statusModule(String name, String time) {
    return Container(
      color: ColorConstants.colorWhite,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              radius: 28,
              backgroundColor: ColorConstants.colorPrimary,
              child: Icon(Icons.person, color: Colors.white, size: 40),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.archivo(
                    fontSize: 16,
                    color: ColorConstants.colorBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: GoogleFonts.archivo(
                    fontSize: 14,
                    color: ColorConstants.color72777A,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
