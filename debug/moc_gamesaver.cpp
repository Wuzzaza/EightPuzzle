/****************************************************************************
** Meta object code from reading C++ file 'gamesaver.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.6.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../gamesaver.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gamesaver.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.6.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_GameSaver_t {
    QByteArrayData data[5];
    char stringdata0[42];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GameSaver_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GameSaver_t qt_meta_stringdata_GameSaver = {
    {
QT_MOC_LITERAL(0, 0, 9), // "GameSaver"
QT_MOC_LITERAL(1, 10, 8), // "saveGame"
QT_MOC_LITERAL(2, 19, 0), // ""
QT_MOC_LITERAL(3, 20, 12), // "saveGameData"
QT_MOC_LITERAL(4, 33, 8) // "loadGame"

    },
    "GameSaver\0saveGame\0\0saveGameData\0"
    "loadGame"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GameSaver[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   24,    2, 0x02 /* Public */,
       4,    0,   27,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::QVariantList,    3,
    QMetaType::QVariantList,

       0        // eod
};

void GameSaver::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        GameSaver *_t = static_cast<GameSaver *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->saveGame((*reinterpret_cast< QVariantList(*)>(_a[1]))); break;
        case 1: { QVariantList _r = _t->loadGame();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObject GameSaver::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_GameSaver.data,
      qt_meta_data_GameSaver,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *GameSaver::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GameSaver::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_GameSaver.stringdata0))
        return static_cast<void*>(const_cast< GameSaver*>(this));
    return QObject::qt_metacast(_clname);
}

int GameSaver::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
