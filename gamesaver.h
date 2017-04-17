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

    Q_INVOKABLE void saveGame();
    Q_INVOKABLE void loadGame();

    void initGameField(QObject *gameField);

private:
    FileMethods fileMetods;
    QObject *gameField = nullptr;
    QVariantMap saveGameData;

};

#endif // GAMESAVER_H
