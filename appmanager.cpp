#include "appmanager.h"
#include "QDebug"
AppManager::AppManager()
{
    mSpeech = new QTextToSpeech();
    mSpeech->setLocale(QLocale(QLocale::Language::Russian, QLocale::Country::RussianFederation));
    mUserId = "123";
    mUserName = "Guest";
    mUserLevel = 99;
    mUserExp = 0.5;

}


//Set
void AppManager::setPage(Pages page)
{
    mCurrentPage = page;
    qDebug() << page;
    switch (page) {
    case Pages::WordTranslate: setPageUrl(WORD_TRANSLATION); break;
    case Pages::Chapter1Menu: setPageUrl(CHAPTER_1_MENU); break;
    case Pages::Chapter1SentenceCreator: setPageUrl(CHAPTER_1_SENTENCE_CREATOR); break;
    case Pages::Chapter1SentenceTranslate: setPageUrl(CHAPTER_1_SENTENCE_TRANSALTE); break;
    case Pages::Chapter1Rules: setPageUrl(CHAPTER_1_RULESCHAPTER1); break;
    case Pages::Finish: setPageUrl(FINISH); break;
    }
    emit currentPageUrlChanged();
}

//Get
QString AppManager::userID()
{
    return mUserId;
}

QString AppManager::userName()
{
    return mUserName;
}

qint8 AppManager::userLevel()
{
    return mUserLevel;
}

qreal AppManager::userExp()
{
    return mUserExp;
}

QVariantList AppManager::currentData()
{
    return mCurrentData;
}

QString AppManager::currentPageUrl()
{
    return mCurrentPageUrl;
}



//Mothods
QVariantList AppManager::shuffle(QVariantList list)
{
    QVariantList newList;

    return newList;
}


//Send results
void AppManager::sendWordModeResults(QVariantMap map)
{
    if(map.contains("time"))
        mResTime = map["time"].toLongLong();
    if(map.contains("correctCards"))
        mResCorrectCards = map["correctCards"].toInt();
    if(map.contains("totalCards"))
        mResTotalCards = map["totalCards"].toInt();
    emit resCorrectCardsChanged();
    emit resTotalCardsChanged();
    emit resTime();
}

void AppManager::sendGrammarModeResults(QVariantMap map)
{
    if(map.contains("time"))
        mResTime = map["time"].toLongLong();
    if(map.contains("correctCards"))
        mResCorrectCards = map["correctCards"].toInt();
    if(map.contains("totalCards"))
        mResTotalCards = map["totalCards"].toInt();
    emit resCorrectCardsChanged();
    emit resTotalCardsChanged();
    emit resTime();

    qDebug() << mResTotalCards;
}


//Speech
void AppManager::say(QString text)
{
    if(mSpeech->state() == QTextToSpeech::Ready)
        mSpeech->say(text);
}


//Cards
void AppManager::receiveWordCards()
{
    mCurrentData.clear();
    QVariantMap map;
    map["word"] = "Hello";
    map["translation"] = "Привет";
    mCurrentData << map;
    map["word"] = "House";
    map["translation"] = "Дом";
    mCurrentData << map;
    map["word"] = "Tree";
    map["translation"] = "Дерево";
    mCurrentData << map;
    map["word"] = "Sky";
    map["translation"] = "Небо";
    mCurrentData << map;
    map["word"] = "Car";
    map["translation"] = "Автомобиль";
    mCurrentData << map;

    emit currentDataChanged();
}

void AppManager::receiveSentenceCards()
{
    mCurrentData.clear();
    QVariantMap map;
    map["sentence"] = "I am a_man";
    map["translation"] = "Я мужчина";
    mCurrentData << map;
    map["sentence"] = "You are a_woman";
    map["translation"] = "Ты женщина";
    mCurrentData << map;
    map["sentence"] = "We are people";
    map["translation"] = "Мы люди";
    mCurrentData << map;
    map["sentence"] = "It is a_pet";
    map["translation"] = "Оно питомец";
    mCurrentData << map;
    map["sentence"] = "He is John";
    map["translation"] = "Он Джон";
    mCurrentData << map;

    emit currentDataChanged();
}
