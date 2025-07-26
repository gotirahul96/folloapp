import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/constants.dart';
import 'features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';

void main() {
  runApp(const FolloApp());
}

class FolloApp extends StatelessWidget {
  const FolloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DashboardBloc(getDashboardData: () => throw UnimplementedError())),
      ],
      child: MaterialApp(
        title: 'FolloApp',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
        routes: {
          Routes.dashboard: (_) => const DashboardPage(),
        },
        initialRoute: Routes.dashboard,
      ),
    );
  }
}
