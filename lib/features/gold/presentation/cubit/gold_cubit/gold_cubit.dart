import 'package:bloc/bloc.dart';
import 'package:goldy_app/features/gold/data/models/gold_model.dart';
import 'package:goldy_app/features/gold/data/repos/gold_repo.dart';

part 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GoldRepo goldRepo;
  GoldCubit(this.goldRepo) : super(GoldInitialState());

  Future<void> getGold() async {
    emit(GoldLoadingState());
    final res = await goldRepo.getGold();
    res.fold(
      (error) {
        emit(GoldFailureState(errMessage: error));
      },
      (goldModel) {
        emit(GoldSuccessState(goldModel: goldModel));
      },
    );
  }
}
