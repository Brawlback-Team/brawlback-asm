#ifndef PROJECTMCODES_PATTERNMANAGER_H
#define PROJECTMCODES_PATTERNMANAGER_H

enum RPS {
    Null = 0x0,
    Attack = 0x1,
    Grab = 0x2,
    Defend = 0x3
};

#define PATTERN_MAN_LENGTH 5

class PatternManager {
public:
    PatternManager() {};

    void clearAll();
    void clear(int player);
    void pushNew(int player, signed char option);
    RPS calcOption(int player, int lookAmount);
    float calcOptionConfidence(int player, int lookAmount);

    void plusOne(int player);
    float average(int player, int lookAmount);
    float get(int player);
private:
    char playerRPS[4][PATTERN_MAN_LENGTH] = {
        {0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0}
    };
    signed char indexes[4] = {0, 0, 0, 0};
    void runCalc(int * attackChance, int * grabChance, int * defendChance, int player, int lookAmount);
};

void PatternManager::clearAll() {
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < PATTERN_MAN_LENGTH; j++) {
            playerRPS[i][j] = RPS::Null;
        }
        indexes[i] = 0;
    }
}

void PatternManager::clear(int player) {
    for (int j = 0; j < PATTERN_MAN_LENGTH; j++) {
        playerRPS[player][j] = RPS::Null;
    }
    indexes[player] = 0;
}

void PatternManager::pushNew(int player, signed char option) {
    indexes[player] ++;
    if (indexes[player] > PATTERN_MAN_LENGTH) indexes[player] = 0;
    playerRPS[player][indexes[player]] = option;
}

void PatternManager::runCalc(int * attackChance, int * grabChance, int * defendChance, int player, int lookAmount) {
    int value = PATTERN_MAN_LENGTH;
    int idx = indexes[player];
    value -= (PATTERN_MAN_LENGTH - lookAmount);
    while (value > 0) {
        switch (playerRPS[player][idx]) {
            case RPS::Attack:
                *attackChance += value;
                break;
            case RPS::Defend:
                *defendChance += value;
                break;
            case RPS::Grab:
                *grabChance += value;
                break;
            default:
                break;
        }
        idx --;
        if (idx < 0) idx = PATTERN_MAN_LENGTH;
        value --;
    }
}

RPS PatternManager::calcOption(int player, int lookAmount) {
    int attackChance = 0;
    int grabChance = 0;
    int defendChance = 0;
    runCalc(&attackChance, &grabChance, &defendChance, player, lookAmount);
    
    if (attackChance > grabChance && attackChance > defendChance) return RPS::Attack;
    if (grabChance > attackChance && grabChance > defendChance) return RPS::Grab;
    if (defendChance > grabChance && defendChance > attackChance) return RPS::Defend;
    return RPS::Null;
}

float PatternManager::calcOptionConfidence(int player, int lookAmount) {
    int attackChance = 0;
    int grabChance = 0;
    int defendChance = 0;
    runCalc(&attackChance, &grabChance, &defendChance, player, lookAmount);

    float maxAmount = (lookAmount * (lookAmount + 1) / 2);
    if (maxAmount == 0) maxAmount = 1;

    if (attackChance > grabChance && attackChance > defendChance) return (float) attackChance / maxAmount;
    if (grabChance > attackChance && grabChance > defendChance) return (float) grabChance / maxAmount;
    if (defendChance > grabChance && defendChance > attackChance) return (float) defendChance / maxAmount;
    return 0;
}

float PatternManager::average(int player, int lookAmount) {
    int value = PATTERN_MAN_LENGTH;
    int idx = indexes[player];
    value -= (PATTERN_MAN_LENGTH - lookAmount);
    float total = 0;
    while (value >= 0) {
        total += playerRPS[player][idx];
        idx --;
        if (idx < 0) idx = PATTERN_MAN_LENGTH;
        value --;
    }
    return (total / (lookAmount + 1));
}

void PatternManager::plusOne(int player) {
    playerRPS[player][indexes[player]] += 1;
}

float PatternManager::get(int player) {
    return playerRPS[player][indexes[player]];
}


#endif //PROJECTMCODES_PATTERNMANAGER_H
