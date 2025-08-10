<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;


class CreateVendorInvoiceImagesTable extends Migration
{
    public function up()
    {
        Schema::create('vendor_invoice_images', function (Blueprint $table) {
            $table->id(); // auto-increment
            $table->char('vendor_invoice_id', 36); // match UUID type
            $table->foreign('vendor_invoice_id')
                  ->references('id')
                  ->on('vendor_invoices')
                  ->onDelete('cascade');

            $table->string('path');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('vendor_invoice_images');
    }
}
