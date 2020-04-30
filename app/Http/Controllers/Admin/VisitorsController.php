<?php
/*
* Smart Timesheet: Time and Attendance Management System
* Email: official.smarttimesheet@gmail.com
* Version: 1.0
* Author: Brian Luna
* Copyright 2018 Brian Luna
* Website: https://github.com/brianluna/smarttimesheet
*/

namespace App\Http\Middleware;

namespace App\Http\Controllers\admin;

use Auth;
use DB;
use App\Classes\table;
use App\Classes\permission;
use App\Http\Requests;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


class VisitorsController extends Controller
{
    public function index()
    {

        /*if (permission::permitted('visitors') == 'fail') {
            return redirect()->route('denied');
        }*/

        $visitors = table::visitors()->join('users', 'visitors.added_by', '=', 'users.id')->get();
        //$leaves = table::leaves()->get();
        //$leave_types = table::leavetypes()->get();
//        dd($visitors);
        return view('admin.visitors', compact('visitors'));
    }

    public function edit($id, Request $request)
    {
        /*if (permission::permitted('visitors-edit') == 'fail') {
            return redirect()->route('denied');
        }*/
        $id = $request->id;

        $visitors = table::visitors()->where('visitor_id', $id)->first();
        return view('admin.edits.edit-visitors', compact('id', 'visitors'));
    }

    public function update(Request $request)
    {
        /* if (permission::permitted('visitors-edit') == 'fail') {
             return redirect()->route('denied');
         }*/
        //if($request->sh == 2){return redirect()->route('leave');}
//        dd($request);
        if ($request->visitor_id == null || $request->visitor_name == null || $request->visitor_email == null) {
            return redirect('visitors')->with('error', 'Whoops! Please fill the form completely!');
        }

        $id = $request->visitor_id;
        $visitor_name = $request->visitor_name;
        $visitor_email = $request->visitor_email;
        $contact_no = $request->contact_no;
        $national_id = $request->national_id;
        table::visitors()->where('visitor_id', $id)->update(['visitor_name' => $visitor_name, 'visitor_email' => $visitor_email, 'visitor_contact_no' => $contact_no, 'visitor_national_id' => $national_id]);

        return redirect('/visitors')->with('success', 'Visitor data updated successfully!');
    }


    public function delete($id, Request $request)
    {
        if (permission::permitted('leaves-delete') == 'fail') {
            return redirect()->route('denied');
        }
        // if($request->sh == 2){return redirect()->route('leave');}

        table::leaves()->where('id', $id)->delete();

        return redirect('leaves')->with('success', 'Deleted!');
    }

    public function add(Request $request)
    {
        //  if (permission::permitted('visitors-add')=='fail'){ return redirect()->route('denied'); }
        $visitor_name = mb_strtoupper($request->visitor_name);
        $visitor_email = mb_strtoupper($request->visitor_email);
        $visitor_contact = mb_strtoupper($request->contact_no);
        $visitor_national_id = mb_strtoupper($request->national_id);

        if ($visitor_name == null || $visitor_email == null || $visitor_contact == null || $visitor_national_id == null) {
            return redirect('visitors')->with('error', 'Whoops! Please fill the form completely!');
        }

        $check = table::visitors()->where('visitor_email', '=', $visitor_email)
            ->orWhere('visitor_contact_no', '=', $visitor_contact)
            ->orWhere('visitor_national_id', '=', $visitor_national_id)->get();
        if (count($check) > 0) {
            return redirect('visitors')->with('error', 'Visitor already exist');

        }else {


            table::visitors()->insert([
                [
                    'visitor_name' => $visitor_name,
                    'visitor_email' => $visitor_email,
                    'visitor_contact_no' => $visitor_contact,
                    'visitor_national_id' => $visitor_national_id,
                    'added_by' => \Auth::user()->id,
                    'added_at' => date('Y-m-d H:i:s')
                ],
            ]);

            return redirect('visitors')->with('success', 'Visitor Added Successfully');
        }
    }

    public function visitor_visiting_history($id)
    {

        // DB::enableQueryLog(); // Enable query log
        $visitors = table::visitors_history()->join('users', 'visitors_timesheet.clockin_by', '=', 'users.id')
            ->join('visitors', 'visitors.visitor_id', '=', 'visitors_timesheet.v_id')->where('visitors_timesheet.v_id', '=', $id)->get();


// Your Eloquent query executed by using get()

        // dd(DB::getQueryLog());
//        dd($visitors);
        return view('admin.visitors_timesheet', compact('visitors'));
    }


}
