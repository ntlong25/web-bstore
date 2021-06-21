$(document).ready(function(){
    var pShow = 12;
    var pTotal = $('.gategory-product .gategory-product-list').length;
    var numPages = pTotal/pShow;
    var lastPage = Math.ceil(numPages)-1;
    $('.pagination-bar').append('<li><span><a href="#" class="prev" ><i class="fa fa-chevron-left"></i>Previous</a></span></li>');
    for(i = 0;i < numPages;i++) {
        var pageNum = i + 1;
        $('.pagination-bar').append('<li><span><a class="pagi-num" href="#" rel="'+i+'">'+pageNum+'</a></span></li> ');
    }
    $('.pagination-bar').append('<li><span><a href="#" class="next">Next<i class="fa fa-chevron-right"></i></a></span></li>');
    $('.gategory-product .gategory-product-list').hide();
    $('.gategory-product .gategory-product-list').slice(0, pShow).show();
    $('.pagination-bar .pagi-num:first').addClass('active');
    $('.prev').addClass('disabled');
    $('.pagination-bar .pagi-num').bind('click', function(){
        $('.pagination-bar .pagi-num').removeClass('active');
        $(this).addClass('active');
        var currPage = $(this).attr('rel');
        var startItem = currPage * pShow;
        var endItem = startItem + pShow;
        $('.gategory-product .gategory-product-list').css('opacity','0.0').hide().
        slice(startItem, endItem).css('display','table-row').animate({opacity:1}, 300);

        if($(this).attr('rel')==0){
            $('.pagination-bar .prev').addClass('disabled');
            $('.pagination-bar .prev').removeClass('active');
            $('.pagination-bar .next').addClass('active');
            $('.pagination-bar .next').removeClass('disabled');  
        }
        else if($(this).attr('rel')==lastPage){
            $('.pagination-bar .prev').addClass('active');
            $('.pagination-bar .prev').removeClass('disabled');
            $('.pagination-bar .next').addClass('disabled');
            $('.pagination-bar .next').removeClass('active');
        }
        else{
            $('.pagination-bar .prev').addClass('active');
            $('.pagination-bar .prev').removeClass('disabled');
            $('.pagination-bar .next').addClass('active');    
            $('.pagination-bar .next').removeClass('disabled');    
        }
    });
    
    

    
});


