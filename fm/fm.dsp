import("stdfaust.lib");

freq = hslider("Frequency", 500, 1, 10000, 0.01);
ratio = hslider("Harmonicity Ratio", 1.20, 0, 5, 0.01);
index = hslider("Frequency Index", 20, 0, 32, 0.01);
modulator = os.oscsin(mfreq) * mamp
    with {
        mfreq = freq * ratio;
        mamp = mfreq * index;
    };
carrier = os.oscsin(cfreq) with { cfreq = freq + modulator; };
process = carrier;
