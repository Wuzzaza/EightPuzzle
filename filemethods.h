#ifndef FILEMETHODS_H
#define FILEMETHODS_H

#include <QString>
#include <QFile>

class FileMethods
{
private:
    QString basePath;
public:
    FileMethods();

    bool fileExists(QString fileName);
    bool createFile(QString filename);
    QString readFile(QString fileName);
    void* readFileBinary(QString fileName, int *size = 0);
    bool rewriteFile(QString fileName, QString content);
    bool rewriteFile(QString fileName, void *data, int length);
    bool appendFile(QString fileName, QString content);
    bool appendFile(QString fileName, void *data, int length);
    bool deleteFile(QString fileName);
};

#endif // FILEMETHODS_H
