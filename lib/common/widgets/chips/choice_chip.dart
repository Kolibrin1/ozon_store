import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = AppFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? AppColors.white : null),
        avatar: isColor
            ? CircularContainer(
                width: 50,
                height: 50,
                backgroundColor: AppFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? AppFunctions.getColor(text)! : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        selectedColor: isColor ? AppFunctions.getColor(text)! : null,
      ),
    );
  }
}
