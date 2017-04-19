#ifndef GAMESAVER_H
#define GAMESAVER_H

#include <QObject>
#include <QDebug>
#include <QVariantMap>

#include "filemethods.h"



class GameSaver: public QObject
{
    Q_OBJECT

public:
    GameSaver();

    Q_INVOKABLE void saveGame(QVariantList saveGameData);
    Q_INVOKABLE QVariantList loadGame();


private:
    FileMethods fileMetods;
    QVariantList saveGameData;

};

#endif // GAMESAVER_H
