import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/small_icon_button.dart';
import '../../data/model/message_model.dart';

class AddChatView extends StatefulWidget {
  AddChatView({super.key});

  @override
  State<AddChatView> createState() => _AddChatViewState();
}

class _AddChatViewState extends State<AddChatView> {
  TextEditingController addMessagesController = TextEditingController();

  List<MessageModel> messages = [];

  void _sendMessage() {
    if (addMessagesController.text.isNotEmpty) {
      setState(() {
        messages.add(
          MessageModel(text: addMessagesController.text, isMe: true),
        );
        addMessagesController.clear();
      });

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          messages.add(
            MessageModel(text: "رسالة رد تلقائي", isMe: false),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText('User Name', color: Colors.black87, ph: 0, fontWeight: FontWeight.w700, size: 17.sp,),
        leadingWidth: 120.w,
        toolbarHeight: 90.h,
        leading: Row(
          children: [
            Container(
              padding: EdgeInsets.all(14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.06),
                    blurRadius: 32,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset(context.locale.languageCode != 'ar'?
                AppIcons.arrow:AppIcons.rightArrow, colorFilter: ColorFilter.mode( Colors.black, BlendMode.srcIn),),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomLeft,
              children: [
                // Image.asset(AppImages.starbucks),
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                ),
                Positioned(
                  bottom: 0,
                  left: 1,
                  child: CircleAvatar(
                    radius: 6.r,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: messages.isNotEmpty
          ? ListView.builder(
            shrinkWrap: true,
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Align(
                  alignment:
                      msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12.r),
                    margin: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: msg.isMe
                          ? AppCustomColors.colorGrey50
                          : Color(0xffFFF8ED),
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(12),
                        topEnd: Radius.circular(12),
                        bottomStart: Radius.circular(msg.isMe ? 0 : 12),
                        bottomEnd: Radius.circular(msg.isMe ? 12 : 0),
                      ),
                    ),
                    child: AppText(
                      msg.text,
                      size: 13.sp,
                    ),
                  ),
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImagePath.chatEmpty,
                  height: 252.h,
                  width: 252.w,
                ),
                AppText(
                  'No messages here yet!'.tr(),
                  size: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ).paddingOnly(top: 32.h, bottom: 4.h),
                AppText(
                  'You don\'t have any messages yet. You can send a message or come back later.'
                      .tr(),
                  size: 17.sp,
                  color: Colors.black,
                  maxLines: 2,
                  align: TextAlign.center,
                ),
              ],
            ).paddingSymmetric(horizontal: 40),
      bottomNavigationBar: Row(
        children: [
          SmallIconButton(
            height: 50.h,
            width: 50.w,
            icon: AppIcons.record,
            onTap: () {},
          ),
          Expanded(
            child: SizedBox(
              width: 240.w,
              height: 50.h,
              child: EditText(
                hint: 'writeALetter....'.tr(),
                type: TextInputType.text,
                controller: addMessagesController,
              ),
            ).paddingSymmetric(horizontal: 4.w),
          ),
          SmallIconButton(
            height: 50.h,
            width: 50.w,
            icon: AppIcons.send,
            onTap: _sendMessage,
            color: AppCustomColors.appPrimaryColor,
          ),
        ],
      ).paddingSymmetric(horizontal: 19.w, vertical: 8.h),
    );
  }
}
