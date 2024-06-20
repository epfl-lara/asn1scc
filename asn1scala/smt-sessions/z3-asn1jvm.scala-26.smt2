; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!640 () Bool)

(assert start!640)

(declare-fun res!3691 () Bool)

(declare-fun e!1254 () Bool)

(assert (=> start!640 (=> (not res!3691) (not e!1254))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!164 0))(
  ( (array!165 (arr!449 (Array (_ BitVec 32) (_ BitVec 8))) (size!62 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!164)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!640 (= res!3691 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!62 srcBuffer!6))))))))

(assert (=> start!640 e!1254))

(assert (=> start!640 true))

(declare-fun array_inv!57 (array!164) Bool)

(assert (=> start!640 (array_inv!57 srcBuffer!6)))

(declare-datatypes ((BitStream!102 0))(
  ( (BitStream!103 (buf!371 array!164) (currentByte!1320 (_ BitVec 32)) (currentBit!1315 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!102)

(declare-fun e!1253 () Bool)

(declare-fun inv!12 (BitStream!102) Bool)

(assert (=> start!640 (and (inv!12 thiss!1486) e!1253)))

(declare-fun b!1861 () Bool)

(declare-fun res!3690 () Bool)

(assert (=> b!1861 (=> (not res!3690) (not e!1254))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1861 (= res!3690 (validate_offset_bits!1 ((_ sign_extend 32) (size!62 (buf!371 thiss!1486))) ((_ sign_extend 32) (currentByte!1320 thiss!1486)) ((_ sign_extend 32) (currentBit!1315 thiss!1486)) nBits!460))))

(declare-fun b!1862 () Bool)

(assert (=> b!1862 (= e!1254 (bvslt (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1863 () Bool)

(assert (=> b!1863 (= e!1253 (array_inv!57 (buf!371 thiss!1486)))))

(assert (= (and start!640 res!3691) b!1861))

(assert (= (and b!1861 res!3690) b!1862))

(assert (= start!640 b!1863))

(declare-fun m!1313 () Bool)

(assert (=> start!640 m!1313))

(declare-fun m!1315 () Bool)

(assert (=> start!640 m!1315))

(declare-fun m!1317 () Bool)

(assert (=> b!1861 m!1317))

(declare-fun m!1319 () Bool)

(assert (=> b!1863 m!1319))

(check-sat (not b!1861) (not b!1863) (not start!640))
(check-sat)
