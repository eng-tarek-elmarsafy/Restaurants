import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/features/history/presentation/manager/get_all_orders_cubit/get_all_orders_cubit.dart';
import 'package:restaurants/features/history/presentation/views/widgets/history_screen_body.dart';

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
        if (state is GetAllOrdersSuccess) {
          return HistoryScreenBody(orders: state.orders.reversed.toList());
        } else if (state is GetAllOrdersFailure) {
          return Center(child: Text(state.message));
        } else if (state is GetAllOrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('Error'));
        }
      },
    );
  }
}
