

  var accountAll = [
    {'username' : '815090488','passwd' : 'zgwbgh959'},
    {'username' : '1826422941','passwd' : 'zgwbgh959'},
    {'username' : '2951346092','passwd' :'zgwbgh959'}
  ] // 存储账户json数据的数组
  function login(){ //登陆判断
    var username = document.getElementById('useName').value; // 获取username输入框内容
    var passwd = document.getElementById('passName').value; // 获取passwd输入框内容
    var account = accountAll.filter(function(e){return e.username == username})[0]; // 筛选账号返回数组，不存在则返回空数组
    if(!account){
      alert('账户不存在');
    } else {
      if(account.username == username && account.passwd == passwd){
        console.log('登陆成功');
        window.open("E:/程序/index/home.html");
      } else {
        alert('登陆失败');
      }
    }
  }
function  regi(){
    

   window.open("E:/程序/index/register.html");
  
  }


  	
  
  




