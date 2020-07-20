<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@index'); 

Route::get('/welcome','HomeController@index');

Route::get('login','AdminController@index');

Route::get('/index','AdminController@showdashboard');
Route::get('/logout','AdminController@logout');
Route::post('/admin_index','AdminController@showAdmin');