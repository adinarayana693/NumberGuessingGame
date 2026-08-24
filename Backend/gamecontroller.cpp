#include "gamecontroller.h"
#include <QRandomGenerator>

GameController::GameController(QObject *parent)
    : QObject{parent},
    m_maxAttempts{7},
    m_attemptsRemaining{7},
    m_currentMinRange{1},
    m_currentMaxRange{100},
    m_gameState{"PLAYING"},
    m_feedbackType{"NONE"},
    m_feedbackText{QString("New Game Started! Guess a number between %1 and %2.").arg(m_currentMinRange).arg(m_currentMaxRange)}
{
    resetGame();
}


int GameController::maxAttempts() const
{
    return m_maxAttempts;
}

int GameController::attemptsRemaining() const
{
    return m_attemptsRemaining;
}

int GameController::currentMinRange() const
{
    return m_currentMinRange;
}

int GameController::currentMaxRange() const
{
    return m_currentMaxRange;
}

QString GameController::gameState() const
{
    return m_gameState;
}

QString GameController::feedbackType() const
{
    return m_feedbackType;
}

QString GameController::feedbackText() const
{
    return m_feedbackText;
}

void GameController::processGuess(const QString &guess)
{
    bool ok= false;
    int value = guess.toInt(&ok);
    if (!ok) {
        return;
    }

    if (value < m_currentMinRange || value > m_currentMaxRange){
        return;
    }

    if (value == m_targetNumber) {
        m_gameState = "WON";
        emit gameStateChanged();
    }else {
        m_attemptsRemaining--;
        emit attemptsRemainingChanged();

        if (m_attemptsRemaining <= 0) {
            m_gameState = "LOST";
            emit gameStateChanged();
        }
    }

}

void GameController::resetGame()
{
    m_currentMinRange =1;
    m_currentMaxRange = 100;
    m_attemptsRemaining= m_maxAttempts;

    m_targetNumber = QRandomGenerator:: global()->bounded(
        m_currentMinRange,
        m_currentMaxRange+1
        );
    emit attemptsRemainingChanged();
    emit currentMaxRangeChanged();
    emit currentMinRangeChanged();
    emit gameStateChanged();
    emit feedbackTextChanged();
}
