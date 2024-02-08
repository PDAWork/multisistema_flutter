import 'package:flutter/material.dart';
import 'package:multisitema_flutter/routes/app_router.dart';
import 'package:multisitema_flutter/routes/router_utils.dart';
import 'package:multisitema_flutter/style/app_theme.dart';
import 'package:provider/provider.dart';

import 'pages/page_one.dart';

class PageViewProvider with ChangeNotifier {
  PageController controller = PageController(keepPage: true);

  int index = 0;

  void initialPage(int value) {
    index = value;
    notifyListeners();
  }

  void next() {
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void back() {
    controller.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Consumer<PageViewProvider>(
                        key: UniqueKey(),
                        builder: (ctx, value, child) {
                          return value.index != 0
                              ? InkWell(
                                  onTap: context.read<PageViewProvider>().back,
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                )
                              : const SizedBox(
                                  width: 24,
                                );
                        },
                      ),
                      Expanded(
                        child: PageView(
                          physics: const BouncingScrollPhysics(),
                          onPageChanged:
                              context.read<PageViewProvider>().initialPage,
                          controller:
                              context.read<PageViewProvider>().controller,
                          children: const [
                            PageOne(
                              path: 'assets/pctr_widget.png',
                              header: "Виджеты",
                              title:
                                  'Вы можете добавить виджет на рабочий стол вашего смартфона',
                            ),
                            PageOne(
                              path: 'assets/pctr_graphic.png',
                              header: "Графики",
                              title:
                                  "Анализируйте расход с точностью до часа дня месяца на графиках. Графики можно масшабировать двумя пальцами",
                            ),
                            PageOne(
                              path: 'assets/pctr_events.png',
                              header: "Активация датчиков",
                              title:
                                  "Получайте информацию о времени и продолжительности срабатывания датчиков",
                            ),
                          ],
                        ),
                      ),
                      Consumer<PageViewProvider>(
                        key: UniqueKey(),
                        builder: (ctx, value, child) {
                          return value.index != 2
                              ? InkWell(
                                  onTap: context.read<PageViewProvider>().next,
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )
                              : const SizedBox(width: 24);
                        },
                      ),
                    ],
                  ),
                ),
                Consumer<PageViewProvider>(
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextButton(
                            onPressed: () => AppRouter.router.go(
                              Pages.splashScreen.screenPath,
                            ),
                            style: ButtonStyle(
                              textStyle: MaterialStatePropertyAll(
                                  Theme.of(context).textTheme.labelMedium),
                            ),
                            child: const Text('ПРОПУСТИТЬ'),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 7.5,
                                height: 7.5,
                                decoration: BoxDecoration(
                                  color: value.index == 0
                                      ? Colors.white
                                      : style().$2,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                width: 7.5,
                                height: 7.5,
                                decoration: BoxDecoration(
                                  color: value.index == 1
                                      ? Colors.white
                                      : style().$2,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                width: 7.5,
                                height: 7.5,
                                decoration: BoxDecoration(
                                  color: value.index == 2
                                      ? Colors.white
                                      : style().$2,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextButton(
                            onPressed: () {
                              if (value.index == 2) {
                                AppRouter.router.go(
                                  Pages.splashScreen.screenPath,
                                );
                              }
                              context.read<PageViewProvider>().next();
                            },
                            style: ButtonStyle(
                              textStyle: MaterialStatePropertyAll(
                                  Theme.of(context).textTheme.labelMedium),
                            ),
                            child: value.index != 2
                                ? const Text('ДАЛЬШЕ')
                                : const Text("НАЧАТЬ РАБОТУ"),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
