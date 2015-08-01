/**
 * Vector Dot Lines (v3.5)
 * by GokPotter (2013/Feb)
 * modders v.k., Thomas.Diewald, GoToLoop
 *
 * works faster when compiled in P1.5.1!
 *
 * http://forum.processing.org/topic/gradual-movement-within-a-for-loop
 * http://forum.processing.org/topic/drawing-a-network-of-nodes-and-links
 */

import java.util.Arrays;

final static color BG = -1, FG = 0;
final static short DOT_DIST  = 50, DOT_OPAC = 60;
final static float DOT_SPEED = 3, FPS = 60, BOLD = 1;

final static short NUM_DOTS  = 5000;
final static Point[] points = new Point[NUM_DOTS];

final static String GFX = P2D;  // Use P2D or JAVA2D

int dotConnects;

void setup() {
  size(1024, 800, GFX);
  frameRate(FPS);
  noSmooth();
  strokeWeight(BOLD);
  stroke(FG, DOT_OPAC);

  for ( int i = 0; i != NUM_DOTS; 
  points[i++] = new Point(random(.5, DOT_SPEED)) );
}

void draw() {
  background(BG);

  Arrays.sort(points);

  final float maxDist = map(mouseX, 0, width, 1, DOT_DIST);
  dotConnects = 0;

  for (int i = 0; i != NUM_DOTS;) {
    final Point p = points[i++];

    p.update();
    p.drawPoint();

    nearestNeighbors(p, i, maxDist);
  }

  frame.setTitle(" Nearest neighbor"
    + " | fps "         + String.format("%5.2f", frameRate)
    + " | maxDist "     + String.format("%5.2f", maxDist)
    + " | numPoints "   + NUM_DOTS
    + " | numConnects " + dotConnects);
}

void nearestNeighbors(Point p1, int i, float maxDist) {
  final float maxDistSq = maxDist * maxDist;
  final float x = p1.x, y = p1.y;

  for (int j = i; j != NUM_DOTS;) {
    final Point p2 = points[j++];

    final float dx = p2.x - x;
    if (dx > maxDist)   return;

    final float dy = abs(p2.y - y);
    if (dy > maxDist)   continue;

    if (dx*dx + dy*dy < maxDistSq) {
      p1.drawLine(p2);
      dotConnects++;
    }
  }
}

final class Point extends PVector implements Comparable<Point> {
  final PVector dir = new PVector();
  final float spd;

  Point(float speed) {
    spd = speed;
    init();
  }

  void init() {
    final float a = random(TWO_PI);
    dir.set( spd*cos(a), spd*sin(a), 0 );
    set( (int) random(width), (int) random(height), 0 );
  }

  void update() {
    add(dir);
    if ( isOffScreen() )    init();
  }

  boolean isOffScreen() {
    return x < 0 | x >= width | y < 0 | y >= height;
  }

  void drawPoint() {
    point(x, y);
  }

  void drawLine(Point other) {
    line(x, y, other.x, other.y);
  }

  int compareTo(Point other) {
    return (int) Math.signum(x - other.x);
  }
}
