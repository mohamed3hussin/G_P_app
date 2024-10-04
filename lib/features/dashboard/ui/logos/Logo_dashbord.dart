import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/dashBoardCubit/dashboard_cubit.dart';
import '../../logic/dashBoardCubit/dashboard_state.dart';
import 'widgets/dashboard_logo_item.dart';

class LogoDashboard extends StatefulWidget {
  static const String routeName = 'logo_dashboard_view';

  const LogoDashboard({super.key});

  @override
  State<LogoDashboard> createState() => _LogoDashboardState();
}

class _LogoDashboardState extends State<LogoDashboard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      bloc: DashboardCubit.get(context),
      builder: (context, state) {
        var cubit = DashboardCubit.get(context);
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return DashboardLogoItem(
                index: index,
                logo: cubit.logo?[index],
                cubit: cubit,
              );
            },
            itemCount: cubit.logo?.length ?? 0,
          ),
        );
      },
    );
  }
}
