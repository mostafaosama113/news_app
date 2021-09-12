abstract class NewsStates {}

class NewsInitStates extends NewsStates {}

class NewsBottomNavStates extends NewsStates {}

class NewsGetBusinessLoadingStates extends NewsStates {}

class NewsGetBusinessSuccessStates extends NewsStates {}

class NewsGetBusinessErrorStates extends NewsStates {
  final String error;
  NewsGetBusinessErrorStates(this.error);
}

class NewsGetSportsLoadingStates extends NewsStates {}

class NewsGetSportsSuccessStates extends NewsStates {}

class NewsGetSportsErrorStates extends NewsStates {
  final String error;
  NewsGetSportsErrorStates(this.error);
}

class NewsGetScienceLoadingStates extends NewsStates {}

class NewsGetScienceSuccessStates extends NewsStates {}

class NewsGetScienceErrorStates extends NewsStates {
  final String error;
  NewsGetScienceErrorStates(this.error);
}

class ToggleDarkMode extends NewsStates {}

class NewsSearchSuccessStates extends NewsStates {}

class NewsSearchLoadingStates extends NewsStates {}

class NewsSearchErrorStates extends NewsStates {
  final String error;
  NewsSearchErrorStates(this.error);
}
