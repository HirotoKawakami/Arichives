class Ball {
    constructor(value) {
      this.value = value;
      this.x = random(0, width);
      this.y = randomGaussian(height/2, height/3);
      this.vx = 1;
      this.vy = 0;
      this.size = random(20, 50);
      this.t = random(10000);
      this.color = color(random(255), random(255), random(255), random(255));
    }
  
    update() {
      let t = this.t+0.02;
  
      let x1 = this.x;
      let y1 = this.y;
      let vx1 = this.vx;
      let vy1 = this.vy;
  
      x1 += vx1;
      x1 = width <= x1 ? 0 : x1;
  
      const fSpring = -2*(y1-mouseY)/height;
      const dx = abs(mouseX-x1);
      const fMouse = (mouseIsPressed && x1 < mouseX) ? - 10*pow(dx+Number.EPSILON, -0.5) : 0;
      vy1 += fSpring + fMouse;
      vy1 *= 0.98;
      y1 += vy1 + 10*noise(t);
  
      this.x = x1;
      this.y = y1;
      this.vy = vy1;
    }
  }
  
  
  let balls = [];
  
  function setup() {
    createCanvas(windowWidth, 200);
    noStroke();
    for(let i=0; i<50; i++) {
      let ball = new Ball(1);
      balls.push(ball);
    }
  }
  
  function draw() {
    background(255, 255, 255);
    balls.forEach(ball => {
      ball.update();
      fill(ball.color);
      let bSize = ball.size;
      ellipse(ball.x, ball.y, bSize, bSize);
    });
  }