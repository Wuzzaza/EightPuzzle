#include "gamesaver.h"

GameSaver::GameSaver()
{

}

void GameSaver::saveGame(QVariantList saveGameData)
{
    this->saveGameData = saveGameData;
    qDebug("Saving...");
    fileMetods.rewriteFile("savegame", &saveGameData, sizeof(saveGameData)*44);
    qDebug() << sizeof(QVariantList);
}

QVariantList GameSaver::loadGame()
{
    qDebug("Loading...");

    int datasize;
    QVariantList* dataArray;
    char* data = (char*)fileMetods.readFileBinary("savegame", &datasize);
    if (datasize)dataArray = (QVariantList*)data;
    return this->saveGameData;
}

