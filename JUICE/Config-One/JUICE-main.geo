////////////////////////////////////////////////////////////////////////
//                                                                                                                                        //
//     JUICE-main.geo                                                                                               //
//                                                                                                                                        //
//     Include all other parts (separate geo files)                                     //
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
  T2(10, -10, 0){ "Original Author: Thomas Nilsson, (2013)." };
};
//                                                                                                                                       //
///////////////////////////////////////////////////////////////////////


Include "JUICE-SCbox.geo";
Include "JUICE-HGA.geo";
Include "JUICE-CylTank.geo";
Include "JUICE-MainThrusters.geo";
Include "JUICE-AttitudeThrusters.geo";
Include "JUICE-SolarArrays.geo";
//Include "JUICE-PWI.geo";



// When adding CylTank, MainThrusters or AttitudeThrusters
// the main s/c box is no longer proper and must be redone.

toBeRemoved[] = Boundary{Surface{scbox[0]};};
toBeRemoved1[] = Boundary{Volume{scbox[1]};};

Delete {
  Volume{ scbox[1] };
  Surface{ toBeRemoved1[] };
  Line{ toBeRemoved[] } ;
}





// The following SHOULD NOT be hard coded, but for time reasons it still is.

Line(466) = {117, 109};
Line(467) = {110, 126};
Line(468) = {125, 133};
Line(469) = {134, 118};
Plane Surface(470) = {5, 45};
Line Loop(471) = {1, 13, 107, 466, -90, -12};
Plane Surface(472) = {471};
Line Loop(473) = {2, 17, -144, 469, 110, -13};
Plane Surface(474) = {473};
Line Loop(475) = {3, 21, 124, 468, -141, -17};
Plane Surface(476) = {475};
Line Loop(477) = {4, 12, -93, 467, 127, -21};
Plane Surface(478) = {477};
Line Loop(479) = {469, -109, -108, 466, 91, 92, 467, -126, -125, 468, 142, 143};
Line Loop(480) = {50, 47, 48, 49};
Plane Surface(481) = {479, 480};
Delete {
  Surface{45};
}
Line Loop(482) = {89, 74, 79, 84};
Line Loop(483) = {53, 54, 51, 52};
Plane Surface(484) = {45, 482, 483};
