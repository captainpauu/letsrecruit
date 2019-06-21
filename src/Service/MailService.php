<?php


namespace App\Service;


use Slim\Container;
use Slim\Route;
use Interop\Container\Exception\ContainerException;

/**
 * Class MailService
 * @package App\Service
 */
class MailService
{
    /**
     * @var Container
     */
    private $container;
    /**
     * @var Route
     */
    private $router;

    const FROM = 'letsrecruit05.gmail.com';

    const HTML_HEADER = "MIME-Version: 1.0" . "\r\n" . "Content-Type: text/html; charset=UTF-8" . "\r\n";

    /**
     * MailService constructor.
     * @param Container $container
     * @throws ContainerException
     */
    public function __construct(Container $container)
    {
        $this->container = $container;
        $this->router = $this->container->get('router');
    }

    /**
     * @param string $to
     * @param string $subject
     * @param string $message
     * @param null $headers
     * @param null $parameters
     * @return bool
     */
    public function sendMail($to, $subject, $message, $headers = null, $parameters = null) : bool
    {
        return mail($to, $subject, $message, $headers, $parameters);
    }

    /**
     * @param array $data
     * @return bool
     */
    public function interviewScheduledMail($data) : bool
    {
        $to = $data['email'];
        $subject = 'Interview Request';

        $headers = self::HTML_HEADER;
        $headers .= "From: " . self::FROM . "\r\n";

        $message = '<html><body><div style="padding: 30px;">';
        $message .= '<p style="font-size: 20px; color: #263544;"><strong>You have got an Interview Request</strong></p>';
        $message .= '<p style="font-size: 20px">Interview scheduled on <strong>' . $data['scheduled_date'] . ' at ' . $data['scheduled_time'] . '</strong>.</p>';
        $message .= '<p style="font-size: 15px;">Please <a href="' . $_SERVER["HTTP_HOST"] . '" style="color: #ff595a;">Login Here</a> to accept / reject request.</p>';
        $message .= '</div></body></html>';
        return $this->sendMail($to, $subject, $message, $headers);
    }

    /**
     * @param $data
     * @return bool
     */
    public function newUserCredentialsMail($data) : bool
    {
        $to = $data['email'];
        $subject = 'Account Created';

        $headers = self::HTML_HEADER;
        $headers .= "From: " . self::FROM . "\r\n";

        $message = '<html><body><div style="text-align: center;">';
        $message .= '<p style="font-size: 25px; color: #20c997;">Your account has been created</p>';
        $message .= '<p style="font-size: 20px">Please use following credentials to access your account</p>';
        $message .= '<p style="font-size: 18px; font-style: italic">Username:- <strong>' . $data['userName'] . '</strong></p>';
        $message .= '<p style="font-size: 18px; font-style: italic">Password:- <strong>' . $data['password'] . '</strong></p>';
        $message .= '<p style="font-size: 15px;"><a href="' . $_SERVER["HTTP_HOST"] . '" style="color: #ff595a;">Login Here</a></p>';
        $message .= '</div></body></html>';

        return $this->sendMail($to, $subject, $message, $headers);
    }
}