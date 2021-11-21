 $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

$('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });


$(".hero__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,

    });

$('.collapse').on('shown.bs.collapse', function () {
        $(this).prev().addClass('active');
    });

    $('.collapse').on('hidden.bs.collapse', function () {
        $(this).prev().removeClass('active');
    });

$(".product__color__select label, .shop__sidebar__size label, .product__details__option__size label").on('click', function () {
        $(".product__color__select label, .shop__sidebar__size label, .product__details__option__size label").removeClass('active');
        $(this).addClass('active');

    });

$(".nice-scroll").niceScroll({
        cursorcolor: "#0d0d0d",
        cursorwidth: "5px",
        background: "#e5e5e5",
        cursorborder: "",
        autohidemode: true,
        horizrailenabled: false
    });

    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    if(mm == 12) {
        mm = '01';
        yyyy = yyyy + 1;
    } else {
        mm = parseInt(mm) + 1;
        mm = String(mm).padStart(2, '0');
    }
    var timerdate = mm + '/' + dd + '/' + yyyy;

$("#countdown").countdown(timerdate, function (event) {
        $(this).html(event.strftime("<div class='cd-item'><span>%D</span> <p>Days</p> </div>" + "<div class='cd-item'><span>%H</span> <p>Hours</p> </div>" + "<div class='cd-item'><span>%M</span> <p>Minutes</p> </div>" + "<div class='cd-item'><span>%S</span> <p>Seconds</p> </div>"));
    });

$('.filter__controls li').on('click', function () {
            $('.filter__controls li').removeClass('active');
            $(this).addClass('active');
        });
if ($('.product__filter').length > 0) {
            var containerEl = document.querySelector('.product__filter');
            var mixer = mixitup(containerEl);
    }

    $(".canvas__open").on('click', function () {
        $(".offcanvas-menu-wrapper").addClass("active");
        $(".offcanvas-menu-overlay").addClass("active");
    });

    $(".offcanvas-menu-overlay").on('click', function () {
        $(".offcanvas-menu-wrapper").removeClass("active");
        $(".offcanvas-menu-overlay").removeClass("active");
    });

 $('.search-switch').on('click', function () {
        $('.search-model').fadeIn(400);
    });

    $('.search-close-switch').on('click', function () {
        $('.search-model').fadeOut(400, function () {
            $('#search-input').val('');
        });
    });

 // $("select").niceSelect();


//   $('.service__applecare').slick({
//   infinite: false,
//   speed: 300,
//   slidesToShow: 4,
//   slidesToScroll: 1,
//   responsive: [
//     {
//       breakpoint: 1024,
//       settings: {
//         slidesToShow: 3,
//         slidesToScroll: 3,
//         infinite: true,
//         dots: true
//       }
//     },
//     {
//       breakpoint: 600,
//       settings: {
//         slidesToShow: 2,
//         slidesToScroll: 2
//       }
//     },
//     {
//       breakpoint: 480,
//       settings: {
//         slidesToShow: 1,
//         slidesToScroll: 1
//       }
//     }
//   ]
// });

  function showM(obj){
    if(obj.find('.edit-child').hasClass('show')){
        obj.find('.edit-child').removeClass('show');
    }else{
        obj.find('.edit-child').addClass('show');
    }
  }

  function toggleSidebar(){
    event.stopPropagation();
    $('.sidebar').addClass('show');
  }

  $('html, body').on('click',function(){
    if($('.sidebar').hasClass('show')){
        $('.sidebar').removeClass('show');
    }
  })
  
  var contact = {
		
		/**
		 * https://www.w3schools.com/js/js_json_syntax.asp
		 */
		saveContact: function() {
			var data = {};
			data["name"] = $("#name").val();
			data["email"] = $("#email").val();
			data["message"] = $("#message").val();
			
			$.ajax({
				url: "/save-contact-with-ajax",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(success) { // được gọi khi web-service trả về dữ liệu.
					alert("Gửi phản hồi thành công");
					$("#name").val("");
					$("#email").val("");
					$("#message").val("");
				},
				error: function (error) { // error callback 
			        alert("Có lỗi xảy ra, xin thử lại sau!");
			    }
			});
		}
	};
	
	var notification = {
		
		/**
		 * https://www.w3schools.com/js/js_json_syntax.asp
		 */
		saveEmail: function() {
			var data = {};
			data["email"] = $("#email").val();
			
			$.ajax({
				url: "/save-notification-email",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(sucess) { // được gọi khi web-service trả về dữ liệu.
					alert("Đăng kí nhận thông báo thành công!");
					$("#email").val("");
				},
				error: function (error) { // error callback 
			        alert("Có lỗi xảy ra, xin thử lại sau!");
			    }
			});
		}
	};
var cart = {

	choose_product_to_cart: function(maSanPham, soluong) {
			var data = {};
			data["productId"] = maSanPham;
			data["quantity"] = soluong;
			
			$.ajax({
				url: "/choose-product-to-cart",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(body,status,xhr) { // được gọi khi web-service trả về dữ liệu.
					console.log(body);
					var stt = parseInt(xhr.status);
					if (stt == 200) {
						alert("Thêm sản phẩm vào giỏ hàng thành công!");
					}
					else {
						alert("Thêm sản phẩm thất bại!");
					}
				},
				error: function () { // error callback 
			        alert("Có lỗi xảy ra, xin thử lại sau!");
			    }
			});
		},
	linh_change_quantity_product: function(maSanPham, soluong,id_price,price_one) {
			var data = {};
			data["productId"] = maSanPham;
			data["quantity"] = soluong;
			
			$.ajax({
				url: "/change-product-cart",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(success) { // được gọi khi web-service trả về dữ liệu.
					var price = parseFloat(price_one) * parseFloat(soluong);
					var format = format2(String(price));
					$(id_price).html(format);
				},
				error: function (error) { // error callback 
			        alert("Cập nhật thất bại!");
			    }
			});
		},
		remove_product : function(productId) {
			$.ajax({
					url : "/remove-product/" + productId,
					type : "get",
					dataType : "text",
					success : function(resData) {
						console.log(resData);
						var child = "#" + productId;
						$(child).remove();
					},
					error : function(error) {
						alert("Có lỗi xảy ra, xin thử lại sau!");
					}
				}
			);
		}
};

function formatCash(str) {
 	return str.split('').reverse().reduce((prev, next, index) => {
 		return ((index % 3) ? next : (next + ',')) + prev
 	})
}
function format2(n) {
  return n.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
favorite = {
	favorite : function(prod_id) {
		$.ajax({
			url : "/add-favorite/" + prod_id,
			type : "get",
			dataType : "text",
			success : function(success) {
				var clazz = ".img_" + prod_id;
				if (success == 'add') $(clazz).attr("src", "/images/redheart.png");
				if (success == "remove") $(clazz).attr("src", "/images/heart.png");
				if (success=="usernotfound") alert("Vui lòng đăng nhập");
			},
			error : function (error) {
				alert("Có lỗi xảy ra!");
			}
 		});
	},
	remove : function(prod_id) {
		$.ajax({
			url : "/remove-favorite/" + prod_id,
			type : "get",
			dataType : "text",
			success : function(success) {
				console.log(success);
				var clazz = ".img_" + prod_id;
				$(clazz).attr("src", "/images/heart.png");
			},
			error : function (error) {
				alert("Có lỗi xảy ra!");
			}
 		});
	}
};

shop = {
	rate : function(productId) {
		var rate = 5;
		var data = {};
		if ($("#rating1").is(":checked")) rate = 1;
		if ($("#rating2").is(":checked")) rate = 2;
		if ($("#rating3").is(":checked")) rate = 3;
		if ($("#rating4").is(":checked")) rate = 4;
		if ($("#rating5").is(":checked")) rate = 5;
		data["productId"] = productId;
		data["rate"] = rate;
		$.ajax({
			url : "/rate-product",
			type : "post",
			contentType : "application/json",
			dataType : "text",
			data: JSON.stringify(data),
			success : function(status) {
				if (status == "200") {
					alert("Đánh giá thành công!");
				} else {
					alert("Có lỗi xảy ra, xin thử lại sau!");
				}
			},
			error : function() {
				alert("Có lỗi xảy ra!");
			}
			
		});
	},
	check_discount : function() {
		var name = $("#discount").val();
		$.ajax({
			url : "/check-discount/" + name ,
			type : "post",
			dataType : "text",
			success : function(mess) {
				if (mess == "notfound") {
					$("#mess").css("color","red");
					$("#mess").html("Mã không hợp lệ");
					$("#codediscount").val("");
					$("#afterprice").html(format2(String(parseFloat($("#total").val()))));
				} else {
					$("#mess").css("color","green");
					$("#mess").html("Mã hợp lệ");
					$("#codediscount").val(name);
					var total = $("#total").val();
					var disc = total - total * parseFloat(mess);
					$("#afterprice").html(format2(String(disc)));
				}
			},
			error : function() {}
		});
	}
}; 
 