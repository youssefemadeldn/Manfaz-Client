import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../data/models/home_tab_model.dart';
import '../repo/base_home_tab_repo.dart';

@injectable
class HomeTabUseCase {
  final BaseHomeTabRepo baseHomeTabRepo;

  HomeTabUseCase(this.baseHomeTabRepo);

  Future<Either<Failure, HomeTabModel>> getHomeTabData() =>
      baseHomeTabRepo.getHomeTabData();
}
