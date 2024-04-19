import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_sona/features/home/presentation/screen/home_screen.dart';
import 'package:pokedex_sona/misc/constant/router_constant.dart';

class MainRouter {
  GoRouter generateRoute() {
    return GoRouter(
      initialLocation: '/${RouterConstant.homeRouteName}',
      routes: [
        GoRoute(
          path: '/${RouterConstant.homeRouteName}',
          name: RouterConstant.homeRouteName,
          pageBuilder: (context, state) => MaterialPage(child: const HomeScreen()),
        ),
      ],
    );
  }
}
