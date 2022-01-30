abstract class NewStates {}

class NewInitialState extends NewStates{}

class NewBotNavState extends NewStates{}

class NewLoadingDataState extends NewStates{}

class NewBusinessDataState extends NewStates{}
class NewBusinessErrorDataState extends NewStates{
  late final String  error;
  NewBusinessErrorDataState(this.error);
}
class NewSportsDataState extends NewStates{}

class NewSportErrorDataState extends NewStates{
  late final String  error;
  NewSportErrorDataState(this.error);
}

class NewScienceDataState extends NewStates{}
class NewScienceErrorDataState extends NewStates{
  late final String  error;
  NewScienceErrorDataState(this.error);
}

class NewSearchDataState extends NewStates{}
class NewSearchErrorDataState extends NewStates{
  late final String  error;
  NewSearchErrorDataState(this.error);
}

class ChangeModeState extends NewStates{}



