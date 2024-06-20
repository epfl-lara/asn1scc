; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2744 () Bool)

(assert start!2744)

(declare-datatypes ((array!717 0))(
  ( (array!718 (arr!742 (Array (_ BitVec 32) (_ BitVec 8))) (size!313 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!586 0))(
  ( (BitStream!587 (buf!664 array!717) (currentByte!1748 (_ BitVec 32)) (currentBit!1743 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!586)

(assert (=> start!2744 (or (bvsgt ((_ sign_extend 32) (size!313 (buf!664 thiss!957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1748 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1743 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!7960 () Bool)

(declare-fun inv!12 (BitStream!586) Bool)

(assert (=> start!2744 (and (inv!12 thiss!957) e!7960)))

(declare-fun b!13113 () Bool)

(declare-fun array_inv!302 (array!717) Bool)

(assert (=> b!13113 (= e!7960 (array_inv!302 (buf!664 thiss!957)))))

(assert (= start!2744 b!13113))

(declare-fun m!19763 () Bool)

(assert (=> start!2744 m!19763))

(declare-fun m!19765 () Bool)

(assert (=> b!13113 m!19765))

(push 1)

(assert (not b!13113))

(assert (not start!2744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

