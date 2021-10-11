<?php

use App\Http\Controllers\ActeNaissanceController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/auth/register', [AuthController::class, 'register']);
Route::post('/auth/login', [AuthController::class, 'login']);

//User
Route::group(['middleware' => ['auth:sanctum']], function () {

    Route::get('/auth/me', [AuthController::class, 'CurrentUser']);
    Route::post('/auth/logout', [AuthController::class, 'logout']);
    Route::post('/auth/refresh', [AuthController::class, 'refresh']);
    Route::get('/user/list', [AuthController::class, 'Users']);

});

//Acte
Route::group(['middleware' => ['auth:sanctum']], function () {

    Route::post('/acte/add', [ActeNaissanceController::class, 'AddActeNaissance']);
    Route::get('/acte/list', [ActeNaissanceController::class, 'ActeNaissances']);
    Route::get('/acte/listActeEncours', [ActeNaissanceController::class, 'GetListeActeNaissanceEncours']);
    Route::get('/acte/listActeTraites', [ActeNaissanceController::class, 'GetListeActeNaissanceTraites']);
    Route::get('/acte/listActeEncoursUser/{id}', [ActeNaissanceController::class, 'GetListesActeNaissanceEncoursUser']);
    Route::get('/acte/listActeTraitesUser/{id}', [ActeNaissanceController::class, 'GetListesActeNaissanceTraitesUser']);
    Route::get('/acte/single/{id}', [ActeNaissanceController::class, 'GetActeNaissanceById']);
    Route::put('/acte/update/{id}', [ActeNaissanceController::class, 'UpdateActe']);
   
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
