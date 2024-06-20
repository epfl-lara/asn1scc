; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63262 () Bool)

(assert start!63262)

(declare-datatypes ((array!16443 0))(
  ( (array!16444 (arr!8100 (Array (_ BitVec 32) (_ BitVec 8))) (size!7104 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12578 0))(
  ( (BitStream!12579 (buf!7350 array!16443) (currentByte!13615 (_ BitVec 32)) (currentBit!13610 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12578)

(assert (=> start!63262 (and (bvsle ((_ sign_extend 32) (size!7104 (buf!7350 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13615 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13610 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!7104 (buf!7350 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13615 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13610 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!202421 () Bool)

(declare-fun inv!12 (BitStream!12578) Bool)

(assert (=> start!63262 (and (inv!12 thiss!1939) e!202421)))

(declare-fun b!283548 () Bool)

(declare-fun array_inv!6797 (array!16443) Bool)

(assert (=> b!283548 (= e!202421 (array_inv!6797 (buf!7350 thiss!1939)))))

(assert (= start!63262 b!283548))

(declare-fun m!416573 () Bool)

(assert (=> start!63262 m!416573))

(declare-fun m!416575 () Bool)

(assert (=> b!283548 m!416575))

(push 1)

(assert (not start!63262))

(assert (not b!283548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

