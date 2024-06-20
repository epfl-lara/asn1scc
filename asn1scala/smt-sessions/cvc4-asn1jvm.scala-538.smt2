; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15724 () Bool)

(assert start!15724)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((array!3407 0))(
  ( (array!3408 (arr!2174 (Array (_ BitVec 32) (_ BitVec 8))) (size!1573 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2708 0))(
  ( (BitStream!2709 (buf!1963 array!3407) (currentByte!3840 (_ BitVec 32)) (currentBit!3835 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2708)

(assert (=> start!15724 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1573 (buf!1963 thiss!1716))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3840 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3835 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1573 (buf!1963 thiss!1716))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3840 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3835 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15724 true))

(declare-fun e!52217 () Bool)

(declare-fun inv!12 (BitStream!2708) Bool)

(assert (=> start!15724 (and (inv!12 thiss!1716) e!52217)))

(declare-fun b!79506 () Bool)

(declare-fun array_inv!1419 (array!3407) Bool)

(assert (=> b!79506 (= e!52217 (array_inv!1419 (buf!1963 thiss!1716)))))

(assert (= start!15724 b!79506))

(declare-fun m!124919 () Bool)

(assert (=> start!15724 m!124919))

(declare-fun m!124921 () Bool)

(assert (=> b!79506 m!124921))

(push 1)

(assert (not b!79506))

(assert (not start!15724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

