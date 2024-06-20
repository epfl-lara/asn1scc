; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68764 () Bool)

(assert start!68764)

(declare-fun nBits!480 () (_ BitVec 64))

(declare-datatypes ((array!18893 0))(
  ( (array!18894 (arr!9282 (Array (_ BitVec 32) (_ BitVec 8))) (size!8199 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13508 0))(
  ( (BitStream!13509 (buf!7815 array!18893) (currentByte!14378 (_ BitVec 32)) (currentBit!14373 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13508)

(assert (=> start!68764 (and (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!8199 (buf!7815 bitStream!19))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14378 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14373 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!68764 true))

(declare-fun e!223099 () Bool)

(declare-fun inv!12 (BitStream!13508) Bool)

(assert (=> start!68764 (and (inv!12 bitStream!19) e!223099)))

(declare-fun b!310569 () Bool)

(declare-fun array_inv!7754 (array!18893) Bool)

(assert (=> b!310569 (= e!223099 (array_inv!7754 (buf!7815 bitStream!19)))))

(assert (= start!68764 b!310569))

(declare-fun m!448355 () Bool)

(assert (=> start!68764 m!448355))

(declare-fun m!448357 () Bool)

(assert (=> b!310569 m!448357))

(push 1)

(assert (not start!68764))

(assert (not b!310569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

