import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/presentation/di/di.dart';
import 'package:hotel/presentation/repo/repo.dart';

MultiRepositoryProvider buildAppProviders(Widget child) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => DioSettings(),
      ),
      RepositoryProvider(
        create: (context) =>
            AppRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
      ),
    ],
    child: child,
  );
}
