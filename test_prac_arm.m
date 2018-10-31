%% Orion5 MATLAB Sequence Example
% Provided by RAWrobotics 
% https://rawrobotics.com.au/
% info@rawroboics.com.au

%% Variables
% 2d array to hold joint angles for a sequence
% numbers are all degrees wrapped to 0-360
% [base, shoulder, elbow, wrist, claw]
h = 0.053; %in mm
r = 0.030309;
l2 = 0.170384;
l3 = 0.136307;
l4 = 0.086;
c_tool = 0.04;

x_home = 0.1;
y_home = 0.29;

% variables

%Point 1 

x_init_1 = 0.055 - x_home;
y_init_1 = -(0.42 - y_home);
z_init_1 = 0.03;

x_dest_1 = 0.183 - x_home;
y_dest_1 = -(0.097 - y_home);
z_dest_1 = 0.03;

%Point 2

x_init_2 = (0.168 - x_home);
y_init_2 = -(0.391 - y_home);
z_init_2 = 0.1;

x_dest_2 = (0.290 - x_home);
y_dest_2 = -(0.136 - y_home);
z_dest_2 = 0.03;

%Point 3 

x_init_3 = (0.298 - x_home);
y_init_3 = -(0.457 - y_home);
z_init_3 = 0.1;

x_dest_3 = (0.198 - x_home);
y_dest_3 = -(0.192 - y_home);
z_dest_3 = 0.03;


%% new angle calcs
%%Point 1 

[theta0_init_1_high,theta1_init_1_high,theta2_init_1_high,theta3_init_1_high] = Inverse_Kinematics(x_init_1,y_init_1,0.1);
arr_init_1_high = []
arr_init_1_high = [[theta0_init_1_high+3,theta1_init_1_high,theta2_init_1_high,theta3_init_1_high],330]

[theta0_init_1,theta1_init_1,theta2_init_1,theta3_init_1] = Inverse_Kinematics(x_init_1,y_init_1,z_init_1);
arr_init_1 = []
arr_init_1 = [[theta0_init_1+3,theta1_init_1,theta2_init_1,theta3_init_1],330]
arr_init_1_lift = [[theta0_init_1+3,theta1_init_1,theta2_init_1,theta3_init_1],200]
arr_init_1_high_lift = [[theta0_init_1_high+3,theta1_init_1_high,theta2_init_1_high,theta3_init_1_high],200]

arr_dest_1_high = []
[theta0_dest_1_high,theta1_dest_1_high,theta2_dest_1_high,theta3_dest_1_high] = Inverse_Kinematics(x_dest_1,y_dest_1,0.1);
arr_dest_1_high = [[theta0_dest_1_high+3,theta1_dest_1_high,theta2_dest_1_high,theta3_dest_1_high],200]


arr_dest_1 = []
[theta0_dest_1,theta1_dest_1,theta2_dest_1,theta3_dest_1] = Inverse_Kinematics(x_dest_1,y_dest_1,0.03);
arr_dest_1 = [[theta0_dest_1+3,theta1_dest_1,theta2_dest_1,theta3_dest_1],230]
arr_dest_1_leave = [[theta0_dest_1+3,theta1_dest_1,theta2_dest_1,theta3_dest_1],330]
arr_dest_1_leave_high = [[theta0_dest_1_high+3,theta1_dest_1_high,theta2_dest_1_high,theta3_dest_1_high],330]

%%Point 2
[theta0_init_2,theta1_init_2,theta2_init_2,theta3_init_2] = Inverse_Kinematics(x_init_2,y_init_2,z_init_2);
arr_init_2 = []
arr_init_2 = [[theta0_init_2+3,theta1_init_2,theta2_init_2,theta3_init_2],330]

[theta0_init_2_high,theta1_init_2_high,theta2_init_2_high,theta3_init_2_high] = Inverse_Kinematics(x_init_2,y_init_2,0.03);
arr_init_2_high = []
arr_init_2_a = [[theta0_init_2_high+3,theta1_init_2_high,theta2_init_2_high,theta3_init_2_high],330]
arr_init_2_high = [[theta0_init_2_high+3,theta1_init_2_high,theta2_init_2_high,theta3_init_2_high],200]
arr_init_2_lift = [[theta0_init_2+3,theta1_init_2,theta2_init_2,theta3_init_2],200]

arr_dest_2_high = []
[theta0_dest_2_high,theta1_dest_2_high,theta2_dest_2_high,theta3_dest_2_high] = Inverse_Kinematics(x_dest_2,y_dest_2,0.1);
arr_dest_2_high = [[theta0_dest_2_high+3,theta1_dest_2_high,theta2_dest_2_high,theta3_dest_2_high],200]

arr_dest_2 = []
[theta0_dest_2,theta1_dest_2,theta2_dest_2,theta3_dest_2] = Inverse_Kinematics(x_dest_2,y_dest_2,z_dest_2);
arr_dest_2 = [[theta0_dest_2+3,theta1_dest_2,theta2_dest_2,theta3_dest_2],200]
arr_dest_2_leave = [[theta0_dest_2+3,theta1_dest_2,theta2_dest_2,theta3_dest_2],330]
arr_dest_2_leave_high = [[theta0_dest_2_high+3,theta1_dest_2_high,theta2_dest_2_high,theta3_dest_2_high],330]

%%Point 3

[theta0_init_3,theta1_init_3,theta2_init_3,theta3_init_3] = Inverse_Kinematics(x_init_3,y_init_3,z_init_3);
arr_init_3 = []
arr_init_3 = [[theta0_init_3,theta1_init_3,theta2_init_3,theta3_init_3],330]

[theta0_init_3_high,theta1_init_3_high,theta2_init_3_high,theta3_init_3_high] = Inverse_Kinematics(x_init_3,y_init_3,0.03);
arr_init_3_high = []
arr_init_3_high = [[theta0_init_3_high+3,theta1_init_3_high,theta2_init_3_high,theta3_init_3_high],330]
arr_init_3_lift = [[theta0_init_3_high+3,theta1_init_3_high,theta2_init_3_high,theta3_init_3_high],200]
arr_init_3_lift_high = [[theta0_init_3+3,theta1_init_3,theta2_init_3,theta3_init_3],200]


arr_dest_3_high = []
[theta0_dest_3_high,theta1_dest_3_high,theta2_dest_3_high,theta3_dest_3_high] = Inverse_Kinematics(x_dest_3,y_dest_3,0.1);
arr_dest_3_high = [[theta0_dest_3_high+3,theta1_dest_3_high,theta2_dest_3_high,theta3_dest_3_high],200]

arr_dest_3 = []
[theta0_dest_3,theta1_dest_3,theta2_dest_3,theta3_dest_3] = Inverse_Kinematics(x_dest_3,y_dest_3,z_dest_3);
arr_dest_3 = [[theta0_dest_3+3,theta1_dest_3,theta2_dest_3,theta3_dest_3],200]
arr_dest_3_leave = [[theta0_dest_3+3,theta1_dest_3,theta2_dest_3,theta3_dest_3],330]
arr_dest_3_leave_high = [[theta0_dest_3_high+3,theta1_dest_3_high,theta2_dest_3_high,theta3_dest_3_high],330]

sequence = [
    arr_init_1_high; arr_init_1; arr_init_1_lift; arr_init_1_high_lift;  
    arr_dest_1_high;   arr_dest_1; arr_dest_1_leave; arr_dest_1_leave_high;
    arr_init_2; arr_init_2_a; arr_init_2_high; arr_init_2_lift;
    arr_dest_2_high; arr_dest_2; arr_dest_2_leave; arr_dest_2_leave_high; 
    arr_init_3; arr_init_3_high; arr_init_3_lift; arr_init_3_lift_high;
    arr_dest_3_high; arr_dest_3; arr_dest_3_leave; arr_dest_3_leave_high; 
];

% when the rotational distance (degrees) for all joints is less than
% this threshold, we move to the next point in the sequence.
arriveThreshold = 10;

% set this to 1 to see a 3d plot of the robot and 2d plot of toolpoint
% on the XY plane
draw_plot = 0;

%% Main Loop
% create a connection to Orion5Server.py
orion = Orion5();

% turn on torque for all the joints
orion.setAllJointsTorqueEnable([1 1 1 1 1]);

% for each element in the sequence
for i = 1:size(sequence, 1)

    % index the target point from the sequence
    target = sequence(i, :);

    while 1
        % write the target joint angles to the robot
        orion.setAllJointsPosition(target);

        % read the current joint angles from the robot
        current = orion.getAllJointsPosition();
        
        
        % display the current robot position on a 3d plot
        if draw_plot
            graphing(current);
        end

        % find the remaining rotational distance left to go for each joint
        diff = abs(target - current);

        % wrap the base angle difference to 0-180
        diff(1) = abs(wrapTo180(diff(1)));

        % if we're close enough to the target, go to next point in sequence
        if (max(diff) < arriveThreshold)
            break;
        end

        % wait a bit between itterations
        pause(0.1);
    end

    % wait briefly at each point
    pause(0.4);
end

% turn off torque for all the joints
orion.setAllJointsTorqueEnable([0 0 0 0 0]);

orion.stop();
