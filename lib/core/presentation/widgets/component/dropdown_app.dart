import '../../../../core/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class DropDownDynamicItems<T> extends StatelessWidget {
  final Function(T? item) updateFunction;
  final T? value;
  final String? label;
  final String hint;
  final List<T> items;
  final Widget Function(String title) dropDownItemWidget;
  final Widget Function(dynamic)? dropDownItemWidgetV2;
  const DropDownDynamicItems({
    super.key,
    required this.updateFunction,
    required this.value,
    required this.hint,
    required this.items,
    required this.dropDownItemWidget,
    this.dropDownItemWidgetV2,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<T>> dropDownMenuItems = items.map((item) {
      String id = item as String;
      String title = item;
      return DropdownMenuItem<T>(
        value: id as T,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: dropDownItemWidget(title),
        ),
      );
    }).toList();

    return DropdownButtonFormField<T>(
      isDense: true,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      style: const TextStyle(color: Colors.black),
      disabledHint: AppText(hint, pv: 0, ph: 0, color: Colors.grey),
      hint: AppText(hint, pv: 0, ph: 0, color: Colors.grey),
      items: dropDownMenuItems,
      value: value,
      onChanged: updateFunction,
      onSaved: updateFunction,
    );
  }
}
