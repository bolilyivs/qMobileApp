#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>
#include <QTextToSpeech>
#include <stringconstants.h>

class AppManager: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userID READ userID NOTIFY userIDChanged)
    Q_PROPERTY(QString userName READ userName NOTIFY userNameChanged)
    Q_PROPERTY(qint8 userLevel READ userLevel NOTIFY userLevelChanged)
    Q_PROPERTY(qreal userExp READ userExp NOTIFY userExpChanged)


    Q_PROPERTY(QVariantList currentData READ currentData NOTIFY currentDataChanged)
    Q_PROPERTY(QString currentPageUrl WRITE setPageUrl READ currentPageUrl NOTIFY currentPageUrlChanged)

    Q_PROPERTY(qint32 resTotalCards READ resTotalCards NOTIFY resTotalCardsChanged)
    Q_PROPERTY(qint32 resCorrectCards READ resCorrectCards NOTIFY resCorrectCardsChanged)
    Q_PROPERTY(qint64 resTime READ resTime NOTIFY resTimeChanged)

public:
    enum Pages{WordTranslate, TranslateWord,
               Chapter1Menu,Chapter1SentenceCreator,Chapter1SentenceTranslate,Chapter1Rules,
               Finish
               };

    Q_ENUM(Pages)

private:
    //User Info
    QString mUserId;
    QString mUserName;
    qint8 mUserLevel;
    qreal mUserExp;

    //Current data
    QVariantList mCurrentData;
    qint8 countData;

    //Pages
    Pages mCurrentPage;
    QString mCurrentPageUrl;

    //Modules
    QTextToSpeech *mSpeech;

    //Current Results
    qint32 mResTotalCards;
    qint32 mResCorrectCards;
    qint64 mResTime;

public:
    AppManager();
    //Set
    Q_INVOKABLE void setPage(Pages);
    void setPageUrl(QString url) {mCurrentPageUrl = url; }

    //Get
    QString userID();
    QString userName();
    qint8 userLevel();
    qreal userExp();
    QVariantList currentData();
    QString currentPageUrl();
    qint32 resTotalCards(){return mResTotalCards;}
    qint32 resCorrectCards(){return mResCorrectCards;}
    qint64 resTime(){return mResTime;}


    //Mothods
    Q_INVOKABLE QVariantList shuffle(QVariantList);

    //Send results
    Q_INVOKABLE void sendWordModeResults(QVariantMap);
    Q_INVOKABLE void sendGrammarModeResults(QVariantMap);

    //Speech
    Q_INVOKABLE void say(QString);

    //Cards
    Q_INVOKABLE void receiveWordCards();
    Q_INVOKABLE void receiveSentenceCards();

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

};



#endif // APPMANAGER_H
