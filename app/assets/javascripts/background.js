var drops = [];
var smallDropCount = 250;
var largeDropCount = 50;
var dropCount = smallDropCount + largeDropCount;
var snowMode = true;

function Drop (c, z) {
	this.color = c;
	this.z = z;
	this.x = random(width);
	this.y = random(-windowHeight, 0) * this.z;
	this.size = map(this.z, 1, 3, 5, 10);
	this.ySpeed = map(this.z, 1, 3, 1.5, 3.5);
	
	this.xSpeed = random(0, map(this.z, 1, 3, 0.1, 0.2));
	this.xOffset = 0;
	this.maxXOffset = map(this.z, 1, 3, 1.5, 1);
	
	this.draw = function () {
		if(snowMode){
			fill(this.color);
			noStroke();
			ellipse(this.x, this.y, this.size);
		}else {
			stroke(this.color);
			strokeWeight(this.z);
			line(this.x, this.y, this.x, this.y + this.size);
		}
	}
	
	this.fall = function () {
		this.y += this.ySpeed;
		this.x += this.xSpeed;
		this.xOffset += this.xSpeed;
		if (this.y > height) {
			this.y = random(-windowHeight, 0) * this.z;
		}
		
		if( abs(this.xOffset) >= abs(this.maxXOffset) ){
			this. xSpeed *= -1;
		}
	}
}

function setup () {
	createCanvas(windowWidth, windowHeight);
	textSize(30);
	var colors = [ 
		color(135, 206, 250),
		color(240, 248, 255),
 		color(0, 191, 255),
		color(30, 144, 255)
	];
	for(var i = 0; i <= smallDropCount; i++) {
		drops.push(
			new Drop(
				colors[floor(random(0, colors.length))],
				1
			)
		);
	}
	for(var i = 0; i <= largeDropCount; i++) {
		drops.push(
			new Drop(
				colors[floor(random(0, colors.length))],
				random( 2, 3 )
			)
		);
	}
}

function draw () {
	background(255, 255, 255);
	for(var i = 0; i <= dropCount; i++) {
		var d = drops[i];
		d.fall();
		d.draw();
	}
}