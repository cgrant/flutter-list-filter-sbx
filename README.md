# List filtering

To get a subset of items from a List in flutter you can use the `List.where()` method. The method loops over all entries in the List passing them to a custom function you define where you can decide what is returned for that item. 


## Simple boolean
The following code creates a subset list called `openTodos` with items from `allTodos` that are not completed. 

```dart
List<Todo> openTodos = allTodos.where((todo) => 
    !todo.completed).toList();

```
Don't forget to convert it to a List with `.toList()` at the end


## String searching
This functionality can be used against strings using the `.contains()`

```dart
String query = "dinner";

List<Todo> searchedTodos = todos.where((todo) => 
    todo.title
        .toLowerCase()
        .contains(query))
    .toList();
```

Ensure the list.field and query string are lowercase then use the `.contains()` function to check if the entry should be returned.  
