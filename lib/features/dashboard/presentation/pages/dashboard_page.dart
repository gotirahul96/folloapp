import 'package:flutter/material.dart';
import '../../bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          // Placeholder UI
          return const Center(child: Text('Dashboard'));
        },
      ),
    );
  }
}
