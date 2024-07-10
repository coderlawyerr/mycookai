import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycooksai/model/user_model.dart';

class DatabaseService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user)async{
    try{
      await _firestore.collection('users').doc(user.userId).set(user.toMap());
    }catch(e){
      print("database service'te create user fonksiyonunda HATA: ${e.toString()}");
    }
  }

  Future<UserModel?> getUser(String userId) async{
    try{
      DocumentSnapshot doc = await  _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    }catch(e){
      print("database service'teki get user fonksiyonunda HATA: ${e.toString()}");
    }
  }

}