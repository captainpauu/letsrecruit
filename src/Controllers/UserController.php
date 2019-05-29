<?php


namespace App\Controllers;


use App\Dao\TechnologyDao;
use App\Dao\UserDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class UserController extends BaseController
{
    protected $dao;
    protected $techDao;

    public function __construct($smarty, UserDao $dao, TechnologyDao $techDao)
    {
        parent::__construct($smarty);
        $this->dao = $dao;
        $this->techDao = $techDao;
    }

    public function loginUser(RequestInterface $request, ResponseInterface $response)
    {
        if ($request->isGet()) {
            return $this->smarty->render($response, 'login.tpl');
        } else {
            $data = $request->getParsedBody();
            $valid = $this->validateUser($data);
            if ($valid['status']) {
                if ((int)$valid['user']['role'] === 3) {
                    return $response->withRedirect('/candidate/dashboard');
                } else {
                    return $response->withRedirect('/interview/request/dashboard');
                }
            } else {
                return $this->smarty->render($response, 'login.tpl' , ['errorMsg' => $valid['message']]);
            }
        }
    }

    public function validateUser($data) : array
    {
        $userName = $data['username'];
        $password = $data['password'];
        $status = false;
        $message = '';
        $valid = [];
        if(empty($userName) && empty($password)){
            $message = "Invalid Username or password";
        } else {
            $valid = $this->dao->validateUser($userName, $password);
            if (isset($valid['id'])) {
                $allTechs = $this->techDao->getAllTechnologies();
                $_SESSION['loggedinUser'] = $valid;
                $_SESSION['technologies'] = $allTechs;
                $status = true;
            } else {
                $message = "Invalid Username or password";
            }
        }
        return ['status' => $status, 'message' => $message, 'user' => $valid];
    }

    public function getAllusers(RequestInterface $request, ResponseInterface $response)
    {
        $allUsers = $this->dao->getAllUsers();
        $allTechs = $this->techDao->getAllTechnologies();

        return $this->smarty->render($response, 'userDashboard.tpl', [
            'users' => $allUsers,
            'techs' => $allTechs
        ]);
    }

    public function addUser(RequestInterface $request, ResponseInterface $response, $args)
    {
        $error = '';
        $data = $request->getParsedBody();

        $check = $this->dao->isUserEmailExists($data['email']);
        if (count($check) > 1) {
            $error = "Email already Exists";
        } else {
            if (!$this->dao->insertUser($data)) {
                $error = "User registration failed";
            }
        }
        return $response->withRedirect('/user/dashboard');
    }

    public function candidateShortlisting(RequestInterface $request, ResponseInterface $response, $args)
    {
        $data['userId'] = $_SESSION['loggedinUser']['id'];
        $data['candidateId'] = $args['id'];
        $data['status'] = $args['status'];
        $this->dao->candidateShortlisting($data);
        return $response->withRedirect('/candidate/profile/' . $args['id']);
    }

    public function addTechnology(RequestInterface $request, ResponseInterface $response, $args)
    {
        $data = $request->getParsedBody();
        $this->techDao->insertTechnology($data);
        return $this->smarty->render($response, '');
    }
}