public class Dinky{

    TriOsc i => BiQuad f => Envelope e;
    0.99 => f.prad;
    1 => f.eqzs;
    .2 => f.gain;
    .004::second => e.duration;

    public void radius(float rad){
        rad => f.prad;
    }
    
    public float getRad(){
        return f.prad();
    }

    public void gain(float gain){
        gain => f.gain;
    }

    public void connect(UGen ugen){
        e => ugen;
    }
    
    public void freq(float _freq)
    {
        _freq => f.pfreq; 
    }
    
    public float getfreq(){
        return f.pfreq();
    }

    // t for trigger
    public void t(float freq){
        //1.0 => i.next;
        freq => f.pfreq;
        e.keyOn();
    }

    public void t(int note){
        t(Std.mtof(note));
    }

    // c for close
    public void c(){
        e.keyOff();
    }
}