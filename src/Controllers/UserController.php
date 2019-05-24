<?php


namespace App\Controllers;


use App\Dao\UserDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class UserController extends BaseController
{
    protected $dao;

    public function __construct($smarty, UserDao $dao)
    {
        parent::__construct($smarty);
        $this->dao = $dao;
    }

    public function loginUser(RequestInterface $request, ResponseInterface $response)
    {
        if ($request->isGet()) {
            return $this->smarty->render($response, 'login.tpl');
        } else {
            $data = $request->getParsedBody();
            $valid = $this->validateUser($data);
            if ($valid['status']) {
                return $response->withRedirect('/candidate/dashboard');
            } else {
                return $this->smarty->render($response, 'login.tpl' , ['errorMsg' => $valid['message']]);
            }
        }
    }

    public function validateUser($data) : array
    {
        $userName = $data['username'];
        $password = $data['password'];
        $status = true;
        $message = '';
        if(empty($userName) && empty($password)){
            $status = false;
            $message = "Invalid Username or password";
        } else {
            $result = $this->dao->validateUser($userName, $password);
            if (isset($result['id'])) {
                $_SESSION['loggedinUser'] = $result;
                $status = true;
            } else {
                $status = false;
                $message = "Invalid Username or password";
            }
        }
        return ['status' => $status, 'message' => $message];
    }
}