QT -= qt core gui

TARGET = AzukiHeart
CONFIG += c++17
TEMPLATE = lib
VERSION = 0.2.0

LIBS += -L../../libKitsunemimiCommon/src -lKitsunemimiCommon
LIBS += -L../../libKitsunemimiCommon/src/debug -lKitsunemimiCommon
LIBS += -L../../libKitsunemimiCommon/src/release -lKitsunemimiCommon
INCLUDEPATH += ../../libKitsunemimiCommon/include

LIBS += -L../../libKitsunemimiJinja2/src -lKitsunemimiJinja2
LIBS += -L../../libKitsunemimiJinja2/src/debug -lKitsunemimiJinja2
LIBS += -L../../libKitsunemimiJinja2/src/release -lKitsunemimiJinja2
INCLUDEPATH += ../../libKitsunemimiJinja2/include

LIBS += -L../../libKitsunemimiJwt/src -lKitsunemimiJwt
LIBS += -L../../libKitsunemimiJwt/src/debug -lKitsunemimiJwt
LIBS += -L../../libKitsunemimiJwt/src/release -lKitsunemimiJwt
INCLUDEPATH += ../../libKitsunemimiJwt/include

LIBS += -L../../libKitsunemimiCrypto/src -lKitsunemimiCrypto
LIBS += -L../../libKitsunemimiCrypto/src/debug -lKitsunemimiCrypto
LIBS += -L../../libKitsunemimiCrypto/src/release -lKitsunemimiCrypto
INCLUDEPATH += ../../libKitsunemimiCrypto/include

LIBS += -L../../libKitsunemimiJson/src -lKitsunemimiJson
LIBS += -L../../libKitsunemimiJson/src/debug -lKitsunemimiJson
LIBS += -L../../libKitsunemimiJson/src/release -lKitsunemimiJson
INCLUDEPATH += ../../libKitsunemimiJson/include

LIBS += -L../../libKitsunemimiIni/src -lKitsunemimiIni
LIBS += -L../../libKitsunemimiIni/src/debug -lKitsunemimiIni
LIBS += -L../../libKitsunemimiIni/src/release -lKitsunemimiIni
INCLUDEPATH += ../../libKitsunemimiIni/include

LIBS += -L../../libKitsunemimiConfig/src -lKitsunemimiConfig
LIBS += -L../../libKitsunemimiConfig/src/debug -lKitsunemimiConfig
LIBS += -L../../libKitsunemimiConfig/src/release -lKitsunemimiConfig
INCLUDEPATH += ../../libKitsunemimiConfig/include

LIBS += -L../../libKitsunemimiSakuraLang/src -lKitsunemimiSakuraLang
LIBS += -L../../libKitsunemimiSakuraLang/src/debug -lKitsunemimiSakuraLang
LIBS += -L../../libKitsunemimiSakuraLang/src/release -lKitsunemimiSakuraLang
INCLUDEPATH += ../../libKitsunemimiSakuraLang/include

LIBS += -L../../libKitsunemimiNetwork/src -lKitsunemimiNetwork
LIBS += -L../../libKitsunemimiNetwork/src/debug -lKitsunemimiNetwork
LIBS += -L../../libKitsunemimiNetwork/src/release -lKitsunemimiNetwork
INCLUDEPATH += ../../libKitsunemimiNetwork/include

LIBS += -L../../libKitsunemimiSakuraNetwork/src -lKitsunemimiSakuraNetwork
LIBS += -L../../libKitsunemimiSakuraNetwork/src/debug -lKitsunemimiSakuraNetwork
LIBS += -L../../libKitsunemimiSakuraNetwork/src/release -lKitsunemimiSakuraNetwork
INCLUDEPATH += ../../libKitsunemimiSakuraNetwork/include

LIBS += -L../../libKitsunemimiHanamiEndpoints/src -lKitsunemimiHanamiEndpoints
LIBS += -L../../libKitsunemimiHanamiEndpoints/src/debug -lKitsunemimiHanamiEndpoints
LIBS += -L../../libKitsunemimiHanamiEndpoints/src/release -lKitsunemimiHanamiEndpoints
INCLUDEPATH += ../../libKitsunemimiHanamiEndpoints/include

LIBS += -L../../libKitsunemimiHanamiCommon/src -lKitsunemimiHanamiCommon
LIBS += -L../../libKitsunemimiHanamiCommon/src/debug -lKitsunemimiHanamiCommon
LIBS += -L../../libKitsunemimiHanamiCommon/src/release -lKitsunemimiHanamiCommon
INCLUDEPATH += ../../libKitsunemimiHanamiCommon/include

LIBS += -L../../libKitsunemimiHanamiNetwork/src -lKitsunemimiHanamiMessaging
LIBS += -L../../libKitsunemimiHanamiNetwork/src/debug -lKitsunemimiHanamiMessaging
LIBS += -L../../libKitsunemimiHanamiNetwork/src/release -lKitsunemimiHanamiMessaging
INCLUDEPATH += ../../libKitsunemimiHanamiNetwork/include

LIBS += -lssl -lcryptopp -lcrypto

INCLUDEPATH += $$PWD \
               $$PWD/../include

HEADERS += \
    ../include/libAzukiHeart/azuki_send.h \
    ../include/libAzukiHeart/azuki_input.h \
    bind_thread_to_core.h \
    get_thread_mapping.h

SOURCES += \
    azuki_send.cpp \
    azuki_input.cpp \
    bind_thread_to_core.cpp \
    get_thread_mapping.cpp

AZUKI_PROTO_BUFFER = ../../libKitsunemimiHanamiMessages/protobuffers/azuki_messages.proto3

OTHER_FILES += $$AZUKI_PROTO_BUFFER

protobuf_decl.name = protobuf headers
protobuf_decl.input = AZUKI_PROTO_BUFFER
protobuf_decl.output = ${QMAKE_FILE_IN_PATH}/${QMAKE_FILE_BASE}.proto3.pb.h
protobuf_decl.commands = protoc --cpp_out=${QMAKE_FILE_IN_PATH} --proto_path=${QMAKE_FILE_IN_PATH} ${QMAKE_FILE_NAME}
protobuf_decl.variable_out = HEADERS
QMAKE_EXTRA_COMPILERS += protobuf_decl

protobuf_impl.name = protobuf sources
protobuf_impl.input = AZUKI_PROTO_BUFFER
protobuf_impl.output = ${QMAKE_FILE_IN_PATH}/${QMAKE_FILE_BASE}.proto3.pb.cc
protobuf_impl.depends = ${QMAKE_FILE_IN_PATH}/${QMAKE_FILE_BASE}.proto3.pb.h
protobuf_impl.commands = $$escape_expand(\n)
protobuf_impl.variable_out = SOURCES
QMAKE_EXTRA_COMPILERS += protobuf_impl
