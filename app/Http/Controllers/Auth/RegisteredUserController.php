<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Candidate;
use App\Models\Company;
use App\Models\Plan;
use App\Models\User;
use App\Models\UserPlan;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'account_type' => ['required', 'in:candidate,company'],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->account_type
        ]);
        if($user->role === 'company'){
            $company=Company::create([
                'user_id' => $user->id,
                'name'=>$user->name,
                'email'=>$user->email,
            ]);
            event(new Registered($company));
            /*
            $plan=UserPlan::create([
                'company_id' => $company->id,
                'plan_id'=>1,
                'job_limit'=>0,
                'featured_job_limit'=>0,
                'highlight_job_limit'=>0,
                'profile_verified'=>1
            ]);*/
        }
        elseif ($user->role === 'candidate'){
            $candidate=Candidate::create([
                'user_id' => $user->id,
                'name'=>$user->name,
                'email'=>$user->email,
            ]);
            event(new Registered($candidate));
        }


        event(new Registered($user));

        Auth::login($user);

        if(auth()->user()->role === 'company') {
            return redirect(RouteServiceProvider::COMPANY_DASHBOARD);
        }elseif(auth()->user()->role === 'candidate') {
            return redirect(RouteServiceProvider::CANDIDATE_DASHBOARD);
        }

        return redirect('/');

    }
}
