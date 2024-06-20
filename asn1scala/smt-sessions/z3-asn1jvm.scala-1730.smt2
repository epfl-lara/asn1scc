; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47728 () Bool)

(assert start!47728)

(declare-fun b!227176 () Bool)

(declare-fun res!190598 () Bool)

(declare-fun e!155410 () Bool)

(assert (=> b!227176 (=> (not res!190598) (not e!155410))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227176 (= res!190598 (bvslt i!761 to!496))))

(declare-fun res!190600 () Bool)

(assert (=> start!47728 (=> (not res!190600) (not e!155410))))

(declare-datatypes ((array!11395 0))(
  ( (array!11396 (arr!5972 (Array (_ BitVec 32) (_ BitVec 8))) (size!4997 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11395)

(assert (=> start!47728 (= res!190600 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4997 arr!308))))))

(assert (=> start!47728 e!155410))

(assert (=> start!47728 true))

(declare-fun array_inv!4738 (array!11395) Bool)

(assert (=> start!47728 (array_inv!4738 arr!308)))

(declare-datatypes ((BitStream!9090 0))(
  ( (BitStream!9091 (buf!5538 array!11395) (currentByte!10376 (_ BitVec 32)) (currentBit!10371 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9090)

(declare-fun e!155408 () Bool)

(declare-fun inv!12 (BitStream!9090) Bool)

(assert (=> start!47728 (and (inv!12 thiss!1870) e!155408)))

(declare-fun b!227175 () Bool)

(declare-fun res!190599 () Bool)

(assert (=> b!227175 (=> (not res!190599) (not e!155410))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227175 (= res!190599 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4997 (buf!5538 thiss!1870))) ((_ sign_extend 32) (currentByte!10376 thiss!1870)) ((_ sign_extend 32) (currentBit!10371 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227178 () Bool)

(assert (=> b!227178 (= e!155408 (array_inv!4738 (buf!5538 thiss!1870)))))

(declare-fun b!227177 () Bool)

(assert (=> b!227177 (= e!155410 (not (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-fun lt!362906 () array!11395)

(declare-fun arrayRangesEq!833 (array!11395 array!11395 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227177 (arrayRangesEq!833 arr!308 lt!362906 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19516 0))(
  ( (tuple2!19517 (_1!10588 (_ BitVec 8)) (_2!10588 BitStream!9090)) )
))
(declare-fun lt!362907 () tuple2!19516)

(declare-datatypes ((Unit!16937 0))(
  ( (Unit!16938) )
))
(declare-fun lt!362905 () Unit!16937)

(declare-fun arrayUpdatedAtPrefixLemma!392 (array!11395 (_ BitVec 32) (_ BitVec 8)) Unit!16937)

(assert (=> b!227177 (= lt!362905 (arrayUpdatedAtPrefixLemma!392 arr!308 i!761 (_1!10588 lt!362907)))))

(declare-fun lt!362910 () (_ BitVec 64))

(declare-fun lt!362909 () (_ BitVec 32))

(declare-fun lt!362911 () (_ BitVec 64))

(declare-fun lt!362908 () (_ BitVec 64))

(declare-datatypes ((tuple3!1376 0))(
  ( (tuple3!1377 (_1!10589 Unit!16937) (_2!10589 BitStream!9090) (_3!830 array!11395)) )
))
(declare-fun lt!362913 () tuple3!1376)

(assert (=> b!227177 (and (= (bvadd lt!362911 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362909))) lt!362908) (= (bvadd lt!362910 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362908) (= (buf!5538 thiss!1870) (buf!5538 (_2!10589 lt!362913))) (= (size!4997 arr!308) (size!4997 (_3!830 lt!362913))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227177 (= lt!362908 (bitIndex!0 (size!4997 (buf!5538 (_2!10589 lt!362913))) (currentByte!10376 (_2!10589 lt!362913)) (currentBit!10371 (_2!10589 lt!362913))))))

(assert (=> b!227177 (= lt!362911 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362910))))

(assert (=> b!227177 (= lt!362911 (bitIndex!0 (size!4997 (buf!5538 (_2!10588 lt!362907))) (currentByte!10376 (_2!10588 lt!362907)) (currentBit!10371 (_2!10588 lt!362907))))))

(assert (=> b!227177 (= lt!362910 (bitIndex!0 (size!4997 (buf!5538 thiss!1870)) (currentByte!10376 thiss!1870) (currentBit!10371 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9090 array!11395 (_ BitVec 32) (_ BitVec 32)) tuple3!1376)

(assert (=> b!227177 (= lt!362913 (readByteArrayLoop!0 (_2!10588 lt!362907) lt!362906 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227177 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4997 (buf!5538 (_2!10588 lt!362907)))) ((_ sign_extend 32) (currentByte!10376 (_2!10588 lt!362907))) ((_ sign_extend 32) (currentBit!10371 (_2!10588 lt!362907))) lt!362909)))

(assert (=> b!227177 (= lt!362909 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362912 () Unit!16937)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9090 BitStream!9090 (_ BitVec 64) (_ BitVec 32)) Unit!16937)

(assert (=> b!227177 (= lt!362912 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10588 lt!362907) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227177 (= lt!362906 (array!11396 (store (arr!5972 arr!308) i!761 (_1!10588 lt!362907)) (size!4997 arr!308)))))

(declare-fun readByte!0 (BitStream!9090) tuple2!19516)

(assert (=> b!227177 (= lt!362907 (readByte!0 thiss!1870))))

(assert (= (and start!47728 res!190600) b!227175))

(assert (= (and b!227175 res!190599) b!227176))

(assert (= (and b!227176 res!190598) b!227177))

(assert (= start!47728 b!227178))

(declare-fun m!349247 () Bool)

(assert (=> start!47728 m!349247))

(declare-fun m!349249 () Bool)

(assert (=> start!47728 m!349249))

(declare-fun m!349251 () Bool)

(assert (=> b!227175 m!349251))

(declare-fun m!349253 () Bool)

(assert (=> b!227178 m!349253))

(declare-fun m!349255 () Bool)

(assert (=> b!227177 m!349255))

(declare-fun m!349257 () Bool)

(assert (=> b!227177 m!349257))

(declare-fun m!349259 () Bool)

(assert (=> b!227177 m!349259))

(declare-fun m!349261 () Bool)

(assert (=> b!227177 m!349261))

(declare-fun m!349263 () Bool)

(assert (=> b!227177 m!349263))

(declare-fun m!349265 () Bool)

(assert (=> b!227177 m!349265))

(declare-fun m!349267 () Bool)

(assert (=> b!227177 m!349267))

(declare-fun m!349269 () Bool)

(assert (=> b!227177 m!349269))

(declare-fun m!349271 () Bool)

(assert (=> b!227177 m!349271))

(declare-fun m!349273 () Bool)

(assert (=> b!227177 m!349273))

(check-sat (not b!227178) (not b!227177) (not start!47728) (not b!227175))
(check-sat)
