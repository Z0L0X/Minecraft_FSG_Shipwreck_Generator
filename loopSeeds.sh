# create a for loop to run the seed executable 100 times with 12 threads each
./loopSeeds.sh
for i in $(seq 1 1 100); do
  for j in $(seq 1 1 16); do
    ./seed >output$j.txt &
  done
done    

watch -gn 0.5 grep "Seed: " output*.txt
cat $(grep -l "Seed: " *.txt)
killall ./seed
rm output*.txt

