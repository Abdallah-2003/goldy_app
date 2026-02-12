import 'package:bloc/bloc.dart';
import 'package:goldy_app/features/silver/data/models/silver_model.dart';
import 'package:goldy_app/features/silver/data/repos/silver_repo.dart';


part 'silver_state.dart';

class SilverCubit extends Cubit<SilverState> {
  final SilverRepo silverRepo;
  SilverCubit(this.silverRepo) : super(SilverInitialState());

  Future<void> getSilver() async {
    emit(SilverLoadingState());
    final res = await silverRepo.getSilver();
    res.fold(
      (error) {
        emit(SilverFailureState(errMessage: error));
      },
      (silverModel) {
        emit(SilverSuccessState(silverModel: silverModel));
      },
    );
  }
}
