; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46734 () Bool)

(assert start!46734)

(declare-fun b!224183 () Bool)

(declare-fun res!188171 () Bool)

(declare-fun e!152725 () Bool)

(assert (=> b!224183 (=> (not res!188171) (not e!152725))))

(declare-datatypes ((array!11050 0))(
  ( (array!11051 (arr!5796 (Array (_ BitVec 32) (_ BitVec 8))) (size!4848 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8798 0))(
  ( (BitStream!8799 (buf!5392 array!11050) (currentByte!10120 (_ BitVec 32)) (currentBit!10115 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8798)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224183 (= res!188171 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4848 (buf!5392 thiss!1870))) ((_ sign_extend 32) (currentByte!10120 thiss!1870)) ((_ sign_extend 32) (currentBit!10115 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224186 () Bool)

(declare-fun e!152723 () Bool)

(declare-fun array_inv!4589 (array!11050) Bool)

(assert (=> b!224186 (= e!152723 (array_inv!4589 (buf!5392 thiss!1870)))))

(declare-fun b!224184 () Bool)

(declare-fun res!188172 () Bool)

(assert (=> b!224184 (=> (not res!188172) (not e!152725))))

(assert (=> b!224184 (= res!188172 (bvslt i!761 to!496))))

(declare-fun res!188170 () Bool)

(assert (=> start!46734 (=> (not res!188170) (not e!152725))))

(declare-fun arr!308 () array!11050)

(assert (=> start!46734 (= res!188170 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4848 arr!308))))))

(assert (=> start!46734 e!152725))

(assert (=> start!46734 true))

(assert (=> start!46734 (array_inv!4589 arr!308)))

(declare-fun inv!12 (BitStream!8798) Bool)

(assert (=> start!46734 (and (inv!12 thiss!1870) e!152723)))

(declare-fun b!224185 () Bool)

(assert (=> b!224185 (= e!152725 (not (bvsle i!761 (size!4848 arr!308))))))

(declare-datatypes ((Unit!16365 0))(
  ( (Unit!16366) )
))
(declare-datatypes ((tuple3!1222 0))(
  ( (tuple3!1223 (_1!10345 Unit!16365) (_2!10345 BitStream!8798) (_3!753 array!11050)) )
))
(declare-fun lt!355648 () tuple3!1222)

(declare-fun arrayRangesEq!744 (array!11050 array!11050 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224185 (arrayRangesEq!744 arr!308 (_3!753 lt!355648) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355655 () Unit!16365)

(declare-fun lt!355647 () array!11050)

(declare-fun arrayRangesEqTransitive!215 (array!11050 array!11050 array!11050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16365)

(assert (=> b!224185 (= lt!355655 (arrayRangesEqTransitive!215 arr!308 lt!355647 (_3!753 lt!355648) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224185 (arrayRangesEq!744 arr!308 lt!355647 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19184 0))(
  ( (tuple2!19185 (_1!10346 (_ BitVec 8)) (_2!10346 BitStream!8798)) )
))
(declare-fun lt!355653 () tuple2!19184)

(declare-fun lt!355654 () Unit!16365)

(declare-fun arrayUpdatedAtPrefixLemma!336 (array!11050 (_ BitVec 32) (_ BitVec 8)) Unit!16365)

(assert (=> b!224185 (= lt!355654 (arrayUpdatedAtPrefixLemma!336 arr!308 i!761 (_1!10346 lt!355653)))))

(declare-fun lt!355650 () (_ BitVec 32))

(declare-fun lt!355649 () (_ BitVec 64))

(declare-fun lt!355656 () (_ BitVec 64))

(declare-fun lt!355652 () (_ BitVec 64))

(assert (=> b!224185 (and (= (bvadd lt!355649 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355650))) lt!355652) (= (bvadd lt!355656 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355652) (= (buf!5392 thiss!1870) (buf!5392 (_2!10345 lt!355648))) (= (size!4848 arr!308) (size!4848 (_3!753 lt!355648))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224185 (= lt!355652 (bitIndex!0 (size!4848 (buf!5392 (_2!10345 lt!355648))) (currentByte!10120 (_2!10345 lt!355648)) (currentBit!10115 (_2!10345 lt!355648))))))

(assert (=> b!224185 (= lt!355649 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355656))))

(assert (=> b!224185 (= lt!355649 (bitIndex!0 (size!4848 (buf!5392 (_2!10346 lt!355653))) (currentByte!10120 (_2!10346 lt!355653)) (currentBit!10115 (_2!10346 lt!355653))))))

(assert (=> b!224185 (= lt!355656 (bitIndex!0 (size!4848 (buf!5392 thiss!1870)) (currentByte!10120 thiss!1870) (currentBit!10115 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8798 array!11050 (_ BitVec 32) (_ BitVec 32)) tuple3!1222)

(assert (=> b!224185 (= lt!355648 (readByteArrayLoop!0 (_2!10346 lt!355653) lt!355647 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224185 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4848 (buf!5392 (_2!10346 lt!355653)))) ((_ sign_extend 32) (currentByte!10120 (_2!10346 lt!355653))) ((_ sign_extend 32) (currentBit!10115 (_2!10346 lt!355653))) lt!355650)))

(assert (=> b!224185 (= lt!355650 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355651 () Unit!16365)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8798 BitStream!8798 (_ BitVec 64) (_ BitVec 32)) Unit!16365)

(assert (=> b!224185 (= lt!355651 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10346 lt!355653) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224185 (= lt!355647 (array!11051 (store (arr!5796 arr!308) i!761 (_1!10346 lt!355653)) (size!4848 arr!308)))))

(declare-fun readByte!0 (BitStream!8798) tuple2!19184)

(assert (=> b!224185 (= lt!355653 (readByte!0 thiss!1870))))

(assert (= (and start!46734 res!188170) b!224183))

(assert (= (and b!224183 res!188171) b!224184))

(assert (= (and b!224184 res!188172) b!224185))

(assert (= start!46734 b!224186))

(declare-fun m!343959 () Bool)

(assert (=> b!224183 m!343959))

(declare-fun m!343961 () Bool)

(assert (=> b!224186 m!343961))

(declare-fun m!343963 () Bool)

(assert (=> start!46734 m!343963))

(declare-fun m!343965 () Bool)

(assert (=> start!46734 m!343965))

(declare-fun m!343967 () Bool)

(assert (=> b!224185 m!343967))

(declare-fun m!343969 () Bool)

(assert (=> b!224185 m!343969))

(declare-fun m!343971 () Bool)

(assert (=> b!224185 m!343971))

(declare-fun m!343973 () Bool)

(assert (=> b!224185 m!343973))

(declare-fun m!343975 () Bool)

(assert (=> b!224185 m!343975))

(declare-fun m!343977 () Bool)

(assert (=> b!224185 m!343977))

(declare-fun m!343979 () Bool)

(assert (=> b!224185 m!343979))

(declare-fun m!343981 () Bool)

(assert (=> b!224185 m!343981))

(declare-fun m!343983 () Bool)

(assert (=> b!224185 m!343983))

(declare-fun m!343985 () Bool)

(assert (=> b!224185 m!343985))

(declare-fun m!343987 () Bool)

(assert (=> b!224185 m!343987))

(declare-fun m!343989 () Bool)

(assert (=> b!224185 m!343989))

(push 1)

(assert (not b!224185))

(assert (not b!224183))

(assert (not start!46734))

(assert (not b!224186))

(check-sat)

(pop 1)

(push 1)

(check-sat)

