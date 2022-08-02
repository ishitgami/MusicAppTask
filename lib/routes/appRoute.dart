import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/data_provider/data_provider.dart';
import 'package:musicapp/data/dio/dio.dart';
import 'package:musicapp/logic/cubit/music_cubit.dart';
import 'package:musicapp/screen/homeScreen.dart';

const String homeScreenRoute = '/';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MusicCubit(
              dataProvider: DataProvider(
                dioClient: DioClient(),
              ),
            ),
            child: const HomeScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
