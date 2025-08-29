import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/get_all_orders_cubit/get_all_orders_cubit.dart';
import 'widgets/history_screen_body.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HistoryBody();
  }
}

class HistoryBody extends StatefulWidget {
  const HistoryBody({super.key});

  @override
  State<HistoryBody> createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllOrdersCubit>().getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllOrdersCubit, GetAllOrdersState>(
      builder: (context, state) {
        log(state.runtimeType.toString());
        if (state is GetAllOrdersSuccess) {
          return HistoryScreenBody(orders: state.orders.reversed.toList());
        } else if (state is GetAllOrdersFailure) {
          return Center(child: Text(state.message));
        } else if (state is GetAllOrdersLoading) {
          return const Center(child: Text('Loadung ...'));
        } else {
          return const Center(child: Text('no'));
        }
      },
    );
  }
}
