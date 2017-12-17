import ("stdfaust.lib");

kick = os.osc(freq) * env
    with {
       gate = button("kick");
       fenv = en.ar(0.0001, 0.2, gate);
       freq = 20 + fenv * 100;
       env = en.ar(0.0001, 0.3, gate);
    };

snare = no.noise : fi.resonbp(freq, q, 1) * env
    with {
       gate = button("snare");
       freq = 800;
       q = 5;
       env = en.ar(0.0001, 0.2, gate);
    };

ch = no.noise : fi.resonhp(freq, q, 1) * env
    with {
       gate = button("ch");
       freq = 12000;
       q = 8;
       env = en.ar(0.0001, 0.05, gate);
    };

oh = no.noise : fi.resonhp(freq, q, 1) * env
    with {
       gate = button("oh");
       freq = 10000;
       q = 10;
       env = en.ar(0.0001, 0.2, gate);
    };

process = (kick,snare,ch,oh) :> sp.panner(0.5);
