; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47380 () Bool)

(assert start!47380)

(declare-fun b!225987 () Bool)

(declare-fun e!154403 () Bool)

(declare-datatypes ((array!11281 0))(
  ( (array!11282 (arr!5906 (Array (_ BitVec 32) (_ BitVec 8))) (size!4949 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8994 0))(
  ( (BitStream!8995 (buf!5490 array!11281) (currentByte!10292 (_ BitVec 32)) (currentBit!10287 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8994)

(declare-fun array_inv!4690 (array!11281) Bool)

(assert (=> b!225987 (= e!154403 (array_inv!4690 (buf!5490 thiss!1870)))))

(declare-fun b!225985 () Bool)

(declare-fun res!189643 () Bool)

(declare-fun e!154402 () Bool)

(assert (=> b!225985 (=> (not res!189643) (not e!154402))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225985 (= res!189643 (bvslt i!761 to!496))))

(declare-fun res!189642 () Bool)

(assert (=> start!47380 (=> (not res!189642) (not e!154402))))

(declare-fun arr!308 () array!11281)

(assert (=> start!47380 (= res!189642 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4949 arr!308))))))

(assert (=> start!47380 e!154402))

(assert (=> start!47380 true))

(assert (=> start!47380 (array_inv!4690 arr!308)))

(declare-fun inv!12 (BitStream!8994) Bool)

(assert (=> start!47380 (and (inv!12 thiss!1870) e!154403)))

(declare-fun b!225984 () Bool)

(declare-fun res!189641 () Bool)

(assert (=> b!225984 (=> (not res!189641) (not e!154402))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225984 (= res!189641 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4949 (buf!5490 thiss!1870))) ((_ sign_extend 32) (currentByte!10292 thiss!1870)) ((_ sign_extend 32) (currentBit!10287 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225986 () Bool)

(assert (=> b!225986 (= e!154402 (not (or (not (= (bvand i!761 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!761 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19348 0))(
  ( (tuple2!19349 (_1!10461 (_ BitVec 8)) (_2!10461 BitStream!8994)) )
))
(declare-fun lt!359109 () tuple2!19348)

(assert (=> b!225986 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4949 (buf!5490 (_2!10461 lt!359109)))) ((_ sign_extend 32) (currentByte!10292 (_2!10461 lt!359109))) ((_ sign_extend 32) (currentBit!10287 (_2!10461 lt!359109))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16643 0))(
  ( (Unit!16644) )
))
(declare-fun lt!359108 () Unit!16643)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8994 BitStream!8994 (_ BitVec 64) (_ BitVec 32)) Unit!16643)

(assert (=> b!225986 (= lt!359108 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10461 lt!359109) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8994) tuple2!19348)

(assert (=> b!225986 (= lt!359109 (readByte!0 thiss!1870))))

(assert (= (and start!47380 res!189642) b!225984))

(assert (= (and b!225984 res!189641) b!225985))

(assert (= (and b!225985 res!189643) b!225986))

(assert (= start!47380 b!225987))

(declare-fun m!347019 () Bool)

(assert (=> b!225987 m!347019))

(declare-fun m!347021 () Bool)

(assert (=> start!47380 m!347021))

(declare-fun m!347023 () Bool)

(assert (=> start!47380 m!347023))

(declare-fun m!347025 () Bool)

(assert (=> b!225984 m!347025))

(declare-fun m!347027 () Bool)

(assert (=> b!225986 m!347027))

(declare-fun m!347029 () Bool)

(assert (=> b!225986 m!347029))

(declare-fun m!347031 () Bool)

(assert (=> b!225986 m!347031))

(check-sat (not b!225984) (not b!225986) (not start!47380) (not b!225987))
(check-sat)
