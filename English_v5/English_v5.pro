TEMPLATE = app

QT += qml quick core sql opengl
#CONFIG += c++11
CONFIG += c++11

SOURCES += main.cpp \
    perform.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    perform.h
