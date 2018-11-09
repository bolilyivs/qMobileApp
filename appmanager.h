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

public:
    enum Pages{WordTranslate,
                Chapter1Menu,Chapter1SentenceCreator,Chapter1SentenceTranslate,Chapter1Rules
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

};



#endif // APPMANAGER_H
