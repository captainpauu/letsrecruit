<?php


namespace App\Dao;


class InterviewDao
{
    private $db;

    public function __construct(\PDO $db)
    {
        $this->db = $db;
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
                                                WHERE i.candidate_id = :canidateId
                                                ORDER BY i.id DESC LIMIT 1");
        $query->execute([':canidateId' => $candidateId]);
        return $query->fetch();
    }
}