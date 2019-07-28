// window.onload=function () {
// 	var index=0,
// 	    Head=document.getElementById('Head').getElementsByTagName('li');
//         quan=document.getElementById('quan'),
//         yuan=document.getElementById('yuan'),
//         tu=document.getElementById('tu'),
//         shi=document.getElementById('shi'),
//         yin=document.getElementById('yin'),
//         wen=document.getElementById('wen'),
//         Div=document.getElementById('Content').getElementsByTagName('div');

//         function lll(){
//           for (var i = 0; i < Div.length; i++) {
//             Div[i].style.display="none";
//           }
//           Div[index].style.display="block";
//         }
// 	 function cli(){
// 	 	for (var i = 0; i < Head.length; i++) {
// 	 		Head[i].className=" ";
// 	 	}
// 	 	  Head[index].className="coo";
// 	 } 

//    quan.onclick=function(){
//    	index=0;
//    	cli();
//    	lll();
//    }
//     yuan.onclick=function(){
//    	index=1;
//    	cli();
//    	lll();
//    }
//    tu.onclick=function(){
//    	index=2;
//    	cli();
//    	lll();
//    }
//    shi.onclick=function(){
//    	index=3;
//    	cli();
//    	lll();
//    }
//    yin.onclick=function(){
//    	index=4;
//    	cli();
//    	lll();
//    }
//    wen.onclick=function(){
//    	index=5;
//    	cli();
//    	lll();
//    }

// }
  $(function(){

  var currIndex=0;

  $("#Head>ul>li").click(function(){

    $("#Content>div")[currIndex].style.display="none";
    $("#Head>ul>li")[currIndex].style.color="#fff";
    var index=$(this).index();
    $("#Content>div")[index].style.display="block";
    $("#Head>ul>li")[index].style.color="skyblue";
    currIndex=index;
  });

$("#Sea").click(function(){


  var  sea1=$("#sea").val();

  if (sea1=="最新动态") {
    alert("最新动态");
  }else if(sea1=="个人简介"){
    alert("个人简介")
  }else if(sea1=="管理中心"){
    alert("管理中心");
  }else if(sea1=="我的收藏"){
    alert("我的收藏");
  }else{
    alert("未找到");
  }

})
  



  })