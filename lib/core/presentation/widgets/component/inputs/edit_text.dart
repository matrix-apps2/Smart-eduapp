
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/utils/resources/resources.dart';

import '../../../../../core/presentation/widgets/app_text.dart';
import '../../../../../utils/theme/appColors.dart';
import '../../../../../utils/theme/appImages.dart';
import '../../../../../utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditText extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final String? suffixText;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final String hint;
  final Color textFieldColor;
  final Color borderColor;
  final String? value;
  final TextInputAction? textInputAction;
  final bool enable;
  final bool label;
  final bool password;
  final int? lines;
  final int? maxLines;
  final int? minLines;
  final Function? onFieldSubmitted;
  final Function? updateFunc;
  final Function? validateFunc;
  final IconData? iconData;
  final String? prefixImage;
  final double fontSize;
  final double radius;
  final FocusNode? focusNode;
  final TextInputType type;
  final TextStyle? style;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? formatter;

  const EditText({
    super.key,
    this.margin,
    this.decoration,
    this.style,
    this.iconData,
    this.prefixImage,
    this.suffixWidget,
    this.focusNode,
    this.controller,
    this.value,
    required this.hint,
    this.enable = true,
    this.label = false,
    this.textFieldColor = AppCustomColors.colorGrey5,
    this.borderColor = AppCustomColors.colorGrey50,
    this.password = false,
    this.lines,
    this.maxLines,
    this.minLines,
    this.fontSize = 14,
    this.radius = 14,
    this.onFieldSubmitted,
    this.updateFunc,
    this.validateFunc,
    this.suffixText,
    this.textInputAction,
    this.formatter,
    this.type = TextInputType.text,
  }) : assert(value != null || controller != null);

  @override
  State<EditText> createState() => _EditTextState();

  copyWith({
    EdgeInsetsGeometry? margin,
    String? suffixText,
    Widget? suffixWidget,
    TextEditingController? controller,
    String? hint,
    String? value,
    TextInputAction? textInputAction,
    bool? enable,
    bool? label,
    bool? password,
    int? lines,
    Function? onFieldSubmitted,
    Function? updateFunc,
    Function? validateFunc,
    IconData? iconData,
    String? prefixImage,
    double? fontSize,
    FocusNode? focusNode,
    TextInputType? type,
    InputDecoration? decoration,
    TextStyle? style,
    List<TextInputFormatter>? formatter,
  }) {
    return EditText(
      margin: margin ?? this.margin,
      suffixText: suffixText ?? this.suffixText,
      suffixWidget: suffixWidget ?? this.suffixWidget,
      controller: controller ?? this.controller,
      hint: hint ?? this.hint,
      value: value ?? this.value,
      textInputAction: textInputAction ?? this.textInputAction,
      enable: enable ?? this.enable,
      label: label ?? this.label,
      password: password ?? this.password,
      lines: lines ?? this.lines,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      updateFunc: updateFunc ?? this.updateFunc,
      validateFunc: validateFunc ?? this.validateFunc,
      iconData: iconData ?? this.iconData,
      prefixImage: prefixImage ?? this.prefixImage,
      fontSize: fontSize ?? this.fontSize,
      focusNode: focusNode ?? this.focusNode,
      type: type ?? this.type,
      formatter: formatter ?? this.formatter,
      decoration: decoration ?? this.decoration,
      style: style ?? this.style,
    );
  }
}

class _EditTextState extends State<EditText> {
  bool obscurePassword = false;

  @override
  void initState() {
    super.initState();
    obscurePassword = widget.password;
  }

  void changePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? prefix;
    if (widget.prefixImage != null) {
      prefix = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Image.asset(widget.prefixImage!, height: 16, width: 0.66),
      );
    }
    if (widget.iconData != null) {
      prefix = Icon(widget.iconData, color: Colors.grey);
    }
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: widget.controller,
        initialValue: widget.value,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        style: widget.style,
        onTap: () {
          //move cursor to end of text
          if (widget.controller != null) {
            if (widget.controller!.selection ==
                TextSelection.fromPosition(
                    TextPosition(offset: widget.controller!.text.length - 1))) {
              widget.controller!.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller!.text.length));
            }
          }
        },
        decoration: widget.decoration ??
            InputDecoration(
                label: widget.label
                    ? AppText(
                        widget.hint,
                        color: Colors.grey,
                      )
                    : null,
                filled: true,
                fillColor: widget.textFieldColor,
                suffixText: widget.suffixText,
                suffixIcon: widget.password
                    ? Padding(
                  padding: EdgeInsets.all(8.r),
                  child: GestureDetector(
                    onTap: changePasswordVisibility,
                    child: SvgPicture.asset(
                      obscurePassword
                          ? AppIcons.visibilityOff
                          : AppIcons.visibility,
                      width: 20.w,
                      height: 20.h,
                      colorFilter: ColorFilter.mode(AppCustomColors.colorGrey75, BlendMode.srcIn),
                    ),
                  ),
                )
                    : widget.suffixWidget,
                prefixIcon: prefix,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color: widget.borderColor,
                  )
                ),
                errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
                focusedErrorBorder:
                    Theme.of(context).inputDecorationTheme.focusedErrorBorder,
                focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                    borderSide: BorderSide(
                      color: widget.borderColor,
                    )
                ),

                enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                    borderSide: BorderSide(
                      color: widget.borderColor,
                    )
                ),
                disabledBorder:
                    Theme.of(context).inputDecorationTheme.disabledBorder,
                hintText: widget.hint,
                hintStyle:
                    const TextStyle(color: AppCustomColors.colorLightGrey5)),
        keyboardType: widget.type,
        validator: (text) {
          if (widget.validateFunc != null) return widget.validateFunc!(text);
          return null;
        },
        enabled: widget.enable,
        obscureText: obscurePassword,
        maxLines: widget.maxLines?? widget.lines,
        minLines: widget.minLines,
        inputFormatters: widget.formatter,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (newValue) {
          if (widget.updateFunc != null) widget.updateFunc!(newValue);
        },
        onSaved: (newValue) {
          if (widget.updateFunc != null) widget.updateFunc!(newValue);
        },
        onFieldSubmitted: (value) {
          if (widget.onFieldSubmitted != null) {
            widget.onFieldSubmitted!(value);
          } else if (widget.updateFunc != null) {
            widget.updateFunc!(value);
          }
        },
      ),
    );
  }
}

extension EditTextExt on EditText {
  EditText linesMx(int lines) => copyWith(lines: lines);
  EditText margin(EdgeInsetsGeometry margin) => copyWith(margin: margin);
  EditText suffixText(String suffixText) => copyWith(suffixText: suffixText);
  EditText suffixWidget(Widget suffixWidget) =>
      copyWith(suffixWidget: suffixWidget);
  EditText prefixIcon(IconData prefixIcon) => copyWith(
          decoration: decoration?.copyWith(
              prefixIcon: Icon(
        prefixIcon,
        color: AppColor.clr(AppColor.textGrey),
      )));
  EditText controller(TextEditingController controller) =>
      copyWith(controller: controller);
  EditText hint(String hint) => copyWith(hint: hint);
  EditText value(String value) => copyWith(value: value);
  EditText textInputAction(TextInputAction textInputAction) =>
      copyWith(textInputAction: textInputAction);
  EditText enable(bool enable) => copyWith(enable: enable);
  EditText label(bool label) => copyWith(label: label);
  EditText passwordType() => copyWith(password: true, lines: 1);
  EditText onFieldSubmitted(Function onFieldSubmitted) =>
      copyWith(onFieldSubmitted: onFieldSubmitted);
  EditText updateFunc(Function updateFunc) => copyWith(updateFunc: updateFunc);
  EditText validateFunc(Function validateFunc) =>
      copyWith(validateFunc: validateFunc);
  EditText iconData(IconData iconData) => copyWith(iconData: iconData);
  EditText prefixImage(String prefixImage) =>
      copyWith(prefixImage: prefixImage);
  EditText fontSize(double fontSize) => copyWith(fontSize: fontSize);
  EditText focusNode(FocusNode focusNode) => copyWith(focusNode: focusNode);
  EditText type(TextInputType type) => copyWith(type: type);
  EditText formatter(List<TextInputFormatter> formatter) =>
      copyWith(formatter: formatter);
  EditText noneDecoration() => copyWith(
          decoration: InputDecoration(
        errorBorder: InputBorder.none,
        label: null,
        labelStyle: null,
        labelText: null,
        focusedErrorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        border: InputBorder.none,
        hintText: this.hint,
        fillColor: Colors.transparent,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        hintStyle: const TextStyle(color: Colors.grey),
      ));
  EditText underLineDecoration() => copyWith(
          decoration: InputDecoration(
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.6)),
        label: null,
        labelStyle: null,
        labelText: null,
        alignLabelWithHint: true,
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.6)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColor.clr(AppColor.primaryColor), width: 0.6)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.6)),
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.6)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.6)),
        hintText: this.hint,
        fillColor: Colors.transparent,
        isDense: true,
        suffixIcon: this.suffixWidget,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        hintStyle: const TextStyle(color: Colors.grey),
      ));

  EditText borderDecoration(bool password) => copyWith(
        password: password,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.6),
            borderRadius: BorderRadius.circular(5),
          ),
          label:
              this.label ? AppText(this.hint, color: Colors.grey, ph: 4) : null,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.6),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColor.clr(AppColor.primaryColor), width: 0.6),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.6),
            borderRadius: BorderRadius.circular(5),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.6),
            borderRadius: BorderRadius.circular(5),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 0.6),
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: this.hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        lines: password ? 1 : lines,
      );

  EditText header() => copyWith(
          style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColor.clr(AppColor.textBlack),
      ));
  EditText body() => copyWith(
          style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColor.clr(AppColor.textBlack),
      ));
  EditText footer() => copyWith(
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w100,
          color: AppColor.clr(AppColor.textGrey),
        ),
      );
}
