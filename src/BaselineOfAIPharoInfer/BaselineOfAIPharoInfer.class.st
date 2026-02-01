Class {
	#name : 'BaselineOfAIPharoInfer',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfAIPharoInfer',
	#package : 'BaselineOfAIPharoInfer'
}

{ #category : 'baselines' }
BaselineOfAIPharoInfer >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec package: 'AI-PharoInfer'.
	  ]
]
