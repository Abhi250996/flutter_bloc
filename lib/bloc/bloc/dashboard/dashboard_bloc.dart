import 'package:bloc/bloc.dart';
import 'package:bloc_demo/Manager/preference_manager/manager_preference.dart';
import 'package:bloc_demo/bloc/bloc/dashboard/dashboard_event.dart';
import 'package:bloc_demo/bloc/bloc/dashboard/dashboard_state.dart';

import '../../product_list_bloc/product_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final _preferenceManager = PreferenceManager.instance;

  DashboardBloc() : super(LoadingDashboardState()) {
    on<DashboardLoadedEvent>((event, emit) async {
      emit(LoadingDashboardState());
      try {
        final user = await _preferenceManager.getUserData();

        emit(LoadedDashboardState(user!));
      } catch (e) {
        emit(ErrorDashboardState(e.toString()));
      }
    });
  }
}
