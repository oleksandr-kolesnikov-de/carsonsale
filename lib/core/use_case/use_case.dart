/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2025                                               */
/* ********************************************************************************************* */


// [UseCase] is an abstract class that contains the list of all possible use cases.
// It is used to handle use cases in the application.

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
