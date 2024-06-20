; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22770 () Bool)

(assert start!22770)

(declare-fun b!114998 () Bool)

(declare-fun e!75406 () Bool)

(declare-datatypes ((array!5196 0))(
  ( (array!5197 (arr!2951 (Array (_ BitVec 32) (_ BitVec 8))) (size!2358 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4190 0))(
  ( (BitStream!4191 (buf!2768 array!5196) (currentByte!5387 (_ BitVec 32)) (currentBit!5382 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9472 0))(
  ( (tuple2!9473 (_1!5001 BitStream!4190) (_2!5001 BitStream!4190)) )
))
(declare-fun lt!175212 () tuple2!9472)

(declare-fun lt!175210 () Bool)

(declare-datatypes ((tuple2!9474 0))(
  ( (tuple2!9475 (_1!5002 BitStream!4190) (_2!5002 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4190) tuple2!9474)

(assert (=> b!114998 (= e!75406 (not (= (_2!5002 (readBitPure!0 (_1!5001 lt!175212))) lt!175210)))))

(declare-fun lt!175218 () tuple2!9472)

(declare-datatypes ((Unit!7073 0))(
  ( (Unit!7074) )
))
(declare-datatypes ((tuple2!9476 0))(
  ( (tuple2!9477 (_1!5003 Unit!7073) (_2!5003 BitStream!4190)) )
))
(declare-fun lt!175206 () tuple2!9476)

(declare-fun lt!175213 () tuple2!9476)

(declare-fun reader!0 (BitStream!4190 BitStream!4190) tuple2!9472)

(assert (=> b!114998 (= lt!175218 (reader!0 (_2!5003 lt!175206) (_2!5003 lt!175213)))))

(declare-fun thiss!1305 () BitStream!4190)

(assert (=> b!114998 (= lt!175212 (reader!0 thiss!1305 (_2!5003 lt!175213)))))

(declare-fun e!75409 () Bool)

(assert (=> b!114998 e!75409))

(declare-fun res!95023 () Bool)

(assert (=> b!114998 (=> (not res!95023) (not e!75409))))

(declare-fun lt!175216 () tuple2!9474)

(declare-fun lt!175207 () tuple2!9474)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114998 (= res!95023 (= (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!175216))) (currentByte!5387 (_1!5002 lt!175216)) (currentBit!5382 (_1!5002 lt!175216))) (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!175207))) (currentByte!5387 (_1!5002 lt!175207)) (currentBit!5382 (_1!5002 lt!175207)))))))

(declare-fun lt!175214 () Unit!7073)

(declare-fun lt!175209 () BitStream!4190)

(declare-fun readBitPrefixLemma!0 (BitStream!4190 BitStream!4190) Unit!7073)

(assert (=> b!114998 (= lt!175214 (readBitPrefixLemma!0 lt!175209 (_2!5003 lt!175213)))))

(assert (=> b!114998 (= lt!175207 (readBitPure!0 (BitStream!4191 (buf!2768 (_2!5003 lt!175213)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305))))))

(assert (=> b!114998 (= lt!175216 (readBitPure!0 lt!175209))))

(assert (=> b!114998 (= lt!175209 (BitStream!4191 (buf!2768 (_2!5003 lt!175206)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305)))))

(declare-fun e!75405 () Bool)

(assert (=> b!114998 e!75405))

(declare-fun res!95021 () Bool)

(assert (=> b!114998 (=> (not res!95021) (not e!75405))))

(declare-fun isPrefixOf!0 (BitStream!4190 BitStream!4190) Bool)

(assert (=> b!114998 (= res!95021 (isPrefixOf!0 thiss!1305 (_2!5003 lt!175213)))))

(declare-fun lt!175217 () Unit!7073)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4190 BitStream!4190 BitStream!4190) Unit!7073)

(assert (=> b!114998 (= lt!175217 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5003 lt!175206) (_2!5003 lt!175213)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4190 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9476)

(assert (=> b!114998 (= lt!175213 (appendNLeastSignificantBitsLoop!0 (_2!5003 lt!175206) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!75411 () Bool)

(assert (=> b!114998 e!75411))

(declare-fun res!95028 () Bool)

(assert (=> b!114998 (=> (not res!95028) (not e!75411))))

(assert (=> b!114998 (= res!95028 (= (size!2358 (buf!2768 thiss!1305)) (size!2358 (buf!2768 (_2!5003 lt!175206)))))))

(declare-fun appendBit!0 (BitStream!4190 Bool) tuple2!9476)

(assert (=> b!114998 (= lt!175206 (appendBit!0 thiss!1305 lt!175210))))

(assert (=> b!114998 (= lt!175210 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114999 () Bool)

(declare-fun res!95025 () Bool)

(declare-fun e!75410 () Bool)

(assert (=> b!114999 (=> (not res!95025) (not e!75410))))

(assert (=> b!114999 (= res!95025 (isPrefixOf!0 thiss!1305 (_2!5003 lt!175206)))))

(declare-fun b!115000 () Bool)

(declare-fun res!95020 () Bool)

(assert (=> b!115000 (=> (not res!95020) (not e!75405))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115000 (= res!95020 (invariant!0 (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305) (size!2358 (buf!2768 (_2!5003 lt!175206)))))))

(declare-fun b!115001 () Bool)

(declare-fun e!75407 () Bool)

(declare-fun lt!175215 () tuple2!9474)

(declare-fun lt!175208 () (_ BitVec 64))

(assert (=> b!115001 (= e!75407 (= (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!175215))) (currentByte!5387 (_1!5002 lt!175215)) (currentBit!5382 (_1!5002 lt!175215))) lt!175208))))

(declare-fun b!115002 () Bool)

(assert (=> b!115002 (= e!75410 e!75407)))

(declare-fun res!95018 () Bool)

(assert (=> b!115002 (=> (not res!95018) (not e!75407))))

(assert (=> b!115002 (= res!95018 (and (= (_2!5002 lt!175215) lt!175210) (= (_1!5002 lt!175215) (_2!5003 lt!175206))))))

(declare-fun readerFrom!0 (BitStream!4190 (_ BitVec 32) (_ BitVec 32)) BitStream!4190)

(assert (=> b!115002 (= lt!175215 (readBitPure!0 (readerFrom!0 (_2!5003 lt!175206) (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305))))))

(declare-fun b!115003 () Bool)

(declare-fun res!95019 () Bool)

(assert (=> b!115003 (=> (not res!95019) (not e!75406))))

(assert (=> b!115003 (= res!95019 (bvslt i!615 nBits!396))))

(declare-fun b!115004 () Bool)

(declare-fun res!95027 () Bool)

(assert (=> b!115004 (=> (not res!95027) (not e!75406))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115004 (= res!95027 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!115005 () Bool)

(declare-fun res!95024 () Bool)

(assert (=> b!115005 (=> (not res!95024) (not e!75406))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115005 (= res!95024 (validate_offset_bits!1 ((_ sign_extend 32) (size!2358 (buf!2768 thiss!1305))) ((_ sign_extend 32) (currentByte!5387 thiss!1305)) ((_ sign_extend 32) (currentBit!5382 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!115006 () Bool)

(assert (=> b!115006 (= e!75411 e!75410)))

(declare-fun res!95022 () Bool)

(assert (=> b!115006 (=> (not res!95022) (not e!75410))))

(declare-fun lt!175211 () (_ BitVec 64))

(assert (=> b!115006 (= res!95022 (= lt!175208 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!175211)))))

(assert (=> b!115006 (= lt!175208 (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175206))) (currentByte!5387 (_2!5003 lt!175206)) (currentBit!5382 (_2!5003 lt!175206))))))

(assert (=> b!115006 (= lt!175211 (bitIndex!0 (size!2358 (buf!2768 thiss!1305)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305)))))

(declare-fun b!115007 () Bool)

(declare-fun e!75404 () Bool)

(declare-fun array_inv!2160 (array!5196) Bool)

(assert (=> b!115007 (= e!75404 (array_inv!2160 (buf!2768 thiss!1305)))))

(declare-fun b!115008 () Bool)

(assert (=> b!115008 (= e!75409 (= (_2!5002 lt!175216) (_2!5002 lt!175207)))))

(declare-fun res!95026 () Bool)

(assert (=> start!22770 (=> (not res!95026) (not e!75406))))

(assert (=> start!22770 (= res!95026 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22770 e!75406))

(assert (=> start!22770 true))

(declare-fun inv!12 (BitStream!4190) Bool)

(assert (=> start!22770 (and (inv!12 thiss!1305) e!75404)))

(declare-fun b!115009 () Bool)

(assert (=> b!115009 (= e!75405 (invariant!0 (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305) (size!2358 (buf!2768 (_2!5003 lt!175213)))))))

(assert (= (and start!22770 res!95026) b!115005))

(assert (= (and b!115005 res!95024) b!115004))

(assert (= (and b!115004 res!95027) b!115003))

(assert (= (and b!115003 res!95019) b!114998))

(assert (= (and b!114998 res!95028) b!115006))

(assert (= (and b!115006 res!95022) b!114999))

(assert (= (and b!114999 res!95025) b!115002))

(assert (= (and b!115002 res!95018) b!115001))

(assert (= (and b!114998 res!95021) b!115000))

(assert (= (and b!115000 res!95020) b!115009))

(assert (= (and b!114998 res!95023) b!115008))

(assert (= start!22770 b!115007))

(declare-fun m!172019 () Bool)

(assert (=> b!115006 m!172019))

(declare-fun m!172021 () Bool)

(assert (=> b!115006 m!172021))

(declare-fun m!172023 () Bool)

(assert (=> b!115001 m!172023))

(declare-fun m!172025 () Bool)

(assert (=> b!114999 m!172025))

(declare-fun m!172027 () Bool)

(assert (=> b!115009 m!172027))

(declare-fun m!172029 () Bool)

(assert (=> b!115007 m!172029))

(declare-fun m!172031 () Bool)

(assert (=> start!22770 m!172031))

(declare-fun m!172033 () Bool)

(assert (=> b!114998 m!172033))

(declare-fun m!172035 () Bool)

(assert (=> b!114998 m!172035))

(declare-fun m!172037 () Bool)

(assert (=> b!114998 m!172037))

(declare-fun m!172039 () Bool)

(assert (=> b!114998 m!172039))

(declare-fun m!172041 () Bool)

(assert (=> b!114998 m!172041))

(declare-fun m!172043 () Bool)

(assert (=> b!114998 m!172043))

(declare-fun m!172045 () Bool)

(assert (=> b!114998 m!172045))

(declare-fun m!172047 () Bool)

(assert (=> b!114998 m!172047))

(declare-fun m!172049 () Bool)

(assert (=> b!114998 m!172049))

(declare-fun m!172051 () Bool)

(assert (=> b!114998 m!172051))

(declare-fun m!172053 () Bool)

(assert (=> b!114998 m!172053))

(declare-fun m!172055 () Bool)

(assert (=> b!114998 m!172055))

(declare-fun m!172057 () Bool)

(assert (=> b!115005 m!172057))

(declare-fun m!172059 () Bool)

(assert (=> b!115004 m!172059))

(declare-fun m!172061 () Bool)

(assert (=> b!115002 m!172061))

(assert (=> b!115002 m!172061))

(declare-fun m!172063 () Bool)

(assert (=> b!115002 m!172063))

(declare-fun m!172065 () Bool)

(assert (=> b!115000 m!172065))

(push 1)

(assert (not b!115000))

(assert (not b!114999))

(assert (not b!115009))

(assert (not b!115006))

(assert (not b!115007))

(assert (not start!22770))

(assert (not b!115005))

(assert (not b!115004))

(assert (not b!115002))

(assert (not b!114998))

(assert (not b!115001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37062 () Bool)

(assert (=> d!37062 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!115004 d!37062))

(declare-fun d!37064 () Bool)

(assert (=> d!37064 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305) (size!2358 (buf!2768 thiss!1305))))))

(declare-fun bs!8975 () Bool)

(assert (= bs!8975 d!37064))

(declare-fun m!172097 () Bool)

(assert (=> bs!8975 m!172097))

(assert (=> start!22770 d!37064))

(declare-fun d!37066 () Bool)

(assert (=> d!37066 (= (invariant!0 (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305) (size!2358 (buf!2768 (_2!5003 lt!175206)))) (and (bvsge (currentBit!5382 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5382 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5387 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5387 thiss!1305) (size!2358 (buf!2768 (_2!5003 lt!175206)))) (and (= (currentBit!5382 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5387 thiss!1305) (size!2358 (buf!2768 (_2!5003 lt!175206))))))))))

(assert (=> b!115000 d!37066))

(declare-fun d!37070 () Bool)

(declare-fun e!75432 () Bool)

(assert (=> d!37070 e!75432))

(declare-fun res!95065 () Bool)

(assert (=> d!37070 (=> (not res!95065) (not e!75432))))

(declare-fun lt!175305 () (_ BitVec 64))

(declare-fun lt!175307 () (_ BitVec 64))

(declare-fun lt!175304 () (_ BitVec 64))

(assert (=> d!37070 (= res!95065 (= lt!175304 (bvsub lt!175305 lt!175307)))))

(assert (=> d!37070 (or (= (bvand lt!175305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175305 lt!175307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37070 (= lt!175307 (remainingBits!0 ((_ sign_extend 32) (size!2358 (buf!2768 (_1!5002 lt!175215)))) ((_ sign_extend 32) (currentByte!5387 (_1!5002 lt!175215))) ((_ sign_extend 32) (currentBit!5382 (_1!5002 lt!175215)))))))

(declare-fun lt!175303 () (_ BitVec 64))

(declare-fun lt!175306 () (_ BitVec 64))

(assert (=> d!37070 (= lt!175305 (bvmul lt!175303 lt!175306))))

(assert (=> d!37070 (or (= lt!175303 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175306 (bvsdiv (bvmul lt!175303 lt!175306) lt!175303)))))

(assert (=> d!37070 (= lt!175306 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37070 (= lt!175303 ((_ sign_extend 32) (size!2358 (buf!2768 (_1!5002 lt!175215)))))))

(assert (=> d!37070 (= lt!175304 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5387 (_1!5002 lt!175215))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5382 (_1!5002 lt!175215)))))))

(assert (=> d!37070 (invariant!0 (currentBit!5382 (_1!5002 lt!175215)) (currentByte!5387 (_1!5002 lt!175215)) (size!2358 (buf!2768 (_1!5002 lt!175215))))))

(assert (=> d!37070 (= (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!175215))) (currentByte!5387 (_1!5002 lt!175215)) (currentBit!5382 (_1!5002 lt!175215))) lt!175304)))

(declare-fun b!115044 () Bool)

(declare-fun res!95064 () Bool)

(assert (=> b!115044 (=> (not res!95064) (not e!75432))))

(assert (=> b!115044 (= res!95064 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175304))))

(declare-fun b!115045 () Bool)

(declare-fun lt!175308 () (_ BitVec 64))

(assert (=> b!115045 (= e!75432 (bvsle lt!175304 (bvmul lt!175308 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115045 (or (= lt!175308 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175308 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175308)))))

(assert (=> b!115045 (= lt!175308 ((_ sign_extend 32) (size!2358 (buf!2768 (_1!5002 lt!175215)))))))

(assert (= (and d!37070 res!95065) b!115044))

(assert (= (and b!115044 res!95064) b!115045))

(declare-fun m!172109 () Bool)

(assert (=> d!37070 m!172109))

(declare-fun m!172111 () Bool)

(assert (=> d!37070 m!172111))

(assert (=> b!115001 d!37070))

(declare-fun d!37080 () Bool)

(declare-datatypes ((tuple2!9486 0))(
  ( (tuple2!9487 (_1!5008 Bool) (_2!5008 BitStream!4190)) )
))
(declare-fun lt!175311 () tuple2!9486)

(declare-fun readBit!0 (BitStream!4190) tuple2!9486)

(assert (=> d!37080 (= lt!175311 (readBit!0 (readerFrom!0 (_2!5003 lt!175206) (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305))))))

(assert (=> d!37080 (= (readBitPure!0 (readerFrom!0 (_2!5003 lt!175206) (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305))) (tuple2!9475 (_2!5008 lt!175311) (_1!5008 lt!175311)))))

(declare-fun bs!8978 () Bool)

(assert (= bs!8978 d!37080))

(assert (=> bs!8978 m!172061))

(declare-fun m!172113 () Bool)

(assert (=> bs!8978 m!172113))

(assert (=> b!115002 d!37080))

(declare-fun d!37086 () Bool)

(declare-fun e!75440 () Bool)

(assert (=> d!37086 e!75440))

(declare-fun res!95076 () Bool)

(assert (=> d!37086 (=> (not res!95076) (not e!75440))))

(assert (=> d!37086 (= res!95076 (invariant!0 (currentBit!5382 (_2!5003 lt!175206)) (currentByte!5387 (_2!5003 lt!175206)) (size!2358 (buf!2768 (_2!5003 lt!175206)))))))

(assert (=> d!37086 (= (readerFrom!0 (_2!5003 lt!175206) (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305)) (BitStream!4191 (buf!2768 (_2!5003 lt!175206)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305)))))

(declare-fun b!115055 () Bool)

(assert (=> b!115055 (= e!75440 (invariant!0 (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305) (size!2358 (buf!2768 (_2!5003 lt!175206)))))))

(assert (= (and d!37086 res!95076) b!115055))

(declare-fun m!172115 () Bool)

(assert (=> d!37086 m!172115))

(assert (=> b!115055 m!172065))

(assert (=> b!115002 d!37086))

(declare-fun d!37090 () Bool)

(declare-fun lt!175312 () tuple2!9486)

(assert (=> d!37090 (= lt!175312 (readBit!0 lt!175209))))

(assert (=> d!37090 (= (readBitPure!0 lt!175209) (tuple2!9475 (_2!5008 lt!175312) (_1!5008 lt!175312)))))

(declare-fun bs!8979 () Bool)

(assert (= bs!8979 d!37090))

(declare-fun m!172117 () Bool)

(assert (=> bs!8979 m!172117))

(assert (=> b!114998 d!37090))

(declare-fun d!37092 () Bool)

(declare-fun e!75443 () Bool)

(assert (=> d!37092 e!75443))

(declare-fun res!95080 () Bool)

(assert (=> d!37092 (=> (not res!95080) (not e!75443))))

(declare-fun lt!175315 () (_ BitVec 64))

(declare-fun lt!175317 () (_ BitVec 64))

(declare-fun lt!175314 () (_ BitVec 64))

(assert (=> d!37092 (= res!95080 (= lt!175314 (bvsub lt!175315 lt!175317)))))

(assert (=> d!37092 (or (= (bvand lt!175315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175317 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175315 lt!175317) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37092 (= lt!175317 (remainingBits!0 ((_ sign_extend 32) (size!2358 (buf!2768 (_1!5002 lt!175216)))) ((_ sign_extend 32) (currentByte!5387 (_1!5002 lt!175216))) ((_ sign_extend 32) (currentBit!5382 (_1!5002 lt!175216)))))))

(declare-fun lt!175313 () (_ BitVec 64))

(declare-fun lt!175316 () (_ BitVec 64))

(assert (=> d!37092 (= lt!175315 (bvmul lt!175313 lt!175316))))

(assert (=> d!37092 (or (= lt!175313 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175316 (bvsdiv (bvmul lt!175313 lt!175316) lt!175313)))))

(assert (=> d!37092 (= lt!175316 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37092 (= lt!175313 ((_ sign_extend 32) (size!2358 (buf!2768 (_1!5002 lt!175216)))))))

(assert (=> d!37092 (= lt!175314 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5387 (_1!5002 lt!175216))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5382 (_1!5002 lt!175216)))))))

(assert (=> d!37092 (invariant!0 (currentBit!5382 (_1!5002 lt!175216)) (currentByte!5387 (_1!5002 lt!175216)) (size!2358 (buf!2768 (_1!5002 lt!175216))))))

(assert (=> d!37092 (= (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!175216))) (currentByte!5387 (_1!5002 lt!175216)) (currentBit!5382 (_1!5002 lt!175216))) lt!175314)))

(declare-fun b!115058 () Bool)

(declare-fun res!95079 () Bool)

(assert (=> b!115058 (=> (not res!95079) (not e!75443))))

(assert (=> b!115058 (= res!95079 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175314))))

(declare-fun b!115059 () Bool)

(declare-fun lt!175318 () (_ BitVec 64))

(assert (=> b!115059 (= e!75443 (bvsle lt!175314 (bvmul lt!175318 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115059 (or (= lt!175318 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175318 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175318)))))

(assert (=> b!115059 (= lt!175318 ((_ sign_extend 32) (size!2358 (buf!2768 (_1!5002 lt!175216)))))))

(assert (= (and d!37092 res!95080) b!115058))

(assert (= (and b!115058 res!95079) b!115059))

(declare-fun m!172119 () Bool)

(assert (=> d!37092 m!172119))

(declare-fun m!172121 () Bool)

(assert (=> d!37092 m!172121))

(assert (=> b!114998 d!37092))

(declare-fun d!37094 () Bool)

(declare-fun e!75450 () Bool)

(assert (=> d!37094 e!75450))

(declare-fun res!95090 () Bool)

(assert (=> d!37094 (=> (not res!95090) (not e!75450))))

(declare-fun lt!175341 () tuple2!9474)

(declare-fun lt!175339 () tuple2!9474)

(assert (=> d!37094 (= res!95090 (= (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!175341))) (currentByte!5387 (_1!5002 lt!175341)) (currentBit!5382 (_1!5002 lt!175341))) (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!175339))) (currentByte!5387 (_1!5002 lt!175339)) (currentBit!5382 (_1!5002 lt!175339)))))))

(declare-fun lt!175340 () Unit!7073)

(declare-fun lt!175342 () BitStream!4190)

(declare-fun choose!50 (BitStream!4190 BitStream!4190 BitStream!4190 tuple2!9474 tuple2!9474 BitStream!4190 Bool tuple2!9474 tuple2!9474 BitStream!4190 Bool) Unit!7073)

(assert (=> d!37094 (= lt!175340 (choose!50 lt!175209 (_2!5003 lt!175213) lt!175342 lt!175341 (tuple2!9475 (_1!5002 lt!175341) (_2!5002 lt!175341)) (_1!5002 lt!175341) (_2!5002 lt!175341) lt!175339 (tuple2!9475 (_1!5002 lt!175339) (_2!5002 lt!175339)) (_1!5002 lt!175339) (_2!5002 lt!175339)))))

(assert (=> d!37094 (= lt!175339 (readBitPure!0 lt!175342))))

(assert (=> d!37094 (= lt!175341 (readBitPure!0 lt!175209))))

(assert (=> d!37094 (= lt!175342 (BitStream!4191 (buf!2768 (_2!5003 lt!175213)) (currentByte!5387 lt!175209) (currentBit!5382 lt!175209)))))

(assert (=> d!37094 (invariant!0 (currentBit!5382 lt!175209) (currentByte!5387 lt!175209) (size!2358 (buf!2768 (_2!5003 lt!175213))))))

(assert (=> d!37094 (= (readBitPrefixLemma!0 lt!175209 (_2!5003 lt!175213)) lt!175340)))

(declare-fun b!115069 () Bool)

(assert (=> b!115069 (= e!75450 (= (_2!5002 lt!175341) (_2!5002 lt!175339)))))

(assert (= (and d!37094 res!95090) b!115069))

(assert (=> d!37094 m!172051))

(declare-fun m!172133 () Bool)

(assert (=> d!37094 m!172133))

(declare-fun m!172135 () Bool)

(assert (=> d!37094 m!172135))

(declare-fun m!172137 () Bool)

(assert (=> d!37094 m!172137))

(declare-fun m!172139 () Bool)

(assert (=> d!37094 m!172139))

(declare-fun m!172141 () Bool)

(assert (=> d!37094 m!172141))

(assert (=> b!114998 d!37094))

(declare-fun d!37106 () Bool)

(declare-fun e!75455 () Bool)

(assert (=> d!37106 e!75455))

(declare-fun res!95097 () Bool)

(assert (=> d!37106 (=> (not res!95097) (not e!75455))))

(declare-fun lt!175401 () tuple2!9472)

(assert (=> d!37106 (= res!95097 (isPrefixOf!0 (_1!5001 lt!175401) (_2!5001 lt!175401)))))

(declare-fun lt!175383 () BitStream!4190)

(assert (=> d!37106 (= lt!175401 (tuple2!9473 lt!175383 (_2!5003 lt!175213)))))

(declare-fun lt!175393 () Unit!7073)

(declare-fun lt!175396 () Unit!7073)

(assert (=> d!37106 (= lt!175393 lt!175396)))

(assert (=> d!37106 (isPrefixOf!0 lt!175383 (_2!5003 lt!175213))))

(assert (=> d!37106 (= lt!175396 (lemmaIsPrefixTransitive!0 lt!175383 (_2!5003 lt!175213) (_2!5003 lt!175213)))))

(declare-fun lt!175389 () Unit!7073)

(declare-fun lt!175386 () Unit!7073)

(assert (=> d!37106 (= lt!175389 lt!175386)))

(assert (=> d!37106 (isPrefixOf!0 lt!175383 (_2!5003 lt!175213))))

(assert (=> d!37106 (= lt!175386 (lemmaIsPrefixTransitive!0 lt!175383 (_2!5003 lt!175206) (_2!5003 lt!175213)))))

(declare-fun lt!175394 () Unit!7073)

(declare-fun e!75456 () Unit!7073)

(assert (=> d!37106 (= lt!175394 e!75456)))

(declare-fun c!6973 () Bool)

(assert (=> d!37106 (= c!6973 (not (= (size!2358 (buf!2768 (_2!5003 lt!175206))) #b00000000000000000000000000000000)))))

(declare-fun lt!175400 () Unit!7073)

(declare-fun lt!175388 () Unit!7073)

(assert (=> d!37106 (= lt!175400 lt!175388)))

(assert (=> d!37106 (isPrefixOf!0 (_2!5003 lt!175213) (_2!5003 lt!175213))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4190) Unit!7073)

(assert (=> d!37106 (= lt!175388 (lemmaIsPrefixRefl!0 (_2!5003 lt!175213)))))

(declare-fun lt!175391 () Unit!7073)

(declare-fun lt!175397 () Unit!7073)

(assert (=> d!37106 (= lt!175391 lt!175397)))

(assert (=> d!37106 (= lt!175397 (lemmaIsPrefixRefl!0 (_2!5003 lt!175213)))))

(declare-fun lt!175385 () Unit!7073)

(declare-fun lt!175395 () Unit!7073)

(assert (=> d!37106 (= lt!175385 lt!175395)))

(assert (=> d!37106 (isPrefixOf!0 lt!175383 lt!175383)))

(assert (=> d!37106 (= lt!175395 (lemmaIsPrefixRefl!0 lt!175383))))

(declare-fun lt!175392 () Unit!7073)

(declare-fun lt!175390 () Unit!7073)

(assert (=> d!37106 (= lt!175392 lt!175390)))

(assert (=> d!37106 (isPrefixOf!0 (_2!5003 lt!175206) (_2!5003 lt!175206))))

(assert (=> d!37106 (= lt!175390 (lemmaIsPrefixRefl!0 (_2!5003 lt!175206)))))

(assert (=> d!37106 (= lt!175383 (BitStream!4191 (buf!2768 (_2!5003 lt!175213)) (currentByte!5387 (_2!5003 lt!175206)) (currentBit!5382 (_2!5003 lt!175206))))))

(assert (=> d!37106 (isPrefixOf!0 (_2!5003 lt!175206) (_2!5003 lt!175213))))

(assert (=> d!37106 (= (reader!0 (_2!5003 lt!175206) (_2!5003 lt!175213)) lt!175401)))

(declare-fun b!115080 () Bool)

(declare-fun lt!175384 () Unit!7073)

(assert (=> b!115080 (= e!75456 lt!175384)))

(declare-fun lt!175387 () (_ BitVec 64))

(assert (=> b!115080 (= lt!175387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!175402 () (_ BitVec 64))

(assert (=> b!115080 (= lt!175402 (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175206))) (currentByte!5387 (_2!5003 lt!175206)) (currentBit!5382 (_2!5003 lt!175206))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5196 array!5196 (_ BitVec 64) (_ BitVec 64)) Unit!7073)

(assert (=> b!115080 (= lt!175384 (arrayBitRangesEqSymmetric!0 (buf!2768 (_2!5003 lt!175206)) (buf!2768 (_2!5003 lt!175213)) lt!175387 lt!175402))))

(declare-fun arrayBitRangesEq!0 (array!5196 array!5196 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115080 (arrayBitRangesEq!0 (buf!2768 (_2!5003 lt!175213)) (buf!2768 (_2!5003 lt!175206)) lt!175387 lt!175402)))

(declare-fun lt!175398 () (_ BitVec 64))

(declare-fun b!115081 () Bool)

(declare-fun lt!175399 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4190 (_ BitVec 64)) BitStream!4190)

(assert (=> b!115081 (= e!75455 (= (_1!5001 lt!175401) (withMovedBitIndex!0 (_2!5001 lt!175401) (bvsub lt!175398 lt!175399))))))

(assert (=> b!115081 (or (= (bvand lt!175398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175399 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175398 lt!175399) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115081 (= lt!175399 (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175213))) (currentByte!5387 (_2!5003 lt!175213)) (currentBit!5382 (_2!5003 lt!175213))))))

(assert (=> b!115081 (= lt!175398 (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175206))) (currentByte!5387 (_2!5003 lt!175206)) (currentBit!5382 (_2!5003 lt!175206))))))

(declare-fun b!115082 () Bool)

(declare-fun res!95099 () Bool)

(assert (=> b!115082 (=> (not res!95099) (not e!75455))))

(assert (=> b!115082 (= res!95099 (isPrefixOf!0 (_1!5001 lt!175401) (_2!5003 lt!175206)))))

(declare-fun b!115083 () Bool)

(declare-fun res!95098 () Bool)

(assert (=> b!115083 (=> (not res!95098) (not e!75455))))

(assert (=> b!115083 (= res!95098 (isPrefixOf!0 (_2!5001 lt!175401) (_2!5003 lt!175213)))))

(declare-fun b!115084 () Bool)

(declare-fun Unit!7090 () Unit!7073)

(assert (=> b!115084 (= e!75456 Unit!7090)))

(assert (= (and d!37106 c!6973) b!115080))

(assert (= (and d!37106 (not c!6973)) b!115084))

(assert (= (and d!37106 res!95097) b!115082))

(assert (= (and b!115082 res!95099) b!115083))

(assert (= (and b!115083 res!95098) b!115081))

(declare-fun m!172143 () Bool)

(assert (=> b!115082 m!172143))

(declare-fun m!172145 () Bool)

(assert (=> b!115083 m!172145))

(assert (=> b!115080 m!172019))

(declare-fun m!172147 () Bool)

(assert (=> b!115080 m!172147))

(declare-fun m!172149 () Bool)

(assert (=> b!115080 m!172149))

(declare-fun m!172151 () Bool)

(assert (=> d!37106 m!172151))

(declare-fun m!172153 () Bool)

(assert (=> d!37106 m!172153))

(declare-fun m!172155 () Bool)

(assert (=> d!37106 m!172155))

(declare-fun m!172157 () Bool)

(assert (=> d!37106 m!172157))

(declare-fun m!172159 () Bool)

(assert (=> d!37106 m!172159))

(declare-fun m!172161 () Bool)

(assert (=> d!37106 m!172161))

(declare-fun m!172163 () Bool)

(assert (=> d!37106 m!172163))

(declare-fun m!172165 () Bool)

(assert (=> d!37106 m!172165))

(declare-fun m!172167 () Bool)

(assert (=> d!37106 m!172167))

(declare-fun m!172169 () Bool)

(assert (=> d!37106 m!172169))

(declare-fun m!172171 () Bool)

(assert (=> d!37106 m!172171))

(declare-fun m!172173 () Bool)

(assert (=> b!115081 m!172173))

(declare-fun m!172175 () Bool)

(assert (=> b!115081 m!172175))

(assert (=> b!115081 m!172019))

(assert (=> b!114998 d!37106))

(declare-fun d!37108 () Bool)

(declare-fun e!75457 () Bool)

(assert (=> d!37108 e!75457))

(declare-fun res!95101 () Bool)

(assert (=> d!37108 (=> (not res!95101) (not e!75457))))

(declare-fun lt!175407 () (_ BitVec 64))

(declare-fun lt!175404 () (_ BitVec 64))

(declare-fun lt!175405 () (_ BitVec 64))

(assert (=> d!37108 (= res!95101 (= lt!175404 (bvsub lt!175405 lt!175407)))))

(assert (=> d!37108 (or (= (bvand lt!175405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175405 lt!175407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37108 (= lt!175407 (remainingBits!0 ((_ sign_extend 32) (size!2358 (buf!2768 (_1!5002 lt!175207)))) ((_ sign_extend 32) (currentByte!5387 (_1!5002 lt!175207))) ((_ sign_extend 32) (currentBit!5382 (_1!5002 lt!175207)))))))

(declare-fun lt!175403 () (_ BitVec 64))

(declare-fun lt!175406 () (_ BitVec 64))

(assert (=> d!37108 (= lt!175405 (bvmul lt!175403 lt!175406))))

(assert (=> d!37108 (or (= lt!175403 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175406 (bvsdiv (bvmul lt!175403 lt!175406) lt!175403)))))

(assert (=> d!37108 (= lt!175406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37108 (= lt!175403 ((_ sign_extend 32) (size!2358 (buf!2768 (_1!5002 lt!175207)))))))

(assert (=> d!37108 (= lt!175404 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5387 (_1!5002 lt!175207))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5382 (_1!5002 lt!175207)))))))

(assert (=> d!37108 (invariant!0 (currentBit!5382 (_1!5002 lt!175207)) (currentByte!5387 (_1!5002 lt!175207)) (size!2358 (buf!2768 (_1!5002 lt!175207))))))

(assert (=> d!37108 (= (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!175207))) (currentByte!5387 (_1!5002 lt!175207)) (currentBit!5382 (_1!5002 lt!175207))) lt!175404)))

(declare-fun b!115085 () Bool)

(declare-fun res!95100 () Bool)

(assert (=> b!115085 (=> (not res!95100) (not e!75457))))

(assert (=> b!115085 (= res!95100 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175404))))

(declare-fun b!115086 () Bool)

(declare-fun lt!175408 () (_ BitVec 64))

(assert (=> b!115086 (= e!75457 (bvsle lt!175404 (bvmul lt!175408 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115086 (or (= lt!175408 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175408 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175408)))))

(assert (=> b!115086 (= lt!175408 ((_ sign_extend 32) (size!2358 (buf!2768 (_1!5002 lt!175207)))))))

(assert (= (and d!37108 res!95101) b!115085))

(assert (= (and b!115085 res!95100) b!115086))

(declare-fun m!172177 () Bool)

(assert (=> d!37108 m!172177))

(declare-fun m!172179 () Bool)

(assert (=> d!37108 m!172179))

(assert (=> b!114998 d!37108))

(declare-fun d!37110 () Bool)

(declare-fun lt!175409 () tuple2!9486)

(assert (=> d!37110 (= lt!175409 (readBit!0 (BitStream!4191 (buf!2768 (_2!5003 lt!175213)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305))))))

(assert (=> d!37110 (= (readBitPure!0 (BitStream!4191 (buf!2768 (_2!5003 lt!175213)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305))) (tuple2!9475 (_2!5008 lt!175409) (_1!5008 lt!175409)))))

(declare-fun bs!8981 () Bool)

(assert (= bs!8981 d!37110))

(declare-fun m!172181 () Bool)

(assert (=> bs!8981 m!172181))

(assert (=> b!114998 d!37110))

(declare-fun d!37112 () Bool)

(assert (=> d!37112 (isPrefixOf!0 thiss!1305 (_2!5003 lt!175213))))

(declare-fun lt!175412 () Unit!7073)

(declare-fun choose!30 (BitStream!4190 BitStream!4190 BitStream!4190) Unit!7073)

(assert (=> d!37112 (= lt!175412 (choose!30 thiss!1305 (_2!5003 lt!175206) (_2!5003 lt!175213)))))

(assert (=> d!37112 (isPrefixOf!0 thiss!1305 (_2!5003 lt!175206))))

(assert (=> d!37112 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5003 lt!175206) (_2!5003 lt!175213)) lt!175412)))

(declare-fun bs!8982 () Bool)

(assert (= bs!8982 d!37112))

(assert (=> bs!8982 m!172043))

(declare-fun m!172183 () Bool)

(assert (=> bs!8982 m!172183))

(assert (=> bs!8982 m!172025))

(assert (=> b!114998 d!37112))

(declare-fun d!37114 () Bool)

(declare-fun res!95108 () Bool)

(declare-fun e!75463 () Bool)

(assert (=> d!37114 (=> (not res!95108) (not e!75463))))

(assert (=> d!37114 (= res!95108 (= (size!2358 (buf!2768 thiss!1305)) (size!2358 (buf!2768 (_2!5003 lt!175213)))))))

(assert (=> d!37114 (= (isPrefixOf!0 thiss!1305 (_2!5003 lt!175213)) e!75463)))

(declare-fun b!115093 () Bool)

(declare-fun res!95110 () Bool)

(assert (=> b!115093 (=> (not res!95110) (not e!75463))))

(assert (=> b!115093 (= res!95110 (bvsle (bitIndex!0 (size!2358 (buf!2768 thiss!1305)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305)) (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175213))) (currentByte!5387 (_2!5003 lt!175213)) (currentBit!5382 (_2!5003 lt!175213)))))))

(declare-fun b!115094 () Bool)

(declare-fun e!75462 () Bool)

(assert (=> b!115094 (= e!75463 e!75462)))

(declare-fun res!95109 () Bool)

(assert (=> b!115094 (=> res!95109 e!75462)))

(assert (=> b!115094 (= res!95109 (= (size!2358 (buf!2768 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115095 () Bool)

(assert (=> b!115095 (= e!75462 (arrayBitRangesEq!0 (buf!2768 thiss!1305) (buf!2768 (_2!5003 lt!175213)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2358 (buf!2768 thiss!1305)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305))))))

(assert (= (and d!37114 res!95108) b!115093))

(assert (= (and b!115093 res!95110) b!115094))

(assert (= (and b!115094 (not res!95109)) b!115095))

(assert (=> b!115093 m!172021))

(assert (=> b!115093 m!172175))

(assert (=> b!115095 m!172021))

(assert (=> b!115095 m!172021))

(declare-fun m!172185 () Bool)

(assert (=> b!115095 m!172185))

(assert (=> b!114998 d!37114))

(declare-fun d!37116 () Bool)

(declare-fun lt!175413 () tuple2!9486)

(assert (=> d!37116 (= lt!175413 (readBit!0 (_1!5001 lt!175212)))))

(assert (=> d!37116 (= (readBitPure!0 (_1!5001 lt!175212)) (tuple2!9475 (_2!5008 lt!175413) (_1!5008 lt!175413)))))

(declare-fun bs!8983 () Bool)

(assert (= bs!8983 d!37116))

(declare-fun m!172187 () Bool)

(assert (=> bs!8983 m!172187))

(assert (=> b!114998 d!37116))

(declare-fun d!37118 () Bool)

(declare-fun e!75561 () Bool)

(assert (=> d!37118 e!75561))

(declare-fun res!95258 () Bool)

(assert (=> d!37118 (=> (not res!95258) (not e!75561))))

(declare-fun lt!176025 () tuple2!9476)

(assert (=> d!37118 (= res!95258 (= (size!2358 (buf!2768 (_2!5003 lt!175206))) (size!2358 (buf!2768 (_2!5003 lt!176025)))))))

(declare-fun e!75565 () tuple2!9476)

(assert (=> d!37118 (= lt!176025 e!75565)))

(declare-fun c!6999 () Bool)

(assert (=> d!37118 (= c!6999 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37118 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37118 (= (appendNLeastSignificantBitsLoop!0 (_2!5003 lt!175206) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!176025)))

(declare-fun b!115284 () Bool)

(declare-fun e!75567 () Bool)

(declare-fun lt!176006 () tuple2!9474)

(declare-fun lt!176037 () tuple2!9474)

(assert (=> b!115284 (= e!75567 (= (_2!5002 lt!176006) (_2!5002 lt!176037)))))

(declare-fun b!115285 () Bool)

(declare-fun e!75562 () Bool)

(declare-fun lt!176002 () tuple2!9474)

(declare-fun lt!176023 () tuple2!9476)

(assert (=> b!115285 (= e!75562 (= (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!176002))) (currentByte!5387 (_1!5002 lt!176002)) (currentBit!5382 (_1!5002 lt!176002))) (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!176023))) (currentByte!5387 (_2!5003 lt!176023)) (currentBit!5382 (_2!5003 lt!176023)))))))

(declare-fun b!115286 () Bool)

(declare-fun lt!176015 () Unit!7073)

(assert (=> b!115286 (= e!75565 (tuple2!9477 lt!176015 (_2!5003 lt!175206)))))

(declare-fun lt!176013 () BitStream!4190)

(assert (=> b!115286 (= lt!176013 (_2!5003 lt!175206))))

(assert (=> b!115286 (= lt!176015 (lemmaIsPrefixRefl!0 lt!176013))))

(declare-fun call!1499 () Bool)

(assert (=> b!115286 call!1499))

(declare-fun bm!1496 () Bool)

(declare-fun lt!176001 () tuple2!9476)

(assert (=> bm!1496 (= call!1499 (isPrefixOf!0 (ite c!6999 (_2!5003 lt!175206) lt!176013) (ite c!6999 (_2!5003 lt!176001) lt!176013)))))

(declare-fun lt!176042 () tuple2!9472)

(declare-datatypes ((tuple2!9488 0))(
  ( (tuple2!9489 (_1!5009 BitStream!4190) (_2!5009 (_ BitVec 64))) )
))
(declare-fun lt!176018 () tuple2!9488)

(declare-fun b!115287 () Bool)

(assert (=> b!115287 (= e!75561 (and (= (_2!5009 lt!176018) v!199) (= (_1!5009 lt!176018) (_2!5001 lt!176042))))))

(declare-fun lt!176014 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9488)

(assert (=> b!115287 (= lt!176018 (readNLeastSignificantBitsLoopPure!0 (_1!5001 lt!176042) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!176014))))

(declare-fun lt!176011 () Unit!7073)

(declare-fun lt!176033 () Unit!7073)

(assert (=> b!115287 (= lt!176011 lt!176033)))

(declare-fun lt!176021 () (_ BitVec 64))

(assert (=> b!115287 (validate_offset_bits!1 ((_ sign_extend 32) (size!2358 (buf!2768 (_2!5003 lt!176025)))) ((_ sign_extend 32) (currentByte!5387 (_2!5003 lt!175206))) ((_ sign_extend 32) (currentBit!5382 (_2!5003 lt!175206))) lt!176021)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4190 array!5196 (_ BitVec 64)) Unit!7073)

(assert (=> b!115287 (= lt!176033 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5003 lt!175206) (buf!2768 (_2!5003 lt!176025)) lt!176021))))

(declare-fun e!75564 () Bool)

(assert (=> b!115287 e!75564))

(declare-fun res!95254 () Bool)

(assert (=> b!115287 (=> (not res!95254) (not e!75564))))

(assert (=> b!115287 (= res!95254 (and (= (size!2358 (buf!2768 (_2!5003 lt!175206))) (size!2358 (buf!2768 (_2!5003 lt!176025)))) (bvsge lt!176021 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115287 (= lt!176021 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115287 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115287 (= lt!176014 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!115287 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115287 (= lt!176042 (reader!0 (_2!5003 lt!175206) (_2!5003 lt!176025)))))

(declare-fun b!115288 () Bool)

(declare-fun res!95255 () Bool)

(assert (=> b!115288 (= res!95255 (= (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!176023))) (currentByte!5387 (_2!5003 lt!176023)) (currentBit!5382 (_2!5003 lt!176023))) (bvadd (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175206))) (currentByte!5387 (_2!5003 lt!175206)) (currentBit!5382 (_2!5003 lt!175206))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!75563 () Bool)

(assert (=> b!115288 (=> (not res!95255) (not e!75563))))

(declare-fun b!115289 () Bool)

(declare-fun Unit!7092 () Unit!7073)

(assert (=> b!115289 (= e!75565 (tuple2!9477 Unit!7092 (_2!5003 lt!176001)))))

(declare-fun lt!176031 () Bool)

(assert (=> b!115289 (= lt!176031 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115289 (= lt!176023 (appendBit!0 (_2!5003 lt!175206) lt!176031))))

(declare-fun res!95251 () Bool)

(assert (=> b!115289 (= res!95251 (= (size!2358 (buf!2768 (_2!5003 lt!175206))) (size!2358 (buf!2768 (_2!5003 lt!176023)))))))

(assert (=> b!115289 (=> (not res!95251) (not e!75563))))

(assert (=> b!115289 e!75563))

(declare-fun lt!176026 () tuple2!9476)

(assert (=> b!115289 (= lt!176026 lt!176023)))

(assert (=> b!115289 (= lt!176001 (appendNLeastSignificantBitsLoop!0 (_2!5003 lt!176026) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!176041 () Unit!7073)

(assert (=> b!115289 (= lt!176041 (lemmaIsPrefixTransitive!0 (_2!5003 lt!175206) (_2!5003 lt!176026) (_2!5003 lt!176001)))))

(assert (=> b!115289 call!1499))

(declare-fun lt!176016 () Unit!7073)

(assert (=> b!115289 (= lt!176016 lt!176041)))

(assert (=> b!115289 (invariant!0 (currentBit!5382 (_2!5003 lt!175206)) (currentByte!5387 (_2!5003 lt!175206)) (size!2358 (buf!2768 (_2!5003 lt!176026))))))

(declare-fun lt!176007 () BitStream!4190)

(assert (=> b!115289 (= lt!176007 (BitStream!4191 (buf!2768 (_2!5003 lt!176026)) (currentByte!5387 (_2!5003 lt!175206)) (currentBit!5382 (_2!5003 lt!175206))))))

(assert (=> b!115289 (invariant!0 (currentBit!5382 lt!176007) (currentByte!5387 lt!176007) (size!2358 (buf!2768 (_2!5003 lt!176001))))))

(declare-fun lt!176020 () BitStream!4190)

(assert (=> b!115289 (= lt!176020 (BitStream!4191 (buf!2768 (_2!5003 lt!176001)) (currentByte!5387 lt!176007) (currentBit!5382 lt!176007)))))

(assert (=> b!115289 (= lt!176006 (readBitPure!0 lt!176007))))

(assert (=> b!115289 (= lt!176037 (readBitPure!0 lt!176020))))

(declare-fun lt!176004 () Unit!7073)

(assert (=> b!115289 (= lt!176004 (readBitPrefixLemma!0 lt!176007 (_2!5003 lt!176001)))))

(declare-fun res!95257 () Bool)

(assert (=> b!115289 (= res!95257 (= (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!176006))) (currentByte!5387 (_1!5002 lt!176006)) (currentBit!5382 (_1!5002 lt!176006))) (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!176037))) (currentByte!5387 (_1!5002 lt!176037)) (currentBit!5382 (_1!5002 lt!176037)))))))

(assert (=> b!115289 (=> (not res!95257) (not e!75567))))

(assert (=> b!115289 e!75567))

(declare-fun lt!176010 () Unit!7073)

(assert (=> b!115289 (= lt!176010 lt!176004)))

(declare-fun lt!176044 () tuple2!9472)

(assert (=> b!115289 (= lt!176044 (reader!0 (_2!5003 lt!175206) (_2!5003 lt!176001)))))

(declare-fun lt!176017 () tuple2!9472)

(assert (=> b!115289 (= lt!176017 (reader!0 (_2!5003 lt!176026) (_2!5003 lt!176001)))))

(declare-fun lt!176029 () tuple2!9474)

(assert (=> b!115289 (= lt!176029 (readBitPure!0 (_1!5001 lt!176044)))))

(assert (=> b!115289 (= (_2!5002 lt!176029) lt!176031)))

(declare-fun lt!176040 () Unit!7073)

(declare-fun Unit!7093 () Unit!7073)

(assert (=> b!115289 (= lt!176040 Unit!7093)))

(declare-fun lt!176012 () (_ BitVec 64))

(assert (=> b!115289 (= lt!176012 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!176022 () (_ BitVec 64))

(assert (=> b!115289 (= lt!176022 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!176000 () Unit!7073)

(assert (=> b!115289 (= lt!176000 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5003 lt!175206) (buf!2768 (_2!5003 lt!176001)) lt!176022))))

(assert (=> b!115289 (validate_offset_bits!1 ((_ sign_extend 32) (size!2358 (buf!2768 (_2!5003 lt!176001)))) ((_ sign_extend 32) (currentByte!5387 (_2!5003 lt!175206))) ((_ sign_extend 32) (currentBit!5382 (_2!5003 lt!175206))) lt!176022)))

(declare-fun lt!176038 () Unit!7073)

(assert (=> b!115289 (= lt!176038 lt!176000)))

(declare-fun lt!176008 () tuple2!9488)

(assert (=> b!115289 (= lt!176008 (readNLeastSignificantBitsLoopPure!0 (_1!5001 lt!176044) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!176012))))

(declare-fun lt!176028 () (_ BitVec 64))

(assert (=> b!115289 (= lt!176028 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!176030 () Unit!7073)

(assert (=> b!115289 (= lt!176030 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5003 lt!176026) (buf!2768 (_2!5003 lt!176001)) lt!176028))))

(assert (=> b!115289 (validate_offset_bits!1 ((_ sign_extend 32) (size!2358 (buf!2768 (_2!5003 lt!176001)))) ((_ sign_extend 32) (currentByte!5387 (_2!5003 lt!176026))) ((_ sign_extend 32) (currentBit!5382 (_2!5003 lt!176026))) lt!176028)))

(declare-fun lt!176027 () Unit!7073)

(assert (=> b!115289 (= lt!176027 lt!176030)))

(declare-fun lt!176003 () tuple2!9488)

(assert (=> b!115289 (= lt!176003 (readNLeastSignificantBitsLoopPure!0 (_1!5001 lt!176017) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!176012 (ite (_2!5002 lt!176029) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!176039 () tuple2!9488)

(assert (=> b!115289 (= lt!176039 (readNLeastSignificantBitsLoopPure!0 (_1!5001 lt!176044) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!176012))))

(declare-fun c!6998 () Bool)

(assert (=> b!115289 (= c!6998 (_2!5002 (readBitPure!0 (_1!5001 lt!176044))))))

(declare-fun lt!176005 () tuple2!9488)

(declare-fun e!75566 () (_ BitVec 64))

(assert (=> b!115289 (= lt!176005 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5001 lt!176044) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!176012 e!75566)))))

(declare-fun lt!176009 () Unit!7073)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7073)

(assert (=> b!115289 (= lt!176009 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5001 lt!176044) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!176012))))

(assert (=> b!115289 (and (= (_2!5009 lt!176039) (_2!5009 lt!176005)) (= (_1!5009 lt!176039) (_1!5009 lt!176005)))))

(declare-fun lt!176043 () Unit!7073)

(assert (=> b!115289 (= lt!176043 lt!176009)))

(assert (=> b!115289 (= (_1!5001 lt!176044) (withMovedBitIndex!0 (_2!5001 lt!176044) (bvsub (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175206))) (currentByte!5387 (_2!5003 lt!175206)) (currentBit!5382 (_2!5003 lt!175206))) (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!176001))) (currentByte!5387 (_2!5003 lt!176001)) (currentBit!5382 (_2!5003 lt!176001))))))))

(declare-fun lt!176024 () Unit!7073)

(declare-fun Unit!7094 () Unit!7073)

(assert (=> b!115289 (= lt!176024 Unit!7094)))

(assert (=> b!115289 (= (_1!5001 lt!176017) (withMovedBitIndex!0 (_2!5001 lt!176017) (bvsub (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!176026))) (currentByte!5387 (_2!5003 lt!176026)) (currentBit!5382 (_2!5003 lt!176026))) (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!176001))) (currentByte!5387 (_2!5003 lt!176001)) (currentBit!5382 (_2!5003 lt!176001))))))))

(declare-fun lt!176035 () Unit!7073)

(declare-fun Unit!7095 () Unit!7073)

(assert (=> b!115289 (= lt!176035 Unit!7095)))

(assert (=> b!115289 (= (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175206))) (currentByte!5387 (_2!5003 lt!175206)) (currentBit!5382 (_2!5003 lt!175206))) (bvsub (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!176026))) (currentByte!5387 (_2!5003 lt!176026)) (currentBit!5382 (_2!5003 lt!176026))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!176019 () Unit!7073)

(declare-fun Unit!7096 () Unit!7073)

(assert (=> b!115289 (= lt!176019 Unit!7096)))

(assert (=> b!115289 (= (_2!5009 lt!176008) (_2!5009 lt!176003))))

(declare-fun lt!176036 () Unit!7073)

(declare-fun Unit!7097 () Unit!7073)

(assert (=> b!115289 (= lt!176036 Unit!7097)))

(assert (=> b!115289 (= (_1!5009 lt!176008) (_2!5001 lt!176044))))

(declare-fun b!115290 () Bool)

(declare-fun res!95250 () Bool)

(assert (=> b!115290 (= res!95250 (isPrefixOf!0 (_2!5003 lt!175206) (_2!5003 lt!176023)))))

(assert (=> b!115290 (=> (not res!95250) (not e!75563))))

(declare-fun b!115291 () Bool)

(assert (=> b!115291 (= lt!176002 (readBitPure!0 (readerFrom!0 (_2!5003 lt!176023) (currentBit!5382 (_2!5003 lt!175206)) (currentByte!5387 (_2!5003 lt!175206)))))))

(declare-fun res!95252 () Bool)

(assert (=> b!115291 (= res!95252 (and (= (_2!5002 lt!176002) lt!176031) (= (_1!5002 lt!176002) (_2!5003 lt!176023))))))

(assert (=> b!115291 (=> (not res!95252) (not e!75562))))

(assert (=> b!115291 (= e!75563 e!75562)))

(declare-fun b!115292 () Bool)

(assert (=> b!115292 (= e!75566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!115293 () Bool)

(declare-fun res!95256 () Bool)

(assert (=> b!115293 (=> (not res!95256) (not e!75561))))

(declare-fun lt!176034 () (_ BitVec 64))

(declare-fun lt!176032 () (_ BitVec 64))

(assert (=> b!115293 (= res!95256 (= (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!176025))) (currentByte!5387 (_2!5003 lt!176025)) (currentBit!5382 (_2!5003 lt!176025))) (bvadd lt!176032 lt!176034)))))

(assert (=> b!115293 (or (not (= (bvand lt!176032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176034 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!176032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!176032 lt!176034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115293 (= lt!176034 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115293 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115293 (= lt!176032 (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175206))) (currentByte!5387 (_2!5003 lt!175206)) (currentBit!5382 (_2!5003 lt!175206))))))

(declare-fun b!115294 () Bool)

(assert (=> b!115294 (= e!75566 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!115295 () Bool)

(declare-fun res!95253 () Bool)

(assert (=> b!115295 (=> (not res!95253) (not e!75561))))

(assert (=> b!115295 (= res!95253 (isPrefixOf!0 (_2!5003 lt!175206) (_2!5003 lt!176025)))))

(declare-fun b!115296 () Bool)

(assert (=> b!115296 (= e!75564 (validate_offset_bits!1 ((_ sign_extend 32) (size!2358 (buf!2768 (_2!5003 lt!175206)))) ((_ sign_extend 32) (currentByte!5387 (_2!5003 lt!175206))) ((_ sign_extend 32) (currentBit!5382 (_2!5003 lt!175206))) lt!176021))))

(assert (= (and d!37118 c!6999) b!115289))

(assert (= (and d!37118 (not c!6999)) b!115286))

(assert (= (and b!115289 res!95251) b!115288))

(assert (= (and b!115288 res!95255) b!115290))

(assert (= (and b!115290 res!95250) b!115291))

(assert (= (and b!115291 res!95252) b!115285))

(assert (= (and b!115289 res!95257) b!115284))

(assert (= (and b!115289 c!6998) b!115294))

(assert (= (and b!115289 (not c!6998)) b!115292))

(assert (= (or b!115289 b!115286) bm!1496))

(assert (= (and d!37118 res!95258) b!115293))

(assert (= (and b!115293 res!95256) b!115295))

(assert (= (and b!115295 res!95253) b!115287))

(assert (= (and b!115287 res!95254) b!115296))

(declare-fun m!172539 () Bool)

(assert (=> b!115287 m!172539))

(declare-fun m!172541 () Bool)

(assert (=> b!115287 m!172541))

(declare-fun m!172543 () Bool)

(assert (=> b!115287 m!172543))

(declare-fun m!172545 () Bool)

(assert (=> b!115287 m!172545))

(declare-fun m!172547 () Bool)

(assert (=> b!115287 m!172547))

(declare-fun m!172549 () Bool)

(assert (=> b!115290 m!172549))

(declare-fun m!172551 () Bool)

(assert (=> bm!1496 m!172551))

(declare-fun m!172553 () Bool)

(assert (=> b!115285 m!172553))

(declare-fun m!172555 () Bool)

(assert (=> b!115285 m!172555))

(declare-fun m!172557 () Bool)

(assert (=> b!115291 m!172557))

(assert (=> b!115291 m!172557))

(declare-fun m!172559 () Bool)

(assert (=> b!115291 m!172559))

(assert (=> b!115288 m!172555))

(assert (=> b!115288 m!172019))

(declare-fun m!172561 () Bool)

(assert (=> b!115286 m!172561))

(declare-fun m!172563 () Bool)

(assert (=> b!115293 m!172563))

(assert (=> b!115293 m!172019))

(declare-fun m!172565 () Bool)

(assert (=> b!115289 m!172565))

(declare-fun m!172567 () Bool)

(assert (=> b!115289 m!172567))

(declare-fun m!172569 () Bool)

(assert (=> b!115289 m!172569))

(declare-fun m!172571 () Bool)

(assert (=> b!115289 m!172571))

(declare-fun m!172573 () Bool)

(assert (=> b!115289 m!172573))

(declare-fun m!172575 () Bool)

(assert (=> b!115289 m!172575))

(declare-fun m!172577 () Bool)

(assert (=> b!115289 m!172577))

(assert (=> b!115289 m!172019))

(declare-fun m!172579 () Bool)

(assert (=> b!115289 m!172579))

(declare-fun m!172581 () Bool)

(assert (=> b!115289 m!172581))

(declare-fun m!172583 () Bool)

(assert (=> b!115289 m!172583))

(declare-fun m!172585 () Bool)

(assert (=> b!115289 m!172585))

(declare-fun m!172587 () Bool)

(assert (=> b!115289 m!172587))

(declare-fun m!172589 () Bool)

(assert (=> b!115289 m!172589))

(declare-fun m!172591 () Bool)

(assert (=> b!115289 m!172591))

(declare-fun m!172593 () Bool)

(assert (=> b!115289 m!172593))

(declare-fun m!172595 () Bool)

(assert (=> b!115289 m!172595))

(assert (=> b!115289 m!172541))

(declare-fun m!172597 () Bool)

(assert (=> b!115289 m!172597))

(declare-fun m!172599 () Bool)

(assert (=> b!115289 m!172599))

(declare-fun m!172601 () Bool)

(assert (=> b!115289 m!172601))

(declare-fun m!172603 () Bool)

(assert (=> b!115289 m!172603))

(declare-fun m!172605 () Bool)

(assert (=> b!115289 m!172605))

(declare-fun m!172607 () Bool)

(assert (=> b!115289 m!172607))

(declare-fun m!172609 () Bool)

(assert (=> b!115289 m!172609))

(declare-fun m!172611 () Bool)

(assert (=> b!115289 m!172611))

(declare-fun m!172613 () Bool)

(assert (=> b!115289 m!172613))

(declare-fun m!172615 () Bool)

(assert (=> b!115289 m!172615))

(assert (=> b!115289 m!172613))

(declare-fun m!172617 () Bool)

(assert (=> b!115295 m!172617))

(declare-fun m!172619 () Bool)

(assert (=> b!115296 m!172619))

(assert (=> b!114998 d!37118))

(declare-fun b!115308 () Bool)

(declare-fun e!75573 () Bool)

(declare-fun e!75572 () Bool)

(assert (=> b!115308 (= e!75573 e!75572)))

(declare-fun res!95267 () Bool)

(assert (=> b!115308 (=> (not res!95267) (not e!75572))))

(declare-fun lt!176054 () tuple2!9474)

(declare-fun lt!176056 () tuple2!9476)

(assert (=> b!115308 (= res!95267 (and (= (_2!5002 lt!176054) lt!175210) (= (_1!5002 lt!176054) (_2!5003 lt!176056))))))

(assert (=> b!115308 (= lt!176054 (readBitPure!0 (readerFrom!0 (_2!5003 lt!176056) (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305))))))

(declare-fun b!115306 () Bool)

(declare-fun res!95269 () Bool)

(assert (=> b!115306 (=> (not res!95269) (not e!75573))))

(declare-fun lt!176055 () (_ BitVec 64))

(declare-fun lt!176053 () (_ BitVec 64))

(assert (=> b!115306 (= res!95269 (= (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!176056))) (currentByte!5387 (_2!5003 lt!176056)) (currentBit!5382 (_2!5003 lt!176056))) (bvadd lt!176053 lt!176055)))))

(assert (=> b!115306 (or (not (= (bvand lt!176053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176055 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!176053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!176053 lt!176055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115306 (= lt!176055 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!115306 (= lt!176053 (bitIndex!0 (size!2358 (buf!2768 thiss!1305)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305)))))

(declare-fun b!115307 () Bool)

(declare-fun res!95270 () Bool)

(assert (=> b!115307 (=> (not res!95270) (not e!75573))))

(assert (=> b!115307 (= res!95270 (isPrefixOf!0 thiss!1305 (_2!5003 lt!176056)))))

(declare-fun d!37170 () Bool)

(assert (=> d!37170 e!75573))

(declare-fun res!95268 () Bool)

(assert (=> d!37170 (=> (not res!95268) (not e!75573))))

(assert (=> d!37170 (= res!95268 (= (size!2358 (buf!2768 thiss!1305)) (size!2358 (buf!2768 (_2!5003 lt!176056)))))))

(declare-fun choose!16 (BitStream!4190 Bool) tuple2!9476)

(assert (=> d!37170 (= lt!176056 (choose!16 thiss!1305 lt!175210))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37170 (validate_offset_bit!0 ((_ sign_extend 32) (size!2358 (buf!2768 thiss!1305))) ((_ sign_extend 32) (currentByte!5387 thiss!1305)) ((_ sign_extend 32) (currentBit!5382 thiss!1305)))))

(assert (=> d!37170 (= (appendBit!0 thiss!1305 lt!175210) lt!176056)))

(declare-fun b!115309 () Bool)

(assert (=> b!115309 (= e!75572 (= (bitIndex!0 (size!2358 (buf!2768 (_1!5002 lt!176054))) (currentByte!5387 (_1!5002 lt!176054)) (currentBit!5382 (_1!5002 lt!176054))) (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!176056))) (currentByte!5387 (_2!5003 lt!176056)) (currentBit!5382 (_2!5003 lt!176056)))))))

(assert (= (and d!37170 res!95268) b!115306))

(assert (= (and b!115306 res!95269) b!115307))

(assert (= (and b!115307 res!95270) b!115308))

(assert (= (and b!115308 res!95267) b!115309))

(declare-fun m!172621 () Bool)

(assert (=> d!37170 m!172621))

(declare-fun m!172623 () Bool)

(assert (=> d!37170 m!172623))

(declare-fun m!172625 () Bool)

(assert (=> b!115306 m!172625))

(assert (=> b!115306 m!172021))

(declare-fun m!172627 () Bool)

(assert (=> b!115307 m!172627))

(declare-fun m!172629 () Bool)

(assert (=> b!115309 m!172629))

(assert (=> b!115309 m!172625))

(declare-fun m!172631 () Bool)

(assert (=> b!115308 m!172631))

(assert (=> b!115308 m!172631))

(declare-fun m!172633 () Bool)

(assert (=> b!115308 m!172633))

(assert (=> b!114998 d!37170))

(declare-fun d!37172 () Bool)

(declare-fun e!75574 () Bool)

(assert (=> d!37172 e!75574))

(declare-fun res!95271 () Bool)

(assert (=> d!37172 (=> (not res!95271) (not e!75574))))

(declare-fun lt!176075 () tuple2!9472)

(assert (=> d!37172 (= res!95271 (isPrefixOf!0 (_1!5001 lt!176075) (_2!5001 lt!176075)))))

(declare-fun lt!176057 () BitStream!4190)

(assert (=> d!37172 (= lt!176075 (tuple2!9473 lt!176057 (_2!5003 lt!175213)))))

(declare-fun lt!176067 () Unit!7073)

(declare-fun lt!176070 () Unit!7073)

(assert (=> d!37172 (= lt!176067 lt!176070)))

(assert (=> d!37172 (isPrefixOf!0 lt!176057 (_2!5003 lt!175213))))

(assert (=> d!37172 (= lt!176070 (lemmaIsPrefixTransitive!0 lt!176057 (_2!5003 lt!175213) (_2!5003 lt!175213)))))

(declare-fun lt!176063 () Unit!7073)

(declare-fun lt!176060 () Unit!7073)

(assert (=> d!37172 (= lt!176063 lt!176060)))

(assert (=> d!37172 (isPrefixOf!0 lt!176057 (_2!5003 lt!175213))))

(assert (=> d!37172 (= lt!176060 (lemmaIsPrefixTransitive!0 lt!176057 thiss!1305 (_2!5003 lt!175213)))))

(declare-fun lt!176068 () Unit!7073)

(declare-fun e!75575 () Unit!7073)

(assert (=> d!37172 (= lt!176068 e!75575)))

(declare-fun c!7000 () Bool)

(assert (=> d!37172 (= c!7000 (not (= (size!2358 (buf!2768 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!176074 () Unit!7073)

(declare-fun lt!176062 () Unit!7073)

(assert (=> d!37172 (= lt!176074 lt!176062)))

(assert (=> d!37172 (isPrefixOf!0 (_2!5003 lt!175213) (_2!5003 lt!175213))))

(assert (=> d!37172 (= lt!176062 (lemmaIsPrefixRefl!0 (_2!5003 lt!175213)))))

(declare-fun lt!176065 () Unit!7073)

(declare-fun lt!176071 () Unit!7073)

(assert (=> d!37172 (= lt!176065 lt!176071)))

(assert (=> d!37172 (= lt!176071 (lemmaIsPrefixRefl!0 (_2!5003 lt!175213)))))

(declare-fun lt!176059 () Unit!7073)

(declare-fun lt!176069 () Unit!7073)

(assert (=> d!37172 (= lt!176059 lt!176069)))

(assert (=> d!37172 (isPrefixOf!0 lt!176057 lt!176057)))

(assert (=> d!37172 (= lt!176069 (lemmaIsPrefixRefl!0 lt!176057))))

(declare-fun lt!176066 () Unit!7073)

(declare-fun lt!176064 () Unit!7073)

(assert (=> d!37172 (= lt!176066 lt!176064)))

(assert (=> d!37172 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37172 (= lt!176064 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37172 (= lt!176057 (BitStream!4191 (buf!2768 (_2!5003 lt!175213)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305)))))

(assert (=> d!37172 (isPrefixOf!0 thiss!1305 (_2!5003 lt!175213))))

(assert (=> d!37172 (= (reader!0 thiss!1305 (_2!5003 lt!175213)) lt!176075)))

(declare-fun b!115310 () Bool)

(declare-fun lt!176058 () Unit!7073)

(assert (=> b!115310 (= e!75575 lt!176058)))

(declare-fun lt!176061 () (_ BitVec 64))

(assert (=> b!115310 (= lt!176061 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!176076 () (_ BitVec 64))

(assert (=> b!115310 (= lt!176076 (bitIndex!0 (size!2358 (buf!2768 thiss!1305)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305)))))

(assert (=> b!115310 (= lt!176058 (arrayBitRangesEqSymmetric!0 (buf!2768 thiss!1305) (buf!2768 (_2!5003 lt!175213)) lt!176061 lt!176076))))

(assert (=> b!115310 (arrayBitRangesEq!0 (buf!2768 (_2!5003 lt!175213)) (buf!2768 thiss!1305) lt!176061 lt!176076)))

(declare-fun lt!176072 () (_ BitVec 64))

(declare-fun b!115311 () Bool)

(declare-fun lt!176073 () (_ BitVec 64))

(assert (=> b!115311 (= e!75574 (= (_1!5001 lt!176075) (withMovedBitIndex!0 (_2!5001 lt!176075) (bvsub lt!176072 lt!176073))))))

(assert (=> b!115311 (or (= (bvand lt!176072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176072 lt!176073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115311 (= lt!176073 (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175213))) (currentByte!5387 (_2!5003 lt!175213)) (currentBit!5382 (_2!5003 lt!175213))))))

(assert (=> b!115311 (= lt!176072 (bitIndex!0 (size!2358 (buf!2768 thiss!1305)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305)))))

(declare-fun b!115312 () Bool)

(declare-fun res!95273 () Bool)

(assert (=> b!115312 (=> (not res!95273) (not e!75574))))

(assert (=> b!115312 (= res!95273 (isPrefixOf!0 (_1!5001 lt!176075) thiss!1305))))

(declare-fun b!115313 () Bool)

(declare-fun res!95272 () Bool)

(assert (=> b!115313 (=> (not res!95272) (not e!75574))))

(assert (=> b!115313 (= res!95272 (isPrefixOf!0 (_2!5001 lt!176075) (_2!5003 lt!175213)))))

(declare-fun b!115314 () Bool)

(declare-fun Unit!7098 () Unit!7073)

(assert (=> b!115314 (= e!75575 Unit!7098)))

(assert (= (and d!37172 c!7000) b!115310))

(assert (= (and d!37172 (not c!7000)) b!115314))

(assert (= (and d!37172 res!95271) b!115312))

(assert (= (and b!115312 res!95273) b!115313))

(assert (= (and b!115313 res!95272) b!115311))

(declare-fun m!172635 () Bool)

(assert (=> b!115312 m!172635))

(declare-fun m!172637 () Bool)

(assert (=> b!115313 m!172637))

(assert (=> b!115310 m!172021))

(declare-fun m!172639 () Bool)

(assert (=> b!115310 m!172639))

(declare-fun m!172641 () Bool)

(assert (=> b!115310 m!172641))

(declare-fun m!172643 () Bool)

(assert (=> d!37172 m!172643))

(declare-fun m!172645 () Bool)

(assert (=> d!37172 m!172645))

(declare-fun m!172647 () Bool)

(assert (=> d!37172 m!172647))

(declare-fun m!172649 () Bool)

(assert (=> d!37172 m!172649))

(declare-fun m!172651 () Bool)

(assert (=> d!37172 m!172651))

(assert (=> d!37172 m!172161))

(declare-fun m!172653 () Bool)

(assert (=> d!37172 m!172653))

(declare-fun m!172655 () Bool)

(assert (=> d!37172 m!172655))

(declare-fun m!172657 () Bool)

(assert (=> d!37172 m!172657))

(assert (=> d!37172 m!172169))

(assert (=> d!37172 m!172043))

(declare-fun m!172659 () Bool)

(assert (=> b!115311 m!172659))

(assert (=> b!115311 m!172175))

(assert (=> b!115311 m!172021))

(assert (=> b!114998 d!37172))

(declare-fun d!37174 () Bool)

(assert (=> d!37174 (= (invariant!0 (currentBit!5382 thiss!1305) (currentByte!5387 thiss!1305) (size!2358 (buf!2768 (_2!5003 lt!175213)))) (and (bvsge (currentBit!5382 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5382 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5387 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5387 thiss!1305) (size!2358 (buf!2768 (_2!5003 lt!175213)))) (and (= (currentBit!5382 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5387 thiss!1305) (size!2358 (buf!2768 (_2!5003 lt!175213))))))))))

(assert (=> b!115009 d!37174))

(declare-fun d!37176 () Bool)

(declare-fun res!95274 () Bool)

(declare-fun e!75577 () Bool)

(assert (=> d!37176 (=> (not res!95274) (not e!75577))))

(assert (=> d!37176 (= res!95274 (= (size!2358 (buf!2768 thiss!1305)) (size!2358 (buf!2768 (_2!5003 lt!175206)))))))

(assert (=> d!37176 (= (isPrefixOf!0 thiss!1305 (_2!5003 lt!175206)) e!75577)))

(declare-fun b!115315 () Bool)

(declare-fun res!95276 () Bool)

(assert (=> b!115315 (=> (not res!95276) (not e!75577))))

(assert (=> b!115315 (= res!95276 (bvsle (bitIndex!0 (size!2358 (buf!2768 thiss!1305)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305)) (bitIndex!0 (size!2358 (buf!2768 (_2!5003 lt!175206))) (currentByte!5387 (_2!5003 lt!175206)) (currentBit!5382 (_2!5003 lt!175206)))))))

(declare-fun b!115316 () Bool)

(declare-fun e!75576 () Bool)

(assert (=> b!115316 (= e!75577 e!75576)))

(declare-fun res!95275 () Bool)

(assert (=> b!115316 (=> res!95275 e!75576)))

(assert (=> b!115316 (= res!95275 (= (size!2358 (buf!2768 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115317 () Bool)

(assert (=> b!115317 (= e!75576 (arrayBitRangesEq!0 (buf!2768 thiss!1305) (buf!2768 (_2!5003 lt!175206)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2358 (buf!2768 thiss!1305)) (currentByte!5387 thiss!1305) (currentBit!5382 thiss!1305))))))

(assert (= (and d!37176 res!95274) b!115315))

(assert (= (and b!115315 res!95276) b!115316))

(assert (= (and b!115316 (not res!95275)) b!115317))

(assert (=> b!115315 m!172021))

(assert (=> b!115315 m!172019))

(assert (=> b!115317 m!172021))

(assert (=> b!115317 m!172021))

(declare-fun m!172661 () Bool)

(assert (=> b!115317 m!172661))

(assert (=> b!114999 d!37176))

(declare-fun d!37178 () Bool)

(assert (=> d!37178 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2358 (buf!2768 thiss!1305))) ((_ sign_extend 32) (currentByte!5387 thiss!1305)) ((_ sign_extend 32) (currentBit!5382 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2358 (buf!2768 thiss!1305))) ((_ sign_extend 32) (currentByte!5387 thiss!1305)) ((_ sign_extend 32) (currentBit!5382 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8992 () Bool)

(assert (= bs!8992 d!37178))

(declare-fun m!172663 () Bool)

(assert (=> bs!8992 m!172663))

(assert (=> b!115005 d!37178))

(declare-fun d!37180 () Bool)

(declare-fun e!75578 () Bool)

(assert (=> d!37180 e!75578))

(declare-fun res!95278 () Bool)

(assert (=> d!37180 (=> (not res!95278) (not e!75578))))

(declare-fun lt!176081 () (_ BitVec 64))

(declare-fun lt!176078 () (_ BitVec 64))

(declare-fun lt!176079 () (_ BitVec 64))

(assert (=> d!37180 (= res!95278 (= lt!176078 (bvsub lt!176079 lt!176081)))))

(assert (=> d!37180 (or (= (bvand lt!176079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176081 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176079 lt!176081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37180 (= lt!176081 (remainingBits!0 ((_ sign_extend 32) (size!2358 (buf!2768 (_2!5003 lt!175206)))) ((_ sign_extend 32) (currentByte!5387 (_2!5003 lt!175206))) ((_ sign_extend 32) (currentBit!5382 (_2!5003 lt!175206)))))))

(declare-fun lt!176077 () (_ BitVec 64))

(declare-fun lt!176080 () (_ BitVec 64))

(assert (=> d!37180 (= lt!176079 (bvmul lt!176077 lt!176080))))

(assert (=> d!37180 (or (= lt!176077 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176080 (bvsdiv (bvmul lt!176077 lt!176080) lt!176077)))))

(assert (=> d!37180 (= lt!176080 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37180 (= lt!176077 ((_ sign_extend 32) (size!2358 (buf!2768 (_2!5003 lt!175206)))))))

