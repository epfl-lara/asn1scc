; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49638 () Bool)

(assert start!49638)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12250 0))(
  ( (array!12251 (arr!6370 (Array (_ BitVec 32) (_ BitVec 8))) (size!5383 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9730 0))(
  ( (BitStream!9731 (buf!5858 array!12250) (currentByte!10910 (_ BitVec 32)) (currentBit!10905 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9730)

(assert (=> start!49638 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5383 (buf!5858 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10910 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10905 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5383 (buf!5858 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10910 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10905 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!49638 true))

(declare-fun e!161917 () Bool)

(declare-fun inv!12 (BitStream!9730) Bool)

(assert (=> start!49638 (and (inv!12 bs!63) e!161917)))

(declare-fun b!234275 () Bool)

(declare-fun array_inv!5124 (array!12250) Bool)

(assert (=> b!234275 (= e!161917 (array_inv!5124 (buf!5858 bs!63)))))

(assert (= start!49638 b!234275))

(declare-fun m!356917 () Bool)

(assert (=> start!49638 m!356917))

(declare-fun m!356919 () Bool)

(assert (=> b!234275 m!356919))

(push 1)

(assert (not b!234275))

(assert (not start!49638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78934 () Bool)

(assert (=> d!78934 (= (array_inv!5124 (buf!5858 bs!63)) (bvsge (size!5383 (buf!5858 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234275 d!78934))

(declare-fun d!78936 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

