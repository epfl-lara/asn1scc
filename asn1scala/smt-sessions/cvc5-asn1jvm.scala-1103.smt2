; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31722 () Bool)

(assert start!31722)

(declare-datatypes ((array!7371 0))(
  ( (array!7372 (arr!4267 (Array (_ BitVec 32) (_ BitVec 8))) (size!3346 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5860 0))(
  ( (BitStream!5861 (buf!3804 array!7371) (currentByte!6992 (_ BitVec 32)) (currentBit!6987 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5860)

(declare-fun buf!77 () array!7371)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31722 (and (= (size!3346 (buf!3804 b1!99)) (size!3346 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!3346 (buf!3804 b1!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!6992 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!6987 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!107710 () Bool)

(declare-fun inv!12 (BitStream!5860) Bool)

(assert (=> start!31722 (and (inv!12 b1!99) e!107710)))

(declare-fun array_inv!3093 (array!7371) Bool)

(assert (=> start!31722 (array_inv!3093 buf!77)))

(assert (=> start!31722 true))

(declare-fun b!158472 () Bool)

(assert (=> b!158472 (= e!107710 (array_inv!3093 (buf!3804 b1!99)))))

(assert (= start!31722 b!158472))

(declare-fun m!248935 () Bool)

(assert (=> start!31722 m!248935))

(declare-fun m!248937 () Bool)

(assert (=> start!31722 m!248937))

(declare-fun m!248939 () Bool)

(assert (=> b!158472 m!248939))

(push 1)

(assert (not start!31722))

(assert (not b!158472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

