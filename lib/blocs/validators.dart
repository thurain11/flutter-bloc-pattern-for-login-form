import 'dart:async';

class Validators{
  final validateEmail = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
        if(email.contains('@')){
          sink.add(email);
        }else{
          sink.addError('Please! Enter your email');
        }
    }
  );

  final validatePass = StreamTransformer<String,String>.fromHandlers(
    handleData: (pass,sink){
      if(pass.length > 5){
        sink.add(pass);
      }else{
        sink.addError('At least 6 charaters for password');
      }
    }
  );

}


































// class Validators {
  
//   final emailValidate = StreamTransformer<String,String>.fromHandlers(
//         handleData: (email,sink){
//           if(email.contains('@')){
//             sink.add(email);
//           }else{
//             sink.addError('Please your email address');
//           }
//         }
//   );

//   final passValidate = StreamTransformer<String,String>.fromHandlers(
//         handleData: (pass,sink){
//           if(pass.length > 5){
//             sink.add(pass);
//           }else{
//             sink.addError('password must be at least 6 charaters');
//           }
//         }
//   );


// }