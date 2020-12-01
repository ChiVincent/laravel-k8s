<?php

namespace App\Notifications\Auth;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Auth\Notifications\ResetPassword as LaravelResetPassword;

class ResetPassword extends LaravelResetPassword implements ShouldQueue
{
    use Queueable;
}
