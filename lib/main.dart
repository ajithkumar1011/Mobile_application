import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'mobile_shop_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authService = AuthService();
  final bool loggedIn = await authService.isLoggedIn();

  runApp(MyApp(isLoggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MobileShopApp(isLoggedIn: isLoggedIn);
  }
}
