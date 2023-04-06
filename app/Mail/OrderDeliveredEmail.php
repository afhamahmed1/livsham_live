<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\Orders;
class OrderDeliveredEmail extends Mailable
{
    use Queueable, SerializesModels;

     /**
     * The order instance.
     *
     * @var \App\Models\Orders
     */
    public $orders;
    public $sendtoadmin;
    /**
     * Create a new message instance.
     *
     * @return void
     */
     
    public function __construct(Orders $orders, $sendtoadmin = false)
    {
        $this->orders = $orders;
        $this->sendtoadmin = $sendtoadmin;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.orderdelivered');
    }
}
