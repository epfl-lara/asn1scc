; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47248 () Bool)

(assert start!47248)

(declare-fun b!225589 () Bool)

(declare-fun e!154030 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(declare-datatypes ((array!11230 0))(
  ( (array!11231 (arr!5885 (Array (_ BitVec 32) (_ BitVec 8))) (size!4928 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11230)

(assert (=> b!225589 (= e!154030 (bvsge i!761 (size!4928 arr!308)))))

(declare-datatypes ((BitStream!8952 0))(
  ( (BitStream!8953 (buf!5469 array!11230) (currentByte!10253 (_ BitVec 32)) (currentBit!10248 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19288 0))(
  ( (tuple2!19289 (_1!10431 (_ BitVec 8)) (_2!10431 BitStream!8952)) )
))
(declare-fun lt!358695 () tuple2!19288)

(declare-fun thiss!1870 () BitStream!8952)

(declare-fun readByte!0 (BitStream!8952) tuple2!19288)

(assert (=> b!225589 (= lt!358695 (readByte!0 thiss!1870))))

(declare-fun b!225590 () Bool)

(declare-fun e!154031 () Bool)

(declare-fun array_inv!4669 (array!11230) Bool)

(assert (=> b!225590 (= e!154031 (array_inv!4669 (buf!5469 thiss!1870)))))

(declare-fun b!225587 () Bool)

(declare-fun res!189298 () Bool)

(assert (=> b!225587 (=> (not res!189298) (not e!154030))))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225587 (= res!189298 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4928 (buf!5469 thiss!1870))) ((_ sign_extend 32) (currentByte!10253 thiss!1870)) ((_ sign_extend 32) (currentBit!10248 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189300 () Bool)

(assert (=> start!47248 (=> (not res!189300) (not e!154030))))

(assert (=> start!47248 (= res!189300 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4928 arr!308))))))

(assert (=> start!47248 e!154030))

(assert (=> start!47248 true))

(assert (=> start!47248 (array_inv!4669 arr!308)))

(declare-fun inv!12 (BitStream!8952) Bool)

(assert (=> start!47248 (and (inv!12 thiss!1870) e!154031)))

(declare-fun b!225588 () Bool)

(declare-fun res!189299 () Bool)

(assert (=> b!225588 (=> (not res!189299) (not e!154030))))

(assert (=> b!225588 (= res!189299 (bvslt i!761 to!496))))

(assert (= (and start!47248 res!189300) b!225587))

(assert (= (and b!225587 res!189298) b!225588))

(assert (= (and b!225588 res!189299) b!225589))

(assert (= start!47248 b!225590))

(declare-fun m!346627 () Bool)

(assert (=> b!225589 m!346627))

(declare-fun m!346629 () Bool)

(assert (=> b!225590 m!346629))

(declare-fun m!346631 () Bool)

(assert (=> b!225587 m!346631))

(declare-fun m!346633 () Bool)

(assert (=> start!47248 m!346633))

(declare-fun m!346635 () Bool)

(assert (=> start!47248 m!346635))

(check-sat (not b!225587) (not start!47248) (not b!225590) (not b!225589))
(check-sat)
