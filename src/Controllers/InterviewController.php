<?php


namespace App\Controllers;


use App\Dao\InterviewDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Container;
use Interop\Container\Exception\ContainerException;

class InterviewController extends BaseController
{
    /**
     * @var InterviewDao
     */
    protected $dao;

    /**
     * InterviewController constructor.
     * @param Container $container
     * @param InterviewDao $dao
     * @throws ContainerException
     */
    public function __construct(Container $container, InterviewDao $dao)
    {
        parent::__construct($container);
        $this->dao = $dao;
    }

    public function getAllInterviewRequests(RequestInterface $request, ResponseInterface $response)
    {
        $id = $_SESSION['loggedinUser']['id'];
        $allInterviews = $this->dao->getAllInterviewsByUser($id);
        return $this->smarty->render(
            $response,
            'interviewRequests.tpl',
            ['interviews' => $allInterviews]);
    }

    public function scheduleInterview(RequestInterface $request, ResponseInterface $response, $args)
    {
        $data = $request->getParsedBody();
        $candidateId = $args['candidateId'];
        $userId = $_SESSION['loggedinUser']['id'];
        $this->dao->scheduleInterview($candidateId, $userId, $data);
        return $response->withRedirect('/candidate/profile/' . $candidateId);

    }

    public function interviewRequestAction(RequestInterface $request, ResponseInterface $response, $args)
    {
        $interviewId = $args['id'];
        $candidateId = $args['candidateId'];
        $action = (int)$args['action'];
        $result = $this->dao->updateScheduleStatus($interviewId, $action);

        if ($result && self::INTERVIEW_SCHEDULE_STATUS[$action] === 'Accepted') {
            $rounds = $this->dao->getAllRoundsOfCandidate($candidateId);
            $roundNum = count($rounds) + 1;
            $this->dao->insertNewRound($interviewId, $roundNum);
        }
        return $response->withRedirect('/interview/request/dashboard');
    }

    public function submitFeedback(RequestInterface $request, ResponseInterface $response, $args)
    {
        $interviewId = $args['id'];
        $candidateId = $args['candidateId'];
        $data = $request->getParsedBody();
        $result = $this->dao->insertFeedback($interviewId, $data);
        if ($result) {
            $this->dao->updateScheduleStatus($interviewId, 0);
        }
        return $response->withRedirect('/candidate/profile/' . $candidateId);
    }
}