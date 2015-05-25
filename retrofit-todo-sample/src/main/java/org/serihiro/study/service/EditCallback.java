package org.serihiro.study.service;

import org.serihiro.study.resource.Result;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

/**
 * Created by seri on 5/16/15.
 */
public class EditCallback implements Callback<Result> {

    @Override
    public void success(Result result, Response response) {
        System.out.println(result.meta.success);
        System.out.println(result.meta.error_messages);
        System.out.println(result.todo.todo);
        System.out.println(result.todo.done);
    }

    @Override
    public void failure(RetrofitError error) {
        System.out.println(error);
    }
}
