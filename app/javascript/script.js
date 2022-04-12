
// set active class to top nav bar items
// $(document).on('click', 'nav ul li', function (ev) {
//         // ev.preventDefault();
//         $("nav ul li").removeClass("active");
//         $(this).addClass("active");   
//     });


// var setDefaultActive = function() {
//     var path = window.location.pathname;

//     var element = $(".sidebar-menu a[href='" + path + "']");

//     element.addClass("active");
// }

// setDefaultActive()


// $(document).ready(function(){
//     if($(".top-nav  a").attr("href")==window.location.href){
//         $(this).addClass("active");   
//     }
//    else{
//     $(".top-nav ul li").removeClass("active");
//      }
// });

// $(document).ready(function(){
//     $(document).on('click', '.top-nav a', function (ev) {
//         // ev.preventDefault();
//         // var path = $(this).attr("href")
//         // console.log("this is my path"+path);
        
//         // $("nav ul li").removeClass("active");
//         // $(this).addClass("active");   
//         if($(".top-nav li  a").attr("href")==window.location.href){
//             console.log("this is my path"+path);
//         $(this).parent().addClass("active");   
//          }
//     });

    
    // if($(".top-nav li  a").attr("href")==window.location.href){
    //     $(this).parent().addClass("active");   
    // }
            
// });

// $(document).on('click','ul li', function(){
//     $(this).addClass('active').sibilings().removeClass('active');
// })

// const currentLocation = location.href;
// const menuItem = document.querySelectorAll('a');
// const menuLength = menuItem.length

// for(let i=0; i<menuLength; i++){
//     if(menuItem[i].href === currentLocation){
//         menuItem[i].className = "active";
//     }
// }


// $(document).ready(function(){
//     var path = window.location.pathname.split("/").pop();
//     console.log(path);
//     var target = $('nav a[href="'+path+'"]');
//     target.addClass('active');
// })

// $( '.top-nav .navbar-nav a' ).on('click', 
//         function () {

//             $( '.top-nav .navbar-nav' ).find( 'li.active' ).removeClass( 'active' );
//             $( this ).parent( 'li' ).addClass( 'active' );
//         });

// $(document).ready(function(){
//     var path = window.location.pathname;
//     console.log(path);
//     // var target = $('nav a[href="'+path+'"]');
//     // target.addClass('active');
//     $( '.top-nav .navbar-nav a' ).on('click', function () {

//             $( '.top-nav .navbar-nav' ).find( 'li.active' ).removeClass( 'active' );
//             $( this ).parent( 'li' ).addClass( 'active' );
//         });
//     $(this).addClass('active').sibilings().removeClass('active');

// })

// $(document).ready(function() {
//     $('li.active').removeClass('active');
//     $('a[href="' + location.pathname + '"]').closest('li').addClass('active'); 
//   });

// $(document).ready(function() {
//     $.each($('#navbar').find('li'), function() {
//         $(this).toggleClass('active', 
//             window.location.pathname.indexOf($(this).find('a').attr('href')) > -1);
//     }); 
// });