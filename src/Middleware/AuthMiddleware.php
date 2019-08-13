<?php


namespace App\Middleware;


use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class AuthMiddleware extends Middleware
{
    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @param $next
     * @return ResponseInterface
     */
    public function __invoke(RequestInterface $request, ResponseInterface $response, $next)
    {
        if(!$this->checkAuth()){
            return $this->smarty->render($response, 'login.tpl');
        }

        $response = $next($request, $response);

        return $response;
    }

    /**
     * @return bool
     */
    private function checkAuth() : bool
    {
        return isset($_SESSION['loggedinUser']);
    }
}