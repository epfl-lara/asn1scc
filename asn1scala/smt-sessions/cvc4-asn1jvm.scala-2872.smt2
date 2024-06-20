; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68770 () Bool)

(assert start!68770)

(declare-fun nBits!480 () (_ BitVec 64))

(declare-datatypes ((array!18899 0))(
  ( (array!18900 (arr!9285 (Array (_ BitVec 32) (_ BitVec 8))) (size!8202 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13514 0))(
  ( (BitStream!13515 (buf!7818 array!18899) (currentByte!14381 (_ BitVec 32)) (currentBit!14376 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13514)

(assert (=> start!68770 (and (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!8202 (buf!7818 bitStream!19))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14381 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14376 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8202 (buf!7818 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14381 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14376 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!68770 true))

(declare-fun e!223117 () Bool)

(declare-fun inv!12 (BitStream!13514) Bool)

(assert (=> start!68770 (and (inv!12 bitStream!19) e!223117)))

(declare-fun b!310578 () Bool)

(declare-fun array_inv!7757 (array!18899) Bool)

(assert (=> b!310578 (= e!223117 (array_inv!7757 (buf!7818 bitStream!19)))))

(assert (= start!68770 b!310578))

(declare-fun m!448367 () Bool)

(assert (=> start!68770 m!448367))

(declare-fun m!448369 () Bool)

(assert (=> b!310578 m!448369))

(push 1)

(assert (not start!68770))

(assert (not b!310578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

