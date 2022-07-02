function t = torque(w,g,S,cd)        
    %d  = air density
    %s  = speed in (m/s)
    % pa = profile area
    % g = gradient(%)
    % W = weight of the car
    % r = radius of tire (in m)
    %s = np.linspace(0, 33.33, 50000); %[0 kmph - 120(33.33)kmph]
    s = S;
    d = 1.184;
    % s = 18.43
    pa = 1.46;
    W = w*9.8;
    % Cd = drag coefficient  Cd = Cf + Cs + Cv
    % Cf = coeffecient of friction, Cs = pressure coeff, Cv = ventilation coeff
    % Cl = lift coefficient 
    % in solar car Cd = 0.095, Cl = 0.22 for 96kmph 
    Cd = cd*(s/20.833)**2;
    Cl = 0.22;
    % dynamic pressure-profile area product
    q = (1/2)*(d)*((s)**2)*(pa);
    % Drag force
    D = (Cd)*q;
    % Lift force
    L = (Cl)*q;

    % Gravitational pull along track
    Wx = W*((g/100)/(np.sqrt(1 + (g/100)**2)));

    % Rolling Resistive force
    u1 = 0.004;
    u2 = 0.0001;
    R = (u1*(1/(np.sqrt(1 + (g/100)**2))) + u2*s)*W;

    %Tractive Force(T) = Wx + D + R
    T = Wx + D + R;

    %Torque required
    t = T*(r);
end