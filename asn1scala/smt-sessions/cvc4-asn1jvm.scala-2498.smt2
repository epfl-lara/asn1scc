; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63256 () Bool)

(assert start!63256)

(declare-datatypes ((array!16437 0))(
  ( (array!16438 (arr!8097 (Array (_ BitVec 32) (_ BitVec 8))) (size!7101 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12572 0))(
  ( (BitStream!12573 (buf!7347 array!16437) (currentByte!13612 (_ BitVec 32)) (currentBit!13607 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12572)

(assert (=> start!63256 (or (bvsgt ((_ sign_extend 32) (size!7101 (buf!7347 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13612 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13607 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!202403 () Bool)

(declare-fun inv!12 (BitStream!12572) Bool)

(assert (=> start!63256 (and (inv!12 thiss!1939) e!202403)))

(declare-fun b!283539 () Bool)

(declare-fun array_inv!6794 (array!16437) Bool)

(assert (=> b!283539 (= e!202403 (array_inv!6794 (buf!7347 thiss!1939)))))

(assert (= start!63256 b!283539))

(declare-fun m!416561 () Bool)

(assert (=> start!63256 m!416561))

(declare-fun m!416563 () Bool)

(assert (=> b!283539 m!416563))

(push 1)

(assert (not start!63256))

(assert (not b!283539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

