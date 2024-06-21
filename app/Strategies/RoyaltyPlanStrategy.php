<?php

namespace App\Strategies;

use App\Models\UserPlan;
use App\Models\Plan;

class RoyaltyPlanStrategy implements PlanStrategyInterface {
    public function applyPlan($user) {
        $plan = Plan::where('label', 'Royalty')->first();
        $this->updateUserPlan($user, $plan);
    }

    protected function updateUserPlan($user, $plan) {
        UserPlan::updateOrCreate(
            ['company_id' => $user->company->id],
            [
                'plan_id' => $plan->id,
                'job_limit' => $plan->job_limit,
                'featured_job_limit' => $plan->featured_job_limit,
                'highlight_job_limit' => $plan->highlight_job_limit,
                'profile_verified' => $plan->profile_verified,
            ]
        );
    }
}
