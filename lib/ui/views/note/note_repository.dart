import 'package:mynote/repostory/local_repository.dart';
import 'package:mynote/repostory/repository.dart';

import 'note_model.dart';

class NoteRepository implements Repository<Note> {
  NoteRepository._internal(LocalRepository localRepo) {
    this.localRepo = localRepo;
  }

  static final _cache = <String, NoteRepository>{};

  factory NoteRepository() {
    return _cache.putIfAbsent('NoteRepository',
        () => NoteRepository._internal(LocalRepository.instance));
  }

  @override
  LocalRepository localRepo;

  @override
  Future<dynamic> insert(Note item) async {
    final db = await localRepo.db();
    return await db.insert(Note.tableName, item.toMap());
  }

  @override
  Future<dynamic> update(Note item) async {
    final db = await localRepo.db();
    return await db.update(Note.tableName, item.toMap(),
        where: 'id = ?', whereArgs: [item.id]);
  }

  @override
  Future<dynamic> delete(Note item) async {
    return await localRepo.db().then((db) => db.delete(Note.tableName,
        where: 'id' + ' = ?', whereArgs: [item.id]));
  }

  @override
  Future<List<Note>> items() async {
    final db = await localRepo.db();
    var maps = await db.query(Note.tableName);
    return Note.fromList(maps);
  }
}
