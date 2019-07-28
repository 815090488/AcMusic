
function createCode(){
	var code=Math.floor(Math.random()*9000+1000),
	span=document.getElementById("codeSpan");
	span.innerHTML=code;
   span.value=code;
}
  function checkcode(){
  var inputcode=document.getElementById("code").value,
      span= document.getElementById("codeSpan").value;
  if (inputcode==" "||inputcode==null)
     {
      console.log("cuo")
      return false;
     }else if(inputcode!=span){
      console.log("错误");
      return false;
     }else{
      console.log("正确");
      return true;
     }
  }
function checkName(){

var  UseN=document.getElementById('UseN').value;
var  span=document.getElementById('UseNSpan');
var  reg=/^[0-9]{5,11}$/;

     if (UseN==" "||UseN==null)
      {
      	span.innerHTML="用户名不能为空";
      	span.style.color="red";
      	return false;
      }else if(reg.test(UseN))
      {
        span.style.color="skyblue";
        span.innerHTML="用户名正确";
        return true;
      }else{
      	span.innerHTML="用户名错误";
      	span.style.color="red";
      	return false;
      }
}

function checkPas(){

var  Pas=document.getElementById('Pas').value;
var  span=document.getElementById('PasSpan');
var  reg=/^[A-z0-9]{5,11}$/;

     if (Pas==" "||Pas==null)
      {
      	span.innerHTML="密码不能为空";
      	span.style.color="red";
      	return false;
      }else if(reg.test(Pas))
      {
        span.style.color="skyblue";
        span.innerHTML="密码正确";
        return true;
      }else{
      	span.innerHTML="密码输入错误";
      	span.style.color="red";
      	return false;
      }
      checkPas2();
}

function checkPas2(){
	var Pas=document.getElementById('Pas').value,
	    Pas2=document.getElementById('Pas2').value,
	    span=document.getElementById('Pas2Span');

	    if(Pas2==" "||Pas2==null){
	    	span.innerHTML="密码不能为空";
	    	span.style.color="red";
	    	return false;
	    }else if(Pas===Pas2){
	    	span.innerHTML="密码一致";
	    	span.style.color="skyblue";
	    	return true;
	    }else{
	    	span.innerHTML="前后密码不一致";
	    	span.style.color="red";
	    	return false;
	    }
}


function checkPhone(){

return	checkPack("phone",/^1[3-8]\d{9}$/);
}
function checkMail(){
return	checkPack("mail",/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$/);
}


function checkAddress(){
	var sel=document.getElementById("address").value,
	span=document.getElementById('addressSpan');
	if(sel!=0){
		span.innerHTML="成功";
		span.style.color="skyblue";
		return true;
	}else{
		span.innerHTML="失败";
		span.style.color="red";
		return false;
	}
}

function checkFav(){
	var favs=document.getElementsByName('Fav'),
	span=document.getElementById("favSpan");
	for (var i = 0; i < favs.length; i++) {
		if (favs[i].checked) {
            span.innerHTML="成功";
           span.style.color="skyblue";
           return;
		}
	}
	       span.innerHTML="失败";
           span.style.color="red";
           return false;
}

function checkAgree(){
  document.getElementById("tijiao").disabled=!document.getElementById("agree").checked;
  
}

 function checkSub(){
 	checkFav();checkAddress();checkMail();checkPhone();checkPas2();checkPas();checkName();checkcode();
   return checkFav()&&checkAddress()&&checkMail()&&checkPhone()&&checkPas2()&&checkPas()&&checkName()&&checkcode();

 }

///////////////////////////////////////////////
 function checkPack(id,reg){
 var inp=document.getElementById(id),
     span=document.getElementById(id+"Span"),
     va=inp.value,
     alt=inp.alt;
     if(va==""||va==null)
     {
     	span.innerHTML=alt+"不能为空";
     	span.style.color="red";
     	return false;
     }else if(reg.test(va)){
     	span.innerHTML=alt+"正确";
     	span.style.color="skyblue";
     	return true;
     }else{
     	span.innerHTML=alt+"不符合规则";
     	span.style.color="red";
     	return false;
     }

 }







     
