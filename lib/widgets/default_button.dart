import 'package:flutter/material.dart';
import 'package:smartdust/themes/colors.dart';
import 'package:smartdust/utils/screen_size.dart';

class DefaultButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final bool isEnable;
  final int? width;
  final int? height;

  const DefaultButton({
    super.key,
    required this.content,
    required this.onPressed,
    this.isEnable = true,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        fixedSize: Size(
          width != null ? width!.toDouble() : ScreenSize.width(context, 336),
          height != null ? height!.toDouble() : ScreenSize.height(context, 52),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        foregroundColor: Colors.white,
        backgroundColor: isEnable ? AppColors.mainPrimary : AppColors.gray100,
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
      child: Text(content),
    );
  }
}
