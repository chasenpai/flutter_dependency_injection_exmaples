import 'package:injectable/injectable.dart';
import 'package:note/domain/repository/title_repository.dart';

@prod //prod 환경일 때 주입
@Singleton(as: TitleRepository)
class TitleRepositoryImpl implements TitleRepository {
  @override
  String getTitle() {
    return 'My Note';
  }
}