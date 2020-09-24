abstract class NavigationService{
  void navigateToHome();
  void goBack();
  void goBackAndRemoveUntil(List<String> routeNames);
}