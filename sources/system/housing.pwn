/*
	Created by asturel based on business system, thx to Peter Steenbergen
	Modified by ZiGGi
*/

#if defined _housing_included
	#endinput
#endif

#define _housing_included

enum HouseInfo {
	Houses_Name[MAX_NAME],// house name
	Houses_Cost,			// cost
	Houses_Owner[MAX_PLAYER_NAME + 1],	// owner
	Houses_Gang[MAX_GANG_NAME],  // gang
	Houses_UpKeep,			// keep up
	Houses_UpKeepLeft,		// keep up left
	Houses_Buyout,			// Buyout price
	Houses_Interior,		// Interiors
	Houses_Car,				// Car
	Houses_Lock,			// Locked home or not
	Houses_Rentabil,		// ������ ���/��
	Houses_RentName[MAX_PLAYER_NAME + 1],	// Name of Renter
	Houses_RentCost,		// ���� ������
	Houses_HealUpgrade,		// Heal Upgrade
	Houses_ArmourUpgrade,	// Armour Upgrade
	Float:Houses_PickupX,
	Float:Houses_PickupY,
	Float:Houses_PickupZ,
	Float:Houses_PickupA,
	Float:Houses_InteriorX,
	Float:Houses_InteriorY,
	Float:Houses_InteriorZ,
	Float:Houses_InteriorA,
	Houses_VirtualWorld,
}

new Houses[][HouseInfo] = {
//NAME, COST, OWNER, GANG, UpKeep, UpKeepLeft, BUYOUT, ��������, Car, Lock, Rentabil, RentName, Rent Cost, Heal upgrade, eX, eY, eZ, eA, pX, pY, pZ, pA
{"[LS]OG Loc's House", 500000, "Unknown", "Unknown", 250, 0, 0, 3, 0, 0, 0, "Unknown", 20000, 0, 0, 2486.4683, -1644.5316, 14.0772, 270.0, 516.7712, -13.8882, 1001.5653, 180.0},
{"[LS]Johnson House", 2000000, "Unknown", "Unknown", 1000, 0, 0, 3, 0, 0, 0, "Unknown", 80000, 0, 0, 2495.4055, -1691.1404, 14.7656, 270.0, 2496.0806, -1694.6168, 1014.7422, 180.0},
{"[LS]Sweet's House", 1000000, "Unknown", "Unknown", 500, 0, 0, 1, 0, 0, 0, "Unknown", 40000, 0, 0, 2523.2732, -1679.4044, 15.4970, 180.0, 2527.7043, -1679.3875, 1015.4986, 270.0},
{"[LS]Ryder's House", 1500000, "Unknown", "Unknown", 750, 0, 0, 2, 0, 0, 0, "Unknown", 60000, 0, 0, 2459.5044, -1691.6638, 13.5451, 270.0, 2464.8447, -1698.2926, 1013.5078, 90.0},
{"[LS-Elite]Madd Dogg's Mansion", 100000000, "Unknown", "Unknown", 5000, 0, 0, 5, 0, 0, 0, "Unknown", 500000, 0, 0, 1259.6390, -785.3907, 92.0313, 180.0, 1262.9496, -785.4601, 1091.9063, 270.0},
{"[LS]Denise Robinson's House", 100000, "Unknown", "Unknown", 50, 0, 0, 1, 0, 0, 0, "Unknown", 4000, 0, 0, 2402.5437, -1714.9221, 14.1328, 270.0, 244.0563, 305.0133, 999.1484, 270.0},
{"[LS]B-Dup's Apartment", 250000, "Unknown", "Unknown", 125, 0, 0, 3, 0, 0, 0, "Unknown", 10000, 0, 0, 2307.6831, -1785.7546, 13.5568, 0.0, 1531.4602, -7.7385, 1002.0971, 180.0},
{"[LS]Willowfield", 75000, "Unknown", "Unknown", 30, 0, 0, 1, 0, 0, 0, "Unknown", 2500, 0, 0, 2483.4863, -1995.3424, 13.8343, 270.0, 223.2000, 1287.7971, 1082.1406, 270.0},
{"[LS]Willowfield 1", 75000, "Unknown", "Unknown", 30, 0, 0, 2, 0, 0, 0, "Unknown", 2500, 0, 0, 2652.8611, -1989.4240, 13.9988, 270.0, 226.2620, 1240.0337, 1082.1406, 180.0},
{"[LS]Ganton", 50000, "Unknown", "Unknown", 25, 0, 0, 4, 0, 0, 0, "Unknown", 2000, 0, 0, 2326.8813, -1681.9672, 14.9297, 0.0, 221.9712, 1141.4229, 1082.6094, 0.0},
{"[LS]Ganton 1", 50000, "Unknown", "Unknown", 25, 0, 0, 2, 0, 0, 0, "Unknown", 2000, 0, 0, 2393.1965, -1646.0345, 13.9051, 270.0, 226.2620, 1240.0337, 1082.1406, 180.0},
{"[LV]Caligula Mansion", 850000, "Unknown", "Unknown", 500, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 300.2951, -1154.5029, 81.3909, 0.0, 289.9850, 307.3130, 999.1484, 0.0},
{"[LS]Jefferson", 30000, "Unknown", "Unknown", 50, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 2108.2073, -1280.1827, 25.6875, 0.0, 2535.0583, -1674.4338, 1015.4986, 0.0},
{"[LS]Mulholland", 190000, "Unknown", "Unknown", 250, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 1325.8687, -633.3270, 109.1349, 0.0, 272.0126, 306.4208, 999.1484, 0.0},
{"[LS]Verona Beach", 40000, "Unknown", "Unknown", 80, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 890.5464, -1638.7795, 14.9616, 0.0, 235.1457, 1190.7142, 1080.2578, 0.0},
{"[LS]Santa Maria Beach", 70000, "Unknown", "Unknown", 100, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 312.6361, -1772.2003, 4.6282, 0.0, 221.4334, 1240.8158, 1082.1406, 0.0},
{"[LS]Palomino Creek", 390000, "Unknown", "Unknown", 500, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 2238.4756, 166.0871, 28.1535, 0.0, 239.2819, 1114.1991, 1080.9922, 0.0},
{"[LS]Blueberry", 30000, "Unknown", "Unknown", 50, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 206.6301, -109.8167, 4.8965, 0.0, 295.3137, 1478.6494, 1080.2578, 0.0},
{"[LS]Dillimore", 70000, "Unknown", "Unknown", 150, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 791.9865, -507.5847, 18.0129, 0.0, 328.9125, 1482.2545, 1084.4375, 0.0},
{"[SF]Angel Pine", 80000, "Unknown", "Unknown", 50, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, -2080.1499, -2312.3855, 30.6250, 0.0, 384.0571, 1471.7700, 1080.1875, 0.0},
{"[SF]Whetstone", 200000, "Unknown", "Unknown", 300, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, -1442.8309, -1541.9430, 101.7578, 0.0, 374.5086, 1417.2700, 1081.3281, 0.0},
{"[SF]Hashbury", 90000, "Unknown", "Unknown", 100, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, -2456.8408, -131.7211, 26.0440, 0.0, 306.1966, 307.8190, 1003.3047, 0.0},
{"[SF]Queens", 150000, "Unknown", "Unknown", 120, 0, 0, 10, 0, 0, 0, "Unknown", 50000, 0, 0, -2421.6580, 335.3531, 35.7626, 0.0, 20.7300, 1341.7350, 1084.3750, 0.0},
{"[SF]Chinatown", 120000, "Unknown", "Unknown", 50, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, -2210.9714, 723.4057, 49.4141, 0.0, 221.6921, 1149.8457, 1082.6094, 0.0},
{"[SF]Paradiso", 120000, "Unknown", "Unknown", 50, 0, 0, 12, 0, 0, 0, "Unknown", 50000, 0, 0, -2703.1348, 818.3945, 49.9844, 0.0, 2324.6213, -1143.9209, 1050.4922, 0.0},
{"[SF]Calton Heights", 200000, "Unknown", "Unknown", 300, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, -2103.9272, 900.6589, 76.7109, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[LV]El Quebradas", 120000, "Unknown", "Unknown", 50, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, -1534.4202, 2649.6294, 55.8359, 0.0, 289.9850, 307.3130, 999.1484, 0.0},
{"[LV]Tierra Robada", 120000, "Unknown", "Unknown", 50, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, -1045.4006, 1552.8932, 33.3112, 0.0, 319.4555, 312.5038, 999.1484, 0.0},
{"[LV]Fort Carson", 130000, "Unknown", "Unknown", 100, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, -364.1446, 1168.8844, 19.7422, 0.0, 2451.1558, -1685.9690, 1013.5078, 0.0},
{"[LV]Whitewood Estates", 130000, "Unknown", "Unknown", 100, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 926.3783, 2010.8345, 11.4609, 0.0, 2535.0583, -1674.4338, 1015.4986, 0.0},
{"[LV]Prickle Pine", 250000, "Unknown", "Unknown", 200, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 1282.0720, 2525.0994, 10.8203, 0.0, 272.0126, 306.4208, 999.1484, 0.0},
{"[LV]Redsands West", 230000, "Unknown", "Unknown", 100, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 1405.6171, 1900.5596, 11.4609, 0.0, 235.1457, 1190.7142, 1080.2578, 0.0},
{"[LV]Pirates In Mens Pants", 46000, "Unknown", "Unknown", 20, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 1969.4005, 1623.1444, 12.8625, 0.0, 221.4334, 1240.8158, 1082.1406, 0.0},
{"[LV]The Camels Toe", 46000, "Unknown", "Unknown", 20, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 2233.6375, 1288.4495, 10.8203, 0.0, 239.2819, 1114.1991, 1080.9922, 0.0},
{"[LV]Rockshore West", 120000, "Unknown", "Unknown", 100, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2446.2251, 695.2101, 11.4609, 0.0, 295.3137, 1478.6494, 1080.2578, 0.0},
{"[LV]The Clowns Pocket", 99000, "Unknown", "Unknown", 20, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2223.1616, 1840.9108, 10.8203, 0.0, 328.9125, 1482.2545, 1084.4375, 0.0},
{"[LV]Old Venturas Strip", 46000, "Unknown", "Unknown", 30, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2371.1787, 2169.1052, 10.8257, 0.0, 384.0571, 1471.7700, 1080.1875, 0.0},
{"[LV]Creek", 110000, "Unknown", "Unknown", 50, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2820.9004, 2140.8269, 14.6615, 0.0, 374.5086, 1417.2700, 1081.3281, 0.0},
{"[LS]st.Verona Beach 3", 40000, "Unknown", "Unknown", 180, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 1983.229, -1716.938, 15.963, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[LS]st.Santa Maria Beach 18", 70000, "Unknown", "Unknown", 110, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 1853.9366, -1915.4379, 15.2568, 0.0, 289.9850, 307.3130, 999.1484, 0.0},
{"[LS]st.Palomino Creek 54", 390000, "Unknown", "Unknown", 150, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 1895.3165, -2068.3806, 15.6689, 0.0, 319.4555, 312.5038, 999.1484, 0.0},
{"[LS]st.Blueberry 33", 30000, "Unknown", "Unknown", 150, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 1734.9346, -2129.9155, 14.0210, 0.0, 2451.1558, -1685.9690, 1013.5078, 0.0},
{"[LS]st.Dillimore 8", 70000, "Unknown", "Unknown", 150, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 1684.8767, -2099.2375, 13.8343, 0.0, 2535.0583, -1674.4338, 1015.4986, 0.0},
{"[LS]st.Whetstone 32", 200000, "Unknown", "Unknown", 200, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 2691.140, -2017.328, 13.528, 0.0, 235.1457, 1190.7142, 1080.2578, 0.0},
{"[LS]st.Hashbury 83", 90000, "Unknown", "Unknown", 100, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 2630.277, -1071.674, 69.613, 0.0, 221.4334, 1240.8158, 1082.1406, 0.0},
{"[LS]st.Doherty 14", 50000, "Unknown", "Unknown", 150, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 2629.399, -1117.942, 67.477, 0.0, 221.4334, 1240.8158, 1082.1406, 0.0},
{"[LS]st.Queens 17", 150000, "Unknown", "Unknown", 120, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 2539.907, -1061.115, 69.462, 0.0, 239.2819, 1114.1991, 1080.9922, 0.0},
{"[LS]st.Chinatown 21", 120000, "Unknown", "Unknown", 150, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2554.512, -958.501, 82.671, 0.0, 295.3137, 1478.6494, 1080.2578, 0.0},
{"[LS]st.Paradiso 52", 120000, "Unknown", "Unknown", 150, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2444.380, -965.150, 80.034, 0.0, 328.9125, 1482.2545, 1084.4375, 0.0},
{"[LS]st.Calton Heights 37", 200000, "Unknown", "Unknown", 130, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 1107.973, -974.878, 42.760, 0.0, 384.0571, 1471.7700, 1080.1875, 0.0},
{"[LS]st.El Quebradas 78", 120000, "Unknown", "Unknown", 150, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 940.709, -846.031, 93.749, 0.0, 374.5086, 1417.2700, 1081.3281, 0.0},
{"[LS]st.Tierra Robada 46", 120000, "Unknown", "Unknown", 150, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, 697.757, -1058.628, 48.608, 0.0, 306.1966, 307.8190, 1003.3047, 0.0},
{"[LS]st.Fort Carson 58", 130000, "Unknown", "Unknown", 100, 0, 0, 9, 0, 0, 0, "Unknown", 50000, 0, 0, 527.331, -1177.296, 58.804, 0.0, 260.9170, 1242.6680, 1084.2578, 0.0},
{"[LS]st.Whitewood Estates 23", 130000, "Unknown", "Unknown", 100, 0, 0, 10, 0, 0, 0, "Unknown", 50000, 0, 0, 817.150, -766.772, 76.931, 0.0, 20.7300, 1341.7350, 1084.3750, 0.0},
{"[LS]st.Prickle Pine 53", 250000, "Unknown", "Unknown", 200, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, 1421.289, -884.693, 49.824, 0.0, 221.6921, 1149.8457, 1082.6094, 0.0},
{"[LS]st.Redsands West 36", 230000, "Unknown", "Unknown", 100, 0, 0, 12, 0, 0, 0, "Unknown", 50000, 0, 0, 1326.435, -1092.259, 27.971, 0.0, 2324.6213, -1143.9209, 1050.4922, 0.0},
{"[LS]st.Pirates In Mens Pants 63", 46000, "Unknown", "Unknown", 120, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 1242.796, -1098.000, 27.978, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[LS]st.The Camels Toe 53", 46000, "Unknown", "Unknown", 120, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 1183.146, -1076.684, 30.866, 0.0, 289.9850, 307.3130, 999.1484, 0.0},
{"[LS]st.Rockshore West 23", 120000, "Unknown", "Unknown", 100, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 969.566, -1542.730, 13.588, 0.0, 319.4555, 312.5038, 999.1484, 0.0},
{"[LS]st.The Clowns Pocket 101", 99000, "Unknown", "Unknown", 120, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 768.810, -1746.158, 13.072, 0.0, 2451.1558, -1685.9690, 1013.5078, 0.0},
{"[LS]st.Old Venturas Strip 37", 46000, "Unknown", "Unknown", 130, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 650.999, -1623.480, 14.994, 0.0, 2535.0583, -1674.4338, 1015.4986, 0.0},
{"[LS-Elite]st.Twisty 1", 1500000, "Unknown", "Unknown", 700, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 1503.053, -691.452, 94.744, 0.0, 272.0126, 306.4208, 999.1484, 0.0},
{"[LS-Elite]st.Twisty 4", 3900000, "Unknown", "Unknown", 750, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 1473.440, -901.453, 54.226, 0.0, 235.1457, 1190.7142, 1080.2578, 0.0},
{"[LS-Elite]st.Twisty 9", 1000000, "Unknown", "Unknown", 700, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 1093.638, -804.572, 107.413, 0.0, 239.2819, 1114.1991, 1080.9922, 0.0},
{"[LS-Elite]st.Twisty 17", 1400000, "Unknown", "Unknown", 700, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 1051.354, -638.648, 120.112, 0.0, 295.3137, 1478.6494, 1080.2578, 0.0},
{"[LS-Elite]st.Twisty 27", 2400000, "Unknown", "Unknown", 700, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 1094.8314, -646.9269, 113.6484, 0.0, 295.3137, 1478.6494, 1080.2578, 0.0},
{"[LS-Elite]st.Twisty 21", 2000000, "Unknown", "Unknown", 590, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 986.791, -671.282, 121.171, 0.0, 328.9125, 1482.2545, 1084.4375, 0.0},
{"[LS-Elite]st.Twisty 44", 3000000, "Unknown", "Unknown", 650, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 874.889, -695.124, 113.337, 0.0, 384.0571, 1471.7700, 1080.1875, 0.0},
{"[LS-Elite]st.Twisty 32", 1500000, "Unknown", "Unknown", 700, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, 252.211, -1227.374, 74.602, 0.0, 306.1966, 307.8190, 1003.3047, 0.0},
{"[LS-Elite]st.Twisty 28", 1200000, "Unknown", "Unknown", 700, 0, 0, 9, 0, 0, 0, "Unknown", 50000, 0, 0, 220.443, -1251.679, 78.309, 0.0, 260.9170, 1242.6680, 1084.2578, 0.0},
{"[LS-Elite]st.Twisty 19", 1200000, "Unknown", "Unknown", 700, 0, 0, 10, 0, 0, 0, "Unknown", 50000, 0, 0, 693.871, -1706.249, 3.814, 0.0, 20.7300, 1341.7350, 1084.3750, 0.0},
{"[LS-Elite]st.Twisty 67", 2000000, "Unknown", "Unknown", 700, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, 166.367, -1317.702, 70.346, 0.0, 221.6921, 1149.8457, 1082.6094, 0.0},
{"[SF]st.Blutter 64", 300000, "Unknown", "Unknown", 150, 0, 0, 12, 0, 0, 0, "Unknown", 50000, 0, 0, -2027.734, -42.028, 38.5, 0.0, 2324.6213, -1143.9209, 1050.4922, 0.0},
{"[SF]st.Blutter 34", 70000, "Unknown", "Unknown", 150, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, -2016.835, 766.215, 45.440, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[SF]st.Blutter 77", 800000, "Unknown", "Unknown", 150, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, -2528.760, -143.549, 20.030, 0.0, 289.9850, 307.3130, 999.1484, 0.0},
{"[SF]st.Ultrion 34", 160000, "Unknown", "Unknown", 300, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, -2580.921, -119.258, 6.173, 0.0, 319.4555, 312.5038, 999.1484, 0.0},
{"[SF]st.Festyval 47", 180000, "Unknown", "Unknown", 100, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, -2620.736, -185.525, 7.198, 0.0, 2451.1558, -1685.9690, 1013.5078, 0.0},
{"[SF]st.Festyval 92", 212000, "Unknown", "Unknown", 150, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, -2623.224, -99.661, 7.198, 0.0, 2535.0583, -1674.4338, 1015.4986, 0.0},
{"[SF]st.Tini 6", 150000, "Unknown", "Unknown", 120, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, -2720.792, -124.644, 5.130, 0.0, 272.0126, 306.4208, 999.1484, 0.0},
{"[SF]st.Jaina 43", 120000, "Unknown", "Unknown", 150, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, -2684.688, -182.026, 7.198, 0.0, 235.1457, 1190.7142, 1080.2578, 0.0},
{"[SF]st.Toreso 52", 120000, "Unknown", "Unknown", 150, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, -2783.329, -99.717, 10.049, 0.0, 221.4334, 1240.8158, 1082.1406, 0.0},
{"[SF]st.MiniLit 37", 200000, "Unknown", "Unknown", 130, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, -2779.904, -185.424, 10.057, 0.0, 239.2819, 1114.1991, 1080.9922, 0.0},
{"[SF]st.Simfony 72", 120000, "Unknown", "Unknown", 150, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, -2780.863, 73.764, 7.174, 0.0, 295.3137, 1478.6494, 1080.2578, 0.0},
{"[SF]st.Tierra 36", 120000, "Unknown", "Unknown", 150, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, -2783.453, 189.806, 10.049, 0.0, 328.9125, 1482.2545, 1084.4375, 0.0},
{"[SF]st.Frutty 32", 130000, "Unknown", "Unknown", 100, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, -2373.403, 627.190, 33.421, 0.0, 384.0571, 1471.7700, 1080.1875, 0.0},
{"[SF]st.RussianHouse 12", 130000, "Unknown", "Unknown", 100, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, -2371.354, 705.971, 35.165, 0.0, 374.5086, 1417.2700, 1081.3281, 0.0},
{"[SF]st.RussianHouse 23", 250000, "Unknown", "Unknown", 200, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, -2446.600, 817.687, 35.974, 0.0, 306.1966, 307.8190, 1003.3047, 0.0},
{"[SF]st.Gimory 36", 230000, "Unknown", "Unknown", 100, 0, 0, 9, 0, 0, 0, "Unknown", 50000, 0, 0, -2374.975, 856.082, 41.605, 0.0, 260.9170, 1242.6680, 1084.2578, 0.0},
{"[SF]st.RussianHouse 53", 460200, "Unknown", "Unknown", 120, 0, 0, 10, 0, 0, 0, "Unknown", 50000, 0, 0, -2236.224, 870.549, 66.639, 0.0, 20.7300, 1341.7350, 1084.3750, 0.0},
{"[SF]st.The CameSF Toe 63", 400000, "Unknown", "Unknown", 120, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, -2174.076, 797.035, 61.645, 0.0, 221.6921, 1149.8457, 1082.6094, 0.0},
{"[SF]st.RMine 21", 120000, "Unknown", "Unknown", 100, 0, 0, 12, 0, 0, 0, "Unknown", 50000, 0, 0, -2016.753, 994.915, 49.952, 0.0, 2324.6213, -1143.9209, 1050.4922, 0.0},
{"[SF]st.Strike 99", 100000, "Unknown", "Unknown", 120, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, -2382.141, 1305.989, 17.773, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[SF]st.Old Fiero Strip 37", 460000, "Unknown", "Unknown", 130, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, -2353.556, 1250.259, 27.800, 0.0, 289.9850, 307.3130, 999.1484, 0.0},
{"[SF]st.MiniLit 50", 110000, "Unknown", "Unknown", 150, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, -2157.071, 979.139, 80.001, 0.0, 319.4555, 312.5038, 999.1484, 0.0},
{"[SF-Elite]st.Mortynate 34", 3000000, "Unknown", "Unknown", 790, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, -2078.481, 902.135, 64.127, 0.0, 272.0126, 306.4208, 999.1484, 0.0},
{"[LV]st.TutiDruti 43", 300000, "Unknown", "Unknown", 150, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 2397.535, 655.037, 11.4683, 0.0, 235.1457, 1190.7142, 1080.2578, 0.0},
{"[LV]st.TutiDruti 23", 190000, "Unknown", "Unknown", 250, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 2318.441, 654.771, 11.4683, 0.0, 221.4334, 1240.8158, 1082.1406, 0.0},
{"[LV]st.Bellion 42", 400000, "Unknown", "Unknown", 180, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 2346.741, 735.190, 11.4683, 0.0, 239.2819, 1114.1991, 1080.9922, 0.0},
{"[LV]st.TutiDruti 22", 700000, "Unknown", "Unknown", 110, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2346.558, 692.725, 11.4683, 0.0, 295.3137, 1478.6494, 1080.2578, 0.0},
{"[LV]st.Ferrary Creek 14", 390000, "Unknown", "Unknown", 150, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2448.982, 742.452, 11.4683, 0.0, 328.9125, 1482.2545, 1084.4375, 0.0},
{"[LV]st.Terramore 8", 700000, "Unknown", "Unknown", 150, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2018.7217,2763.0349,10.8203,0.0, 178.1705, 1417.2700, 1081.3281, 0.0},
{"[LV]st.Angel Pine 22", 800000, "Unknown", "Unknown", 150, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, 2049.476, 2761.351, 11.815, 0.0, 306.1966, 307.8190, 1003.3047, 0.0},
{"[LV]st.Whetstone 92", 200000, "Unknown", "Unknown", 300, 0, 0, 9, 0, 0, 0, "Unknown", 50000, 0, 0, 2093.317, 731.819, 12.448, 0.0, 260.9170, 1242.6680, 1084.2578, 0.0},
{"[LV]st.Hashbury 43", 90000, "Unknown", "Unknown", 100, 0, 0, 10, 0, 0, 0, "Unknown", 50000, 0, 0, 2013.653, 774.227, 11.655, 0.0, 20.7300, 1341.7350, 1084.3750, 0.0},
{"[LV]st.Doherty 63", 50000, "Unknown", "Unknown", 150, 0, 0, 10, 0, 0, 0, "Unknown", 50000, 0, 0, 2123.306, 774.726, 11.640, 0.0, 20.7300, 1341.7350, 1084.3750, 0.0},
{"[LV]st.Queens 37", 150000, "Unknown", "Unknown", 120, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, 984.356, 1894.683, 11.655, 0.0, 221.6921, 1149.8457, 1082.6094, 0.0},
{"[LV]st.TutiDruti 21", 120000, "Unknown", "Unknown", 150, 0, 0, 12, 0, 0, 0, "Unknown", 50000, 0, 0, 1029.716, 1927.262, 11.663, 0.0, 2324.6213, -1143.9209, 1050.4922, 0.0},
{"[LV]st.Sent 22", 120000, "Unknown", "Unknown", 150, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 887.278, 1979.872, 11.655, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[LV]st.Calton Heights 37", 200000, "Unknown", "Unknown", 130, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 1032.377, 2316.267, 11.663, 0.0, 289.9850, 307.3130, 999.1484, 0.0},
{"[LV]st.Don Mona 93", 120000, "Unknown", "Unknown", 150, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 1359.602, 2566.876, 11.015, 0.0, 319.4555, 312.5038, 999.1484, 0.0},
{"[LV]st.Tierra Robada 37", 120000, "Unknown", "Unknown", 150, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 1229.857, 2584.680, 11.015, 0.0, 2451.1558, -1685.9690, 1013.5078, 0.0},
{"[LV]st.Fort Carson 47", 130000, "Unknown", "Unknown", 100, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 1555.484, 2663.311, 11.015, 0.0, 2535.0583, -1674.4338, 1015.4986, 0.0},
{"[LV]st.Terramore 23a", 130000, "Unknown", "Unknown", 100, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 1603.561, 2679.075, 11.015, 0.0, 272.0126, 306.4208, 999.1484, 0.0},
{"[LV]st.Prickle Pine 33", 250000, "Unknown", "Unknown", 200, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 1618.664, 2606.625, 11.015, 0.0, 235.1457, 1190.7142, 1080.2578, 0.0},
{"[LV]st.Redsands West 38", 230000, "Unknown", "Unknown", 100, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 1733.996, 2700.667, 11.015, 0.0, 221.4334, 1240.8158, 1082.1406, 0.0},
{"[LV]st.Gvard Toe 53", 46000, "Unknown", "Unknown", 120, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2367.264, 2124.049, 11.014, 0.0, 295.3137, 1478.6494, 1080.2578, 0.0},
{"[LV]st.Rockshore West 23", 120000, "Unknown", "Unknown", 100, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2339.733, 1621.617, 11.015, 0.0, 328.9125, 1482.2545, 1084.4375, 0.0},
{"[LV]st.Old Strip Bar 37", 46000, "Unknown", "Unknown", 130, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2360.096, 2378.085, 11.015, 0.0, 374.5086, 1417.2700, 1081.3281, 0.0},
{"[LV]st.Marihuana 50", 110000, "Unknown", "Unknown", 150, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, 2609.640, 2392.888, 18.015, 0.0, 306.1966, 307.8190, 1003.3047, 0.0},
{"[LV-Elite]st.Million 12", 3700000, "Unknown", "Unknown", 800, 0, 0, 9, 0, 0, 0, "Unknown", 50000, 0, 0, 2535.3997, 997.8736, 14.2725, 0.0, 6.5801, 1242.6680, 1084.2578, 0.0},
{"[LV-Elite]st.Million 32", 1000000, "Unknown", "Unknown", 750, 0, 0, 10, 0, 0, 0, "Unknown", 50000, 0, 0, 1492.8861, 720.1134, 10.8279, 0.0, 181.3983, 1341.7350, 1084.3750, 0.0},
{"[LV-Elite]st.Million 17", 2000000, "Unknown", "Unknown", 790, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, 2557.671, 1561.958, 10.815, 0.0, 221.6921, 1149.8457, 1082.6094, 0.0},
{"[LV-Elite]st.Million 43", 1500000, "Unknown", "Unknown", 800, 0, 0, 12, 0, 0, 0, "Unknown", 50000, 0, 0, 2483.931, 1528.259, 11.093, 0.0, 2324.6213, -1143.9209, 1050.4922, 0.0},
{"[LV-Elite]st.Million 22", 2000000, "Unknown", "Unknown", 750, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 2581.533, 1061.976, 11.269, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[LV-Motel]Motel Room 2", 50000, "Unknown", "Unknown", 50, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 1784.483, 2866.863, 14.260, 0.0, 289.9850, 307.3130, 999.1484, 0.0},
{"[LV-Motel]Motel Room 5", 50000, "Unknown", "Unknown", 50, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 1740.401, 2861.605, 14.260, 0.0, 319.4555, 312.5038, 999.1484, 0.0},
{"[LV-Motel]Motel Room 21", 50000, "Unknown", "Unknown", 50, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 1737.867, 2802.571, 14.168, 0.0, 2451.1558, -1685.9690, 1013.5078, 0.0},
{"[LV-Motel]Motel Room 22", 50000, "Unknown", "Unknown", 50, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 1830.707, 2742.897, 14.168, 0.0, 2535.0583, -1674.4338, 1015.4986, 0.0},
{"[LV-Motel]Motel Room 37", 50000, "Unknown", "Unknown", 50, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 2660.460, 749.261, 14.2734, 0.0, 272.0126, 306.4208, 999.1484, 0.0},
{"[LV-Motel]Motel Room 93", 50000, "Unknown", "Unknown", 50, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 2613.922, 719.468, 14.2734, 0.0, 235.1457, 1190.7142, 1080.2578, 0.0},
{"[LV-Motel]Motel Room 48", 50000, "Unknown", "Unknown", 50, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 2525.864, 749.313, 14.2734, 0.0, 221.4334, 1240.8158, 1082.1406, 0.0},
{"[LV-Motel]Motel Room 1", 50000, "Unknown", "Unknown", 50, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2820.047, 2271.459, 14.656, 0.0, 295.3137, 1478.6494, 1080.2578, 0.0},
{"[LV-Motel]Motel Room 33", 50000, "Unknown", "Unknown", 50, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2793.985, 2222.337, 14.656, 0.0, 328.9125, 1482.2545, 1084.4375, 0.0},
{"[LV-Motel]Motel Room 28", 50000, "Unknown", "Unknown", 50, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2549.181, 2202.389, 14.111, 0.0, 384.0571, 1471.7700, 1080.1875, 0.0},
{"[LV-Motel]Motel Room 77", 46000, "Unknown", "Unknown", 46, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 2609.615, 2143.072, 14.111, 0.0, 374.5086, 1417.2700, 1081.3281, 0.0},
{"[LV-Motel]Motel Room 53", 46000, "Unknown", "Unknown", 46, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, 2637.650, 1979.056, 14.111, 0.0, 306.1966, 307.8190, 1003.3047, 0.0},
{"[LV-Motel]Motel Room 23", 50000, "Unknown", "Unknown", 50, 0, 0, 9, 0, 0, 0, "Unknown", 50000, 0, 0, 2652.686, 2018.261, 14.111, 0.0, 260.9170, 1242.6680, 1084.2578, 0.0},
{"[LV-Motel]Motel Room 11", 99000, "Unknown", "Unknown", 99, 0, 0, 10, 0, 0, 0, "Unknown", 50000, 0, 0, 2453.709, 1419.763, 11.701, 0.0, 20.7300, 1341.7350, 1084.3750, 0.0},
{"[LV-Motel]Motel Room 37", 46000, "Unknown", "Unknown", 46, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, 1904.929, 664.622, 14.268, 0.0, 221.6921, 1149.8457, 1082.6094, 0.0},
{"[LV-Motel]Motel Room 13", 30000, "Unknown", "Unknown", 30, 0, 0, 12, 0, 0, 0, "Unknown", 50000, 0, 0, 1929.276, 741.587, 14.268, 0.0, 2324.6213, -1143.9209, 1050.4922, 0.0},
{"[BR]House Mymy", 200000, "Unknown", "Unknown", 120, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 2510.728, 11.165, 27.636, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[BR]House Tester", 150000, "Unknown", "Unknown", 120, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, 2374.721, 20.795, 27.636, 0.0, 289.9850, 307.3130, 999.1484, 0.0},
{"[BR]House Violet", 270000, "Unknown", "Unknown", 120, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 2249.135, -121.139, 27.348, 0.0, 319.4555, 312.5038, 999.1484, 0.0},
{"[BR]House Milki", 200000, "Unknown", "Unknown", 120, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 1294.500, 174.799, 21.105, 0.0, 2451.1558, -1685.9690, 1013.5078, 0.0},
{"[BR]House Tykte", 200000, "Unknown", "Unknown", 120, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, 748.371, 278.347, 26.453, 0.0, 2535.0583, -1674.4338, 1015.4986, 0.0},
{"[BR]House Bilka", 200000, "Unknown", "Unknown", 120, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, 252.318, -116.120, 3.730, 0.0, 272.0126, 306.4208, 999.1484, 0.0},
{"[BR]House Camun", 200000, "Unknown", "Unknown", 120, 0, 0, 3, 0, 0, 0, "Unknown", 50000, 0, 0, -2157.860, -2536.616, 31.811, 0.0, 235.1457, 1190.7142, 1080.2578, 0.0},
{"[BR]House Geomance", 190000, "Unknown", "Unknown", 120, 0, 0, 2, 0, 0, 0, "Unknown", 50000, 0, 0, -2220.680, -2401.287, 32.377, 0.0, 221.4334, 1240.8158, 1082.1406, 0.0},
{"[BR]House Dodo", 200000, "Unknown", "Unknown", 120, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, -2045.275, -2523.618, 31.0668, 0.0, 239.2819, 1114.1991, 1080.9922, 0.0},
{"[BR]House Ferrary", 200000, "Unknown", "Unknown", 120, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, 768.494, 2006.660, 6.061, 0.0, 295.3137, 1478.6494, 1080.2578, 0.0},
{"[BR]House Blatnoy", 200000, "Unknown", "Unknown", 120, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, -37.578, 1078.458, 20.104, 0.0, 328.9125, 1482.2545, 1084.4375, 0.0},
{"[BR]House Feramon", 230000, "Unknown", "Unknown", 120, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, -260.176, 1047.628, 20.734, 0.0, 384.0571, 1471.7700, 1080.1875, 0.0},
{"[BR]House Californy", 200000, "Unknown", "Unknown", 120, 0, 0, 15, 0, 0, 0, "Unknown", 50000, 0, 0, -907.070, 1543.662, 25.909, 0.0, 374.5086, 1417.2700, 1081.3281, 0.0},
{"[BR]House Meteor", 260000, "Unknown", "Unknown", 120, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, -1483.853, 2702.008, 56.049, 0.0, 306.1966, 307.8190, 1003.3047, 0.0},
{"[BR]House Neon", 260000, "Unknown", "Unknown", 120, 0, 0, 9, 0, 0, 0, "Unknown", 50000, 0, 0, -149.406, 2688.812, 62.424, 0.0, 260.9170, 1242.6680, 1084.2578, 0.0},
{"[BR]House Figaro", 200000, "Unknown", "Unknown", 120, 0, 0, 10, 0, 0, 0, "Unknown", 50000, 0, 0, -285.919, 2757.093, 62.507, 0.0, 20.7300, 1341.7350, 1084.3750, 0.0},
{"[BR]House Pycucat", 290000, "Unknown", "Unknown", 120, 0, 0, 4, 0, 0, 0, "Unknown", 50000, 0, 0, -2389.537, 2410.905, 8.072, 0.0, 221.6921, 1149.8457, 1082.6094, 0.0},
{"[BR]House SAS", 260000, "Unknown", "Unknown", 120, 0, 0, 12, 0, 0, 0, "Unknown", 50000, 0, 0, -2634.079, 2403.307, 10.475, 0.0, 2324.6213, -1143.9209, 1050.4922, 0.0},
{"[BR]House WayV", 200000, "Unknown", "Unknown", 120, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, -2524.967, 2239.568, 4.600, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[LV]st.Blueberry 37", 200000, "Unknown", "Unknown", 120, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 559.1950, -1076.3453, 72.9220, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[LS]Four Dragons Mansion", 200000, "Unknown", "Unknown", 120, 0, 0, 1, 0, 0, 0, "Unknown", 50000, 0, 0, -2627.3208, 2283.4939, 8.3123, 0.0, 247.5086, 304.9248, 999.1484, 0.0},
{"[LV-Motel]Motel Room 38", 200000, "Unknown", "Unknown", 120, 0, 0, 5, 0, 0, 0, "Unknown", 50000, 0, 0, 2206.3157, 691.5402, 11.4609, 0.0, 239.2819, 1114.1991, 1080.9922, 0.0},
{"[LS]Gun House", 500000, "Unknown", "Unknown", 120, 0, 0, 8, 0, 0, 0, "Unknown", 50000, 0, 0, 2807.804931, -1176.960815, 25.384168, 0.0, 2807.620117, -1171.900024, 1025.570312, 0.0},
{"[LV]Suburban House", 500000, "Unknown", "Unknown", 120, 0, 0, 8, 0, 0, 0, "Unknown", 50000, 0, 0, -911.748300, 2686.420900, 42.370300, 2807.620117, -1171.900024, 1025.570312}
};

new house_increase_levels[] = {PLAYER_HOUSE_INCREASE_LEVELS};

#define MAX_PLAYER_HOUSES sizeof(house_increase_levels)

#define SetPlayerToHouseID(%0,%1) SetPVarInt(%0, "HausID",%1)
#define GetPlayerToHouseID(%0) GetPVarInt(%0, "HausID")
new
	house_icon[ sizeof(Houses) ] = {INVALID_STREAMER_ID, ...},
	Float:HouseDistanceOfShowLabel = 20.0,
	HouseUpKeepRatio = 1000;

static
	Text3D:gLabelID[ sizeof(Houses) ][MAX_PLAYERS];

stock houses_LoadConfig(file_config)
{
	ini_getString(file_config, "Houses_DB", db_houses);
	ini_getFloat(file_config, "House_DistanceOfShowLabel", HouseDistanceOfShowLabel);
	ini_getInteger(file_config, "House_UpKeepRatio", HouseUpKeepRatio);
}

stock houses_SaveConfig(file_config)
{
	ini_setString(file_config, "Houses_DB", db_houses);
	ini_setFloat(file_config, "House_DistanceOfShowLabel", HouseDistanceOfShowLabel);
	ini_setInteger(file_config, "House_UpKeepRatio", HouseUpKeepRatio);
}

stock houses_LoadAll()
{
	new file_housing, db_housesname[MAX_STRING];
	for (new i = 0; i < sizeof(Houses); i++)
	{
		format(db_housesname, sizeof(db_housesname), "%s%s"DATA_FILES_FORMAT, db_houses, Houses[i][Houses_Name]);
		if (!ini_fileExist(db_housesname)) continue;
		file_housing = ini_openFile(db_housesname);
		ini_getString(file_housing, "Name", Houses[i][Houses_Name], MAX_NAME);
		ini_getInteger(file_housing, "Cost", Houses[i][Houses_Cost]);
		ini_getString(file_housing, "Owner", Houses[i][Houses_Owner], MAX_PLAYER_NAME);
		ini_getString(file_housing, "Gang", Houses[i][Houses_Gang], MAX_GANG_NAME);
		ini_getInteger(file_housing, "UpKeep", Houses[i][Houses_UpKeep]);
		ini_getInteger(file_housing, "UpKeepLeft", Houses[i][Houses_UpKeepLeft]);
		ini_getInteger(file_housing, "Buyout", Houses[i][Houses_Buyout]);
		ini_getInteger(file_housing, "Interior", Houses[i][Houses_Interior]);
		ini_getInteger(file_housing, "Car", Houses[i][Houses_Car]);
		ini_getInteger(file_housing, "Lock", Houses[i][Houses_Lock]);
		ini_getInteger(file_housing, "Rentabil", Houses[i][Houses_Rentabil]);
		ini_getString(file_housing, "RentName", Houses[i][Houses_RentName], MAX_PLAYER_NAME);
		ini_getInteger(file_housing, "RentCost", Houses[i][Houses_RentCost]);
		ini_getInteger(file_housing, "HealUpgrade", Houses[i][Houses_HealUpgrade]);
		ini_getInteger(file_housing, "ArmourUpgrade", Houses[i][Houses_ArmourUpgrade]);
		ini_getFloat(file_housing, "Pickup_X", Houses[i][Houses_PickupX]);
		ini_getFloat(file_housing, "Pickup_Y", Houses[i][Houses_PickupY]);
		ini_getFloat(file_housing, "Pickup_Z", Houses[i][Houses_PickupZ]);
		ini_getFloat(file_housing, "Pickup_A", Houses[i][Houses_PickupA]);
		ini_getFloat(file_housing, "Interior_X", Houses[i][Houses_InteriorX]);
		ini_getFloat(file_housing, "Interior_Y", Houses[i][Houses_InteriorY]);
		ini_getFloat(file_housing, "Interior_Z", Houses[i][Houses_InteriorZ]);
		ini_getFloat(file_housing, "Interior_A", Houses[i][Houses_InteriorA]);
		ini_closeFile(file_housing);
	}
	return;
}

stock houses_SaveAll()
{
	for (new housid = 0; housid < sizeof(Houses); housid++)
	{
		SaveHous(housid);
	}
	return 1;
}

stock SaveHous(housid)
{
	new db_housesname[MAX_STRING];
	format(db_housesname, sizeof(db_housesname), "%s%s"DATA_FILES_FORMAT, db_houses, Houses[housid][Houses_Name]);
	new file_housing = (!ini_fileExist(db_housesname)) ? ini_createFile(db_housesname) : ini_openFile(db_housesname);
	ini_setString(file_housing, "Name", Houses[housid][Houses_Name]);
	ini_setInteger(file_housing, "Cost", Houses[housid][Houses_Cost]);
	ini_setString(file_housing, "Owner", Houses[housid][Houses_Owner]);
	ini_setString(file_housing, "Gang", Houses[housid][Houses_Gang]);
	ini_setInteger(file_housing, "UpKeep", Houses[housid][Houses_UpKeep]);
	ini_setInteger(file_housing, "UpKeepLeft", Houses[housid][Houses_UpKeepLeft]);
	ini_setInteger(file_housing, "Buyout", Houses[housid][Houses_Buyout]);
	ini_setInteger(file_housing, "Interior", Houses[housid][Houses_Interior]);
	ini_setInteger(file_housing, "Car", Houses[housid][Houses_Car]);
	ini_setInteger(file_housing, "Lock", Houses[housid][Houses_Lock]);
	ini_setInteger(file_housing, "Rentabil", Houses[housid][Houses_Rentabil]);
	ini_setString(file_housing, "RentName", Houses[housid][Houses_RentName]);
	ini_setInteger(file_housing, "RentCost", Houses[housid][Houses_RentCost]);
	ini_setInteger(file_housing, "HealUpgrade", Houses[housid][Houses_HealUpgrade]);
	ini_setInteger(file_housing, "ArmourUpgrade", Houses[housid][Houses_ArmourUpgrade]);
	ini_setFloat(file_housing, "Pickup_X", Houses[housid][Houses_PickupX]);
	ini_setFloat(file_housing, "Pickup_Y", Houses[housid][Houses_PickupY]);
	ini_setFloat(file_housing, "Pickup_Z", Houses[housid][Houses_PickupZ]);
	ini_setFloat(file_housing, "Pickup_A", Houses[housid][Houses_PickupA]);
	ini_setFloat(file_housing, "Interior_X", Houses[housid][Houses_InteriorX]);
	ini_setFloat(file_housing, "Interior_Y", Houses[housid][Houses_InteriorY]);
	ini_setFloat(file_housing, "Interior_Z", Houses[housid][Houses_InteriorZ]);
	ini_setFloat(file_housing, "Interior_A", Houses[housid][Houses_InteriorA]);
	ini_closeFile(file_housing);
	return 1;
}

housing_OnGameModeInit()
{
	houses_LoadAll();

	new
		icon_type;

	for (new id = 0; id < sizeof(Houses); id++) {
		CreateDynamicPickup(1273, 1, Houses[id][Houses_PickupX], Houses[id][Houses_PickupY], Houses[id][Houses_PickupZ]);
		CreateDynamicPickup(1559, 1, Houses[id][Houses_InteriorX], Houses[id][Houses_InteriorY], Houses[id][Houses_InteriorZ] + 0.2, id + 1);

		if (strcmp(Houses[id][Houses_Owner], "Unknown")) {
			icon_type = 32;
		} else {
			icon_type = 31;
		}
		house_icon[id] = CreateDynamicMapIcon(Houses[id][Houses_PickupX], Houses[id][Houses_PickupY], Houses[id][Houses_PickupZ], icon_type, 0);

		Houses[id][Houses_VirtualWorld] = id + 1;
	}
	Log_Init("system", "Housing module init.");
}

public OnPlayerLogin(playerid)
{
	for (new id = 0; id < sizeof(Houses); id++) {
		housing_CreatePlayerLabel(playerid, id);
	}
	#if defined Housing_OnPlayerLogin
		return Housing_OnPlayerLogin(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerLogin
	#undef OnPlayerLogin
#else
	#define _ALS_OnPlayerLogin
#endif

#define OnPlayerLogin Housing_OnPlayerLogin
#if defined Housing_OnPlayerLogin
	forward Housing_OnPlayerLogin(playerid);
#endif

housing_OnPlayerDisconnect(playerid, reason)
{
	#pragma unused reason
	for (new id = 0; id < sizeof(Houses); id++) {
		housing_DestroyPlayerLabel(playerid, id);
	}
}

stock IsPlayerAtHouse(playerid)
{
	for (new id = 0; id < sizeof(Houses); id++)
	{
		if (IsPlayerInRangeOfPoint(playerid, 2, Houses[id][Houses_PickupX], Houses[id][Houses_PickupY], Houses[id][Houses_PickupZ])
		   || IsPlayerInRangeOfPoint(playerid, 2, Houses[id][Houses_InteriorX], Houses[id][Houses_InteriorY], Houses[id][Houses_InteriorZ]))
		{
			return 1;
		}
	}
	return 0;
}

stock IsPlayerRenter(playerid, houseid)
{
	new playername[MAX_PLAYER_NAME+1];
	GetPlayerName(playerid, playername, sizeof(playername));

	if (houseid == -1) {
		for (new id = 0; id < sizeof(Houses); id++) {
			if (!strcmp(Houses[id][Houses_RentName], playername, true)) {
				return 1;
			}
		}
	} else {
		if (!strcmp(Houses[houseid][Houses_RentName], playername, true)) {
			return 1;
		}
	}
	return 0;
}

DialogResponse:HouseInfo(playerid, response, listitem, inputtext[])
{
	if (!response) {
		return 1;
	}

	Dialog_Show(playerid, Dialog:HouseMenu);
	return 1;
}

DialogCreate:HouseMenu(playerid)
{
	static
		string[MAX_LANG_VALUE_STRING * 7],
		temp[MAX_LANG_VALUE_STRING],
		playername[MAX_PLAYER_NAME+1];

	string[0] = '\0';

	GetPlayerName(playerid, playername, sizeof(playername));

	new id = GetPlayerToHouseID(playerid);

	new isowner = !strcmp(Houses[id][Houses_Owner], playername, true);
	if (isowner) {
		Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_SELL", temp, sizeof(temp));
	} else {
		Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_BUY", temp, sizeof(temp));
	}
	strcat(string, temp);

	Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_ENTER", temp, sizeof(temp));
	strcat(string, temp);

	if (!isowner) {
		if (!strcmp(Houses[id][Houses_RentName], playername, true)) {
			Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_RENT_STOP", temp, sizeof(temp));
		} else {
			Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_RENT_START", temp, sizeof(temp));
		}
	} else {
		if (!strcmp(Houses[id][Houses_RentName], "Unknown", true)) {
			if (Houses[id][Houses_Rentabil] == 1) {
				Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_RENT_OFF", temp, sizeof(temp));
			} else {
				Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_RENT_ON", temp, sizeof(temp));
			}
		} else {
			Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_RENT_KICK", temp, sizeof(temp));
		}
	}
	strcat(string, temp);

	if (isowner) {
		Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_RENT_SET", temp, sizeof(temp));
		strcat(string, temp);

		if (Houses[id][Houses_Lock] == 1) {
			Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_OPEN", temp, sizeof(temp));
		} else {
			Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_CLOSE", temp, sizeof(temp));
		}
		strcat(string, temp);

		Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_UPGRADES", temp, sizeof(temp));
		strcat(string, temp);

		Lang_GetPlayerText(playerid, "HOUSING_DIALOG_LIST_KEEP", temp, sizeof(temp));
		strcat(string, temp);
	}

	Dialog_Open(playerid, Dialog:HouseMenu, DIALOG_STYLE_LIST,
	            Houses[id][Houses_Name],
	            string,
	            "HOUSING_DIALOG_BUTTON_SELECT", "HOUSING_DIALOG_BUTTON_CANCEL");
	return 1;
}

DialogResponse:HouseMenu(playerid, response, listitem, inputtext[])
{
	if (!response) {
		return 0;
	}

	new id = GetPlayerToHouseID(playerid);
	new playername[MAX_PLAYER_NAME+1];

	GetPlayerName(playerid, playername, sizeof(playername));

	switch (listitem)
	{
		case 0:
		{
			if (!strcmp(Houses[id][Houses_Owner], playername, true))
			{
				Dialog_Show(playerid, Dialog:HouseSellAccept);
			}
			else
			{
				house_Buy(playerid);
			}
			return 1;
		}
		case 1:
		{
			if (Houses[id][Houses_Lock] == 1)
			{
				Dialog_Message(playerid, "HOUSING_ENTER_HEADER", "HOUSING_ENTER_CLOSED", "HOUSING_DIALOG_BUTTON_OK");
				return 1;
			}
			SetPlayerPosEx(playerid,
			               Houses[id][Houses_InteriorX], Houses[id][Houses_InteriorY],
			               Houses[id][Houses_InteriorZ], Houses[id][Houses_InteriorA],
			               Houses[id][Houses_Interior], Houses[id][Houses_VirtualWorld]);
			Lang_SendText(playerid, "HOUSING_ENTER_EXIT_HELP");
			return 1;
		}
		case 2:
		{
			if (strcmp(Houses[id][Houses_Owner], playername, true))
			{
				if (!strcmp(Houses[id][Houses_RentName], playername, true))
				{
					DeleteRenter(playerid);
				}
				else
				{
					RentRoom(playerid);
				}
			}
			else
			{
				if (!strcmp(Houses[id][Houses_RentName], "Unknown", true))
				{
					if (Houses[id][Houses_Rentabil] == 1)
					{
						Houses[id][Houses_Rentabil] = 0;
						Dialog_Message(playerid, "HOUSING_RENT_HEADER", "HOUSING_RENT_SET_DISABLED", "HOUSING_DIALOG_BUTTON_OK");
					}
					else
					{
						Houses[id][Houses_Rentabil] = 1;
						Dialog_Message(playerid, "HOUSING_RENT_HEADER", "HOUSING_RENT_SET_ENABLED", "HOUSING_DIALOG_BUTTON_OK");
					}
				}
				else
				{
					DeleteRenter(playerid);
				}
			}
			return 1;
		}
		case 3:
		{
			Dialog_Show(playerid, Dialog:HouseSetRent);
			return 1;
		}
		case 4:
		{
			if (Houses[id][Houses_Lock] == 1)
			{
				Houses[id][Houses_Lock] = 0;
				Dialog_Message(playerid, "HOUSING_ENTER_HEADER", "HOUSING_ENTER_IS_OPEN", "HOUSING_DIALOG_BUTTON_OK");
			}
			else
			{
				Houses[id][Houses_Lock] = 1;
				Dialog_Message(playerid, "HOUSING_ENTER_HEADER", "HOUSING_ENTER_IS_CLOSE", "HOUSING_DIALOG_BUTTON_OK");
			}
			return 1;
		}
		case 5:
		{
			Dialog_Show(playerid, Dialog:HouseUpgrades);
			return 1;
		}
		case 6:
		{
			return house_Keep(playerid);
		}
	}
	return 1;
}

DialogCreate:HouseSetRent(playerid)
{
	new id = GetPlayerToHouseID(playerid);
	Dialog_Open(playerid, Dialog:HouseSetRent, DIALOG_STYLE_INPUT,
	            "HOUSING_RENT_SET_HEADER",
	            "HOUSING_RENT_SET_NEW",
	            "HOUSING_DIALOG_BUTTON_SELECT", "HOUSING_DIALOG_BUTTON_BACK",
	            Houses[id][Houses_RentCost]);
}

DialogResponse:HouseSetRent(playerid, response, listitem, inputtext[])
{
	if (!response) {
		Dialog_Show(playerid, Dialog:HouseMenu);
		return 1;
	}

	new rentcost = strval(inputtext);
	if (rentcost < 1) {
		Dialog_Message(playerid, "HOUSING_RENT_SET_HEADER", "HOUSING_RENT_SET_VALUE_ERROR", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	Houses[ GetPlayerToHouseID(playerid) ][Houses_RentCost] = rentcost;

	Dialog_Message(playerid,
	               "HOUSING_RENT_SET_HEADER",
	               "HOUSING_RENT_SET_SUCCESS",
	               "HOUSING_DIALOG_BUTTON_OK",
	               rentcost);
	return 1;
}

DialogCreate:HouseSellAccept(playerid)
{
	Dialog_Open(playerid, Dialog:HouseSellAccept, DIALOG_STYLE_MSGBOX, "HOUSING_SELL_ACCEPT_HEADER", "HOUSING_SELL_ACCEPT_INFO", "HOUSING_DIALOG_BUTTON_SELL", "HOUSING_DIALOG_BUTTON_BACK");
}

DialogResponse:HouseSellAccept(playerid, response, listitem, inputtext[])
{
	if (!response) {
		Dialog_Show(playerid, Dialog:HouseMenu);
		return 1;
	}

	house_Sell(playerid);
	return 1;
}

DialogCreate:HouseUpgrades(playerid)
{
	Dialog_Open(playerid, Dialog:HouseUpgrades, DIALOG_STYLE_LIST, "HOUSING_UPGRADE_HEADER", "HOUSING_UPGRADE_LIST", "HOUSING_DIALOG_BUTTON_SELECT", "HOUSING_DIALOG_BUTTON_BACK");
}

DialogResponse:HouseUpgrades(playerid, response, listitem, inputtext[])
{
	if (!response) {
		Dialog_Show(playerid, Dialog:HouseMenu);
		return 1;
	}

	new id = GetPlayerToHouseID(playerid);
	switch (listitem) {
		case 0: {
			if (Houses[id][Houses_HealUpgrade] == 1) {
				if (GetPVarInt(playerid, "house_HealUpgrade_Used") == 1) {
					Dialog_Message(playerid, "HOUSING_UPGRADE_HEADER", "HOUSING_UPGRADE_PAUSE", "HOUSING_DIALOG_BUTTON_OK");
					return 1;
				}

				SetPlayerMaxHealth(playerid);

				SetPVarInt(playerid, "house_HealUpgrade_Used", 1);
				SetTimerEx("house_HealUpgrade_Used", HOUSE_UPGRADE_USE_TIME * 1000, false, "d", playerid);
				return 1;
			}

			if (GetPlayerMoney(playerid) < HOUSE_UPGRADE_HEALTH_COST) {
				Dialog_Message(playerid,
				               "HOUSING_UPGRADE_HEALTH",
				               "HOUSING_UPGRADE_NO_MONEY",
				               "HOUSING_DIALOG_BUTTON_OK",
				               HOUSE_UPGRADE_HEALTH_COST);
				return 1;
			}

			Houses[id][Houses_HealUpgrade] = 1;
			GivePlayerMoney(playerid,-HOUSE_UPGRADE_HEALTH_COST);

			Dialog_Message(playerid, "HOUSING_UPGRADE_HEADER", "HOUSING_UPGRADE_SUCCESS", "HOUSING_DIALOG_BUTTON_OK");
			return 1;
		}
		case 1: {
			if (Houses[id][Houses_ArmourUpgrade] == 1) {
				if (GetPVarInt(playerid, "house_ArmourUpgrade_Used") == 1) {
					Dialog_Message(playerid, "HOUSING_UPGRADE_HEADER", "HOUSING_UPGRADE_PAUSE", "HOUSING_DIALOG_BUTTON_OK");
					return 1;
				}

				SetPlayerArmour(playerid, 100);

				SetPVarInt(playerid, "house_ArmourUpgrade_Used", 1);
				SetTimerEx("house_ArmourUpgrade_Used", HOUSE_UPGRADE_USE_TIME * 1000, false, "d", playerid);
				return 1;
			}

			if (GetPlayerMoney(playerid) < HOUSE_UPGRADE_ARMOUR_COST) {
				Dialog_Message(playerid,
				               "HOUSING_UPGRADE_ARMOUR",
				               "HOUSING_UPGRADE_NO_MONEY",
				               "HOUSING_DIALOG_BUTTON_OK",
				               HOUSE_UPGRADE_ARMOUR_COST);
				return 1;
			}

			Houses[id][Houses_ArmourUpgrade] = 1;
			GivePlayerMoney(playerid,-HOUSE_UPGRADE_ARMOUR_COST);

			Dialog_Message(playerid, "HOUSING_UPGRADE_HEADER", "HOUSING_UPGRADE_SUCCESS", "HOUSING_DIALOG_BUTTON_OK");
			return 1;
		}
	}
	return 1;
}

stock RentRoom(playerid)
{
	new id = GetPlayerToHouseID(playerid), string[MAX_STRING];
	if (id <= -1 || IsPlayerRenter(playerid, -1))
	{
		return 1;
	}

	if (Houses[id][Houses_Rentabil] == 0)
	{
		Dialog_Message(playerid, "HOUSING_RENT_HEADER", "HOUSING_RENT_DISABLED", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	if (strlen(ret_GetPlayerGangName(playerid)) > 0)
	{
		Dialog_Message(playerid, "HOUSING_RENT_HEADER", "HOUSING_RENT_IN_GANG", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	if (!strcmp(Houses[id][Houses_RentName], "Unknown", true))
	{
		if (GetPlayerMoney(playerid) < Houses[id][Houses_RentCost])
		{
			Dialog_Message(playerid, "HOUSING_RENT_HEADER", "HOUSING_RENT_NO_MONEY", "HOUSING_DIALOG_BUTTON_OK");
			return 1;
		}
		GetPlayerName(playerid, Houses[id][Houses_RentName], MAX_PLAYER_NAME + 1);
		GivePlayerMoney(playerid, -Houses[id][Houses_RentCost]);

		// ���������� ������ � ���� ���������
		new owner_id = -1;
		foreach (new pid : Player) {
			if ( !strcmp(Houses[id][Houses_Owner], ret_GetPlayerName(pid)) ) {
				owner_id = pid;
				break;
			}
		}
		if (owner_id != -1) {
			GivePlayerBankMoney(owner_id, Houses[id][Houses_RentCost]);
		} else {
			new filename_player[MAX_STRING];
			format(filename_player, sizeof(filename_player), "%s%s"DATA_FILES_FORMAT, db_player, Houses[id][Houses_Owner]);
			new file_player = ini_openFile(filename_player);
			new bank_money;
			ini_getInteger(file_player, "BankMoney", bank_money);
			ini_setInteger(file_player, "BankMoney", bank_money + Houses[id][Houses_RentCost]);
			ini_closeFile(file_player);
		}
		housing_UpdateLabel(id);

		format(string, sizeof(string), "%s%s"DATA_FILES_FORMAT, db_houses, Houses[id][Houses_Name]);
		new file_housing = ini_openFile(string);
		ini_setInteger(file_housing, "Rentabil", 1);
		ini_setString(file_housing, "RentName", ret_GetPlayerName(playerid));
		ini_closeFile(file_housing);
		Dialog_Message(playerid, "HOUSING_RENT_HEADER", "HOUSING_RENT_SUCCESS", "HOUSING_DIALOG_BUTTON_OK");
	}
	else
	{
		Dialog_Message(playerid,
		               "HOUSING_RENT_HEADER",
		               "HOUSING_RENT_CURRENT_RENTER",
		               "HOUSING_DIALOG_BUTTON_OK",
		               Houses[id][Houses_RentName]);
	}
	return 1;
}

stock DeleteRenter(playerid)
{
	new id = GetPlayerToHouseID(playerid);
	if (!strcmp(Houses[id][Houses_Owner], ret_GetPlayerName(playerid), true))
	{
		Dialog_Message(playerid, "HOUSING_RENT_HEADER", "HOUSING_RENT_RENTER_KICK", "HOUSING_DIALOG_BUTTON_OK");
		foreach (Player, i)
		{
			if (!strcmp(Houses[id][Houses_RentName], ret_GetPlayerName(i), true))
			{
				Lang_SendText(i, "HOUSING_KICKED");
			}
		}
	}
	else if (!strcmp(Houses[id][Houses_RentName], ret_GetPlayerName(playerid), true))
	{
		Dialog_Message(playerid, "HOUSING_RENT_HEADER", "HOUSING_RENT_LEAVE", "HOUSING_DIALOG_BUTTON_OK");
	}
	if (id > -1)
	{
		strcpy(Houses[id][Houses_RentName], "Unknown", MAX_PLAYER_NAME);
	}
	housing_UpdateLabel(id);
	return 1;
}

stock GetPlayerHouseMaximumCount(playerid)
{
	return GetHouseMaximumCountByLevel( GetPlayerLevel(playerid) );
}

stock GetHouseMaximumCountByLevel(level)
{
	new count = 0;

	for (new i = 0; i < MAX_PLAYER_HOUSES; i++) {
		if (level >= house_increase_levels[i]) {
			count++;
		}
	}

	return count;
}

stock GetPlayerHouseNearestLevel(playerid)
{
	new level = GetPlayerLevel(playerid);

	for (new i = 0; i < MAX_PLAYER_HOUSES; i++) {
		if (house_increase_levels[i] > level) {
			return house_increase_levels[i];
		}
	}

	return -1;
}

stock house_Buy(playerid)
{
	new playername[MAX_PLAYER_NAME+1];
	GetPlayerName(playerid, playername, sizeof(playername));

	new
		pl_houses,
		pl_houses_count = GetPlayerHouseMaximumCount(playerid);

	for (new i = 0; i < sizeof(Houses); i++) {
		if (!strcmp(Houses[i][Houses_Owner], playername, true)) {
			pl_houses++;

			if (pl_houses >= pl_houses_count) {
				new
					string[MAX_LANG_VALUE_STRING * 2],
					pl_houses_nearest;

				Lang_GetPlayerText(playerid, "HOUSING_BUY_MAX_LIMIT", string);
				pl_houses_nearest = GetPlayerHouseNearestLevel(playerid);

				if (pl_houses_nearest != -1) {
					Lang_GetPlayerText(playerid, "HOUSING_BUY_NEW_HOUSE_LEVEL", string, _, string, pl_houses_nearest);
				}

				Dialog_Message(playerid, "HOUSING_BUY_HEADER", string, "HOUSING_DIALOG_BUTTON_OK");
				return 1;
			}
		}
	}
	new id = GetPlayerToHouseID(playerid);
	if (id <= -1) {
		Dialog_Message(playerid, "HOUSING_BUY_HEADER", "HOUSING_ERROR", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	if (GetPlayerGangID(playerid) == INVALID_GANG_ID) {
		Dialog_Message(playerid, "HOUSING_BUY_HEADER", "HOUSING_BUY_NOT_IN_GANG", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	new price = Houses[id][Houses_Cost] + Houses[id][Houses_Buyout];
	if (GetPlayerMoney(playerid) < price) {
		Dialog_Message(playerid, "HOUSING_BUY_HEADER", "HOUSING_BUY_NO_MONEY", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	if (!strcmp(Houses[id][Houses_Owner], playername, true)) {
		Dialog_Message(playerid, "HOUSING_BUY_HEADER", "HOUSING_BUY_IS_MY", "HOUSING_DIALOG_BUTTON_OK");
	}
#if !defined BUY_ALL_HOUSES
	else if (strcmp(Houses[id][Houses_Owner], "Unknown", true)) {
		Dialog_Message(playerid, "HOUSING_BUY_HEADER", "HOUSING_BUY_HAVE_OWNER", "HOUSING_DIALOG_BUTTON_OK");
	}
#endif
	else {
	#if defined BUY_ALL_HOUSES
		foreach (new ownerid : Player) {
			if (!strcmp(Houses[id][Houses_Owner], ret_GetPlayerName(ownerid), true)) {
				Lang_SendText(ownerid, "HOUSING_RENT_SET_HEADER", ret_GetPlayerName(playerid), Houses[id][Houses_Name]);
				GivePlayerMoney(ownerid, price);
				break;
			}
		}
	#endif
		GivePlayerMoney(playerid, -price);
		strcpy(Houses[id][Houses_Owner], playername, MAX_PLAYER_NAME);
		GetPlayerGangName(playerid, Houses[id][Houses_Gang], MAX_GANG_NAME);
		Houses[id][Houses_Buyout] = 0;
		// ���� ����� ����� ���� ������ ���, �� ������ ����� � ����
		if (pl_houses == 0) {
			SetPlayerSpawnHouseID(playerid, id);
		}
		Streamer_SetIntData(STREAMER_TYPE_MAP_ICON, house_icon[id], E_STREAMER_TYPE, 32);
		housing_UpdateLabel(id);

		Dialog_Message(playerid,
		               "HOUSING_BUY_HEADER",
		               "HOUSING_BUY_SUCCESS",
		               "HOUSING_DIALOG_BUTTON_OK",
		               Houses[id][Houses_Name]);

		Log(mainlog, INFO, "player: %s [id: %d]: bought the '%s' (house)", playername, playerid, Houses[id][Houses_Name]);
	}
	return 1;
}

stock house_Sell(playerid)
{
	house_Keep(playerid);

	new id = GetPlayerToHouseID(playerid);
	if (id <= -1) {
		Dialog_Message(playerid, "HOUSING_SELL_HEADER", "HOUSING_ERROR", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	if (strcmp(Houses[id][Houses_Owner], ret_GetPlayerName(playerid), true)) {
		Dialog_Message(playerid, "HOUSING_SELL_HEADER", "HOUSING_SELL_NOT_OWNER", "HOUSING_DIALOG_BUTTON_OK");
	} else {
		new price = ((Houses[id][Houses_Cost] + Houses[id][Houses_Buyout]) * 85) / 100;
		GivePlayerMoney(playerid, price);

		house_Free(id);

		new gangid = GetPlayerGangID(playerid);
		if (Gang_GetHouseID(gangid) == id) {
			Gang_SetHouseID(gangid, -1);
		}

		if (GetPlayerSpawnHouseID(playerid) == id) {
			SetPlayerSpawnType(playerid, SPAWN_TYPE_NONE);
		}

		Dialog_Message(playerid,
		               "HOUSING_SELL_HEADER",
		               "HOUSING_SELL_SUCCESS",
		               "HOUSING_DIALOG_BUTTON_OK",
		               Houses[id][Houses_Name]);

		Log(mainlog, INFO, "player: %s [id: %d]: sold the '%s' (house)", ret_GetPlayerName(playerid), playerid, Houses[id][Houses_Name]);
	}
	return 1;
}

stock house_Keep(playerid)
{
	new id = GetPlayerToHouseID(playerid);
	if (id <= -1)
	{
		Dialog_Message(playerid, "HOUSING_KEEP_HEADER", "HOUSING_ERROR", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	if (strcmp(Houses[id][Houses_Gang], ret_GetPlayerGangName(playerid), true))
	{
		Dialog_Message(playerid, "HOUSING_KEEP_HEADER", "HOUSING_KEEP_NO_OWNER", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	if (GetPlayerMoney(playerid) < Houses[id][Houses_UpKeepLeft])
	{
		Dialog_Message(playerid, "HOUSING_KEEP_HEADER", "HOUSING_KEEP_NO_MONEY", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	if (Houses[id][Houses_UpKeepLeft] <= 0)
	{
		Dialog_Message(playerid, "HOUSING_KEEP_HEADER", "HOUSING_KEEP_NO", "HOUSING_DIALOG_BUTTON_OK");
		return 1;
	}

	GivePlayerMoney(playerid, -Houses[id][Houses_UpKeepLeft]);
	Dialog_Message(playerid, "HOUSING_KEEP_HEADER", "HOUSING_KEEP_SUCCESS", "HOUSING_DIALOG_BUTTON_OK");
	Houses[id][Houses_UpKeepLeft] = 0;
	return 1;
}

stock SetPlayerPosToHouse(playerid, i)
{
	SetPlayerPosEx(playerid,
	               Houses[i][Houses_PickupX], Houses[i][Houses_PickupY],
	               Houses[i][Houses_PickupZ], Houses[i][Houses_PickupA]);
}

stock house_GetSpawnPos(houseid, &Float:x, &Float:y, &Float:z, &Float:angle)
{
	if (houseid < 0 || houseid >= sizeof(Houses)) {
		return 0;
	}
	x = Houses[houseid][Houses_PickupX];
	y = Houses[houseid][Houses_PickupY];
	z = Houses[houseid][Houses_PickupZ];
	angle = Houses[houseid][Houses_PickupA];
	return 1;
}

stock HouseKeepUp()
{
	new
		result[e_Account_Info];

	for (new id = 0; id <  sizeof(Houses); id++) {
		if (!strcmp(Houses[id][Houses_Owner], "Unknown", true)) {
			continue;
		}

		Account_LoadData(Houses[id][Houses_Owner], result);

		if (IsDateExpired(result[e_aPremiumTime])) {
			Houses[id][Houses_UpKeepLeft] += Houses[id][Houses_UpKeep];

			if (Houses[id][Houses_UpKeepLeft] >= house_GetUpKeepMax(id)) {
				house_Free(id);
			}
		}
	}
}

housing_OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (!PRESSED(KEY_USING)) {
		return 0;
	}

	new player_vw = GetPlayerVirtualWorld(playerid);
	for (new id = 0; id < sizeof(Houses); id++)
	{
		if (player_vw == 0 && IsPlayerInRangeOfPoint(playerid, 3, Houses[id][Houses_PickupX], Houses[id][Houses_PickupY], Houses[id][Houses_PickupZ]))
		{
			SetPlayerToHouseID(playerid, id);

			if (strcmp(Houses[id][Houses_Owner], "Unknown", true) && strcmp(Houses[id][Houses_Gang], "Unknown", true))
			{
				new
					string[MAX_LANG_VALUE_STRING * 2],
					temp[MAX_LANG_VALUE_STRING],
					rent_string[MAX_LANG_VALUE_STRING],
					price;

				price = Houses[id][Houses_Cost] + Houses[id][Houses_Buyout];

				if (!strcmp(Houses[id][Houses_RentName], "Unknown", true)) {
					Lang_GetPlayerText(playerid, "HOUSING_RENT_COST", rent_string, _, Houses[id][Houses_RentCost]);
				} else {
					Lang_GetPlayerText(playerid, "HOUSING_RENT_CURRENT", rent_string, _, Houses[id][Houses_RentName]);
				}

				if (strcmp(Houses[id][Houses_Owner], ret_GetPlayerName(playerid), true))
				{
					Lang_GetPlayerText(playerid, "HOUSING_DIALOG_INFO_OWNER", string, _, Houses[id][Houses_Owner]);
					Lang_GetPlayerText(playerid, "HOUSING_DIALOG_INFO", temp, _,
					                   Houses[id][Houses_Gang], price, Houses[id][Houses_UpKeep],
					                   Houses[id][Houses_UpKeepLeft], house_GetUpKeepMax(id));

					strcat(string, temp);

					if (Houses[id][Houses_Rentabil] == 1) {
						strcat(string, rent_string, sizeof(string));
					}

					Dialog_Open(playerid, Dialog:HouseInfo, DIALOG_STYLE_MSGBOX,
					            Houses[id][Houses_Name],
					            string,
					            "HOUSING_DIALOG_BUTTON_ACTIONS", "HOUSING_DIALOG_BUTTON_CANCEL");
					return 1;
				}
				else
				{
					Lang_GetPlayerText(playerid, "HOUSING_DIALOG_INFO", string, _, price, Houses[id][Houses_UpKeep], Houses[id][Houses_UpKeepLeft], house_GetUpKeepMax(id));
					strcat(string, rent_string, sizeof(string));

					Dialog_Open(playerid, Dialog:HouseInfo, DIALOG_STYLE_MSGBOX,
					            Houses[id][Houses_Name],
					            string,
					            "HOUSING_DIALOG_BUTTON_ACTIONS", "HOUSING_DIALOG_BUTTON_CANCEL");
					return 1;
				}
			}
			else
			{
				Dialog_Open(playerid, Dialog:HouseInfo, DIALOG_STYLE_MSGBOX,
				            Houses[id][Houses_Name],
				            "HOUSING_DIALOG_INFO_NO_OWNER",
				            "HOUSING_DIALOG_BUTTON_ACTIONS", "HOUSING_DIALOG_BUTTON_CANCEL",
				            Houses[id][Houses_Cost],
				            Houses[id][Houses_UpKeep]);
				return 1;
			}
		}
		else if (player_vw == Houses[id][Houses_VirtualWorld] && IsPlayerInRangeOfPoint(playerid, 2, Houses[id][Houses_InteriorX], Houses[id][Houses_InteriorY], Houses[id][Houses_InteriorZ]))
		{
			SetPlayerPosToHouse(playerid, id);
			SetPlayerToHouseID(playerid,-1);
			return 1;
		}
	}
	return 0;
}

static stock housing_GetLabelString(houseid, Lang:lang, string[], const size = sizeof(string))
{
	Lang_GetText(lang, "HOUSING_3DTEXT", string, size,
	             Houses[houseid][Houses_Name],
	             Houses[houseid][Houses_Cost]);

	if (strcmp(Houses[houseid][Houses_Owner], "Unknown", false)) {
		Lang_GetText(lang, "HOUSING_3DTEXT_OWNER", string, size,
		             string,
		             Houses[houseid][Houses_Owner]);
	}

	if (strcmp(Houses[houseid][Houses_Gang], "Unknown", false)) {
		Lang_GetText(lang, "HOUSING_3DTEXT_GANG", string, size,
		             string,
		             Houses[houseid][Houses_Gang]);
	}

	if (strcmp(Houses[houseid][Houses_RentName], "Unknown", false)) {
		Lang_GetText(lang, "HOUSING_3DTEXT_RENT", string, size,
		             string,
		             Houses[houseid][Houses_RentName]);
	}
}

static stock housing_DestroyPlayerLabel(playerid, id)
{
	DestroyDynamic3DTextLabel(gLabelID[id][playerid]);
	gLabelID[id][playerid] = Text3D:INVALID_3DTEXT_ID;
}

static stock housing_CreatePlayerLabel(playerid, id)
{
	new string[MAX_LANG_VALUE_STRING * 4];
	housing_GetLabelString(id, Lang_GetPlayerLang(playerid), string);

	gLabelID[id][playerid] = CreateDynamic3DTextLabel(string, COLOR_WHITE,
		Houses[id][Houses_PickupX], Houses[id][Houses_PickupY], Houses[id][Houses_PickupZ] + 0.6,
		HouseDistanceOfShowLabel, .testlos = 1, .playerid = playerid);
}

stock housing_UpdatePlayerLabel(playerid, id)
{
	new string[MAX_LANG_VALUE_STRING * 4];
	housing_GetLabelString(id, Lang_GetPlayerLang(playerid), string);
	UpdateDynamic3DTextLabelText(gLabelID[id][playerid], COLOR_WHITE, string);
}

stock housing_UpdateLabel(id)
{
	foreach (new playerid : Player) {
		housing_UpdatePlayerLabel(playerid, id);
	}
}

stock housing_RenameOwner(const old_name[MAX_PLAYER_NAME+1], const new_name[MAX_PLAYER_NAME+1])
{
	for (new i = 0; i < sizeof(Houses); i++)
	{
		if (!strcmp(Houses[i][Houses_Owner], old_name, true))
		{
			strcpy(Houses[i][Houses_Owner], new_name, MAX_PLAYER_NAME);
			housing_UpdateLabel(i);
			return 1;
		}
	}
	return 0;
}

stock house_Free(houseid)
{
	strcpy(Houses[houseid][Houses_Owner], "Unknown", MAX_PLAYER_NAME);
	strcpy(Houses[houseid][Houses_Gang], "Unknown", MAX_GANG_NAME);
	Houses[houseid][Houses_Buyout] = 0;
	Houses[houseid][Houses_Lock] = 0;
	Houses[houseid][Houses_UpKeepLeft] = 0;

	Streamer_SetIntData(STREAMER_TYPE_MAP_ICON, house_icon[houseid], E_STREAMER_TYPE, 31);
	housing_UpdateLabel(houseid);
}

stock IsPlayerHouse(playerid, houseid) {
	if (houseid < 0) {
		return 0;
	}

	new playername[MAX_PLAYER_NAME + 1];
	GetPlayerName(playerid, playername, sizeof(playername));

	if (strcmp(playername, Houses[houseid][Houses_Owner], true)) {
		return 0;
	}

	return 1;
}

stock house_GetName(id)
{
	new name[MAX_NAME];
	strcpy(name, Houses[id][Houses_Name]);
	return name;
}

stock house_GetOwner(id)
{
	new name[MAX_PLAYER_NAME];
	strcpy(name, Houses[id][Houses_Owner]);
	return name;
}

stock house_GetRenter(id)
{
	new name[MAX_PLAYER_NAME];
	strcpy(name, Houses[id][Houses_RentName]);
	return name;
}

stock house_GetUpKeepLeft(id)
{
	return Houses[id][Houses_UpKeepLeft];
}

stock house_GetUpKeep(id)
{
	return Houses[id][Houses_UpKeep];
}

stock house_GetUpKeepMax(id)
{
	return Houses[id][Houses_UpKeep] * HouseUpKeepRatio;
}

stock house_GetCount()
{
	return sizeof(Houses);
}

forward house_ArmourUpgrade_Used(playerid);
public house_ArmourUpgrade_Used(playerid)
{
	DeletePVar(playerid, "house_ArmourUpgrade_Used");
}

forward house_HealUpgrade_Used(playerid);
public house_HealUpgrade_Used(playerid)
{
	DeletePVar(playerid, "house_HealUpgrade_Used");
}
