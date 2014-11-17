////////////////////////////////////////////////////////////////////////
//                                                                                                                                        //
//     JUICE-MainThrusters.geo                                                                         //
//                                                                                                                                        //
//     The support structures for the four attitude thrusters,       //
//     connected by straight lines on the + Z direction.                       //
//                                                                                                                                        //
//     Author: Thomas Nilsson                                                                            //
//     Version: 0.1                                                                                                        //
//     Changelog:                                                                                                        //
//     Date: 2013-02-23                                                                                             //
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

cl_support_thrusters = 1;

// Size, one corner in 0.0.0 and orientated as per source 2 & 3.
// Parameters, used only when modding this file separatly
scbox_x = 2.25386;
scbox_y = 1.70143;
scbox_z = 3.12780;
// End of param. for mod. of this file only.

// Sources: 2 & 3.
support_thrusters_base_x = 0.26; // Source 3
support_thrusters_base_y = 0.182;  // Source 2
support_thrusters_hight_z = 0.52; // Source 3
support_thursters_top_x = 0.217; // Source 3
support_thursters_top_y = 0.1215; // NOT SURE, source 2 is not complete in this detail, value should be less than at least 0.1215 but not sure how much less.



///////////////////////////////////////////////////////////////////////
// Support structure for thurster 1, at edge of (0, 0, sc_box_z).
///////////////////////////////////////////////////////////////////////
// At base
p1 = newp;
Point(p1) = {0,                                                           0,                                                          scbox_z,  cl_support_thrusters} ;
p2 = newp;
Point(p2) = {support_thrusters_base_x,  0,                                                          scbox_z,  cl_support_thrusters} ;
p3 = newp;
Point(p3) = {0,                                                           support_thrusters_base_y,  scbox_z,  cl_support_thrusters} ;
p4 = newp;
Point(p4) = {support_thrusters_base_x,  support_thrusters_base_y,  scbox_z,  cl_support_thrusters} ;

// At top, point 8 is towards centre
p5 = newp;
Point(p5) = {0,                                                         0,                                                                scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p6 = newp;
Point(p6) = {support_thursters_top_x,  0,                                                                scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p7 = newp;
Point(p7) = {0,                                                        support_thursters_top_y,  scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p8 = newp;
Point(p8) = {support_thursters_top_x, support_thursters_top_y,  scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;

// Connecting lines

// At base
c1 = newl;           Line(c1) = {p1,p2};
c2 = newl;           Line(c2) = {p2,p4};
c3 = newl;           Line(c3) = {p4,p3};
c4 = newl;           Line(c4) = {p3,p1};

// At top
c5 = newl;           Line(c5) = {p5,p6};
c6 = newl;           Line(c6) = {p6,p8};
c7 = newl;           Line(c7) = {p8,p7};
c8 = newl;           Line(c8) = {p7,p5};

// Base to Top
c9 = newl;            Line(c9) = {p1,p5};
c10 = newl;         Line(c10) = {p2,p6};
c11 = newl;         Line(c11) = {p3,p7};
c12 = newl;         Line(c12) = {p4,p8};


// Surfaces

// Sides
l1 = newreg;
Line Loop(l1) = {c1, c10, -c5, -c9};
Plane Surface(l1) = {l1};
l2 = newreg;
Line Loop(l2) = {c2, c12, -c6, -c10};
Plane Surface(l2) = {l2};
l3 = newreg;
Line Loop(l3) = {c3, c11, -c7, -c12};
Plane Surface(l3) = {l3};
l4 = newreg;
Line Loop(l4) = {c4, c9, -c8, -c11};
Plane Surface(l4) = {l4};

// Top
l5 = newreg;
Line Loop(l5) = {c6, c7, c8, c5};
Plane Surface(l5) = {l5};



//////////////////////////////////////////////////////////////////////////////
// Support structure for thurster 2, at edge of (scbox_x, 0, scbox_z).
//////////////////////////////////////////////////////////////////////////////
// At base
p9 = newp;
Point(p9) = {scbox_x,                                                                    0,                                                           scbox_z,  cl_support_thrusters} ;
p10 = newp;
Point(p10) = {scbox_x - support_thrusters_base_x,  0,                                                           scbox_z,  cl_support_thrusters} ;
p11 = newp;
Point(p11) = {scbox_x,                                                                 support_thrusters_base_y,  scbox_z,  cl_support_thrusters} ;
p12 = newp;
Point(p12) = {scbox_x - support_thrusters_base_x,  support_thrusters_base_y,  scbox_z,  cl_support_thrusters} ;

// At top, point 16 is towards centre.
p13 = newp;
Point(p13) = {scbox_x,                                                               0,                                                         scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p14 = newp;
Point(p14) = {scbox_x - support_thursters_top_x,  0,                                                         scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p15 = newp;
Point(p15) = {scbox_x,                                                               support_thursters_top_y,  scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p16 = newp;
Point(p16) = {scbox_x - support_thursters_top_x,  support_thursters_top_y,  scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;

// Connecting lines

// At base
c13 = newl;           Line(c13) = {p9,p10};
c14 = newl;           Line(c14) = {p10,p12};
c15 = newl;           Line(c15) = {p12,p11};
c16 = newl;           Line(c16) = {p11,p9};

// At top
c17 = newl;           Line(c17) = {p13,p14};
c18 = newl;           Line(c18) = {p14,p16};
c19 = newl;           Line(c19) = {p16,p15};
c20 = newl;           Line(c20) = {p15,p13};

// Base to Top
c21 = newl;         Line(c21) = {p9,p13};
c22 = newl;         Line(c22) = {p10,p14};
c23 = newl;         Line(c23) = {p11,p15};
c24 = newl;         Line(c24) = {p12,p16};

// Surfaces

// Sides
l6 = newreg;
Line Loop(l6) = {c13, c22, -c17, -c21};
Plane Surface(l6) = {l6};
l7 = newreg;
Line Loop(l7) = {c14, c24, -c18, -c22};
Plane Surface(l7) = {l7};
l8 = newreg;
Line Loop(l8) = {c15, c23, -c19, -c24};
Plane Surface(l8) = {l8};
l9 = newreg;
Line Loop(l9) = {c16, c21, -c20, -c23};
Plane Surface(l9) = {l9};

// Top
l10 = newreg;
Line Loop(l10) = {c18, c19, c20, c17};
Plane Surface(l10) = {l10};


//////////////////////////////////////////////////////////////////////////////
// Support structure for thurster 3, at edge of (0, scbox_y, scbox_z).
//////////////////////////////////////////////////////////////////////////////
// At base
p17 = newp;
Point(p17) = {0,                                                                scbox_y,                                                                scbox_z,  cl_support_thrusters} ;
p18 = newp;
Point(p18) = {support_thrusters_base_x,    scbox_y,                                                                scbox_z,  cl_support_thrusters} ;
p19 = newp;
Point(p19) = {0,                                                             scbox_y - support_thrusters_base_y,  scbox_z,  cl_support_thrusters} ;
p20 = newp;
Point(p20) = {support_thrusters_base_x,    scbox_y - support_thrusters_base_y,  scbox_z,  cl_support_thrusters} ;

// At top, point 24 is towards centre.
p21 = newp;
Point(p21) = {0,                                                        scbox_y,                                                                scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p22 = newp;
Point(p22) = {support_thursters_top_x,  scbox_y,                                                               scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p23 = newp;
Point(p23) = {0,                                                         scbox_y -  support_thursters_top_y,  scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p24 = newp;
Point(p24) = {support_thursters_top_x,  scbox_y - support_thursters_top_y,   scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;

// Connecting lines

// At base
c25 = newl;           Line(c25) = {p17,p18};
c26 = newl;           Line(c26) = {p18,p20};
c27 = newl;           Line(c27) = {p20,p19};
c28 = newl;           Line(c28) = {p19,p17};

// At top
c29 = newl;           Line(c29) = {p21,p22};
c30 = newl;           Line(c30) = {p22,p24};
c31 = newl;           Line(c31) = {p24,p23};
c32 = newl;           Line(c32) = {p23,p21};

// Base to Top
c33 = newl;         Line(c33) = {p17,p21};
c34 = newl;         Line(c34) = {p18,p22};
c35 = newl;         Line(c35) = {p19,p23};
c36 = newl;         Line(c36) = {p20,p24};

// Surfaces

// Sides
l11 = newreg;
Line Loop(l11) = {c25, c34, -c29, -c33};
Plane Surface(l11) = {l11};
l12 = newreg;
Line Loop(l12) = {c26, c36, -c30, -c34};
Plane Surface(l12) = {l12};
l13 = newreg;
Line Loop(l13) = {c27, c35, -c31, -c36};
Plane Surface(l13) = {l13};
l14 = newreg;
Line Loop(l14) = {c28, c33, -c32, -c35};
Plane Surface(l14) = {l14};

// Top
l15 = newreg;
Line Loop(l15) = {c30, c31, c32, c29};
Plane Surface(l15) = {l15};



//////////////////////////////////////////////////////////////////////////////
// Support structure for thurster 4, at edge of (scbox_x, scbox_y, scbox_z).
//////////////////////////////////////////////////////////////////////////////
// At base
p25 = newp;
Point(p25) = {scbox_x,                                                                 scbox_y,                                                                scbox_z,  cl_support_thrusters} ;
p26 = newp;
Point(p26) = {scbox_x - support_thrusters_base_x,  scbox_y,                                                                scbox_z,  cl_support_thrusters} ;
p27 = newp;
Point(p27) = {scbox_x,                                                                  scbox_y - support_thrusters_base_y,  scbox_z,  cl_support_thrusters} ;
p28 = newp;
Point(p28) = {scbox_x - support_thrusters_base_x,   scbox_y - support_thrusters_base_y,  scbox_z,  cl_support_thrusters} ;

// At top, point 32 is towards centre.
p29 = newp;
Point(p29) = {scbox_x,                                                              scbox_y,                                                                scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p30 = newp;
Point(p30) = {scbox_x - support_thursters_top_x,  scbox_y,                                                               scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p31 = newp;
Point(p31) = {scbox_x,                                                              scbox_y -  support_thursters_top_y,  scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;
p32 = newp;
Point(p32) = {scbox_x - support_thursters_top_x,  scbox_y - support_thursters_top_y,   scbox_z + support_thrusters_hight_z,  cl_support_thrusters} ;


// Connecting lines

// At base
c37 = newl;         Line(c37) = {p25, p26};
c38 = newl;         Line(c38) = {p26, p28};
c39 = newl;         Line(c39) = {p28, p27};
c40 = newl;         Line(c40) = {p27, p25};

// At top
c41 = newl;         Line(c41) = {p29, p30};
c42 = newl;         Line(c42) = {p30, p32};
c43 = newl;         Line(c43) = {p32, p31};
c44 = newl;         Line(c44) = {p31, p29};

// Base to Top
c45 = newl;         Line(c45) = {p25, p29};
c46 = newl;         Line(c46) = {p26, p30};
c47 = newl;         Line(c47) = {p28, p32};
c48 = newl;         Line(c48) = {p27, p31};

// Surfaces

// Sides
l16 = newreg;
Line Loop(l16) = {c37, c46, -c41, -c45};
Plane Surface(l16) = {l16};
l17 = newreg;
Line Loop(l17) = {-c38, c46, c42, -c47};
Plane Surface(l17) = {l17};
l18 = newreg;
Line Loop(l18) = {-c39, c47, c43, -c48};
Plane Surface(l18) = {l18};
l19 = newreg;
Line Loop(l19) = {c40, c45, -c44, -c48};
Plane Surface(l19) = {l19};

// Top
l20 = newreg;
Line Loop(l20) = {c42, c43, c44, c41};
Plane Surface(l20) = {l20};

// Points in the corner of the SC box is overlapping with the corner of the support structure for the attitude thrusters.
// Use of Coherence will combine points so there will only be one point in each location. (Lines and surfaces are automatically adjusted).
Coherence;
