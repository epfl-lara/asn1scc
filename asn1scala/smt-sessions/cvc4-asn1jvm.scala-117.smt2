; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2748 () Bool)

(assert start!2748)

(declare-datatypes ((array!721 0))(
  ( (array!722 (arr!744 (Array (_ BitVec 32) (_ BitVec 8))) (size!315 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!590 0))(
  ( (BitStream!591 (buf!666 array!721) (currentByte!1750 (_ BitVec 32)) (currentBit!1745 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!590)

(assert (=> start!2748 (or (bvsgt ((_ sign_extend 32) (size!315 (buf!666 thiss!957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1750 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1745 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!7972 () Bool)

(declare-fun inv!12 (BitStream!590) Bool)

(assert (=> start!2748 (and (inv!12 thiss!957) e!7972)))

(declare-fun b!13119 () Bool)

(declare-fun array_inv!304 (array!721) Bool)

(assert (=> b!13119 (= e!7972 (array_inv!304 (buf!666 thiss!957)))))

(assert (= start!2748 b!13119))

(declare-fun m!19771 () Bool)

(assert (=> start!2748 m!19771))

(declare-fun m!19773 () Bool)

(assert (=> b!13119 m!19773))

(push 1)

(assert (not start!2748))

(assert (not b!13119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

