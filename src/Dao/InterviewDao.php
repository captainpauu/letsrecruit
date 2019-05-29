<?php


namespace App\Dao;


class InterviewDao
{
    private $db;

    public function __construct(\PDO $db)
    {
        $this->db = $db;
    }

    public function getAllInterviewsByUser($id)
    {
        $stmt = "SELECT i.id,
                        c.id as candidate_id,
                        c.fname,
                        c.lname,
                        j.name as job_profile,
                        c.experience,
                        i.scheduled_date,
                        i.schedule_status,
                        i.scheduled_time,
                        i.interview_mode
                  FROM interviews AS i
                  JOIN candidates c on i.candidate_id = c.id
                  JOIN jobs j on c.job_profile_id = j.id
                  WHERE i.interviewer_id = :id";

        $query = $this->db->prepare($stmt);
        $query->execute([':id' => $id]);
        return $query->fetchAll();
    }

    public function scheduleInterview($candidateId, $userId, $data)
    {
        $stmt = "INSERT INTO interviews(
                       candidate_id, 
                       interviewer_id, 
                       scheduled_date, 
                       scheduled_time, 
                       interview_mode, 
                       scheduled_by,
                       schedule_status
                       ) VALUES (
                                 :candidateId,
                                 :interviewerId,
                                 :scheduledDate,
                                 :scheduledTime,
                                 :interviewMode,
                                 :scheduledBy,
                                 1
                       )";

        $query = $this->db->prepare($stmt);
        $result = $query->execute([
            ':candidateId' => $candidateId,
            ':interviewerId' => $data['interviewerId'],
            ':scheduledDate' => $data['scheduledDate'],
            ':scheduledTime' => $data['scheduledTime'],
            ':interviewMode' => $data['interviewMode'],
            ':scheduledBy' => $userId
        ]);
    }

    public function currentInterviewStatus($candidateId)
    {
        $query = $this->db->prepare("SELECT 
                                                    i.id,
                                                    i.candidate_id,
                                                    u.name as interviewer_name,
                                                    i.scheduled_date,
                                                    i.scheduled_time,
                                                    i.schedule_status,
                                                    u1.name as scheduled_by
                                                FROM interviews AS i 
                                                JOIN users u ON i.interviewer_id = u.id
                                                JOIN users u1 ON i.scheduled_by = u1.id
                                                WHERE i.candidate_id = :candidateId
                                                ORDER BY i.id DESC LIMIT 1");
        $query->execute([':candidateId' => $candidateId]);
        return $query->fetch();
    }

    public function updateScheduleStatus($id, $action)
    {
        $query = $this->db->prepare("UPDATE interviews 
                                                SET schedule_status = :action 
                                                WHERE id = :id");
        return $query->execute([':action' => $action, ':id' => $id]);
    }

    public function getAllCandidateRounds($candidateId)
    {
        $stmt = "SELECT *
                    FROM rounds as r
                    JOIN interviews i on r.interview_id = i.id
                    JOIN users u on i.interviewer_id = u.id
                    WHERE i.candidate_id = :id";
        $query = $this->db->prepare($stmt);
        $query->execute([':id' => $candidateId]);
        return $query->fetchAll();
    }

    public function insertNewRound($interviewId, $roundNum)
    {
        $stmt = "INSERT INTO rounds( 
                   interview_id,
                   round_number,
                   round_status
                   ) values(
                            :interviewId, 
                            :roundNum, 
                            :roundStatus
                    )";

        $query = $this->db->prepare($stmt);
        $result = $query->execute([
            ':interviewId' => $interviewId,
            ':roundNum' => $roundNum,
            ':roundStatus' => 0
        ]);
        return $result;
    }

    public function insertFeedback($interviewId, $data)
    {
        $stmt = "UPDATE rounds
                 SET feedback = :feedback,
                     feedback_date = :today,
                     feedback_by = :feedbackBy,
                     round_status = :roundStatus
                 WHERE interview_id = :interviewId";
        $query = $this->db->prepare($stmt);
        $result = $query->execute([
            ':feedback' => $data['feedback'],
            ':today' => date("Y/m/d"),
            ':feedbackBy' => $_SESSION['loggedinUser']['id'],
            ':roundStatus' => $data['roundStatus'],
            ':interviewId' => $interviewId
            ]);
        return $result;
    }
}