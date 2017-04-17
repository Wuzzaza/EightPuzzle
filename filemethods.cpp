#include "filemethods.h"

FileMethods::FileMethods()
{

}


bool FileMethods::fileExists(QString fileName) {
    return QFile::exists(basePath + fileName);
}

bool FileMethods::createFile(QString filename) {
    if (fileExists(filename)) {
        QFile f(basePath + filename);
        if (!f.isWritable()) return false;

        bool fopen =
                f.open(QIODevice::WriteOnly | QIODevice::Truncate);

        if (!fopen) return false;

        f.flush();
        f.close();
    } else {
        QFile f(basePath + filename);
        bool fopen =
                f.open(QIODevice::WriteOnly);

        if (!fopen) return false;

        f.flush();
        f.close();
    }
    return true;
}

QString FileMethods::readFile(QString fileName) {
    if (!fileExists(fileName)) return "";

    QFile f(basePath + fileName);
    //if (!f.isReadable()) return "";

    f.open(QIODevice::ReadOnly);

    QByteArray qba = f.readAll();
    f.close();

    QString str(qba);

    return str;
}

void* FileMethods::readFileBinary(QString fileName, int* size) {
    if (!fileExists(fileName)) return NULL;

    QFile f(basePath + fileName);
    //if (!f.isReadable()) return "";

    f.open(QIODevice::ReadOnly);

    char *data = new char[f.size()];

    int readSize = f.read(data, f.size());
    f.close();

    if (size != 0) *size = readSize;

    return data;
}

bool FileMethods::rewriteFile(QString fileName, QString content) {
    if (!fileExists(fileName)) {
        bool cf = createFile(fileName);
        if (!cf) return false;
    }

    QFile f(basePath + fileName);
    //if (!f.isWritable()) return false;

    if (!f.open(QIODevice::WriteOnly | QIODevice::Truncate))
        return false;

    f.write(content.toUtf8());
    f.flush();
    f.close();

    return true;
}

bool FileMethods::rewriteFile(QString fileName, void *data, int length) {
    if (!fileExists(fileName)) {
        bool cf = createFile(fileName);
        if (!cf) return false;
    }

    QFile f(basePath + fileName);
    //if (!f.isWritable()) return false;

    if (!f.open(QIODevice::WriteOnly | QIODevice::Truncate))
        return false;

    f.write((char*)data, length);
    f.flush();
    f.close();

    return true;
}

bool FileMethods::appendFile(QString fileName, QString content) {
    if (!fileExists(fileName)) {
        bool cf = createFile(fileName);
        if (!cf) return false;
    }

    QFile f(basePath + fileName);
    //if (!f.isWritable()) return false;

    if (!f.open(QIODevice::WriteOnly | QIODevice::Append))
        return false;

    f.write(content.toUtf8());
    f.flush();
    f.close();

    return true;
}

bool FileMethods::appendFile(QString fileName, void *data, int length) {
    if (!fileExists(fileName)) {
        bool cf = createFile(fileName);
        if (!cf) return false;
    }

    QFile f(basePath + fileName);
    //if (!f.isWritable()) return false;

    if (!f.open(QIODevice::WriteOnly | QIODevice::Append))
        return false;

    f.write((char*)data, length);
    f.flush();
    f.close();

    return true;
}
