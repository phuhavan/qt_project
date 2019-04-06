#ifndef PERFORM_H
#define PERFORM_H
#include <QObject>
#include <QString>
#include <QDebug>
#include <QtSql>
#include <QFileInfo>
#include <QVector>
#include <QTimer>


class perform : public QObject
{
    Q_OBJECT
public:
    explicit perform(QObject *parent = 0);

signals:
    void sendToQml(int order);
    void sendDataToQml(int type, int lesson, int now, int privacy);
    void syncData(QList<QString> term, QList<QString> definition);
    void syncData_heli(QList<QString> term_heli, QList<QString> definition_heli);
    void syncData_scatter(QList<QString> str_pf, QList<int> key_pf);
    void syncData_synonym(QList<QString> c1, QList<QString> c2, QList<QString> c3, QList<QString> c4, QList<QString> c5, QList<QString> c6, QList<QString> c7, QList<QString> c8, QList<QString> c9, QList<QString> c10);


public slots:
    void check_member(QString username, QString password);
    void check_choose_lesson(int type, int lesson, int privacy);
    void check_lesson_student(int unit, int lesson);
    void back_to_main();

private:
    QSqlDatabase login, vocab, synonym;
    void check_oof();

    int numberOfQues;
    QList<QString> Term;
    QList<QString> Definition;
    QList<QString> Term_heli;
    QList<QString> Definition_heli;
    QList<QString> C1,C2,C3,C4,C5,C6,C7,C8,C9,C10;

    QList<QString> Ques_str;
    QList<int> Ques_key;

public:
    int oof = 0; // order of form
    int oof_main = 1;
    int login_pass = 0;

};

#endif // PERFORM_H
