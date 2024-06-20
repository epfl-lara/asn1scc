; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19354 () Bool)

(assert start!19354)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4502 0))(
  ( (array!4503 (arr!2653 (Array (_ BitVec 32) (_ BitVec 8))) (size!2060 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3594 0))(
  ( (BitStream!3595 (buf!2406 array!4502) (currentByte!4809 (_ BitVec 32)) (currentBit!4804 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3594)

(assert (=> start!19354 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!2060 (buf!2406 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4809 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4804 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!19354 true))

(declare-fun e!63425 () Bool)

(declare-fun inv!12 (BitStream!3594) Bool)

(assert (=> start!19354 (and (inv!12 thiss!1288) e!63425)))

(declare-fun b!96822 () Bool)

(declare-fun array_inv!1862 (array!4502) Bool)

(assert (=> b!96822 (= e!63425 (array_inv!1862 (buf!2406 thiss!1288)))))

(assert (= start!19354 b!96822))

(declare-fun m!140465 () Bool)

(assert (=> start!19354 m!140465))

(declare-fun m!140467 () Bool)

(assert (=> b!96822 m!140467))

(check-sat (not start!19354) (not b!96822))
(check-sat)
