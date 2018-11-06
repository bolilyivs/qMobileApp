#include "ttspeech.h"

TTSpeech::TTSpeech(QObject *parent) : QObject(parent)
{
    mSpeech = new QTextToSpeech();
    setLocal(Language::English, Country::USA);
}


void TTSpeech::say(const QString &text)
{
    if(mSpeech->state() == QTextToSpeech::Ready)
        mSpeech->say(text);
}
void TTSpeech::pause()
{
    mSpeech->pause();
}
void TTSpeech::resume()
{
    mSpeech->resume();
}
void TTSpeech::stop()
{
    mSpeech->stop();
}

void TTSpeech::setRate(double rate)
{
    mSpeech->setRate(rate);
}
void TTSpeech::setPitch(double pitch)
{
    mSpeech->setPitch(pitch);
}
void TTSpeech::setVolume(double volume)
{
    mSpeech->setVolume(volume);
}

QVariantList TTSpeech::voicesList(){
    QVariantList list;
    for(QVoice &v : mSpeech->availableVoices()){
        list << v.name();
    }
    return list;
}

void TTSpeech::setVoice(QString voiceName){
    for(QVoice &v : mSpeech->availableVoices()){
        if(voiceName == v.name())
            mSpeech->setVoice(v);
    }
}

void TTSpeech::setLocal(Language plang, Country pcntry){
    QLocale::Country country;
    QLocale::Language lang;
    switch (plang) {
        case Language::Russian: lang = QLocale::Language::Russian; break;
        case Language::English: lang = QLocale::Language::English; break;
    }

    switch (pcntry) {
        case Country::RF: country = QLocale::Country::RussianFederation; break;
        case Country::USA: country = QLocale::Country::UnitedStates; break;
    }

    mSpeech->setLocale(QLocale(lang, country));
}
