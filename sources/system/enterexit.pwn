/*

	About: enter/exit system
	Author: ziggi & GhostTT

*/

#if defined _enterexit_included
	#endinput
#endif

#define _enterexit_included

#if !defined ENTEREXIT_FREEZE_TIME
	#define ENTEREXIT_FREEZE_TIME 500
#endif

#define INVALID_ENTEREXIT_ID -1

forward OnInteriorCreated(id, type, world);

enum e_ee_Player_Info {
	e_pi_index,
	e_pi_enter_id,
}

static player_info[MAX_PLAYERS][e_ee_Player_Info];

// types
enum {
	ENTEREXIT_TYPE_CHICKEN,
	ENTEREXIT_TYPE_BURGER,
	ENTEREXIT_TYPE_PIZZA,
	ENTEREXIT_TYPE_RESTAURANT,
	ENTEREXIT_TYPE_DONUTS,
	ENTEREXIT_TYPE_BAR,
	ENTEREXIT_TYPE_ALHAMBRA,
	ENTEREXIT_TYPE_JIZZY,
	ENTEREXIT_TYPE_CALIGULAS,
	ENTEREXIT_TYPE_REDSANS,
	ENTEREXIT_TYPE_24ON7_3,
	ENTEREXIT_TYPE_24ON7,
	ENTEREXIT_TYPE_AMMUNATION_1,
	ENTEREXIT_TYPE_AMMUNATION_2,
	ENTEREXIT_TYPE_AMMUNATION_3,
	ENTEREXIT_TYPE_AMMUNATION_4,
	ENTEREXIT_TYPE_AMMUNATION_5,
	ENTEREXIT_TYPE_BINCO,
	ENTEREXIT_TYPE_URBAN,
	ENTEREXIT_TYPE_INSIDETRACK,
	ENTEREXIT_TYPE_PIGPEN,
	ENTEREXIT_TYPE_TRAINHARD,
	ENTEREXIT_TYPE_LSPD,
	ENTEREXIT_TYPE_ZIP,
	ENTEREXIT_TYPE_SEXSHOP,
	ENTEREXIT_TYPE_LVPD,
	ENTEREXIT_TYPE_CITYPLANNING,
	ENTEREXIT_TYPE_NUDESTRIPPERS,
	ENTEREXIT_TYPE_LSGYM,
	ENTEREXIT_TYPE_COBRA,
	ENTEREXIT_TYPE_LVGYM,
	ENTEREXIT_TYPE_VICTIM,
	ENTEREXIT_TYPE_ZERORC,
	ENTEREXIT_TYPE_FOURDRAGONS,
	ENTEREXIT_TYPE_LVAIRPORT,
	ENTEREXIT_TYPE_LSHOTEL,
	ENTEREXIT_TYPE_LVDAM,
	ENTEREXIT_TYPE_LSSTADIUM,
	ENTEREXIT_TYPE_SFSTADIUM,
	ENTEREXIT_TYPE_ARENA,
	ENTEREXIT_TYPE_LVSTADIUM,
	ENTEREXIT_TYPE_LILPROBEINN,
	ENTEREXIT_TYPE_REECES,
	ENTEREXIT_TYPE_TATOOS_1,
	ENTEREXIT_TYPE_TATOOS_2,
	ENTEREXIT_TYPE_TATOOS_3,
	ENTEREXIT_TYPE_DIDIERSACHS,
	ENTEREXIT_TYPE_BARBER_1,
	ENTEREXIT_TYPE_BARBER_2,
	ENTEREXIT_TYPE_SFPD,
	ENTEREXIT_TYPE_ARTIUM,
	ENTEREXIT_TYPE_CRACKDEN,
	ENTEREXIT_TYPE_BSCRACKPALACE,
	ENTEREXIT_TYPE_BDCRACKPALACE,
	ENTEREXIT_TYPE_BFRECORDS,
	ENTEREXIT_TYPE_WUZIMU,
}

enum e_Enterexit_Type {
	e_ee_interior,
	Float:e_ee_pos_x,
	Float:e_ee_pos_y,
	Float:e_ee_pos_z,
	Float:e_ee_pos_a,
	e_ee_pickup_id,
}

static gTypes[][e_Enterexit_Type] = {
	{9, 364.7823, -11.3572, 1001.8516, 0.0000}, // ENTEREXIT_TYPE_CHICKEN
	{10, 363.0454, -74.9226, 1001.5078, 0.0000}, // ENTEREXIT_TYPE_BURGER
	{5, 372.3875, -133.2606, 1001.4922, 0.0000}, // ENTEREXIT_TYPE_PIZZA
	{1, -794.981400, 489.284700, 1376.195300, 0.0000}, // ENTEREXIT_TYPE_RESTAURANT
	{17, 377.2882, -192.9613, 1000.6401, 360.0000}, // ENTEREXIT_TYPE_DONUTS
	{11, 501.9220, -67.5627, 998.7578, 180.0000}, // ENTEREXIT_TYPE_BAR
	{17, 493.3302, -24.3971, 1000.6797, 0.0000}, // ENTEREXIT_TYPE_ALHAMBRA
	{3, -2636.6528, 1402.4633, 906.4609, 0.0000}, // ENTEREXIT_TYPE_JIZZY
	{1, 2234.0168, 1714.3533, 1012.3828, 180.0000}, // ENTEREXIT_TYPE_CALIGULAS
	{12, 1133.0773, -15.5890, 1000.6797, 0.0000}, // ENTEREXIT_TYPE_REDSANS
	{18, -30.9797, -92.0112, 1003.5469, 0.0000}, // ENTEREXIT_TYPE_24ON7_3
	{6, -27.4186, -57.8725, 1003.5469, 0.0000}, // ENTEREXIT_TYPE_24ON7
	{1, 285.3952, -41.5178, 1001.5156, 0.0000}, // ENTEREXIT_TYPE_AMMUNATION_1
	{4, 285.7551, -86.0345, 1001.5229, 360.0000}, // ENTEREXIT_TYPE_AMMUNATION_2
	{6, 296.8983, -111.7475, 1001.5156, 0.0000}, // ENTEREXIT_TYPE_AMMUNATION_3
	{7, 315.3875, -143.2163, 999.6016, 360.0000}, // ENTEREXIT_TYPE_AMMUNATION_4
	{6, 316.4863, -170.0589, 999.5938, 0.0000}, // ENTEREXIT_TYPE_AMMUNATION_5
	{15, 207.6558, -111.2671, 1005.132, 0.0000}, // ENTEREXIT_TYPE_BINCO
	{1, 203.8098, -50.5994, 1001.8047, 0.0000}, // ENTEREXIT_TYPE_URBAN
	{3, 834.2251, 7.4040, 1004.1870, 90.0000}, // ENTEREXIT_TYPE_INSIDETRACK
	{2, 1204.8013, -13.5916, 1000.9219, 0.0000}, // ENTEREXIT_TYPE_PIGPEN
	{3, 207.0162, -140.2690, 1003.5078, 0.0000}, // ENTEREXIT_TYPE_TRAINHARD
	{6, 246.7515, 62.6663, 1003.6406, 0.0000}, // ENTEREXIT_TYPE_LSPD
	{18, 161.3583, -96.5063, 1001.8047, 0.0000}, // ENTEREXIT_TYPE_ZIP
	{3, -100.3775, -24.7286, 1000.7188, 0.0000}, // ENTEREXIT_TYPE_SEXSHOP
	{3, 238.6454, 139.0460, 1003.0234, 0.0000}, // ENTEREXIT_TYPE_LVPD
	{3, 390.3409, 173.7717, 1008.3828, 90.0000},  // ENTEREXIT_TYPE_CITYPLANNING
	{3, 1212.1140, -26.2612, 1000.9531, 180.0000}, // ENTEREXIT_TYPE_NUDESTRIPPERS
	{5, 772.3168, -5.5164, 1000.7285, 0.0000}, // ENTEREXIT_TYPE_LSGYM
	{6, 774.1264, -50.1067, 1000.5859, 0.0000}, // ENTEREXIT_TYPE_COBRA
	{7, 773.9219, -78.5094, 1000.6623, 0.0000}, // ENTEREXIT_TYPE_LVGYM
	{5, 227.0943, -8.2332, 1002.2109, 90.0000}, // ENTEREXIT_TYPE_VICTIM
	{6, -2240.6382, 128.3041, 1035.4141, 270.0000}, // ENTEREXIT_TYPE_ZERORC
	{10, 2018.7539, 1017.7650, 996.8750, 90.0000}, // ENTEREXIT_TYPE_FOURDRAGONS
	{10, 422.1958, 2536.4480, 10.0000, 90.0000}, // ENTEREXIT_TYPE_LVAIRPORT
	{15, 2214.7024, -1150.5114, 1025.7969, 270.0000}, // ENTEREXIT_TYPE_LSHOTEL
	{17, -959.6079, 1955.7019, 9.0000, 180.0000}, // ENTEREXIT_TYPE_LVDAM
	{7, -1405.987200, -261.408000, 1043.656300, 345.0000}, // ENTEREXIT_TYPE_LSSTADIUM
	{15,-1443.709800, 930.071700, 1036.481600, 0.0000}, // ENTEREXIT_TYPE_SFSTADIUM
	{14, -1464.7389, 1556.3762, 1052.5313, 180.0000}, // ENTEREXIT_TYPE_ARENA
	{4, -1437.187000, -637.602200, 1048.876500, 0.0000}, // ENTEREXIT_TYPE_LVSTADIUM
	{18, -228.9418, 1401.1884, 27.7656, 270.0000}, // ENTEREXIT_TYPE_LILPROBEINN
	{2, 411.6457, -23.1655, 1001.8047, 360.0000}, // ENTEREXIT_TYPE_REECES
	{16, -204.3662, -27.3479, 1002.2734, 0.0000}, // ENTEREXIT_TYPE_TATOOS_1
	{17, -204.4067, -9.0825, 1002.2734, 0.0000}, // ENTEREXIT_TYPE_TATOOS_2
	{3, -204.4351, -44.4028, 1002.2734, 0.0000}, // ENTEREXIT_TYPE_TATOOS_3
	{14, 204.3381, -168.7573, 1000.5234, 360.0000}, // ENTEREXIT_TYPE_DIDIERSACHS
	{12, 411.9952, -54.4468, 1001.8984, 0.0000}, // ENTEREXIT_TYPE_BARBER_1
	{3, 418.5845, -84.3686, 1001.8047, 0.0000}, // ENTEREXIT_TYPE_BARBER_2
	{10, 246.4868, 108.0577, 1003.2188, 360.0000}, // ENTEREXIT_TYPE_SFPD
	{18, 1726.9871, -1638.2372, 20.2231, 360.0000}, // ENTEREXIT_TYPE_ARTIUM
	{5, 318.6201, 1115.1184, 1083.8828, 360.0000}, // ENTEREXIT_TYPE_CRACKDEN
	{2, 2543.2546, -1304.0968, 1025.0703, 180.0000}, // ENTEREXIT_TYPE_BSCRACKPALACE
	{2, 1520.8729, -48.0255, 1002.1310, 270.0000}, // ENTEREXIT_TYPE_BDCRACKPALACE
	{3, 1038.0593, -4.1463, 1001.2845, 360.0000}, // ENTEREXIT_TYPE_BFRECORDS
	{1, -2158.6167, 642.7182, 1052.3750, 180.0000} // ENTEREXIT_TYPE_WUZIMU
};

enum e_Enterexit_Enter {
	e_ie_type,
	e_ie_icon_id,
	Float:e_ie_pos_x,
	Float:e_ie_pos_y,
	Float:e_ie_pos_z,
	Float:e_ie_pos_a,
	e_ie_pickup_id,
	e_ie_pickup_exit_id,
}

static gEnters[][e_Enterexit_Enter] = {
	{ENTEREXIT_TYPE_URBAN, 45, -2490.0488, -29.0154, 25.6172, 90.0000},
	{ENTEREXIT_TYPE_URBAN, 45, 2779.6235, 2453.8235, 11.0625, 180.0000},
	{ENTEREXIT_TYPE_URBAN, 45, 2112.9055, -1211.6233, 23.9631, 180.0000},
	{ENTEREXIT_TYPE_BINCO, 45, -2374.1487, 910.2123, 45.4326, 90.0000},
	{ENTEREXIT_TYPE_BINCO, 45, 2102.5891, 2257.3999, 11.0234, 270.0000},
	{ENTEREXIT_TYPE_BINCO, 45, 2244.4548, -1665.2813, 15.4766, 340.0000},
	{ENTEREXIT_TYPE_ZIP, 45, -1882.5308, 866.2903, 35.1719, 90.0000},
	{ENTEREXIT_TYPE_ZIP, 45, 2090.4858, 2224.3142, 11.0234, 180.0000},
	{ENTEREXIT_TYPE_VICTIM, 45, 2802.7837, 2430.5459, 11.0625, 90.0000},
	{ENTEREXIT_TYPE_TRAINHARD, 45, 2826.0435, 2407.5281, 11.0625, 180.0000},
	{ENTEREXIT_TYPE_TRAINHARD, 45, 499.5393, -1360.6158, 16.3675, 0.0000},
	{ENTEREXIT_TYPE_AMMUNATION_1, 6, -2625.9001, 208.2365, 4.8125, 0.0000},
	{ENTEREXIT_TYPE_AMMUNATION_1, 6, 1368.7693, -1279.7759, 13.5469, 90.0000},
	{ENTEREXIT_TYPE_AMMUNATION_1, 6, 2159.4817, 943.2319, 10.8203, 90.0000},
	{ENTEREXIT_TYPE_AMMUNATION_1, 6, 2333.0889, 61.5770, 26.7058, 270.0000},
	{ENTEREXIT_TYPE_AMMUNATION_2, 6, 242.8935, -178.4391, 1.5822, 90.0000},
	{ENTEREXIT_TYPE_AMMUNATION_2, 6, 2539.2190, 2083.8953, 10.8203, 90.0000},
	{ENTEREXIT_TYPE_AMMUNATION_3, 6, -2093.4211, -2464.6709, 30.6250, 270.0000},
	{ENTEREXIT_TYPE_AMMUNATION_3, 6, 776.7205, 1871.3538, 4.9063, 270.0000},
	{ENTEREXIT_TYPE_AMMUNATION_3, 6, 2400.5042, -1981.6545, 13.5469, 0.0000},
	{ENTEREXIT_TYPE_AMMUNATION_5, 6, -1508.9017, 2610.4512, 55.8359, 180.0000},
	{ENTEREXIT_TYPE_AMMUNATION_5, 6, -315.6140, 829.7777, 14.2422, 270.0000},
	{ENTEREXIT_TYPE_CALIGULAS, 25, 2196.7908, 1677.1324, 12.3672, 90.0000},
	{ENTEREXIT_TYPE_REDSANS, 25, 1658.4637, 2250.4370, 11.0701, 0.0000},
	{ENTEREXIT_TYPE_FOURDRAGONS, 44, 2019.6924, 1007.8068, 10.8203, 270.0000},
	{ENTEREXIT_TYPE_ALHAMBRA, 48, 1836.6289, -1682.4927, 13.3400, 180.0000},
	{ENTEREXIT_TYPE_JIZZY, 48, -2624.5725, 1412.6639, 7.0938, 180.0000},
	{ENTEREXIT_TYPE_PIGPEN, 48, 2421.5637, -1219.6958, 25.5323, 0.0000},
	{ENTEREXIT_TYPE_SEXSHOP, -1, 2085.1982, 2074.0313, 11.0547, 270.0000},
	{ENTEREXIT_TYPE_NUDESTRIPPERS, 48, 2543.3179, 1025.2427, 10.8203, 180.0000},
	{ENTEREXIT_TYPE_INSIDETRACK, 25, 1288.9238, 271.1603, 19.5547, 270.0000},
	{ENTEREXIT_TYPE_INSIDETRACK, 25, 1631.8184, -1172.9304, 24.0843, 0.0000},
	{ENTEREXIT_TYPE_SFPD, 30, -1605.5310, 711.1981, 13.8672, 360.0000},
	{ENTEREXIT_TYPE_LVPD, 30, 2287.0217, 2432.0430, 10.8203, 180.0000},
	{ENTEREXIT_TYPE_LSPD, 30, 1555.0339, -1675.6987, 16.1953, 90.0000},
	{ENTEREXIT_TYPE_LSPD, 30, 627.1440, -571.8030, 17.9145, 270.0000},
	{ENTEREXIT_TYPE_CITYPLANNING, 20, 2412.5461, 1123.7743, 10.8203, 270.0000},
	{ENTEREXIT_TYPE_LSGYM, 54, 2229.7710, -1721.2833, 13.5614, 140.0000},
	{ENTEREXIT_TYPE_COBRA, 54, -2270.3320, -156.0104, 35.3203, 270.0000},
	{ENTEREXIT_TYPE_LVGYM, 54, 1968.7017, 2295.6604, 16.4559, 180.0000},
	{ENTEREXIT_TYPE_24ON7_3, 36, 1833.7736, -1842.5710, 13.5781, 90.0000},
	{ENTEREXIT_TYPE_24ON7, 36, 1937.4680, 2307.2283, 10.8203, 90.0000},
	{ENTEREXIT_TYPE_24ON7, 36, 2097.5952, 2224.4607, 11.0234, 180.0000},
	{ENTEREXIT_TYPE_24ON7, 36, 2194.6233, 1991.0389, 12.2969, 90.0000},
	{ENTEREXIT_TYPE_24ON7, 36, 2247.7466, 2396.4775, 10.8203, 0.0000},
	{ENTEREXIT_TYPE_24ON7, 36, 2452.4536, 2064.8892, 10.8203, 180.0000},
	{ENTEREXIT_TYPE_24ON7, 36, -1561.9888, -2733.4324, 48.7435, 180.0000},
	{ENTEREXIT_TYPE_24ON7, 36, 648.7406, -520.0192, 16.5537, 180.0000},
	{ENTEREXIT_TYPE_24ON7, 36, 2303.0322, -16.2273, 26.4844, 90.0000},
	{ENTEREXIT_TYPE_24ON7, 36, -1272.0570, 2712.6667, 50.2663, 180.0000},
	{ENTEREXIT_TYPE_24ON7, 36, -180.2251, 1132.6233, 19.7422, 90.0000},
	{ENTEREXIT_TYPE_24ON7_3, 36, 2546.5791, 1972.1726, 10.8203, 180.0000},
	{ENTEREXIT_TYPE_24ON7_3, 36, 2884.8823, 2453.7986, 11.0690, 180.0000},
	{ENTEREXIT_TYPE_24ON7_3, 36, 1315.5208, -897.6815, 39.5781, 180.0000},
	{ENTEREXIT_TYPE_24ON7_3, 36, -553.6256, 2593.9050, 53.9348, 270.0000},
	{ENTEREXIT_TYPE_PIZZA, 29, -1721.2444, 1359.6973, 7.1853, 90.0000},
	{ENTEREXIT_TYPE_PIZZA, 29, -1808.4500, 945.7524, 24.8906, 180.0000},
	{ENTEREXIT_TYPE_PIZZA, 29, 1367.3691, 248.3987, 19.5669, 90.0000},
	{ENTEREXIT_TYPE_PIZZA, 29, 203.5036, -202.3890, 1.5781, 180.0000},
	{ENTEREXIT_TYPE_PIZZA, 29, 2083.3271, 2224.4194, 11.0234, 180.0000},
	{ENTEREXIT_TYPE_PIZZA, 29, 2105.1870, -1806.5176, 13.5547, 90.0000},
	{ENTEREXIT_TYPE_PIZZA, 29, 2332.2661, 75.0068, 26.6210, 270.0000},
	{ENTEREXIT_TYPE_PIZZA, 29, 2351.8105, 2533.3840, 10.8203, 180.0000},
	{ENTEREXIT_TYPE_PIZZA, 29, 2638.5471, 1849.8080, 11.0234, 90.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, -1213.5768, 1830.6093, 41.9297, 270.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, -2154.9976, -2460.4131, 30.8516, 180.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, -1816.5159, 618.3961, 35.1740, 180.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, -2671.4182, 258.3566, 4.6328, 0.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, 172.7902, 1176.8433, 14.7578, 90.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, 2102.1233, 2228.7795, 11.0234, 270.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, 2393.2649, 2041.7802, 10.8203, 0.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, 2397.8098, -1898.9425, 13.5469, 0.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, 2420.1047, -1508.9398, 24.0000, 270.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, 2638.0955, 1671.9607, 11.0234, 90.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, 2838.3821, 2407.4861, 11.0690, 180.0000},
	{ENTEREXIT_TYPE_CHICKEN, 14, 928.5008, -1352.9829, 13.3438, 90.0000},
	{ENTEREXIT_TYPE_BURGER, 10, -1912.2883, 828.0991, 35.2209, 270.0000},
	{ENTEREXIT_TYPE_BURGER, 10, -2336.4890, -166.7664, 35.5547, 270.0000},
	{ENTEREXIT_TYPE_BURGER, 10, -2356.2266, 1008.1021, 50.8984, 90.0000},
	{ENTEREXIT_TYPE_BURGER, 10, 1158.2136, 2072.2249, 11.0625, 270.0000},
	{ENTEREXIT_TYPE_BURGER, 10, 1199.2291, -918.5574, 43.1203, 180.0000},
	{ENTEREXIT_TYPE_BURGER, 10, 1872.6147, 2071.7510, 11.0625, 270.0000},
	{ENTEREXIT_TYPE_BURGER, 10, 2169.6868, 2795.8181, 10.8203, 270.0000},
	{ENTEREXIT_TYPE_BURGER, 10, 2366.5193, 2071.0603, 10.8203, 90.0000},
	{ENTEREXIT_TYPE_BURGER, 10, 2472.5781, 2034.1549, 11.0625, 90.0000},
	{ENTEREXIT_TYPE_BURGER, 10, 810.9251, -1616.1669, 13.5469, 270.0000},
	{ENTEREXIT_TYPE_DONUTS, 17, -144.0737, 1224.7399, 19.8992, 180.0000},
	{ENTEREXIT_TYPE_DONUTS, 17, 291.8775, -195.2209, 1.5781, 90.0000},
	{ENTEREXIT_TYPE_DONUTS, 17, 1294.3978, 236.2599, 19.5547, 90.0000},
	{ENTEREXIT_TYPE_DONUTS, 17, -857.4582, 1535.7279, 22.5870, 360.0000},
	{ENTEREXIT_TYPE_DONUTS, 17, -2103.7915, -2342.1165, 30.6172, 90.0000},
	{ENTEREXIT_TYPE_RESTAURANT, 50, 1046.1045, -1130.9662, 23.8281, 180.0000},
	{ENTEREXIT_TYPE_BAR, 49, 2309.9487, -1643.5505, 14.8270, 135.0000},
	{ENTEREXIT_TYPE_BAR, 49, 2441.1147, 2065.0554, 10.8203, 180.0000},
	{ENTEREXIT_TYPE_BAR, 49, 172.9281, -151.7839, 1.5781, 360.0000},
	{ENTEREXIT_TYPE_BAR, 49, -180.7000, 1088.6160, 19.7422, 90.0000},
	{ENTEREXIT_TYPE_LVAIRPORT, 5, 423.5569, 2536.4775, 16.1484, 270.0000},
	{ENTEREXIT_TYPE_LSHOTEL, -1, 2232.9968, -1159.7925, 25.8906, 90.0000},
	{ENTEREXIT_TYPE_LVDAM, -1, -595.1345, 2017.8734, 60.5391, 0.0000},
	{ENTEREXIT_TYPE_LSSTADIUM, 33, 2695.5405, -1704.5406, 11.8438, 30.0000},
	{ENTEREXIT_TYPE_SFSTADIUM, 33, -2110.1619, -445.7126, 38.7344, 270.000},
	{ENTEREXIT_TYPE_ARENA, 33, -2171.9771, 252.0907, 35.3382, 90.0000},
	{ENTEREXIT_TYPE_LVSTADIUM, 33, 1099.6008, 1601.5157, 12.5469, 0.0000},
	{ENTEREXIT_TYPE_LILPROBEINN, 49, -89.1717, 1378.3308, 10.4698, 270.0000},
	{ENTEREXIT_TYPE_ZERORC, 47, -2242.1392, 128.6178, 35.3203, 90.0000},
	{ENTEREXIT_TYPE_REECES, 7, 2070.9993, -1793.8484, 13.5533, 270.0000},
	{ENTEREXIT_TYPE_TATOOS_1, 39, 2069.0210, -1779.8516, 13.5594, 270.0000},
	{ENTEREXIT_TYPE_TATOOS_1, 39, 1976.6523, -2036.5653, 13.5469, 90.0000},
	{ENTEREXIT_TYPE_TATOOS_2, 39, -2490.9951, -38.8843, 25.6172, 90.0000},
	{ENTEREXIT_TYPE_TATOOS_3, 39, 2094.6965, 2122.8655, 10.8203, 180.0000},
	{ENTEREXIT_TYPE_DIDIERSACHS, 45, 454.2128, -1478.0035, 30.8147, 90.0000},
	{ENTEREXIT_TYPE_VICTIM, 45, 461.7163, -1500.8706, 31.0445, 90.0000},
	{ENTEREXIT_TYPE_BARBER_1, 7, 2724.4570, -2026.5754, 13.5547, 90.0000},
	{ENTEREXIT_TYPE_BARBER_2, 7, 824.0370, -1588.2991, 13.5435, 180.0000},
	{ENTEREXIT_TYPE_ARTIUM, -1, 1726.8910, -1636.9241, 20.2173, 0.0000},
	{ENTEREXIT_TYPE_CRACKDEN, -1, 2166.2537, -1671.5232, 15.0738, 210.0000},
	{ENTEREXIT_TYPE_BSCRACKPALACE, -1, 2521.3999, -1281.8239, 34.8516, 90.0000},
	{ENTEREXIT_TYPE_BDCRACKPALACE, -1, 2000.0543, -1114.0648, 27.1250, 180.0000},
	{ENTEREXIT_TYPE_BFRECORDS, -1, 1154.9648, -1180.9276, 32.8187, 90.0000},
	{ENTEREXIT_TYPE_WUZIMU, -1, -2156.0916, 645.4984, 52.3672, 270.0000}
};

static
	Text3D:gLabelID[ sizeof(gEnters) ][MAX_PLAYERS][2];

/*
	OnGameModeInit
*/

public OnGameModeInit()
{
	DisableInteriorEnterExits();

	new
		i,
		world,
		type;

	for (i = 0; i < sizeof(gEnters); i++) {
		// enter pos
		gEnters[i][e_ie_pickup_id] = CreateDynamicPickup(19902, 1,
			gEnters[i][e_ie_pos_x], gEnters[i][e_ie_pos_y], gEnters[i][e_ie_pos_z] - 1.0);

		if (gEnters[i][e_ie_icon_id] != -1) {
			CreateDynamicMapIcon(gEnters[i][e_ie_pos_x], gEnters[i][e_ie_pos_y], gEnters[i][e_ie_pos_z], gEnters[i][e_ie_icon_id], 0);
		}

		// exit pos
		world = Enterexit_GetVirtualWorld(i);
		type = Enterexit_GetType(i);

		gEnters[i][e_ie_pickup_exit_id] = CreateDynamicPickup(19902, 1,
			gTypes[type][e_ee_pos_x], gTypes[type][e_ee_pos_y], gTypes[type][e_ee_pos_z] - 1.0, world
		);

		// callback
		CallLocalFunction("OnInteriorCreated", "iii", i, type, world);
	}

	Log_Init("system", "Enterexit module init.");

	#if defined Enterexit_OnGameModeInit
		return Enterexit_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit Enterexit_OnGameModeInit
#if defined Enterexit_OnGameModeInit
	forward Enterexit_OnGameModeInit();
#endif

/*
	OnPlayerConnect
*/

public OnPlayerConnect(playerid)
{
	Enterexit_SetPlayerEnterID(playerid, INVALID_ENTEREXIT_ID);
	Enterexit_SetPlayerIndex(playerid, INVALID_ENTEREXIT_ID);

	#if defined Enterexit_OnPlayerConnect
		return Enterexit_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect Enterexit_OnPlayerConnect
#if defined Enterexit_OnPlayerConnect
	forward Enterexit_OnPlayerConnect(playerid);
#endif

/*
	OnPlayerDisconnect
*/

public OnPlayerDisconnect(playerid, reason)
{
	for (new id = 0; id < sizeof(gEnters); id++) {
		DestroyPlayerLabel(playerid, id);
	}

	#if defined Enterexit_OnPlayerDisconnect
		return Enterexit_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect Enterexit_OnPlayerDisconnect
#if defined Enterexit_OnPlayerDisconnect
	forward Enterexit_OnPlayerDisconnect(playerid, reason);
#endif

/*
	OnPlayerLogin
*/

public OnPlayerLogin(playerid)
{
	for (new id = 0; id < sizeof(gEnters); id++) {
		CreatePlayerLabel(playerid, id);
	}

	#if defined Enterexit_OnPlayerLogin
		return Enterexit_OnPlayerLogin(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerLogin
	#undef OnPlayerLogin
#else
	#define _ALS_OnPlayerLogin
#endif

#define OnPlayerLogin Enterexit_OnPlayerLogin
#if defined Enterexit_OnPlayerLogin
	forward Enterexit_OnPlayerLogin(playerid);
#endif

/*
	OnAccountLanguageChanged
*/

public OnAccountLanguageChanged(playerid, Lang:lang)
{
	for (new i = 0; i < sizeof(gEnters); i++) {
		UpdatePlayerLabel(playerid, i);
	}

	#if defined Entext_OnAccountLanguageChanged
		return Entext_OnAccountLanguageChanged(playerid, Lang:lang);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnAccountLanguageChanged
	#undef OnAccountLanguageChanged
#else
	#define _ALS_OnAccountLanguageChanged
#endif

#define OnAccountLanguageChanged Entext_OnAccountLanguageChanged
#if defined Entext_OnAccountLanguageChanged
	forward Entext_OnAccountLanguageChanged(playerid, Lang:lang);
#endif

/*
	OnPlayerKeyStateChange
*/

stock Enterexit_OnPlayerKeyStateChang(playerid, newkeys, oldkeys)
{
	if (!PRESSED(KEY_USING)) {
		return 0;
	}

	new
		id = Enterexit_GetPlayerEnterID(playerid);

	if (id == INVALID_ENTEREXIT_ID) {
		return 0;
	}

	new
		type = Enterexit_GetType(id),
		index = Enterexit_GetPlayerIndex(playerid);

	if (index == INVALID_ENTEREXIT_ID) {
		if (IsPlayerInRangeOfPoint(playerid, 2.0,
				gEnters[id][e_ie_pos_x], gEnters[id][e_ie_pos_y], gEnters[id][e_ie_pos_z])) {
			Enterexit_SetPlayerIndex(playerid, id);

			new world = Enterexit_GetVirtualWorld(id);

			Streamer_UpdateEx(playerid,
			                  gTypes[type][e_ee_pos_x],
			                  gTypes[type][e_ee_pos_y],
			                  gTypes[type][e_ee_pos_z],
			                  world,
			                  gTypes[type][e_ee_interior],
			                  .compensatedtime = ENTEREXIT_FREEZE_TIME);
			SetPlayerFacingAngle(playerid, gTypes[type][e_ee_pos_a]);
			SetPlayerVirtualWorld(playerid, world);
			SetPlayerInterior(playerid, gTypes[type][e_ee_interior]);
			SetCameraBehindPlayer(playerid);
			return 1;
		}
	} else {
		if (IsPlayerInRangeOfPoint(playerid, 2.0,
				gTypes[type][e_ee_pos_x], gTypes[type][e_ee_pos_y], gTypes[type][e_ee_pos_z])) {
			Enterexit_SetPlayerIndex(playerid, INVALID_ENTEREXIT_ID);

			Streamer_UpdateEx(playerid,
			                  gEnters[index][e_ie_pos_x],
			                  gEnters[index][e_ie_pos_y],
			                  gEnters[index][e_ie_pos_z],
			                  0,
			                  0,
			                  .compensatedtime = ENTEREXIT_FREEZE_TIME);
			SetPlayerFacingAngle(playerid, gEnters[index][e_ie_pos_a]);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
			SetCameraBehindPlayer(playerid);
			return 1;
		}
	}
	return 0;
}

/*
	OnPlayerPickUpDynamicPickup
*/

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	for (new i = 0; i < sizeof(gEnters); i++) {
		if (pickupid == gEnters[i][e_ie_pickup_id] || pickupid == gEnters[i][e_ie_pickup_exit_id]) {
			if (pickupid == gEnters[i][e_ie_pickup_id]) {
				Enterexit_SetPlayerIndex(playerid, INVALID_ENTEREXIT_ID);
			}

			Enterexit_SetPlayerEnterID(playerid, i);
			return 1;
		}
	}
	#if defined Enterexit_OnPlayerPickUpDP
		return Enterexit_OnPlayerPickUpDP(playerid, pickupid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerPickUpDP
	#undef OnPlayerPickUpDynamicPickup
#else
	#define _ALS_OnPlayerPickUpDP
#endif

#define OnPlayerPickUpDynamicPickup Enterexit_OnPlayerPickUpDP
#if defined Enterexit_OnPlayerPickUpDP
	forward Enterexit_OnPlayerPickUpDP(playerid, pickupid);
#endif

/*
	Functions
*/

stock Enterexit_GetPlayerIndex(playerid)
{
	return player_info[playerid][e_pi_index];
}

stock Enterexit_SetPlayerIndex(playerid, index)
{
	player_info[playerid][e_pi_index] = index;
}

stock Enterexit_GetPlayerEnterID(playerid)
{
	return player_info[playerid][e_pi_enter_id];
}

stock Enterexit_SetPlayerEnterID(playerid, id)
{
	player_info[playerid][e_pi_enter_id] = id;
}

stock Enterexit_GetVirtualWorld(id)
{
	if (0 <= id < sizeof(gEnters)) {
		return (id + 1);
	}
	return -1;
}

stock Enterexit_GetInterior(id)
{
	new type = Enterexit_GetType(id);

	if (0 <= type < sizeof(gTypes)) {
		return gTypes[type][e_ee_interior];
	}

	return -1;
}

stock Enterexit_GetType(id)
{
	if (0 <= id < sizeof(gEnters)) {
		return gEnters[id][e_ie_type];
	}

	return INVALID_ENTEREXIT_ID;
}

stock Enterexit_GetPos(id, &Float:x, &Float:y, &Float:z)
{
	if (0 <= id < sizeof(gEnters)) {
		x = gEnters[id][e_ie_pos_x];
		y = gEnters[id][e_ie_pos_y];
		z = gEnters[id][e_ie_pos_z];
		return 1;
	}
	return 0;
}

stock Enterexit_IsValidInfo(index, interior, world)
{
	if (index != INVALID_ENTEREXIT_ID && Enterexit_GetVirtualWorld(index) == world && Enterexit_GetInterior(index) == interior) {
		return 1;
	}

	return 0;
}

/*
	Private functions
*/

static stock DestroyPlayerLabel(playerid, id)
{
	for (new i = 0; i < sizeof(gLabelID[][]); i++) {
		DestroyDynamic3DTextLabel(gLabelID[id][playerid][i]);
		gLabelID[id][playerid][i] = Text3D:INVALID_3DTEXT_ID;
	}
}

static stock CreatePlayerLabel(playerid, id)
{
	new string[MAX_LANG_VALUE_STRING];

	// enter 3d text
	Lang_GetPlayerText(playerid, "ENTEREXIT_ENTER_3DTEXT", string, _, KEY_NAME);
	gLabelID[id][playerid][0] = CreateDynamic3DTextLabel(string, -1,
		gEnters[id][e_ie_pos_x], gEnters[id][e_ie_pos_y], gEnters[id][e_ie_pos_z], 20.0,
		.testlos = 1, .playerid = playerid);

	// exit 3d text
	new
		world = Enterexit_GetVirtualWorld(id),
		type = Enterexit_GetType(id);

	Lang_GetPlayerText(playerid, "ENTEREXIT_EXIT_3DTEXT", string, _, KEY_NAME);
	gLabelID[id][playerid][1] = CreateDynamic3DTextLabel(string, -1,
		gTypes[type][e_ee_pos_x], gTypes[type][e_ee_pos_y], gTypes[type][e_ee_pos_z], 20.0,
		.testlos = 1, .worldid = world, .playerid = playerid);
}

static stock UpdatePlayerLabel(playerid, id)
{
	new string[MAX_LANG_VALUE_STRING];

	Lang_GetPlayerText(playerid, "ENTEREXIT_ENTER_3DTEXT", string, _, KEY_NAME);
	UpdateDynamic3DTextLabelText(gLabelID[id][playerid][0], -1, string);

	Lang_GetPlayerText(playerid, "ENTEREXIT_EXIT_3DTEXT", string, _, KEY_NAME);
	UpdateDynamic3DTextLabelText(gLabelID[id][playerid][1], -1, string);
}
