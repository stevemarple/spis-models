///////////////////////////////////////////////////////////////
//                                                                                                                      //
//  Create a generic cylinder                                                            //
//  function Call Cylinders() in  main file.                                //
//                                                                                                                     //
//  0. Include "CreateCylinder.geo" first of all.                     //
//  1. Define inputs:
//         r = 0.4; // radius in m.
//         h = 1.0; // hight in m.
//         cl_1 = 1; // mesh resolution, in m.
//         x = 0;  // Origin point, (centre of circle at cylinder end).
//         y = 0; // Same.
//         z = 0; // Same.
//         v_x = 1; // Directional vector of cylinder (must have total length !=0)
//         v_y = 0; // Same
//         v_z = 1; // Same
//  2. Call the function by, Call Cylinders;
//  3. Cylinder surfaces can be called on by using Borders(cylinderVolume(0)), as well as lines and point (use border multiple time).
//
//                                                                                                                                        //
//     Author: Thomas Nilsson                                                                            //
//     Version: 0.1                                                                                                        //
//     Changelog:                                                                                                        //
//     Date: 2013-04-06                                                                                             //
//                                                                                                                                      //
//   License: CC BY-SA 3.0                                                                                    //
// https://creativecommons.org/licenses/by-sa/3.0/deed.en  //
//                                                                                                                                      //
// View "comments" {
//  T2(10, -25, 0){ "License: CC BY-SA 3.0" };
//  T2(10, -10, 0){ "Original Author: Thomas Nilsson, (2013)." };
// };
//                                                                                                                                       //
///////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////
// Radius, r, in m.
//r = 0.5;

// Cylinder hight, h, in m.
//h = 1;

// Mesh size, in m.
//cl_1 = 1;

// Origin point,
//x = 0;
//y = 0;
//z = 0;

// Cylinder rotational axis, MUST have length != 0. But will be normalized automatically.
// Cylinder will be built from origin point and outwards along this vector direction.
//v_x = 1;
//v_y = 1;
//v_z = 1;
//////////////////////////////////


Function Cylinders

// Normalize the input given
v_length = Sqrt(Fabs(v_x)^2 + Fabs(v_y)^2+Fabs(v_z)^2 );

   If (v_length == 0)
      // ID10T error, Vector length must be non-zero otherwise it is just a circle.
      Printf("Error, Vector length must be non-zero");
   EndIf

// Normalized vector
v_x_norm = v_x / v_length;
v_y_norm = v_y / v_length;
v_z_norm = v_z / v_length;

/*
Convert to spherical coordinates...
v_x_norm = Sin(Theta) * Cos(Fi)
v_y_norm = Sin(Theta) * Sin(Fi)
v_z_norm = Cos(Theta)
*/

// Acos() - returns value [0, pi] - just as it should be.
Theta = Acos(v_z_norm);

// Asin() returns values [-pi/2, pi/2] - must be corrected for if V_Y is negative.

Fi = 0; // If Theta = 0, ie vector on +/- Z-axis no more work needed.

If (Sin(Theta)!=0)
//Printf("Theta != 0");

   If (v_y_norm >= 0)
      // Positive Y, Fi has values 0 to Pi, Acos ( ) - will do just fine.
      Fi = Acos(v_x_norm / Sin(Theta));
   EndIf
   
   If (v_y_norm < 0)
      // Negative Y, Fi has values Pi to 2*Pi, - A bit more thought needed.
      //Printf("Hello, v_y_norm < 0");

      If (v_x_norm >=0)
          // Negative Y, Positive X, Fi has values 3/2*Pi to 2*Pi.
          Fi_temp = Asin(v_y_norm / Sin(Theta));
          // Fi_temp will here have a negative value (or zero)
          Fi = 2*Pi + Fi_temp;
          //Printf("v_x > 0, Fi_temp '%g' and Fi '%g'", Fi_temp, Fi);
      EndIf
      
      If (v_x_norm < 0)
          // Negative Y, Negative X, Fi has values Pi to 3/2*Pi
         Fi_temp = Asin(v_x_norm / Sin(Theta));
         Fi = Pi - Fi_temp;
      EndIf

   EndIf

EndIf


//Printf("Theta '%g' and Fi '%g'", Theta, Fi);

///////////////////////////////
// Now lets build some circles. :-)
///////////////////////////////

// p1 centre at bottom..
p1 = newp; Point(p1) = {x, y, z, cl_1};

//p2 = newp; Point(p2) = {v_x_norm, v_y_norm, v_z_norm, cl_1};

Theta_2 = Theta + Pi/2;

p2 = newp;  Point(p2) = {x+r*Sin(Theta_2)*Cos(Fi),  y + r*Sin(Theta_2)*Sin(Fi),     z + r*Cos(Theta_2),  cl_1};
p3 = Rotate {{v_x_norm, v_y_norm, v_z_norm}, {x, y, z}, Pi/2 } { Duplicata { Point{p2}; } };
p4 = Rotate {{v_x_norm, v_y_norm, v_z_norm}, {x, y, z}, Pi } { Duplicata { Point{p2}; } };
p5 = Rotate {{v_x_norm, v_y_norm, v_z_norm}, {x, y, z}, 3*Pi/2 } { Duplicata { Point{p2}; } };


c1 = newc;  Circle(c1) = {p2, p1, p3};
c2 = newc;  Circle(c2) = {p3, p1, p4};
c3 = newc;  Circle(c3) = {p4, p1, p5};
c4 = newc;  Circle(c4) = {p5, p1, p2};

s5 = news;  Line Loop(s5) = {c1, c2, c3, c4};
Plane Surface(s5) = {s5};


// Extrude and cirlce into cylinder and we are done

Cylinder[] = Extrude {h*v_x_norm, h*v_y_norm, h*v_z_norm} { Surface{s5}; };

// Do not wish to fill the entire s/c model with useless volumes so delete them here.
Delete { Volume{ Cylinder[1] }; }


Return
