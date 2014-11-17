////////////////////////////////////////////////////////////////////////
//                                                                                                                                        //
//     JUICE-MainThrusters.geo                                                                         //
//                                                                                                                                        //
//     The two main thrusters, each as two concentric circles,       //
//     connected by straight lines on the - Z direction,                        //
//     halfway up alongside sc box.                                                                  //
//                                                                                                                                        //
//     Author: Thomas Nilsson                                                                            //
//     Version: 0.1                                                                                                        //
//     Changelog:                                                                                                        //
//     Date: 2013-02-08                                                                                             //
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

cl_thrusters = 1;

// Size, one corner in 0.0.0 and orientated as per source 2 & 3.
// Parameters, used only when modding this file separatly
scbox_x = 2.25386;
scbox_y = 1.70143;
scbox_z = 3.12780;
// End of param. for mod. of this file only.

// Source 2 & 3 used measured zoomed in on screen.
thrusters_separation = 0.31; // Each point will be moved by half the total separation from circle centre to circle centre.
thrusters_centre_x = scbox_x / 2 - thrusters_separation/2 ; // Position of the Thruster 1, at the lower X value.
thrusters_centre_y = scbox_y / 2; 
thrusters_centre_z = 0;

thrusters_radius_small = 0.075; // Radius of circle at interface with s/c.
thrusters_radius_large = 0.15; // Radius of circle at thrusters outlet.
thrusters_hight = 0.3756; // Length in Z from interface with s/c to outlet.


// Thruster 1, at lower X value.

// At interface
p1 = newp;
Point(p1) = {thrusters_centre_x,  thrusters_centre_y,  thrusters_centre_z,  cl_thrusters} ;
p2 = newp;
Point(p2) = {thrusters_centre_x - thrusters_radius_small,  thrusters_centre_y,  thrusters_centre_z,  cl_thrusters} ;
p3 = newp;
Point(p3) = {thrusters_centre_x,  thrusters_centre_y - thrusters_radius_small,  thrusters_centre_z,  cl_thrusters} ;
p4 = newp;
Point(p4) = {thrusters_centre_x + thrusters_radius_small,  thrusters_centre_y,  thrusters_centre_z,  cl_thrusters} ;
p5 = newp;
Point(p5) = {thrusters_centre_x,  thrusters_centre_y + thrusters_radius_small,  thrusters_centre_z,  cl_thrusters} ;

// At outlet
p6 = newp;
Point(p6) = {thrusters_centre_x,  thrusters_centre_y,  thrusters_centre_z - thrusters_hight,  cl_thrusters} ;
p7 = newp;
Point(p7) = {thrusters_centre_x - thrusters_radius_large,  thrusters_centre_y,  thrusters_centre_z - thrusters_hight,  cl_thrusters} ;
p8 = newp;
Point(p8) = {thrusters_centre_x,  thrusters_centre_y - thrusters_radius_large,  thrusters_centre_z - thrusters_hight,  cl_thrusters} ;
p9 = newp;
Point(p9) = {thrusters_centre_x + thrusters_radius_large,  thrusters_centre_y,  thrusters_centre_z - thrusters_hight,  cl_thrusters} ;
p10 = newp;
Point(p10) = {thrusters_centre_x,  thrusters_centre_y + thrusters_radius_large,  thrusters_centre_z - thrusters_hight,  cl_thrusters} ;


// Circles at interface
c1 = newc;           Circle(c1) = {p2, p1, p3};
c2 = newc;           Circle(c2) = {p3, p1, p4};
c3 = newc;           Circle(c3) = {p4, p1, p5};
c4 = newc;           Circle(c4) = {p5, p1, p2};

// At outlet
c5 = newc;           Circle(c5) = {p7, p6, p8};
c6 = newc;           Circle(c6) = {p8, p6, p9};
c7 = newc;           Circle(c7) = {p9, p6, p10};
c8 = newc;           Circle(c8) = {p10, p6, p7};

// Connecting lines
c9 = newc;            Line(c9) = {p2, p7};
c10 = newc;         Line(c10) = {p3, p8};
c11 = newc;         Line(c11) = {p4, p9};
c12 = newc;         Line(c12) = {p5, p10};


// Surfaces
l1 = newreg;
Line Loop(l1) = {c5, c6, c7, c8};
Plane Surface(l1) = {l1};

l2 = newreg;
Line Loop(l2) = {c1, c10, -c5, -c9};
Ruled Surface(l2) = {l2};

l3 = newreg;
Line Loop(l3) = {c2, c11, -c6, -c10};
Ruled Surface(l3) = {l3};

l4 = newreg;
Line Loop(l4) = {c3, c12, -c7, -c11};
Ruled Surface(l4) = {l4};

l5 = newreg;
Line Loop(l5) = {c4, c9, -c8, -c12};
Ruled Surface(l5) = {l5};

thruster_2[] = Translate {thrusters_separation, 0, 0} { Duplicata { Surface{l1, l2, l3, l4, l5}; } };

// thruster_2[] denotes a list, which contains the ids of the new surfaces and possible volume created. 
//Printf("New surfaces '%g'", thruster_2[0]);

