#pragma once
#include "GameState.h"

class IntroState : public GameState{

public:
	IntroState(StateHandler *, sf::RenderWindow *);
	~IntroState(void);
	void update(double delta_time);
};