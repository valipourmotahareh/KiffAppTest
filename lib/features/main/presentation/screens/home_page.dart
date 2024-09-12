import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiff_app_test/config/constant/assets.dart';
import 'package:kiff_app_test/features/main/presentation/Widgets/app_bar_painter.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/screens/show_list.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/screens/tab_five.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/screens/tab_four.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/screens/tab_three.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/screens/tab_two.dart';
import 'package:kiff_app_test/features/main/presentation/Widgets/fade_indexed_stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late int currentIndex;
  final List<int> _history = [];
  late List<GlobalKey<NavigatorState>> navigatorKeys;

  void _onPopInvoked(bool canPop) {
    final NavigatorState? currentState =
        navigatorKeys[currentIndex].currentState;
    if (currentState?.canPop() ?? false) {
      currentState?.pop();
    } else if (_history.isNotEmpty) {
      setState(() {
        currentIndex = _history.last;
        _history.removeLast();
      });
    } else if (_history.isEmpty) {
      SystemNavigator.pop();
    }
  }

  double horizontalPadding = 00.0;
  double horizontalMargin = 00.0;
  int noOfIcons = 5;
  late double position;
  List<String> icons = [
    Assets.menu,
    Assets.list,
    Assets.swap,
    Assets.fileFolder,
    Assets.home
  ];

  late AnimationController controller;
  late Animation<double> animation;
  int selected = 0;

  @override
  void initState() {
    currentIndex = 0;
    navigatorKeys = List.generate(5, (index) => GlobalKey<NavigatorState>());
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 375));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    animation = Tween(begin: getEndPosition(0), end: getEndPosition(2)).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
    position = getEndPosition(0);
    super.didChangeDependencies();
  }

  double getEndPosition(int index) {
    double totalMargin = 2 * horizontalMargin;
    double totalPadding = 2 * horizontalPadding;
    double valueToOmit = totalMargin * totalPadding;
    return (((MediaQuery.of(context).size.width - valueToOmit) / noOfIcons) *
                index +
            horizontalPadding) +
        (((MediaQuery.of(context).size.width - valueToOmit) / noOfIcons) / 2) -
        70;
  }

  void animateDrop(int index) {
    animation = Tween(begin: position, end: getEndPosition(index)).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
    controller.forward().then((value) {
      position = getEndPosition(index);
      controller.dispose();
      controller = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 375));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: const Color(0xff0e1a2a),
          primary: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            actions: [
              Stack(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 16,
                    top: 11,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 9,
                        minHeight: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: AppBarPainter(animation.value),
                  size: Size(
                      MediaQuery.of(context).size.width -
                          (2 * horizontalMargin),
                      90.0),
                  child: SizedBox(
                    height: 120.0,
                    width: MediaQuery.of(context).size.width -
                        (2 * horizontalMargin),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Row(
                        children: icons.map<Widget>((icon) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                animateDrop(icons.indexOf(icon));
                                selected = icons.indexOf(icon);
                                _history.remove(currentIndex);
                                _history.add(currentIndex);
                                currentIndex = selected;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 575),
                              curve: Curves.easeOut,
                              height: 105,
                              width: (MediaQuery.of(context).size.width -
                                      (2 * horizontalMargin) -
                                      (2 * horizontalMargin)) /
                                  5,
                              padding: const EdgeInsets.only(
                                  bottom: 17.5, top: 22.5),
                              alignment: selected == icons.indexOf(icon)
                                  ? Alignment.topCenter
                                  : Alignment.bottomCenter,
                              child: SizedBox(
                                height: 35.0,
                                width: 35.0,
                                child: Center(
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 375),
                                    switchInCurve: Curves.easeIn,
                                    switchOutCurve: Curves.easeInOut,
                                    child: selected == icons.indexOf(icon)
                                        ? SvgPicture.asset(
                                            icon,
                                            width: 40.0,
                                            colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer,
                                                BlendMode.srcIn),
                                            key: ValueKey('yellow$icon'),
                                          )
                                        : SvgPicture.asset(
                                            icon,
                                            width: 40.0,
                                            colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondaryContainer,
                                                BlendMode.srcIn),
                                            key: ValueKey('white$icon'),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              }),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xff0e1a2a)),
                child: FadeIndexedStack(
                  index: currentIndex,
                  children: List.generate(
                    5,
                    (index) => _pageNavigator(index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageNavigator(int index) {
    GlobalKey<NavigatorState> key = navigatorKeys[index];
    return key.currentState == null && currentIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                offstage: currentIndex != index,
                child: switch (index) {
                  0 => const ShowList(),
                  1 => const TabTwo(),
                  2 => const TabThree(),
                  3 => const TabFour(),
                  4 => const TabFive(),
                  int() => const Center(child: Text('Not Defined!')),
                },
              ),
            ),
          );
  }
}
