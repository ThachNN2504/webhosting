<?php

use App\Http\Controllers\userController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', [userController::class, 'index']);
Route::get('/about', [userController::class, 'about']);
Route::get('/contract', [userController::class, 'contract']);
Route::get('/hosting', [userController::class, 'hosting']);
Route::get('/domain', [userController::class, 'domain']);
Route::get('/login', [userController::class, 'login']);



