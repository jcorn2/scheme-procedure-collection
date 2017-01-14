;ANN.ss A data structure for a neural network
;This is only a rough outline on the idea of a neural network
;Features such as backpropogation and generating output are still in design

;Example usage
;(addlayer (addlayer (ann 1) 3) 2)
;Creates an ANN with one ouput neuron, 3 neurons in the hidden layer, and 2 neurons in the input layer
; X X
;   X X
; X X

;A Node is merely a collection of weights for the next layer,
;and a point of aggregation for the previous layer
(define (Node num_of_weights)
  (define nodeVal 7);Currently set to a constant for the sake of testing
  (if (= 1 num_of_weights)
      nodeVal
      (cons (Node (- num_of_weights 1)) nodeVal)))

;A layer is just a stack of a Node objects
;At the top of each layer stack is an int, specifying the size of the stack.
(define (Layer size num_of_weights)
  (define (Layer-iter start end layer)
    (if (= end 1)
        (Node num_of_weights)
        (if (= start end)
            layer
            (Layer-iter (+ start 1) end (cons layer (Node num_of_weights))))))
  (Layer-iter 1 size (Node num_of_weights)))

;An ANN is just a stack of layer objects
;The ann creates the output layer and then adds the other layers on top of it.
(define (ann out_size)
  (cons (Layer out_size 1) out_size))

;Abstraction used to construct the desired ANN
(define (addlayer ann size)
  (cons (cons (Layer size (cdr ann)) ann) size) )
