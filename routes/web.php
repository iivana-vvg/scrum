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



//Route::get('/', 'PagesController2@index');

Route::get('/', function () {return view('pages.index');});

/*Route::get('zahtjevi/{zahtjev}', function ($slug) {
    $path = __DIR__ . "/../resources/zahtjevi/{$slug}.html";

    if (! file_exist($path))
    {
        return redirect('/');
    }

    $zahtjev = file_get_contents($path);
    return view('zahtjev', ['zahtjev' => $zahtjev ]);
});*/

//da bi koristila auth moras instalirati package
Auth::routes();
Route::get('/funkcionalnosti', 'PagesController@funkcionalnosti');
Route::get('/zadaci', 'PagesController@zadaci');
Route::get('/inkrementi', 'PagesController@inkrementi');
Route::resource('zahtjevi', ZahtjeviController::class);


Route::get('/dashboard', 'DashboardController@index');
