; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38342 () Bool)

(assert start!38342)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9233 0))(
  ( (array!9234 (arr!5006 (Array (_ BitVec 32) (_ BitVec 8))) (size!4076 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7260 0))(
  ( (BitStream!7261 (buf!4504 array!9233) (currentByte!8571 (_ BitVec 32)) (currentBit!8566 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7260)

(assert (=> start!38342 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!4076 (buf!4504 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8571 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8566 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!38342 true))

(declare-fun e!120378 () Bool)

(declare-fun inv!12 (BitStream!7260) Bool)

(assert (=> start!38342 (and (inv!12 thiss!1187) e!120378)))

(declare-fun b!172308 () Bool)

(declare-fun array_inv!3817 (array!9233) Bool)

(assert (=> b!172308 (= e!120378 (array_inv!3817 (buf!4504 thiss!1187)))))

(assert (= start!38342 b!172308))

(declare-fun m!271443 () Bool)

(assert (=> start!38342 m!271443))

(declare-fun m!271445 () Bool)

(assert (=> b!172308 m!271445))

(check-sat (not start!38342) (not b!172308))
(check-sat)
