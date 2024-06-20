; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46694 () Bool)

(assert start!46694)

(declare-fun b!223946 () Bool)

(declare-fun e!152485 () Bool)

(declare-datatypes ((array!11010 0))(
  ( (array!11011 (arr!5776 (Array (_ BitVec 32) (_ BitVec 8))) (size!4828 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8758 0))(
  ( (BitStream!8759 (buf!5372 array!11010) (currentByte!10100 (_ BitVec 32)) (currentBit!10095 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8758)

(declare-fun array_inv!4569 (array!11010) Bool)

(assert (=> b!223946 (= e!152485 (array_inv!4569 (buf!5372 thiss!1870)))))

(declare-fun res!187991 () Bool)

(declare-fun e!152484 () Bool)

(assert (=> start!46694 (=> (not res!187991) (not e!152484))))

(declare-fun arr!308 () array!11010)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46694 (= res!187991 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4828 arr!308))))))

(assert (=> start!46694 e!152484))

(assert (=> start!46694 true))

(assert (=> start!46694 (array_inv!4569 arr!308)))

(declare-fun inv!12 (BitStream!8758) Bool)

(assert (=> start!46694 (and (inv!12 thiss!1870) e!152485)))

(declare-fun b!223944 () Bool)

(declare-fun res!187992 () Bool)

(assert (=> b!223944 (=> (not res!187992) (not e!152484))))

(assert (=> b!223944 (= res!187992 (bvslt i!761 to!496))))

(declare-fun b!223943 () Bool)

(declare-fun res!187990 () Bool)

(assert (=> b!223943 (=> (not res!187990) (not e!152484))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223943 (= res!187990 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4828 (buf!5372 thiss!1870))) ((_ sign_extend 32) (currentByte!10100 thiss!1870)) ((_ sign_extend 32) (currentBit!10095 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223945 () Bool)

(assert (=> b!223945 (= e!152484 (not true))))

(declare-fun lt!355084 () array!11010)

(declare-fun arrayRangesEq!724 (array!11010 array!11010 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223945 (arrayRangesEq!724 arr!308 lt!355084 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16325 0))(
  ( (Unit!16326) )
))
(declare-fun lt!355083 () Unit!16325)

(declare-datatypes ((tuple2!19144 0))(
  ( (tuple2!19145 (_1!10305 (_ BitVec 8)) (_2!10305 BitStream!8758)) )
))
(declare-fun lt!355082 () tuple2!19144)

(declare-fun arrayUpdatedAtPrefixLemma!316 (array!11010 (_ BitVec 32) (_ BitVec 8)) Unit!16325)

(assert (=> b!223945 (= lt!355083 (arrayUpdatedAtPrefixLemma!316 arr!308 i!761 (_1!10305 lt!355082)))))

(declare-fun lt!355081 () (_ BitVec 64))

(declare-fun lt!355089 () (_ BitVec 32))

(declare-fun lt!355087 () (_ BitVec 64))

(declare-fun lt!355086 () (_ BitVec 64))

(declare-datatypes ((tuple3!1182 0))(
  ( (tuple3!1183 (_1!10306 Unit!16325) (_2!10306 BitStream!8758) (_3!733 array!11010)) )
))
(declare-fun lt!355088 () tuple3!1182)

(assert (=> b!223945 (and (= (bvadd lt!355087 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355089))) lt!355081) (= (bvadd lt!355086 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355081) (= (buf!5372 thiss!1870) (buf!5372 (_2!10306 lt!355088))) (= (size!4828 arr!308) (size!4828 (_3!733 lt!355088))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223945 (= lt!355081 (bitIndex!0 (size!4828 (buf!5372 (_2!10306 lt!355088))) (currentByte!10100 (_2!10306 lt!355088)) (currentBit!10095 (_2!10306 lt!355088))))))

(assert (=> b!223945 (= lt!355087 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355086))))

(assert (=> b!223945 (= lt!355087 (bitIndex!0 (size!4828 (buf!5372 (_2!10305 lt!355082))) (currentByte!10100 (_2!10305 lt!355082)) (currentBit!10095 (_2!10305 lt!355082))))))

(assert (=> b!223945 (= lt!355086 (bitIndex!0 (size!4828 (buf!5372 thiss!1870)) (currentByte!10100 thiss!1870) (currentBit!10095 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8758 array!11010 (_ BitVec 32) (_ BitVec 32)) tuple3!1182)

(assert (=> b!223945 (= lt!355088 (readByteArrayLoop!0 (_2!10305 lt!355082) lt!355084 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!223945 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4828 (buf!5372 (_2!10305 lt!355082)))) ((_ sign_extend 32) (currentByte!10100 (_2!10305 lt!355082))) ((_ sign_extend 32) (currentBit!10095 (_2!10305 lt!355082))) lt!355089)))

(assert (=> b!223945 (= lt!355089 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355085 () Unit!16325)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8758 BitStream!8758 (_ BitVec 64) (_ BitVec 32)) Unit!16325)

(assert (=> b!223945 (= lt!355085 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10305 lt!355082) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!223945 (= lt!355084 (array!11011 (store (arr!5776 arr!308) i!761 (_1!10305 lt!355082)) (size!4828 arr!308)))))

(declare-fun readByte!0 (BitStream!8758) tuple2!19144)

(assert (=> b!223945 (= lt!355082 (readByte!0 thiss!1870))))

(assert (= (and start!46694 res!187991) b!223943))

(assert (= (and b!223943 res!187990) b!223944))

(assert (= (and b!223944 res!187992) b!223945))

(assert (= start!46694 b!223946))

(declare-fun m!343367 () Bool)

(assert (=> b!223946 m!343367))

(declare-fun m!343369 () Bool)

(assert (=> start!46694 m!343369))

(declare-fun m!343371 () Bool)

(assert (=> start!46694 m!343371))

(declare-fun m!343373 () Bool)

(assert (=> b!223943 m!343373))

(declare-fun m!343375 () Bool)

(assert (=> b!223945 m!343375))

(declare-fun m!343377 () Bool)

(assert (=> b!223945 m!343377))

(declare-fun m!343379 () Bool)

(assert (=> b!223945 m!343379))

(declare-fun m!343381 () Bool)

(assert (=> b!223945 m!343381))

(declare-fun m!343383 () Bool)

(assert (=> b!223945 m!343383))

(declare-fun m!343385 () Bool)

(assert (=> b!223945 m!343385))

(declare-fun m!343387 () Bool)

(assert (=> b!223945 m!343387))

(declare-fun m!343389 () Bool)

(assert (=> b!223945 m!343389))

(declare-fun m!343391 () Bool)

(assert (=> b!223945 m!343391))

(declare-fun m!343393 () Bool)

(assert (=> b!223945 m!343393))

(push 1)

(assert (not start!46694))

(assert (not b!223945))

(assert (not b!223946))

(assert (not b!223943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

