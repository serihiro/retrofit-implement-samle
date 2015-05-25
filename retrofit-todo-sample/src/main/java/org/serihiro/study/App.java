package org.serihiro.study;

import org.serihiro.study.service.EditCallback;
import org.serihiro.study.resource.Todo;
import org.serihiro.study.service.TodoService;
import retrofit.RestAdapter;

import java.util.List;

public class App {
    public static void main(String[] args) {
        RestAdapter restAdapter = new RestAdapter.Builder()
                .setEndpoint("http://localhost:3000")
                .setLogLevel(RestAdapter.LogLevel.FULL)
                .build();
        TodoService todoService = restAdapter.create(TodoService.class);
        List<Todo> todos = todoService.list();
        todos.forEach(todo -> System.out.println(todo.todo));

        Todo todo = todoService.show(1);
        System.out.println(todo.id);
        System.out.println(todo.todo);
        System.out.println(todo.done);

        System.out.println("create");
        todoService.create(new Todo(null, false), new EditCallback());
        System.out.println("update");
        todoService.update(1, new Todo("mohyu-n", true), new EditCallback());
    }
}
