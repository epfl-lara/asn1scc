; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11794 () Bool)

(assert start!11794)

(declare-fun b!58278 () Bool)

(declare-fun e!38637 () Bool)

(declare-fun e!38633 () Bool)

(assert (=> b!58278 (= e!38637 e!38633)))

(declare-fun res!48391 () Bool)

(assert (=> b!58278 (=> res!48391 e!38633)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!92221 () (_ BitVec 64))

(declare-fun lt!92230 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!58278 (= res!48391 (not (= lt!92230 (bvsub (bvadd lt!92221 to!314) i!635))))))

(declare-datatypes ((array!2651 0))(
  ( (array!2652 (arr!1765 (Array (_ BitVec 32) (_ BitVec 8))) (size!1201 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2090 0))(
  ( (BitStream!2091 (buf!1582 array!2651) (currentByte!3200 (_ BitVec 32)) (currentBit!3195 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4025 0))(
  ( (Unit!4026) )
))
(declare-datatypes ((tuple2!5302 0))(
  ( (tuple2!5303 (_1!2762 Unit!4025) (_2!2762 BitStream!2090)) )
))
(declare-fun lt!92226 () tuple2!5302)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58278 (= lt!92230 (bitIndex!0 (size!1201 (buf!1582 (_2!2762 lt!92226))) (currentByte!3200 (_2!2762 lt!92226)) (currentBit!3195 (_2!2762 lt!92226))))))

(declare-fun b!58279 () Bool)

(declare-fun e!38632 () Bool)

(assert (=> b!58279 (= e!38632 true)))

(declare-datatypes ((tuple2!5304 0))(
  ( (tuple2!5305 (_1!2763 BitStream!2090) (_2!2763 BitStream!2090)) )
))
(declare-fun lt!92225 () tuple2!5304)

(declare-fun thiss!1379 () BitStream!2090)

(declare-fun reader!0 (BitStream!2090 BitStream!2090) tuple2!5304)

(assert (=> b!58279 (= lt!92225 (reader!0 thiss!1379 (_2!2762 lt!92226)))))

(declare-fun b!58280 () Bool)

(declare-fun e!38640 () Bool)

(declare-fun e!38635 () Bool)

(assert (=> b!58280 (= e!38640 (not e!38635))))

(declare-fun res!48393 () Bool)

(assert (=> b!58280 (=> res!48393 e!38635)))

(assert (=> b!58280 (= res!48393 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2090 BitStream!2090) Bool)

(assert (=> b!58280 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92228 () Unit!4025)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2090) Unit!4025)

(assert (=> b!58280 (= lt!92228 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58280 (= lt!92221 (bitIndex!0 (size!1201 (buf!1582 thiss!1379)) (currentByte!3200 thiss!1379) (currentBit!3195 thiss!1379)))))

(declare-fun b!58281 () Bool)

(declare-fun lt!92223 () tuple2!5302)

(declare-fun e!38638 () Bool)

(assert (=> b!58281 (= e!38638 (= lt!92230 (bvsub (bvsub (bvadd (bitIndex!0 (size!1201 (buf!1582 (_2!2762 lt!92223))) (currentByte!3200 (_2!2762 lt!92223)) (currentBit!3195 (_2!2762 lt!92223))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58282 () Bool)

(assert (=> b!58282 (= e!38633 e!38632)))

(declare-fun res!48388 () Bool)

(assert (=> b!58282 (=> res!48388 e!38632)))

(assert (=> b!58282 (= res!48388 (not (= (size!1201 (buf!1582 (_2!2762 lt!92223))) (size!1201 (buf!1582 (_2!2762 lt!92226))))))))

(assert (=> b!58282 e!38638))

(declare-fun res!48397 () Bool)

(assert (=> b!58282 (=> (not res!48397) (not e!38638))))

(assert (=> b!58282 (= res!48397 (= (size!1201 (buf!1582 (_2!2762 lt!92226))) (size!1201 (buf!1582 thiss!1379))))))

(declare-fun srcBuffer!2 () array!2651)

(declare-fun lt!92227 () tuple2!5304)

(declare-fun b!58283 () Bool)

(declare-fun e!38634 () Bool)

(declare-datatypes ((List!620 0))(
  ( (Nil!617) (Cons!616 (h!735 Bool) (t!1370 List!620)) )
))
(declare-fun head!439 (List!620) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2090 array!2651 (_ BitVec 64) (_ BitVec 64)) List!620)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2090 BitStream!2090 (_ BitVec 64)) List!620)

(assert (=> b!58283 (= e!38634 (= (head!439 (byteArrayBitContentToList!0 (_2!2762 lt!92223) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!439 (bitStreamReadBitsIntoList!0 (_2!2762 lt!92223) (_1!2763 lt!92227) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!48390 () Bool)

(assert (=> start!11794 (=> (not res!48390) (not e!38640))))

(assert (=> start!11794 (= res!48390 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1201 srcBuffer!2))))))))

(assert (=> start!11794 e!38640))

(assert (=> start!11794 true))

(declare-fun array_inv!1104 (array!2651) Bool)

(assert (=> start!11794 (array_inv!1104 srcBuffer!2)))

(declare-fun e!38642 () Bool)

(declare-fun inv!12 (BitStream!2090) Bool)

(assert (=> start!11794 (and (inv!12 thiss!1379) e!38642)))

(declare-fun b!58284 () Bool)

(declare-fun res!48392 () Bool)

(assert (=> b!58284 (=> res!48392 e!38633)))

(assert (=> b!58284 (= res!48392 (not (= (size!1201 (buf!1582 thiss!1379)) (size!1201 (buf!1582 (_2!2762 lt!92226))))))))

(declare-fun b!58285 () Bool)

(declare-fun e!38636 () Bool)

(assert (=> b!58285 (= e!38636 e!38637)))

(declare-fun res!48398 () Bool)

(assert (=> b!58285 (=> res!48398 e!38637)))

(assert (=> b!58285 (= res!48398 (not (isPrefixOf!0 (_2!2762 lt!92223) (_2!2762 lt!92226))))))

(assert (=> b!58285 (isPrefixOf!0 thiss!1379 (_2!2762 lt!92226))))

(declare-fun lt!92222 () Unit!4025)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2090 BitStream!2090 BitStream!2090) Unit!4025)

(assert (=> b!58285 (= lt!92222 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2762 lt!92223) (_2!2762 lt!92226)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2090 array!2651 (_ BitVec 64) (_ BitVec 64)) tuple2!5302)

(assert (=> b!58285 (= lt!92226 (appendBitsMSBFirstLoop!0 (_2!2762 lt!92223) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58285 e!38634))

(declare-fun res!48399 () Bool)

(assert (=> b!58285 (=> (not res!48399) (not e!38634))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58285 (= res!48399 (validate_offset_bits!1 ((_ sign_extend 32) (size!1201 (buf!1582 (_2!2762 lt!92223)))) ((_ sign_extend 32) (currentByte!3200 thiss!1379)) ((_ sign_extend 32) (currentBit!3195 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92224 () Unit!4025)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2090 array!2651 (_ BitVec 64)) Unit!4025)

(assert (=> b!58285 (= lt!92224 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1582 (_2!2762 lt!92223)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58285 (= lt!92227 (reader!0 thiss!1379 (_2!2762 lt!92223)))))

(declare-fun b!58286 () Bool)

(assert (=> b!58286 (= e!38642 (array_inv!1104 (buf!1582 thiss!1379)))))

(declare-fun b!58287 () Bool)

(declare-fun res!48387 () Bool)

(assert (=> b!58287 (=> res!48387 e!38632)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58287 (= res!48387 (not (invariant!0 (currentBit!3195 (_2!2762 lt!92223)) (currentByte!3200 (_2!2762 lt!92223)) (size!1201 (buf!1582 (_2!2762 lt!92223))))))))

(declare-fun b!58288 () Bool)

(declare-fun res!48396 () Bool)

(assert (=> b!58288 (=> res!48396 e!38633)))

(assert (=> b!58288 (= res!48396 (not (invariant!0 (currentBit!3195 (_2!2762 lt!92226)) (currentByte!3200 (_2!2762 lt!92226)) (size!1201 (buf!1582 (_2!2762 lt!92226))))))))

(declare-fun b!58289 () Bool)

(assert (=> b!58289 (= e!38635 e!38636)))

(declare-fun res!48394 () Bool)

(assert (=> b!58289 (=> res!48394 e!38636)))

(assert (=> b!58289 (= res!48394 (not (isPrefixOf!0 thiss!1379 (_2!2762 lt!92223))))))

(assert (=> b!58289 (validate_offset_bits!1 ((_ sign_extend 32) (size!1201 (buf!1582 (_2!2762 lt!92223)))) ((_ sign_extend 32) (currentByte!3200 (_2!2762 lt!92223))) ((_ sign_extend 32) (currentBit!3195 (_2!2762 lt!92223))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92229 () Unit!4025)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2090 BitStream!2090 (_ BitVec 64) (_ BitVec 64)) Unit!4025)

(assert (=> b!58289 (= lt!92229 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2762 lt!92223) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2090 (_ BitVec 8) (_ BitVec 32)) tuple2!5302)

(assert (=> b!58289 (= lt!92223 (appendBitFromByte!0 thiss!1379 (select (arr!1765 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58290 () Bool)

(declare-fun res!48389 () Bool)

(assert (=> b!58290 (=> res!48389 e!38632)))

(assert (=> b!58290 (= res!48389 (not (invariant!0 (currentBit!3195 (_2!2762 lt!92223)) (currentByte!3200 (_2!2762 lt!92223)) (size!1201 (buf!1582 (_2!2762 lt!92226))))))))

(declare-fun b!58291 () Bool)

(declare-fun res!48395 () Bool)

(assert (=> b!58291 (=> (not res!48395) (not e!38640))))

(assert (=> b!58291 (= res!48395 (validate_offset_bits!1 ((_ sign_extend 32) (size!1201 (buf!1582 thiss!1379))) ((_ sign_extend 32) (currentByte!3200 thiss!1379)) ((_ sign_extend 32) (currentBit!3195 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!11794 res!48390) b!58291))

(assert (= (and b!58291 res!48395) b!58280))

(assert (= (and b!58280 (not res!48393)) b!58289))

(assert (= (and b!58289 (not res!48394)) b!58285))

(assert (= (and b!58285 res!48399) b!58283))

(assert (= (and b!58285 (not res!48398)) b!58278))

(assert (= (and b!58278 (not res!48391)) b!58288))

(assert (= (and b!58288 (not res!48396)) b!58284))

(assert (= (and b!58284 (not res!48392)) b!58282))

(assert (= (and b!58282 res!48397) b!58281))

(assert (= (and b!58282 (not res!48388)) b!58287))

(assert (= (and b!58287 (not res!48387)) b!58290))

(assert (= (and b!58290 (not res!48389)) b!58279))

(assert (= start!11794 b!58286))

(declare-fun m!91851 () Bool)

(assert (=> b!58280 m!91851))

(declare-fun m!91853 () Bool)

(assert (=> b!58280 m!91853))

(declare-fun m!91855 () Bool)

(assert (=> b!58280 m!91855))

(declare-fun m!91857 () Bool)

(assert (=> start!11794 m!91857))

(declare-fun m!91859 () Bool)

(assert (=> start!11794 m!91859))

(declare-fun m!91861 () Bool)

(assert (=> b!58283 m!91861))

(assert (=> b!58283 m!91861))

(declare-fun m!91863 () Bool)

(assert (=> b!58283 m!91863))

(declare-fun m!91865 () Bool)

(assert (=> b!58283 m!91865))

(assert (=> b!58283 m!91865))

(declare-fun m!91867 () Bool)

(assert (=> b!58283 m!91867))

(declare-fun m!91869 () Bool)

(assert (=> b!58281 m!91869))

(declare-fun m!91871 () Bool)

(assert (=> b!58290 m!91871))

(declare-fun m!91873 () Bool)

(assert (=> b!58285 m!91873))

(declare-fun m!91875 () Bool)

(assert (=> b!58285 m!91875))

(declare-fun m!91877 () Bool)

(assert (=> b!58285 m!91877))

(declare-fun m!91879 () Bool)

(assert (=> b!58285 m!91879))

(declare-fun m!91881 () Bool)

(assert (=> b!58285 m!91881))

(declare-fun m!91883 () Bool)

(assert (=> b!58285 m!91883))

(declare-fun m!91885 () Bool)

(assert (=> b!58285 m!91885))

(declare-fun m!91887 () Bool)

(assert (=> b!58286 m!91887))

(declare-fun m!91889 () Bool)

(assert (=> b!58291 m!91889))

(declare-fun m!91891 () Bool)

(assert (=> b!58278 m!91891))

(declare-fun m!91893 () Bool)

(assert (=> b!58288 m!91893))

(declare-fun m!91895 () Bool)

(assert (=> b!58289 m!91895))

(declare-fun m!91897 () Bool)

(assert (=> b!58289 m!91897))

(declare-fun m!91899 () Bool)

(assert (=> b!58289 m!91899))

(declare-fun m!91901 () Bool)

(assert (=> b!58289 m!91901))

(assert (=> b!58289 m!91895))

(declare-fun m!91903 () Bool)

(assert (=> b!58289 m!91903))

(declare-fun m!91905 () Bool)

(assert (=> b!58287 m!91905))

(declare-fun m!91907 () Bool)

(assert (=> b!58279 m!91907))

(push 1)

(assert (not b!58283))

(assert (not b!58287))

(assert (not start!11794))

(assert (not b!58280))

(assert (not b!58281))

(assert (not b!58285))

(assert (not b!58288))

(assert (not b!58291))

(assert (not b!58286))

(assert (not b!58289))

(assert (not b!58278))

(assert (not b!58290))

(assert (not b!58279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

