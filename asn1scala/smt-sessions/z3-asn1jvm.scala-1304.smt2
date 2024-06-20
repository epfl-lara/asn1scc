; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37116 () Bool)

(assert start!37116)

(declare-fun res!140471 () Bool)

(declare-fun e!117420 () Bool)

(assert (=> start!37116 (=> (not res!140471) (not e!117420))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37116 (= res!140471 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37116 e!117420))

(assert (=> start!37116 true))

(declare-datatypes ((array!8867 0))(
  ( (array!8868 (arr!4847 (Array (_ BitVec 32) (_ BitVec 8))) (size!3926 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7008 0))(
  ( (BitStream!7009 (buf!4378 array!8867) (currentByte!8341 (_ BitVec 32)) (currentBit!8336 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7008)

(declare-fun e!117418 () Bool)

(declare-fun inv!12 (BitStream!7008) Bool)

(assert (=> start!37116 (and (inv!12 thiss!1894) e!117418)))

(declare-fun b!168868 () Bool)

(declare-fun res!140470 () Bool)

(assert (=> b!168868 (=> (not res!140470) (not e!117420))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168868 (= res!140470 (validate_offset_bits!1 ((_ sign_extend 32) (size!3926 (buf!4378 thiss!1894))) ((_ sign_extend 32) (currentByte!8341 thiss!1894)) ((_ sign_extend 32) (currentBit!8336 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168869 () Bool)

(assert (=> b!168869 (= e!117420 (and (bvsgt (bvadd (currentBit!8336 thiss!1894) nBits!600) #b00000000000000000000000000001000) (or (bvslt nBits!600 #b00000000000000000000000000000000) (bvsge nBits!600 #b00000000000000000000000000001001))))))

(declare-fun b!168870 () Bool)

(declare-fun array_inv!3667 (array!8867) Bool)

(assert (=> b!168870 (= e!117418 (array_inv!3667 (buf!4378 thiss!1894)))))

(assert (= (and start!37116 res!140471) b!168868))

(assert (= (and b!168868 res!140470) b!168869))

(assert (= start!37116 b!168870))

(declare-fun m!268455 () Bool)

(assert (=> start!37116 m!268455))

(declare-fun m!268457 () Bool)

(assert (=> b!168868 m!268457))

(declare-fun m!268459 () Bool)

(assert (=> b!168870 m!268459))

(check-sat (not b!168870) (not b!168868) (not start!37116))
(check-sat)
