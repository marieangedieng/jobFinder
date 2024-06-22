<?php
namespace App\Observers;

use App\Models\User;
use App\Models\Company;
use App\Models\Candidate;
use App\Models\Plan;
use App\Models\UserPlan;

class UserObserver {
    public function created(User $user) {
        if ($user->role === 'company') {
            $company = Company::create([
                'user_id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
            ]);
            event(new Registered($company));

            // Automatically link the "Noble" package to new companies
            $plan = Plan::where('label', 'Noble')->first();
            if ($plan) {
                $userplan=UserPlan::create([
                    'company_id' => $company->id,
                    'plan_id' => $plan->id,
                    'job_limit' => $plan->job_limit,
                    'featured_job_limit' => $plan->featured_job_limit,
                    'highlight_job_limit' => $plan->highlight_job_limit,
                    'profile_verified' => $plan->profile_verified,
                ]);
                event(new Registered($userplan));
            }
        } elseif ($user->role === 'candidate') {
            $candidate=Candidate::create([
                'user_id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
            ]);
            event(new Registered($candidate));
        }
    }
}
