import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/features/user/pay/presentation/state/cubit/tariff_cubit.dart';
import 'package:multisitema_flutter/routes/app_router.dart';
import 'package:multisitema_flutter/routes/router_utils.dart';
import 'package:multisitema_flutter/style/color.dart';

class Tarrif extends StatelessWidget {
  const Tarrif({super.key, required this.objectId});
  final int objectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тарифы'),
      ),
      body: BlocConsumer<TariffCubit, TariffState>(
        listener: (context, state) {
          if (state is TariffPay) {
            print(state.payEntity.orderId);
            AppRouter.router.goNamed(
              Pages.pay.screenName,
              extra: state.payEntity,
              pathParameters: {
                "objectId": "$objectId",
              },
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            TariffError() => const Center(
                child: Text('Ошибочка'),
              ),
            TariffLoad() => const Center(
                child: CircularProgressIndicator(),
              ),
            TariffSuccess(:final tariffs) => ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: tariffs.length,
                itemBuilder: (contex, index) {
                  return Card(
                    child: ListTile(
                      trailing: ElevatedButton(
                        onPressed: () async {
                          await contex.read<TariffCubit>().onPay(
                                tariffId: tariffs[index].id,
                                objectId: objectId,
                              );
                        },
                        child: const Text('Купить'),
                      ),
                      title: Text(
                        tariffs[index].name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        '${tariffs[index].cost} ₽',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: primaryColor),
                      ),
                    ),
                  );
                }),
            _ => const SizedBox()
          };
        },
      ),
    );
  }
}
