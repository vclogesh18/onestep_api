<?php 

use Illuminate\Support\Facades\Route;


Route::group(['prefix' => 'provider', 'as' => 'provider.', 'namespace' => 'Api\V1\Provider', 'middleware' => ['auth:api']], function () {
    Route::group(['prefix'=>'vendor_invoices','as'=>'vendor_invoices.'],function (){
        Route::delete('delete/{id}', 'VendorInvoicesController@destroy')->name('delete');
        Route::delete('delete_invoice/{id}', 'VendorInvoicesController@invoiceDestroy')->name('delete');
        Route::post('/list', 'VendorInvoicesController@index');
        Route::post('/event_types', 'VendorInvoicesController@event_types');
        Route::post('/', 'VendorInvoicesController@store');
        Route::get('{id}', 'VendorInvoicesController@show');
        Route::put('status-update/{booking_id}', 'VendorInvoicesController@status_update');
        Route::post('add_expense', 'VendorInvoicesController@add_expense');
        Route::put('update/{id}', 'VendorInvoicesController@update');
        Route::put('update_expense/{id}', 'VendorInvoicesController@update_expense');   
        Route::delete('delete_expense/{id}', 'VendorInvoicesController@delete_expense');   
        Route::get('/invoice/insights', 'VendorInvoicesController@insights');
        Route::post('/invoice/reporting', 'VendorInvoicesController@reporting');
        Route::post('/invoice/expense-reporting', 'VendorInvoicesController@expenseReporting');
        Route::post('/invoice/calender', 'VendorInvoicesController@calender');
        Route::post('/upload-images/{id}', 'VendorInvoicesController@uploadImages');
    }); 
}); 