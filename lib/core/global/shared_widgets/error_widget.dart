import 'package:flutter/material.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';

class ErrorWidgetWithReload extends StatelessWidget {
  final void Function()? onPress;
  const ErrorWidgetWithReload({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '!هناك خطأ في الاتصال',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 180,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColorsLight.orangeColor3,
              ),
              onPressed: onPress,
              child: Text(
                'إعادة الاتصال',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 20).copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
