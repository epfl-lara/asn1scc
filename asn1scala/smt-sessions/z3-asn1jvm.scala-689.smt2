; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19398 () Bool)

(assert start!19398)

(declare-fun res!79503 () Bool)

(declare-fun e!63495 () Bool)

(assert (=> start!19398 (=> (not res!79503) (not e!63495))))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4524 0))(
  ( (array!4525 (arr!2662 (Array (_ BitVec 32) (_ BitVec 8))) (size!2069 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3612 0))(
  ( (BitStream!3613 (buf!2415 array!4524) (currentByte!4822 (_ BitVec 32)) (currentBit!4817 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3612)

(assert (=> start!19398 (= res!79503 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2069 (buf!2415 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4822 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4817 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2069 (buf!2415 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4822 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4817 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19398 e!63495))

(assert (=> start!19398 true))

(declare-fun e!63494 () Bool)

(declare-fun inv!12 (BitStream!3612) Bool)

(assert (=> start!19398 (and (inv!12 thiss!1288) e!63494)))

(declare-fun b!96868 () Bool)

(declare-fun res!79504 () Bool)

(assert (=> b!96868 (=> (not res!79504) (not e!63495))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96868 (= res!79504 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4817 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4822 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (size!2069 (buf!2415 thiss!1288))))))))

(declare-fun b!96869 () Bool)

(assert (=> b!96869 (= e!63495 (bvslt ((_ sign_extend 32) nBits!388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!96870 () Bool)

(declare-fun array_inv!1871 (array!4524) Bool)

(assert (=> b!96870 (= e!63494 (array_inv!1871 (buf!2415 thiss!1288)))))

(assert (= (and start!19398 res!79503) b!96868))

(assert (= (and b!96868 res!79504) b!96869))

(assert (= start!19398 b!96870))

(declare-fun m!140517 () Bool)

(assert (=> start!19398 m!140517))

(declare-fun m!140519 () Bool)

(assert (=> b!96868 m!140519))

(declare-fun m!140521 () Bool)

(assert (=> b!96870 m!140521))

(check-sat (not b!96870) (not b!96868) (not start!19398))
(check-sat)
