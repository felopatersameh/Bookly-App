import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeys {
  static String secretKey = dotenv.get('secretKey');
  static String publishKey = dotenv.get('publishKey');
  static String idCostumer = dotenv.get('idCostumer');
  static const num dolorToday = 48.90;
}
