import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_school/widgets/textbuttonwidget.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:tr_school/widgets/textwidget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static const routeName = 'Chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messagecontroller = TextEditingController();
  bool emojiShowing = false;
  @override
  void dispose() {
    messagecontroller.dispose();
    super.dispose();
  }

  _onBackspacePressed() {
    messagecontroller
      ..text = messagecontroller.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: messagecontroller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: TextWidgets(
          text: "Chat",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontsize: 20.sp,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "Home");
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: TextField(
                        controller: messagecontroller,
                        decoration: InputDecoration(
                          hintText: "Write your message here",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                emojiShowing = !emojiShowing;
                              });
                            },
                            icon: const Icon(
                              Icons.emoji_emotions,
                            ),
                          ),
                          fillColor: const Color.fromARGB(255, 90, 86, 86),
                          contentPadding: const EdgeInsets.only(
                            left: 16,
                            bottom: 2,
                            top: 8,
                            right: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: TextButtonWidget(
                      text: "Send",
                      color: Colors.blue[800],
                      ontap: () {},
                      fontWeight: FontWeight.bold,
                      fontsize: 16.sp,
                    ),
                  ),
                ],
              ),
              Offstage(
                offstage: !emojiShowing,
                child: SizedBox(
                  height: 250,
                  child: EmojiPicker(
                    textEditingController: messagecontroller,
                    onBackspacePressed: _onBackspacePressed,
                    config: Config(
                      columns: 7,
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 32 *
                          (foundation.defaultTargetPlatform ==
                                  TargetPlatform.iOS
                              ? 1.30
                              : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      gridPadding: EdgeInsets.zero,
                      initCategory: Category.RECENT,
                      bgColor: const Color(0xFFF2F2F2),
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      backspaceColor: Colors.blue,
                      skinToneDialogBgColor: Colors.white,
                      skinToneIndicatorColor: Colors.grey,
                      enableSkinTones: true,
                      recentTabBehavior: RecentTabBehavior.RECENT,
                      recentsLimit: 28,
                      replaceEmojiOnLimitExceed: false,
                      noRecents: const Text(
                        'No Recents',
                        style: TextStyle(fontSize: 20, color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                      loadingIndicator: const SizedBox.shrink(),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL,
                      checkPlatformCompatibility: true,
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
