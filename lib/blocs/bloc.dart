import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

 class Bloc extends Object with Validators{
    final _email = BehaviorSubject<String>();
    final _password = BehaviorSubject<String>();

    Stream<String> get email => _email.stream.transform(validateEmail);
    Stream<String> get password => _password.stream.transform(validatePass);

    Stream<bool> get submitValidate => Observable.combineLatest2(email, password, (e,p)=> true);

    Function(String) get changeEmail => _email.sink.add;
    Function(String) get changePassword => _password.sink.add;

    submit(){
         final validEmail = _email.value;
         final validPass = _email.value;

         print('Email is $validEmail and Password is $validPass');
    }
    
    dispose(){
      _email.close();
      _password.close();
    }
 }

 




// class Bloc extends Object with Validators {
//   final _email =   StreamController<String>();
//   final _passWord =   StreamController<String>();

//   // Add data to stream
//   Stream<String> get email=> _email.stream.transform(emailValidate);
//   Stream<String> get password=> _passWord.stream.transform(passValidate);

//    // Change Data
//   Function(String) get changeEmail => _email.sink.add;
//   Function(String) get passwordChange => _passWord.sink.add;

//   dispose(){
//     _email.close();
//     _passWord.close();
//   }
// }

// final bloc = Bloc();