<?php


namespace App\Controllers;


use App\Dao\TechnologyDao;
use App\Dao\UserDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Container;
use Interop\Container\Exception\ContainerException;

class UserController extends BaseController
{
    /**
     * @var UserDao
     */
    protected $dao;
    /**
     * @var TechnologyDao
     */
    protected $techDao;

    /**
     * UserController constructor.
     * @param Container $container
     * @param UserDao $dao
     * @param TechnologyDao $techDao
     * @throws ContainerException
     */
    public function __construct(Container $container, UserDao $dao, TechnologyDao $techDao)
    {
        parent::__construct($container);
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

    /**
     * @param $data
     * @return array
     */
    public function validateUser($data) : array
    {
        $userName = $data['username'];
        $password = $data['password'];
        $status = false;
        $message = '';
        if(empty($userName) && empty($password)){
            $message = "Invalid Username or password";
        } else {
            $user = $this->dao->getUser($userName);
            if (isset($user['id'])) {
                if ($user['is_deleted'] == 1) {
                    $message = "Account has been deleted. Please contact your Admin.";
                } elseif(password_verify($password, $user['password'])) {
                    $allTechs = $this->techDao->getAllTechnologies();
                    $_SESSION['loggedinUser'] = $user;
                    $_SESSION['technologies'] = $allTechs;
                    $status = true;
                }
            } else {
                $message = "Invalid Username or password";
            }
        }
        return ['status' => $status, 'message' => $message, 'user' => $user];
    }

    public function getAllUsers(RequestInterface $request, ResponseInterface $response)
    {
        if (self::ROLE[$this->user['role']] !== 'Admin') {
            return $this->notAuthorised($request, $response);
        }
        $allUsers = $this->dao->getAllUsers();
        $allTechs = $this->techDao->getAllTechnologies();

        return $this->smarty->render($response, 'userDashboard.tpl', [
            'users' => $allUsers,
            'techs' => $allTechs
        ]);
    }

    public function isUserNameExists(RequestInterface $request, ResponseInterface $response)
    {
        $status = true;
        $check = $this->dao->isUserNameExists($_POST['username']);
        if (count($check) > 1) {
            $status = false;
        }
        return $response->withJson(['success' => $status]);
    }

    public function isUserEmailExists(RequestInterface $request, ResponseInterface $response)
    {
        $status = true;
        $check = $this->dao->isUserEmailExists($_POST['email']);
        if (count($check) > 1) {
            $status = false;
        }
        return $response->withJson(['success' => $status]);
    }

    public function addUser(RequestInterface $request, ResponseInterface $response, $args)
    {
        $data = $request->getParsedBody();
        $data['password_hash'] = password_hash($data['password'], PASSWORD_DEFAULT);
        if ($this->dao->insertUser($data)) {
            $this->mailService->newUserCredentialsMail($data);
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

    public function offerJob(RequestInterface $request, ResponseInterface $response, $args)
    {
        $id = $_POST['id'];
        $status = false;
        if($this->dao->offerJob($id)){
            $status = true;
        }
        return $response->withJson(['success' => $status]);
    }

    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @return mixed
     */
    public function deleteUser(RequestInterface $request, ResponseInterface $response)
    {
        $id = $_POST['userId'];
        $success = false;
        if ($this->dao->deleteUser($id)){
            $success = true;
        }
        return $response->withJson(['success' => $success]);
    }

    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @return ResponseInterface
     */
    public function logoutUser(RequestInterface $request, ResponseInterface $response)
    {
        unset($_SESSION['loggedinUser']);
        return $this->smarty->render($response, 'logout.tpl');
    }
}