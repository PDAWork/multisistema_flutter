import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/ui/information/pages/page_one.dart';
import 'package:provider/provider.dart';

enum indexPage { onePage, twoPage, thirePage }

class PageViewProvider with ChangeNotifier {
  PageController controller = PageController(keepPage: true);
  PageViewProvider() {}
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
      duration: Duration(milliseconds: 500),
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
    print("build");
    return Scaffold(
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
                                onTap: () {
                                  context.read<PageViewProvider>().back();
                                },
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
                        onPageChanged:
                            context.read<PageViewProvider>().initialPage,
                        controller: context.read<PageViewProvider>().controller,
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
                          Text('data3'),
                        ],
                      ),
                    ),
                    Consumer<PageViewProvider>(
                        key: UniqueKey(),
                        builder: (ctx, value, child) {
                          return value.index != 2
                              ? InkWell(
                                  onTap: () {
                                    context.read<PageViewProvider>().next();
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )
                              : SizedBox(
                                  width: 24,
                                );
                        }),
                  ],
                ),
              ),
              Consumer<PageViewProvider>(
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: Text('Пропустить')),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: value.index == 0
                                  ? Colors.white
                                  : const Color.fromARGB(160, 255, 128, 38),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: value.index == 1
                                  ? Colors.white
                                  : const Color.fromARGB(160, 255, 128, 38),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: value.index == 2
                                  ? Colors.white
                                  : const Color.fromARGB(160, 255, 128, 38),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      TextButton(onPressed: () {}, child: Text('Дальше'))
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
