#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>
#include <QtNetwork>
#include <QtMultimedia>
#include <QTextToSpeech>
#include <stringconstants.h>
#include <QRandomGenerator>
#include "dbcontroller.h"

class AppManager: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userID READ userID NOTIFY userIDChanged)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(qint32 userLevel READ userLevel NOTIFY userLevelChanged)
    Q_PROPERTY(qreal userExp READ userExp NOTIFY userExpChanged)


    Q_PROPERTY(QVariantList currentData READ currentData NOTIFY currentDataChanged)
    Q_PROPERTY(QString currentPageUrl WRITE setPageUrl READ currentPageUrl NOTIFY currentPageUrlChanged)

    Q_PROPERTY(qint32 resTotalCards READ resTotalCards NOTIFY resTotalCardsChanged)
    Q_PROPERTY(qint32 resCorrectCards READ resCorrectCards NOTIFY resCorrectCardsChanged)
    Q_PROPERTY(qint64 resTime READ resTime NOTIFY resTimeChanged)

    Q_PROPERTY(QString speechText READ speechText NOTIFY speechTextChanged)
    Q_PROPERTY(QString serverData READ serverData NOTIFY serverDataChanged)

    QString path;
public:
    enum Pages{MainMenu, Registration, WordsViewPage, UserWordsPage,
               WordTranslate, TranslateWord, WordReading, WordConstructor, WordSpeech,
               WordRepeating, WordView,
               Crossword,
               Chapter1Menu,Chapter1SentenceCreator,Chapter1SentenceTranslate,Chapter1Rules,
               Finish
               };

    Q_ENUM(Pages)

private:
    //DB
    DBController mUserDB;
    DBController mWordsDB;

    //User Info
    QString mUserId;
    QString mUserName;
    qint32 mUserLevel;
    qreal mUserExp;
    QBuffer buffer;

    //Current data
    QVariantList mCurrentData;
    qint8 countData;

    //Pages
    Pages mCurrentPage;
    QString mCurrentPageUrl;

    //Modules
    QTextToSpeech *mSpeech;
    bool voiceInit;

    //Current Results
    qint32 mResTotalCards;
    qint32 mResCorrectCards;
    qint64 mResTime;

    //Network
    QNetworkAccessManager *speechNetManager;
    QNetworkAccessManager *serverNetManager;

    //Audio
    QAudioInput *audio;

    QString mSpeechText;

    QString m_serverData;

public:
    AppManager();
    //Set
    Q_INVOKABLE void setPage(Pages);
    void setPageUrl(QString url) {mCurrentPageUrl = url; }

    //Get
    QString userID();
    QString userName();
    qint32 userLevel();
    qreal userExp();
    QVariantList currentData();
    QString currentPageUrl();
    qint32 resTotalCards(){return mResTotalCards;}
    qint32 resCorrectCards(){return mResCorrectCards;}
    qint64 resTime(){return mResTime;}


    //Mothods
    Q_INVOKABLE QVariantList shuffle(QVariantList);

    //Send results
    Q_INVOKABLE void sendWordModeResults(QVariantList, QVariantMap map);
    Q_INVOKABLE void sendGrammarModeResults(QVariantMap);

    //Speech
    Q_INVOKABLE void say(QString);

    //Cards
    Q_INVOKABLE void receiveWordCards();
    Q_INVOKABLE void receiveSentenceCards();

    void queryToReceive(QString query, DBController &db);

    Q_INVOKABLE void receiveSomethingWords();
    Q_INVOKABLE void receiveSearchWords(QString word);
    Q_INVOKABLE void receiveUserWords();
    Q_INVOKABLE void addToUserWord(QString id);
    Q_INVOKABLE void removeUserWord(QString id);

    //Network
    Q_INVOKABLE void sendSpeech();

    Q_INVOKABLE void enterToServer(QVariantMap data);
    Q_INVOKABLE void registrarionToServer(QVariantMap data);
    Q_INVOKABLE void sendUserDB();
    Q_INVOKABLE void receiveUserDB();
    void sendToServer(QByteArray query, QString file);
    void getFromServer(QNetworkReply *reply);

    //Speech
    Q_INVOKABLE void startRecord();
    Q_INVOKABLE void stopRecord();

    QString speechText(){return mSpeechText;}

    QString serverData() const
    {
        return m_serverData;
    }

    QString currentMode();

signals:
    void userIDChanged();
    void userNameChanged();
    void userLevelChanged();
    void userExpChanged();
    void currentDataChanged();
    void currentPageUrlChanged();
    void resTotalCardsChanged();
    void resCorrectCardsChanged();
    void resTimeChanged();
    void speechTextChanged();

    void serverDataChanged();

public slots:
    void getSpeech(QNetworkReply *reply);

    void setUserName(QString userName)
    {
        if (mUserName == userName)
            return;

        mUserName = userName;
        emit userNameChanged();
    }
};



#endif // APPMANAGER_H
