import 'package:injectable/injectable.dart';
import 'package:note/domain/repository/title_repository.dart';

@dev //dev 환경일 때 주입
@Singleton(as: TitleRepository)
class MockTitleRepositoryImpl implements TitleRepository {
  @override
  String getTitle() {
    return 'My Note(Dev)';
  }
}