<header class="header sticky-bar " style="background-color: #0093c6 ;">
    <div class="container">
      <div class="main-header">
        <div class="header-left">
            <div class="header-title">
                <a class='d-flex' href='{{ url('/') }}' style="color:#012A4A; font-family: 'Times New Roman',system-ui; font-size: 40px; font-weight: bolder">
                    <img alt="jobFinder" src="{{ asset('frontend/assets/imgs/page/homepage1/headerLogoDark.png')}}" >
                </a>
            </div>
        </div>
        <div class="header-nav">
          <nav class="nav-main-menu">
            @php
                $navigationMenu = \Menu::getByName('Navigation Menu');

            @endphp
            <ul class="main-menu">
                @foreach ($navigationMenu as $menu)

                    @if ($menu['child'])
                    <li class="has-children"><a href="{{ $menu['link'] }}" style="color:#012A4A;  font-weight: bolder; text-decoration: underline; font-size: 17px;">{{ $menu['label'] }}</a>
                        <ul class="sub-menu">
                            @foreach ($menu['child'] as $childMenu)
                            <li><a href="{{ $childMenu['link'] }}" style="color:#012A4A; text-decoration: underline; font-size: 17px; font-weight: bolder">{{ $childMenu['label'] }}</a></li>
                            @endforeach
                        </ul>
                      </li>
                    @else
                      @if (auth()->user()?->role == 'candidate' && $menu['link'] != '/pricing')
                      <li class="has-children"><a class="" href="{{ $menu['link'] }}" style="color:#012A4A;font-size: 17px; text-decoration: underline; font-weight: bolder">{{ $menu['label'] }}</a></li>
                      @else
                      <li class="has-children"><a class="" href="{{ $menu['link'] }}" style="color:#012A4A;font-size: 17px; text-decoration: underline; font-weight: bolder">{{ $menu['label'] }}</a></li>
                      @endif
                    @endif

                @endforeach

            </ul>
          </nav>
          <div class="burger-icon burger-icon-white"><span class="burger-icon-top"></span><span
              class="burger-icon-mid"></span><span class="burger-icon-bottom"></span></div>
        </div>
        <div class="header-right">
          <div class="block-signin">
            <!-- <a class="text-link-bd-btom hover-up" href="page-register.html">Register</a> -->
            @guest
                  <a class="btn btn-primary" style="border-radius: 15px; background-color:#0093c6;border-color: white;  color:white; font-weight: bold" onmouseover="this.style.color='#0c374c';this.style.borderColor='#0c374c'" onmouseout="this.style.color='white';this.style.borderColor='white'" href="{{ route('register') }}">Sign up</a>
                  <a class="btn btn-primary" style="border-radius: 15px; background-color: blue; font-weight: bold" onmouseover="this.style.backgroundColor='#0093c6'"  onmouseout="this.style.backgroundColor='blue'" href="{{ route('login') }}">Sign in</a>
            @endguest
            @auth
                @if (auth()->user()->role === 'company')
                    <a class="btn btn-primary" style="border-radius: 15px; width: 200px; background-color: blue" onmouseover="this.style.backgroundColor='#87CEEB'" onmouseout="this.style.backgroundColor='#0c374c'" href="{{ route('company.dashboard') }}">Company Profile</a>
                @elseif(auth()->user()->role === 'candidate')
                    <a class="btn btn-primary" style="border-radius: 15px; width: 200px; background-color: blue" onmouseover="this.style.backgroundColor='#87CEEB'" onmouseout="this.style.backgroundColor='#0c374c'" href="{{ route('candidate.dashboard') }}">Candidate Profile</a>
                @endif
            @endauth
          </div>
        </div>
      </div>
    </div>
  </header>

  <div class="mobile-header-active mobile-header-wrapper-style perfect-scrollbar">
    <div class="mobile-header-wrapper-inner">
      <div class="mobile-header-content-area">
        <div class="perfect-scroll">
          <div class="mobile-search mobile-header-border mb-30">
            <form action="#">
              <input type="text" placeholder="Search…"><i class="fi-rr-search"></i>
            </form>
          </div>
          <div class="mobile-menu-wrap mobile-header-border">
            <!-- mobile menu start-->
            <nav>
              <ul class="mobile-menu font-heading">
                <li class="has-children"><a class="active" href="index.html">Home</a>
                  <ul class="sub-menu">
                    <li><a href="index.html">Home 1</a></li>
                    <li><a href="index-2.html">Home 2</a></li>
                    <li><a href="index-3.html">Home 3</a></li>
                    <li><a href="index-4.html">Home 4</a></li>
                    <li><a href="index-5.html">Home 5</a></li>
                    <li><a href="index-6.html">Home 6</a></li>
                  </ul>
                </li>
                <li class="has-children"><a href="jobs-grid.html">Find a Job</a>
                  <ul class="sub-menu">
                    <li><a href="jobs-grid.html">Jobs Grid</a></li>
                    <li><a href="jobs-list.html">Jobs List</a></li>
                    <li><a href="job-details.html">Jobs Details </a></li>
                    <li><a href="job-details-2.html">Jobs Details 2 </a></li>
                  </ul>
                </li>
                <li class="has-children"><a href="companies-grid.html">Recruiters</a>
                  <ul class="sub-menu">
                    <li><a href="companies-grid.html">Recruiters</a></li>
                    <li><a href="company-details.html">Company Details</a></li>
                  </ul>
                </li>
                <li class="has-children"><a href="candidates-grid.html">Candidates</a>
                  <ul class="sub-menu">
                    <li><a href="candidates-grid.html">Candidates Grid</a></li>
                    <li><a href="candidate-details.html">Candidate Details</a></li>
                  </ul>
                </li>
                <li class="has-children"><a href="blog-grid.html">Pages</a>
                  <ul class="sub-menu">
                    <li><a href="page-about.html">About Us</a></li>
                    <li><a href="page-pricing.html">Pricing Plan</a></li>
                    <li><a href="page-contact.html">Contact Us</a></li>
                    <li><a href="page-register.html">Register</a></li>
                    <li><a href="page-signin.html">Signin</a></li>
                    <li><a href="page-reset-password.html">Reset Password</a></li>
                    <li><a href="page-content-protected.html">Content Protected</a></li>
                  </ul>
                </li>
                <li class="has-children"><a href="blog-grid.html">Blog</a>
                  <ul class="sub-menu">
                    <li><a href="blog-grid.html">Blog Grid</a></li>
                    <li><a href="blog-grid-2.html">Blog Grid 2</a></li>
                    <li><a href="blog-details.html">Blog Single</a></li>
                  </ul>
                </li>
                <li><a href="http://wp.alithemes.com/html/joblist/demos/dashboard" target="_blank">Dashboard</a></li>
              </ul>
            </nav>
          </div>
          <div class="mobile-account">
            <h6 class="mb-10">Your Account</h6>
            <ul class="mobile-menu font-heading">
              <li><a href="#">Profile</a></li>
              <li><a href="#">Work Preferences</a></li>
              <li><a href="#">Account Settings</a></li>
              <li><a href="#">Go Pro</a></li>
              <li><a href="page-signin.html">Sign Out</a></li>
            </ul>
          </div>
          <div class="site-copyright">Copyright 2022 &copy; joblist. <br>Designed by AliThemes.</div>
        </div>
      </div>
    </div>
  </div>

  <div class="mobile-header-active mobile-header-wrapper-style perfect-scrollbar">
    <div class="mobile-header-wrapper-inner">
      <div class="mobile-header-content-area">
        <div class="perfect-scroll">
          <div class="mobile-search mobile-header-border mb-30">
            <form action="#">
              <input type="text" placeholder="Search…"><i class="fi-rr-search"></i>
            </form>
          </div>
          <div class="mobile-menu-wrap mobile-header-border">
            <!-- mobile menu start-->
            <nav>
              <ul class="mobile-menu font-heading">
                <li class="has-children"><a class="active" href="index.html">Home</a>
                  <ul class="sub-menu">
                    <li><a href="index.html">Home 1</a></li>
                    <li><a href="index-2.html">Home 2</a></li>
                    <li><a href="index-3.html">Home 3</a></li>
                    <li><a href="index-4.html">Home 4</a></li>
                    <li><a href="index-5.html">Home 5</a></li>
                    <li><a href="index-6.html">Home 6</a></li>
                  </ul>
                </li>
                <li class="has-children"><a href="jobs-grid.html">Find a Job</a>
                  <ul class="sub-menu">
                    <li><a href="jobs-grid.html">Jobs Grid</a></li>
                    <li><a href="jobs-list.html">Jobs List</a></li>
                    <li><a href="job-details.html">Jobs Details </a></li>
                    <li><a href="job-details-2.html">Jobs Details 2 </a></li>
                  </ul>
                </li>
                <li class="has-children"><a href="companies-grid.html">Recruiters</a>
                  <ul class="sub-menu">
                    <li><a href="companies-grid.html">Recruiters</a></li>
                    <li><a href="company-details.html">Company Details</a></li>
                  </ul>
                </li>
                <li class="has-children"><a href="candidates-grid.html">Candidates</a>
                  <ul class="sub-menu">
                    <li><a href="candidates-grid.html">Candidates Grid</a></li>
                    <li><a href="candidate-details.html">Candidate Details</a></li>
                  </ul>
                </li>
                <li class="has-children"><a href="blog-grid.html">Pages</a>
                  <ul class="sub-menu">
                    <li><a href="page-about.html">About Us</a></li>
                    <li><a href="page-pricing.html">Pricing Plan</a></li>
                    <li><a href="page-contact.html">Contact Us</a></li>
                    <li><a href="page-register.html">Register</a></li>
                    <li><a href="page-signin.html">Signin</a></li>
                    <li><a href="page-reset-password.html">Reset Password</a></li>
                    <li><a href="page-content-protected.html">Content Protected</a></li>
                  </ul>
                </li>
                <li class="has-children"><a href="blog-grid.html">Blog</a>
                  <ul class="sub-menu">
                    <li><a href="blog-grid.html">Blog Grid</a></li>
                    <li><a href="blog-grid-2.html">Blog Grid 2</a></li>
                    <li><a href="blog-details.html">Blog Single</a></li>
                  </ul>
                </li>
                <li><a href="http://wp.alithemes.com/html/joblist/demos/dashboard" target="_blank">Dashboard</a></li>
              </ul>
            </nav>
          </div>
          <div class="mobile-account">
            <h6 class="mb-10">Your Account</h6>
            <ul class="mobile-menu font-heading">
              <li><a href="#">Profile</a></li>
              <li><a href="#">Work Preferences</a></li>
              <li><a href="#">Account Settings</a></li>
              <li><a href="#">Go Pro</a></li>
              <li><a href="page-signin.html">Sign Out</a></li>
            </ul>
          </div>
          <div class="site-copyright">Copyright 2022 &copy; joblist. <br>Designed by AliThemes.</div>
        </div>
      </div>
    </div>
  </div>
