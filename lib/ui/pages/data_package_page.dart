import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/data_plan_form/data_plan_form_bloc.dart';
import 'package:bank_sha/models/data_plan_form_model.dart';
import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operator;

  const DataPackagePage({
    Key? key,
    required this.operator,
  }) : super(key: key);

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data',
        ),
      ),
      body: BlocProvider(
        create: (context) => DataPlanFormBloc(),
        child: BlocConsumer<DataPlanFormBloc, DataPlanFormState>(
          listener: (context, state) {
            if (state is DataPlanFormSuccess) {
              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      selectedDataPlan!.price! * -1,
                    ),
                  );
              Navigator.pushNamedAndRemoveUntil(
                  context, '/data-success', (route) => false);
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Phone Number',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomFormField(
                  title: '+628',
                  isShowTitle: false,
                  controller: phoneController,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Select Package',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Wrap(
                  spacing: 17,
                  runSpacing: 17,
                  children: widget.operator.dataPlans!.map((dataPlan) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDataPlan = dataPlan;
                        });
                      },
                      child: PackageItem(
                        dataPlan: dataPlan,
                        isSelected: dataPlan.id == selectedDataPlan?.id,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 85,
                ),
                if (selectedDataPlan != null && phoneController.text.isNotEmpty)
                  CustomFilledButton(
                    title: 'Continue',
                    onPressed: () async {
                      if (await Navigator.pushNamed(context, '/pin') == true) {
                        final authState = context.read<AuthBloc>().state;
                        String pin = '';
                        if (authState is AuthSuccess) {
                          pin = authState.data.pin!;
                        }

                        context.read<DataPlanFormBloc>().add(
                              DataPlanFormPost(
                                DataPlanFormModel(
                                  dataPlanId: selectedDataPlan!.id.toString(),
                                  phoneNumber: phoneController.text,
                                  pin: pin,
                                ),
                              ),
                            );
                      }
                    },
                  ),
                const SizedBox(
                  height: 57,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
