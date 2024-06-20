; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46754 () Bool)

(assert start!46754)

(declare-fun res!188262 () Bool)

(declare-fun e!152845 () Bool)

(assert (=> start!46754 (=> (not res!188262) (not e!152845))))

(declare-datatypes ((array!11070 0))(
  ( (array!11071 (arr!5806 (Array (_ BitVec 32) (_ BitVec 8))) (size!4858 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11070)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46754 (= res!188262 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4858 arr!308))))))

(assert (=> start!46754 e!152845))

(assert (=> start!46754 true))

(declare-fun array_inv!4599 (array!11070) Bool)

(assert (=> start!46754 (array_inv!4599 arr!308)))

(declare-datatypes ((BitStream!8818 0))(
  ( (BitStream!8819 (buf!5402 array!11070) (currentByte!10130 (_ BitVec 32)) (currentBit!10125 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8818)

(declare-fun e!152844 () Bool)

(declare-fun inv!12 (BitStream!8818) Bool)

(assert (=> start!46754 (and (inv!12 thiss!1870) e!152844)))

(declare-fun b!224306 () Bool)

(assert (=> b!224306 (= e!152844 (array_inv!4599 (buf!5402 thiss!1870)))))

(declare-fun b!224305 () Bool)

(assert (=> b!224305 (= e!152845 (not true))))

(declare-datatypes ((Unit!16385 0))(
  ( (Unit!16386) )
))
(declare-datatypes ((tuple3!1242 0))(
  ( (tuple3!1243 (_1!10365 Unit!16385) (_2!10365 BitStream!8818) (_3!763 array!11070)) )
))
(declare-fun lt!355954 () tuple3!1242)

(declare-fun arrayRangesEq!754 (array!11070 array!11070 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224305 (arrayRangesEq!754 arr!308 (_3!763 lt!355954) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355956 () Unit!16385)

(declare-fun lt!355949 () array!11070)

(declare-fun arrayRangesEqTransitive!225 (array!11070 array!11070 array!11070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16385)

(assert (=> b!224305 (= lt!355956 (arrayRangesEqTransitive!225 arr!308 lt!355949 (_3!763 lt!355954) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224305 (arrayRangesEq!754 arr!308 lt!355949 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355952 () Unit!16385)

(declare-datatypes ((tuple2!19204 0))(
  ( (tuple2!19205 (_1!10366 (_ BitVec 8)) (_2!10366 BitStream!8818)) )
))
(declare-fun lt!355947 () tuple2!19204)

(declare-fun arrayUpdatedAtPrefixLemma!346 (array!11070 (_ BitVec 32) (_ BitVec 8)) Unit!16385)

(assert (=> b!224305 (= lt!355952 (arrayUpdatedAtPrefixLemma!346 arr!308 i!761 (_1!10366 lt!355947)))))

(declare-fun lt!355953 () (_ BitVec 64))

(declare-fun lt!355955 () (_ BitVec 64))

(declare-fun lt!355948 () (_ BitVec 32))

(declare-fun lt!355950 () (_ BitVec 64))

(assert (=> b!224305 (and (= (bvadd lt!355950 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355948))) lt!355953) (= (bvadd lt!355955 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355953) (= (buf!5402 thiss!1870) (buf!5402 (_2!10365 lt!355954))) (= (size!4858 arr!308) (size!4858 (_3!763 lt!355954))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224305 (= lt!355953 (bitIndex!0 (size!4858 (buf!5402 (_2!10365 lt!355954))) (currentByte!10130 (_2!10365 lt!355954)) (currentBit!10125 (_2!10365 lt!355954))))))

(assert (=> b!224305 (= lt!355950 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355955))))

(assert (=> b!224305 (= lt!355950 (bitIndex!0 (size!4858 (buf!5402 (_2!10366 lt!355947))) (currentByte!10130 (_2!10366 lt!355947)) (currentBit!10125 (_2!10366 lt!355947))))))

(assert (=> b!224305 (= lt!355955 (bitIndex!0 (size!4858 (buf!5402 thiss!1870)) (currentByte!10130 thiss!1870) (currentBit!10125 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8818 array!11070 (_ BitVec 32) (_ BitVec 32)) tuple3!1242)

(assert (=> b!224305 (= lt!355954 (readByteArrayLoop!0 (_2!10366 lt!355947) lt!355949 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224305 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4858 (buf!5402 (_2!10366 lt!355947)))) ((_ sign_extend 32) (currentByte!10130 (_2!10366 lt!355947))) ((_ sign_extend 32) (currentBit!10125 (_2!10366 lt!355947))) lt!355948)))

(assert (=> b!224305 (= lt!355948 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355951 () Unit!16385)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8818 BitStream!8818 (_ BitVec 64) (_ BitVec 32)) Unit!16385)

(assert (=> b!224305 (= lt!355951 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10366 lt!355947) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224305 (= lt!355949 (array!11071 (store (arr!5806 arr!308) i!761 (_1!10366 lt!355947)) (size!4858 arr!308)))))

(declare-fun readByte!0 (BitStream!8818) tuple2!19204)

(assert (=> b!224305 (= lt!355947 (readByte!0 thiss!1870))))

(declare-fun b!224304 () Bool)

(declare-fun res!188261 () Bool)

(assert (=> b!224304 (=> (not res!188261) (not e!152845))))

(assert (=> b!224304 (= res!188261 (bvslt i!761 to!496))))

(declare-fun b!224303 () Bool)

(declare-fun res!188260 () Bool)

(assert (=> b!224303 (=> (not res!188260) (not e!152845))))

(assert (=> b!224303 (= res!188260 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4858 (buf!5402 thiss!1870))) ((_ sign_extend 32) (currentByte!10130 thiss!1870)) ((_ sign_extend 32) (currentBit!10125 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46754 res!188262) b!224303))

(assert (= (and b!224303 res!188260) b!224304))

(assert (= (and b!224304 res!188261) b!224305))

(assert (= start!46754 b!224306))

(declare-fun m!344279 () Bool)

(assert (=> start!46754 m!344279))

(declare-fun m!344281 () Bool)

(assert (=> start!46754 m!344281))

(declare-fun m!344283 () Bool)

(assert (=> b!224306 m!344283))

(declare-fun m!344285 () Bool)

(assert (=> b!224305 m!344285))

(declare-fun m!344287 () Bool)

(assert (=> b!224305 m!344287))

(declare-fun m!344289 () Bool)

(assert (=> b!224305 m!344289))

(declare-fun m!344291 () Bool)

(assert (=> b!224305 m!344291))

(declare-fun m!344293 () Bool)

(assert (=> b!224305 m!344293))

(declare-fun m!344295 () Bool)

(assert (=> b!224305 m!344295))

(declare-fun m!344297 () Bool)

(assert (=> b!224305 m!344297))

(declare-fun m!344299 () Bool)

(assert (=> b!224305 m!344299))

(declare-fun m!344301 () Bool)

(assert (=> b!224305 m!344301))

(declare-fun m!344303 () Bool)

(assert (=> b!224305 m!344303))

(declare-fun m!344305 () Bool)

(assert (=> b!224305 m!344305))

(declare-fun m!344307 () Bool)

(assert (=> b!224305 m!344307))

(declare-fun m!344309 () Bool)

(assert (=> b!224303 m!344309))

(push 1)

(assert (not b!224305))

(assert (not b!224303))

(assert (not start!46754))

(assert (not b!224306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

