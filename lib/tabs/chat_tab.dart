import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/chat_screen.dart';
import '../utils/color_constants.dart';
import '../utils/image_constants.dart';
import '../widgets/fade_in_image.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      padding: const EdgeInsets.symmetric(vertical: 0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatScreen()));
          },
          child: Container(
            color: ColorConstants.colorWhite,
            child: ListTile(
              title: Text(
                "Ім'я Прізвище $index",
                maxLines: 1,
                style: GoogleFonts.archivo(fontSize: 16, color: ColorConstants.colorBlack),
              ),
              subtitle: Text(
                "Привіт! Як справи?",
                maxLines: 1,
                style: GoogleFonts.archivo(fontSize: 14, color: ColorConstants.color72777A),
              ),
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: ColorConstants.colorPrimary,
                child: Icon(Icons.person, color: Colors.white),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "14:23",
                    style: GoogleFonts.archivo(fontSize: 14, color: ColorConstants.color72777A),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
