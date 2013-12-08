CC=g++ -std=c++0x -O3

all: bin/rf-prepare bin/rf-train bin/rf-test bin/rf-score bin/rf-stat

bin/rf-prepare: obj/atom.o obj/scoring_function.o obj/receptor.o obj/ligand.o obj/rf-prepare.o
	$(CC) -o $@ $^

bin/rf-train: obj/random_forest_train.o obj/rf-train.o
	$(CC) -o $@ $^ -pthread

bin/rf-test: obj/random_forest_test.o obj/rf-test.o
	$(CC) -o $@ $^

bin/rf-score: obj/random_forest_test.o obj/atom.o obj/scoring_function.o obj/receptor.o obj/ligand.o obj/rf-score.o
	$(CC) -o $@ $^

bin/rf-stat: obj/rf-stat.o
	$(CC) -o $@ $^

obj/%.o: src/%.cpp
	$(CC) -o $@ $< -c

clean:
	rm -f bin/* obj/*
