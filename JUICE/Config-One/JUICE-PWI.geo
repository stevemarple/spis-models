////////////////////////////////////////////////////////////////////////
//                                                                                                                                        //
//     JUICE-PWI.geo                                                                                                 //
//                                                                                                                                        //
//     The four boom antennas for PWI                                                         //
//                                                                                                                                        //
//     Author: Thomas Nilsson                                                                            //
//     Version: 0.1                                                                                                        //
//     Changelog:                                                                                                        //
//     Date: 2013-04-06                                                                                             //
//     Sources:                                                                                                               //
//        1. JUICE yellow paper                                                                              //
//        2. JUICE image one                                                                                    //
//        3. JUICE image two                                                                                   //
//                                                                                                                                      //
//   License: CC BY-SA 3.0                                                                                    //
// https://creativecommons.org/licenses/by-sa/3.0/deed.en  //
//                                                                                                                                      //
View "comments" {
  T2(10, -25, 0){ "License: CC BY-SA 3.0" };
  T2(10, -10, 0){ "Original Author: Thomas Nilsson, (2013)" };
};
//                                                                                                                                       //
///////////////////////////////////////////////////////////////////////

Include "CreateCylinder.geo";

// Parameters, used only when modding this file separatly
scbox_x = 2.25386;
scbox_y = 1.70143;
scbox_z = 3.12780;
// End of param. for mod. of this file only.

// First cylinder

// Radius, r, in m.
r = 0.03;
// Cylinder hight, h, in m.
h = 2;
// Mesh size, in m.
cl_1 = 1;
// Origin point,
x = scbox_x + 0.05;
y = 0;
z = 0;
// Cylinder rotational axis, MUST have length != 0. But will be normalized automatically.
// Cylinder will be built from origin point and outwards along this vector direction.
v_x = 0;
v_y = -1;
v_z = -1;

Call Cylinders;




// Second cylinder

// Radius, r, in m.
r = 0.03;
// Cylinder hight, h, in m.
h = 2;
// Mesh size, in m.
cl_1 = 1;
// Origin point,
x = scbox_x + 0.05;
y = scbox_y;
z = 0;
// Cylinder rotational axis, MUST have length != 0. But will be normalized automatically.
// Cylinder will be built from origin point and outwards along this vector direction.
v_x = 0;
v_y = 1;
v_z = -1;

Call Cylinders;



// Third cylinder

// Radius, r, in m.
r = 0.03;
// Cylinder hight, h, in m.
h = 2;
// Mesh size, in m.
cl_1 = 1;
// Origin point,
x = scbox_x + 0.05;
y = scbox_y;
z = scbox_z;
// Cylinder rotational axis, MUST have length != 0. But will be normalized automatically.
// Cylinder will be built from origin point and outwards along this vector direction.
v_x = 0;
v_y = 1;
v_z = 1;

Call Cylinders;



// Fourth cylinder

// Radius, r, in m.
r = 0.03;
// Cylinder hight, h, in m.
h = 2;
// Mesh size, in m.
cl_1 = 1;
// Origin point,
x = scbox_x + 0.05;
y = 0;
z = scbox_z;
// Cylinder rotational axis, MUST have length != 0. But will be normalized automatically.
// Cylinder will be built from origin point and outwards along this vector direction.
v_x = 0;
v_y = -1;
v_z = 1;

Call Cylinders;

