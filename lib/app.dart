import 'package:flutter/material.dart';
import 'package:mindinventory_practical/view/room_booking/room_booking_viewmodel.dart';
import 'package:provider/provider.dart';

import 'models/app.dart';
import 'view/room_booking/room_item_viewmodel.dart';
import 'view/splash_view/splash_view.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
final routeObserver = RouteObserver<PageRoute>();

class AppState extends State<App> {
  final _app = AppModel();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {}
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>.value(
      value: _app,
      child: Consumer<AppModel>(
        builder: (context, value, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<RoomBookingViewModel>(
                  create: (_) => RoomBookingViewModel()),
              ChangeNotifierProvider<RoomItemViewModel>(
                  create: (_) => RoomItemViewModel()),

            ],
            child: MaterialApp(
              builder: (BuildContext context, Widget? child) {
                final MediaQueryData data = MediaQuery.of(context);
                return MediaQuery(
                    child: child!, data: data.copyWith(textScaleFactor: 1));
              },
              title: 'Park App',
              navigatorKey: mainNavigatorKey,
              navigatorObservers: [routeObserver],
              debugShowCheckedModeBanner: false,
              home: SplashView(),
              routes: <String, WidgetBuilder>{},
            ),
          );
        },
      ),
    );
  }
}
