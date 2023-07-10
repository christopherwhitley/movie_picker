import Rails from "@rails/ujs"

window.onload = function() {
  const titles = document.getElementsByClassName("film_title")
  const question_marks = document.getElementsByClassName("question_marks")
  const box_one = document.getElementById("box1")
  const box_two = document.getElementById("box2")
  const message_block = document.getElementById("message-block")
  const film_ids = document.getElementsByClassName("film_id")
  const film_link = document.getElementById("film_link")

  
  for (let i = 0; i < titles.length; i++) {
    titles[i].style.display = 'none'
  }
  for (let i = 0; i < film_ids.length; i++) {
    film_ids[i].style.display = 'none'
    film_ids[i].style.pointerEvents = 'none'
  }
  const box = document.getElementById("box")
  const spinner = document.getElementById("spin")
  box.addEventListener("transitionend", () => {
    console.log("Transition ended");
    message_block.style.display = "inline-block"
    message.style.display = "inline-block";
    startConfetti();
  });
  box.addEventListener("transitionstart", () => {
    console.log("Transition started");
    message_block.style.display = "none"
    message.style.display = "none";
  });

  spinner.addEventListener("click", function() {
    removeConfetti();
    setTimeout(() => {
      removeConfetti();
      const position = arrow.getBoundingClientRect(); 
      arrow.style.pointerEvents = "none";
      const elementsAtPoint = document.elementsFromPoint(position.x, position.y);

      if (elementsAtPoint[0].classList.contains('box1') || elementsAtPoint[0].classList.contains('box2')){
        elementsAtPoint[1].firstElementChild.style.display = 'none'
        elementsAtPoint[1].lastElementChild.style.display = 'block'
        message.innerHTML = elementsAtPoint[1].lastElementChild.textContent
        film_link.href = "/films/" + elementsAtPoint[1].firstElementChild.nextElementSibling.innerText
        film_link.style.display = "block";
      }
      else {
        elementsAtPoint[0].firstElementChild.style.display = 'none'
        elementsAtPoint[0].lastElementChild.style.display = 'block'
        message.innerHTML = elementsAtPoint[0].lastElementChild.textContent
        film_link.href = "/films/" + elementsAtPoint[0].firstElementChild.nextElementSibling.innerText
        film_link.style.display = "block";
      }
    }, 5000)
  }), true

}

window.rotateFunction = function () {
  var min = 1024;
  var max = 9999;
  var deg = Math.floor(Math.random() * (max - min)) + min;
  document.getElementById('box').style.transform = "rotate("+deg+"deg)";
  var element = document.getElementById('mainbox');
  element.classList.remove('animate');
  setTimeout(function(){
    element.classList.add('animate');
  }, 5000);
}

// Confetti config
var maxParticleCount = 150; //set max confetti count
var particleSpeed = 2; //set the particle animation speed
var startConfetti; //call to start confetti animation
var stopConfetti; //call to stop adding confetti
var toggleConfetti; //call to start or stop the confetti animation depending on whether it's already running
var removeConfetti; //call to stop the confetti animation and remove all confetti immediately

(function() {
	startConfetti = startConfettiInner;
	stopConfetti = stopConfettiInner;
	toggleConfetti = toggleConfettiInner;
	removeConfetti = removeConfettiInner;
	var colors = ["DodgerBlue", "OliveDrab", "Gold", "Pink", "SlateBlue", "LightBlue", "Violet", "PaleGreen", "SteelBlue", "SandyBrown", "Chocolate", "Crimson"]
	var streamingConfetti = false;
	var animationTimer = null;
	var particles = [];
	var waveAngle = 0;
	
	function resetParticle(particle, width, height) {
		particle.color = colors[(Math.random() * colors.length) | 0];
		particle.x = Math.random() * width;
		particle.y = Math.random() * height - height;
		particle.diameter = Math.random() * 10 + 5;
		particle.tilt = Math.random() * 10 - 10;
		particle.tiltAngleIncrement = Math.random() * 0.07 + 0.05;
		particle.tiltAngle = 0;
		return particle;
	}

	function startConfettiInner() {
		var width = window.innerWidth;
		var height = window.innerHeight;
		window.requestAnimFrame = (function() {
			return window.requestAnimationFrame ||
				window.webkitRequestAnimationFrame ||
				window.mozRequestAnimationFrame ||
				window.oRequestAnimationFrame ||
				window.msRequestAnimationFrame ||
				function (callback) {
					return window.setTimeout(callback, 16.6666667);
				};
		})();
		var canvas = document.getElementById("confetti-canvas");
		if (canvas === null) {
			canvas = document.createElement("canvas");
      canvas.setAttribute("position", "fixed")
      canvas.setAttribute("width", "100%")
      canvas.setAttribute("height", "100%")
      canvas.setAttribute("top", "0")
      canvas.setAttribute("left", "0")
			canvas.setAttribute("id", "confetti-canvas");
			canvas.setAttribute("style", "display:block;z-index:-9999999;pointer-events:none;position:fixed;width:100%;height:100%;top:0;left:0;");

			document.body.appendChild(canvas);
			canvas.width = width;
			canvas.height = height;
			window.addEventListener("resize", function() {
				canvas.width = window.innerWidth;
				canvas.height = window.innerHeight;
			}, true);
		}
		var context = canvas.getContext("2d");
		while (particles.length < maxParticleCount)
			particles.push(resetParticle({}, width, height));
		streamingConfetti = true;
		if (animationTimer === null) {
			(function runAnimation() {
				context.clearRect(0, 0, window.innerWidth, window.innerHeight);
				if (particles.length === 0)
					animationTimer = null;
				else {
					updateParticles();
					drawParticles(context);
					animationTimer = requestAnimFrame(runAnimation);
				}
			})();
		}
	}

	function stopConfettiInner() {
		streamingConfetti = false;
	}

	function removeConfettiInner() {
		stopConfetti();
		particles = [];
	}

	function toggleConfettiInner() {
		if (streamingConfetti)
			stopConfettiInner();
		else
			startConfettiInner();
	}

	function drawParticles(context) {
		var particle;
		var x;
		for (var i = 0; i < particles.length; i++) {
			particle = particles[i];
			context.beginPath();
			context.lineWidth = particle.diameter;
			context.strokeStyle = particle.color;
			x = particle.x + particle.tilt;
			context.moveTo(x + particle.diameter / 2, particle.y);
			context.lineTo(x, particle.y + particle.tilt + particle.diameter / 2);
			context.stroke();
		}
	}

	function updateParticles() {
		var width = window.innerWidth;
		var height = window.innerHeight;
		var particle;
		waveAngle += 0.01;
		for (var i = 0; i < particles.length; i++) {
			particle = particles[i];
			if (!streamingConfetti && particle.y < -15)
				particle.y = height + 100;
			else {
				particle.tiltAngle += particle.tiltAngleIncrement;
				particle.x += Math.sin(waveAngle);
				particle.y += (Math.cos(waveAngle) + particle.diameter + particleSpeed) * 0.5;
				particle.tilt = Math.sin(particle.tiltAngle) * 15;
			}
			if (particle.x > width + 20 || particle.x < -20 || particle.y > height) {
				if (streamingConfetti && particles.length <= maxParticleCount)
					resetParticle(particle, width, height);
				else {
					particles.splice(i, 1);
					i--;
				}
			}
		}
	}
})();