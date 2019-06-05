<?php


namespace App\Controllers;

use Slim\Views\Smarty;

class BaseController
{
    /**
     * @var Smarty
     */
    protected $smarty;

    /**
     * @var array
     */
    protected $user;

    const ROLE = [
        1 => '1st Round Panel',
        2 => '2nd Round Panel',
        3 => 'Admin'
    ];

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

    /**
     * BaseController constructor.
     * @param Smarty $smarty
     */
    public function __construct(Smarty $smarty)
    {
        $this->smarty = $smarty;
        if (isset($_SESSION['loggedinUser']) && $this->user === null) {
            $this->user = $_SESSION['loggedinUser'];
        }
    }

    /**
     * @param $request
     * @param $response
     * @return \Psr\Http\Message\ResponseInterface
     */
    public function notAuthorised($request, $response)
    {
        return $this->smarty->render($response, 'restricted.tpl');
    }

    public function convertDateFormat($date)
    {
        return date("jS M, Y", strtotime($date));
    }
}