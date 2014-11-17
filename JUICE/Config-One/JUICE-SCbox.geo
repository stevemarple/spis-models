////////////////////////////////////////////////////////////////////////
//                                                                                                                                        //
//     JUICE-SCbox.geo                                                                                            //
//                                                                                                                                        //
//     Main spacecraft body, shape as a rectangular box.                  //
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

cl_scbox = 1;

// Size, one corner in 0.0.0 and orientated as per source 2 & 3.
scbox_x = 2.25386;
scbox_y = 1.70143;
scbox_z = 3.12780;


// Bottom point, one in each corner, created from newp.

p1 = newp;
Point(p1) = {0,                  0,                  0,  cl_scbox} ;
p2 = newp;
Point(p2) = {scbox_x,  0,                  0,  cl_scbox} ;
p3 = newp;
Point(p3) = {0,                  scbox_y,  0,  cl_scbox} ;
p4 = newp;
Point(p4) = {scbox_x,  scbox_y,  0,  cl_scbox} ;


// Bottom lines, created from newc.

c1 = newc;           Line(c1) = {p1, p2};
c2 = newc;           Line(c2) = {p2, p4};
c3 = newc;           Line(c3) = {p4, p3};
c4 = newc;           Line(c4) = {p3, p1};


// Bottom surface, created from newreg.

l1 = newreg;
Line Loop(l1) = {c1, c2, c3, c4};
Plane Surface(l1) = {l1};


// Extrude the bottom surface and in doing so create new surfaces and an internal volume.

scbox[] = Extrude {0, 0, scbox_z} { Surface{l1};  };


// scbox[] denotes a list, which contains the ids of the new surfaces and volume created. 
//Printf("New surfaces '%g', '%g', '%g', '%g', '%g'", scbox[0], scbox[2], scbox[3], scbox[4], scbox[5]);
//Printf("New volume '%g'", scbox[1]);



