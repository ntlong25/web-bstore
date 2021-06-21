$(document).ready(function(){
    var pShow = 12;
    var pTotal = $('.gategory-product .gategory-product-list').length;
    var numPages = pTotal/pShow;
    $('.pagination-bar').append('<li class="prev"><a href="#" ><i class="fa fa-chevron-left"></i>Previous</a></li>');
    for(i = 0;i < numPages;i++) {
        var pageNum = i + 1;
        $('.pagination-bar').append('<li class="active"><span><a class="pagi-num" href="#" rel="'+i+'">'+pageNum+'</a></span></li> ');
    }
    $('.pagination-bar').append('<li class="next"><a href="#" >Next<i class="fa fa-chevron-right"></i></a></li>');
    $('.gategory-product .gategory-product-list').hide();
    $('.gategory-product .gategory-product-list').slice(0, pShow).show();
    $('.pagination-bar .pagi-num:first').addClass('active');
    console.log($('.pagination-bar .pagi-num').text());
    
    $('.pagination-bar .pagi-num').bind('click', function(){
        $('.pagination-bar .pagi-num').removeClass('active');
        $(this).addClass('active');
        var currPage = $(this).attr('rel');
        var startItem = currPage * pShow;
        var endItem = startItem + pShow;
        $('.gategory-product .gategory-product-list').css('opacity','0.0').hide()
        .slice(startItem, endItem).css('display','table-row').animate({opacity:1}, 300);
    });
    if($('.pagination-bar .pagi-num').text()==1){
        $('.prev').addClass('disabled');
        $('.next').addClass('active');
    }
    else if($('.pagination-bar .pagi-num').text()==Math.ceil(numPages)){
        $('.prev').addClass('active');
        $('.next').addClass('disabled');
    }
    else{
        $('.prev').addClass('active');
        $('.next').addClass('active');
    }
    

    
});


