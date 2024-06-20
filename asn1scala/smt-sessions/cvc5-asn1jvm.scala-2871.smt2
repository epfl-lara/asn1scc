; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68760 () Bool)

(assert start!68760)

(declare-fun nBits!480 () (_ BitVec 64))

(declare-datatypes ((array!18889 0))(
  ( (array!18890 (arr!9280 (Array (_ BitVec 32) (_ BitVec 8))) (size!8197 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13504 0))(
  ( (BitStream!13505 (buf!7813 array!18889) (currentByte!14376 (_ BitVec 32)) (currentBit!14371 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13504)

(assert (=> start!68760 (and (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!8197 (buf!7813 bitStream!19))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14376 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14371 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!68760 true))

(declare-fun e!223087 () Bool)

(declare-fun inv!12 (BitStream!13504) Bool)

(assert (=> start!68760 (and (inv!12 bitStream!19) e!223087)))

(declare-fun b!310563 () Bool)

(declare-fun array_inv!7752 (array!18889) Bool)

(assert (=> b!310563 (= e!223087 (array_inv!7752 (buf!7813 bitStream!19)))))

(assert (= start!68760 b!310563))

(declare-fun m!448347 () Bool)

(assert (=> start!68760 m!448347))

(declare-fun m!448349 () Bool)

(assert (=> b!310563 m!448349))

(push 1)

(assert (not b!310563))

(assert (not start!68760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

