////////////////////////////////////////////////////////////////////////
//                                                                                                                                        //
//     JUICE-CylTank.geo                                                                                         //
//                                                                                                                                        //
//     The outer circles of the cylindrical central tank.                         //
//     On the + and - Z direction and halfway up along sc box.       //
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

cl_cyltank = 1;

// Size, one corner in 0.0.0 and orientated as per source 2 & 3.
// Parameters, used only when modding this file separatly
scbox_x = 2.25386;
scbox_y = 1.70143;
scbox_z = 3.12780;
// End of param. for mod. of this file only.


cyltank_x = scbox_x / 2;
cyltank_y = scbox_y / 2; 
cyltank_z = scbox_z;
cyltank_radius = 0.3;



// Bottom side, -Z.

p1 = newp;
Point(p1) = {cyltank_x,                                       cyltank_y,                                        0,  cl_cyltank} ;
p2 = newp;
Point(p2) = {cyltank_x + cyltank_radius, cyltank_y,                                        0,  cl_cyltank} ;
p3 = newp;
Point(p3) = {cyltank_x,                                       cyltank_y + cyltank_radius,  0,  cl_cyltank} ;
p4 = newp;
Point(p4) = {cyltank_x - cyltank_radius,  cyltank_y,                                        0,  cl_cyltank} ;
p5 = newp;
Point(p5) = {cyltank_x,                                       cyltank_y - cyltank_radius,   0,  cl_cyltank} ;


// HGA edge circles, created from newc.

c1 = newc;           Circle(c1) = {p2, p1, p3};
c2 = newc;           Circle(c2) = {p3, p1, p4};
c3 = newc;           Circle(c3) = {p4, p1, p5};
c4 = newc;           Circle(c4) = {p5, p1, p2};


// Surface, created from newreg.

l1 = newreg;
Line Loop(l1) = {c1, c2, c3, c4};
Plane Surface(l1) = {l1};

my_new_stuff[] = Translate {0, 0, cyltank_z} {  Duplicata { Surface{l1}; } };

// my_new_stuff[] denotes a list, which contains the ids of the new surfaces and possible volume created. 
//Printf("New surfaces '%g'", my_new_stuff[0]);


