import("stdfaust.lib");

square = hslider("Square Freq", 500, 1, 1000, 0.01) : os.square;
sine = hslider("Sine Freq", 500, 1, 1000, 0.01) : os.oscsin;

process = (square, sine) : *;
