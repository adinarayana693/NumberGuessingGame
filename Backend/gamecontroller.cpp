#include "gamecontroller.h"
#include <QRandomGenerator>
#include <QDebug>

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

    if (value < 1 || value > 100){
        m_feedbackText = QString("⚠️ Invalid input! Please enter a number between 1 and 100.");
        m_feedbackType = "NONE";
        emit feedbackTextChanged();
        emit feedbackTypeChanged();
        return;
    }

    if (value == m_targetNumber) {
        m_gameState = "WON";
        m_feedbackText = QString("🎉 CONGRATULATIONS! You found the secret number %1!").arg(value);
        m_feedbackType = "WIN";

        emit gameStateChanged();
        emit feedbackTextChanged();
        emit feedbackTypeChanged();

    }else {
        m_attemptsRemaining--;
        emit attemptsRemainingChanged();

        if (m_attemptsRemaining <= 0) {
            m_gameState = "LOST";
            m_feedbackType="FAIL";
            m_feedbackText = QString("💥 GAME OVER! Out of attempts. Secret number was %1.").arg(m_targetNumber);

            emit gameStateChanged();
            emit feedbackTextChanged();
            emit feedbackTypeChanged();

        }else if (value > m_targetNumber) {
            m_feedbackText = QString("📉 %1 is TOO HIGH! Try a smaller number.").arg(value);
            m_feedbackType = "TOO_HIGH";

            if (value - 1 < m_currentMaxRange) {
                m_currentMaxRange = value - 1;
            }

            emit feedbackTextChanged();
            emit feedbackTypeChanged();
            emit currentMaxRangeChanged();
        }
        else {
            m_feedbackText = QString("📈 %1 is TOO LOW! Try a larger number.").arg(value);
            m_feedbackType = "TOO_LOW";

            if (value + 1 > m_currentMinRange) {
                m_currentMinRange = value + 1;
            }

            emit feedbackTextChanged();
            emit feedbackTypeChanged();
            emit currentMinRangeChanged();
        }
    }

}

void GameController::resetGame()
{
    m_currentMinRange = 1;
    m_currentMaxRange = 100;
    m_attemptsRemaining = m_maxAttempts;
    m_gameState = "PLAYING";
    m_feedbackType = "NONE";
    m_feedbackText = QString("New Game Started! Guess a number between %1 and %2.").arg(m_currentMinRange).arg(m_currentMaxRange);

    m_targetNumber = QRandomGenerator::global()->bounded(
        m_currentMinRange,
        m_currentMaxRange + 1
    );

    qInfo() << "Target secret number:" << m_targetNumber;
    emit gameStateChanged();
    emit attemptsRemainingChanged();
    emit currentMaxRangeChanged();
    emit currentMinRangeChanged();
    emit feedbackTypeChanged();
    emit feedbackTextChanged();
}
