@extends('frontend.layouts.master')

@section('contents')
    <section class="section-box mt-150">
        <p style="font-size: 50px; font-weight: bold; text-align: center; color: black">Hello there!</p>
        <p style="text-align: center; color: black; margin-top: 20px">Welcome to your space :) !</p>
    </section>

    <section class="section-box mt-120">
        <div class="container">
            <div class="row">

                @include('frontend.company-dashboard.sidebar')

                <div class="col-lg-9 col-md-8 col-sm-12 col-12 mb-50">
                    <div class="content-single">
                        <h3 class="mt-0 mb-0 color-brand-1">My Space</h3>
                        <div class="dashboard_overview">
                            @if (!isCompanyProfileComplete())
                                <div class="row">
                                    <div class="col-12 mt-30">
                                        <div class="dash_alert_box p-30 bg-danger rounded-4 d-flex flex-wrap">
                                            <span class="img">
                                                <img src="{{ asset('frontend/assets/imgs/page/homepage1/hgt.jpg') }}" alt="alert">
                                            </span>
                                            <div class="text">
                                                <h4>Please setup your Profile !</h4>
                                                <p>You can not access all the features of the website if you don't setup your account first. Make sure you setup your <b style="font-weight: bold;">"Basic", "Profile" and "Account Seeting"</b> Data.</p>
                                            </div>
                                            <a href="{{ route('company.profile') }}" class="btn btn-default rounded-1">Edit Profile</a>
                                        </div>
                                    </div>
                                </div>
                            @endif
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="dash_overview_item " style="background-color: lightskyblue">
                                        <h2>{{ $jobPosts }} <span>Pending Jobs</span></h2>
                                        <span class="icon"><i class="fas fa-briefcase"></i></span>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="dash_overview_item " style="background-color: mediumpurple">
                                        <h2>{{ $totalJobs }} <span>Total Jobs</span></h2>
                                        <span class="icon"><i class="fas fa-briefcase"></i></span>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="dash_overview_item " style="background-color: yellowgreen">
                                        <h2>{{ $totalOrders }} <span>Total Orders</span></h2>
                                        <span class="icon"><i class="fas fa-cart-plus"></i></span>
                                    </div>
                                </div>
                            </div>

                            <br>
                            <div class="card">
                                <div class="card-body" >
                                    <table class="table" >

                                        <tbody >
                                          <tr >
                                            <th scope="row" >1</th>
                                            <td><b>Current Package</b></td>
                                              @if(!$userPlan)
                                                <td>Noble Package</td>
                                              @else
                                                <td>{{ $userPlan?->plan?->label }} Package</td>
                                              @endif
                                          </tr>
                                          <tr>
                                            <th scope="row">2</th>
                                            <td>Job Post Available</td>
                                              @if(!$userPlan)
                                              <td>{{10}}</td>
                                              @else
                                              <td>{{ $userPlan?->job_limit}}</td>
                                              @endif

                                          </tr>
                                          <tr>
                                            <th scope="row">3</th>
                                            <td>Featured Post Available</td>
                                              @if(!$userPlan)
                                              <td>{{0}}</td>
                                              @else
                                              <td>{{ $userPlan?->featured_job_limit }}</td>
                                              @endif
                                          </tr>
                                          <tr>
                                            <th scope="row">4</th>
                                            <td>Highlight Post Available</td>
                                              @if(!$userPlan)
                                              <td>{{0}}</td>
                                              @else
                                              <td>{{ $userPlan?->highlight_job_limit }}</td>
                                              @endif
                                          </tr>
                                        </tbody>
                                      </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="mt-120"></div>
@endsection
