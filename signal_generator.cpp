#include "signal_generator.h"
#include <wiringPi.h>

#define INPUT 0
#define OUTPUT 1

Signal_generator::Signal_generator(QObject *parent){

}

Signal_generator::~Signal_generator(){

}

void Signal_generator::init_obj()
{
    qDebug()<<"init_timer and start!";
    loop = new QTimer(this);
    QObject::connect(loop,&QTimer::timeout,this,&Signal_generator::generator);
}

void Signal_generator::generator(){
    qDebug()<<"print!";
    emit Send_data("print");

    if (wiringPiSetup()==-1) {
        qDebug ()<<"wiringPiSetup()==-1";

    }
    wiringPiSetup();
    pinMode(11,INPUT);
    pinMode(3,INPUT);
    pinMode(5,INPUT);
    pinMode(7,INPUT);

    qDebug()<<QString("GPIO 3 state = '%1'/n").arg(digitalRead(3));
    qDebug()<<QString("GPIO 5 state = '%1'/n").arg(digitalRead(5));
    qDebug()<<QString("GPIO 7 state = '%1'/n").arg(digitalRead(7));
    qDebug()<<QString("GPIO 11 state = '%1'/n").arg(digitalRead(11));

}
