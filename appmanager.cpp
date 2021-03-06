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

    //Speech to text
    speechNetManager = new QNetworkAccessManager(this);
    serverNetManager = new QNetworkAccessManager(this);

    QAudioFormat format;
    format.setSampleRate(16000);
    format.setChannelCount(1);
    format.setSampleSize(16);
    format.setCodec("audio/pcm");
    format.setByteOrder(QAudioFormat::LittleEndian);
    format.setSampleType(QAudioFormat::SignedInt);
    QAudioDeviceInfo info(QAudioDeviceInfo::defaultOutputDevice());
    if (!info.isFormatSupported(format)){
        qDebug() << "\n\n\n**************NotSupport!*************\n\n";
    }

    audio = new QAudioInput(format, this);
    connect(speechNetManager, &QNetworkAccessManager::finished, this, &AppManager::getSpeech);
    connect(serverNetManager, &QNetworkAccessManager::finished, this, &AppManager::getFromServer);
    mUserDB.setDBPath("userData.db");
    mUserDB.createConnection();

    mWordsDB.setDBPath("words.db");
    mWordsDB.createConnection();
}


//Set
void AppManager::setPage(Pages page)
{
    mCurrentPage = page;
    qDebug() << page;
    switch (page) {
    case Pages::MainMenu: setPageUrl(MAIN_MENU); break;

    case Pages::Registration: setPageUrl(REGISTRATION); break;
    case Pages::WordsViewPage: setPageUrl(WORDSVIEWPAGE); break;
    case Pages::UserWordsPage: setPageUrl(USERWORDSPAGE); break;

    case Pages::WordTranslate: setPageUrl(WORD_TRANSLATION); break;
    case Pages::WordReading: setPageUrl(WORD_READING); break;
    case Pages::WordConstructor: setPageUrl(WORD_CONSTRUCTOR); break;
    case Pages::WordSpeech: setPageUrl(WORD_SPEECH); break;
    case Pages::WordRepeating: setPageUrl(WORD_REPEATING); break;
    case Pages::WordView: setPageUrl(WORD_VIEW); break;
    case Pages::TranslateWord: setPageUrl(TRANSLATION_WORD); break;
    case Pages::Crossword: setPageUrl(WORD_CROSSWORD); break;

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
//Send results
QString AppManager::currentMode()
{
    QString mode = "";
    switch (mCurrentPage) {
    case Pages::WordTranslate: mode = "wt"; break;
    case Pages::WordReading: mode = "reading"; break;
    case Pages::WordConstructor: mode = "construct"; break;
    case Pages::WordSpeech: mode = "speech"; break;
    case Pages::WordRepeating: mode = "repeat"; break;
    case Pages::WordView: mode = "view"; break;
    case Pages::TranslateWord: mode = "tw"; break;
    case Pages::Crossword: mode = "wt"; break;
    }
    return mode;
}


void AppManager::sendWordModeResults(QVariantList list, QVariantMap map)
{
    QString mode = currentMode();

    QString query = "";

    for(QVariant &value : list){
        query = "UPDATE data SET "+mode+" = 'true' WHERE word_id = " + value.toString() + "; ";
        mUserDB.doQuery(query);
    }
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

void AppManager::queryToReceive(QString query, DBController &db)
{
    QString word = "word";
    QString translation = "translation";

    if(mCurrentPage == Pages::TranslateWord){
        word = "translation";
        translation = "word";
    }

    mCurrentData.clear();

    db.doQuery(query);

    for(QMap<QString, QString> fmap: db.getMapResults()){
        qDebug() << fmap;
        QVariantMap map;
        map[word] = fmap["word"];
        map[translation] = fmap["translation"];
        map["id"] = fmap["id"];
        mCurrentData << map;
    }

    emit currentDataChanged();
}

void AppManager::receiveWordCards()
{
    QString query = "SELECT * FROM word";
    queryToReceive(query, mWordsDB);
}

void AppManager::receiveSomethingWords()
{
    QString query = "SELECT * FROM word ORDER BY RANDOM() LIMIT 30";
    queryToReceive(query, mWordsDB);
}
void AppManager::receiveSearchWords(QString word)
{
    QString query = "SELECT * FROM word WHERE word LIKE '%"  + word +"%' ORDER BY RANDOM() LIMIT 30";
    queryToReceive(query, mWordsDB);
}
void AppManager::receiveUserWords()
{

    QString mode = currentMode();

    QString query = "SELECT word_id FROM data ORDER BY RANDOM() LIMIT 10";
    qDebug() << mode;

    if(mode != ""){
        query = "SELECT word_id FROM data WHERE "+ mode + " = false ORDER BY RANDOM() LIMIT 10";
    }


    mUserDB.doQuery(query);
    query = "SELECT * FROM word WHERE id IN ( ";
    qDebug() << mUserDB.getMapResults();
    for(QMap<QString, QString> fmap: mUserDB.getMapResults()){
        QVariantMap map;
        query += fmap["word_id"] + ",";

    }

   query[query.size()-1] = ')';
   qDebug() << query;
   queryToReceive(query, mWordsDB);
}

void AppManager::addToUserWord(QString id)
{
    QString query = "INSERT INTO data (word_id) values (" +id + ")";
    qDebug() << query;

    mUserDB.doQuery(query);
}

void AppManager::removeUserWord(QString id)
{
    QString query = "DELETE FROM data WHERE word_id = " + id ;
    qDebug() << query;

    mUserDB.doQuery(query);
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




void AppManager::startRecord()
{
    buffer.open(QBuffer::WriteOnly | QBuffer::Truncate);
    if(buffer.isOpen()){
        audio->start(&buffer);
        qDebug() << "record";
    }
}

void AppManager::stopRecord()
{
    qDebug() << "test";
    audio->stop();
    buffer.close();
    sendSpeech();
}



void AppManager::sendSpeech()
{
    buffer.open(QBuffer::ReadOnly);


    QNetworkRequest request;
    request.setUrl(QUrl("https://api.wit.ai/speech"));
    request.setRawHeader("Authorization", "Bearer 5KRNILYTYJUXANWDARJ5PTCJYC7GBSF7");
    request.setRawHeader("Content-Type","audio/raw;encoding=signed-integer;bits=16;rate=16000;endian=little");

    qDebug() << "test";
    QNetworkReply* reply = speechNetManager->post(request, &buffer);
    qDebug() << reply;
    qDebug() << "test2";


    QEventLoop eLoop;
    QObject::connect(speechNetManager, &QNetworkAccessManager::finished, &eLoop, &QEventLoop::quit);
    eLoop.exec( QEventLoop::ExcludeUserInputEvents );
}

void AppManager::sendUserDB()
{

}

void AppManager::receiveUserDB()
{

}

void AppManager::sendToServer(QByteArray query, QString file)
{
    QUrl serviceUrl = QUrl(SERVER_ADDR + file);

    QNetworkRequest networkRequest(serviceUrl);
    networkRequest.setHeader(QNetworkRequest::ContentTypeHeader,"application/x-www-form-urlencoded");

    serverNetManager->post(networkRequest, query);

    QEventLoop eLoop;
    QObject::connect(serverNetManager, &QNetworkAccessManager::finished, &eLoop, &QEventLoop::quit);
    eLoop.exec( QEventLoop::ExcludeUserInputEvents );
}

void AppManager::getFromServer(QNetworkReply *reply)
{
    m_serverData = reply->readAll();
    qDebug() << m_serverData;
    emit serverDataChanged();
}

void AppManager::enterToServer(QVariantMap data)
{
    QByteArray query;
    query.append("login="+data["login"].toString().toUtf8());
    query.append("&password="+data["password"].toString().toUtf8());
    sendToServer(query, SERVER_LOGIN);
}

void AppManager::registrarionToServer(QVariantMap data)
{
    QByteArray query;
    query.append("login="+data["login"].toString().toUtf8());
    query.append("&password="+data["password"].toString().toUtf8());
    query.append("&email="+data["email"].toString().toUtf8());
    sendToServer(query, SERVER_REGISTRATION);
}

void AppManager::getSpeech(QNetworkReply *reply)
{
    buffer.close();

    if(reply->error()){
        qDebug() << "error";
        qDebug() <<  reply->readAll();
        return;
    }

    QByteArray data = reply->readAll();
    QJsonDocument doc = QJsonDocument::fromJson(data);
    QJsonObject object = doc.object();
    QJsonValue val = object.value("_text");
    mSpeechText = val.toString();
    qDebug() << mSpeechText;
    emit speechTextChanged();
}
