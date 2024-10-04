import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/features/dashboard/ui/logos/edit_logo_screen/edit_logo_form.dart';
import '../../../logic/dashBoardCubit/dashboard_cubit.dart';
import '../../../logic/dashBoardCubit/dashboard_state.dart';

class EditLogoScreen extends StatelessWidget {
  static const String routeName = 'edit_logo';
  final String logoName;
  final String logoPrice;
  final String productQuantity;
  final int logoId;
  final String networkImage;

  EditLogoScreen(this.logoName, this.logoPrice, this.productQuantity,
      this.logoId, this.networkImage,
      {super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        var cubit = DashboardCubit.get(context);
        return Scaffold(
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildHeader(context),
                    EditLogoForm(
                        logoName: logoName,
                        productQuantity: productQuantity,
                        logoPrice: logoPrice,
                        networkImage: networkImage,
                        cubit: cubit,
                        formKey: _formKey,
                        logoId: logoId)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        const Text('Edit Logo', style: TextStyle(fontWeight: FontWeight.bold)),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
