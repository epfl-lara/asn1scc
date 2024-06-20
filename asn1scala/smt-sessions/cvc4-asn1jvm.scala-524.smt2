; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15246 () Bool)

(assert start!15246)

(declare-fun bitNr!1 () (_ BitVec 32))

(declare-datatypes ((array!3297 0))(
  ( (array!3298 (arr!2132 (Array (_ BitVec 32) (_ BitVec 8))) (size!1531 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2624 0))(
  ( (BitStream!2625 (buf!1921 array!3297) (currentByte!3738 (_ BitVec 32)) (currentBit!3733 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2624)

(assert (=> start!15246 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!1531 (buf!1921 thiss!1107))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3738 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3733 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!15246 true))

(declare-fun e!51077 () Bool)

(declare-fun inv!12 (BitStream!2624) Bool)

(assert (=> start!15246 (and (inv!12 thiss!1107) e!51077)))

(declare-fun b!77889 () Bool)

(declare-fun array_inv!1377 (array!3297) Bool)

(assert (=> b!77889 (= e!51077 (array_inv!1377 (buf!1921 thiss!1107)))))

(assert (= start!15246 b!77889))

(declare-fun m!123511 () Bool)

(assert (=> start!15246 m!123511))

(declare-fun m!123513 () Bool)

(assert (=> b!77889 m!123513))

(push 1)

(assert (not start!15246))

(assert (not b!77889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

