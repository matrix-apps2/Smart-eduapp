// ignore_for_file: prefer_const_constructors

import '../../../../modules/setting/presentation/cubit/setting_cubit.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.systemOverlayStyle?.statusBarColor,
      child: SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(title: Strings().settings),
            body: Column(
              children: [
                _sampleText(),
                _fontType(),
                _fontSize(),
                _lineHeight(),
                _screenBrightness(),
              ],
            )),
      ),
    );
  }

  Widget _fontType() {
    return BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: AppText('نوع الخط', color: Colors.black),
            ),
            SizedBox(width: 4),
            Expanded(
                child: Row(
              children: [
                // ...state.fontTypes
                //     .map(
                //       (fontType) => Expanded(
                //         flex: 1,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: GestureDetector(
                //             onTap: () {
                //               context
                //                   .read<SettingCubit>()
                //                   .changeFontType(fontType);
                //             },
                //             child: Container(
                //               height: 36,
                //               padding: EdgeInsets.all(4),
                //               decoration: BoxDecoration(
                //                 color: state.settingModel.fontType == fontType
                //                     ? Color(0xff0079CA)
                //                     : Colors.white,
                //                 borderRadius: BorderRadius.circular(kRadius),
                //                 border:
                //                     Border.all(color: Colors.black, width: 0.2),
                //               ),
                //               child: Center(
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(4.0),
                //                   child: Center(
                //                     child: Text(
                //                       'أبجد',
                //                       style: TextStyle(
                //                           fontSize: 12,
                //                           fontFamily: fontType,
                //                           color: state.settingModel.fontType ==
                //                                   fontType
                //                               ? Colors.white
                //                               : Colors.black87),
                //                       maxLines: 1,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     )
                //     .toList(),
              ],
            )),
          ],
        ),
      );
    });
  }

  Widget _fontSize() {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: AppText('حجم الخط'),
              ),
              SizedBox(width: 8),
              // Expanded(
              //   child: CupertinoSlider(
              //       onChanged: (value) {
              //         double fontSize = ((value * 100) + 50).round().toDouble();
              //         context.read<SettingCubit>().changeFontSize(fontSize);
              //       },
              //       onChangeStart: (value) {},
              //       value: state.getFontSize(),
              //       activeColor: Color(0xff0079CA),
              //       onChangeEnd: (value) {}),
              // ),
              // ),
              SizedBox(width: 4),
              // AppText('${state.settingModel.fontSize}%', color: Colors.black),
            ],
          ),
        );
      },
    );
  }

  Widget _lineHeight() {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: AppText('المسافة بين الأسطر'),
              ),
              SizedBox(width: 8),
              // Expanded(
              //   child: CupertinoSlider(
              //       onChanged: (value) {
              //         context.read<SettingCubit>().changeLineHeight(value);
              //       },
              //       onChangeStart: (value) {},
              //       value: state.getLineHeight(),
              //       activeColor: Color(0xff0079CA),
              //       onChangeEnd: (value) {}),
              // ),
              // ),
              SizedBox(width: 4),
              AppText(
                  (state.settingModel?.lineHeight ?? 0 + 1).toStringAsFixed(2),
                  color: Colors.black),
            ],
          ),
        );
      },
    );
  }

  Widget _screenBrightness() {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.brightness_7, color: Colors.grey[600]),
              ),
              SizedBox(width: 8),
              // Expanded(
              //   child: CupertinoSlider(
              //       value: state.getBrightness(),
              //       onChanged: (value) =>
              //           context.read<SettingCubit>().changeBrightness(value),
              //       activeColor: Color(0xff0079CA),
              //       onChangeEnd: (value) {}),
              // ),
              SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.brightness_7, color: Colors.grey[600]),
              ),
            ],
          ),
        );
      },
    );
  }

  _sampleText() {
    return BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
      return Container();
      // return Container(
      //   child: AppText("بسم الله الرحمن الرحيم \n الحمد لله رب العالمين")
      //       .applySettings(
      //     state.settingModel,
      //   ),
      // );
    });
  }
}
