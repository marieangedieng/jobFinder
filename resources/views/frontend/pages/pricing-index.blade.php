@extends('frontend.layouts.master')

@section('contents')


  <section class="section-box mt-100">
    <div class="container">
      <h2 class="text-center mb-15 wow animate__animated animate__fadeInUp">Packages</h2>
      <div class="font-lg color-text-paragraph-2 text-center wow animate__animated animate__fadeInUp">Choose the plan that fits YOU the best</div>
      <div class="max-width-price">
        <div class="block-pricing mt-70">
          <div class="row">
            @foreach ($plans as $plan)
            <div class="col-xl-4 col-lg-6 col-md-6 wow animate__animated animate__fadeInUp">
              <div class="box-pricing-item">
                <h3>{{ $plan->label }}</h3>
                <div class="box-info-price"><span class="text-price color-brand-2">${{ $plan->price }}</span></div>
                <ul class="list-package-feature">
                  <li>{{ $plan->job_limit }} Job Offers</li>
                    @if ($plan->featured_job_limit)
                        <li>{{ $plan->featured_job_limit }}  Featured Jobs</li>
                    @else
                        <li><strike>Featured Jobs</strike></li>
                    @endif
                    @if ($plan->highlight_job_limit)
                        <li>{{ $plan->highlight_job_limit }}  Highlighted Jobs</li>
                    @else
                        <li><strike>Highlighted Jobs Limit</strike></li>
                    @endif
                  @if ($plan->profile_verified)
                  <li>Verified Profile</li>
                  @else
                  <li><strike>Verified Profile</strike></li>
                  @endif

                </ul>
                <div><a class="btn btn-border" href="{{ route('checkout.index', $plan->id) }}">Choose plan</a></div>
              </div>
            </div>
            @endforeach

          </div>
        </div>
      </div>
    </div>
  </section>
@endsection
