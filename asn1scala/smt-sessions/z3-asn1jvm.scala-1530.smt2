; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42640 () Bool)

(assert start!42640)

(declare-fun b!201257 () Bool)

(declare-fun e!138039 () Bool)

(declare-fun e!138044 () Bool)

(assert (=> b!201257 (= e!138039 (not e!138044))))

(declare-fun res!168509 () Bool)

(assert (=> b!201257 (=> (not res!168509) (not e!138044))))

(declare-datatypes ((array!10222 0))(
  ( (array!10223 (arr!5432 (Array (_ BitVec 32) (_ BitVec 8))) (size!4502 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8112 0))(
  ( (BitStream!8113 (buf!5003 array!10222) (currentByte!9401 (_ BitVec 32)) (currentBit!9396 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17208 0))(
  ( (tuple2!17209 (_1!9255 BitStream!8112) (_2!9255 (_ BitVec 64))) )
))
(declare-fun lt!314027 () tuple2!17208)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201257 (= res!168509 (= (_2!9255 lt!314027) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((tuple2!17210 0))(
  ( (tuple2!17211 (_1!9256 BitStream!8112) (_2!9256 BitStream!8112)) )
))
(declare-fun lt!314029 () tuple2!17210)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17208)

(assert (=> b!201257 (= lt!314027 (readNBitsLSBFirstsLoopPure!0 (_1!9256 lt!314029) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-datatypes ((Unit!14306 0))(
  ( (Unit!14307) )
))
(declare-fun lt!314026 () Unit!14306)

(declare-fun thiss!1204 () BitStream!8112)

(declare-fun lt!314025 () (_ BitVec 64))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8112 array!10222 (_ BitVec 64)) Unit!14306)

(assert (=> b!201257 (= lt!314026 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5003 thiss!1204) lt!314025))))

(declare-fun reader!0 (BitStream!8112 BitStream!8112) tuple2!17210)

(assert (=> b!201257 (= lt!314029 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8112 BitStream!8112) Bool)

(assert (=> b!201257 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!314024 () Unit!14306)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8112) Unit!14306)

(assert (=> b!201257 (= lt!314024 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201258 () Bool)

(declare-fun res!168508 () Bool)

(declare-fun e!138043 () Bool)

(assert (=> b!201258 (=> (not res!168508) (not e!138043))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201258 (= res!168508 (invariant!0 (currentBit!9396 thiss!1204) (currentByte!9401 thiss!1204) (size!4502 (buf!5003 thiss!1204))))))

(declare-fun b!201259 () Bool)

(declare-fun e!138042 () Bool)

(declare-fun array_inv!4243 (array!10222) Bool)

(assert (=> b!201259 (= e!138042 (array_inv!4243 (buf!5003 thiss!1204)))))

(declare-fun b!201260 () Bool)

(assert (=> b!201260 (= e!138044 (= (_1!9255 lt!314027) (_2!9256 lt!314029)))))

(declare-fun b!201261 () Bool)

(declare-fun res!168510 () Bool)

(assert (=> b!201261 (=> (not res!168510) (not e!138043))))

(assert (=> b!201261 (= res!168510 (= i!590 nBits!348))))

(declare-fun res!168505 () Bool)

(declare-fun e!138041 () Bool)

(assert (=> start!42640 (=> (not res!168505) (not e!138041))))

(assert (=> start!42640 (= res!168505 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42640 e!138041))

(assert (=> start!42640 true))

(declare-fun inv!12 (BitStream!8112) Bool)

(assert (=> start!42640 (and (inv!12 thiss!1204) e!138042)))

(declare-fun b!201262 () Bool)

(assert (=> b!201262 (= e!138041 e!138043)))

(declare-fun res!168507 () Bool)

(assert (=> b!201262 (=> (not res!168507) (not e!138043))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201262 (= res!168507 (validate_offset_bits!1 ((_ sign_extend 32) (size!4502 (buf!5003 thiss!1204))) ((_ sign_extend 32) (currentByte!9401 thiss!1204)) ((_ sign_extend 32) (currentBit!9396 thiss!1204)) lt!314025))))

(assert (=> b!201262 (= lt!314025 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!201263 () Bool)

(assert (=> b!201263 (= e!138043 e!138039)))

(declare-fun res!168506 () Bool)

(assert (=> b!201263 (=> (not res!168506) (not e!138039))))

(declare-fun lt!314028 () (_ BitVec 64))

(assert (=> b!201263 (= res!168506 (= lt!314028 (bvsub (bvadd lt!314028 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201263 (= lt!314028 (bitIndex!0 (size!4502 (buf!5003 thiss!1204)) (currentByte!9401 thiss!1204) (currentBit!9396 thiss!1204)))))

(assert (= (and start!42640 res!168505) b!201262))

(assert (= (and b!201262 res!168507) b!201258))

(assert (= (and b!201258 res!168508) b!201261))

(assert (= (and b!201261 res!168510) b!201263))

(assert (= (and b!201263 res!168506) b!201257))

(assert (= (and b!201257 res!168509) b!201260))

(assert (= start!42640 b!201259))

(declare-fun m!311863 () Bool)

(assert (=> b!201258 m!311863))

(declare-fun m!311865 () Bool)

(assert (=> start!42640 m!311865))

(declare-fun m!311867 () Bool)

(assert (=> b!201257 m!311867))

(declare-fun m!311869 () Bool)

(assert (=> b!201257 m!311869))

(declare-fun m!311871 () Bool)

(assert (=> b!201257 m!311871))

(declare-fun m!311873 () Bool)

(assert (=> b!201257 m!311873))

(declare-fun m!311875 () Bool)

(assert (=> b!201257 m!311875))

(declare-fun m!311877 () Bool)

(assert (=> b!201257 m!311877))

(declare-fun m!311879 () Bool)

(assert (=> b!201257 m!311879))

(declare-fun m!311881 () Bool)

(assert (=> b!201263 m!311881))

(declare-fun m!311883 () Bool)

(assert (=> b!201259 m!311883))

(declare-fun m!311885 () Bool)

(assert (=> b!201262 m!311885))

(check-sat (not start!42640) (not b!201262) (not b!201259) (not b!201257) (not b!201263) (not b!201258))
(check-sat)
(get-model)

(declare-fun d!68951 () Bool)

(assert (=> d!68951 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!201257 d!68951))

(declare-fun d!68953 () Bool)

(assert (=> d!68953 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!314062 () Unit!14306)

(declare-fun choose!11 (BitStream!8112) Unit!14306)

(assert (=> d!68953 (= lt!314062 (choose!11 thiss!1204))))

(assert (=> d!68953 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!314062)))

(declare-fun bs!17016 () Bool)

(assert (= bs!17016 d!68953))

(assert (=> bs!17016 m!311869))

(declare-fun m!311921 () Bool)

(assert (=> bs!17016 m!311921))

(assert (=> b!201257 d!68953))

(declare-datatypes ((tuple2!17218 0))(
  ( (tuple2!17219 (_1!9260 (_ BitVec 64)) (_2!9260 BitStream!8112)) )
))
(declare-fun lt!314065 () tuple2!17218)

(declare-fun d!68957 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17218)

(assert (=> d!68957 (= lt!314065 (readNBitsLSBFirstsLoop!0 (_1!9256 lt!314029) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> d!68957 (= (readNBitsLSBFirstsLoopPure!0 (_1!9256 lt!314029) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))) (tuple2!17209 (_2!9260 lt!314065) (_1!9260 lt!314065)))))

(declare-fun bs!17017 () Bool)

(assert (= bs!17017 d!68957))

(declare-fun m!311923 () Bool)

(assert (=> bs!17017 m!311923))

(assert (=> b!201257 d!68957))

(declare-fun e!138094 () Bool)

(declare-fun b!201349 () Bool)

(declare-fun lt!314263 () tuple2!17210)

(declare-fun lt!314261 () (_ BitVec 64))

(declare-fun lt!314255 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8112 (_ BitVec 64)) BitStream!8112)

(assert (=> b!201349 (= e!138094 (= (_1!9256 lt!314263) (withMovedBitIndex!0 (_2!9256 lt!314263) (bvsub lt!314261 lt!314255))))))

(assert (=> b!201349 (or (= (bvand lt!314261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314255 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314261 lt!314255) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!201349 (= lt!314255 (bitIndex!0 (size!4502 (buf!5003 thiss!1204)) (currentByte!9401 thiss!1204) (currentBit!9396 thiss!1204)))))

(assert (=> b!201349 (= lt!314261 (bitIndex!0 (size!4502 (buf!5003 thiss!1204)) (currentByte!9401 thiss!1204) (currentBit!9396 thiss!1204)))))

(declare-fun b!201350 () Bool)

(declare-fun e!138095 () Unit!14306)

(declare-fun lt!314260 () Unit!14306)

(assert (=> b!201350 (= e!138095 lt!314260)))

(declare-fun lt!314254 () (_ BitVec 64))

(assert (=> b!201350 (= lt!314254 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!314249 () (_ BitVec 64))

(assert (=> b!201350 (= lt!314249 (bitIndex!0 (size!4502 (buf!5003 thiss!1204)) (currentByte!9401 thiss!1204) (currentBit!9396 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10222 array!10222 (_ BitVec 64) (_ BitVec 64)) Unit!14306)

(assert (=> b!201350 (= lt!314260 (arrayBitRangesEqSymmetric!0 (buf!5003 thiss!1204) (buf!5003 thiss!1204) lt!314254 lt!314249))))

(declare-fun arrayBitRangesEq!0 (array!10222 array!10222 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201350 (arrayBitRangesEq!0 (buf!5003 thiss!1204) (buf!5003 thiss!1204) lt!314254 lt!314249)))

(declare-fun b!201351 () Bool)

(declare-fun Unit!14312 () Unit!14306)

(assert (=> b!201351 (= e!138095 Unit!14312)))

(declare-fun b!201352 () Bool)

(declare-fun res!168578 () Bool)

(assert (=> b!201352 (=> (not res!168578) (not e!138094))))

(assert (=> b!201352 (= res!168578 (isPrefixOf!0 (_2!9256 lt!314263) thiss!1204))))

(declare-fun d!68959 () Bool)

(assert (=> d!68959 e!138094))

(declare-fun res!168579 () Bool)

(assert (=> d!68959 (=> (not res!168579) (not e!138094))))

(assert (=> d!68959 (= res!168579 (isPrefixOf!0 (_1!9256 lt!314263) (_2!9256 lt!314263)))))

(declare-fun lt!314259 () BitStream!8112)

(assert (=> d!68959 (= lt!314263 (tuple2!17211 lt!314259 thiss!1204))))

(declare-fun lt!314264 () Unit!14306)

(declare-fun lt!314265 () Unit!14306)

(assert (=> d!68959 (= lt!314264 lt!314265)))

(assert (=> d!68959 (isPrefixOf!0 lt!314259 thiss!1204)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8112 BitStream!8112 BitStream!8112) Unit!14306)

(assert (=> d!68959 (= lt!314265 (lemmaIsPrefixTransitive!0 lt!314259 thiss!1204 thiss!1204))))

(declare-fun lt!314258 () Unit!14306)

(declare-fun lt!314250 () Unit!14306)

(assert (=> d!68959 (= lt!314258 lt!314250)))

(assert (=> d!68959 (isPrefixOf!0 lt!314259 thiss!1204)))

(assert (=> d!68959 (= lt!314250 (lemmaIsPrefixTransitive!0 lt!314259 thiss!1204 thiss!1204))))

(declare-fun lt!314253 () Unit!14306)

(assert (=> d!68959 (= lt!314253 e!138095)))

(declare-fun c!10018 () Bool)

(assert (=> d!68959 (= c!10018 (not (= (size!4502 (buf!5003 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!314248 () Unit!14306)

(declare-fun lt!314251 () Unit!14306)

(assert (=> d!68959 (= lt!314248 lt!314251)))

(assert (=> d!68959 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68959 (= lt!314251 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!314262 () Unit!14306)

(declare-fun lt!314247 () Unit!14306)

(assert (=> d!68959 (= lt!314262 lt!314247)))

(assert (=> d!68959 (= lt!314247 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!314256 () Unit!14306)

(declare-fun lt!314252 () Unit!14306)

(assert (=> d!68959 (= lt!314256 lt!314252)))

(assert (=> d!68959 (isPrefixOf!0 lt!314259 lt!314259)))

(assert (=> d!68959 (= lt!314252 (lemmaIsPrefixRefl!0 lt!314259))))

(declare-fun lt!314257 () Unit!14306)

(declare-fun lt!314266 () Unit!14306)

(assert (=> d!68959 (= lt!314257 lt!314266)))

(assert (=> d!68959 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68959 (= lt!314266 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!68959 (= lt!314259 (BitStream!8113 (buf!5003 thiss!1204) (currentByte!9401 thiss!1204) (currentBit!9396 thiss!1204)))))

(assert (=> d!68959 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68959 (= (reader!0 thiss!1204 thiss!1204) lt!314263)))

(declare-fun b!201353 () Bool)

(declare-fun res!168577 () Bool)

(assert (=> b!201353 (=> (not res!168577) (not e!138094))))

(assert (=> b!201353 (= res!168577 (isPrefixOf!0 (_1!9256 lt!314263) thiss!1204))))

(assert (= (and d!68959 c!10018) b!201350))

(assert (= (and d!68959 (not c!10018)) b!201351))

(assert (= (and d!68959 res!168579) b!201353))

(assert (= (and b!201353 res!168577) b!201352))

(assert (= (and b!201352 res!168578) b!201349))

(declare-fun m!311973 () Bool)

(assert (=> b!201353 m!311973))

(declare-fun m!311975 () Bool)

(assert (=> b!201349 m!311975))

(assert (=> b!201349 m!311881))

(assert (=> b!201349 m!311881))

(declare-fun m!311977 () Bool)

(assert (=> d!68959 m!311977))

(assert (=> d!68959 m!311869))

(declare-fun m!311979 () Bool)

(assert (=> d!68959 m!311979))

(declare-fun m!311981 () Bool)

(assert (=> d!68959 m!311981))

(assert (=> d!68959 m!311869))

(assert (=> d!68959 m!311867))

(declare-fun m!311983 () Bool)

(assert (=> d!68959 m!311983))

(assert (=> d!68959 m!311867))

(declare-fun m!311985 () Bool)

(assert (=> d!68959 m!311985))

(assert (=> d!68959 m!311869))

(assert (=> d!68959 m!311979))

(assert (=> b!201350 m!311881))

(declare-fun m!311987 () Bool)

(assert (=> b!201350 m!311987))

(declare-fun m!311989 () Bool)

(assert (=> b!201350 m!311989))

(declare-fun m!311991 () Bool)

(assert (=> b!201352 m!311991))

(assert (=> b!201257 d!68959))

(declare-fun d!68977 () Bool)

(declare-fun res!168587 () Bool)

(declare-fun e!138100 () Bool)

(assert (=> d!68977 (=> (not res!168587) (not e!138100))))

(assert (=> d!68977 (= res!168587 (= (size!4502 (buf!5003 thiss!1204)) (size!4502 (buf!5003 thiss!1204))))))

(assert (=> d!68977 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!138100)))

(declare-fun b!201360 () Bool)

(declare-fun res!168586 () Bool)

(assert (=> b!201360 (=> (not res!168586) (not e!138100))))

(assert (=> b!201360 (= res!168586 (bvsle (bitIndex!0 (size!4502 (buf!5003 thiss!1204)) (currentByte!9401 thiss!1204) (currentBit!9396 thiss!1204)) (bitIndex!0 (size!4502 (buf!5003 thiss!1204)) (currentByte!9401 thiss!1204) (currentBit!9396 thiss!1204))))))

(declare-fun b!201361 () Bool)

(declare-fun e!138101 () Bool)

(assert (=> b!201361 (= e!138100 e!138101)))

(declare-fun res!168588 () Bool)

(assert (=> b!201361 (=> res!168588 e!138101)))

(assert (=> b!201361 (= res!168588 (= (size!4502 (buf!5003 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!201362 () Bool)

(assert (=> b!201362 (= e!138101 (arrayBitRangesEq!0 (buf!5003 thiss!1204) (buf!5003 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4502 (buf!5003 thiss!1204)) (currentByte!9401 thiss!1204) (currentBit!9396 thiss!1204))))))

(assert (= (and d!68977 res!168587) b!201360))

(assert (= (and b!201360 res!168586) b!201361))

(assert (= (and b!201361 (not res!168588)) b!201362))

(assert (=> b!201360 m!311881))

(assert (=> b!201360 m!311881))

(assert (=> b!201362 m!311881))

(assert (=> b!201362 m!311881))

(declare-fun m!311993 () Bool)

(assert (=> b!201362 m!311993))

(assert (=> b!201257 d!68977))

(declare-fun d!68979 () Bool)

(assert (=> d!68979 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!201257 d!68979))

(declare-fun d!68981 () Bool)

(assert (=> d!68981 (validate_offset_bits!1 ((_ sign_extend 32) (size!4502 (buf!5003 thiss!1204))) ((_ sign_extend 32) (currentByte!9401 thiss!1204)) ((_ sign_extend 32) (currentBit!9396 thiss!1204)) lt!314025)))

(declare-fun lt!314272 () Unit!14306)

(declare-fun choose!9 (BitStream!8112 array!10222 (_ BitVec 64) BitStream!8112) Unit!14306)

(assert (=> d!68981 (= lt!314272 (choose!9 thiss!1204 (buf!5003 thiss!1204) lt!314025 (BitStream!8113 (buf!5003 thiss!1204) (currentByte!9401 thiss!1204) (currentBit!9396 thiss!1204))))))

(assert (=> d!68981 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5003 thiss!1204) lt!314025) lt!314272)))

(declare-fun bs!17020 () Bool)

(assert (= bs!17020 d!68981))

(assert (=> bs!17020 m!311885))

(declare-fun m!311995 () Bool)

(assert (=> bs!17020 m!311995))

(assert (=> b!201257 d!68981))

(declare-fun d!68983 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68983 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4502 (buf!5003 thiss!1204))) ((_ sign_extend 32) (currentByte!9401 thiss!1204)) ((_ sign_extend 32) (currentBit!9396 thiss!1204)) lt!314025) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4502 (buf!5003 thiss!1204))) ((_ sign_extend 32) (currentByte!9401 thiss!1204)) ((_ sign_extend 32) (currentBit!9396 thiss!1204))) lt!314025))))

(declare-fun bs!17021 () Bool)

(assert (= bs!17021 d!68983))

(declare-fun m!311997 () Bool)

(assert (=> bs!17021 m!311997))

(assert (=> b!201262 d!68983))

(declare-fun d!68985 () Bool)

(declare-fun e!138107 () Bool)

(assert (=> d!68985 e!138107))

(declare-fun res!168599 () Bool)

(assert (=> d!68985 (=> (not res!168599) (not e!138107))))

(declare-fun lt!314305 () (_ BitVec 64))

(declare-fun lt!314306 () (_ BitVec 64))

(declare-fun lt!314308 () (_ BitVec 64))

(assert (=> d!68985 (= res!168599 (= lt!314306 (bvsub lt!314308 lt!314305)))))

(assert (=> d!68985 (or (= (bvand lt!314308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314305 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314308 lt!314305) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68985 (= lt!314305 (remainingBits!0 ((_ sign_extend 32) (size!4502 (buf!5003 thiss!1204))) ((_ sign_extend 32) (currentByte!9401 thiss!1204)) ((_ sign_extend 32) (currentBit!9396 thiss!1204))))))

(declare-fun lt!314304 () (_ BitVec 64))

(declare-fun lt!314307 () (_ BitVec 64))

(assert (=> d!68985 (= lt!314308 (bvmul lt!314304 lt!314307))))

(assert (=> d!68985 (or (= lt!314304 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314307 (bvsdiv (bvmul lt!314304 lt!314307) lt!314304)))))

(assert (=> d!68985 (= lt!314307 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68985 (= lt!314304 ((_ sign_extend 32) (size!4502 (buf!5003 thiss!1204))))))

(assert (=> d!68985 (= lt!314306 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9401 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9396 thiss!1204))))))

(assert (=> d!68985 (invariant!0 (currentBit!9396 thiss!1204) (currentByte!9401 thiss!1204) (size!4502 (buf!5003 thiss!1204)))))

(assert (=> d!68985 (= (bitIndex!0 (size!4502 (buf!5003 thiss!1204)) (currentByte!9401 thiss!1204) (currentBit!9396 thiss!1204)) lt!314306)))

(declare-fun b!201373 () Bool)

(declare-fun res!168600 () Bool)

(assert (=> b!201373 (=> (not res!168600) (not e!138107))))

(assert (=> b!201373 (= res!168600 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314306))))

(declare-fun b!201374 () Bool)

(declare-fun lt!314303 () (_ BitVec 64))

(assert (=> b!201374 (= e!138107 (bvsle lt!314306 (bvmul lt!314303 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201374 (or (= lt!314303 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314303 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314303)))))

(assert (=> b!201374 (= lt!314303 ((_ sign_extend 32) (size!4502 (buf!5003 thiss!1204))))))

(assert (= (and d!68985 res!168599) b!201373))

(assert (= (and b!201373 res!168600) b!201374))

(assert (=> d!68985 m!311997))

(assert (=> d!68985 m!311863))

(assert (=> b!201263 d!68985))

(declare-fun d!68995 () Bool)

(assert (=> d!68995 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9396 thiss!1204) (currentByte!9401 thiss!1204) (size!4502 (buf!5003 thiss!1204))))))

(declare-fun bs!17024 () Bool)

(assert (= bs!17024 d!68995))

(assert (=> bs!17024 m!311863))

(assert (=> start!42640 d!68995))

(declare-fun d!68997 () Bool)

(assert (=> d!68997 (= (invariant!0 (currentBit!9396 thiss!1204) (currentByte!9401 thiss!1204) (size!4502 (buf!5003 thiss!1204))) (and (bvsge (currentBit!9396 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9396 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9401 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9401 thiss!1204) (size!4502 (buf!5003 thiss!1204))) (and (= (currentBit!9396 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9401 thiss!1204) (size!4502 (buf!5003 thiss!1204)))))))))

(assert (=> b!201258 d!68997))

(declare-fun d!68999 () Bool)

(assert (=> d!68999 (= (array_inv!4243 (buf!5003 thiss!1204)) (bvsge (size!4502 (buf!5003 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201259 d!68999))

(check-sat (not b!201350) (not d!68953) (not b!201360) (not d!68985) (not b!201349) (not d!68983) (not b!201362) (not b!201352) (not d!68981) (not d!68959) (not d!68957) (not d!68995) (not b!201353))
(check-sat)
