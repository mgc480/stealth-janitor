#include "IntroState.h"

IntroState::IntroState(StateHandler* handler, sf::RenderWindow * window) : GameState("intro_state", "lua/intro.lua", handler, window){

}

IntroState::~IntroState(void){

}

void IntroState::update(double delta){
	GameState::update(delta);
}