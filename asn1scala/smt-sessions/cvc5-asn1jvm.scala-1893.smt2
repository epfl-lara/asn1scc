; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49632 () Bool)

(assert start!49632)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12244 0))(
  ( (array!12245 (arr!6367 (Array (_ BitVec 32) (_ BitVec 8))) (size!5380 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9724 0))(
  ( (BitStream!9725 (buf!5855 array!12244) (currentByte!10907 (_ BitVec 32)) (currentBit!10902 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9724)

(assert (=> start!49632 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!5380 (buf!5855 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10907 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10902 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!49632 true))

(declare-fun e!161899 () Bool)

(declare-fun inv!12 (BitStream!9724) Bool)

(assert (=> start!49632 (and (inv!12 bs!63) e!161899)))

(declare-fun b!234266 () Bool)

(declare-fun array_inv!5121 (array!12244) Bool)

(assert (=> b!234266 (= e!161899 (array_inv!5121 (buf!5855 bs!63)))))

(assert (= start!49632 b!234266))

(declare-fun m!356905 () Bool)

(assert (=> start!49632 m!356905))

(declare-fun m!356907 () Bool)

(assert (=> b!234266 m!356907))

(push 1)

(assert (not start!49632))

(assert (not b!234266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

