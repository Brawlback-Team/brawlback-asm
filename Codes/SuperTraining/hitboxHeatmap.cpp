#include "Assembly.h"
#include "Memory.h"
#include "Brawl/FT/Fighter.h"
#include "Containers/vector.h"
#include "Graphics/Drawable.h"

#include "./hitboxHeatmap.h"
#include "./FudgeMenu.h"

int currPlayerNum = -1;
int currPlayerAction = -1;
float currPlayerAnimFrame = -1;
char framesAfterActionableGround[4] = { 0, 0, 0, 0 };
bool playersProcessed[4] = { false, false, false, false };

FudgeAIHitbox fudgeAI;

// #define BUBBLE_MAX 50
// char bubbleCount = 0;
INJECTION("getFighterPlayerNum", 0x80839214, R"(
  SAVE_REGS
  bl storePlayerData
  RESTORE_REGS
  mr r26, r3
)");

// display/[clCapsule] [Eon]
INJECTION("display_clCapsule", 0x8070d2a8, R"(
  stwu r1, -0x20(r1)
	mflr r0
	stw r0, 0x24(r1)
	stmw r28, 0x10(r1)
	#Stack Layout
	#	0	4	8	C
	#00 [  ][  ][  ][  ]
	#10 [   r28-r31    ]
	#20 [  ][lr][  ][  ]
	mr r28, r3 #Sphere Object
	mr r29, r4 #ViewingMatrix
	mr r30, r5 #Colour1
	mr r31, r6 #Colour2

	#DisplayBubble(Double Radius, Float[3][4] ScaleMatrix, Float[3] Pos1, Float[3] Pos2, Byte[4] Colour1, Byte[4] Colour2, Float[3][4] ViewingMatrix)
	#0x80541fa0
	lfs f1, 0xC(r28) #radius
	
	addi r3, r28, 0x40 	#ScaleMatrix
	addi r4, r28, 0 	#Pos1
	addi r5, r28, 0x34 	#Pos2
	mr r6, r30
	mr r7, r31
	mr r8, r29

	lis r12, 0x8054
	ori r12, r12, 0x1fa0
	mtctr r12
	bctrl

  # call to StoreRenderingData
  lfs f1, 0xC(r28) #radius
	addi r3, r28, 0x40 	#ScaleMatrix
	addi r4, r28, 0 	#Pos1
	addi r5, r28, 0x34 	#Pos2
	mr r6, r30
	mr r7, r31
	mr r8, r29
  bl storeRenderingData
	

	lmw r28, 0x10(r1)
	lwz r0, 0x24(r1)
	mtlr r0
	addi r1, r1, 0x20
	blr
)");

// display/[clSphere] [Eon]
INJECTION("display_clSphere", 0x8070de4c, R"(
	stwu r1, -0x50(r1)
	mflr r0
	stw r0, 0x54(r1)
	stmw r28, 0x40(r1)
	#Stack Layout
	#	0	4	8	C
	#00 required stuff to leave alone
	#10 [‾‾‾‾‾‾‾‾‾‾‾‾‾‾]
	#20 [  3x4 Matrix  ]
	#30 [______________]
	#40 [   r28-r31    ]
	#50   	[lr]
	mr r28, r3 #Sphere Object
	mr r29, r4 #ViewingMatrix
	mr r30, r5 #Colour1
	mr r31, r6 #Colour2

	#PSMTXIdentity(Matrix* input)
	#0x801EC158
	addi r3, r1, 0x10
	lis r12, 0x801e
	ori r12, r12, 0xc158
	mtctr r12
	bctrl 

	#DisplayBubble(Double Radius, Float[3][4] ScaleMatrix, Float[3] Pos1, Float[3] Pos2, Byte[4] Colour1, Byte[4] Colour2, Float[3][4] ViewingMatrix)
	#0x80541FA0
	lfs f1, 0xC(r28) 	#radius

	addi r3, r1, 0x10 	#ScaleMatrix
	addi r4, r28, 0 	#Pos1
	addi r5, r28, 0x34 	#Pos2
	mr r6, r30
	mr r7, r31
	mr r8, r29

	
	lis r12, 0x8054
	ori r12, r12, 0x1fa0
	mtctr r12
	bctrl
  
  # call to storeRenderingData
  lfs f1, 0xC(r28) 	#radius
	addi r3, r1, 0x10 	#ScaleMatrix
	addi r4, r28, 0 	#Pos1
	addi r5, r28, 0x34 	#Pos2
	mr r6, r30
	mr r7, r31
	mr r8, r29
  bl storeRenderingData

	lmw r28, 0x40(r1)
	lwz r0, 0x54(r1)
	mtlr r0
	addi r1, r1, 0x50
	blr
)");

// hurtboxes
#define vulnerableColour 0xFFFF0080
#define grabInvulnerableColour 0xFFFF8080
#define invincibleColour 0x00FF0080
#define intangibleColour 0x0000FF80
// hitboxes
#define hitboxColour 0xFF000080
#define grabboxColour 0xFF00FF80
#define shieldboxColour 0x00FFFF80
#define reflectorboxColouor 0x00FF8080
#define absorberboxColour 0x0080FF80
#define searchboxColour 0xFFFFFF80

#define _GetPlayerNo_aiChrIdx ((int (*)(char* chrIdx)) 0x808fd68c)
extern TrainingData playerTrainingData[];
#define displayBubble ((void (*)(double radius, float scaleMatrix[3][4], float pos1[3], float pos2[3], unsigned int* colour1, unsigned int* colour2, float viewingMatrix[3][4])) 0x80541fa0)

// void initializeAITargetingData(int currPlayerAction, soPostureModuleImpl* postureModule) {
//   if (((currPlayerAction >= 0x24 && currPlayerAction <= 0x38) || currPlayerAction >= 0x112)) {
//     if (fudgeAI.overwrite) {
//       if (fudgeAI.xMin != 0) {
//         renderables.items.tick.push(new RectOutline(
//           0,
//           60,
//           GXColor(0xFFFF0088),
//           fudgeAI.yMax,
//           fudgeAI.yMin,
//           fudgeAI.xMin,
//           fudgeAI.xMax,
//           42,
//           false
//         ));
//       }

//       OSReport("xPos, yPos: %.3f; %.3f\n", postureModule->xPos, postureModule->yPos);
//       fudgeAI.xMin = 500;
//       fudgeAI.yMin = 500;
//       fudgeAI.xMax = -500;
//       fudgeAI.yMax = -500;
//       fudgeAI.xOrigin = postureModule->xPos;
//       fudgeAI.yOrigin = postureModule->yPos;
//       fudgeAI.overwrite = false;
//     }
//   } else {
//     fudgeAI.overwrite = true;
//   }
// }
// void collectAITargetingData(double radius, float pos1[3], float pos2[3], unsigned int* colour) {
//   if (currPlayerNum == 0 && !playersProcessed[currPlayerNum] && playerTrainingData[currPlayerNum].heatmapOpts.active && (*colour == hitboxColour || *colour == grabboxColour)) {
//     OSReport("R: %.3f; XOffs: %.3f; YOffs: %.3f; ZOffs: %.3f\n", radius, pos1[0] - fudgeAI.xOrigin, pos1[1] - fudgeAI.yOrigin, pos1[2]);
//     if (-radius < pos1[2] && pos1[2] < radius) {
//       if (pos1[0] - radius < fudgeAI.xMin) fudgeAI.xMin = pos1[0] - radius;
//       if (pos1[0] + radius > fudgeAI.xMax) fudgeAI.xMax = pos1[0] + radius;
//       if (pos1[1] - radius < fudgeAI.yMin) fudgeAI.yMin = pos1[1] - radius;
//       if (pos1[1] + radius > fudgeAI.yMax) fudgeAI.yMax = pos1[1] + radius;
//     }
//     if (-radius < pos2[2] && pos2[2] < radius) {
//       if (pos2[0] - radius < fudgeAI.xMin) fudgeAI.xMin = pos2[0] - radius;
//       if (pos2[0] + radius > fudgeAI.xMax) fudgeAI.xMax = pos2[0] + radius;
//       if (pos2[1] - radius < fudgeAI.yMin) fudgeAI.yMin = pos2[1] - radius;
//       if (pos2[1] + radius > fudgeAI.yMax) fudgeAI.yMax = pos2[1] + radius;
//     }
//     fudgeAI.trueXMin = fudgeAI.xMin - fudgeAI.xOrigin;
//     fudgeAI.trueYMin = (fudgeAI.yMin - fudgeAI.yOrigin) * -1;
//     fudgeAI.width = (fudgeAI.xMax - fudgeAI.xMin) / 2;
//     fudgeAI.height = (fudgeAI.yMax - fudgeAI.yMin) / 2;
//   }
// }
void displayFudgeAIData() {
  auto ro = new RectOutline(
    0,
    1,
    fudgeAI.color,
    fudgeAI.yMax,
    fudgeAI.yMin,
    fudgeAI.xMin,
    fudgeAI.xMax,
    42,
    false
  );
  ro->autoTimer = false;
  renderables.items.tick.push(ro);
}

extern "C" {
  void storePlayerData(Fighter* fighter) {
    currPlayerNum = _GetPlayerNo_aiChrIdx(&fighter->getOwner()->ftInputPtr->cpuIdx);
    playersProcessed[currPlayerNum] = false;
    currPlayerAction = fighter->modules->statusModule->action;
    currPlayerAnimFrame = fighter->modules->motionModule->mainAnimationData.animFrame;
    if (currPlayerAction == 0x0 || currPlayerAction == 0x1 || currPlayerAction == 0x12 || currPlayerAction == 0x1B || currPlayerAction == 0x49 || ((currPlayerAction == 0x16 || currPlayerAction == 0x17) && currPlayerAnimFrame > 4)) {
      framesAfterActionableGround[currPlayerNum] = 0;
      fudgeAI.overwrite = true;
    } else if (framesAfterActionableGround[currPlayerNum] < 255) {
      framesAfterActionableGround[currPlayerNum] += 1;
    }
    // if (currPlayerNum == 0) {
    //   displayFudgeAIData();
    //   initializeAITargetingData(currPlayerAction, fighter->modules->postureModule);
    // }
  }
  void storeRenderingData(double radius, float scaleMatrix[3][4], float pos1[3], float pos2[3], unsigned int* colour1, unsigned int* colour2, float viewingMatrix[3][4]) {
    // collectAITargetingData(radius, pos1, pos2, colour1);
    
    if (!playersProcessed[currPlayerNum] && playerTrainingData[currPlayerNum].heatmapOpts.active && *colour1 == hitboxColour) {
      auto opts = playerTrainingData[currPlayerNum].heatmapOpts;
      auto currData = ((*opts.data).size() == 0) ? nullptr : (*opts.data)[(*opts.data).size() - 1];
      if (currData == nullptr || currData->frame < framesAfterActionableGround[currPlayerNum]) {
        // this process of manually allocating data is done to test to see if we ARE able to do so in the first place
        // without it, we might end up crashing the game by calling a constructor and trying to write to a location
        // that is already occupied by something else.
        //
        // we test with more space than necessary to reduce the risk that there is too much data for an un-"tested"
        // function to allocate data
        void* test = malloc((sizeof(HitboxDataFrame) + sizeof(HitboxData) * 4) * 8);

        while (test == nullptr && (*opts.data).size() > 0) {
          // bubbleCount -= (*opts.data)[0]->hitboxes.size();
          (*opts.data)[0]->hitboxes.clear();
          (*opts.data).erase(0);
          test = malloc(sizeof(HitboxDataFrame) + sizeof(HitboxData));
        } 
        
        if (test != nullptr) {
          free(test);
          (*opts.data).push(new HitboxDataFrame {
            vector<HitboxData *>(),
            framesAfterActionableGround[currPlayerNum],
            opts.lifetime
          });
        } else {
          free(test);
          return;
        }
        currData = (*opts.data)[(*opts.data).size() - 1];
      }
      else if (currData->hitboxes[0]->pos1[0] == pos1[0] && currData->hitboxes[0]->pos1[1] == pos1[1]) {
        playersProcessed[currPlayerNum] = true;
        return;
      }

      currData->life = opts.lifetime;
      currData->frame = framesAfterActionableGround[currPlayerNum];

      HitboxData* hbd = (HitboxData*) malloc(sizeof(HitboxData));
      
      // OSReport("bubble count: %d\n", bubbleCount);
      while (hbd == nullptr && (*opts.data).size() > 0) {
        // bubbleCount -= (*opts.data)[0]->hitboxes.size();
        (*opts.data)[0]->hitboxes.clear();
        (*opts.data).erase(0);
        hbd = (HitboxData*) malloc(sizeof(HitboxData));
      } 
      
      if (hbd != nullptr) {
        hbd->fillInData(
          radius,
          scaleMatrix,
          pos1,
          pos2,
          *colour1,
          *colour2
        );
        currData->hitboxes.push(hbd);
      }
    }
  }
};

void renderAllStoredHitboxes() {
  startNormalDraw();
  for (int i = 0; i < 4; i++) {
    if (!playerTrainingData[i].heatmapOpts.active) continue;
    auto heatmapOpts = playerTrainingData[i].heatmapOpts;
    auto size = (*heatmapOpts.data).size();
    if (size == 0) continue;
    for (int j = size - 1; j >= 0; j--) {
      auto currData = (*heatmapOpts.data)[j];
      auto hbVecSize = currData->hitboxes.size();
      for (int k = 0; k < hbVecSize; k++) {
        auto hb = currData->hitboxes[k];
        auto colour = hb->colour1;
        int changeAmount = (float) currData->frame / ((float) heatmapOpts.colorChangeFrame / 255.0);
        if ((int) colour.red - changeAmount < 0) { colour.red = 0; }
        else colour.red -= changeAmount;
        if ((int) colour.blue + changeAmount > 255) { colour.blue = 255; }
        else colour.blue += changeAmount;

        displayBubble(hb->radius, hb->scaleMatrix, hb->pos1, hb->pos2, &colour.value, &colour.value, CAMERA_MANAGER->cameras[0].modelView);


        // Assists fudge with AI stuff
        if (i == 0) {
          
        }
      }
    }
  }
}
void storedHitboxTick() {
  for (int i = 0; i < 4; i++) {
    auto heatmapOpts = playerTrainingData[i].heatmapOpts;
    auto size = (*heatmapOpts.data).size();
    if (size == 0) continue;
    for (int j = size - 1; j >= 0; j--) {
      auto currData = (*heatmapOpts.data)[j];
      if (!playerTrainingData[i].heatmapOpts.active || -- currData->life <= 0) {
        // bubbleCount -= currData->hitboxes.size();
        currData->hitboxes.clear();
        (*heatmapOpts.data).erase(j);
      }
    }
  }
}

