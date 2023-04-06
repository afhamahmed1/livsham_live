<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Message;

class MessageController extends Controller
{
    public function index(){
        $messages = Message::get();
        
        return view("backend.admin.message.index", get_defined_vars());
    }
    
    public function destroy(Message $message){
        $message->delete();
        return redirect()->route('admin.message');
    }
    
    public function store(Request $request){
        $request->validate([
            'fname'        =>'required',
            'lname'        =>'required',
            'email'        =>'required',
            'subject'        =>'required',
            'message'        =>'required',
        ]);
        
        $message = new Message();
        $message->fname = $request->fname;
        $message->lname = $request->lname;
        $message->email = $request->email;
        $message->subject = $request->subject;
        $message->message = $request->message;
        $message->orderno = $request->orderno;
        $message->save();
        return redirect()->back();
    }
}
