package org.serihiro.study.resource;

/**
 * Created by seri on 5/16/15.
 */
public class Todo {
    public Todo(String todo, boolean done) {
        this.todo = todo;
        this.done = done;
    }

    public Integer id = null;
    public String todo = "";
    public boolean done = false;
}
