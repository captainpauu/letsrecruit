<?php


namespace App\Middleware;


use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class CsrfViewMiddleware extends Middleware
{
    public function __invoke(RequestInterface $request, ResponseInterface $response, $next)
    {

        $tokenNameKey = $this->container->csrf->getTokenNameKey();
        $tokenName = $this->container->csrf->getTokenName();
        $tokenValueKey = $this->container->csrf->getTokenValueKey();
        $tokenValue = $this->container->csrf->getTokenValue();

        $field = '<input type="hidden" name="'. $tokenNameKey .'" value="'. $tokenName .'">
                    <input type="hidden" name="'. $tokenValueKey .'" value="'. $tokenValue .'">';

        $_SESSION['csrf'] = ['field' => $field];

        $response = $next($request, $response);
        return $response;
    }
}