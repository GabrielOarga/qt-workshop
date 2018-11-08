#ifndef MAINVIEW_HPP
#define MAINVIEW_HPP

#include <QObject>
#include <QQuickItem>
#include <QQmlListProperty>

class Person;

class MainView : public QQuickItem
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<Person> people READ people NOTIFY peopleChanged)

public:
    MainView();

    QQmlListProperty<Person> people() const {
        return m_people;
    }

signals:
    void peopleChanged();

private:
    QQmlListProperty<Person> m_people;

    void generatePeople(int count);

};

#endif // MAINVIEW_HPP
