#pragma once

struct Position {
    float xPos;
    float yPos;
    float zPos;
};

class soPostureModuleImpl {
public:
    static void getPos(Position* destination, soPostureModuleImpl* source);

    char _spacer[0xC];
	//0xC
	float xPos;
	//0x10
	float yPos;
	//0x14
	float zPos;
	//0x18
	float prevXPos;
	//0x1C
	float prevYPos;
	//0x20
	float prevZPos;
	char _spacer2[0x3C - 0x20 - 4];

	//0x3C
	float scale;

	//0x40
	//right = 1.0, left = -1.0
	float direction;

    char _spacer3[0x5c - 0x44];

	//0x5C
	//a pointer to a vector with Rotations
    int* rotation;

	char _spacer4[0x68 - 0x58];

	//0x68
	float ownerScale;
};

#define _getPos_PostureModuleImpl ((void (*)(Position *destination, soPostureModuleImpl* source)) 0x8072fa9c)
