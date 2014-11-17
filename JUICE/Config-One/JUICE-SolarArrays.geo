////////////////////////////////////////////////////////////////////////
//                                                                                                                                        //
//     JUICE-HGA.geo                                                                                                //
//                                                                                                                                        //
//     Solar Arrays, Four panels on each side in a "T" shape.             //
//     Rotation angle around attachment axis,                                         //
//     0 Rad => Pointing towards +Z.                                                               //
//                                                                                                                                        //
//     Author: Thomas Nilsson                                                                            //
//     Version: 0.1                                                                                                        //
//     Changelog:                                                                                                        //
//     Date: 2013-02-25                                                                                             //
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

cl_sa = 1;

// Size, one corner in 0.0.0 and orientated as per source 2 & 3.
// Parameters, used only when modding this file separatly
scbox_x = 2.25386;
scbox_y = 1.70143;
scbox_z = 3.12780;
// End of param. for mod. of this file only.


sa_length = 3.71;  // Length of each panel, (4 on each side of the s/c)
sa_width = 2.15; // 
sa_thickness = 0.04; // Not exactly sure, based on measurement of Source 3. (3.95 cm but large uncertainty in measurement).
sa_separation = 0.195; // Separation margin of 0.195 between each panel.
sa_angle = 0 * Pi/4; // Rotation angle, in rad.
sa_boom  = 1.56; // Separation from SC box.
sa_x = scbox_x / 2; // Attachment to SC box is halfway on the SC box
sa_z = scbox_z /2; // And halfway up the SC box.


// First panel, located closest to S/C and extending in -Y direction, pointing towards +Z
p1 = newp;
Point(p1) = {sa_x - sa_width/2,                  - sa_boom,                                sa_z - sa_thickness/2,                                cl_sa} ;
p2 = newp;
Point(p2) = {sa_x + sa_width/2,                 - sa_boom,                                sa_z - sa_thickness/2,                                cl_sa} ;
p3 = newp;
Point(p3) = {sa_x - sa_width/2,                   - sa_boom - sa_length,      sa_z - sa_thickness/2,                                cl_sa} ;
p4 = newp;
Point(p4) = {sa_x + sa_width/2,                  - sa_boom - sa_length,      sa_z - sa_thickness/2,                                cl_sa} ;
p5 = newp;
Point(p5) = {sa_x - sa_width/2,                  - sa_boom,                                sa_z + sa_thickness/2,                                cl_sa} ;
p6 = newp;
Point(p6) = {sa_x + sa_width/2,                 - sa_boom,                                sa_z + sa_thickness/2,                                cl_sa} ;
p7 = newp;
Point(p7) = {sa_x - sa_width/2,                   - sa_boom - sa_length,      sa_z + sa_thickness/2,                                cl_sa} ;
p8 = newp;
Point(p8) = {sa_x + sa_width/2,                  - sa_boom - sa_length,      sa_z + sa_thickness/2,                                cl_sa} ;

// Lines
l1 = newl;
Line(l1) = {p1,p2};
l2 = newl;
Line(l2) = {p1,p3};
l3 = newl;
Line(l3) = {p3,p4};
l4 = newl;
Line(l4) = {p4,p2};
l5 = newl;
Line(l5) = {p5,p6};
l6 = newl;
Line(l6) = {p5,p7};
l7 = newl;
Line(l7) = {p7,p8};
l8 = newl;
Line(l8) = {p8,p6};
l9 = newl;
Line(l9) = {p1,p5};
l10 = newl;
Line(l10) = {p2,p6};
l11 = newl;
Line(l11) = {p3,p7};
l12 = newl;
Line(l12) = {p4,p8};

// Surfaces
s1 = newreg;
Line Loop(s1) = {l1, -l4, -l3, -l2};
Plane Surface(s1) = {s1};
s2 = newreg;
Line Loop(s2) = {l5, -l8, -l7, -l6};
Plane Surface(s2) = {s2};
s3 = newreg;
Line Loop(s3) = {l1, l10, -l5, -l9};
Plane Surface(s3) = {s3};
s4 = newreg;
Line Loop(s4) = {l2, l11, -l6, -l9};
Plane Surface(s4) = {s4};
s5 = newreg;
Line Loop(s5) = {l3, l12, -l7, -l11};
Plane Surface(s5) = {s5};
s6 = newreg;
Line Loop(s6) = {l4, l10, -l8, -l12};
Plane Surface(s6) = {s6};

// Panel 2, just outside of the first panel
SA_2_temp[] = Translate {0, -sa_length-sa_separation, 0} {  Duplicata { Surface{s2, s4, s1, s3, s6, s5}; } };

// Panel 3, just to the side of panel 2
SA_3_temp[] = Translate {-sa_width-sa_separation, 0, 0} {  Duplicata { Surface{SA_2_temp[]}; } };

// Panel 4, just to the side of panel 2, on opposite side of panel 3.
SA_4_temp[] = Translate {+sa_width+sa_separation, 0, 0} {  Duplicata { Surface{SA_2_temp[]}; } };



// And then the positive (+Y) side of the s/c.

// Panel 5, corresponds to panel 1 but on +Y side.
SA_5_temp[] = Translate {0, scbox_y + 2*sa_boom + sa_length, 0} {  Duplicata { Surface{s2, s4, s1, s3, s6, s5}; } };

// Panel 6, just outside of panel 5
SA_6_temp[] = Translate {0, +sa_length+sa_separation, 0} {  Duplicata { Surface{SA_5_temp[]}; } };

// Panel 7, just to the side of panel 6
SA_7_temp[] = Translate {-sa_width-sa_separation, 0, 0} {  Duplicata { Surface{SA_6_temp[]}; } };

// Panel 8, just to the side of panel 6, on opposite side to panel 7.
SA_8_temp[] = Translate {+sa_width+sa_separation, 0, 0} {  Duplicata { Surface{SA_6_temp[]}; } };




// And then we rotate according to the parameter sa_angle, and prove the output surfaces as SA_Y_minus[] and SA_Y_plus[].

SA_Y_minus[] = Rotate {{0, 1, 0}, {sa_x, 0, sa_z}, sa_angle} {  Surface{s2, s4, s1, s3, s6, s5, SA_2_temp[], SA_3_temp[], SA_4_temp[]}; };

SA_Y_plus[] =  Rotate {{0, 1, 0}, {sa_x, 0, sa_z}, sa_angle} {  Surface{SA_5_temp[], SA_6_temp[], SA_7_temp[], SA_8_temp[]}; };

