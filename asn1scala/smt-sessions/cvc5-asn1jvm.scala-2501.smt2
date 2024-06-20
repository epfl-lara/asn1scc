; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63300 () Bool)

(assert start!63300)

(declare-fun res!235033 () Bool)

(declare-fun e!202457 () Bool)

(assert (=> start!63300 (=> (not res!235033) (not e!202457))))

(declare-datatypes ((array!16456 0))(
  ( (array!16457 (arr!8104 (Array (_ BitVec 32) (_ BitVec 8))) (size!7108 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12586 0))(
  ( (BitStream!12587 (buf!7354 array!16456) (currentByte!13623 (_ BitVec 32)) (currentBit!13618 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12586)

(assert (=> start!63300 (= res!235033 (and (bvsle ((_ sign_extend 32) (size!7108 (buf!7354 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13623 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13618 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7108 (buf!7354 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13623 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13618 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63300 e!202457))

(declare-fun e!202456 () Bool)

(declare-fun inv!12 (BitStream!12586) Bool)

(assert (=> start!63300 (and (inv!12 thiss!1939) e!202456)))

(declare-fun b!283573 () Bool)

(declare-fun res!235034 () Bool)

(assert (=> b!283573 (=> (not res!235034) (not e!202457))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283573 (= res!235034 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13618 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13623 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (size!7108 (buf!7354 thiss!1939))))))))

(declare-fun b!283574 () Bool)

(assert (=> b!283574 (= e!202457 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13623 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13618 thiss!1939))) #b00000000000000000000000000001111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283575 () Bool)

(declare-fun array_inv!6801 (array!16456) Bool)

(assert (=> b!283575 (= e!202456 (array_inv!6801 (buf!7354 thiss!1939)))))

(assert (= (and start!63300 res!235033) b!283573))

(assert (= (and b!283573 res!235034) b!283574))

(assert (= start!63300 b!283575))

(declare-fun m!416605 () Bool)

(assert (=> start!63300 m!416605))

(declare-fun m!416607 () Bool)

(assert (=> b!283573 m!416607))

(declare-fun m!416609 () Bool)

(assert (=> b!283575 m!416609))

(push 1)

(assert (not start!63300))

(assert (not b!283573))

