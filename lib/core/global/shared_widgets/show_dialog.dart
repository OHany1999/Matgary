import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/shared_widgets/elvated_bottom.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';

class GlobalShowDialog {
  final String titleText;
  final String questionText;
  final void Function()? onPressForAccept;
  final void Function()? onPressForRefuse;

  GlobalShowDialog(
      {required this.titleText,
      required this.questionText,
      required this.onPressForAccept,
      required this.onPressForRefuse});

  void globalShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 220.h, horizontal: 20.w),
          child: Card(
            color: Colors.white,
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleText,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: 200.w,
                  child: Text(
                    questionText,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColorsLight.orangeColor3, fontSize: 20),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                GlobalElevatedButton(
                  onPress: onPressForAccept,
                  bottomSize: Size(120, 45),
                  bottomText: 'موافقة',
                  bottomPadding:
                      EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  fontSize: 20,
                ),
                TextButton(
                  onPressed: onPressForRefuse,
                  child: Text(
                    'رفض',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
