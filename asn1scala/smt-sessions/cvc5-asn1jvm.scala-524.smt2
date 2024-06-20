; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15242 () Bool)

(assert start!15242)

(declare-fun bitNr!1 () (_ BitVec 32))

(declare-datatypes ((array!3293 0))(
  ( (array!3294 (arr!2130 (Array (_ BitVec 32) (_ BitVec 8))) (size!1529 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2620 0))(
  ( (BitStream!2621 (buf!1919 array!3293) (currentByte!3736 (_ BitVec 32)) (currentBit!3731 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2620)

(assert (=> start!15242 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!1529 (buf!1919 thiss!1107))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3736 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3731 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!15242 true))

(declare-fun e!51065 () Bool)

(declare-fun inv!12 (BitStream!2620) Bool)

(assert (=> start!15242 (and (inv!12 thiss!1107) e!51065)))

(declare-fun b!77883 () Bool)

(declare-fun array_inv!1375 (array!3293) Bool)

(assert (=> b!77883 (= e!51065 (array_inv!1375 (buf!1919 thiss!1107)))))

(assert (= start!15242 b!77883))

(declare-fun m!123503 () Bool)

(assert (=> start!15242 m!123503))

(declare-fun m!123505 () Bool)

(assert (=> b!77883 m!123505))

(push 1)

(assert (not b!77883))

(assert (not start!15242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

