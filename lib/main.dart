import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_sona/core/di/service_locator.dart';
import 'package:pokedex_sona/features/app/app.dart';
import 'package:pokedex_sona/misc/utils/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  Bloc.observer = AppBlocObserver();

  runApp(const MainApp());
}
