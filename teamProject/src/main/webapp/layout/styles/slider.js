		/*global $, console*/
		var slider = document.querySelectorAll('.items'),
		    arrows = document.querySelectorAll('.wrapper-slider .arrow-left, .wrapper-slider .arrow-right'),
		    isDown = false,
		    startX,
		    scrollLeft,
			target;
		for(var i=0; i<slider.length; i++){
			slider[i].scrollLeft = 1970;
			console.log(slider[i]);
			slider[i].onmousedown = function (e) {
			    'use strict';
			    isDown = true;
			    this.classList.add('active');
			    startX = e.pageX - this.offsetLeft;
			    scrollLeft = this.scrollLeft;
			};

			slider[i].onmouseup = function () {
			    'use strict';
			    isDown = false;
			    this.classList.remove('active');
			};

			slider[i].onmouseleave = function () {
			    'use strict';
			    isDown = false;
			    this.classList.remove('active');
			};

			slider[i].onmousemove = function (e) {
			    'use strict';
			    if (!isDown) { return; }
			    e.preventDefault();
			    var x = e.pageX - this.offsetLeft,
			        walk = x - startX;
			    this.scrollLeft = scrollLeft - walk;
			};
			
			
			arrows[i*2].onclick = function () {
			    'use strict';
			    controlsSlider(-10);
			};

			arrows[i*2+1].onclick = function () {
			    'use strict';
			    controlsSlider(10);
			};

			window.onkeydown = function (e) {
			    'use strict';
			    var key = e.keyCode;
			    if (key === 39) {
			        controlsSlider(10);
			    }
			    if (key === 37) {
			        controlsSlider(-10);
			    }
			};
		}
		function controlsSlider(num) {
		    'use strict';
		   target = $(window.event.target).parent().find(".items")
		    var smooth = setInterval(function () {
		    	target[0].scrollLeft += num;
		    }, 10);
		    setTimeout(function () {
		        clearInterval(smooth);
		    }, 210);
		}
		
