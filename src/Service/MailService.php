<?php


namespace App\Service;


use Slim\App;
use Slim\Container;

class MailService
{
    private $container;
    private $router;

    const FROM = 'letsrecruit05.gmail.com';
    const HTML_HEADER = "MIME-Version: 1.0" . "\r\n" . "Content-Type: text/html; charset=UTF-8" . "\r\n";

    /**
     * MailService constructor.
     * @param Container $container
     * @throws \Interop\Container\Exception\ContainerException
     */
    public function __construct(Container $container)
    {
        $this->container = $container;
        $this->router = $this->container->get('router');
    }

    public function sendMail($to, $subject, $message, $headers = null, $parameters = null)
    {
        return mail($to, $subject, $message, $headers, $parameters);
    }

    public function interviewScheduledMail($data)
    {
        $to = $data['email'];
        $subject = 'Interview Request';
        $message = 'Interview has been scheduled on ' . $data['scheduled_date'] . ' at ' . $data['scheduled_time'] . ' for ' . $data['job_profile'] . '.';
        $message .= 'Please login to accept or reject request.';
        return $this->sendMail($to, $subject, $message);
    }

    public function newUserCredentialsMail($data)
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
        $message .= '<p style="font-size: 15px;"><a href="' . $_SERVER["HTTP_HOST"] .'" style="color: #ff595a;">Login Here</a></p>';
        $message .= '</div></body></html>';

        return $this->sendMail($to, $subject, $message, $headers);
    }
}