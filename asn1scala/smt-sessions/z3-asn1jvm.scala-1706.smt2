; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47242 () Bool)

(assert start!47242)

(declare-fun res!189275 () Bool)

(declare-fun e!153993 () Bool)

(assert (=> start!47242 (=> (not res!189275) (not e!153993))))

(declare-datatypes ((array!11224 0))(
  ( (array!11225 (arr!5882 (Array (_ BitVec 32) (_ BitVec 8))) (size!4925 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11224)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47242 (= res!189275 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4925 arr!308))))))

(assert (=> start!47242 e!153993))

(assert (=> start!47242 true))

(declare-fun array_inv!4666 (array!11224) Bool)

(assert (=> start!47242 (array_inv!4666 arr!308)))

(declare-datatypes ((BitStream!8946 0))(
  ( (BitStream!8947 (buf!5466 array!11224) (currentByte!10250 (_ BitVec 32)) (currentBit!10245 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8946)

(declare-fun e!153992 () Bool)

(declare-fun inv!12 (BitStream!8946) Bool)

(assert (=> start!47242 (and (inv!12 thiss!1870) e!153992)))

(declare-fun b!225555 () Bool)

(declare-fun res!189276 () Bool)

(assert (=> b!225555 (=> (not res!189276) (not e!153993))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225555 (= res!189276 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4925 (buf!5466 thiss!1870))) ((_ sign_extend 32) (currentByte!10250 thiss!1870)) ((_ sign_extend 32) (currentBit!10245 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225556 () Bool)

(assert (=> b!225556 (= e!153993 (and (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000))) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-fun b!225557 () Bool)

(assert (=> b!225557 (= e!153992 (array_inv!4666 (buf!5466 thiss!1870)))))

(assert (= (and start!47242 res!189275) b!225555))

(assert (= (and b!225555 res!189276) b!225556))

(assert (= start!47242 b!225557))

(declare-fun m!346601 () Bool)

(assert (=> start!47242 m!346601))

(declare-fun m!346603 () Bool)

(assert (=> start!47242 m!346603))

(declare-fun m!346605 () Bool)

(assert (=> b!225555 m!346605))

(declare-fun m!346607 () Bool)

(assert (=> b!225557 m!346607))

(check-sat (not b!225557) (not start!47242) (not b!225555))
(check-sat)
