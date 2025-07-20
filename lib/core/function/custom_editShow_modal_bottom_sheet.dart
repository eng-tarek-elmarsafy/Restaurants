import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/features/acconut/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:restaurants/features/acconut/presentation/views/widgets/show_modal_bottom_sheet_edit_body.dart';

Future<dynamic> customEditShowModalBottomSheet(
  BuildContext context, {
  required String title,
  required String action,
}) {
  late String edit;
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder:
        (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BlocConsumer<UpdateUserDataCubit, UpdateUserDataState>(
            listener: (context, state) {
              if (state is UpdateUserDataSuccess) {
                Navigator.pop(context);
                Prefs.setString(action, edit);
              } else if (state is UpdateUserDataFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.err)));
              }
            },
            builder: (context, state) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ModalProgressHUD(
                  inAsyncCall: state is UpdateUserDataLoading,
                  child: ShowModalBottomSheetEditBody(
                    title: title,
                    action: kUserphone,
                    onSave: (String value) {
                      edit = value;
                    },
                  ),
                ),
              );
            },
          ),
        ),
  );
}
