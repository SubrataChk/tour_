import 'package:get/get.dart';
import 'package:tour_application/src/global/language/ban.dart';
import 'package:tour_application/src/global/language/eng.dart';

class AppLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}
