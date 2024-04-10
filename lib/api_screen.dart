import 'package:flutter/material.dart';

import 'api_model.dart';
import 'api_service.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  late List<Assignment > _assignment  = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadAssignments();
    print('-------inistate');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Data Decoded'),
      ),
      body: _assignment == null || _assignment.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _assignment.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Text('Id:${_assignment[index].id}'),
                Text('User ID :${_assignment[index].userId}'),
                Text('Title: ${_assignment[index].title}'),
               // Text('Completed: ${_assignment[index].completed}'),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _loadAssignments() async {
    try {
      List<Assignment> response  = await ApiServer.fetchLessons();
      setState(() {
        _assignment = response;
        print('_assigment method running');
      });
    }catch(e){
      throw Exception('Failed to reload: $e');
    }
  }
}