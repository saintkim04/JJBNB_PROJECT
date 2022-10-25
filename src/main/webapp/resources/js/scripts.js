/*!
* Start Bootstrap - Creative v7.0.6 (https://startbootstrap.com/theme/creative)
* Copyright 2013-2022 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-creative/blob/master/LICENSE)
*/
//
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
        if (!navbarCollapsible) {
            return;
        }
        if (window.scrollY === 0) {
            navbarCollapsible.classList.remove('navbar-shrink');
            
        } else {
            navbarCollapsible.classList.add('navbar-shrink');
           
        }

    };

    // Shrink the navbar 
    navbarShrink();

    // Shrink the navbar when page is scrolled
    document.addEventListener('scroll', navbarShrink);

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 74,
        });
    };

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });

    // Activate SimpleLightbox plugin for portfolio items
    new SimpleLightbox({
        elements: '#portfolio a.portfolio-box'
    });

    
        var nickmodify = document.getElementById("nick-modify");
        var nickbtn = document.getElementById("nick-btn");
        var nickcancel = document.getElementById("nick-cancel");

        var emailmodify = document.getElementById("email-modify");
        var emailbtn = document.getElementById("email-btn");
        var emailcancel = document.getElementById("email-cancel");

        var phonemodify = document.getElementById("phone-modify");
        var phonebtn = document.getElementById("phone-btn");
        var phonecancel = document.getElementById("phone-cancel");
        
        var pwmodify = document.getElementById("pw-modify");
        var pwbtn = document.getElementById("pw-btn");
        var pwcancel = document.getElementById("pw-cancel");

        nickbtn.addEventListener("click",function(){
            nickbtn.style.display = 'none';
            nickmodify.style.display = 'block';
        });
        emailbtn.addEventListener("click",function(){
            emailbtn.style.display = 'none';
            emailmodify.style.display = 'block';
        });
        phonebtn.addEventListener("click",function(){
            phonebtn.style.display = 'none';
            phonemodify.style.display = 'block';
        });
        pwbtn.addEventListener("click",function(){
        	pwbtn.style.display = 'none';
        	pwmodify.style.display = 'block';
        });
        nickcancel.addEventListener("click",function(){
            nickbtn.style.display = 'block';
            nickmodify.style.display = 'none';
        });
        emailcancel.addEventListener("click",function(){
            emailbtn.style.display = 'block';
            emailmodify.style.display = 'none';
        });
        phonecancel.addEventListener("click",function(){
            phonebtn.style.display = 'block';
            phonemodify.style.display = 'none';
        });
        pwcancel.addEventListener("click",function(){
        	pwbtn.style.display = 'block';
        	pwmodify.style.display = 'none';
        });

        var myCarousel = document.getElementById('myCarousel')

        var slidetext = document.getElementById('#slidetext');
        myCarousel.addEventListener('slid.bs.carousel', function () {
            slidetext.classList.add('active');
        })







});
