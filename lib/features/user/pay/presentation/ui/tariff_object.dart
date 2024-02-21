import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:multisitema_flutter/features/user/pay/presentation/state/cubit/tariff_object_cubit.dart';
import 'package:multisitema_flutter/routes/app_router.dart';
import 'package:multisitema_flutter/routes/router_utils.dart';

class TariffObject extends StatelessWidget {
  const TariffObject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тарифы объектов'),
      ),
      body: BlocBuilder<TariffObjectCubit, TariffObjectState>(
        builder: (context, state) {
          return switch (state) {
            TariffObjectInitial() || TariffObjectLoad() => const Center(
                child: CircularProgressIndicator(),
              ),
            TariffObjectSuccess(:final tariffObjects) => ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: tariffObjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tariffObjects[index].objectName,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Действие тарифа',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  const SizedBox(
                                    height: 2.5,
                                  ),
                                  tariffObjects[index].startDate == null
                                      ? const SizedBox()
                                      : Text(
                                          DateFormat('от dd MMMM yyyy', 'ru')
                                              .format(
                                            tariffObjects[index].startDate!,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                  const SizedBox(
                                    height: 2.5,
                                  ),
                                  tariffObjects[index].startDate == null
                                      ? SizedBox()
                                      : Text(
                                          DateFormat('до dd MMMM yyyy', 'ru')
                                              .format(tariffObjects[index]
                                                  .finishDate!),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                ],
                              ),
                              tariffObjects[index].finishDate == null
                                  ? ElevatedButton(
                                      onPressed: () {
                                        AppRouter.router.goNamed(
                                          Pages.tariff.screenName,
                                          pathParameters: {
                                            "objectId":
                                                "${tariffObjects[index].objectId}"
                                          },
                                        );
                                      },
                                      child: Text('Выбрать тариф'),
                                    )
                                  : DateTime.now().isAfter(
                                          tariffObjects[index].finishDate!)
                                      ? ElevatedButton(
                                          onPressed: () {
                                            AppRouter.router.goNamed(
                                              Pages.tariff.screenPath,
                                            );
                                          },
                                          child: Text('Выбрать тариф'),
                                        )
                                      : const SizedBox()
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
            TariffObjectError() => const Center(
                child: Text('Ошибка'),
              ),
          };
        },
      ),
    );
  }
}
