function [theta0, theta1, theta2, theta3] = Inverse_Kinematics(x,y,z)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    h = 0.053; %in mm
    r = 0.030309;
    l2 = 0.170384;
    l3 = 0.136307;
    l4 = 0.086;
    
    a = sqrt(x^2 + y^2) - r;
    b = (l4 + z) - h;

    c = sqrt(a^2 + b^2);
    omega = rad2deg(atan2(b,a));
    sigma = rad2deg(atan2(a,b));

    OMEGA = acosd((l2^2 + c^2 - l3^2) / (2*l2*c));
    SIGMA = acosd((c^2 + l3^2 - l2^2) / (2*c*l3));

    theta0 = rad2deg(atan2(y,x));
    theta1 = omega + OMEGA;
    theta2 = acosd((l2^2 + l3^2 - c^2) / (2*l2*l3));
    theta3 = sigma + SIGMA;
end

