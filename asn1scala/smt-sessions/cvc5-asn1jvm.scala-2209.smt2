; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56074 () Bool)

(assert start!56074)

(declare-datatypes ((array!14241 0))(
  ( (array!14242 (arr!7219 (Array (_ BitVec 32) (_ BitVec 8))) (size!6232 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11386 0))(
  ( (BitStream!11387 (buf!6754 array!14241) (currentByte!12428 (_ BitVec 32)) (currentBit!12423 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11386)

(declare-fun buf!79 () array!14241)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56074 (and (= (size!6232 (buf!6754 b1!100)) (size!6232 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!6232 (buf!6754 b1!100))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12428 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12423 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!180683 () Bool)

(declare-fun inv!12 (BitStream!11386) Bool)

(assert (=> start!56074 (and (inv!12 b1!100) e!180683)))

(declare-fun array_inv!5973 (array!14241) Bool)

(assert (=> start!56074 (array_inv!5973 buf!79)))

(assert (=> start!56074 true))

(declare-fun b!260317 () Bool)

(assert (=> b!260317 (= e!180683 (array_inv!5973 (buf!6754 b1!100)))))

(assert (= start!56074 b!260317))

(declare-fun m!389555 () Bool)

(assert (=> start!56074 m!389555))

(declare-fun m!389557 () Bool)

(assert (=> start!56074 m!389557))

(declare-fun m!389559 () Bool)

(assert (=> b!260317 m!389559))

(push 1)

(assert (not b!260317))

(assert (not start!56074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

