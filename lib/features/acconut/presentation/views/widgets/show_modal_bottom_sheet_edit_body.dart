import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/widgets/close_show_modal_bottom.dart';
import 'package:restaurants/core/widgets/custom_button.dart';
import 'package:restaurants/core/widgets/custom_text_form_field.dart';
import 'package:restaurants/features/acconut/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';

class ShowModalBottomSheetEditBody extends StatefulWidget {
  const ShowModalBottomSheetEditBody({
    super.key,
    required this.title,
    required this.action,
    required this.onSave,
  });
  final String title;
  final String action;
  final Function(String value) onSave;
  @override
  State<ShowModalBottomSheetEditBody> createState() =>
      _ShowModalBottomSheetEditBodyState();
}

class _ShowModalBottomSheetEditBodyState
    extends State<ShowModalBottomSheetEditBody> {
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;
  late String edit;
  @override
  void initState() {
    formKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10, width: double.infinity),
              const CloseShowModalBottom(),
              const SizedBox(height: 20),
              Text(widget.title, style: AppStyle.titleStyle),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: widget.title,
                onSaved: (value) {
                  edit = value!;
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'من فضلك ادخل النص';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                title: 'حفظ',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<UpdateUserDataCubit>().updateUserData({
                      widget.action: edit,
                    });
                    widget.onSave(edit);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 80),
              // const Flexible(child: LogoApp()),
            ],
          ),
        ),
      ),
    );
  }
}
