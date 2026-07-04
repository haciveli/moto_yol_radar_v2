import '../models/danger_model.dart';

class DangerService {
  static final List<DangerModel> dangers = [];

  static void addDanger(DangerModel danger) {
    dangers.add(danger);
  }
}