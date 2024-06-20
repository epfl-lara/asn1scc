; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35854 () Bool)

(assert start!35854)

(declare-fun res!138646 () Bool)

(declare-fun e!115371 () Bool)

(assert (=> start!35854 (=> (not res!138646) (not e!115371))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35854 (= res!138646 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35854 e!115371))

(assert (=> start!35854 true))

(declare-datatypes ((array!8534 0))(
  ( (array!8535 (arr!4721 (Array (_ BitVec 32) (_ BitVec 8))) (size!3800 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6756 0))(
  ( (BitStream!6757 (buf!4252 array!8534) (currentByte!8017 (_ BitVec 32)) (currentBit!8012 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6756)

(declare-fun e!115369 () Bool)

(declare-fun inv!12 (BitStream!6756) Bool)

(assert (=> start!35854 (and (inv!12 thiss!1577) e!115369)))

(declare-fun b!166519 () Bool)

(declare-fun res!138647 () Bool)

(assert (=> b!166519 (=> (not res!138647) (not e!115371))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166519 (= res!138647 (validate_offset_bits!1 ((_ sign_extend 32) (size!3800 (buf!4252 thiss!1577))) ((_ sign_extend 32) (currentByte!8017 thiss!1577)) ((_ sign_extend 32) (currentBit!8012 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166520 () Bool)

(assert (=> b!166520 (= e!115371 (and (bvsgt (bvadd (currentBit!8012 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!8012 thiss!1577) nBits!511) #b00000000000000000000000000001000)) #b00000000000000000000000000100000)))))

(declare-fun b!166521 () Bool)

(declare-fun array_inv!3541 (array!8534) Bool)

(assert (=> b!166521 (= e!115369 (array_inv!3541 (buf!4252 thiss!1577)))))

(assert (= (and start!35854 res!138646) b!166519))

(assert (= (and b!166519 res!138647) b!166520))

(assert (= start!35854 b!166521))

(declare-fun m!264541 () Bool)

(assert (=> start!35854 m!264541))

(declare-fun m!264543 () Bool)

(assert (=> b!166519 m!264543))

(declare-fun m!264545 () Bool)

(assert (=> b!166521 m!264545))

(check-sat (not b!166521) (not b!166519) (not start!35854))
(check-sat)
