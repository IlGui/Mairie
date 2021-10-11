<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateActeNaissancesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('acte_naissances', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("user_id");
            $table->string('commune');
            $table->string('first_name');
            $table->string('last_name');
            $table->string('address');
            $table->string('first_name_father');
            $table->string('last_name_father');
            $table->string('father_job');
            $table->string('first_name_mother');
            $table->string('last_name_mother');
            $table->string('mother_job');
            $table->date('date_born');
            $table->integer('state');
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
        Schema::dropIfExists('acte_naissances');
    }
}
