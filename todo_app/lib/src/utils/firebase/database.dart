import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseMethods{
  Future addTodo(Map<String,dynamic> todo, String id) async{
    return await FirebaseFirestore.instance.collection("Todo").doc(id).set(todo);
  }

  Future updateTodo(Map<String,dynamic> todo, String id) async{
    return await FirebaseFirestore.instance.collection("Todo").doc(id).update(todo);
  }

  Future<List<DocumentSnapshot>> getTodo() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("Todo").get();
    return querySnapshot.docs;
  }

  Future deleteTodo(String id) async{
    return await FirebaseFirestore.instance.collection("Todo").doc(id).delete();
  }


}