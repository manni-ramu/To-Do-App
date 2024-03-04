import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_gdsc/data/categories.dart';
import 'package:to_do_gdsc/models/category.dart';
import 'package:to_do_gdsc/models/todolist.dart';

class Services {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //communicates with cloud base
  Future<void> addTask(ToDoItem newItem) async {
    Map<String, dynamic> obj = {
      //function name is addtask takes obj as argument, data stores
      // is in form of json which we converted to map datatype as dictionary
      "name": newItem.title,
      "category": newItem.category.title,
      "date": newItem.dateTime,
      "id": newItem.id,
      "ispined": newItem.isPinned
    };
    String docId = newItem.id;
    //docid is the unique id for the above
    //we create references obj to take collection with their unique doc ids
    //we ask to reference to push the object and wait till then
    //unique id to make use a specific task is deleted
    final DocumentReference tasksRef = firestore.collection("tasks").doc(docId);
    //it takes time to create a json obj so wait
    await tasksRef.set(obj);
  }

  Future<List> read() async {
    //datatype is todoitem
    //we use get method to read it
    //use variable snapshot
    List<ToDoItem> tasks = [];
    //to get the documents in the particular collection tasks
    final snapshot = await firestore.collection("tasks").get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    for (DocumentSnapshot element in documents) {
      //iterate each and every document in snapshot order by categories
      //element is like dictionary
      //we model the category
      Categories category;
      if (element["category"] == "Water_Power") {
        category = Categories.Water_Power;
      } else if (element["category"] == "Management") {
        category = Categories.Management;
      } else if (element["category"] == "Security") {
        category = Categories.Security;
      } else {
        category = Categories.Others;
      }
      //

      tasks.add(ToDoItem(
          //modelling the data
          title: element["name"],
          category: categories[category]!,
          dateTime: element["date"].toDate(),
          //converting it to date time obj
          id: element["name"] + element["date"].toDate().toString(),
          isPinned: element["ispined"] as bool));
    }
    return tasks;
  }

//very simple , create document reference
//future function with documentid as object to have unique task to be deleted
  Future<void> deleteTodoItem(String documentId) async {
    final DocumentReference documentReference =
        firestore.collection('tasks').doc(documentId);
    //commant to delete with waiting time
    await documentReference.delete();
  }
}
