import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/presentation/bloc/app_bloc.dart';
import 'package:hotel/presentation/repo/repo.dart';


MultiBlocProvider buildAppBlocProviders(BuildContext context, Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<AppBloc>(
        create: (context) =>
            AppBloc(repo: RepositoryProvider.of<AppRepo>(context)),
      ),
      
    ],
    child: child,
  );
}
