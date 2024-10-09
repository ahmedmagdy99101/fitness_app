import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> goalsLabels = [
    'Loose Weight',
    'Gain Weight',
    'Body Building',
    'Healthy',
  ];

  int? selectedGoal;

  void selectGoal(int index) {
    emit(HomeInitial());
    selectedGoal = index;
    emit(ChangeGoalState());
  }
}
