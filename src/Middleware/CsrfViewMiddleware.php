<?php


namespace App\Middleware;


use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class CsrfViewMiddleware extends Middleware
{
    protected $key = 'csrf_token';

    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @param $next
     * @return ResponseInterface
     * @throws \Exception
     */
    public function __invoke(RequestInterface $request, ResponseInterface $response, $next)
    {
        $token = $this->generateToken();

        if($request->isPost()){
            $data = $request->getParsedBody();
            if($token !== $data[$this->key] || $token !== $_POST[$this->key]) {
                throw new \Exception('CSRF token mismatch.');
            }
        }

        $response = $next($request, $response);
        return $response;
    }

    /**
     * @return string
     */
    public function generateToken()
    {
        if ( !session_id() ) {
            session_start();
        }
        if(!isset($_SESSION[$this->key])) {
            $secretKey = 'jfue$ysf243ng7345#';
            $sessionId = session_id();
            $sha = sha1(rand(10000, 99999));

            $_SESSION['csrf_name'] = $this->key;
            $_SESSION[$this->key] = $sessionId . $secretKey . $sha;
        }
        return $_SESSION[$this->key];
    }
}