import 'package:ausetech_flutter_test/services/api_service.dart';
import 'package:ausetech_flutter_test/widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen  ({Key? key}):super(key: key);


  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<User>> _usersFuture;
  final ApiService _apiService = ApiService();
  @override
  void initState(){
    super.initState();
    _usersFuture =  _apiService.fetchUsers();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Text('Úser cards'),
  backgroundColor: Colors.blueAccent,
    ),
  body:FutureBuilder<List<User>> (future: _usersFuture,
  builder: (context,snapshot){
      if (snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
  }
      else if (snapshot.hasError){
        return Center(
        child: Text('Án error occured: ${snapshot.error}',
  textAlign: TextAlign.center,
  style: TextStyle(color: Colors.red),
  ),
        );
  }
   else if (snapshot.hasData)  {
     final users = snapshot.data!;
     return ListView.builder(itemCount: users.length,
  itemBuilder: (context,index){
       final user = users[index];

       return UserCard(user: user);
  },
  );
  }
  else{
  return Center(child: Text('No user found'));
  }
  },
    ),
    );
  }
}
