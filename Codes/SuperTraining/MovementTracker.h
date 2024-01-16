#ifndef PROJECTMCODES_MOVEMENTTRACKER_H
#define PROJECTMCODES_MOVEMENTTRACKER_H

#define MOV_NONE 0
#define MOV_IDLE 1
#define MOV_WALK 2
#define MOV_RUN 3
#define MOV_DASH 4
#define MOV_DASHTURN 5
#define MOV_CROUCH 6
#define MOV_JUMP 7
#define MOV_DJUMP 8
#define MOV_FALL 9
#define MOV_SHIELD 10
#define MOV_AIRDODGE 11
#define MOV_ROLL 12
#define MOV_TECH 13
#define MOV_ATTACK 14
#define MOV_GRAB 15

#define TRACK_COUNT 0xC
#define ACTION_LENGTH 0xC

class MovementTracker {
public:
  MovementTracker() {};

  void reset();
  void trackAction(int action);
  void pushSet();
  float approxChance(float levelValue);

private:
  unsigned char currSequence[ACTION_LENGTH] = {0,0,0,0,0,0,0,0,0,0,0,0};
  unsigned char idx = 0;
  unsigned char actionTracker[TRACK_COUNT][ACTION_LENGTH] = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  };
  unsigned char trackIdx = 0;
  bool flushNext = false;
};

void MovementTracker::reset() {
  for (int i = 0; i < TRACK_COUNT; i++) {
    for (int j = 0; j < ACTION_LENGTH; j++) {
      actionTracker[i][j] = 0;
    }
  } 
  for (int i = 0; i < ACTION_LENGTH; i++) {
    currSequence[i] = 0;
  }
  idx = 0;
  trackIdx = 0;
};

unsigned char actionToMov(int action) {
  if (0x24 <= action && action <= 0x33) return MOV_ATTACK;
  switch (action) {
    // case 0x0: return MOV_IDLE;
    case 0x1: return MOV_WALK;
    case 0x4: return MOV_RUN;
    case 0x3: return MOV_DASH;
    case 0x7: return MOV_DASHTURN;
    case 0x11: return MOV_CROUCH;
    case 0xB: return MOV_JUMP;
    case 0xC:
    case 0xD: return MOV_DJUMP;
    case 0xE:
    case 0xF: return MOV_FALL;
    case 0x1A: return MOV_SHIELD;
    case 0x21: return MOV_AIRDODGE;
    case 0x1E:
    case 0x1F:
    case 0x20: return MOV_ROLL;
    case 0x60: 
    case 0x61: return MOV_TECH;
    case 0x34:
    case 0x36:
    case 0x38: return MOV_GRAB;
    default:
      return MOV_NONE;
  }
};

void MovementTracker::trackAction(int action) {
  if (flushNext) {
    for (int i = 0; i < ACTION_LENGTH; i++) currSequence[i] = 0;
    trackIdx ++;
    if (trackIdx >= TRACK_COUNT) trackIdx = 0; 
    flushNext = false;
  }
  char MOV = actionToMov(action);
  if (MOV == MOV_ATTACK || MOV == MOV_GRAB) pushSet();
  else if (MOV != MOV_NONE) currSequence[idx++] = MOV;
  if (idx >= ACTION_LENGTH) idx = 0;
};

void MovementTracker::pushSet() {
  if (currSequence[1] == 0) return;
  int copyIdx = idx - 1;
  for (int iter = 0; iter < ACTION_LENGTH; iter++) {
    if (copyIdx < 0) copyIdx = ACTION_LENGTH - 1;
    actionTracker[trackIdx][iter] = currSequence[copyIdx];
    copyIdx --;
  }
  // OSReport("Pushed Set @ %d:\n", trackIdx);
  // for (int iter = 0; iter < ACTION_LENGTH; iter++) {
  //   OSReport("%d, ", actionTracker[trackIdx][iter]);
  // }
  // OSReport("\n");
  idx = 0;
  flushNext = true;
};

float MovementTracker::approxChance(float CPULevel) {
  int maxScore = 0; 
  int score = 0;
  int scoreToGive = 0xC * 0xC;
  int lookAmount = (CPULevel / 100) * TRACK_COUNT;
  int tracker = trackIdx - 1;
  for (int i = 0; i < TRACK_COUNT; i++) {
    if (tracker < 0) i = TRACK_COUNT - 1;
    if (actionTracker[i][0] == MOV_NONE) break;
    int lookupIdx = idx - 1;
    bool foundPattern = false;
    for (int iter = 1; iter < ACTION_LENGTH; iter++) {
      maxScore += scoreToGive;
      scoreToGive --;

      if (currSequence[lookupIdx] == actionTracker[i][iter] && actionTracker[i][iter] != 0) {
        score += scoreToGive;
        foundPattern = true;
      } else if (foundPattern) {
        break;
      }

      if (!foundPattern) continue;
      lookupIdx --;
      if (lookupIdx < 0) lookupIdx = ACTION_LENGTH - 1;
    }
    tracker --;
  }
  if (maxScore == 0) return 0;
  return (float) score / (float) maxScore;
};

#endif // PROJECTMCODES_MOVEMENTTRACKER_H