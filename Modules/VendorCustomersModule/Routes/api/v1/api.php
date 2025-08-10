<?php 

use Illuminate\Support\Facades\Route;


Route::group(['prefix' => 'provider', 'as' => 'provider.', 'namespace' => 'Api\V1\Provider', 'middleware' => ['auth:api']], function () {
    Route::group(['prefix'=>'vendor_customers','as'=>'vendor_customers.'],function (){
        Route::post('/','VendorCustomersController@store');
        Route::post('/list', 'VendorCustomersController@index');
        
        
    }); 
});