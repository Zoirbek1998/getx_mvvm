import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.loading = false,
      required this.title,
      this.height = 50,
      this.width = 50,
      this.onPassed,
      this.textColor = AppColor.primaryTextColor,
      this.buttonColor = AppColor.primaryButtonColor});

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback? onPassed;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPassed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: textColor),
                ),
              ),
      ),
    );
  }
}
