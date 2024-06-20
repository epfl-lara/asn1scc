; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63514 () Bool)

(assert start!63514)

(declare-datatypes ((array!16537 0))(
  ( (array!16538 (arr!8137 (Array (_ BitVec 32) (_ BitVec 8))) (size!7141 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12652 0))(
  ( (BitStream!12653 (buf!7387 array!16537) (currentByte!13688 (_ BitVec 32)) (currentBit!13683 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12652)

(assert (=> start!63514 (or (bvsgt ((_ sign_extend 32) (size!7141 (buf!7387 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13688 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13683 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!202784 () Bool)

(declare-fun inv!12 (BitStream!12652) Bool)

(assert (=> start!63514 (and (inv!12 thiss!1929) e!202784)))

(declare-fun b!283833 () Bool)

(declare-fun array_inv!6834 (array!16537) Bool)

(assert (=> b!283833 (= e!202784 (array_inv!6834 (buf!7387 thiss!1929)))))

(assert (= start!63514 b!283833))

(declare-fun m!416947 () Bool)

(assert (=> start!63514 m!416947))

(declare-fun m!416949 () Bool)

(assert (=> b!283833 m!416949))

(push 1)

(assert (not start!63514))

(assert (not b!283833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

