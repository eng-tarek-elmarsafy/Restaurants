import 'package:flutter/widgets.dart';
import '../../../../../constrains.dart';
import '../../../../../core/style/app_style.dart';

class RichTextWithAction extends StatelessWidget {
  const RichTextWithAction({
    super.key,
    required this.normalText,
    required this.actionText,
    this.onTap,
  });
  final String normalText;
  final String actionText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: normalText, style: AppStyle.subtitleStyle),
          TextSpan(
            text: actionText,
            style: AppStyle.subtitleStyle.copyWith(color: kSecondaryColor),
          ),
        ],
      ),
    );
  }
}
