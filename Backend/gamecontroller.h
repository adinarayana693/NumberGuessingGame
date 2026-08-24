#ifndef GAMECONTROLLER_H
#define GAMECONTROLLER_H

#include <QObject>

class GameController : public QObject
{
    Q_OBJECT
public:
    explicit GameController(QObject *parent = nullptr);
    Q_PROPERTY(int maxAttempts READ maxAttempts NOTIFY maxAttemptsChanged FINAL)
    Q_PROPERTY(int attemptsRemaining READ attemptsRemaining NOTIFY attemptsRemainingChanged FINAL)
    Q_PROPERTY(int currentMinRange READ currentMinRange NOTIFY currentMinRangeChanged FINAL)
    Q_PROPERTY(int currentMaxRange READ currentMaxRange NOTIFY currentMaxRangeChanged FINAL)
    Q_PROPERTY(QString gameState READ gameState  NOTIFY gameStateChanged FINAL)

    int maxAttempts() const;

    int attemptsRemaining() const;

    int currentMinRange() const;

    int currentMaxRange() const;

    QString gameState() const;

signals:
    void maxAttemptsChanged();
    void attemptsRemainingChanged();

    void currentMinRangeChanged();

    void currentMaxRangeChanged();

    void gameStateChanged();

private:
    int m_maxAttempts;
    int m_attemptsRemaining;
    int m_currentMinRange;
    int m_currentMaxRange;
    QString m_gameState;
};

#endif // GAMECONTROLLER_H
