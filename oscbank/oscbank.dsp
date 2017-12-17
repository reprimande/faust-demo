import ("stdfaust.lib");

vol = hslider("global volume", 1, 0, 1, 0.01);
freq = hslider("global frequency", 500, 0, 5000, 0.01);
n = 8;

osc_(i) = os.oscsin(f) * (1.0 / n)
     with {
          index = hslider("index %i", i * 0.1, 0, 30, 0.01);
          f = freq * index;
     };
oscbank = par(i, n, osc_(i)) :> _;
process = oscbank * vol <: _;

