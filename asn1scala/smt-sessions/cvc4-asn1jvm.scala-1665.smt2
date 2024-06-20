; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46284 () Bool)

(assert start!46284)

(declare-fun b!222944 () Bool)

(declare-fun res!187164 () Bool)

(declare-fun e!151678 () Bool)

(assert (=> b!222944 (=> (not res!187164) (not e!151678))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!222944 (= res!187164 (bvslt i!761 to!496))))

(declare-fun b!222945 () Bool)

(declare-fun res!187165 () Bool)

(assert (=> b!222945 (=> (not res!187165) (not e!151678))))

(declare-datatypes ((array!10942 0))(
  ( (array!10943 (arr!5733 (Array (_ BitVec 32) (_ BitVec 8))) (size!4803 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8708 0))(
  ( (BitStream!8709 (buf!5347 array!10942) (currentByte!10017 (_ BitVec 32)) (currentBit!10012 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8708)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222945 (= res!187165 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4803 (buf!5347 thiss!1870))) ((_ sign_extend 32) (currentByte!10017 thiss!1870)) ((_ sign_extend 32) (currentBit!10012 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!187167 () Bool)

(assert (=> start!46284 (=> (not res!187167) (not e!151678))))

(declare-fun arr!308 () array!10942)

(assert (=> start!46284 (= res!187167 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4803 arr!308))))))

(assert (=> start!46284 e!151678))

(assert (=> start!46284 true))

(declare-fun array_inv!4544 (array!10942) Bool)

(assert (=> start!46284 (array_inv!4544 arr!308)))

(declare-fun e!151679 () Bool)

(declare-fun inv!12 (BitStream!8708) Bool)

(assert (=> start!46284 (and (inv!12 thiss!1870) e!151679)))

(declare-fun b!222946 () Bool)

(declare-datatypes ((tuple2!19026 0))(
  ( (tuple2!19027 (_1!10222 (_ BitVec 8)) (_2!10222 BitStream!8708)) )
))
(declare-fun lt!351494 () tuple2!19026)

(declare-fun e!151682 () Bool)

(assert (=> b!222946 (= e!151682 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4803 (buf!5347 (_2!10222 lt!351494)))) ((_ sign_extend 32) (currentByte!10017 (_2!10222 lt!351494))) ((_ sign_extend 32) (currentBit!10012 (_2!10222 lt!351494))) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-fun b!222947 () Bool)

(assert (=> b!222947 (= e!151678 (not e!151682))))

(declare-fun res!187166 () Bool)

(assert (=> b!222947 (=> res!187166 e!151682)))

(assert (=> b!222947 (= res!187166 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!222947 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4803 (buf!5347 (_2!10222 lt!351494)))) ((_ sign_extend 32) (currentByte!10017 (_2!10222 lt!351494))) ((_ sign_extend 32) (currentBit!10012 (_2!10222 lt!351494))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16043 0))(
  ( (Unit!16044) )
))
(declare-fun lt!351493 () Unit!16043)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8708 BitStream!8708 (_ BitVec 64) (_ BitVec 32)) Unit!16043)

(assert (=> b!222947 (= lt!351493 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10222 lt!351494) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8708) tuple2!19026)

(assert (=> b!222947 (= lt!351494 (readByte!0 thiss!1870))))

(declare-fun b!222948 () Bool)

(assert (=> b!222948 (= e!151679 (array_inv!4544 (buf!5347 thiss!1870)))))

(assert (= (and start!46284 res!187167) b!222945))

(assert (= (and b!222945 res!187165) b!222944))

(assert (= (and b!222944 res!187164) b!222947))

(assert (= (and b!222947 (not res!187166)) b!222946))

(assert (= start!46284 b!222948))

(declare-fun m!341193 () Bool)

(assert (=> b!222947 m!341193))

(declare-fun m!341195 () Bool)

(assert (=> b!222947 m!341195))

(declare-fun m!341197 () Bool)

(assert (=> b!222947 m!341197))

(declare-fun m!341199 () Bool)

(assert (=> b!222948 m!341199))

(declare-fun m!341201 () Bool)

(assert (=> b!222946 m!341201))

(declare-fun m!341203 () Bool)

(assert (=> start!46284 m!341203))

(declare-fun m!341205 () Bool)

(assert (=> start!46284 m!341205))

(declare-fun m!341207 () Bool)

(assert (=> b!222945 m!341207))

(push 1)

(assert (not start!46284))

(assert (not b!222945))

(assert (not b!222948))

(assert (not b!222947))

(assert (not b!222946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

