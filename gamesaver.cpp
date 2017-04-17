#include "gamesaver.h"

GameSaver::GameSaver()
{

}

void GameSaver::saveGame()
{
    qDebug("Saving...");

    //saveGameData = QVariant::convert(this->gameField->property("saveGameData"));

    //fileMetods.rewriteFile("savegame",  &(this->gameField->property("saveGameData")), sizeof(this->gameField->property("saveGameData")));
}

void GameSaver::loadGame()
{
    qDebug("Loading...");
}

void GameSaver::initGameField(QObject *gameField)
{
    this->gameField = gameField;
}
