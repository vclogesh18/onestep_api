<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddStatusFlagToVendorInvoiceImages extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('vendor_invoice_images', function (Blueprint $table) {
            $table->char('status_flag', 1)->default("A")->after('description')->comment('A=Active, D=Deleted');;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('vendor_invoice_images', function (Blueprint $table) {
            $table->dropColumn('status_flag');
        });
    }
}
