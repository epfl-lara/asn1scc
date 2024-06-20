; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43598 () Bool)

(assert start!43598)

(declare-fun b!206237 () Bool)

(declare-fun e!141028 () Bool)

(declare-datatypes ((array!10381 0))(
  ( (array!10382 (arr!5492 (Array (_ BitVec 32) (_ BitVec 8))) (size!4562 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8232 0))(
  ( (BitStream!8233 (buf!5067 array!10381) (currentByte!9585 (_ BitVec 32)) (currentBit!9580 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17618 0))(
  ( (tuple2!17619 (_1!9464 BitStream!8232) (_2!9464 Bool)) )
))
(declare-fun lt!322427 () tuple2!17618)

(declare-fun lt!322421 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206237 (= e!141028 (= (bitIndex!0 (size!4562 (buf!5067 (_1!9464 lt!322427))) (currentByte!9585 (_1!9464 lt!322427)) (currentBit!9580 (_1!9464 lt!322427))) lt!322421))))

(declare-fun b!206238 () Bool)

(declare-fun res!172910 () Bool)

(declare-fun e!141032 () Bool)

(assert (=> b!206238 (=> res!172910 e!141032)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!322426 () (_ BitVec 64))

(declare-fun lt!322424 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!8232)

(declare-datatypes ((Unit!14718 0))(
  ( (Unit!14719) )
))
(declare-datatypes ((tuple2!17620 0))(
  ( (tuple2!17621 (_1!9465 Unit!14718) (_2!9465 BitStream!8232)) )
))
(declare-fun lt!322433 () tuple2!17620)

(assert (=> b!206238 (= res!172910 (or (not (= (size!4562 (buf!5067 (_2!9465 lt!322433))) (size!4562 (buf!5067 thiss!1204)))) (not (= lt!322424 (bvsub (bvadd lt!322426 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!172915 () Bool)

(declare-fun e!141036 () Bool)

(assert (=> start!43598 (=> (not res!172915) (not e!141036))))

(assert (=> start!43598 (= res!172915 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43598 e!141036))

(assert (=> start!43598 true))

(declare-fun e!141029 () Bool)

(declare-fun inv!12 (BitStream!8232) Bool)

(assert (=> start!43598 (and (inv!12 thiss!1204) e!141029)))

(declare-fun b!206239 () Bool)

(declare-fun res!172911 () Bool)

(assert (=> b!206239 (=> (not res!172911) (not e!141036))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206239 (= res!172911 (invariant!0 (currentBit!9580 thiss!1204) (currentByte!9585 thiss!1204) (size!4562 (buf!5067 thiss!1204))))))

(declare-fun b!206240 () Bool)

(declare-fun e!141030 () Bool)

(declare-fun e!141035 () Bool)

(assert (=> b!206240 (= e!141030 e!141035)))

(declare-fun res!172913 () Bool)

(assert (=> b!206240 (=> (not res!172913) (not e!141035))))

(declare-fun lt!322435 () (_ BitVec 64))

(assert (=> b!206240 (= res!172913 (= lt!322421 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322435)))))

(declare-fun lt!322430 () tuple2!17620)

(assert (=> b!206240 (= lt!322421 (bitIndex!0 (size!4562 (buf!5067 (_2!9465 lt!322430))) (currentByte!9585 (_2!9465 lt!322430)) (currentBit!9580 (_2!9465 lt!322430))))))

(assert (=> b!206240 (= lt!322435 (bitIndex!0 (size!4562 (buf!5067 thiss!1204)) (currentByte!9585 thiss!1204) (currentBit!9580 thiss!1204)))))

(declare-fun b!206241 () Bool)

(declare-fun e!141033 () Bool)

(assert (=> b!206241 (= e!141033 e!141032)))

(declare-fun res!172916 () Bool)

(assert (=> b!206241 (=> res!172916 e!141032)))

(declare-fun lt!322422 () (_ BitVec 64))

(assert (=> b!206241 (= res!172916 (not (= lt!322424 (bvsub (bvsub (bvadd lt!322422 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206241 (= lt!322424 (bitIndex!0 (size!4562 (buf!5067 (_2!9465 lt!322433))) (currentByte!9585 (_2!9465 lt!322433)) (currentBit!9580 (_2!9465 lt!322433))))))

(declare-fun isPrefixOf!0 (BitStream!8232 BitStream!8232) Bool)

(assert (=> b!206241 (isPrefixOf!0 thiss!1204 (_2!9465 lt!322433))))

(declare-fun lt!322436 () Unit!14718)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8232 BitStream!8232 BitStream!8232) Unit!14718)

(assert (=> b!206241 (= lt!322436 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9465 lt!322430) (_2!9465 lt!322433)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8232 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17620)

(assert (=> b!206241 (= lt!322433 (appendBitsLSBFirstLoopTR!0 (_2!9465 lt!322430) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206242 () Bool)

(declare-fun res!172917 () Bool)

(assert (=> b!206242 (=> res!172917 e!141032)))

(assert (=> b!206242 (= res!172917 (not (isPrefixOf!0 thiss!1204 (_2!9465 lt!322430))))))

(declare-fun b!206243 () Bool)

(assert (=> b!206243 (= e!141032 (= (size!4562 (buf!5067 thiss!1204)) (size!4562 (buf!5067 (_2!9465 lt!322433)))))))

(declare-datatypes ((tuple2!17622 0))(
  ( (tuple2!17623 (_1!9466 BitStream!8232) (_2!9466 BitStream!8232)) )
))
(declare-fun lt!322429 () tuple2!17622)

(declare-fun lt!322432 () Bool)

(declare-fun readBitPure!0 (BitStream!8232) tuple2!17618)

(assert (=> b!206243 (= (_2!9464 (readBitPure!0 (_1!9466 lt!322429))) lt!322432)))

(declare-fun lt!322423 () tuple2!17622)

(declare-fun reader!0 (BitStream!8232 BitStream!8232) tuple2!17622)

(assert (=> b!206243 (= lt!322423 (reader!0 (_2!9465 lt!322430) (_2!9465 lt!322433)))))

(assert (=> b!206243 (= lt!322429 (reader!0 thiss!1204 (_2!9465 lt!322433)))))

(declare-fun e!141027 () Bool)

(assert (=> b!206243 e!141027))

(declare-fun res!172922 () Bool)

(assert (=> b!206243 (=> (not res!172922) (not e!141027))))

(declare-fun lt!322428 () tuple2!17618)

(declare-fun lt!322434 () tuple2!17618)

(assert (=> b!206243 (= res!172922 (= (bitIndex!0 (size!4562 (buf!5067 (_1!9464 lt!322428))) (currentByte!9585 (_1!9464 lt!322428)) (currentBit!9580 (_1!9464 lt!322428))) (bitIndex!0 (size!4562 (buf!5067 (_1!9464 lt!322434))) (currentByte!9585 (_1!9464 lt!322434)) (currentBit!9580 (_1!9464 lt!322434)))))))

(declare-fun lt!322431 () Unit!14718)

(declare-fun lt!322425 () BitStream!8232)

(declare-fun readBitPrefixLemma!0 (BitStream!8232 BitStream!8232) Unit!14718)

(assert (=> b!206243 (= lt!322431 (readBitPrefixLemma!0 lt!322425 (_2!9465 lt!322433)))))

(assert (=> b!206243 (= lt!322434 (readBitPure!0 (BitStream!8233 (buf!5067 (_2!9465 lt!322433)) (currentByte!9585 thiss!1204) (currentBit!9580 thiss!1204))))))

(assert (=> b!206243 (= lt!322428 (readBitPure!0 lt!322425))))

(declare-fun e!141031 () Bool)

(assert (=> b!206243 e!141031))

(declare-fun res!172921 () Bool)

(assert (=> b!206243 (=> (not res!172921) (not e!141031))))

(assert (=> b!206243 (= res!172921 (invariant!0 (currentBit!9580 thiss!1204) (currentByte!9585 thiss!1204) (size!4562 (buf!5067 (_2!9465 lt!322430)))))))

(assert (=> b!206243 (= lt!322425 (BitStream!8233 (buf!5067 (_2!9465 lt!322430)) (currentByte!9585 thiss!1204) (currentBit!9580 thiss!1204)))))

(declare-fun b!206244 () Bool)

(assert (=> b!206244 (= e!141035 e!141028)))

(declare-fun res!172909 () Bool)

(assert (=> b!206244 (=> (not res!172909) (not e!141028))))

(assert (=> b!206244 (= res!172909 (and (= (_2!9464 lt!322427) lt!322432) (= (_1!9464 lt!322427) (_2!9465 lt!322430))))))

(declare-fun readerFrom!0 (BitStream!8232 (_ BitVec 32) (_ BitVec 32)) BitStream!8232)

(assert (=> b!206244 (= lt!322427 (readBitPure!0 (readerFrom!0 (_2!9465 lt!322430) (currentBit!9580 thiss!1204) (currentByte!9585 thiss!1204))))))

(declare-fun b!206245 () Bool)

(declare-fun res!172914 () Bool)

(assert (=> b!206245 (=> (not res!172914) (not e!141036))))

(assert (=> b!206245 (= res!172914 (not (= i!590 nBits!348)))))

(declare-fun b!206246 () Bool)

(declare-fun res!172920 () Bool)

(assert (=> b!206246 (=> res!172920 e!141032)))

(assert (=> b!206246 (= res!172920 (not (isPrefixOf!0 (_2!9465 lt!322430) (_2!9465 lt!322433))))))

(declare-fun b!206247 () Bool)

(declare-fun res!172918 () Bool)

(assert (=> b!206247 (=> res!172918 e!141032)))

(assert (=> b!206247 (= res!172918 (not (invariant!0 (currentBit!9580 (_2!9465 lt!322433)) (currentByte!9585 (_2!9465 lt!322433)) (size!4562 (buf!5067 (_2!9465 lt!322433))))))))

(declare-fun b!206248 () Bool)

(assert (=> b!206248 (= e!141031 (invariant!0 (currentBit!9580 thiss!1204) (currentByte!9585 thiss!1204) (size!4562 (buf!5067 (_2!9465 lt!322433)))))))

(declare-fun b!206249 () Bool)

(declare-fun res!172912 () Bool)

(assert (=> b!206249 (=> (not res!172912) (not e!141035))))

(assert (=> b!206249 (= res!172912 (isPrefixOf!0 thiss!1204 (_2!9465 lt!322430)))))

(declare-fun b!206250 () Bool)

(assert (=> b!206250 (= e!141036 (not e!141033))))

(declare-fun res!172908 () Bool)

(assert (=> b!206250 (=> res!172908 e!141033)))

(assert (=> b!206250 (= res!172908 (not (= lt!322422 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322426))))))

(assert (=> b!206250 (= lt!322422 (bitIndex!0 (size!4562 (buf!5067 (_2!9465 lt!322430))) (currentByte!9585 (_2!9465 lt!322430)) (currentBit!9580 (_2!9465 lt!322430))))))

(assert (=> b!206250 (= lt!322426 (bitIndex!0 (size!4562 (buf!5067 thiss!1204)) (currentByte!9585 thiss!1204) (currentBit!9580 thiss!1204)))))

(assert (=> b!206250 e!141030))

(declare-fun res!172919 () Bool)

(assert (=> b!206250 (=> (not res!172919) (not e!141030))))

(assert (=> b!206250 (= res!172919 (= (size!4562 (buf!5067 thiss!1204)) (size!4562 (buf!5067 (_2!9465 lt!322430)))))))

(declare-fun appendBit!0 (BitStream!8232 Bool) tuple2!17620)

(assert (=> b!206250 (= lt!322430 (appendBit!0 thiss!1204 lt!322432))))

(assert (=> b!206250 (= lt!322432 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206251 () Bool)

(declare-fun res!172907 () Bool)

(assert (=> b!206251 (=> (not res!172907) (not e!141036))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206251 (= res!172907 (validate_offset_bits!1 ((_ sign_extend 32) (size!4562 (buf!5067 thiss!1204))) ((_ sign_extend 32) (currentByte!9585 thiss!1204)) ((_ sign_extend 32) (currentBit!9580 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!206252 () Bool)

(declare-fun array_inv!4303 (array!10381) Bool)

(assert (=> b!206252 (= e!141029 (array_inv!4303 (buf!5067 thiss!1204)))))

(declare-fun b!206253 () Bool)

(assert (=> b!206253 (= e!141027 (= (_2!9464 lt!322428) (_2!9464 lt!322434)))))

(assert (= (and start!43598 res!172915) b!206251))

(assert (= (and b!206251 res!172907) b!206239))

(assert (= (and b!206239 res!172911) b!206245))

(assert (= (and b!206245 res!172914) b!206250))

(assert (= (and b!206250 res!172919) b!206240))

(assert (= (and b!206240 res!172913) b!206249))

(assert (= (and b!206249 res!172912) b!206244))

(assert (= (and b!206244 res!172909) b!206237))

(assert (= (and b!206250 (not res!172908)) b!206241))

(assert (= (and b!206241 (not res!172916)) b!206247))

(assert (= (and b!206247 (not res!172918)) b!206238))

(assert (= (and b!206238 (not res!172910)) b!206246))

(assert (= (and b!206246 (not res!172920)) b!206242))

(assert (= (and b!206242 (not res!172917)) b!206243))

(assert (= (and b!206243 res!172921) b!206248))

(assert (= (and b!206243 res!172922) b!206253))

(assert (= start!43598 b!206252))

(declare-fun m!317787 () Bool)

(assert (=> b!206240 m!317787))

(declare-fun m!317789 () Bool)

(assert (=> b!206240 m!317789))

(assert (=> b!206250 m!317787))

(assert (=> b!206250 m!317789))

(declare-fun m!317791 () Bool)

(assert (=> b!206250 m!317791))

(declare-fun m!317793 () Bool)

(assert (=> b!206244 m!317793))

(assert (=> b!206244 m!317793))

(declare-fun m!317795 () Bool)

(assert (=> b!206244 m!317795))

(declare-fun m!317797 () Bool)

(assert (=> b!206247 m!317797))

(declare-fun m!317799 () Bool)

(assert (=> b!206242 m!317799))

(declare-fun m!317801 () Bool)

(assert (=> b!206237 m!317801))

(declare-fun m!317803 () Bool)

(assert (=> b!206248 m!317803))

(declare-fun m!317805 () Bool)

(assert (=> b!206251 m!317805))

(declare-fun m!317807 () Bool)

(assert (=> b!206243 m!317807))

(declare-fun m!317809 () Bool)

(assert (=> b!206243 m!317809))

(declare-fun m!317811 () Bool)

(assert (=> b!206243 m!317811))

(declare-fun m!317813 () Bool)

(assert (=> b!206243 m!317813))

(declare-fun m!317815 () Bool)

(assert (=> b!206243 m!317815))

(declare-fun m!317817 () Bool)

(assert (=> b!206243 m!317817))

(declare-fun m!317819 () Bool)

(assert (=> b!206243 m!317819))

(declare-fun m!317821 () Bool)

(assert (=> b!206243 m!317821))

(declare-fun m!317823 () Bool)

(assert (=> b!206243 m!317823))

(declare-fun m!317825 () Bool)

(assert (=> b!206239 m!317825))

(assert (=> b!206249 m!317799))

(declare-fun m!317827 () Bool)

(assert (=> start!43598 m!317827))

(declare-fun m!317829 () Bool)

(assert (=> b!206246 m!317829))

(declare-fun m!317831 () Bool)

(assert (=> b!206241 m!317831))

(declare-fun m!317833 () Bool)

(assert (=> b!206241 m!317833))

(declare-fun m!317835 () Bool)

(assert (=> b!206241 m!317835))

(declare-fun m!317837 () Bool)

(assert (=> b!206241 m!317837))

(declare-fun m!317839 () Bool)

(assert (=> b!206252 m!317839))

(check-sat (not b!206240) (not b!206252) (not b!206242) (not b!206248) (not b!206243) (not b!206244) (not start!43598) (not b!206246) (not b!206247) (not b!206249) (not b!206251) (not b!206241) (not b!206237) (not b!206239) (not b!206250))
