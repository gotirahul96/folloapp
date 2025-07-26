import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/analytics_data.dart';
import '../../domain/usecases/get_analytics.dart';
import '../../../../core/usecases/usecase.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final GetAnalytics getAnalytics;
  AnalyticsBloc({required this.getAnalytics}) : super(AnalyticsInitial()) {
    on<LoadAnalytics>(_onLoad);
  }

  Future<void> _onLoad(LoadAnalytics event, Emitter<AnalyticsState> emit) async {
    emit(AnalyticsLoading());
    final result = await getAnalytics(NoParams());
    result.fold(
      (failure) => emit(AnalyticsFailure(failure.message)),
      (data) => emit(AnalyticsLoaded(data)),
    );
  }
}
