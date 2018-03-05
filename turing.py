import sys
import os

def make_link(G, node1, node2, symbol):
	if (symbol not in G):
		G[symbol] = {}

	G[symbol][node1] = node2

	return G

def printInput():
	print "Alphabet: " + str(alpha)
	print "Number of states: " + str(number_of_states),
	print "Initial state: q" + state0,
	print "Accept states:",
	for i in range(len(accept)):
		print "q" + accept[i],
	print ""

def changeState(q, symbol):
	#print "symbol: "+symbol + " q"+str(q)
	#print str(AFD[symbol]) + "[" + q + "]"
	return str(AFD[symbol][int(q)])

def runAutomaton(string, state):
	#print "StateA: " + state
	for char in string:
		if char not in alpha:
			print "\'" + char + "\' doesn't belongs to the alphabet, exiting..."
			print "Thanks for using the DFA simulator"
			return -1
		else:
			#print "Going from state q" + state,
			state = changeState(state, char)
			#print "to state q" + state + " using symbol " + char

	#print"StateB: " + state
	#print len(state)
	#print state in accept
	if state in accept:
		return 1
	else:
		return 0

#Read input data
f = open(sys.argv[1])
assert f

print "Welcome to DFA SIMULATOR\n"
print "File input: \n"

alpha = f.readline().split() #Stores alphabet
number_of_states = f.readline() #States
state0 = f.readline().strip() #Initialized with initial state
accept = f.readline().split() #Accept states

printInput()

AFD = {}

for q in range(int(number_of_states) + 1):
	print q
	transitions = f.readline().split()
	for i in range(len(transitions)):
		AFD = make_link(AFD, q, transitions[i], alpha[i])
		#print "from: " + str(q) + " to: " + str(transitions[i]) + " using: " + alpha[i]

print AFD

os.system("python Automaton.py "+sys.argv[1])

result = -2

while result <> -1:
	print "\nEnter a string to be processed by the automaton: ",
	string = raw_input()
	result = runAutomaton(string, state0)

	if result == 1:
		print "The string \"" + string + "\" belongs to the language. :)"
	elif result == 0:
		print "The string \"" + string + "\" DOES NOT belong to the language. :("
