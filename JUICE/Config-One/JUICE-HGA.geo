////////////////////////////////////////////////////////////////////////
//                                                                                                                                        //
//     JUICE-HGA.geo                                                                                                //
//                                                                                                                                        //
//     High Gain Antenna, parabolic but filled internally.                  //
//     Pointing in -X direction and halfway up along sc box.           //
//                                                                                                                                        //
//     Author: Thomas Nilsson                                                                            //
//     Version: 0.1                                                                                                        //
//     Changelog:                                                                                                        //
//     Date: 2013-02-05                                                                                             //
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


// Parameters

cl_hga = 1;

// Size, one corner in 0.0.0 and orientated as per source 2 & 3.
// Parameters, used only when modding this file separatly
scbox_x = 2.25386;
scbox_y = 1.70143;
scbox_z = 3.12780;
// End of param. for mod. of this file only.


hga_x = - 0.10;  // Margin of 0.10 m for meshing.
hga_y = scbox_y / 2;
hga_z = scbox_z / 2;
hga_radius = 3.2/2;  // Source 1, 3.2 m diameter.
hga_depth = 0.5;


// Bottom point, one in each corner, created from newp.

p1 = newp;
Point(p1) = {hga_x,                              hga_y,                                hga_z,                                cl_hga} ;
p2 = newp;
Point(p2) = {hga_x - hga_depth,  hga_y,                                hga_z,                                cl_hga} ;
p3 = newp;
Point(p3) = {hga_x - hga_depth,  hga_y + hga_radius,  hga_z,                                cl_hga} ;
p4 = newp;
Point(p4) = {hga_x - hga_depth,  hga_y,                                hga_z + hga_radius,  cl_hga} ;
p5 = newp;
Point(p5) = {hga_x - hga_depth,  hga_y - hga_radius,   hga_z,                                cl_hga} ;
p6 = newp;
Point(p6) = {hga_x - hga_depth,  hga_y,                                hga_z - hga_radius,   cl_hga} ;


// HGA edge circles, created from newc.

c1 = newc;           Circle(c1) = {p3, p2, p4};
c2 = newc;           Circle(c2) = {p4, p2, p5};
c3 = newc;           Circle(c3) = {p5, p2, p6};
c4 = newc;           Circle(c4) = {p6, p2, p3};


// HGA connecting ellipse, created from newc.
c5 = newc;           Ellipse(c5) = {p1, p2, p3, p3};
c6 = newc;           Ellipse(c6) = {p1, p2, p4, p4};
c7 = newc;           Ellipse(c7) = {p1, p2, p5, p5};
c8 = newc;           Ellipse(c8) = {p1, p2, p6, p6};


// Side surfaces, created from newreg.

l1 = newreg;
Line Loop(l1) = {c1, -c6, c5};
Ruled Surface(l1) = {l1};

l2 = newreg;
Line Loop(l2) = {c6, c2, -c7};
Ruled Surface(l2) = {l2};

l3 = newreg;
Line Loop(l3) = {c7, c3, -c8};
Ruled Surface(l3) = {l3};

l4 = newreg;
Line Loop(l4) = {c8, c4, -c5};
Ruled Surface(l4) = {l4};

l5 = newreg;
Line Loop(l5) = {c1, c2, c3, c4};
Plane Surface(l5) = {l5};