<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendorInvoiceImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       Schema::create('vendor_invoice_images', function (Blueprint $table) {
            $table->id();
            $table->char('vendor_invoice_id', 36);
            $table->foreign('vendor_invoice_id')
                ->references('id')
                ->on('vendor_invoices')
                ->onDelete('cascade');

            $table->string('path');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vendor_invoice_images');
    }
}
