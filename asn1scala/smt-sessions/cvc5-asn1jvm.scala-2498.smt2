; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63252 () Bool)

(assert start!63252)

(declare-datatypes ((array!16433 0))(
  ( (array!16434 (arr!8095 (Array (_ BitVec 32) (_ BitVec 8))) (size!7099 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12568 0))(
  ( (BitStream!12569 (buf!7345 array!16433) (currentByte!13610 (_ BitVec 32)) (currentBit!13605 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12568)

(assert (=> start!63252 (or (bvsgt ((_ sign_extend 32) (size!7099 (buf!7345 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13610 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13605 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!202391 () Bool)

(declare-fun inv!12 (BitStream!12568) Bool)

(assert (=> start!63252 (and (inv!12 thiss!1939) e!202391)))

(declare-fun b!283533 () Bool)

(declare-fun array_inv!6792 (array!16433) Bool)

(assert (=> b!283533 (= e!202391 (array_inv!6792 (buf!7345 thiss!1939)))))

(assert (= start!63252 b!283533))

(declare-fun m!416553 () Bool)

(assert (=> start!63252 m!416553))

(declare-fun m!416555 () Bool)

(assert (=> b!283533 m!416555))

(push 1)

(assert (not start!63252))

(assert (not b!283533))

(check-sat)

(pop 1)

(push 1)

(check-sat)

