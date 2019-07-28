window.onload = function() {
	var prev = document.getElementById('prev'),
		pla = document.getElementById('play'),
		next = document.getElementById('next'),
		left = document.getElementById('left-banner'),
		durBar = document.getElementById('dur-bar'),
		curBar = document.getElementById('cur-bar'),
		hovBar = document.getElementById('hov-bar'),
		onOff = true,
		curt,
		cur,
		timer,
		index = 0;

	pla.onclick = function() {

		play();
		songbox();
		init();
		update();
	}

	function play() {
		if (onOff) {
			pla.style.backgroundPosition = "0 -65px";
			audio.play();
			curt = setInterval(progressTime, 1000);
			rotate();
			onOff = false;

		} else {
			pla.style.backgroundPosition = "0 -6px";
			onOff = true;
			audio.pause();
			clearInterval(timer);
		}
	}

	next.onclick = function() {
		// if(!onOff){clearInterval(timer)}; 
		if (index > albumSrc.length - 1) {
			index = -1
		}
		index++;
		auto();
	}
	prev.onclick = function() {
		// if(!onOff){clearInterval(timer)}; 
		if (index < 0) {
			index = albumSrc.length - 1
		}
		index--;
		auto();
	}

	function auto() {
		songbox();
		rotate();
		Img();
		son();
		play();
		update();
		audio.src = albumSrc[index];
		audio.play();
		pla.style.backgroundPosition = "0 -65px";

	}

	function rotate() {
		clearInterval(timer);
		var deg = 0;
		flag = 1;
		timer = setInterval(function() {
			left.style.transform = "rotate(" + deg + "deg)";
			deg += 2;
			if (deg > 360) {
				deg = 0;
			}
		}, 30);

	}


	//时间

	var curMinutes, curSeconds, durMinutes, durSeconds, playProgress;


	function update() {

		item = setInterval(function() {

			curMinutes = Math.floor(audio.currentTime / 60);
			curSeconds = Math.floor(audio.currentTime - curMinutes * 60);

			durMinutes = Math.floor(audio.duration / 60);
			durSeconds = Math.floor(audio.duration - durMinutes * 60);

			playProgress = (audio.currentTime / audio.duration);

			if (curMinutes < 10)
				curMinutes = '0' + curMinutes;
			if (curSeconds < 10)
				curSeconds = '0' + curSeconds;

			if (durMinutes < 10)
				durMinutes = '0' + durMinutes;
			if (durSeconds < 10)
				durSeconds = '0' + durSeconds;

			if (isNaN(curMinutes) || isNaN(curSeconds))
				$("#cur-time").html('00:00'); //当前时间
			else
				$("#cur-time").html(curMinutes + ':' + curSeconds);

			if (isNaN(durMinutes) || isNaN(durSeconds))
				$("#dur-time").html('00:00'); //歌曲总时间
			else
				$("#dur-time").html(durMinutes + ':' + durSeconds);

		}, 1000)


	}

	function progressTime() {
		cur = audio.currentTime / audio.duration;
		$('#circle')[0].style.marginLeft = ~~(cur * $('#dur-bar')[0].offsetWidth) + 'px';
		$('#cur-bar')[0].style.width = ~~(cur * $('#dur-bar')[0].offsetWidth) + 'px';
	}
	progressTime();

	var AlbumName = document.getElementById('album-name'),
		SingerName = document.getElementById('singer-name'),
		Album = document.getElementById('album');

	function songbox() {
		if (index > 0 || index < singer.length - 1) {
			Album.innerHTML = album[index];
			SingerName.innerHTML = singer[index];
			AlbumName.innerHTML = album[index];
		}
	}
	var img = document.getElementById('left-banner').getElementsByTagName('img')

	function Img() {

		for (var i = 0; i < img.length; i++) {
			img[i].className = " ";
			audio.play();
		}
		img[index].className = "show";
	}

	function son() {
		for (var i = 0; i < songList.length; i++) {
			songList[i].className = " ";
		}
		songList[index].className = "co";
	}

	var str = '';

	function init() {
		var g = songData[index].songLyrics.split('[');
		g.forEach(function(current) {
			var h = current.split(']');
			var lyrics = h[1];
			var q = h[0].split('.'); //切割时间
			var n = q[0].split(':');
			var time = n[0] * 60 + parseInt(n[1]);

			if (lyrics) {
				str += '<p id="s' + time + '">' + lyrics + '<p>';
			}

			$('.jspPane')[0].innerHTML = str;
		})
	}
	init();
}
