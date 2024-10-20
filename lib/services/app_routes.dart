import 'package:get/get.dart';
import 'package:tradefolioo/view/screens/AuthScreen/login_screen.dart';
import 'package:tradefolioo/view/screens/AuthScreen/register_screen.dart';
import 'package:tradefolioo/view/screens/SplashScreen/splash_screen.dart';


class AppRoutes {
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String splashScreen = '/splash';
  static const String homeNavigationScreen = '/homeNavigationScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String createNewPostScreen = '/createNewPostScreen';
  static const String searchToMentionScreen = '/searchToMentionScreen';
  static const String profileScreen = '/profileScreen';
  static const String listUsersScreen = '/listUsersScreen';
  static const String listCommentsScreen = '/listCommentsScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String searchToChatScreen = '/searchToChatScreen';
  static const String inboxScreen = '/inboxScreen';
  static const String blockedContactsScreen = '/blockedContacts';
  static const String postDetailScreen = '/postDetailScreen';
  static const String viewImageScreen = '/viewImageScreen';
  static const String creatStoryScreen = '/creatStoryScreen';
  static const String viewStoryScreen = '/viewStoryScreen';

  

  static final List<GetPage> routes = [

    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: registerScreen, page: () => RegisterScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    
  ];
}