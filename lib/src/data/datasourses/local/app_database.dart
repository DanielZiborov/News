import 'package:floor/floor.dart';
import 'package:news/src/data/datasourses/local/converters/source_type_converter.dart';
import 'package:news/src/data/datasourses/local/dao/articles_dao.dart';
import 'package:news/src/domain/models/article.dart';

part 'app_database.g.dart';

@TypeConverters([SourceTypeConverter])
@Database(version: 1, entities: [Article])
abstract class AppDatabase extends FloorDatabase{
  ArticleDao get articleDao;
}

