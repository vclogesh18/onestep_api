<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVendorInvoicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vendor_invoices', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->bigInteger('readable_id');
            $table->string('customer_name');
            $table->string('address');
            $table->string('email');
            $table->string('mobile');
            $table->dateTime('event_date');
            $table->string('state');
            $table->boolean('is_taxable');
            $table->decimal('sub_total',24,3)->default(0);
            $table->decimal('total_tax',24,3)->default(0);
            $table->decimal('total',24,3)->default(0);
            $table->string('latitude');
            $table->string('longitude');
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
        Schema::dropIfExists('vendor_invoices');
    }
}
