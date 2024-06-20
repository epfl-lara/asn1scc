; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49642 () Bool)

(assert start!49642)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12254 0))(
  ( (array!12255 (arr!6372 (Array (_ BitVec 32) (_ BitVec 8))) (size!5385 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9734 0))(
  ( (BitStream!9735 (buf!5860 array!12254) (currentByte!10912 (_ BitVec 32)) (currentBit!10907 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9734)

(assert (=> start!49642 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5385 (buf!5860 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10912 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10907 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5385 (buf!5860 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10912 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10907 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!49642 true))

(declare-fun e!161929 () Bool)

(declare-fun inv!12 (BitStream!9734) Bool)

(assert (=> start!49642 (and (inv!12 bs!63) e!161929)))

(declare-fun b!234281 () Bool)

(declare-fun array_inv!5126 (array!12254) Bool)

(assert (=> b!234281 (= e!161929 (array_inv!5126 (buf!5860 bs!63)))))

(assert (= start!49642 b!234281))

(declare-fun m!356925 () Bool)

(assert (=> start!49642 m!356925))

(declare-fun m!356927 () Bool)

(assert (=> b!234281 m!356927))

(push 1)

(assert (not start!49642))

(assert (not b!234281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

