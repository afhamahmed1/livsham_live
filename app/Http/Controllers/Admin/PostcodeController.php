<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Postcode;

class PostcodeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $list = Postcode::get();
        //  $list = Postcode::get();
         return view('backend.admin.postcode.index',get_defined_vars());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.admin.postcode.create',get_defined_vars());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'postcode'        =>'required|regex:/(^[0-9]{5}$)/u',
        ]);
        $postcode = new Postcode();
        $postcode->postcode = $request->postcode;
        $postcode->save();
        return redirect()->route('admin.postcode.index')->with('message',"Data Added Successfully!");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\postcode  $postcode
     * @return \Illuminate\Http\Response
     */
    public function show(Postcode $postcode)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\postcode  $postcode
     * @return \Illuminate\Http\Response
     */
    public function edit(Postcode $postcode)
    {
        $postcode = Postcode::where('id', $postcode->id)->get();
        return view('backend.admin.postcode.edit',get_defined_vars());
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\postcode  $postcode
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Postcode $postcode)
    {
        $request->validate([
            'postcode'        =>'required|regex:/(^[0-9]{5}$)/u',
        ]);
        $postcode = Postcode::where('id',$postcode->id)->get();
        $postcode[0]->postcode = $request->postcode;
        $postcode[0]->save();
        return redirect()->route('admin.postcode.index')->with('message',"Data Updated Successfully!");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\postcode  $postcode
     * @return \Illuminate\Http\Response
     */
    public function destroy(Postcode $postcode)
    {
        $postcode->delete();
        return redirect()->route('admin.postcode.index')->with('warning',"Data Deleted Successfully!");
    }
}
