<?php
/*
* Smart Timesheet: Time and Attendance Management System
* Email: official.smarttimesheet@gmail.com
* Version: 1.0
* Author: Brian Luna
* Copyright 2018 Brian Luna
* Website: https://github.com/brianluna/smarttimesheet
*/
namespace App\Http\Controllers\personal;
use DB;
use App\Classes\table;
use App\Classes\permission;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;


class PersonalAccountController extends Controller
{
    public function viewUser(Request $request) 
    {
        $myuser = table::users()->where('id', \Auth::user()->id)->first();
        $myrole = table::roles()->where('id', $myuser->role_id)->value('role_name');
        return view('personal.personal-update-user', compact('myuser', 'myrole'));
    }

    public function viewPassword() 
    {
        return view('personal.personal-update-password');
    }

    public function updateUser(Request $request) 
    {
        if($request->sh == 2){return redirect()->route('changeUser');}

        $id = \Auth::id();
        $name = mb_strtoupper($request->name);
        $email = mb_strtolower($request->email);

        if($id == null || $name == null || $email ==null) {
            return redirect('personal/update-user')->with('error', 'Whoops! Please fill the form completely.');
        }

        table::users()->where('id', $id)->update([
            'name' => $name,
            'email' => $email,
        ]);

        return redirect('personal/update-user')->with('success', 'User Account has been updated!');
    }

    public function updatePassword(Request $request) 
    {
        if($request->sh == 2){return redirect()->route('changePass');}
        
        $id = \Auth::id();
        $p = \Auth::user()->password;
        $c_password = $request->currentpassword;
        $n_password = $request->newpassword;
        $c_p_password = $request->confirmpassword;

        if($c_password == null || $n_password == null || $c_p_password == null) {
            return redirect('personal/update-password')->with('error', 'Whoops! Please fill the form completely.');
        }

        if($n_password != $c_p_password) {
            return redirect('personal/update-password')->with('error', 'New password does not match.');
        }

        if(Hash::check($c_password, $p)) {
            table::users()->where('id', $id)->update([
                'password' => Hash::make($n_password),
            ]);

            return redirect('personal/update-password')->with('success', 'User password has been updated!');
        } else {
            return redirect('personal/update-password')->with('error', 'Oops! current password does not match.');
        }
    }
}

