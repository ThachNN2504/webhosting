<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class userController extends Controller
{
    function index(){
        return view('index');
    }
    function about(){
        return view('about');
    }
    function contract(){
        return view('contract');
    }
    function hosting(){
        return view('hosting');
    }

    function domain(){
        return view('domain');
    }
    function login(){
        return view('login');
    }
}
