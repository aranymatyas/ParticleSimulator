#include "runsimulation.h"

/*
#ifdef _WIN64
#include <windows.h>
#endif

#ifdef __unix
#include <unistd.h>
#endif
*/

Simulation* RunningSimulation::simulation = nullptr;
bool RunningSimulation::pause = false;
bool RunningSimulation::end = false;
long int RunningSimulation::maxiteration = 10000000;
bool RunningSimulation::reachedTooMany = false;
bool RunningSimulation::responsibility = false;
bool RunningSimulation::savemode = false;

RunningSimulation::RunningSimulation() 
{
    throw "Class isn't meant to be objectified!";
}

void RunningSimulation::setup(Simulation* sim, bool resp, long int maxit)
{
    responsibility = resp;
    simulation = sim;
    maxiteration = maxit;
    resetAttributes();
}

void RunningSimulation::deleteSim()
{
    if (responsibility) delete simulation;
    simulation = nullptr;
    resetAttributes();
}

#ifndef CPORTA
bool RunningSimulation::userInput(sf::Event& event)
{
    if (event.type == sf::Event::KeyPressed)
    {
        if (event.key.scancode == sf::Keyboard::Scan::R)
            simulation->reduceSpeed();
        if (event.key.scancode == sf::Keyboard::Scan::I)
            simulation->increaseSpeed();
        if (event.key.scancode == sf::Keyboard::Scan::Space)
            pause ^= true;
        if (event.key.scancode == sf::Keyboard::Scan::N)
            simulation->addNewParticle();
        if (event.key.scancode == sf::Keyboard::Scan::Escape)
            return true;
    }
    return false;
}

State RunningSimulation::startVisual()
{
	if (simulation == nullptr) throw "No simulation to run!";
    if (!simulation->isValid()) throw "No system in the simulation";

    State endingState = Accelerating;

    sf::Font font;					///SFML font for the displayable text
    sf::Text textUI;					///User interface info text
    if (!font.loadFromFile("arial.ttf")) throw "error";
    textUI.setFont(font);
    textUI.setCharacterSize(16);
    textUI.setFillColor(sf::Color::White);
    textUI.setPosition(sf::Vector2f(680, 0));

    std::string string = "Space : Pause simulation\nR : Reduce speed of simulation\nI : Increase speed of simulation\nN : Add random new particle to system";
    textUI.setString(string);

    sf::RenderWindow window(sf::VideoMode(resX, resY), "Particle Simulator");

    while (window.isOpen())
    {
        sf::Event event;
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                window.close();
            if (userInput(event)) window.close();
        }
        window.clear();

        for (int i = 0; i < simulation->getSize(); i++)
            window.draw(simulation->getShape(i));
        window.draw(simulation->getText());
        window.draw(textUI);

        window.display();

        if (!pause && !end)
        {
            simulation->iterate();
           
            if (simulation->getEndState() != Accelerating || *simulation > maxiteration)
            {
                endingState = simulation->getEndState();
                end = true;
                if(savemode) simulation->saveToFile();
            }
        }
    }
    if (*simulation >= maxiteration) reachedTooMany = true;
    if (!end && savemode) simulation->saveToFile();
    return endingState;
}
#endif
State RunningSimulation::startNonVisual(bool displaytext)
{
    if(simulation == nullptr) throw "No simulation to run!";
    if (!simulation->isValid()) throw "No system in the simulation";

    if(displaytext) std::cout << *simulation;
    do{
        if (simulation->iterate() && displaytext)
        {
            system("CLS");
            //Sleep(1);
            std::cout << *simulation;
        }

    } while (simulation->getEndState() == Accelerating && *simulation < maxiteration);
    end = true;
    if (*simulation >= maxiteration) reachedTooMany = true;
    if(savemode) simulation->saveToFile();
    return simulation->getEndState();
}
