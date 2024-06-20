; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46260 () Bool)

(assert start!46260)

(declare-fun b!222754 () Bool)

(declare-fun e!151509 () Bool)

(assert (=> b!222754 (= e!151509 false)))

(declare-fun lt!351422 () (_ BitVec 64))

(declare-datatypes ((array!10918 0))(
  ( (array!10919 (arr!5721 (Array (_ BitVec 32) (_ BitVec 8))) (size!4791 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8684 0))(
  ( (BitStream!8685 (buf!5335 array!10918) (currentByte!10005 (_ BitVec 32)) (currentBit!10000 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8684)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222754 (= lt!351422 (bitIndex!0 (size!4791 (buf!5335 thiss!1870)) (currentByte!10005 thiss!1870) (currentBit!10000 thiss!1870)))))

(declare-fun b!222755 () Bool)

(declare-fun e!151510 () Bool)

(assert (=> b!222755 (= e!151510 e!151509)))

(declare-fun res!187012 () Bool)

(assert (=> b!222755 (=> (not res!187012) (not e!151509))))

(declare-datatypes ((tuple2!19002 0))(
  ( (tuple2!19003 (_1!10210 (_ BitVec 8)) (_2!10210 BitStream!8684)) )
))
(declare-fun lt!351421 () tuple2!19002)

(assert (=> b!222755 (= res!187012 (= (size!4791 (buf!5335 thiss!1870)) (size!4791 (buf!5335 (_2!10210 lt!351421)))))))

(declare-fun readByte!0 (BitStream!8684) tuple2!19002)

(assert (=> b!222755 (= lt!351421 (readByte!0 thiss!1870))))

(declare-fun b!222756 () Bool)

(declare-fun res!187013 () Bool)

(assert (=> b!222756 (=> (not res!187013) (not e!151510))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222756 (= res!187013 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4791 (buf!5335 thiss!1870))) ((_ sign_extend 32) (currentByte!10005 thiss!1870)) ((_ sign_extend 32) (currentBit!10000 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222757 () Bool)

(declare-fun e!151511 () Bool)

(declare-fun array_inv!4532 (array!10918) Bool)

(assert (=> b!222757 (= e!151511 (array_inv!4532 (buf!5335 thiss!1870)))))

(declare-fun res!187014 () Bool)

(assert (=> start!46260 (=> (not res!187014) (not e!151510))))

(declare-fun arr!308 () array!10918)

(assert (=> start!46260 (= res!187014 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4791 arr!308))))))

(assert (=> start!46260 e!151510))

(assert (=> start!46260 true))

(assert (=> start!46260 (array_inv!4532 arr!308)))

(declare-fun inv!12 (BitStream!8684) Bool)

(assert (=> start!46260 (and (inv!12 thiss!1870) e!151511)))

(declare-fun b!222758 () Bool)

(declare-fun res!187010 () Bool)

(assert (=> b!222758 (=> (not res!187010) (not e!151509))))

(assert (=> b!222758 (= res!187010 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4791 (buf!5335 (_2!10210 lt!351421))) (currentByte!10005 (_2!10210 lt!351421)) (currentBit!10000 (_2!10210 lt!351421)))))))

(declare-fun b!222759 () Bool)

(declare-fun res!187011 () Bool)

(assert (=> b!222759 (=> (not res!187011) (not e!151510))))

(assert (=> b!222759 (= res!187011 (bvslt i!761 to!496))))

(assert (= (and start!46260 res!187014) b!222756))

(assert (= (and b!222756 res!187013) b!222759))

(assert (= (and b!222759 res!187011) b!222755))

(assert (= (and b!222755 res!187012) b!222758))

(assert (= (and b!222758 res!187010) b!222754))

(assert (= start!46260 b!222757))

(declare-fun m!341021 () Bool)

(assert (=> start!46260 m!341021))

(declare-fun m!341023 () Bool)

(assert (=> start!46260 m!341023))

(declare-fun m!341025 () Bool)

(assert (=> b!222756 m!341025))

(declare-fun m!341027 () Bool)

(assert (=> b!222757 m!341027))

(declare-fun m!341029 () Bool)

(assert (=> b!222755 m!341029))

(declare-fun m!341031 () Bool)

(assert (=> b!222754 m!341031))

(declare-fun m!341033 () Bool)

(assert (=> b!222758 m!341033))

(push 1)

(assert (not b!222758))

(assert (not b!222754))

(assert (not b!222756))

(assert (not b!222757))

(assert (not start!46260))

(assert (not b!222755))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

