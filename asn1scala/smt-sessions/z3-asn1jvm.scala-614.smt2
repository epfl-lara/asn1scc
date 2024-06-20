; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17460 () Bool)

(assert start!17460)

(declare-fun res!69069 () Bool)

(declare-fun e!56247 () Bool)

(assert (=> start!17460 (=> (not res!69069) (not e!56247))))

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3977 0))(
  ( (array!3978 (arr!2437 (Array (_ BitVec 32) (_ BitVec 8))) (size!1800 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3162 0))(
  ( (BitStream!3163 (buf!2190 array!3977) (currentByte!4348 (_ BitVec 32)) (currentBit!4343 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3162)

(assert (=> start!17460 (= res!69069 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!1800 (buf!2190 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4348 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4343 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1800 (buf!2190 thiss!1136))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4348 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4343 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17460 e!56247))

(assert (=> start!17460 true))

(declare-fun e!56246 () Bool)

(declare-fun inv!12 (BitStream!3162) Bool)

(assert (=> start!17460 (and (inv!12 thiss!1136) e!56246)))

(declare-fun b!84128 () Bool)

(declare-fun res!69070 () Bool)

(assert (=> b!84128 (=> (not res!69070) (not e!56247))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84128 (= res!69070 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4343 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4348 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (size!1800 (buf!2190 thiss!1136))))))))

(declare-fun b!84129 () Bool)

(assert (=> b!84129 (= e!56247 (bvslt ((_ sign_extend 32) nBits!333) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!84130 () Bool)

(declare-fun array_inv!1646 (array!3977) Bool)

(assert (=> b!84130 (= e!56246 (array_inv!1646 (buf!2190 thiss!1136)))))

(assert (= (and start!17460 res!69069) b!84128))

(assert (= (and b!84128 res!69070) b!84129))

(assert (= start!17460 b!84130))

(declare-fun m!130835 () Bool)

(assert (=> start!17460 m!130835))

(declare-fun m!130837 () Bool)

(assert (=> b!84128 m!130837))

(declare-fun m!130839 () Bool)

(assert (=> b!84130 m!130839))

(check-sat (not b!84130) (not b!84128) (not start!17460))
(check-sat)
