; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47730 () Bool)

(assert start!47730)

(declare-fun b!227190 () Bool)

(declare-fun e!155422 () Bool)

(declare-datatypes ((array!11397 0))(
  ( (array!11398 (arr!5973 (Array (_ BitVec 32) (_ BitVec 8))) (size!4998 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9092 0))(
  ( (BitStream!9093 (buf!5539 array!11397) (currentByte!10377 (_ BitVec 32)) (currentBit!10372 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9092)

(declare-fun array_inv!4739 (array!11397) Bool)

(assert (=> b!227190 (= e!155422 (array_inv!4739 (buf!5539 thiss!1870)))))

(declare-fun b!227187 () Bool)

(declare-fun res!190607 () Bool)

(declare-fun e!155419 () Bool)

(assert (=> b!227187 (=> (not res!190607) (not e!155419))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227187 (= res!190607 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4998 (buf!5539 thiss!1870))) ((_ sign_extend 32) (currentByte!10377 thiss!1870)) ((_ sign_extend 32) (currentBit!10372 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!190608 () Bool)

(assert (=> start!47730 (=> (not res!190608) (not e!155419))))

(declare-fun arr!308 () array!11397)

(assert (=> start!47730 (= res!190608 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4998 arr!308))))))

(assert (=> start!47730 e!155419))

(assert (=> start!47730 true))

(assert (=> start!47730 (array_inv!4739 arr!308)))

(declare-fun inv!12 (BitStream!9092) Bool)

(assert (=> start!47730 (and (inv!12 thiss!1870) e!155422)))

(declare-fun b!227189 () Bool)

(assert (=> b!227189 (= e!155419 (not (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-fun lt!362937 () array!11397)

(declare-fun arrayRangesEq!834 (array!11397 array!11397 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227189 (arrayRangesEq!834 arr!308 lt!362937 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19518 0))(
  ( (tuple2!19519 (_1!10590 (_ BitVec 8)) (_2!10590 BitStream!9092)) )
))
(declare-fun lt!362940 () tuple2!19518)

(declare-datatypes ((Unit!16939 0))(
  ( (Unit!16940) )
))
(declare-fun lt!362933 () Unit!16939)

(declare-fun arrayUpdatedAtPrefixLemma!393 (array!11397 (_ BitVec 32) (_ BitVec 8)) Unit!16939)

(assert (=> b!227189 (= lt!362933 (arrayUpdatedAtPrefixLemma!393 arr!308 i!761 (_1!10590 lt!362940)))))

(declare-fun lt!362936 () (_ BitVec 64))

(declare-fun lt!362938 () (_ BitVec 64))

(declare-fun lt!362934 () (_ BitVec 32))

(declare-fun lt!362932 () (_ BitVec 64))

(declare-datatypes ((tuple3!1378 0))(
  ( (tuple3!1379 (_1!10591 Unit!16939) (_2!10591 BitStream!9092) (_3!831 array!11397)) )
))
(declare-fun lt!362935 () tuple3!1378)

(assert (=> b!227189 (and (= (bvadd lt!362936 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362934))) lt!362938) (= (bvadd lt!362932 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362938) (= (buf!5539 thiss!1870) (buf!5539 (_2!10591 lt!362935))) (= (size!4998 arr!308) (size!4998 (_3!831 lt!362935))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227189 (= lt!362938 (bitIndex!0 (size!4998 (buf!5539 (_2!10591 lt!362935))) (currentByte!10377 (_2!10591 lt!362935)) (currentBit!10372 (_2!10591 lt!362935))))))

(assert (=> b!227189 (= lt!362936 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362932))))

(assert (=> b!227189 (= lt!362936 (bitIndex!0 (size!4998 (buf!5539 (_2!10590 lt!362940))) (currentByte!10377 (_2!10590 lt!362940)) (currentBit!10372 (_2!10590 lt!362940))))))

(assert (=> b!227189 (= lt!362932 (bitIndex!0 (size!4998 (buf!5539 thiss!1870)) (currentByte!10377 thiss!1870) (currentBit!10372 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9092 array!11397 (_ BitVec 32) (_ BitVec 32)) tuple3!1378)

(assert (=> b!227189 (= lt!362935 (readByteArrayLoop!0 (_2!10590 lt!362940) lt!362937 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227189 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4998 (buf!5539 (_2!10590 lt!362940)))) ((_ sign_extend 32) (currentByte!10377 (_2!10590 lt!362940))) ((_ sign_extend 32) (currentBit!10372 (_2!10590 lt!362940))) lt!362934)))

(assert (=> b!227189 (= lt!362934 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362939 () Unit!16939)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9092 BitStream!9092 (_ BitVec 64) (_ BitVec 32)) Unit!16939)

(assert (=> b!227189 (= lt!362939 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10590 lt!362940) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227189 (= lt!362937 (array!11398 (store (arr!5973 arr!308) i!761 (_1!10590 lt!362940)) (size!4998 arr!308)))))

(declare-fun readByte!0 (BitStream!9092) tuple2!19518)

(assert (=> b!227189 (= lt!362940 (readByte!0 thiss!1870))))

(declare-fun b!227188 () Bool)

(declare-fun res!190609 () Bool)

(assert (=> b!227188 (=> (not res!190609) (not e!155419))))

(assert (=> b!227188 (= res!190609 (bvslt i!761 to!496))))

(assert (= (and start!47730 res!190608) b!227187))

(assert (= (and b!227187 res!190607) b!227188))

(assert (= (and b!227188 res!190609) b!227189))

(assert (= start!47730 b!227190))

(declare-fun m!349275 () Bool)

(assert (=> b!227190 m!349275))

(declare-fun m!349277 () Bool)

(assert (=> b!227187 m!349277))

(declare-fun m!349279 () Bool)

(assert (=> start!47730 m!349279))

(declare-fun m!349281 () Bool)

(assert (=> start!47730 m!349281))

(declare-fun m!349283 () Bool)

(assert (=> b!227189 m!349283))

(declare-fun m!349285 () Bool)

(assert (=> b!227189 m!349285))

(declare-fun m!349287 () Bool)

(assert (=> b!227189 m!349287))

(declare-fun m!349289 () Bool)

(assert (=> b!227189 m!349289))

(declare-fun m!349291 () Bool)

(assert (=> b!227189 m!349291))

(declare-fun m!349293 () Bool)

(assert (=> b!227189 m!349293))

(declare-fun m!349295 () Bool)

(assert (=> b!227189 m!349295))

(declare-fun m!349297 () Bool)

(assert (=> b!227189 m!349297))

(declare-fun m!349299 () Bool)

(assert (=> b!227189 m!349299))

(declare-fun m!349301 () Bool)

(assert (=> b!227189 m!349301))

(push 1)

(assert (not start!47730))

(assert (not b!227189))

(assert (not b!227187))

(assert (not b!227190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

