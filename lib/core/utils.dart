import 'dart:math';

double degreesToRadians(double degree) => degree * pi / 180;

double pmap({
  required double value,
  required double min,
  required double max,
  required double newMin,
  required double newMax,
}) {
  return newMin + (newMax - newMin) * ((value - min) / (max - min));
}

// Code from https://gist.github.com/eyecatchup/9536706
List<int> hsvToRgb(double h, double s, double v) {
    double r, g, b;
    int i;
    double f, p, q, t;
     
    h = max(0, min(360, h));
    s = max(0, min(100, s));
    v = max(0, min(100, v));
     
    s /= 100;
    v /= 100;
     
    if(s == 0) {
        r = g = b = v;
        return [
            (r * 255).round(), 
            (g * 255).round(), 
            (b * 255).round()
        ];
    }
     
    h /= 60; // sector 0 to 5
    i = h.floor();
    f = h - i; // factorial part of h
    p = v * (1 - s);
    q = v * (1 - s * f);
    t = v * (1 - s * (1 - f));
     
    switch(i) {
        case 0:
            r = v;
            g = t;
            b = p;
            break;
     
        case 1:
            r = q;
            g = v;
            b = p;
            break;
     
        case 2:
            r = p;
            g = v;
            b = t;
            break;
     
        case 3:
            r = p;
            g = q;
            b = v;
            break;
     
        case 4:
            r = t;
            g = p;
            b = v;
            break;
     
        default: // case 5:
            r = v;
            g = p;
            b = q;
    }
     
    return [
        (r * 255).round(), 
        (g * 255).round(), 
        (b * 255).round()
    ];
}
