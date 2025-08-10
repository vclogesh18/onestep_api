<?php

use Illuminate\Http\Request;

Route::group(['prefix' => 'provider', 'as' => 'provider.', 'namespace' => 'Api\V1\Provider', 'middleware' => ['auth:api']], function () {
    Route::group(['prefix'=>'clientservices','as'=>'clientservices.'],function (){
        Route::post('/', 'ClientServicesController@index');
     
    });
});