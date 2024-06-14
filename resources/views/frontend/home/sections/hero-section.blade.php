<div class="bg-homepage1" style="background-image: url({{ asset('frontend/assets/imgs/page/homepage1/ytcycyyhci.jpg') }})"></div>

<section class="section-box mt-100 mb-100 banner_section">
    <div class="container">
      <div class="banner-hero hero-1">
        <div class="banner-inner">
          <div class="row align-items-center">
            <div class="col-xl-7 col-lg-12">
              <div class="block-banner">
                <h1 class="heading-banner wow animate__animated animate__fadeInUp">Discover Your Dream Job Today - Your Future Starts Here</h1>
                <div class="banner-description mt-20 wow animate__animated animate__fadeInUp" data-wow-delay=".1s" >
                    Find Your Perfect Career Path
                </div>
                <div class="form-find mt-40 wow animate__animated animate__fadeIn" data-wow-delay=".2s" style="border-radius: 20px">
                  <form action="{{ route('jobs.index') }}" method="GET" >
                    <div class="box-industry" >
                      <select class="form-input mr-10 select-active input-industry" name="category" >
                        <option value="" >Industry</option>
                        @foreach ($jobCategories as $category)
                            <option value="{{ $category->slug }}">{{ $category->name }}</option>
                        @endforeach

                      </select>
                    </div>
                    <select class="form-input mr-10 select-active" name="country">
                      <option value="" >Location</option>
                      @foreach ($countries as $country)
                        <option value="{{ $country->id }}">{{ $country->name }}</option>

                      @endforeach
                    </select>
                    <input class="form-input input-keysearch mr-10" type="text" name="search" style="font-weight: bold" placeholder="Your keyword... ">
                    <button class="btn btn-default btn-find" style="font-weight: bold;  border-radius: 15px; background-color:#0093c6" onmouseover="this.style.backgroundColor='#0c374c'" onmouseout="this.style.backgroundColor='#0093c6'">Search</button>
                  </form>
                </div>
              </div>
            </div>
              <div class="col-xl-5 col-lg-12 d-none d-xl-block col-md-6">
                  <div class="banner-imgs mt-40">
                      <div class="block-1" style="border-radius: 45px"><img class="img-responsive" alt=JobFinder
                                                src="{{ asset('frontend/assets/imgs/page/homepage1/img-banner1.png') }}"></div>
                  </div>
              </div>
          </div>
        </div>
      </div>
    </div>
  </section>
