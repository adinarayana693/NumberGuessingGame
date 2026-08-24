#include "gamecontroller.h"

GameController::GameController(QObject *parent)
    : QObject{parent},
    m_maxAttempts(7),
    m_attemptsRemaining(7),
    m_currentMinRange(1),
    m_currentMaxRange(100),
    m_gameState("PLAYING")
{}

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
