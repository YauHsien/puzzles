#include<stdio.h>
#include<stdlib.h>

struct solution {
  int disc, from, to;
  struct solution *left, *right;
};

struct solution* new_solution(int disc, int from, int to) {
  struct solution* sol = (struct solution*)malloc(sizeof(struct solution));
  sol->disc = disc;
  sol->from = from;
  sol->to = to;
  sol->left = NULL;
  sol->right = NULL;
  return sol;
}

struct solution* clear_solution(struct solution* sol) {
  free(sol);
  return NULL;
}

struct solution* glow_solution(struct solution* sol) {
  if (sol->left != NULL) clear_solution(sol->left);
  if (sol->right != NULL) clear_solution(sol->right);
  if (sol->from == 1 && sol->to == 2) {
    sol->left = new_solution(sol->disc+1, 1, 3);
    sol->right = new_solution(sol->disc+1, 3, 2);
  }
  if (sol->from == 1 && sol->to == 3) {
    sol->left = new_solution(sol->disc+1, 1, 2);
    sol->right = new_solution(sol->disc+1, 2, 3);
  }
  if (sol->from == 2 && sol->to == 1) {
    sol->left = new_solution(sol->disc+1, 2, 3);
    sol->right = new_solution(sol->disc+1, 3, 1);
  }
  if (sol->from == 2 && sol->to == 3) {
    sol->left = new_solution(sol->disc+1, 2, 1);
    sol->right = new_solution(sol->disc+1, 1, 3);
  }
  if (sol->from == 3 && sol->to == 1) {
    sol->left = new_solution(sol->disc+1, 3, 2);
    sol->right = new_solution(sol->disc+1, 2, 1);
  }
  if (sol->from == 3 && sol->to == 2) {
    sol->left = new_solution(sol->disc+1, 3, 1);
    sol->right = new_solution(sol->disc+1, 1, 2);
  }
  return sol;
}

struct solution* glow_level(struct solution* sol, int add_level) {
  if (add_level <= 1)
    return sol;
  sol = glow_solution(sol);
  sol->left = glow_level(sol->left, add_level-1);
  sol->right = glow_level(sol->right, add_level-1);
  return sol;
}

void print_solution(struct solution* sol) {
  if (sol == NULL)
    return;
  print_solution(sol->left);
  printf("#%d: %d -> %d\n", sol->disc, sol->from, sol->to);
  print_solution(sol->right);
}

int main(int argc, char** argv) {
  int level = 1;
  struct solution* sol = new_solution(1, 1, 3);
  if (argc >= 2)
    level = atoi(argv[1]);
  print_solution(glow_level(sol, level));
  return 0;
}
