import 'package:fitness_app/screens/myFavorites_screen/myFavotites_cubit/myFavorites_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavouritesCubit extends Cubit<MyFavouritesState> {
  MyFavouritesCubit() : super(MyFavouritesInitial());

  // static MyFavouritesCubit get(context) => BlocProvider.of(context);

  void buildMyFavourites(String category) {
    if (category == 'Workout') {
      emit(WorkOutState());
    } else if (category == 'Meal') {
      emit(MealState());
    }
  }
}
