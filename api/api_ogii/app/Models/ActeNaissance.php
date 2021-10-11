<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ActeNaissance extends Model
{
    use HasFactory;
    protected $with = ["user"];

    protected $fillable = [
        'first_name',
        'commune',
        'user_id',
        'last_name',
        'first_name_father',
        'last_name_father',
        'first_name_mother',
        'last_name_mother',
        'father_job',
        'mother_job',
        'address',
        'date_born',
        'state',
    ];
    public function user()
    {
        return $this->hasOne(User::class, "id", "user_id");
    }
}
