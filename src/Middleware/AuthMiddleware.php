<?php


namespace App\Middleware;


use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class AuthMiddleware extends Middleware
{
    public function __invoke(RequestInterface $request, ResponseInterface $response, $next)
    {
        if(!$this->checkAuth()){
            return $this->smarty->render($response, 'login.tpl');
        }

        $response = $next($request, $response);

        return $response;
    }

    private function checkAuth()
    {
        return isset($_SESSION['loggedinUser']);
    }
}