import 'local_repository.dart';

/// Lớp trừu tượng để cho các model thừa kế và dùng trong việc
/// thêm / sửa / xóa và lấy dữ liệu (Create, Read, Update, Delete - CRUD)
abstract class Repository<T> {
  LocalRepository localRepo;

  Future<dynamic> insert(T item);

  Future<dynamic> update(T item);

  Future<dynamic> delete(T item);

  Future<List<T>> items();
}
