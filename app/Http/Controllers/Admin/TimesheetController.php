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


class TimesheetController extends Controller
{
    public function index()
    {

        /*if (permission::permitted('visitors') == 'fail') {
            return redirect()->route('denied');
        }*/

        $result = table::visitors()->get();
        foreach ($result as $index => $key) {
            $result2 = table::visitors_history()
                ->where('visitors_timesheet.v_id', '=', $key->visitor_id)
                ->where('visitors_timesheet.v_timesheet_date', '=', DATE('Y-m-d'))
                ->first();
            if (!empty($result2)) {
                $result[$index]->clockin = $result2->v_clockin;
                $result[$index]->clockout = $result2->v_clockout;
            }
        }
        //dd($result);
        return view('admin.v_timesheet', compact('result'));
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

    public function addClockIn(Request $request)
    {
        //  if (permission::permitted('visitors-add')=='fail'){ return redirect()->route('denied'); }
        $visitor_id = mb_strtoupper($request->visitor_id);
        $visitor_name = mb_strtoupper($request->visitor_name);

        if ($visitor_name == null) {
            return redirect('timesheet')->with('error', 'Whoops! Please fill the form completely!');
        }

        $query = table::visitors_history()->where('v_id', '=', $visitor_id)
            ->where('visitors_timesheet.v_timesheet_date', '=', DATE(now()))->get();
        if (count($query) > 0) {
            return redirect('timesheet')->with('error', 'Already CLock in');
        } else {

            table::visitors_history()->insert([
                [
                    'v_timesheet_date' => date('Y-m-d'),
                    'v_id' => $visitor_id,
                    'v_clockin' => date('Y-m-d H:i:s'),
                    'v_visiting_purpose' => $visitor_name,
                    'ip' => $_SERVER['REMOTE_ADDR'],
                    'clockin_by' => \Auth::user()->id,

                ],
            ]);
        }

        return redirect('timesheet')->with('success', 'Clocked In Successfully');
    }

    public function addClockOut(Request $request)
    {
        $visitor_id = $request->visitor_id_off;
        $clockout = array(
            'v_clockout' => date('Y-m-d H:i:s')
        );
        table::visitors_history()->where('v_id', $visitor_id)
            ->update(['v_clockout' => date('Y-m-d H:i:s'),
                'v_timesheet_date' => date("Y-m-d")]);
        return redirect('timesheet')->with('success', 'Clocked Out successfully!');
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
