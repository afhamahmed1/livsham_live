<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto"><a class="navbar-brand" href="/">
                        <img id="menu_image" class="img-fluid" src="{{ asset('app-assets/images/logo/livshem9.png') }}" height="40px" width="150px" alt="...">
                </a></li>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="bx bx-x d-block d-xl-none font-medium-4 primary"></i><i class="toggle-icon bx bx-disc font-medium-4 d-none d-xl-block primary" data-ticon="bx-disc"></i></a></li>
        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation" data-icon-style="lines">
            <li class="nav-item {{ (request()->routeIs('dashboard')) ? 'active' : '' }}"><a href="{{ route('dashboard') }}"><i class="menu-livicon" data-icon="desktop"></i><span class="menu-title text-truncate" data-i18n="Dashboard">Dashboard</span></a>
            </li>
            <li class=" navigation-header text-truncate"><span data-i18n="Apps">Apps</span>
            <li class=" nav-item"><a href="#"><i class="menu-livicon" data-icon="shoppingcart"></i><span class="menu-title text-truncate" data-i18n="Products">Products Tab</span></a>
                <ul class="menu-content">
                    <li class="{{ (request()->routeIs('admin.product.index')) ? 'active' : '' }}"><a class="d-flex align-items-center {{ (request()->routeIs('admin.product.index')) ? 'active' : '' }}" href="{{ route('admin.product.index') }}"><i class="bx bx-right-arrow-alt"></i><span class="menu-item text-truncate" data-i18n="Product"> Product</span></a>
                    </li>
                    <li class="{{ (request()->routeIs('admin.category.index')) ? 'active' : '' }}"><a class="d-flex align-items-center {{ (request()->routeIs('admin.category.index')) ? 'active' : '' }}" href="{{ route('admin.category.index') }}"><i class="bx bx-right-arrow-alt"></i><span class="menu-item text-truncate" data-i18n="Product Categories"> Product Categories</span></a>
                    </li>
                    <li class="{{ (request()->routeIs('admin.subcategory.index')) ? 'active' : '' }}"><a class="d-flex align-items-center {{ (request()->routeIs('admin.subcategory.index')) ? 'active' : '' }}" href="{{ route('admin.subcategory.index') }}"><i class="bx bx-right-arrow-alt"></i><span class="menu-item text-truncate" data-i18n="Product SubCategories">Product SubCategory</span></a>
                    </li>
                    <li class="{{ (request()->routeIs('admin.subsubcat.index')) ? 'active' : '' }}"><a class="d-flex align-items-center {{ (request()->routeIs('admin.subsubcat.index')) ? 'active' : '' }}" href="{{ route('admin.subsubcat.index') }}"><i class="bx bx-right-arrow-alt"></i><span class="menu-item text-truncate" data-i18n="Product SubSubCategories">Product Sub Sub Category</span></a>
                    </li>
                    <li class="{{ (request()->routeIs('admin.tag.index')) ? 'active' : '' }}"><a class="d-flex align-items-center {{ (request()->routeIs('admin.tag.index')) ? 'active' : '' }}" href="{{ route('admin.tag.index') }}"><i class="bx bx-right-arrow-alt"></i><span class="menu-item text-truncate" data-i18n="Product Tags">Product Tags</span></a>
                    <li class="{{ (request()->routeIs('admin.productorigin.index')) ? 'active' : '' }}"><a class="d-flex align-items-center {{ (request()->routeIs('admin.productorigin.index')) ? 'active' : '' }}" href="{{ route('admin.productorigin.index') }}"><i class="bx bx-right-arrow-alt"></i><span class="menu-item text-truncate" data-i18n="Product Tags">Product Origins</span></a>
                    </li>
                    <li class="{{ (request()->routeIs('admin.trademark.index')) ? 'active' : '' }}"><a class="d-flex align-items-center {{ (request()->routeIs('admin.trademark.index')) ? 'active' : '' }}" href="{{ route('admin.trademark.index') }}"><i class="bx bx-right-arrow-alt"></i><span class="menu-item text-truncate" data-i18n="Product Trademark">Product Trademarks</span></a>
                    </li>
                    <li class="{{ (request()->routeIs('admin.diet.index')) ? 'active' : '' }}"><a class="d-flex align-items-center {{ (request()->routeIs('admin.diet.index')) ? 'active' : '' }}" href="{{ route('admin.diet.index') }}"><i class="bx bx-right-arrow-alt"></i><span class="menu-item text-truncate" data-i18n="Product Diets">Product Diets</span></a>
                    </li>
                    {{-- <li class="{{ (request()->routeIs('admin.review.index')) ? 'active' : '' }}"><a class="d-flex align-items-center {{ (request()->routeIs('admin.review.index')) ? 'active' : '' }}" href="{{ route('admin.review.index') }}"><i class="bx bx-right-arrow-alt"></i><span class="menu-item text-truncate" data-i18n="Product Reviews">Product Reviews</span></a>
                    </li> --}}
                </ul>
            </li>
            <li class=" nav-item {{ (request()->routeIs('admin.postcode.index')) ? 'active' : '' }}"><a href="{{ route('admin.postcode.index') }}"><i class="menu-livicon" data-icon="minus-alt"></i><span class="menu-title text-truncate" data-i18n="Postcode">Postnummer</span></a>
                
            </li>
            <li class=" nav-item {{ (request()->routeIs('admin.deliverytime.index')) ? 'active' : '' }}"><a href="{{ route('admin.deliverytime.index') }}"><i class="menu-livicon" data-icon="minus-alt"></i><span class="menu-title text-truncate" data-i18n="Leveranstid">Leveranstid</span></a>
                
            </li>
            <li class=" nav-item {{ (request()->routeIs('admin.message')) ? 'active' : '' }}"><a href="{{ route('admin.message') }}"><i class="menu-livicon" data-icon="minus-alt"></i><span class="menu-title text-truncate" data-i18n="meddelanden">Meddelanden</span></a>
                
            </li>
            <li class=" nav-item {{ (request()->routeIs('admin.coupons.index')) ? 'active' : '' }}"><a href="{{ route('admin.coupons.index') }}"><i class="menu-livicon" data-icon="minus-alt"></i><span class="menu-title text-truncate" data-i18n="Products">Coupons</span></a>
                
            </li>
            <li class=" nav-item {{ (request()->routeIs('admin.order.index')) ? 'active' : '' }}"><a href="{{ route('admin.order.index') }}"><i class="menu-livicon" data-icon="shoppingcart-in"></i><span class="menu-title text-truncate" data-i18n="Orders">Orders</span></a>
                
            </li>
            <li class=" nav-item {{ (request()->routeIs('admin.cust.index')) ? 'active' : '' }}"><a href="{{ route('admin.cust.index') }}"><i class="menu-livicon" data-icon="user"></i><span class="menu-title text-truncate" data-i18n="Customers">Customers</span></a>
                
            </li>
        </ul>
    </div>
</div>