#include "runsimulation.h"

#ifdef TESTMODE
#include "memtrace.h"
#include "gtest_lite.h"
#endif

int main() {


#ifdef CPORTA
    std::cout << "\n\tCPORTA DEFINED\n";
#endif

#ifndef TESTMODE

    try {

        std::cout << "\tNO TEST MODE" << std::endl << "\tAdja meg a forrasfajl eleresi utjat: ";
        std::string fname;
        std::cin >> fname;

        std::cout << "\tVegeredmeny el legyen mentve? I / N : ";
        char saving = 'N';
        std::cin >> saving;
        if(saving == 'I') RunningSimulation::saveMode(true);
        else              RunningSimulation::saveMode(false);

        RunningSimulation::setup(new Simulation(fname.c_str()), true);

#ifndef CPORTA
        RunningSimulation::startVisual();
#endif
        
#ifdef CPORTA
        RunningSimulation::startNonVisual(true);
#endif

        RunningSimulation::deleteSim();
    }
    catch (const char* err)
    {
        std::cout << err;
    }
    catch (...)
    {
        std::cout << "baj van";
    }

#endif

#ifdef TESTMODE

    RunningSimulation::saveMode(false);
    Simulation simulation;
    RunningSimulation::setup(&simulation);

    TEST(Simulation, File nelkuli szimulacio futtatasa)
    {
        EXPECT_THROW(RunningSimulation::startNonVisual(), const char*);
    } END

    TEST(Simulation, Nem letezo file)
    {
        EXPECT_THROW(RunningSimulation::newSystem("nemletezik"), const char*);
    } END

    TEST(Simulation, Hibas szintaktikaju file)
    {
        EXPECT_THROW(RunningSimulation::newSystem("source\\rossz.txt"), const char*);
    } END

    TEST(Simulation, Helyes szintaktika es dinamikusan foglalt szimulacio)
    {
        EXPECT_NO_THROW(RunningSimulation::changeSimulation(new Simulation("source\\balanced.txt"), true));
    } END

    TEST(Simulation, Balanced vegallapot)
    {
        EXPECT_EQ(Balanced, RunningSimulation::startNonVisual(false)) << "NEM JO A VEGEREDMENY\n";
        RunningSimulation::deleteSim();
        RunningSimulation::changeSimulation(&simulation);
    } END

    TEST(Simulation, Orbit vegallapot)
    {
        EXPECT_NO_THROW(RunningSimulation::newSystem("source\\orbit.txt"));
        EXPECT_EQ(Orbit, RunningSimulation::startNonVisual(false)) << "NEM JO A VEGEREDMENY\n";
    } END

    TEST(Simulation, Calm vegallapot)
    {
        RunningSimulation::newSystem("source\\calm.txt");
        EXPECT_EQ(Calm, RunningSimulation::startNonVisual(false)) << "NEM JO A VEGEREDMENY\n";
    } END

    TEST(Simulation, Uj reszecske hozzaadasa es kiiras)
    {
        EXPECT_NO_THROW(RunningSimulation::newSystem("source\\printable.txt"));
        EXPECT_NO_THROW(RunningSimulation::getSimulation()->addNewParticle());
        std::cout << *(RunningSimulation::getSimulation());
    } END

    TEST(Simulation, Kimeneti fajlt visszaolvasva futtatas \n\t\t befejezett szimulaciot nem lehet ujra futtatni)
    {
        RunningSimulation::newSystem("source\\orbit.txt");
        RunningSimulation::saveMode(true);
        RunningSimulation::startNonVisual(false);
        RunningSimulation::saveMode(false);
        RunningSimulation::newSystem("source\\orbit_Ending.txt");
        EXPECT_EQ(Orbit, RunningSimulation::startNonVisual(false)) << "NEM JO A VEGEREDMENY\n";

        EXPECT_THROW(RunningSimulation::startNonVisual(false), const char*);
    } END

    TEST(Simulation, Iteracios limit elerese eseten gyorsulo vegallapot)
    {
        RunningSimulation::newSystem("source\\orbit.txt");
        RunningSimulation::maxIteration(1000);
        EXPECT_EQ(Accelerating, RunningSimulation::startNonVisual(false)) << "NEM JO A VEGEREDMENY\n";

    } END
    TEST(Simulation, Iteracios limit elerve dokumentalva)
    {
        EXPECT_EQ(true, RunningSimulation::reachedMaxIt()) << "Nem erte el!";

    } END

    TEST(Simulation, Torolt szimulacio utan futtatas kivetelt dob)
    {
        RunningSimulation::deleteSim();
        EXPECT_THROW(RunningSimulation::startNonVisual(), const char*) << "Baj";

    } END

#endif

        return 0;
}