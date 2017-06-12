function spleft(obj,distance){
	this.objs=$(obj).find('.spleft');
	if(parseInt(objs.css('left'))==0){
		return
	}else{
		if(distance==undefined){
			this.distance=1000;
		}else{
			this.distance=distance
		}
		var wint=$(window).height();
		var sct=$(window).scrollTop();
		if((wint+sct-150)>$(obj).offset().top){
			objs.animate({'left':'0'},this.distance)
		}else{return;
		}
	}				
}//动画效果从左侧进来

function  spright(obj,distance){
	this.objs=$(obj).find('.spright');
	if(parseInt(objs.css('right'))==0){return
	}else{
		if(distance==undefined){
			this.distance=1000;
		}else{
			this.distance=distance
		}
		
		var wint=$(window).height();
		var sct=$(window).scrollTop();
		if((wint+sct-150)>$(obj).offset().top){
			objs.animate({'right':'0'},this.distance)
		}else{return;
		}
	}				
}//动画效果从右侧进来

function sptop(obj,distance){
	this.objs=$(obj).find('.sptop');
	if(parseInt(objs.css('top'))==0){return
	}else{
		if(distance==undefined){
			this.distance=1000;
		}else{
			this.distance=distance
		}
		var wint=$(window).height();
		var sct=$(window).scrollTop();
		if((wint+sct-150)>$(obj).offset().top){
			objs.animate({'top':'0'},this.distance)
		}else{return;
		}
	}				
}//动画效果从左侧进来

function spbottom(obj,distance){
	this.objs=$(obj).find('.spbottom');
	if(parseInt(objs.css('bottom'))==0){ return
	}else{
		if(distance==undefined){
			this.distance=1000;
		}else{
			this.distance=distance
		}
		var wint=$(window).height();
		var sct=$(window).scrollTop();
		if((wint+sct-150)>$(obj).offset().top){
			objs.animate({'bottom':'0'},this.distance)
		}else{return;
		}
	}				
}//动画效果从左侧进来

$(document).on('click','#res_top',function(){
	$('body,html').animate({
		'scrollTop':0
	})
})//恢复

