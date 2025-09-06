import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/widgets/custom_text_field.dart';
import 'package:restaurants/core/widgets/custom_text_form_field.dart';
import 'package:restaurants/core/widgets/logo_app.dart';
import 'package:restaurants/features/cart/domain/entites/ordar_entity.dart';
import 'package:restaurants/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:restaurants/features/cart/presentation/manager/add_order_cubit/order_cubit.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/order_actions.dart';

class OrderBottomSheetBody extends StatefulWidget {
  const OrderBottomSheetBody({super.key});

  @override
  State<OrderBottomSheetBody> createState() => _OrderBottomSheetBodyState();
}

class _OrderBottomSheetBodyState extends State<OrderBottomSheetBody> {
  late final TextEditingController _controllerName;
  late final TextEditingController _controllerPhone;
  late final TextEditingController _controllerAddress;
  late final TextEditingController _controllerNotes;
  late AutovalidateMode _autovalidateMode;
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _controllerName = TextEditingController();
    _controllerPhone = TextEditingController();
    _controllerAddress = TextEditingController();
    _controllerNotes = TextEditingController();
    _autovalidateMode = AutovalidateMode.disabled;
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerPhone.dispose();
    _controllerAddress.dispose();
    _controllerNotes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          const LogoApp(),
          CustomTextField(
            hintText: Prefs.getString(kUserName),
            controller: _controllerName,
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: Prefs.getString(kUserphone),
            controller: _controllerPhone,
            textInputType: TextInputType.phone,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: Prefs.getString(kAddress) ?? 'العنوان غير محدد',
            controller: _controllerAddress,
            textInputType: TextInputType.streetAddress,
            autovalidateMode: _autovalidateMode,
            validator: (value) {
              if (value!.isEmpty && Prefs.getString(kAddress) == null) {
                return 'الرجاء ادخال العنوان';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(hintText: 'الملاحظات', controller: _controllerNotes),
          const SizedBox(height: 50),
          OrderActions(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                final ordar = OrderEntity(
                  userName:
                      _controllerName.text.isEmpty
                          ? Prefs.getString(kUserName)
                          : _controllerName.text,
                  phoneNumber:
                      _controllerPhone.text.isEmpty
                          ? Prefs.getString(kUserphone)
                          : _controllerPhone.text,
                  address:
                      _controllerAddress.text.isEmpty
                          ? Prefs.getString(kAddress)
                          : _controllerAddress.text,
                  notes: _controllerNotes.text,
                  totalPrice:
                      context
                          .read<CartCubit>()
                          .cartEntity
                          .calculateTotalPrice(),
                  cartItems: context.read<CartCubit>().cartEntity.cartItems,
                );
                Navigator.pop(context);
                context.read<AddOrderCubit>().addOrder(entity: ordar);
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
