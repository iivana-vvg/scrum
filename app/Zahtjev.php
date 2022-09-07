<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Zahtjev extends Model
{
    // Table Name
    protected $table = 'zahtjev';
    // Primary Key
    public $primaryKey = 'id';
    // Timestamps
    public $timestamps = true;

    public function user(){
        return $this->belongsTo('App\User');
    }
}
