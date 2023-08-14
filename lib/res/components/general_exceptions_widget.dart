import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GeneralExceptionWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const GeneralExceptionWidget({super.key,  this.onTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height:height*.15),
            const Icon(
              Icons.cloud_off,
              color: AppColor.redColor,
              size: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(AppLocalizations.of(context)!.general_exception,textAlign: TextAlign.center,),
            ),
            SizedBox(height:height*.15),
            GestureDetector(
              onTap: onTap,
              child: Container(
               height: 44,
                width: 160,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(child: Text("Retry",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
