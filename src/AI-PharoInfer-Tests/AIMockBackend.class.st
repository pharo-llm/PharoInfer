Class {
	#name : 'AIMockBackend',
	#superclass : 'AIBackend',
	#instVars : [
		'tokenizer'
	],
	#category : 'AI-PharoInfer-Tests-Mock',
	#package : 'AI-PharoInfer-Tests',
	#tag : 'Mock'
}

{ #category : 'private' }
AIMockBackend >> generateEmbeddings: text model: aModel [

	"Generate mock embeddings for testing - returns a single flat vector"
	| hash dimensions embedding |

	dimensions := 768.
	hash := text hash abs.

	"Generate a deterministic embedding based on text hash"
	embedding := Array new: dimensions.
	1 to: dimensions do: [ :i |
		embedding at: i put: ((hash + i) / 1000.0) ].

	^ embedding
]

{ #category : 'private' }
AIMockBackend >> generateText: prompt model: aModel options: options [

	"Generate mock text for testing"
	| tokens |

	"Return a simple mock response"
	tokens := OrderedCollection new.
	options maxTokens timesRepeat: [
		tokens add: 'token' ].

	^ 'Mock response for: ', prompt
]

{ #category : 'private' }
AIMockBackend >> initialize [

	super initialize.
	tokenizer := AITokenizer new
]

{ #category : 'private' }
AIMockBackend >> loadModel: aModel [

	"Mock backend doesn't need to actually load models"
	^ self
]

{ #category : 'private' }
AIMockBackend >> streamText: prompt model: aModel options: options onToken: aBlock [

	"Stream mock tokens for testing"
	| words |

	words := #('Mock' 'streaming' 'response' 'for' 'testing').

	1 to: (options maxTokens min: words size) do: [ :i |
		aBlock value: (words at: i), ' ' ]
]

{ #category : 'private' }
AIMockBackend >> tokenizer [

	^ tokenizer
]

{ #category : 'private' }
AIMockBackend >> tokenizer: anObject [

	tokenizer := anObject
]

{ #category : 'private' }
AIMockBackend >> unloadModel: aModel [

	"Mock backend doesn't need to unload"
	^ self
]
