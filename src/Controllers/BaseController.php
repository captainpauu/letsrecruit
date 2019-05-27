<?php


namespace App\Controllers;

use Slim\Views\Smarty;

class BaseController
{
    protected $smarty;

    const GENDER = [
        0 => 'Male',
        1 => 'Female'
    ];

    const MARITAL_STATUS = [
        0 => 'Unmarried',
        1 => 'Married'
    ];

    const OFFER_IN_HAND = [
        0 => 'No',
        1 => 'Yes'
    ];

    const REFERENCE_TYPE = [
        0 => 'Consultancy',
        1 => 'Office Employee',
        2 => 'Self'
    ];

    const INTERVIEW_MODE = [
        1 => 'Face to Face',
        2 => 'Skype',
        3 => 'Phone Call'
    ];

    const INTERVIEW_SCHEDULE_STATUS = [
        1 => 'Pending',
        2 => 'Accepted',
        3 => 'Rejected'
    ];

    public function __construct(Smarty $smarty) {
        $this->smarty = $smarty;
    }
}