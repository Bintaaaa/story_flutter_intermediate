class NavigationRoutesName {
  const NavigationRoutesName();

  String get splashName => "splash";
  String get splashPath => "/";

  String get optionalAuthName => "optionalAuth";
  String get optionalAuthPath => "/auth/optional";

  String get signUpName => "signup";
  String get signUpPath => "/auth/sign-up";

  String get signInName => "signIn";
  String get signInPath => "/auth/sign-in";

  String get storiesName => "listStory";
  String get storiesPath => "/stories/list";

  String get createStoriesName => "createStory";
  String get createStoriesPath => "/stories/create";
}
