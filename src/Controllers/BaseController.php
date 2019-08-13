<?php


namespace App\Controllers;

use App\Service\MailService;
use Slim\Container;
use Slim\Views\Smarty;
use Interop\Container\Exception\ContainerException;

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

    /**
     * @var MailService
     */
    protected $mailService;

    const SHORTLIST_STATUS = [
        0 => 'Pending',
        1 => 'Selected',
        2 => 'Rejected'
    ];

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

    const ROUND_STATUS = [
        0 => 'Pending',
        1 => 'Selected',
        2 => 'Rejected'
    ];

    /**
     * BaseController constructor.
     * @param Container $container
     * @throws ContainerException
     */
    public function __construct(Container $container)
    {
        $this->smarty = $container->get('smarty');
        if (isset($_SESSION['loggedinUser']) && $this->user === null) {
            $this->user = $_SESSION['loggedinUser'];
        }
        $this->mailService = new MailService($container);
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

    /**
     * @param $date
     * @return false|string
     */
    public function convertDateFormat($date)
    {
        return date("jS M, Y", strtotime($date));
    }

    /**
     * @param $status
     * @return string
     */
    public function getBadgeClass($status) : string
    {
        switch ($status) {
            case 0:
                return 'badge-primary';
                break;

            case 1:
                return 'badge-success';
                break;

            case 2:
                return 'badge-danger';
                break;
        }
    }
}