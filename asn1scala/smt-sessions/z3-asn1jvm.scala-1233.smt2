; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34996 () Bool)

(assert start!34996)

(declare-fun res!137387 () Bool)

(declare-fun e!114011 () Bool)

(assert (=> start!34996 (=> (not res!137387) (not e!114011))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34996 (= res!137387 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34996 e!114011))

(assert (=> start!34996 true))

(declare-datatypes ((array!8303 0))(
  ( (array!8304 (arr!4634 (Array (_ BitVec 32) (_ BitVec 8))) (size!3713 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6582 0))(
  ( (BitStream!6583 (buf!4165 array!8303) (currentByte!7775 (_ BitVec 32)) (currentBit!7770 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6582)

(declare-fun e!114010 () Bool)

(declare-fun inv!12 (BitStream!6582) Bool)

(assert (=> start!34996 (and (inv!12 thiss!1577) e!114010)))

(declare-fun b!164893 () Bool)

(declare-fun res!137386 () Bool)

(assert (=> b!164893 (=> (not res!137386) (not e!114011))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164893 (= res!137386 (validate_offset_bits!1 ((_ sign_extend 32) (size!3713 (buf!4165 thiss!1577))) ((_ sign_extend 32) (currentByte!7775 thiss!1577)) ((_ sign_extend 32) (currentBit!7770 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164894 () Bool)

(assert (=> b!164894 (= e!114011 (or (bvslt nBits!511 #b00000000000000000000000000000000) (bvsge nBits!511 #b00000000000000000000000000001001)))))

(declare-fun b!164895 () Bool)

(declare-fun array_inv!3454 (array!8303) Bool)

(assert (=> b!164895 (= e!114010 (array_inv!3454 (buf!4165 thiss!1577)))))

(assert (= (and start!34996 res!137387) b!164893))

(assert (= (and b!164893 res!137386) b!164894))

(assert (= start!34996 b!164895))

(declare-fun m!262249 () Bool)

(assert (=> start!34996 m!262249))

(declare-fun m!262251 () Bool)

(assert (=> b!164893 m!262251))

(declare-fun m!262253 () Bool)

(assert (=> b!164895 m!262253))

(check-sat (not b!164895) (not b!164893) (not start!34996))
(check-sat)
