package org.serihiro.study.service;

import org.serihiro.study.resource.Result;
import org.serihiro.study.resource.Todo;
import retrofit.Callback;
import retrofit.http.*;

import java.util.List;

/**
 * Created by seri on 5/16/15.
 */
public interface TodoService {
    @GET("/todos")
    List<Todo> list();

    @GET("/todos/{id}")
    Todo show(@Path("id") int id);

    @POST("/todos")
    void create(@Body Todo todo, Callback<Result> cb);

    @PUT("/todos/{id}")
    void update(@Path("id") int id, @Body Todo todo, Callback<Result> cb);

    @DELETE("/todos/{id}")
    void delete(@Path("id") int id, Callback<Result> cb);
}
