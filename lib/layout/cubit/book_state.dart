
abstract class BookStates {}

class InitialState extends BookStates {}
class SuccessGetData extends BookStates{}
class LoadingData  extends BookStates{}
class FailedGetData extends BookStates{}