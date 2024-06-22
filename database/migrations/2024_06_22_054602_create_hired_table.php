<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHiredTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('hired')) {
            Schema::create('hired', function (Blueprint $table) {
                $table->id();
                $table->unsignedBigInteger('candidate_id');
                $table->unsignedBigInteger('job_id');
                $table->timestamps();

                $table->foreign('candidate_id')->references('id')->on('candidates')->onDelete('cascade');
                $table->foreign('job_id')->references('id')->on('jobs')->onDelete('cascade');
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('hired');
    }
}

