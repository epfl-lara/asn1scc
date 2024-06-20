; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49636 () Bool)

(assert start!49636)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12248 0))(
  ( (array!12249 (arr!6369 (Array (_ BitVec 32) (_ BitVec 8))) (size!5382 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9728 0))(
  ( (BitStream!9729 (buf!5857 array!12248) (currentByte!10909 (_ BitVec 32)) (currentBit!10904 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9728)

(assert (=> start!49636 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!5382 (buf!5857 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10909 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10904 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!49636 true))

(declare-fun e!161911 () Bool)

(declare-fun inv!12 (BitStream!9728) Bool)

(assert (=> start!49636 (and (inv!12 bs!63) e!161911)))

(declare-fun b!234272 () Bool)

(declare-fun array_inv!5123 (array!12248) Bool)

(assert (=> b!234272 (= e!161911 (array_inv!5123 (buf!5857 bs!63)))))

(assert (= start!49636 b!234272))

(declare-fun m!356913 () Bool)

(assert (=> start!49636 m!356913))

(declare-fun m!356915 () Bool)

(assert (=> b!234272 m!356915))

(push 1)

(assert (not start!49636))

(assert (not b!234272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

