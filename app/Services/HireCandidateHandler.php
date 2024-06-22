<?php

namespace App\Services;

use App\Commands\HireCandidateCommand;
use App\Models\Hired;
use App\Models\Job;
use App\Models\User;
use Illuminate\Support\Facades\Notification;
use App\Notifications\CandidateHired;

class HireCandidateHandler
{
    public function handle(HireCandidateCommand $command)
    {
        // Create the hired record
        Hired::create([
            'candidate_id' => $command->candidateId,
            'job_id' => $command->jobId,
        ]);

        // Send notification to the candidate
        $job = Job::find($command->jobId);

        Session::put('hired_message', 'Congratulations! You have been hired for the position of ' . $job->title);

    }
}
