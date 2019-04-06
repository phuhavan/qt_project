#include <QDebug>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlComponent>
#include <QQuickView>
#include <perform.h>
#include <QString>

#define Path_to_database_login "../English_v5/data/login/login.db"
#define Path_to_databse_vocab "../English_v5/data/vocab/vocab.db"
#define Path_to_databse_synonym "../English_v5/data/synonym/synonym.db"

perform::perform(QObject *parent) :
    QObject(parent)
{
    QTime time = QTime::currentTime();
    qsrand((uint)time.msec());
    // connecting to login database
    login = QSqlDatabase::addDatabase("QSQLITE", "loginDatabase");
    login.setDatabaseName(Path_to_database_login);


    // connecting to vocabulary database
    vocab = QSqlDatabase::addDatabase("QSQLITE", "vocabDatabase");
    vocab.setDatabaseName(Path_to_databse_vocab);

    // connecting to synonym database
    synonym = QSqlDatabase::addDatabase("QSQLITE", "synonymDatabase");
    synonym.setDatabaseName(Path_to_databse_synonym);

}

void perform::check_oof()
{
    // login form
    if(oof_main == 1)
    {
        if(login_pass == 0)
        {
            oof = 1;
        }
        else if(login_pass == 1)
        {
            oof = 2;
        }
        else
        {
            oof = 3;
        }
    }
    else if(oof_main == 4)
    {
        oof = 4;
    }
    else if(oof_main == 5)
    {
        oof = 5;
    }
    else if(oof_main == 6)
    {
        oof = 6;
    }

    sendToQml(oof);

}


void perform::check_member(QString username, QString password)
{
    oof_main = 1;

    login.open();

    //qDebug() << "name:" << username << ", pass:" << password;

    // Declare database
    QString user, pass;
    user = username;
    pass = password;

    if(!login.isOpen())
    {
        qDebug() << "No connection to database";
        return;
    }

    QSqlQuery query_login("loginDatabase", login);

    if(query_login.exec("SELECT username, password FROM admin  WHERE username=\'"+user+"\' AND password=\'"+pass+"\'"))
    {
        if(query_login.next())
        {
            qDebug() << "login: Login was successful!";
            // login ok, access to unit form
            login_pass = 1;
            //            login.close();
        }

        if(query_login.exec("SELECT username, password FROM student  WHERE username=\'"+user+"\' AND password=\'"+pass+"\'"))
        {
            if(query_login.next())
            {
                qDebug() << "login: Login was successful!";
                login_pass = 2;
                //                login.close();
            }
        }

        else
        {
            qDebug() << "[+]Status: Login was false!";
            login_pass = 0;
        }
    }

    check_oof();

}

void perform::check_choose_lesson(int type, int lesson, int privacy)
{

    int privacy_user = privacy; // root:1       --- user:2




    int tp, ls;
    tp = type;
    ls = lesson;
    QString s = "unit" + QString::number(ls);



    if (tp==1)
    {
        oof_main = 4;

        vocab.open();
        if(!vocab.isOpen())
        {
            qDebug() << "No connection to database";
            return;
        }
        QSqlQuery query_vocab("vocabDatabase", vocab);


        query_vocab.exec("SELECT COUNT(*) FROM "+s+"");
        if (query_vocab.next()) {
            numberOfQues = query_vocab.value(0).toInt();
        }
        qDebug() << "numberOfQues: " << numberOfQues;

        for (int i = 0; i < numberOfQues; i++)
        {
            if(query_vocab.exec(QString("SELECT term, definition FROM "+s+" WHERE rowid = %1").arg(i+1)))
            {
                if(query_vocab.next())
                {
                    Term.append(query_vocab.value(0).toString());
                    Definition.append(query_vocab.value(1).toString());
                }
            }
        }
        qDebug() << "Term[0]=" << Term[0];
        QList<QString> Term_tmp(Term);
        QList<QString> Definition_tmp(Definition);

        int remainQuestion = numberOfQues;
        for(int i = 0; i < numberOfQues; i++)
        {
            int tmp = qrand()%remainQuestion;
            Term_heli.append(Term_tmp[tmp]);
            Term_tmp.removeAt(tmp);           //Loai bo du lieu da lay
            Definition_heli.append(Definition_tmp[tmp]);
            Definition_tmp.removeAt(tmp);     //Loai bo du lieu da lay
            remainQuestion--;
        }


        QList<QString> Term_tmp2(Term);
        QList<QString> Definition_tmp2(Definition);
        QList<QString> Ques_str_rand;
        QList<int> Ques_key_rand;
        int remainQuestion2 = numberOfQues;
        //Nhap tu mang 2 chieu ve mang 1 chieu
        for(int i = 0; i < 10; i++)
        {
            int tmp = qrand()%remainQuestion2;
            Ques_str_rand.append(Term_tmp2[tmp]);
            Ques_str_rand.append(Definition_tmp2[tmp]);
            Ques_key_rand.append(i);
            Ques_key_rand.append(i);
            Term_tmp2.removeAt(tmp);           //Loai bo du lieu da lay
            Definition_tmp2.removeAt(tmp);           //Loai bo du lieu da lay
            remainQuestion2--;
        }
        remainQuestion2 = 20;
        for(int i = 0; i < 20; i++)
        {
            int tmp = qrand()%remainQuestion2;
            Ques_str.append(Ques_str_rand[tmp]);
            Ques_key.append(Ques_key_rand[tmp]);
            Ques_str_rand.removeAt(tmp);           //Loai bo du lieu da lay
            Ques_key_rand.removeAt(tmp);           //Loai bo du lieu da lay
            remainQuestion2--;
        }

        sendDataToQml(tp,ls,numberOfQues,privacy_user);
        syncData(Term,Definition);
        syncData_scatter(Ques_str,Ques_key);
        syncData_heli(Term_heli, Definition_heli);

        for(int i = 0; i < numberOfQues; i++)
        {
            Term.removeFirst();
            Definition.removeFirst();
            Term_heli.removeFirst();
            Definition_heli.removeFirst();
        }
        for(int i = 0; i < 20; i++)
        {
            Ques_str.removeFirst();
            Ques_key.removeFirst();
        }


    }
    else if (tp==2) // synonym
    {
        oof_main = 5;

        synonym.open();
        if(!synonym.isOpen())
        {
            qDebug() << "No connection to database";
            return;
        }
        QSqlQuery query_synonym("synonymDatabase", synonym);


        query_synonym.exec("SELECT COUNT(*) FROM "+s+"");
        if (query_synonym.next()) {
            numberOfQues = query_synonym.value(0).toInt();
        }
        qDebug() << "numberOfQues: " << numberOfQues;

        for (int i = 0; i < numberOfQues; i++)
        {
            if(query_synonym.exec(QString("SELECT col_1, col_2, col_3, col_4, col_5, col_6, col_7, col_8, col_9, col_10 FROM "+s+" WHERE rowid = %1").arg(i+1)))
            {
                if(query_synonym.next())
                {
                    C1.append(query_synonym.value(0).toString());
                    C2.append(query_synonym.value(1).toString());
                    C3.append(query_synonym.value(2).toString());
                    C4.append(query_synonym.value(3).toString());
                    C5.append(query_synonym.value(4).toString());
                    C6.append(query_synonym.value(5).toString());
                    C7.append(query_synonym.value(6).toString());
                    C8.append(query_synonym.value(7).toString());
                    C9.append(query_synonym.value(8).toString());
                    C10.append(query_synonym.value(9).toString());
                }
            }
        }

        sendDataToQml(tp,ls,numberOfQues,privacy_user);
        syncData_synonym(C1,C2,C3,C4,C5,C6,C7,C8,C9,C10);

        for(int i = 0; i < numberOfQues; i++)
        {
            C1.removeFirst();
            C2.removeFirst();
            C3.removeFirst();
            C4.removeFirst();
            C5.removeFirst();
            C6.removeFirst();
            C7.removeFirst();
            C8.removeFirst();
            C9.removeFirst();
            C10.removeFirst();
        }

    }
    else if (tp==3)
    {
        oof_main = 6;
    }
    else // tp = 4
    {

    }



    check_oof();
}
void perform::check_lesson_student(int unit, int lesson)
{
    int unit_student, lesson_student;
    unit_student = unit;
    lesson_student = lesson;
    check_choose_lesson(unit_student, lesson_student, 2);
}

void perform::back_to_main()
{
    oof_main = 1;
    oof = 2;
    check_oof();
}

