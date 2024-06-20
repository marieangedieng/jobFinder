<header class="header sticky-bar " style="background-color: #0093c6 ;">
    <div class="container">
      <div class="main-header">
        <div class="header-left">
            <div class="header-logo">
                <a class='d-flex' href='{{ url('/') }}'>
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


