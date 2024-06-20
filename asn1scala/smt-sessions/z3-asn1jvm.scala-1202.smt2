; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34188 () Bool)

(assert start!34188)

(declare-fun res!135721 () Bool)

(declare-fun e!112454 () Bool)

(assert (=> start!34188 (=> (not res!135721) (not e!112454))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8077 0))(
  ( (array!8078 (arr!4541 (Array (_ BitVec 32) (_ BitVec 8))) (size!3620 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6396 0))(
  ( (BitStream!6397 (buf!4072 array!8077) (currentByte!7590 (_ BitVec 32)) (currentBit!7585 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6396)

(assert (=> start!34188 (= res!135721 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3620 (buf!4072 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7590 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7585 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3620 (buf!4072 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7590 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7585 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!34188 e!112454))

(assert (=> start!34188 true))

(declare-fun e!112452 () Bool)

(declare-fun inv!12 (BitStream!6396) Bool)

(assert (=> start!34188 (and (inv!12 thiss!1577) e!112452)))

(declare-fun b!162906 () Bool)

(declare-fun res!135720 () Bool)

(assert (=> b!162906 (=> (not res!135720) (not e!112454))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162906 (= res!135720 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7585 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7590 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (size!3620 (buf!4072 thiss!1577))))))))

(declare-fun b!162907 () Bool)

(assert (=> b!162907 (= e!112454 (bvslt ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!162908 () Bool)

(declare-fun array_inv!3361 (array!8077) Bool)

(assert (=> b!162908 (= e!112452 (array_inv!3361 (buf!4072 thiss!1577)))))

(assert (= (and start!34188 res!135721) b!162906))

(assert (= (and b!162906 res!135720) b!162907))

(assert (= start!34188 b!162908))

(declare-fun m!258679 () Bool)

(assert (=> start!34188 m!258679))

(declare-fun m!258681 () Bool)

(assert (=> b!162906 m!258681))

(declare-fun m!258683 () Bool)

(assert (=> b!162908 m!258683))

(check-sat (not b!162908) (not start!34188) (not b!162906))
(check-sat)
