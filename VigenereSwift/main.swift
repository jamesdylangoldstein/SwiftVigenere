//
//  main.swift
//  VigenereSwift
//
//  Created by James Dylan Goldstein on 6/13/16.
//  Copyright © 2016 James Dylan Goldstein. All rights reserved.
//

import Foundation


// Prebuilt function that allows for the use of subscripts in strings
// http://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language
// Swift doesn't have subscripts defined
extension String
{
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start ..< end)]
    }
}

// Function to obtain a string that will be encoded using Vigenere's Cipher
func obtainSentenceToEncode() -> String
{
    print("Type the sentence you would like to encode")
    let sentenceToEncode = readLine(stripNewline: true)
    return sentenceToEncode!
}

// Function to repeat the cipher word over and over
func repeatCipherWord(cipherWord: String, sentenceToEncode: String) -> String
{
    
    var cipherWordRepeated = ""
    var endOfWordCounter = 0
    let sentenceLength = sentenceToEncode.characters.count
    let cipherWordLength = cipherWord.characters.count
    print("Scrambled word pass in as command line argument is: \(cipherWord)")
    
    for counter in 0..<sentenceLength
    {
        if((sentenceToEncode[counter] >= Character(UnicodeScalar(97)) && sentenceToEncode[counter] <= Character(UnicodeScalar(122))) || (sentenceToEncode[counter] >= Character(UnicodeScalar(65)) && sentenceToEncode[counter] <= Character(UnicodeScalar(90))))
        {
            cipherWordRepeated += cipherWord[endOfWordCounter]
        
            endOfWordCounter += 1;
            if (endOfWordCounter >= cipherWordLength)
            {
                endOfWordCounter = 0;
            }
        }
        else
        {
            cipherWordRepeated += " "
        }
    }
    
    return cipherWordRepeated
}

func sentenceEncoder(sentenceToEncode: String, cipherWordRepeated: String) -> String
{
    let sentenceLength = sentenceToEncode.characters.count
    var encodedSentence = ""
    
    for counter in 0..<sentenceLength
    {
        
        print("TEST")
        
    }
 
    return encodedSentence
}

let cipherWord = (Process.arguments[1])

let sentenceToEncode = obtainSentenceToEncode()

let cipherWordRepeated = repeatCipherWord(cipherWord, sentenceToEncode: sentenceToEncode)

print(cipherWordRepeated)

let encodedSentence = sentenceEncoder(sentenceToEncode, cipherWordRepeated: cipherWordRepeated)

print(encodedSentence)


