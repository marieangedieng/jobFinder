<section class="section-box overflow-visible mt-100 mb-100" style="background-image: url({{ asset('frontend/assets/imgs/page/homepage1/pijzrf.jpg') }})">
    <div class="container">
      <div class="row align-items-center justify-content-between">
        <div class="col-lg-6 col-sm-12">
          <div class="content-job-inner"><span class="color-text-mutted text-32">{{ $learnMore?->title }} </span>
            <h2 class="text-52 wow animate__animated animate__fadeInUp">{{ $learnMore?->main_title }}</h2>
            <div class="mt-40 pr-50 text-md-lh28 wow animate__animated animate__fadeInUp">{{ $learnMore?->sub_title }}</div>
            <div class="mt-40">
              <div class="wow animate__animated animate__fadeInUp"><a class="btn btn-default"
                  href="jobs-grid.html" style="border-radius: 15px; background-color: #014f86" onmouseover="this.style.backgroundColor='#0093c6'" onmouseout="this.style.backgroundColor='#014f86'">Search Jobs</a>
                  @if ($learnMore?->url)
                    <a class="btn btn-link" href="{{ $learnMore?->url }}">Learn More</a>
                  @endif
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-5 col-sm-12">
          <div class="box-image-job">
            <figure class="wow animate__animated animate__fadeIn" >
              <img alt=JobFinder src="{{ asset('frontend/assets/imgs/page/homepage1/xhtg.jpg') }}" style="height: 700px; object-fit:contain;border-radius: 30px">
            </figure>
          </div>
        </div>
      </div>
    </div>
  </section>
