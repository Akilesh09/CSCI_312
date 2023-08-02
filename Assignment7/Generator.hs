{-
File: Generator.hs
Author: Akilesh Mahesh
Purpose: To write random English sentences.
-}


module Generator where
import MyRandom (randomInt, pickRandom, probability)

nouns :: [String]
nouns = ["boy","girl","dog","cat","table","chair","cake"]

verbs :: [String]
verbs = ["hit","threw","pushed","jumped","ate","spun"]

articles :: [String]
articles = ["a","the"]

conjunctions :: [String]
conjunctions = ["for","and","nor","but","or","yet","so"]

prepositions :: [String]
prepositions = ["with","to","from","on","below","above","beside"]

adjectives :: [String]
adjectives = ["big","small","short","tall","red","blue","yellow","green"]


-- Grammmar Rules

sentence :: IO String
sentence = do
	np <- noun_phrase
	vp <- verb_phrase
	prob <- probability 0.25
	if prob then do
		conj <- pickRandom conjunctions
		sen <- sentence
		return (np ++ " " ++ vp ++ ", " ++ conj ++ " " ++ sen)
	else do
		return (np ++ " " ++ vp)

noun_phrase :: IO String
noun_phrase = do
	article <- pickRandom articles
	prob <- probability 0.25
	noun <- pickRandom nouns
	if prob then do
		ap <- adjective_phrase
		return (article ++ " " ++ ap ++ " " ++ noun)
	else do
		return (article ++ " " ++ noun)

verb_phrase :: IO String
verb_phrase = do
	verb <- pickRandom verbs
	np <- noun_phrase
	pp <- prepositional_phrase
	return ( verb ++ " " ++ np ++ " " ++ pp)

prepositional_phrase :: IO String
prepositional_phrase = do
	prep <- pickRandom prepositions
	np <- noun_phrase
	return (prep ++ " " ++ np)

adjective_phrase :: IO String
adjective_phrase = do
	adj <- pickRandom adjectives
	prob <- probability 0.25
	if prob then do
		phrase <- adjective_phrase
		return (adj ++ " " ++ phrase)
	else do
		return adj

			

