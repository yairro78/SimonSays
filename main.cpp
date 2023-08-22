
#include "bsp/include/bsp/bsp.h"
#include <chrono>
#include <cstdlib>
#include <ctime>
#include <iostream>
#include <pthread.h>
#include <thread>
#include <unistd.h>
#include <vector>

// #define DEFAULT_KEYS_NUMBER 4;

void clearScreen() {
  using namespace std::this_thread;     // sleep_for, sleep_until
  using namespace std::chrono_literals; // ns, us, ms, s, h, etc.
  using std::chrono::system_clock;

  sleep_for(10ns);
  sleep_until(system_clock::now() + 2s);
  system("clear");
} // clear screen

void displaySequence(const std::vector<int> &sequence) {

  int number = 1;
  clearScreen();

  for (int color : sequence) {
    clearScreen();
    std::cout << "******Simon says:*Key Number: " << number++ << " : "
              << std::endl
              << std::flush;
    ;
    BSP_blinkHwLight(color);
    std::cout << std::endl;
    ;
  }
} // handls each gane sequance input

bool checkInput(const std::vector<int> &sequence,
                const std::vector<int> &userInput) {
  if (sequence.size() != userInput.size()) {
    return false;
  } // checks user input in the game

  for (size_t i = 0; i < sequence.size(); ++i) {

    if (sequence[i] != userInput[i]) {
      return false;
    }
  }
  return true;
}

int main(int argc, char *argv[1]) {

  srand(static_cast<unsigned int>(time(nullptr)));

  std::vector<int> sequence;
  std::vector<int> userInput;

  bool gameOver = false;
  int round = 1;
  int numberOfKeys = 4; // NUMBER_OF_KEYS_IN_GAME; //DEFAULT_KEYS_NUMBER;

  if (argc > 1) {
    numberOfKeys = std::stoi(argv[1]);
  }

  while (!gameOver) {
    // clearScreen();
    std::cout << "Round" << round << std::endl << std::flush;

    sequence.push_back(rand() % numberOfKeys + 1);

    displaySequence(sequence);

    userInput.clear();
    clearScreen();
    for (int i = 0; i < round; ++i) {
      int color;
      std::cout << "enter color" << i + 1 << ": " << std::flush;
      ;
      color = BSP_readHwButton();
      userInput.push_back(color);
      //  userInput.push_back(BSP_readHwButton());
    }

    if (!checkInput(sequence, userInput)) {
      std::cout << "game Over! score : " << round << std::endl;
      gameOver = true;
    } else {
      ++round;
    }
  }
  return 0;
}