@extends('frontend.layouts.master')

@section('contents')
<section class="section-box mt-150">
    <p style="font-size: 50px; font-weight: bold; text-align: center; color: black">Learn more about who we are!</p>
    <p style="text-align: center; color: black; margin-top: 20px">We know new things can be scary</p>
  </section>

  <section class="section-box mt-120">

    <div class="post-loop-grid">
      <div class="container">
        <div class="text-center">
          <h6 class="f-18 color-text-mutted text-uppercase">Our company</h6>
          <h2 class="section-title mb-10 wow animate__animated animate__fadeInUp">About Our Company</h2>
          <p class="font-sm color-text-paragraph wow animate__animated animate__fadeInUp w-lg-50 mx-auto"> At {{ config('settings.site_name') }} , our mission is to connect talented professionals with top-tier companies, helping both achieve their goals in the most efficient and seamless manner. Established with a vision to revolutionize the job search process, we provide a comprehensive platform that bridges the gap between job seekers and employers. Our commitment to innovation, integrity, and excellence ensures that we deliver a user-friendly experience, making it easier than ever to find the perfect match in the professional world. Join us on our journey to transform careers and drive success across industries..</p>
        </div>

        <div class="row justify-content-between mt-70">
          <div class="col-lg-6 col-md-12 col-sm-12">
            <h3 class="mt-15">{{ $about?->title }}</h3>
            <div class="mt-20">
              <p class="font-md color-text-paragraph mt-20">{!! $about?->description !!}</p>
            </div>
            @if ($about?->url)
            <div class="mt-30"><a class="btn btn-default" href="{{ $about?->url }}">Read More</a></div>
            @endif
          </div>
          <div class="col-lg-5 col-md-12 col-sm-12"><img src="{{ asset('frontend/assets/imgs/page/about/img-about2.png') }}" alt="joxBox">
          </div>
        </div>
      </div>
    </div>
  </section>

  @include('frontend.home.sections.review-section')

  @include('frontend.home.sections.blog-section')


@endsection
