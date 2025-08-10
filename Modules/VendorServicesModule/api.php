<?php
use Illuminate\Support\Facades\Route;


Route::group(['prefix' => 'provider', 'as' => 'provider.', 'namespace' => 'Api\V1\Provider', 'middleware' => ['auth:api']], function () {
    Route::group(['prefix'=>'vendorservices','as'=>'vendorservices.'],function (){
        Route::post('/', 'ServicesVendorController@store');
        Route::get('/', 'ServicesVendorController@index');
    });
});