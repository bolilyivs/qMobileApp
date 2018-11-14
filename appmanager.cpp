#include "appmanager.h"
#include "QDebug"
AppManager::AppManager()
{
    mSpeech = new QTextToSpeech();


    mUserId = "123";
    mUserName = "Guest";
    mUserLevel = 5;
    mUserExp = 0.5;
    voiceInit = false;
}


//Set
void AppManager::setPage(Pages page)
{
    mCurrentPage = page;
    qDebug() << page;
    switch (page) {
    case Pages::MainMenu: setPageUrl(MAIN_MENU); break;
    case Pages::WordTranslate: setPageUrl(WORD_TRANSLATION); break;
    case Pages::TranslateWord: setPageUrl(TRANSLATION_WORD); break;
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

qint32 AppManager::userLevel()
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
    qDebug() << list;
    std::random_shuffle(list.begin(), list.end());
    qDebug() << list;
    return list;
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
    if(!voiceInit){
        mSpeech->setLocale(QLocale(QLocale::Language::English, QLocale::Country::UnitedStates));
        voiceInit = true;
    }

    if(mSpeech->state() == QTextToSpeech::Ready)
        mSpeech->say(text);
}


//Cards
void AppManager::receiveWordCards()
{
    QString word = "word";
    QString translation = "translation";

    if(mCurrentPage == Pages::TranslateWord){
        word = "translation";
        translation = "word";
    }

    mCurrentData.clear();
    QVariantMap map;
    map[word] = "Hello";
    map[translation] = "Привет";
    mCurrentData << map;
    map[word] = "House";
    map[translation] = "Дом";
    mCurrentData << map;
    map[word] = "Tree";
    map[translation] = "Дерево";
    mCurrentData << map;
    map[word] = "Sky";
    map[translation] = "Небо";
    mCurrentData << map;
    map[word] = "Car";
    map[translation] = "Автомобиль";
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

    map["sentence"] = "I am not a_professional artist";
    map["translation"] = "Я не профессиональный художник";
    mCurrentData << map;

    map["sentence"] = "I have lost my password";
    map["translation"] = "Я потерял свой пароль";
    mCurrentData << map;

    map["sentence"] = "I do not smoke";
    map["translation"] = " Я не курю";
    mCurrentData << map;

    map["sentence"] = "Are you can swim?";
    map["translation"] = "Ты умеешь плавать?";
    mCurrentData << map;

    map["sentence"] = " Have you some idea?";
    map["translation"] = "У тебя есть идея? ";
    mCurrentData << map;

    map["sentence"] = "Do you know the_way?";
    map["translation"] = "Ты знаешь дорогу?";
    mCurrentData << map;

    map["sentence"] = "She is my sun";
    map["translation"] = "Она моё солнце";
    mCurrentData << map;

    map["sentence"] = "He has got a_friend.";
    map["translation"] = "У него есть друг";
    mCurrentData << map;

    map["sentence"] = "They are in the open sea";
    map["translation"] = "Они в открытом море";
    mCurrentData << map;

    map["sentence"] = "They have hamburgers";
    map["translation"] = "У них есть гамбургеры";
    mCurrentData << map;


    while(mCurrentData.size() > 10){
            int x = QRandomGenerator::global()->generate() % mCurrentData.size();
            mCurrentData.removeAt(x);
    }

    emit currentDataChanged();
}
