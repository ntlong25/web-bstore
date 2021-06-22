$(document).ready(function(){
    var pShow = 12;
    var pTotal = $('.gategory-product .gategory-product-list').length;
    var numPages = pTotal/pShow;
    var lastPage = Math.ceil(numPages)-1;
    const ul = $('.pagination-bar');
    ul.append('<li><a href="#" class="prev" ><i class="fa fa-chevron-left"></i></a></li>');
    for(i = 0;i < numPages;i++) {
        var pageNum = i + 1;
        ul.append('<li><a class="pagi-num" href="#" rel="'+i+'">'+pageNum+'</a></li> ');
    }
    ul.append('<li><a href="#" class="next"><i class="fa fa-chevron-right"></i></a></li>');


    // console.log($('.pagination-bar a.pagi-num').siblings());
    
    $('.gategory-product .gategory-product-list').hide();
    $('.gategory-product .gategory-product-list').slice(0, pShow).show();
    $('.pagination-bar .pagi-num:first').addClass('active');
    $('.prev').addClass('disabled');$('.next').addClass('active');
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

    // Prev page click
    $('.pagination-bar .prev').bind('click', function(){
        // Lấy phần tử đầu tiên có class = "pagi-num" 
        const first = $('.pagination-bar .pagi-num').siblings().first();
        // Nếu phần tử đó không có class='active' thì xử lý:
        if(!first.hasClass('active')){
            // Lấy phần tử có class .pagi-num và có class .active
            const active = $('.pagination-bar .pagi-num').siblings('.active');
            // Xóa class active 
            $('.pagination-bar .pagi-num').removeClass('active');
            // Lấy phần tử trước đó
            const prevItem = active.prev();
            prevItem.addClass('active');
            // Lấy giá trị 'rel' của prevItem
            
            var currPage = prevItem.attr('rel');
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
        }
    });

    // Next page click
    $('.pagination-bar .next').bind('click', function(){
        const last = $('.pagination-bar .pagi-num').last();
        if(!last.hasClass('active')){
            const active = $('.pagination-bar .pagi-num').find('.active');
            console.log(active);
            console.log(active.attr('rel'));
            $('.pagination-bar .pagi-num').removeClass('active');
            const nextItem = active.next();
            nextItem.addClass('active');
            
            var currPage = nextItem.attr('rel');
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
        }
    });


    // /////////////////////////////////////////////////////////////////////////////
    
    
    
    
});


