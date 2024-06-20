; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41920 () Bool)

(assert start!41920)

(declare-fun b!197443 () Bool)

(declare-fun e!135608 () Bool)

(declare-fun e!135598 () Bool)

(assert (=> b!197443 (= e!135608 e!135598)))

(declare-fun res!165272 () Bool)

(assert (=> b!197443 (=> (not res!165272) (not e!135598))))

(declare-fun lt!307300 () Bool)

(declare-datatypes ((array!10105 0))(
  ( (array!10106 (arr!5384 (Array (_ BitVec 32) (_ BitVec 8))) (size!4454 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8016 0))(
  ( (BitStream!8017 (buf!4940 array!10105) (currentByte!9278 (_ BitVec 32)) (currentBit!9273 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13973 0))(
  ( (Unit!13974) )
))
(declare-datatypes ((tuple2!17080 0))(
  ( (tuple2!17081 (_1!9185 Unit!13973) (_2!9185 BitStream!8016)) )
))
(declare-fun lt!307286 () tuple2!17080)

(declare-datatypes ((tuple2!17082 0))(
  ( (tuple2!17083 (_1!9186 BitStream!8016) (_2!9186 Bool)) )
))
(declare-fun lt!307303 () tuple2!17082)

(assert (=> b!197443 (= res!165272 (and (= (_2!9186 lt!307303) lt!307300) (= (_1!9186 lt!307303) (_2!9185 lt!307286))))))

(declare-fun thiss!1204 () BitStream!8016)

(declare-fun readBitPure!0 (BitStream!8016) tuple2!17082)

(declare-fun readerFrom!0 (BitStream!8016 (_ BitVec 32) (_ BitVec 32)) BitStream!8016)

(assert (=> b!197443 (= lt!307303 (readBitPure!0 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!307302 () tuple2!17082)

(declare-fun b!197444 () Bool)

(declare-fun e!135606 () Bool)

(declare-fun lt!307297 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!307309 () (_ BitVec 64))

(declare-datatypes ((tuple2!17084 0))(
  ( (tuple2!17085 (_1!9187 BitStream!8016) (_2!9187 BitStream!8016)) )
))
(declare-fun lt!307307 () tuple2!17084)

(declare-datatypes ((tuple2!17086 0))(
  ( (tuple2!17087 (_1!9188 BitStream!8016) (_2!9188 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17086)

(assert (=> b!197444 (= e!135606 (= (_1!9188 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!307307) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307309 (ite (_2!9186 lt!307302) lt!307297 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9187 lt!307307)))))

(declare-fun lt!307308 () tuple2!17080)

(declare-fun lt!307288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197444 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!307288)))

(declare-fun lt!307291 () Unit!13973)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8016 array!10105 (_ BitVec 64)) Unit!13973)

(assert (=> b!197444 (= lt!307291 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!307308)) lt!307288))))

(assert (=> b!197444 (= lt!307288 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!307305 () tuple2!17086)

(declare-fun lt!307301 () tuple2!17084)

(assert (=> b!197444 (= lt!307305 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!307301) nBits!348 i!590 lt!307309))))

(declare-fun lt!307306 () (_ BitVec 64))

(assert (=> b!197444 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204)) lt!307306)))

(declare-fun lt!307292 () Unit!13973)

(assert (=> b!197444 (= lt!307292 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4940 (_2!9185 lt!307308)) lt!307306))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197444 (= lt!307309 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!197444 (= (_2!9186 lt!307302) lt!307300)))

(assert (=> b!197444 (= lt!307302 (readBitPure!0 (_1!9187 lt!307301)))))

(declare-fun reader!0 (BitStream!8016 BitStream!8016) tuple2!17084)

(assert (=> b!197444 (= lt!307307 (reader!0 (_2!9185 lt!307286) (_2!9185 lt!307308)))))

(assert (=> b!197444 (= lt!307301 (reader!0 thiss!1204 (_2!9185 lt!307308)))))

(declare-fun e!135601 () Bool)

(assert (=> b!197444 e!135601))

(declare-fun res!165261 () Bool)

(assert (=> b!197444 (=> (not res!165261) (not e!135601))))

(declare-fun lt!307290 () tuple2!17082)

(declare-fun lt!307287 () tuple2!17082)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197444 (= res!165261 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307290))) (currentByte!9278 (_1!9186 lt!307290)) (currentBit!9273 (_1!9186 lt!307290))) (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307287))) (currentByte!9278 (_1!9186 lt!307287)) (currentBit!9273 (_1!9186 lt!307287)))))))

(declare-fun lt!307294 () Unit!13973)

(declare-fun lt!307296 () BitStream!8016)

(declare-fun readBitPrefixLemma!0 (BitStream!8016 BitStream!8016) Unit!13973)

(assert (=> b!197444 (= lt!307294 (readBitPrefixLemma!0 lt!307296 (_2!9185 lt!307308)))))

(assert (=> b!197444 (= lt!307287 (readBitPure!0 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(assert (=> b!197444 (= lt!307290 (readBitPure!0 lt!307296))))

(declare-fun e!135599 () Bool)

(assert (=> b!197444 e!135599))

(declare-fun res!165270 () Bool)

(assert (=> b!197444 (=> (not res!165270) (not e!135599))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!197444 (= res!165270 (invariant!0 (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204) (size!4454 (buf!4940 (_2!9185 lt!307286)))))))

(assert (=> b!197444 (= lt!307296 (BitStream!8017 (buf!4940 (_2!9185 lt!307286)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))

(declare-fun b!197445 () Bool)

(declare-fun e!135603 () Bool)

(declare-fun array_inv!4195 (array!10105) Bool)

(assert (=> b!197445 (= e!135603 (array_inv!4195 (buf!4940 thiss!1204)))))

(declare-fun b!197446 () Bool)

(assert (=> b!197446 (= e!135599 (invariant!0 (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204) (size!4454 (buf!4940 (_2!9185 lt!307308)))))))

(declare-fun b!197447 () Bool)

(declare-fun e!135604 () Bool)

(declare-fun e!135600 () Bool)

(assert (=> b!197447 (= e!135604 (not e!135600))))

(declare-fun res!165259 () Bool)

(assert (=> b!197447 (=> res!165259 e!135600)))

(declare-fun lt!307299 () (_ BitVec 64))

(declare-fun lt!307298 () (_ BitVec 64))

(assert (=> b!197447 (= res!165259 (not (= lt!307299 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307298))))))

(assert (=> b!197447 (= lt!307299 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(assert (=> b!197447 (= lt!307298 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))

(declare-fun e!135607 () Bool)

(assert (=> b!197447 e!135607))

(declare-fun res!165260 () Bool)

(assert (=> b!197447 (=> (not res!165260) (not e!135607))))

(assert (=> b!197447 (= res!165260 (= (size!4454 (buf!4940 thiss!1204)) (size!4454 (buf!4940 (_2!9185 lt!307286)))))))

(declare-fun appendBit!0 (BitStream!8016 Bool) tuple2!17080)

(assert (=> b!197447 (= lt!307286 (appendBit!0 thiss!1204 lt!307300))))

(assert (=> b!197447 (= lt!307300 (not (= (bvand v!189 lt!307297) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197447 (= lt!307297 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!197448 () Bool)

(declare-fun res!165266 () Bool)

(assert (=> b!197448 (=> res!165266 e!135606)))

(declare-fun isPrefixOf!0 (BitStream!8016 BitStream!8016) Bool)

(assert (=> b!197448 (= res!165266 (not (isPrefixOf!0 thiss!1204 (_2!9185 lt!307286))))))

(declare-fun b!197449 () Bool)

(assert (=> b!197449 (= e!135601 (= (_2!9186 lt!307290) (_2!9186 lt!307287)))))

(declare-fun res!165269 () Bool)

(declare-fun e!135602 () Bool)

(assert (=> start!41920 (=> (not res!165269) (not e!135602))))

(assert (=> start!41920 (= res!165269 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41920 e!135602))

(assert (=> start!41920 true))

(declare-fun inv!12 (BitStream!8016) Bool)

(assert (=> start!41920 (and (inv!12 thiss!1204) e!135603)))

(declare-fun b!197450 () Bool)

(assert (=> b!197450 (= e!135607 e!135608)))

(declare-fun res!165268 () Bool)

(assert (=> b!197450 (=> (not res!165268) (not e!135608))))

(declare-fun lt!307295 () (_ BitVec 64))

(declare-fun lt!307293 () (_ BitVec 64))

(assert (=> b!197450 (= res!165268 (= lt!307295 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307293)))))

(assert (=> b!197450 (= lt!307295 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(assert (=> b!197450 (= lt!307293 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))

(declare-fun b!197451 () Bool)

(declare-fun res!165262 () Bool)

(assert (=> b!197451 (=> (not res!165262) (not e!135604))))

(assert (=> b!197451 (= res!165262 (not (= i!590 nBits!348)))))

(declare-fun b!197452 () Bool)

(declare-fun res!165273 () Bool)

(assert (=> b!197452 (=> res!165273 e!135606)))

(assert (=> b!197452 (= res!165273 (not (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!307308))))))

(declare-fun b!197453 () Bool)

(declare-fun res!165258 () Bool)

(assert (=> b!197453 (=> (not res!165258) (not e!135604))))

(assert (=> b!197453 (= res!165258 (invariant!0 (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204) (size!4454 (buf!4940 thiss!1204))))))

(declare-fun b!197454 () Bool)

(declare-fun res!165267 () Bool)

(assert (=> b!197454 (=> (not res!165267) (not e!135608))))

(assert (=> b!197454 (= res!165267 (isPrefixOf!0 thiss!1204 (_2!9185 lt!307286)))))

(declare-fun b!197455 () Bool)

(assert (=> b!197455 (= e!135600 e!135606)))

(declare-fun res!165264 () Bool)

(assert (=> b!197455 (=> res!165264 e!135606)))

(declare-fun lt!307304 () (_ BitVec 64))

(assert (=> b!197455 (= res!165264 (not (= lt!307304 (bvsub (bvsub (bvadd lt!307299 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!197455 (= lt!307304 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308))))))

(assert (=> b!197455 (isPrefixOf!0 thiss!1204 (_2!9185 lt!307308))))

(declare-fun lt!307289 () Unit!13973)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8016 BitStream!8016 BitStream!8016) Unit!13973)

(assert (=> b!197455 (= lt!307289 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9185 lt!307286) (_2!9185 lt!307308)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8016 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17080)

(assert (=> b!197455 (= lt!307308 (appendBitsLSBFirstLoopTR!0 (_2!9185 lt!307286) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!197456 () Bool)

(assert (=> b!197456 (= e!135602 e!135604)))

(declare-fun res!165265 () Bool)

(assert (=> b!197456 (=> (not res!165265) (not e!135604))))

(assert (=> b!197456 (= res!165265 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204)) lt!307306))))

(assert (=> b!197456 (= lt!307306 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!197457 () Bool)

(declare-fun res!165263 () Bool)

(assert (=> b!197457 (=> res!165263 e!135606)))

(assert (=> b!197457 (= res!165263 (not (invariant!0 (currentBit!9273 (_2!9185 lt!307308)) (currentByte!9278 (_2!9185 lt!307308)) (size!4454 (buf!4940 (_2!9185 lt!307308))))))))

(declare-fun b!197458 () Bool)

(assert (=> b!197458 (= e!135598 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307303))) (currentByte!9278 (_1!9186 lt!307303)) (currentBit!9273 (_1!9186 lt!307303))) lt!307295))))

(declare-fun b!197459 () Bool)

(declare-fun res!165271 () Bool)

(assert (=> b!197459 (=> res!165271 e!135606)))

(assert (=> b!197459 (= res!165271 (or (not (= (size!4454 (buf!4940 (_2!9185 lt!307308))) (size!4454 (buf!4940 thiss!1204)))) (not (= lt!307304 (bvsub (bvadd lt!307298 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(assert (= (and start!41920 res!165269) b!197456))

(assert (= (and b!197456 res!165265) b!197453))

(assert (= (and b!197453 res!165258) b!197451))

(assert (= (and b!197451 res!165262) b!197447))

(assert (= (and b!197447 res!165260) b!197450))

(assert (= (and b!197450 res!165268) b!197454))

(assert (= (and b!197454 res!165267) b!197443))

(assert (= (and b!197443 res!165272) b!197458))

(assert (= (and b!197447 (not res!165259)) b!197455))

(assert (= (and b!197455 (not res!165264)) b!197457))

(assert (= (and b!197457 (not res!165263)) b!197459))

(assert (= (and b!197459 (not res!165271)) b!197452))

(assert (= (and b!197452 (not res!165273)) b!197448))

(assert (= (and b!197448 (not res!165266)) b!197444))

(assert (= (and b!197444 res!165270) b!197446))

(assert (= (and b!197444 res!165261) b!197449))

(assert (= start!41920 b!197445))

(declare-fun m!305047 () Bool)

(assert (=> b!197450 m!305047))

(declare-fun m!305049 () Bool)

(assert (=> b!197450 m!305049))

(declare-fun m!305051 () Bool)

(assert (=> b!197455 m!305051))

(declare-fun m!305053 () Bool)

(assert (=> b!197455 m!305053))

(declare-fun m!305055 () Bool)

(assert (=> b!197455 m!305055))

(declare-fun m!305057 () Bool)

(assert (=> b!197455 m!305057))

(declare-fun m!305059 () Bool)

(assert (=> b!197454 m!305059))

(declare-fun m!305061 () Bool)

(assert (=> b!197453 m!305061))

(assert (=> b!197447 m!305047))

(assert (=> b!197447 m!305049))

(declare-fun m!305063 () Bool)

(assert (=> b!197447 m!305063))

(declare-fun m!305065 () Bool)

(assert (=> b!197456 m!305065))

(declare-fun m!305067 () Bool)

(assert (=> b!197458 m!305067))

(declare-fun m!305069 () Bool)

(assert (=> start!41920 m!305069))

(declare-fun m!305071 () Bool)

(assert (=> b!197457 m!305071))

(declare-fun m!305073 () Bool)

(assert (=> b!197446 m!305073))

(declare-fun m!305075 () Bool)

(assert (=> b!197443 m!305075))

(assert (=> b!197443 m!305075))

(declare-fun m!305077 () Bool)

(assert (=> b!197443 m!305077))

(declare-fun m!305079 () Bool)

(assert (=> b!197452 m!305079))

(declare-fun m!305081 () Bool)

(assert (=> b!197445 m!305081))

(declare-fun m!305083 () Bool)

(assert (=> b!197444 m!305083))

(declare-fun m!305085 () Bool)

(assert (=> b!197444 m!305085))

(declare-fun m!305087 () Bool)

(assert (=> b!197444 m!305087))

(declare-fun m!305089 () Bool)

(assert (=> b!197444 m!305089))

(declare-fun m!305091 () Bool)

(assert (=> b!197444 m!305091))

(declare-fun m!305093 () Bool)

(assert (=> b!197444 m!305093))

(declare-fun m!305095 () Bool)

(assert (=> b!197444 m!305095))

(declare-fun m!305097 () Bool)

(assert (=> b!197444 m!305097))

(declare-fun m!305099 () Bool)

(assert (=> b!197444 m!305099))

(declare-fun m!305101 () Bool)

(assert (=> b!197444 m!305101))

(declare-fun m!305103 () Bool)

(assert (=> b!197444 m!305103))

(declare-fun m!305105 () Bool)

(assert (=> b!197444 m!305105))

(declare-fun m!305107 () Bool)

(assert (=> b!197444 m!305107))

(declare-fun m!305109 () Bool)

(assert (=> b!197444 m!305109))

(declare-fun m!305111 () Bool)

(assert (=> b!197444 m!305111))

(declare-fun m!305113 () Bool)

(assert (=> b!197444 m!305113))

(assert (=> b!197448 m!305059))

(check-sat (not b!197454) (not b!197447) (not b!197458) (not b!197446) (not b!197453) (not b!197452) (not b!197445) (not b!197457) (not b!197444) (not b!197455) (not b!197450) (not b!197456) (not start!41920) (not b!197443) (not b!197448))
(check-sat)
(get-model)

(declare-fun d!66693 () Bool)

(declare-fun res!165404 () Bool)

(declare-fun e!135689 () Bool)

(assert (=> d!66693 (=> (not res!165404) (not e!135689))))

(assert (=> d!66693 (= res!165404 (= (size!4454 (buf!4940 thiss!1204)) (size!4454 (buf!4940 (_2!9185 lt!307286)))))))

(assert (=> d!66693 (= (isPrefixOf!0 thiss!1204 (_2!9185 lt!307286)) e!135689)))

(declare-fun b!197592 () Bool)

(declare-fun res!165403 () Bool)

(assert (=> b!197592 (=> (not res!165403) (not e!135689))))

(assert (=> b!197592 (= res!165403 (bvsle (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(declare-fun b!197593 () Bool)

(declare-fun e!135688 () Bool)

(assert (=> b!197593 (= e!135689 e!135688)))

(declare-fun res!165402 () Bool)

(assert (=> b!197593 (=> res!165402 e!135688)))

(assert (=> b!197593 (= res!165402 (= (size!4454 (buf!4940 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197594 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10105 array!10105 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197594 (= e!135688 (arrayBitRangesEq!0 (buf!4940 thiss!1204) (buf!4940 (_2!9185 lt!307286)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(assert (= (and d!66693 res!165404) b!197592))

(assert (= (and b!197592 res!165403) b!197593))

(assert (= (and b!197593 (not res!165402)) b!197594))

(assert (=> b!197592 m!305049))

(assert (=> b!197592 m!305047))

(assert (=> b!197594 m!305049))

(assert (=> b!197594 m!305049))

(declare-fun m!305245 () Bool)

(assert (=> b!197594 m!305245))

(assert (=> b!197448 d!66693))

(declare-fun d!66695 () Bool)

(declare-fun e!135692 () Bool)

(assert (=> d!66695 e!135692))

(declare-fun res!165410 () Bool)

(assert (=> d!66695 (=> (not res!165410) (not e!135692))))

(declare-fun lt!307494 () (_ BitVec 64))

(declare-fun lt!307496 () (_ BitVec 64))

(declare-fun lt!307493 () (_ BitVec 64))

(assert (=> d!66695 (= res!165410 (= lt!307493 (bvsub lt!307496 lt!307494)))))

(assert (=> d!66695 (or (= (bvand lt!307496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307496 lt!307494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66695 (= lt!307494 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307303)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307303))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307303)))))))

(declare-fun lt!307495 () (_ BitVec 64))

(declare-fun lt!307498 () (_ BitVec 64))

(assert (=> d!66695 (= lt!307496 (bvmul lt!307495 lt!307498))))

(assert (=> d!66695 (or (= lt!307495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307498 (bvsdiv (bvmul lt!307495 lt!307498) lt!307495)))))

(assert (=> d!66695 (= lt!307498 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66695 (= lt!307495 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307303)))))))

(assert (=> d!66695 (= lt!307493 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307303))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307303)))))))

(assert (=> d!66695 (invariant!0 (currentBit!9273 (_1!9186 lt!307303)) (currentByte!9278 (_1!9186 lt!307303)) (size!4454 (buf!4940 (_1!9186 lt!307303))))))

(assert (=> d!66695 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307303))) (currentByte!9278 (_1!9186 lt!307303)) (currentBit!9273 (_1!9186 lt!307303))) lt!307493)))

(declare-fun b!197599 () Bool)

(declare-fun res!165409 () Bool)

(assert (=> b!197599 (=> (not res!165409) (not e!135692))))

(assert (=> b!197599 (= res!165409 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307493))))

(declare-fun b!197600 () Bool)

(declare-fun lt!307497 () (_ BitVec 64))

(assert (=> b!197600 (= e!135692 (bvsle lt!307493 (bvmul lt!307497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197600 (or (= lt!307497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307497)))))

(assert (=> b!197600 (= lt!307497 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307303)))))))

(assert (= (and d!66695 res!165410) b!197599))

(assert (= (and b!197599 res!165409) b!197600))

(declare-fun m!305247 () Bool)

(assert (=> d!66695 m!305247))

(declare-fun m!305249 () Bool)

(assert (=> d!66695 m!305249))

(assert (=> b!197458 d!66695))

(declare-fun d!66697 () Bool)

(declare-fun e!135693 () Bool)

(assert (=> d!66697 e!135693))

(declare-fun res!165412 () Bool)

(assert (=> d!66697 (=> (not res!165412) (not e!135693))))

(declare-fun lt!307500 () (_ BitVec 64))

(declare-fun lt!307502 () (_ BitVec 64))

(declare-fun lt!307499 () (_ BitVec 64))

(assert (=> d!66697 (= res!165412 (= lt!307499 (bvsub lt!307502 lt!307500)))))

(assert (=> d!66697 (or (= (bvand lt!307502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307502 lt!307500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66697 (= lt!307500 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307286)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286)))))))

(declare-fun lt!307501 () (_ BitVec 64))

(declare-fun lt!307504 () (_ BitVec 64))

(assert (=> d!66697 (= lt!307502 (bvmul lt!307501 lt!307504))))

(assert (=> d!66697 (or (= lt!307501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307504 (bvsdiv (bvmul lt!307501 lt!307504) lt!307501)))))

(assert (=> d!66697 (= lt!307504 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66697 (= lt!307501 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307286)))))))

(assert (=> d!66697 (= lt!307499 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (=> d!66697 (invariant!0 (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286)) (size!4454 (buf!4940 (_2!9185 lt!307286))))))

(assert (=> d!66697 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) lt!307499)))

(declare-fun b!197601 () Bool)

(declare-fun res!165411 () Bool)

(assert (=> b!197601 (=> (not res!165411) (not e!135693))))

(assert (=> b!197601 (= res!165411 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307499))))

(declare-fun b!197602 () Bool)

(declare-fun lt!307503 () (_ BitVec 64))

(assert (=> b!197602 (= e!135693 (bvsle lt!307499 (bvmul lt!307503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197602 (or (= lt!307503 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307503 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307503)))))

(assert (=> b!197602 (= lt!307503 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307286)))))))

(assert (= (and d!66697 res!165412) b!197601))

(assert (= (and b!197601 res!165411) b!197602))

(declare-fun m!305251 () Bool)

(assert (=> d!66697 m!305251))

(declare-fun m!305253 () Bool)

(assert (=> d!66697 m!305253))

(assert (=> b!197447 d!66697))

(declare-fun d!66699 () Bool)

(declare-fun e!135694 () Bool)

(assert (=> d!66699 e!135694))

(declare-fun res!165414 () Bool)

(assert (=> d!66699 (=> (not res!165414) (not e!135694))))

(declare-fun lt!307506 () (_ BitVec 64))

(declare-fun lt!307508 () (_ BitVec 64))

(declare-fun lt!307505 () (_ BitVec 64))

(assert (=> d!66699 (= res!165414 (= lt!307505 (bvsub lt!307508 lt!307506)))))

(assert (=> d!66699 (or (= (bvand lt!307508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307506 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307508 lt!307506) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66699 (= lt!307506 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204))))))

(declare-fun lt!307507 () (_ BitVec 64))

(declare-fun lt!307510 () (_ BitVec 64))

(assert (=> d!66699 (= lt!307508 (bvmul lt!307507 lt!307510))))

(assert (=> d!66699 (or (= lt!307507 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307510 (bvsdiv (bvmul lt!307507 lt!307510) lt!307507)))))

(assert (=> d!66699 (= lt!307510 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66699 (= lt!307507 ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))))))

(assert (=> d!66699 (= lt!307505 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 thiss!1204))))))

(assert (=> d!66699 (invariant!0 (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204) (size!4454 (buf!4940 thiss!1204)))))

(assert (=> d!66699 (= (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)) lt!307505)))

(declare-fun b!197603 () Bool)

(declare-fun res!165413 () Bool)

(assert (=> b!197603 (=> (not res!165413) (not e!135694))))

(assert (=> b!197603 (= res!165413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307505))))

(declare-fun b!197604 () Bool)

(declare-fun lt!307509 () (_ BitVec 64))

(assert (=> b!197604 (= e!135694 (bvsle lt!307505 (bvmul lt!307509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197604 (or (= lt!307509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307509)))))

(assert (=> b!197604 (= lt!307509 ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))))))

(assert (= (and d!66699 res!165414) b!197603))

(assert (= (and b!197603 res!165413) b!197604))

(declare-fun m!305255 () Bool)

(assert (=> d!66699 m!305255))

(assert (=> d!66699 m!305061))

(assert (=> b!197447 d!66699))

(declare-fun d!66701 () Bool)

(declare-fun e!135700 () Bool)

(assert (=> d!66701 e!135700))

(declare-fun res!165426 () Bool)

(assert (=> d!66701 (=> (not res!165426) (not e!135700))))

(declare-fun lt!307519 () tuple2!17080)

(assert (=> d!66701 (= res!165426 (= (size!4454 (buf!4940 thiss!1204)) (size!4454 (buf!4940 (_2!9185 lt!307519)))))))

(declare-fun choose!16 (BitStream!8016 Bool) tuple2!17080)

(assert (=> d!66701 (= lt!307519 (choose!16 thiss!1204 lt!307300))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66701 (validate_offset_bit!0 ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204)))))

(assert (=> d!66701 (= (appendBit!0 thiss!1204 lt!307300) lt!307519)))

(declare-fun b!197614 () Bool)

(declare-fun res!165424 () Bool)

(assert (=> b!197614 (=> (not res!165424) (not e!135700))))

(declare-fun lt!307520 () (_ BitVec 64))

(declare-fun lt!307521 () (_ BitVec 64))

(assert (=> b!197614 (= res!165424 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307519))) (currentByte!9278 (_2!9185 lt!307519)) (currentBit!9273 (_2!9185 lt!307519))) (bvadd lt!307520 lt!307521)))))

(assert (=> b!197614 (or (not (= (bvand lt!307520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307521 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!307520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!307520 lt!307521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197614 (= lt!307521 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!197614 (= lt!307520 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))

(declare-fun b!197617 () Bool)

(declare-fun e!135699 () Bool)

(declare-fun lt!307522 () tuple2!17082)

(assert (=> b!197617 (= e!135699 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307522))) (currentByte!9278 (_1!9186 lt!307522)) (currentBit!9273 (_1!9186 lt!307522))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307519))) (currentByte!9278 (_2!9185 lt!307519)) (currentBit!9273 (_2!9185 lt!307519)))))))

(declare-fun b!197616 () Bool)

(assert (=> b!197616 (= e!135700 e!135699)))

(declare-fun res!165423 () Bool)

(assert (=> b!197616 (=> (not res!165423) (not e!135699))))

(assert (=> b!197616 (= res!165423 (and (= (_2!9186 lt!307522) lt!307300) (= (_1!9186 lt!307522) (_2!9185 lt!307519))))))

(assert (=> b!197616 (= lt!307522 (readBitPure!0 (readerFrom!0 (_2!9185 lt!307519) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))))

(declare-fun b!197615 () Bool)

(declare-fun res!165425 () Bool)

(assert (=> b!197615 (=> (not res!165425) (not e!135700))))

(assert (=> b!197615 (= res!165425 (isPrefixOf!0 thiss!1204 (_2!9185 lt!307519)))))

(assert (= (and d!66701 res!165426) b!197614))

(assert (= (and b!197614 res!165424) b!197615))

(assert (= (and b!197615 res!165425) b!197616))

(assert (= (and b!197616 res!165423) b!197617))

(declare-fun m!305257 () Bool)

(assert (=> b!197615 m!305257))

(declare-fun m!305259 () Bool)

(assert (=> b!197617 m!305259))

(declare-fun m!305261 () Bool)

(assert (=> b!197617 m!305261))

(declare-fun m!305263 () Bool)

(assert (=> d!66701 m!305263))

(declare-fun m!305265 () Bool)

(assert (=> d!66701 m!305265))

(assert (=> b!197614 m!305261))

(assert (=> b!197614 m!305049))

(declare-fun m!305267 () Bool)

(assert (=> b!197616 m!305267))

(assert (=> b!197616 m!305267))

(declare-fun m!305269 () Bool)

(assert (=> b!197616 m!305269))

(assert (=> b!197447 d!66701))

(declare-fun d!66703 () Bool)

(assert (=> d!66703 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204) (size!4454 (buf!4940 thiss!1204))))))

(declare-fun bs!16552 () Bool)

(assert (= bs!16552 d!66703))

(assert (=> bs!16552 m!305061))

(assert (=> start!41920 d!66703))

(declare-fun d!66705 () Bool)

(assert (=> d!66705 (= (invariant!0 (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204) (size!4454 (buf!4940 (_2!9185 lt!307308)))) (and (bvsge (currentBit!9273 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9273 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9278 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 thiss!1204) (size!4454 (buf!4940 (_2!9185 lt!307308)))) (and (= (currentBit!9273 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9278 thiss!1204) (size!4454 (buf!4940 (_2!9185 lt!307308))))))))))

(assert (=> b!197446 d!66705))

(declare-fun d!66707 () Bool)

(assert (=> d!66707 (= (invariant!0 (currentBit!9273 (_2!9185 lt!307308)) (currentByte!9278 (_2!9185 lt!307308)) (size!4454 (buf!4940 (_2!9185 lt!307308)))) (and (bvsge (currentBit!9273 (_2!9185 lt!307308)) #b00000000000000000000000000000000) (bvslt (currentBit!9273 (_2!9185 lt!307308)) #b00000000000000000000000000001000) (bvsge (currentByte!9278 (_2!9185 lt!307308)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 (_2!9185 lt!307308)) (size!4454 (buf!4940 (_2!9185 lt!307308)))) (and (= (currentBit!9273 (_2!9185 lt!307308)) #b00000000000000000000000000000000) (= (currentByte!9278 (_2!9185 lt!307308)) (size!4454 (buf!4940 (_2!9185 lt!307308))))))))))

(assert (=> b!197457 d!66707))

(declare-fun d!66709 () Bool)

(assert (=> d!66709 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204)) lt!307306) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204))) lt!307306))))

(declare-fun bs!16553 () Bool)

(assert (= bs!16553 d!66709))

(assert (=> bs!16553 m!305255))

(assert (=> b!197456 d!66709))

(declare-fun d!66711 () Bool)

(assert (=> d!66711 (= (array_inv!4195 (buf!4940 thiss!1204)) (bvsge (size!4454 (buf!4940 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!197445 d!66711))

(declare-fun b!197628 () Bool)

(declare-fun res!165434 () Bool)

(declare-fun e!135705 () Bool)

(assert (=> b!197628 (=> (not res!165434) (not e!135705))))

(declare-fun lt!307568 () tuple2!17084)

(assert (=> b!197628 (= res!165434 (isPrefixOf!0 (_1!9187 lt!307568) thiss!1204))))

(declare-fun d!66713 () Bool)

(assert (=> d!66713 e!135705))

(declare-fun res!165435 () Bool)

(assert (=> d!66713 (=> (not res!165435) (not e!135705))))

(assert (=> d!66713 (= res!165435 (isPrefixOf!0 (_1!9187 lt!307568) (_2!9187 lt!307568)))))

(declare-fun lt!307579 () BitStream!8016)

(assert (=> d!66713 (= lt!307568 (tuple2!17085 lt!307579 (_2!9185 lt!307308)))))

(declare-fun lt!307577 () Unit!13973)

(declare-fun lt!307570 () Unit!13973)

(assert (=> d!66713 (= lt!307577 lt!307570)))

(assert (=> d!66713 (isPrefixOf!0 lt!307579 (_2!9185 lt!307308))))

(assert (=> d!66713 (= lt!307570 (lemmaIsPrefixTransitive!0 lt!307579 (_2!9185 lt!307308) (_2!9185 lt!307308)))))

(declare-fun lt!307572 () Unit!13973)

(declare-fun lt!307575 () Unit!13973)

(assert (=> d!66713 (= lt!307572 lt!307575)))

(assert (=> d!66713 (isPrefixOf!0 lt!307579 (_2!9185 lt!307308))))

(assert (=> d!66713 (= lt!307575 (lemmaIsPrefixTransitive!0 lt!307579 thiss!1204 (_2!9185 lt!307308)))))

(declare-fun lt!307580 () Unit!13973)

(declare-fun e!135706 () Unit!13973)

(assert (=> d!66713 (= lt!307580 e!135706)))

(declare-fun c!9814 () Bool)

(assert (=> d!66713 (= c!9814 (not (= (size!4454 (buf!4940 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!307571 () Unit!13973)

(declare-fun lt!307576 () Unit!13973)

(assert (=> d!66713 (= lt!307571 lt!307576)))

(assert (=> d!66713 (isPrefixOf!0 (_2!9185 lt!307308) (_2!9185 lt!307308))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8016) Unit!13973)

(assert (=> d!66713 (= lt!307576 (lemmaIsPrefixRefl!0 (_2!9185 lt!307308)))))

(declare-fun lt!307566 () Unit!13973)

(declare-fun lt!307563 () Unit!13973)

(assert (=> d!66713 (= lt!307566 lt!307563)))

(assert (=> d!66713 (= lt!307563 (lemmaIsPrefixRefl!0 (_2!9185 lt!307308)))))

(declare-fun lt!307582 () Unit!13973)

(declare-fun lt!307573 () Unit!13973)

(assert (=> d!66713 (= lt!307582 lt!307573)))

(assert (=> d!66713 (isPrefixOf!0 lt!307579 lt!307579)))

(assert (=> d!66713 (= lt!307573 (lemmaIsPrefixRefl!0 lt!307579))))

(declare-fun lt!307578 () Unit!13973)

(declare-fun lt!307567 () Unit!13973)

(assert (=> d!66713 (= lt!307578 lt!307567)))

(assert (=> d!66713 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!66713 (= lt!307567 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!66713 (= lt!307579 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))

(assert (=> d!66713 (isPrefixOf!0 thiss!1204 (_2!9185 lt!307308))))

(assert (=> d!66713 (= (reader!0 thiss!1204 (_2!9185 lt!307308)) lt!307568)))

(declare-fun b!197629 () Bool)

(declare-fun lt!307565 () Unit!13973)

(assert (=> b!197629 (= e!135706 lt!307565)))

(declare-fun lt!307569 () (_ BitVec 64))

(assert (=> b!197629 (= lt!307569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!307581 () (_ BitVec 64))

(assert (=> b!197629 (= lt!307581 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10105 array!10105 (_ BitVec 64) (_ BitVec 64)) Unit!13973)

(assert (=> b!197629 (= lt!307565 (arrayBitRangesEqSymmetric!0 (buf!4940 thiss!1204) (buf!4940 (_2!9185 lt!307308)) lt!307569 lt!307581))))

(assert (=> b!197629 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307308)) (buf!4940 thiss!1204) lt!307569 lt!307581)))

(declare-fun b!197630 () Bool)

(declare-fun res!165433 () Bool)

(assert (=> b!197630 (=> (not res!165433) (not e!135705))))

(assert (=> b!197630 (= res!165433 (isPrefixOf!0 (_2!9187 lt!307568) (_2!9185 lt!307308)))))

(declare-fun b!197631 () Bool)

(declare-fun lt!307574 () (_ BitVec 64))

(declare-fun lt!307564 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8016 (_ BitVec 64)) BitStream!8016)

(assert (=> b!197631 (= e!135705 (= (_1!9187 lt!307568) (withMovedBitIndex!0 (_2!9187 lt!307568) (bvsub lt!307574 lt!307564))))))

(assert (=> b!197631 (or (= (bvand lt!307574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307564 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307574 lt!307564) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197631 (= lt!307564 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308))))))

(assert (=> b!197631 (= lt!307574 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))

(declare-fun b!197632 () Bool)

(declare-fun Unit!13991 () Unit!13973)

(assert (=> b!197632 (= e!135706 Unit!13991)))

(assert (= (and d!66713 c!9814) b!197629))

(assert (= (and d!66713 (not c!9814)) b!197632))

(assert (= (and d!66713 res!165435) b!197628))

(assert (= (and b!197628 res!165434) b!197630))

(assert (= (and b!197630 res!165433) b!197631))

(declare-fun m!305271 () Bool)

(assert (=> b!197630 m!305271))

(declare-fun m!305273 () Bool)

(assert (=> b!197628 m!305273))

(declare-fun m!305275 () Bool)

(assert (=> b!197631 m!305275))

(assert (=> b!197631 m!305051))

(assert (=> b!197631 m!305049))

(assert (=> b!197629 m!305049))

(declare-fun m!305277 () Bool)

(assert (=> b!197629 m!305277))

(declare-fun m!305279 () Bool)

(assert (=> b!197629 m!305279))

(declare-fun m!305281 () Bool)

(assert (=> d!66713 m!305281))

(declare-fun m!305283 () Bool)

(assert (=> d!66713 m!305283))

(declare-fun m!305285 () Bool)

(assert (=> d!66713 m!305285))

(declare-fun m!305287 () Bool)

(assert (=> d!66713 m!305287))

(declare-fun m!305289 () Bool)

(assert (=> d!66713 m!305289))

(declare-fun m!305291 () Bool)

(assert (=> d!66713 m!305291))

(declare-fun m!305293 () Bool)

(assert (=> d!66713 m!305293))

(declare-fun m!305295 () Bool)

(assert (=> d!66713 m!305295))

(declare-fun m!305297 () Bool)

(assert (=> d!66713 m!305297))

(declare-fun m!305299 () Bool)

(assert (=> d!66713 m!305299))

(assert (=> d!66713 m!305053))

(assert (=> b!197444 d!66713))

(declare-fun d!66715 () Bool)

(declare-datatypes ((tuple2!17100 0))(
  ( (tuple2!17101 (_1!9195 Bool) (_2!9195 BitStream!8016)) )
))
(declare-fun lt!307585 () tuple2!17100)

(declare-fun readBit!0 (BitStream!8016) tuple2!17100)

(assert (=> d!66715 (= lt!307585 (readBit!0 (_1!9187 lt!307301)))))

(assert (=> d!66715 (= (readBitPure!0 (_1!9187 lt!307301)) (tuple2!17083 (_2!9195 lt!307585) (_1!9195 lt!307585)))))

(declare-fun bs!16554 () Bool)

(assert (= bs!16554 d!66715))

(declare-fun m!305301 () Bool)

(assert (=> bs!16554 m!305301))

(assert (=> b!197444 d!66715))

(declare-fun d!66717 () Bool)

(assert (=> d!66717 (= (invariant!0 (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204) (size!4454 (buf!4940 (_2!9185 lt!307286)))) (and (bvsge (currentBit!9273 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9273 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9278 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 thiss!1204) (size!4454 (buf!4940 (_2!9185 lt!307286)))) (and (= (currentBit!9273 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9278 thiss!1204) (size!4454 (buf!4940 (_2!9185 lt!307286))))))))))

(assert (=> b!197444 d!66717))

(declare-fun d!66719 () Bool)

(assert (=> d!66719 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204)) lt!307306) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204))) lt!307306))))

(declare-fun bs!16555 () Bool)

(assert (= bs!16555 d!66719))

(declare-fun m!305303 () Bool)

(assert (=> bs!16555 m!305303))

(assert (=> b!197444 d!66719))

(declare-fun d!66721 () Bool)

(declare-fun e!135707 () Bool)

(assert (=> d!66721 e!135707))

(declare-fun res!165437 () Bool)

(assert (=> d!66721 (=> (not res!165437) (not e!135707))))

(declare-fun lt!307586 () (_ BitVec 64))

(declare-fun lt!307587 () (_ BitVec 64))

(declare-fun lt!307589 () (_ BitVec 64))

(assert (=> d!66721 (= res!165437 (= lt!307586 (bvsub lt!307589 lt!307587)))))

(assert (=> d!66721 (or (= (bvand lt!307589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307587 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307589 lt!307587) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66721 (= lt!307587 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307287)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307287))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307287)))))))

(declare-fun lt!307588 () (_ BitVec 64))

(declare-fun lt!307591 () (_ BitVec 64))

(assert (=> d!66721 (= lt!307589 (bvmul lt!307588 lt!307591))))

(assert (=> d!66721 (or (= lt!307588 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307591 (bvsdiv (bvmul lt!307588 lt!307591) lt!307588)))))

(assert (=> d!66721 (= lt!307591 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66721 (= lt!307588 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307287)))))))

(assert (=> d!66721 (= lt!307586 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307287))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307287)))))))

(assert (=> d!66721 (invariant!0 (currentBit!9273 (_1!9186 lt!307287)) (currentByte!9278 (_1!9186 lt!307287)) (size!4454 (buf!4940 (_1!9186 lt!307287))))))

(assert (=> d!66721 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307287))) (currentByte!9278 (_1!9186 lt!307287)) (currentBit!9273 (_1!9186 lt!307287))) lt!307586)))

(declare-fun b!197633 () Bool)

(declare-fun res!165436 () Bool)

(assert (=> b!197633 (=> (not res!165436) (not e!135707))))

(assert (=> b!197633 (= res!165436 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307586))))

(declare-fun b!197634 () Bool)

(declare-fun lt!307590 () (_ BitVec 64))

(assert (=> b!197634 (= e!135707 (bvsle lt!307586 (bvmul lt!307590 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197634 (or (= lt!307590 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307590 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307590)))))

(assert (=> b!197634 (= lt!307590 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307287)))))))

(assert (= (and d!66721 res!165437) b!197633))

(assert (= (and b!197633 res!165436) b!197634))

(declare-fun m!305305 () Bool)

(assert (=> d!66721 m!305305))

(declare-fun m!305307 () Bool)

(assert (=> d!66721 m!305307))

(assert (=> b!197444 d!66721))

(declare-fun d!66723 () Bool)

(declare-fun lt!307592 () tuple2!17100)

(assert (=> d!66723 (= lt!307592 (readBit!0 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(assert (=> d!66723 (= (readBitPure!0 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))) (tuple2!17083 (_2!9195 lt!307592) (_1!9195 lt!307592)))))

(declare-fun bs!16556 () Bool)

(assert (= bs!16556 d!66723))

(declare-fun m!305309 () Bool)

(assert (=> bs!16556 m!305309))

(assert (=> b!197444 d!66723))

(declare-fun d!66725 () Bool)

(declare-fun e!135710 () Bool)

(assert (=> d!66725 e!135710))

(declare-fun res!165440 () Bool)

(assert (=> d!66725 (=> (not res!165440) (not e!135710))))

(declare-fun lt!307601 () tuple2!17082)

(declare-fun lt!307602 () tuple2!17082)

(assert (=> d!66725 (= res!165440 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307601))) (currentByte!9278 (_1!9186 lt!307601)) (currentBit!9273 (_1!9186 lt!307601))) (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307602))) (currentByte!9278 (_1!9186 lt!307602)) (currentBit!9273 (_1!9186 lt!307602)))))))

(declare-fun lt!307603 () BitStream!8016)

(declare-fun lt!307604 () Unit!13973)

(declare-fun choose!50 (BitStream!8016 BitStream!8016 BitStream!8016 tuple2!17082 tuple2!17082 BitStream!8016 Bool tuple2!17082 tuple2!17082 BitStream!8016 Bool) Unit!13973)

(assert (=> d!66725 (= lt!307604 (choose!50 lt!307296 (_2!9185 lt!307308) lt!307603 lt!307601 (tuple2!17083 (_1!9186 lt!307601) (_2!9186 lt!307601)) (_1!9186 lt!307601) (_2!9186 lt!307601) lt!307602 (tuple2!17083 (_1!9186 lt!307602) (_2!9186 lt!307602)) (_1!9186 lt!307602) (_2!9186 lt!307602)))))

(assert (=> d!66725 (= lt!307602 (readBitPure!0 lt!307603))))

(assert (=> d!66725 (= lt!307601 (readBitPure!0 lt!307296))))

(assert (=> d!66725 (= lt!307603 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 lt!307296) (currentBit!9273 lt!307296)))))

(assert (=> d!66725 (invariant!0 (currentBit!9273 lt!307296) (currentByte!9278 lt!307296) (size!4454 (buf!4940 (_2!9185 lt!307308))))))

(assert (=> d!66725 (= (readBitPrefixLemma!0 lt!307296 (_2!9185 lt!307308)) lt!307604)))

(declare-fun b!197637 () Bool)

(assert (=> b!197637 (= e!135710 (= (_2!9186 lt!307601) (_2!9186 lt!307602)))))

(assert (= (and d!66725 res!165440) b!197637))

(assert (=> d!66725 m!305099))

(declare-fun m!305311 () Bool)

(assert (=> d!66725 m!305311))

(declare-fun m!305313 () Bool)

(assert (=> d!66725 m!305313))

(declare-fun m!305315 () Bool)

(assert (=> d!66725 m!305315))

(declare-fun m!305317 () Bool)

(assert (=> d!66725 m!305317))

(declare-fun m!305319 () Bool)

(assert (=> d!66725 m!305319))

(assert (=> b!197444 d!66725))

(declare-fun d!66727 () Bool)

(assert (=> d!66727 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!307288)))

(declare-fun lt!307607 () Unit!13973)

(declare-fun choose!9 (BitStream!8016 array!10105 (_ BitVec 64) BitStream!8016) Unit!13973)

(assert (=> d!66727 (= lt!307607 (choose!9 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!307308)) lt!307288 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (=> d!66727 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!307308)) lt!307288) lt!307607)))

(declare-fun bs!16557 () Bool)

(assert (= bs!16557 d!66727))

(assert (=> bs!16557 m!305101))

(declare-fun m!305321 () Bool)

(assert (=> bs!16557 m!305321))

(assert (=> b!197444 d!66727))

(declare-fun d!66729 () Bool)

(assert (=> d!66729 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204)) lt!307306)))

(declare-fun lt!307608 () Unit!13973)

(assert (=> d!66729 (= lt!307608 (choose!9 thiss!1204 (buf!4940 (_2!9185 lt!307308)) lt!307306 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(assert (=> d!66729 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4940 (_2!9185 lt!307308)) lt!307306) lt!307608)))

(declare-fun bs!16558 () Bool)

(assert (= bs!16558 d!66729))

(assert (=> bs!16558 m!305093))

(declare-fun m!305323 () Bool)

(assert (=> bs!16558 m!305323))

(assert (=> b!197444 d!66729))

(declare-fun d!66731 () Bool)

(declare-fun e!135711 () Bool)

(assert (=> d!66731 e!135711))

(declare-fun res!165442 () Bool)

(assert (=> d!66731 (=> (not res!165442) (not e!135711))))

(declare-fun lt!307610 () (_ BitVec 64))

(declare-fun lt!307609 () (_ BitVec 64))

(declare-fun lt!307612 () (_ BitVec 64))

(assert (=> d!66731 (= res!165442 (= lt!307609 (bvsub lt!307612 lt!307610)))))

(assert (=> d!66731 (or (= (bvand lt!307612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307610 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307612 lt!307610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66731 (= lt!307610 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307290)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307290))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307290)))))))

(declare-fun lt!307611 () (_ BitVec 64))

(declare-fun lt!307614 () (_ BitVec 64))

(assert (=> d!66731 (= lt!307612 (bvmul lt!307611 lt!307614))))

(assert (=> d!66731 (or (= lt!307611 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307614 (bvsdiv (bvmul lt!307611 lt!307614) lt!307611)))))

(assert (=> d!66731 (= lt!307614 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66731 (= lt!307611 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307290)))))))

(assert (=> d!66731 (= lt!307609 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307290))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307290)))))))

(assert (=> d!66731 (invariant!0 (currentBit!9273 (_1!9186 lt!307290)) (currentByte!9278 (_1!9186 lt!307290)) (size!4454 (buf!4940 (_1!9186 lt!307290))))))

(assert (=> d!66731 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307290))) (currentByte!9278 (_1!9186 lt!307290)) (currentBit!9273 (_1!9186 lt!307290))) lt!307609)))

(declare-fun b!197638 () Bool)

(declare-fun res!165441 () Bool)

(assert (=> b!197638 (=> (not res!165441) (not e!135711))))

(assert (=> b!197638 (= res!165441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307609))))

(declare-fun b!197639 () Bool)

(declare-fun lt!307613 () (_ BitVec 64))

(assert (=> b!197639 (= e!135711 (bvsle lt!307609 (bvmul lt!307613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197639 (or (= lt!307613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307613)))))

(assert (=> b!197639 (= lt!307613 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307290)))))))

(assert (= (and d!66731 res!165442) b!197638))

(assert (= (and b!197638 res!165441) b!197639))

(declare-fun m!305325 () Bool)

(assert (=> d!66731 m!305325))

(declare-fun m!305327 () Bool)

(assert (=> d!66731 m!305327))

(assert (=> b!197444 d!66731))

(declare-fun d!66733 () Bool)

(declare-fun lt!307615 () tuple2!17100)

(assert (=> d!66733 (= lt!307615 (readBit!0 lt!307296))))

(assert (=> d!66733 (= (readBitPure!0 lt!307296) (tuple2!17083 (_2!9195 lt!307615) (_1!9195 lt!307615)))))

(declare-fun bs!16559 () Bool)

(assert (= bs!16559 d!66733))

(declare-fun m!305329 () Bool)

(assert (=> bs!16559 m!305329))

(assert (=> b!197444 d!66733))

(declare-fun b!197640 () Bool)

(declare-fun res!165444 () Bool)

(declare-fun e!135712 () Bool)

(assert (=> b!197640 (=> (not res!165444) (not e!135712))))

(declare-fun lt!307621 () tuple2!17084)

(assert (=> b!197640 (= res!165444 (isPrefixOf!0 (_1!9187 lt!307621) (_2!9185 lt!307286)))))

(declare-fun d!66735 () Bool)

(assert (=> d!66735 e!135712))

(declare-fun res!165445 () Bool)

(assert (=> d!66735 (=> (not res!165445) (not e!135712))))

(assert (=> d!66735 (= res!165445 (isPrefixOf!0 (_1!9187 lt!307621) (_2!9187 lt!307621)))))

(declare-fun lt!307632 () BitStream!8016)

(assert (=> d!66735 (= lt!307621 (tuple2!17085 lt!307632 (_2!9185 lt!307308)))))

(declare-fun lt!307630 () Unit!13973)

(declare-fun lt!307623 () Unit!13973)

(assert (=> d!66735 (= lt!307630 lt!307623)))

(assert (=> d!66735 (isPrefixOf!0 lt!307632 (_2!9185 lt!307308))))

(assert (=> d!66735 (= lt!307623 (lemmaIsPrefixTransitive!0 lt!307632 (_2!9185 lt!307308) (_2!9185 lt!307308)))))

(declare-fun lt!307625 () Unit!13973)

(declare-fun lt!307628 () Unit!13973)

(assert (=> d!66735 (= lt!307625 lt!307628)))

(assert (=> d!66735 (isPrefixOf!0 lt!307632 (_2!9185 lt!307308))))

(assert (=> d!66735 (= lt!307628 (lemmaIsPrefixTransitive!0 lt!307632 (_2!9185 lt!307286) (_2!9185 lt!307308)))))

(declare-fun lt!307633 () Unit!13973)

(declare-fun e!135713 () Unit!13973)

(assert (=> d!66735 (= lt!307633 e!135713)))

(declare-fun c!9815 () Bool)

(assert (=> d!66735 (= c!9815 (not (= (size!4454 (buf!4940 (_2!9185 lt!307286))) #b00000000000000000000000000000000)))))

(declare-fun lt!307624 () Unit!13973)

(declare-fun lt!307629 () Unit!13973)

(assert (=> d!66735 (= lt!307624 lt!307629)))

(assert (=> d!66735 (isPrefixOf!0 (_2!9185 lt!307308) (_2!9185 lt!307308))))

(assert (=> d!66735 (= lt!307629 (lemmaIsPrefixRefl!0 (_2!9185 lt!307308)))))

(declare-fun lt!307619 () Unit!13973)

(declare-fun lt!307616 () Unit!13973)

(assert (=> d!66735 (= lt!307619 lt!307616)))

(assert (=> d!66735 (= lt!307616 (lemmaIsPrefixRefl!0 (_2!9185 lt!307308)))))

(declare-fun lt!307635 () Unit!13973)

(declare-fun lt!307626 () Unit!13973)

(assert (=> d!66735 (= lt!307635 lt!307626)))

(assert (=> d!66735 (isPrefixOf!0 lt!307632 lt!307632)))

(assert (=> d!66735 (= lt!307626 (lemmaIsPrefixRefl!0 lt!307632))))

(declare-fun lt!307631 () Unit!13973)

(declare-fun lt!307620 () Unit!13973)

(assert (=> d!66735 (= lt!307631 lt!307620)))

(assert (=> d!66735 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!307286))))

(assert (=> d!66735 (= lt!307620 (lemmaIsPrefixRefl!0 (_2!9185 lt!307286)))))

(assert (=> d!66735 (= lt!307632 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(assert (=> d!66735 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!307308))))

(assert (=> d!66735 (= (reader!0 (_2!9185 lt!307286) (_2!9185 lt!307308)) lt!307621)))

(declare-fun b!197641 () Bool)

(declare-fun lt!307618 () Unit!13973)

(assert (=> b!197641 (= e!135713 lt!307618)))

(declare-fun lt!307622 () (_ BitVec 64))

(assert (=> b!197641 (= lt!307622 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!307634 () (_ BitVec 64))

(assert (=> b!197641 (= lt!307634 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(assert (=> b!197641 (= lt!307618 (arrayBitRangesEqSymmetric!0 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!307308)) lt!307622 lt!307634))))

(assert (=> b!197641 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307308)) (buf!4940 (_2!9185 lt!307286)) lt!307622 lt!307634)))

(declare-fun b!197642 () Bool)

(declare-fun res!165443 () Bool)

(assert (=> b!197642 (=> (not res!165443) (not e!135712))))

(assert (=> b!197642 (= res!165443 (isPrefixOf!0 (_2!9187 lt!307621) (_2!9185 lt!307308)))))

(declare-fun lt!307617 () (_ BitVec 64))

(declare-fun b!197643 () Bool)

(declare-fun lt!307627 () (_ BitVec 64))

(assert (=> b!197643 (= e!135712 (= (_1!9187 lt!307621) (withMovedBitIndex!0 (_2!9187 lt!307621) (bvsub lt!307627 lt!307617))))))

(assert (=> b!197643 (or (= (bvand lt!307627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307617 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307627 lt!307617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197643 (= lt!307617 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308))))))

(assert (=> b!197643 (= lt!307627 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(declare-fun b!197644 () Bool)

(declare-fun Unit!14001 () Unit!13973)

(assert (=> b!197644 (= e!135713 Unit!14001)))

(assert (= (and d!66735 c!9815) b!197641))

(assert (= (and d!66735 (not c!9815)) b!197644))

(assert (= (and d!66735 res!165445) b!197640))

(assert (= (and b!197640 res!165444) b!197642))

(assert (= (and b!197642 res!165443) b!197643))

(declare-fun m!305331 () Bool)

(assert (=> b!197642 m!305331))

(declare-fun m!305333 () Bool)

(assert (=> b!197640 m!305333))

(declare-fun m!305335 () Bool)

(assert (=> b!197643 m!305335))

(assert (=> b!197643 m!305051))

(assert (=> b!197643 m!305047))

(assert (=> b!197641 m!305047))

(declare-fun m!305337 () Bool)

(assert (=> b!197641 m!305337))

(declare-fun m!305339 () Bool)

(assert (=> b!197641 m!305339))

(assert (=> d!66735 m!305281))

(declare-fun m!305341 () Bool)

(assert (=> d!66735 m!305341))

(declare-fun m!305343 () Bool)

(assert (=> d!66735 m!305343))

(declare-fun m!305345 () Bool)

(assert (=> d!66735 m!305345))

(declare-fun m!305347 () Bool)

(assert (=> d!66735 m!305347))

(declare-fun m!305349 () Bool)

(assert (=> d!66735 m!305349))

(declare-fun m!305351 () Bool)

(assert (=> d!66735 m!305351))

(declare-fun m!305353 () Bool)

(assert (=> d!66735 m!305353))

(declare-fun m!305355 () Bool)

(assert (=> d!66735 m!305355))

(assert (=> d!66735 m!305299))

(assert (=> d!66735 m!305079))

(assert (=> b!197444 d!66735))

(declare-fun d!66737 () Bool)

(assert (=> d!66737 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!307288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286)))) lt!307288))))

(declare-fun bs!16560 () Bool)

(assert (= bs!16560 d!66737))

(declare-fun m!305357 () Bool)

(assert (=> bs!16560 m!305357))

(assert (=> b!197444 d!66737))

(declare-fun d!66739 () Bool)

(assert (=> d!66739 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!197444 d!66739))

(declare-datatypes ((tuple2!17102 0))(
  ( (tuple2!17103 (_1!9196 (_ BitVec 64)) (_2!9196 BitStream!8016)) )
))
(declare-fun lt!307638 () tuple2!17102)

(declare-fun d!66741 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17102)

(assert (=> d!66741 (= lt!307638 (readNBitsLSBFirstsLoop!0 (_1!9187 lt!307307) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307309 (ite (_2!9186 lt!307302) lt!307297 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!66741 (= (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!307307) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307309 (ite (_2!9186 lt!307302) lt!307297 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17087 (_2!9196 lt!307638) (_1!9196 lt!307638)))))

(declare-fun bs!16561 () Bool)

(assert (= bs!16561 d!66741))

(declare-fun m!305359 () Bool)

(assert (=> bs!16561 m!305359))

(assert (=> b!197444 d!66741))

(declare-fun lt!307639 () tuple2!17102)

(declare-fun d!66743 () Bool)

(assert (=> d!66743 (= lt!307639 (readNBitsLSBFirstsLoop!0 (_1!9187 lt!307301) nBits!348 i!590 lt!307309))))

(assert (=> d!66743 (= (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!307301) nBits!348 i!590 lt!307309) (tuple2!17087 (_2!9196 lt!307639) (_1!9196 lt!307639)))))

(declare-fun bs!16562 () Bool)

(assert (= bs!16562 d!66743))

(declare-fun m!305361 () Bool)

(assert (=> bs!16562 m!305361))

(assert (=> b!197444 d!66743))

(declare-fun d!66745 () Bool)

(declare-fun e!135714 () Bool)

(assert (=> d!66745 e!135714))

(declare-fun res!165447 () Bool)

(assert (=> d!66745 (=> (not res!165447) (not e!135714))))

(declare-fun lt!307640 () (_ BitVec 64))

(declare-fun lt!307643 () (_ BitVec 64))

(declare-fun lt!307641 () (_ BitVec 64))

(assert (=> d!66745 (= res!165447 (= lt!307640 (bvsub lt!307643 lt!307641)))))

(assert (=> d!66745 (or (= (bvand lt!307643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307641 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307643 lt!307641) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66745 (= lt!307641 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307308))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307308)))))))

(declare-fun lt!307642 () (_ BitVec 64))

(declare-fun lt!307645 () (_ BitVec 64))

(assert (=> d!66745 (= lt!307643 (bvmul lt!307642 lt!307645))))

(assert (=> d!66745 (or (= lt!307642 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307645 (bvsdiv (bvmul lt!307642 lt!307645) lt!307642)))))

(assert (=> d!66745 (= lt!307645 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66745 (= lt!307642 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))))))

(assert (=> d!66745 (= lt!307640 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307308))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307308)))))))

(assert (=> d!66745 (invariant!0 (currentBit!9273 (_2!9185 lt!307308)) (currentByte!9278 (_2!9185 lt!307308)) (size!4454 (buf!4940 (_2!9185 lt!307308))))))

(assert (=> d!66745 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308))) lt!307640)))

(declare-fun b!197645 () Bool)

(declare-fun res!165446 () Bool)

(assert (=> b!197645 (=> (not res!165446) (not e!135714))))

(assert (=> b!197645 (= res!165446 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307640))))

(declare-fun b!197646 () Bool)

(declare-fun lt!307644 () (_ BitVec 64))

(assert (=> b!197646 (= e!135714 (bvsle lt!307640 (bvmul lt!307644 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197646 (or (= lt!307644 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307644 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307644)))))

(assert (=> b!197646 (= lt!307644 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))))))

(assert (= (and d!66745 res!165447) b!197645))

(assert (= (and b!197645 res!165446) b!197646))

(declare-fun m!305363 () Bool)

(assert (=> d!66745 m!305363))

(assert (=> d!66745 m!305071))

(assert (=> b!197455 d!66745))

(declare-fun d!66747 () Bool)

(declare-fun res!165450 () Bool)

(declare-fun e!135716 () Bool)

(assert (=> d!66747 (=> (not res!165450) (not e!135716))))

(assert (=> d!66747 (= res!165450 (= (size!4454 (buf!4940 thiss!1204)) (size!4454 (buf!4940 (_2!9185 lt!307308)))))))

(assert (=> d!66747 (= (isPrefixOf!0 thiss!1204 (_2!9185 lt!307308)) e!135716)))

(declare-fun b!197647 () Bool)

(declare-fun res!165449 () Bool)

(assert (=> b!197647 (=> (not res!165449) (not e!135716))))

(assert (=> b!197647 (= res!165449 (bvsle (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308)))))))

(declare-fun b!197648 () Bool)

(declare-fun e!135715 () Bool)

(assert (=> b!197648 (= e!135716 e!135715)))

(declare-fun res!165448 () Bool)

(assert (=> b!197648 (=> res!165448 e!135715)))

(assert (=> b!197648 (= res!165448 (= (size!4454 (buf!4940 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197649 () Bool)

(assert (=> b!197649 (= e!135715 (arrayBitRangesEq!0 (buf!4940 thiss!1204) (buf!4940 (_2!9185 lt!307308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(assert (= (and d!66747 res!165450) b!197647))

(assert (= (and b!197647 res!165449) b!197648))

(assert (= (and b!197648 (not res!165448)) b!197649))

(assert (=> b!197647 m!305049))

(assert (=> b!197647 m!305051))

(assert (=> b!197649 m!305049))

(assert (=> b!197649 m!305049))

(declare-fun m!305365 () Bool)

(assert (=> b!197649 m!305365))

(assert (=> b!197455 d!66747))

(declare-fun d!66749 () Bool)

(assert (=> d!66749 (isPrefixOf!0 thiss!1204 (_2!9185 lt!307308))))

(declare-fun lt!307648 () Unit!13973)

(declare-fun choose!30 (BitStream!8016 BitStream!8016 BitStream!8016) Unit!13973)

(assert (=> d!66749 (= lt!307648 (choose!30 thiss!1204 (_2!9185 lt!307286) (_2!9185 lt!307308)))))

(assert (=> d!66749 (isPrefixOf!0 thiss!1204 (_2!9185 lt!307286))))

(assert (=> d!66749 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9185 lt!307286) (_2!9185 lt!307308)) lt!307648)))

(declare-fun bs!16563 () Bool)

(assert (= bs!16563 d!66749))

(assert (=> bs!16563 m!305053))

(declare-fun m!305367 () Bool)

(assert (=> bs!16563 m!305367))

(assert (=> bs!16563 m!305059))

(assert (=> b!197455 d!66749))

(declare-fun b!197843 () Bool)

(declare-fun e!135824 () tuple2!17080)

(declare-fun Unit!14003 () Unit!13973)

(assert (=> b!197843 (= e!135824 (tuple2!17081 Unit!14003 (_2!9185 lt!307286)))))

(declare-fun lt!308371 () Unit!13973)

(assert (=> b!197843 (= lt!308371 (lemmaIsPrefixRefl!0 (_2!9185 lt!307286)))))

(declare-fun call!3110 () Bool)

(assert (=> b!197843 call!3110))

(declare-fun lt!308346 () Unit!13973)

(assert (=> b!197843 (= lt!308346 lt!308371)))

(declare-fun b!197844 () Bool)

(declare-fun e!135829 () (_ BitVec 64))

(assert (=> b!197844 (= e!135829 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!308349 () tuple2!17080)

(declare-fun c!9840 () Bool)

(declare-fun bm!3107 () Bool)

(assert (=> bm!3107 (= call!3110 (isPrefixOf!0 (_2!9185 lt!307286) (ite c!9840 (_2!9185 lt!307286) (_2!9185 lt!308349))))))

(declare-fun b!197845 () Bool)

(declare-fun res!165608 () Bool)

(declare-fun e!135830 () Bool)

(assert (=> b!197845 (=> (not res!165608) (not e!135830))))

(declare-fun lt!308356 () tuple2!17080)

(declare-fun lt!308361 () (_ BitVec 64))

(declare-fun lt!308339 () (_ BitVec 64))

(assert (=> b!197845 (= res!165608 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308356))) (currentByte!9278 (_2!9185 lt!308356)) (currentBit!9273 (_2!9185 lt!308356))) (bvsub lt!308361 lt!308339)))))

(assert (=> b!197845 (or (= (bvand lt!308361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308339 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308361 lt!308339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197845 (= lt!308339 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!308343 () (_ BitVec 64))

(declare-fun lt!308351 () (_ BitVec 64))

(assert (=> b!197845 (= lt!308361 (bvadd lt!308343 lt!308351))))

(assert (=> b!197845 (or (not (= (bvand lt!308343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308351 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308343 lt!308351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197845 (= lt!308351 ((_ sign_extend 32) nBits!348))))

(assert (=> b!197845 (= lt!308343 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(declare-fun b!197846 () Bool)

(assert (=> b!197846 (= e!135829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!197847 () Bool)

(declare-fun res!165600 () Bool)

(declare-fun lt!308353 () tuple2!17080)

(assert (=> b!197847 (= res!165600 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308353))) (currentByte!9278 (_2!9185 lt!308353)) (currentBit!9273 (_2!9185 lt!308353))) (bvadd (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!135826 () Bool)

(assert (=> b!197847 (=> (not res!165600) (not e!135826))))

(declare-fun b!197848 () Bool)

(declare-fun res!165607 () Bool)

(assert (=> b!197848 (= res!165607 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!308353)))))

(assert (=> b!197848 (=> (not res!165607) (not e!135826))))

(declare-fun b!197849 () Bool)

(declare-fun e!135827 () Bool)

(declare-fun lt!308369 () tuple2!17086)

(declare-fun lt!308340 () tuple2!17084)

(assert (=> b!197849 (= e!135827 (= (_1!9188 lt!308369) (_2!9187 lt!308340)))))

(declare-fun b!197850 () Bool)

(declare-fun res!165599 () Bool)

(assert (=> b!197850 (=> (not res!165599) (not e!135830))))

(assert (=> b!197850 (= res!165599 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) (size!4454 (buf!4940 (_2!9185 lt!308356)))))))

(declare-fun b!197851 () Bool)

(declare-fun e!135823 () Bool)

(declare-fun lt!308386 () tuple2!17082)

(assert (=> b!197851 (= e!135823 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308386))) (currentByte!9278 (_1!9186 lt!308386)) (currentBit!9273 (_1!9186 lt!308386))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308353))) (currentByte!9278 (_2!9185 lt!308353)) (currentBit!9273 (_2!9185 lt!308353)))))))

(declare-fun b!197852 () Bool)

(declare-fun e!135828 () Bool)

(declare-fun lt!308384 () (_ BitVec 64))

(assert (=> b!197852 (= e!135828 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307286)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308384))))

(declare-fun b!197853 () Bool)

(declare-fun e!135825 () Bool)

(declare-fun lt!308374 () tuple2!17086)

(declare-fun lt!308355 () tuple2!17084)

(assert (=> b!197853 (= e!135825 (= (_1!9188 lt!308374) (_2!9187 lt!308355)))))

(declare-fun b!197854 () Bool)

(assert (=> b!197854 (= e!135824 (tuple2!17081 (_1!9185 lt!308349) (_2!9185 lt!308349)))))

(declare-fun lt!308336 () Bool)

(assert (=> b!197854 (= lt!308336 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197854 (= lt!308353 (appendBit!0 (_2!9185 lt!307286) lt!308336))))

(declare-fun res!165598 () Bool)

(assert (=> b!197854 (= res!165598 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) (size!4454 (buf!4940 (_2!9185 lt!308353)))))))

(assert (=> b!197854 (=> (not res!165598) (not e!135826))))

(assert (=> b!197854 e!135826))

(declare-fun lt!308338 () tuple2!17080)

(assert (=> b!197854 (= lt!308338 lt!308353)))

(assert (=> b!197854 (= lt!308349 (appendBitsLSBFirstLoopTR!0 (_2!9185 lt!308338) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!308388 () Unit!13973)

(assert (=> b!197854 (= lt!308388 (lemmaIsPrefixTransitive!0 (_2!9185 lt!307286) (_2!9185 lt!308338) (_2!9185 lt!308349)))))

(assert (=> b!197854 call!3110))

(declare-fun lt!308345 () Unit!13973)

(assert (=> b!197854 (= lt!308345 lt!308388)))

(assert (=> b!197854 (invariant!0 (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286)) (size!4454 (buf!4940 (_2!9185 lt!308338))))))

(declare-fun lt!308354 () BitStream!8016)

(assert (=> b!197854 (= lt!308354 (BitStream!8017 (buf!4940 (_2!9185 lt!308338)) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(assert (=> b!197854 (invariant!0 (currentBit!9273 lt!308354) (currentByte!9278 lt!308354) (size!4454 (buf!4940 (_2!9185 lt!308349))))))

(declare-fun lt!308366 () BitStream!8016)

(assert (=> b!197854 (= lt!308366 (BitStream!8017 (buf!4940 (_2!9185 lt!308349)) (currentByte!9278 lt!308354) (currentBit!9273 lt!308354)))))

(declare-fun lt!308390 () tuple2!17082)

(assert (=> b!197854 (= lt!308390 (readBitPure!0 lt!308354))))

(declare-fun lt!308370 () tuple2!17082)

(assert (=> b!197854 (= lt!308370 (readBitPure!0 lt!308366))))

(declare-fun lt!308373 () Unit!13973)

(assert (=> b!197854 (= lt!308373 (readBitPrefixLemma!0 lt!308354 (_2!9185 lt!308349)))))

(declare-fun res!165601 () Bool)

(assert (=> b!197854 (= res!165601 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308390))) (currentByte!9278 (_1!9186 lt!308390)) (currentBit!9273 (_1!9186 lt!308390))) (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308370))) (currentByte!9278 (_1!9186 lt!308370)) (currentBit!9273 (_1!9186 lt!308370)))))))

(declare-fun e!135831 () Bool)

(assert (=> b!197854 (=> (not res!165601) (not e!135831))))

(assert (=> b!197854 e!135831))

(declare-fun lt!308364 () Unit!13973)

(assert (=> b!197854 (= lt!308364 lt!308373)))

(declare-fun lt!308337 () tuple2!17084)

(assert (=> b!197854 (= lt!308337 (reader!0 (_2!9185 lt!307286) (_2!9185 lt!308349)))))

(declare-fun lt!308344 () tuple2!17084)

(assert (=> b!197854 (= lt!308344 (reader!0 (_2!9185 lt!308338) (_2!9185 lt!308349)))))

(declare-fun lt!308378 () tuple2!17082)

(assert (=> b!197854 (= lt!308378 (readBitPure!0 (_1!9187 lt!308337)))))

(assert (=> b!197854 (= (_2!9186 lt!308378) lt!308336)))

(declare-fun lt!308367 () Unit!13973)

(declare-fun Unit!14004 () Unit!13973)

(assert (=> b!197854 (= lt!308367 Unit!14004)))

(declare-fun lt!308348 () (_ BitVec 64))

(assert (=> b!197854 (= lt!308348 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!308341 () (_ BitVec 64))

(assert (=> b!197854 (= lt!308341 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!308365 () Unit!13973)

(assert (=> b!197854 (= lt!308365 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!308349)) lt!308341))))

(assert (=> b!197854 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308341)))

(declare-fun lt!308372 () Unit!13973)

(assert (=> b!197854 (= lt!308372 lt!308365)))

(declare-fun lt!308387 () tuple2!17086)

(assert (=> b!197854 (= lt!308387 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308337) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308348))))

(declare-fun lt!308358 () (_ BitVec 64))

(assert (=> b!197854 (= lt!308358 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!308382 () Unit!13973)

(assert (=> b!197854 (= lt!308382 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!308338) (buf!4940 (_2!9185 lt!308349)) lt!308358))))

(assert (=> b!197854 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308338))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308338))) lt!308358)))

(declare-fun lt!308375 () Unit!13973)

(assert (=> b!197854 (= lt!308375 lt!308382)))

(declare-fun lt!308381 () tuple2!17086)

(assert (=> b!197854 (= lt!308381 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308344) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308348 (ite (_2!9186 lt!308378) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!308362 () tuple2!17086)

(assert (=> b!197854 (= lt!308362 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308337) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308348))))

(declare-fun c!9841 () Bool)

(assert (=> b!197854 (= c!9841 (_2!9186 (readBitPure!0 (_1!9187 lt!308337))))))

(declare-fun lt!308360 () tuple2!17086)

(assert (=> b!197854 (= lt!308360 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9187 lt!308337) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308348 e!135829)))))

(declare-fun lt!308342 () Unit!13973)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13973)

(assert (=> b!197854 (= lt!308342 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9187 lt!308337) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308348))))

(assert (=> b!197854 (and (= (_2!9188 lt!308362) (_2!9188 lt!308360)) (= (_1!9188 lt!308362) (_1!9188 lt!308360)))))

(declare-fun lt!308350 () Unit!13973)

(assert (=> b!197854 (= lt!308350 lt!308342)))

(assert (=> b!197854 (= (_1!9187 lt!308337) (withMovedBitIndex!0 (_2!9187 lt!308337) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))))))))

(declare-fun lt!308376 () Unit!13973)

(declare-fun Unit!14006 () Unit!13973)

(assert (=> b!197854 (= lt!308376 Unit!14006)))

(assert (=> b!197854 (= (_1!9187 lt!308344) (withMovedBitIndex!0 (_2!9187 lt!308344) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))))))))

(declare-fun lt!308347 () Unit!13973)

(declare-fun Unit!14007 () Unit!13973)

(assert (=> b!197854 (= lt!308347 Unit!14007)))

(assert (=> b!197854 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!308377 () Unit!13973)

(declare-fun Unit!14008 () Unit!13973)

(assert (=> b!197854 (= lt!308377 Unit!14008)))

(assert (=> b!197854 (= (_2!9188 lt!308387) (_2!9188 lt!308381))))

(declare-fun lt!308385 () Unit!13973)

(declare-fun Unit!14009 () Unit!13973)

(assert (=> b!197854 (= lt!308385 Unit!14009)))

(assert (=> b!197854 (invariant!0 (currentBit!9273 (_2!9185 lt!308349)) (currentByte!9278 (_2!9185 lt!308349)) (size!4454 (buf!4940 (_2!9185 lt!308349))))))

(declare-fun lt!308389 () Unit!13973)

(declare-fun Unit!14010 () Unit!13973)

(assert (=> b!197854 (= lt!308389 Unit!14010)))

(assert (=> b!197854 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) (size!4454 (buf!4940 (_2!9185 lt!308349))))))

(declare-fun lt!308357 () Unit!13973)

(declare-fun Unit!14011 () Unit!13973)

(assert (=> b!197854 (= lt!308357 Unit!14011)))

(assert (=> b!197854 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))) (bvsub (bvadd (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!308352 () Unit!13973)

(declare-fun Unit!14012 () Unit!13973)

(assert (=> b!197854 (= lt!308352 Unit!14012)))

(declare-fun lt!308363 () Unit!13973)

(declare-fun Unit!14013 () Unit!13973)

(assert (=> b!197854 (= lt!308363 Unit!14013)))

(assert (=> b!197854 (= lt!308355 (reader!0 (_2!9185 lt!307286) (_2!9185 lt!308349)))))

(declare-fun lt!308368 () (_ BitVec 64))

(assert (=> b!197854 (= lt!308368 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!308391 () Unit!13973)

(assert (=> b!197854 (= lt!308391 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!308349)) lt!308368))))

(assert (=> b!197854 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308368)))

(declare-fun lt!308379 () Unit!13973)

(assert (=> b!197854 (= lt!308379 lt!308391)))

(assert (=> b!197854 (= lt!308374 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308355) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!165604 () Bool)

(assert (=> b!197854 (= res!165604 (= (_2!9188 lt!308374) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!197854 (=> (not res!165604) (not e!135825))))

(assert (=> b!197854 e!135825))

(declare-fun lt!308383 () Unit!13973)

(declare-fun Unit!14014 () Unit!13973)

(assert (=> b!197854 (= lt!308383 Unit!14014)))

(declare-fun b!197855 () Bool)

(assert (=> b!197855 (= lt!308386 (readBitPure!0 (readerFrom!0 (_2!9185 lt!308353) (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286)))))))

(declare-fun res!165597 () Bool)

(assert (=> b!197855 (= res!165597 (and (= (_2!9186 lt!308386) lt!308336) (= (_1!9186 lt!308386) (_2!9185 lt!308353))))))

(assert (=> b!197855 (=> (not res!165597) (not e!135823))))

(assert (=> b!197855 (= e!135826 e!135823)))

(declare-fun b!197856 () Bool)

(assert (=> b!197856 (= e!135830 e!135827)))

(declare-fun res!165603 () Bool)

(assert (=> b!197856 (=> (not res!165603) (not e!135827))))

(assert (=> b!197856 (= res!165603 (= (_2!9188 lt!308369) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!197856 (= lt!308369 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308340) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!308359 () Unit!13973)

(declare-fun lt!308380 () Unit!13973)

(assert (=> b!197856 (= lt!308359 lt!308380)))

(assert (=> b!197856 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308356)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308384)))

(assert (=> b!197856 (= lt!308380 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!308356)) lt!308384))))

(assert (=> b!197856 e!135828))

(declare-fun res!165602 () Bool)

(assert (=> b!197856 (=> (not res!165602) (not e!135828))))

(assert (=> b!197856 (= res!165602 (and (= (size!4454 (buf!4940 (_2!9185 lt!307286))) (size!4454 (buf!4940 (_2!9185 lt!308356)))) (bvsge lt!308384 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197856 (= lt!308384 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!197856 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!197856 (= lt!308340 (reader!0 (_2!9185 lt!307286) (_2!9185 lt!308356)))))

(declare-fun d!66751 () Bool)

(assert (=> d!66751 e!135830))

(declare-fun res!165606 () Bool)

(assert (=> d!66751 (=> (not res!165606) (not e!135830))))

(assert (=> d!66751 (= res!165606 (invariant!0 (currentBit!9273 (_2!9185 lt!308356)) (currentByte!9278 (_2!9185 lt!308356)) (size!4454 (buf!4940 (_2!9185 lt!308356)))))))

(assert (=> d!66751 (= lt!308356 e!135824)))

(assert (=> d!66751 (= c!9840 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66751 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66751 (= (appendBitsLSBFirstLoopTR!0 (_2!9185 lt!307286) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!308356)))

(declare-fun b!197857 () Bool)

(declare-fun res!165605 () Bool)

(assert (=> b!197857 (=> (not res!165605) (not e!135830))))

(assert (=> b!197857 (= res!165605 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!308356)))))

(declare-fun b!197858 () Bool)

(assert (=> b!197858 (= e!135831 (= (_2!9186 lt!308390) (_2!9186 lt!308370)))))

(assert (= (and d!66751 c!9840) b!197843))

(assert (= (and d!66751 (not c!9840)) b!197854))

(assert (= (and b!197854 res!165598) b!197847))

(assert (= (and b!197847 res!165600) b!197848))

(assert (= (and b!197848 res!165607) b!197855))

(assert (= (and b!197855 res!165597) b!197851))

(assert (= (and b!197854 res!165601) b!197858))

(assert (= (and b!197854 c!9841) b!197844))

(assert (= (and b!197854 (not c!9841)) b!197846))

(assert (= (and b!197854 res!165604) b!197853))

(assert (= (or b!197843 b!197854) bm!3107))

(assert (= (and d!66751 res!165606) b!197850))

(assert (= (and b!197850 res!165599) b!197845))

(assert (= (and b!197845 res!165608) b!197857))

(assert (= (and b!197857 res!165605) b!197856))

(assert (= (and b!197856 res!165602) b!197852))

(assert (= (and b!197856 res!165603) b!197849))

(declare-fun m!305747 () Bool)

(assert (=> d!66751 m!305747))

(declare-fun m!305749 () Bool)

(assert (=> b!197845 m!305749))

(assert (=> b!197845 m!305047))

(declare-fun m!305751 () Bool)

(assert (=> b!197857 m!305751))

(declare-fun m!305753 () Bool)

(assert (=> b!197848 m!305753))

(declare-fun m!305755 () Bool)

(assert (=> bm!3107 m!305755))

(declare-fun m!305757 () Bool)

(assert (=> b!197847 m!305757))

(assert (=> b!197847 m!305047))

(declare-fun m!305759 () Bool)

(assert (=> b!197851 m!305759))

(assert (=> b!197851 m!305757))

(declare-fun m!305761 () Bool)

(assert (=> b!197854 m!305761))

(declare-fun m!305763 () Bool)

(assert (=> b!197854 m!305763))

(declare-fun m!305765 () Bool)

(assert (=> b!197854 m!305765))

(declare-fun m!305767 () Bool)

(assert (=> b!197854 m!305767))

(declare-fun m!305769 () Bool)

(assert (=> b!197854 m!305769))

(declare-fun m!305771 () Bool)

(assert (=> b!197854 m!305771))

(declare-fun m!305773 () Bool)

(assert (=> b!197854 m!305773))

(declare-fun m!305775 () Bool)

(assert (=> b!197854 m!305775))

(declare-fun m!305777 () Bool)

(assert (=> b!197854 m!305777))

(declare-fun m!305779 () Bool)

(assert (=> b!197854 m!305779))

(declare-fun m!305781 () Bool)

(assert (=> b!197854 m!305781))

(declare-fun m!305783 () Bool)

(assert (=> b!197854 m!305783))

(declare-fun m!305785 () Bool)

(assert (=> b!197854 m!305785))

(declare-fun m!305787 () Bool)

(assert (=> b!197854 m!305787))

(declare-fun m!305789 () Bool)

(assert (=> b!197854 m!305789))

(declare-fun m!305791 () Bool)

(assert (=> b!197854 m!305791))

(declare-fun m!305793 () Bool)

(assert (=> b!197854 m!305793))

(assert (=> b!197854 m!305047))

(declare-fun m!305795 () Bool)

(assert (=> b!197854 m!305795))

(declare-fun m!305797 () Bool)

(assert (=> b!197854 m!305797))

(declare-fun m!305799 () Bool)

(assert (=> b!197854 m!305799))

(declare-fun m!305801 () Bool)

(assert (=> b!197854 m!305801))

(assert (=> b!197854 m!305765))

(declare-fun m!305803 () Bool)

(assert (=> b!197854 m!305803))

(declare-fun m!305805 () Bool)

(assert (=> b!197854 m!305805))

(declare-fun m!305807 () Bool)

(assert (=> b!197854 m!305807))

(declare-fun m!305809 () Bool)

(assert (=> b!197854 m!305809))

(declare-fun m!305811 () Bool)

(assert (=> b!197854 m!305811))

(declare-fun m!305813 () Bool)

(assert (=> b!197854 m!305813))

(declare-fun m!305815 () Bool)

(assert (=> b!197854 m!305815))

(declare-fun m!305817 () Bool)

(assert (=> b!197854 m!305817))

(declare-fun m!305819 () Bool)

(assert (=> b!197854 m!305819))

(declare-fun m!305821 () Bool)

(assert (=> b!197854 m!305821))

(declare-fun m!305823 () Bool)

(assert (=> b!197854 m!305823))

(assert (=> b!197843 m!305355))

(declare-fun m!305825 () Bool)

(assert (=> b!197855 m!305825))

(assert (=> b!197855 m!305825))

(declare-fun m!305827 () Bool)

(assert (=> b!197855 m!305827))

(declare-fun m!305829 () Bool)

(assert (=> b!197856 m!305829))

(assert (=> b!197856 m!305789))

(declare-fun m!305831 () Bool)

(assert (=> b!197856 m!305831))

(assert (=> b!197856 m!305773))

(declare-fun m!305833 () Bool)

(assert (=> b!197856 m!305833))

(declare-fun m!305835 () Bool)

(assert (=> b!197856 m!305835))

(declare-fun m!305837 () Bool)

(assert (=> b!197852 m!305837))

(assert (=> b!197455 d!66751))

(assert (=> b!197454 d!66693))

(declare-fun d!66847 () Bool)

(declare-fun lt!308392 () tuple2!17100)

(assert (=> d!66847 (= lt!308392 (readBit!0 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))))

(assert (=> d!66847 (= (readBitPure!0 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))) (tuple2!17083 (_2!9195 lt!308392) (_1!9195 lt!308392)))))

(declare-fun bs!16586 () Bool)

(assert (= bs!16586 d!66847))

(assert (=> bs!16586 m!305075))

(declare-fun m!305839 () Bool)

(assert (=> bs!16586 m!305839))

(assert (=> b!197443 d!66847))

(declare-fun d!66849 () Bool)

(declare-fun e!135834 () Bool)

(assert (=> d!66849 e!135834))

(declare-fun res!165612 () Bool)

(assert (=> d!66849 (=> (not res!165612) (not e!135834))))

(assert (=> d!66849 (= res!165612 (invariant!0 (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286)) (size!4454 (buf!4940 (_2!9185 lt!307286)))))))

(assert (=> d!66849 (= (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)) (BitStream!8017 (buf!4940 (_2!9185 lt!307286)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))

(declare-fun b!197861 () Bool)

(assert (=> b!197861 (= e!135834 (invariant!0 (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204) (size!4454 (buf!4940 (_2!9185 lt!307286)))))))

(assert (= (and d!66849 res!165612) b!197861))

(assert (=> d!66849 m!305253))

(assert (=> b!197861 m!305113))

(assert (=> b!197443 d!66849))

(declare-fun d!66851 () Bool)

(assert (=> d!66851 (= (invariant!0 (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204) (size!4454 (buf!4940 thiss!1204))) (and (bvsge (currentBit!9273 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9273 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9278 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 thiss!1204) (size!4454 (buf!4940 thiss!1204))) (and (= (currentBit!9273 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9278 thiss!1204) (size!4454 (buf!4940 thiss!1204)))))))))

(assert (=> b!197453 d!66851))

(declare-fun d!66853 () Bool)

(declare-fun res!165615 () Bool)

(declare-fun e!135836 () Bool)

(assert (=> d!66853 (=> (not res!165615) (not e!135836))))

(assert (=> d!66853 (= res!165615 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) (size!4454 (buf!4940 (_2!9185 lt!307308)))))))

(assert (=> d!66853 (= (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!307308)) e!135836)))

(declare-fun b!197862 () Bool)

(declare-fun res!165614 () Bool)

(assert (=> b!197862 (=> (not res!165614) (not e!135836))))

(assert (=> b!197862 (= res!165614 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308)))))))

(declare-fun b!197863 () Bool)

(declare-fun e!135835 () Bool)

(assert (=> b!197863 (= e!135836 e!135835)))

(declare-fun res!165613 () Bool)

(assert (=> b!197863 (=> res!165613 e!135835)))

(assert (=> b!197863 (= res!165613 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) #b00000000000000000000000000000000))))

(declare-fun b!197864 () Bool)

(assert (=> b!197864 (= e!135835 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!307308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (= (and d!66853 res!165615) b!197862))

(assert (= (and b!197862 res!165614) b!197863))

(assert (= (and b!197863 (not res!165613)) b!197864))

(assert (=> b!197862 m!305047))

(assert (=> b!197862 m!305051))

(assert (=> b!197864 m!305047))

(assert (=> b!197864 m!305047))

(declare-fun m!305841 () Bool)

(assert (=> b!197864 m!305841))

(assert (=> b!197452 d!66853))

(assert (=> b!197450 d!66697))

(assert (=> b!197450 d!66699))

(check-sat (not b!197843) (not b!197642) (not d!66715) (not d!66847) (not d!66697) (not b!197615) (not d!66729) (not d!66701) (not d!66751) (not d!66743) (not b!197630) (not d!66733) (not b!197857) (not d!66727) (not d!66735) (not b!197852) (not b!197614) (not b!197845) (not b!197640) (not b!197856) (not d!66699) (not b!197647) (not b!197862) (not b!197594) (not d!66723) (not b!197643) (not b!197592) (not d!66719) (not b!197854) (not b!197628) (not b!197629) (not d!66703) (not b!197848) (not b!197861) (not b!197641) (not d!66709) (not b!197847) (not d!66731) (not b!197649) (not b!197864) (not b!197616) (not b!197631) (not d!66849) (not b!197617) (not d!66713) (not d!66737) (not d!66721) (not d!66695) (not b!197855) (not d!66725) (not d!66749) (not d!66741) (not b!197851) (not d!66745) (not bm!3107))
(check-sat)
(get-model)

(declare-fun d!66855 () Bool)

(assert (=> d!66855 (= (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307286)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286)))) (bvsub (bvmul ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307286)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))))))))

(assert (=> d!66697 d!66855))

(declare-fun d!66857 () Bool)

(assert (=> d!66857 (= (invariant!0 (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286)) (size!4454 (buf!4940 (_2!9185 lt!307286)))) (and (bvsge (currentBit!9273 (_2!9185 lt!307286)) #b00000000000000000000000000000000) (bvslt (currentBit!9273 (_2!9185 lt!307286)) #b00000000000000000000000000001000) (bvsge (currentByte!9278 (_2!9185 lt!307286)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 (_2!9185 lt!307286)) (size!4454 (buf!4940 (_2!9185 lt!307286)))) (and (= (currentBit!9273 (_2!9185 lt!307286)) #b00000000000000000000000000000000) (= (currentByte!9278 (_2!9185 lt!307286)) (size!4454 (buf!4940 (_2!9185 lt!307286))))))))))

(assert (=> d!66697 d!66857))

(declare-fun d!66859 () Bool)

(declare-fun e!135843 () Bool)

(assert (=> d!66859 e!135843))

(declare-fun res!165618 () Bool)

(assert (=> d!66859 (=> (not res!165618) (not e!135843))))

(declare-fun increaseBitIndex!0 (BitStream!8016) tuple2!17080)

(assert (=> d!66859 (= res!165618 (= (buf!4940 (_2!9185 (increaseBitIndex!0 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))) (buf!4940 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))))))

(declare-fun lt!308410 () Bool)

(assert (=> d!66859 (= lt!308410 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))) (currentByte!9278 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308409 () tuple2!17100)

(assert (=> d!66859 (= lt!308409 (tuple2!17101 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))) (currentByte!9278 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9185 (increaseBitIndex!0 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))))))

(assert (=> d!66859 (validate_offset_bit!0 ((_ sign_extend 32) (size!4454 (buf!4940 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))) ((_ sign_extend 32) (currentByte!9278 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))) ((_ sign_extend 32) (currentBit!9273 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))))))

(assert (=> d!66859 (= (readBit!0 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))) lt!308409)))

(declare-fun b!197867 () Bool)

(declare-fun lt!308412 () (_ BitVec 64))

(declare-fun lt!308408 () (_ BitVec 64))

(assert (=> b!197867 (= e!135843 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 (increaseBitIndex!0 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))))) (currentByte!9278 (_2!9185 (increaseBitIndex!0 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))) (currentBit!9273 (_2!9185 (increaseBitIndex!0 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))))) (bvadd lt!308408 lt!308412)))))

(assert (=> b!197867 (or (not (= (bvand lt!308408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308412 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308408 lt!308412) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197867 (= lt!308412 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!197867 (= lt!308408 (bitIndex!0 (size!4454 (buf!4940 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))) (currentByte!9278 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))) (currentBit!9273 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))))))

(declare-fun lt!308413 () Bool)

(assert (=> b!197867 (= lt!308413 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))) (currentByte!9278 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308411 () Bool)

(assert (=> b!197867 (= lt!308411 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))) (currentByte!9278 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308407 () Bool)

(assert (=> b!197867 (= lt!308407 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))) (currentByte!9278 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (readerFrom!0 (_2!9185 lt!307286) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!66859 res!165618) b!197867))

(assert (=> d!66859 m!305075))

(declare-fun m!305843 () Bool)

(assert (=> d!66859 m!305843))

(declare-fun m!305845 () Bool)

(assert (=> d!66859 m!305845))

(declare-fun m!305847 () Bool)

(assert (=> d!66859 m!305847))

(declare-fun m!305849 () Bool)

(assert (=> d!66859 m!305849))

(assert (=> b!197867 m!305075))

(assert (=> b!197867 m!305843))

(declare-fun m!305851 () Bool)

(assert (=> b!197867 m!305851))

(assert (=> b!197867 m!305847))

(assert (=> b!197867 m!305845))

(declare-fun m!305853 () Bool)

(assert (=> b!197867 m!305853))

(assert (=> d!66847 d!66859))

(assert (=> b!197861 d!66717))

(declare-fun d!66861 () Bool)

(declare-fun e!135844 () Bool)

(assert (=> d!66861 e!135844))

(declare-fun res!165620 () Bool)

(assert (=> d!66861 (=> (not res!165620) (not e!135844))))

(declare-fun lt!308417 () (_ BitVec 64))

(declare-fun lt!308414 () (_ BitVec 64))

(declare-fun lt!308415 () (_ BitVec 64))

(assert (=> d!66861 (= res!165620 (= lt!308414 (bvsub lt!308417 lt!308415)))))

(assert (=> d!66861 (or (= (bvand lt!308417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308415 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308417 lt!308415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66861 (= lt!308415 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308356)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308356))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308356)))))))

(declare-fun lt!308416 () (_ BitVec 64))

(declare-fun lt!308419 () (_ BitVec 64))

(assert (=> d!66861 (= lt!308417 (bvmul lt!308416 lt!308419))))

(assert (=> d!66861 (or (= lt!308416 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308419 (bvsdiv (bvmul lt!308416 lt!308419) lt!308416)))))

(assert (=> d!66861 (= lt!308419 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66861 (= lt!308416 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308356)))))))

(assert (=> d!66861 (= lt!308414 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308356))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308356)))))))

(assert (=> d!66861 (invariant!0 (currentBit!9273 (_2!9185 lt!308356)) (currentByte!9278 (_2!9185 lt!308356)) (size!4454 (buf!4940 (_2!9185 lt!308356))))))

(assert (=> d!66861 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308356))) (currentByte!9278 (_2!9185 lt!308356)) (currentBit!9273 (_2!9185 lt!308356))) lt!308414)))

(declare-fun b!197868 () Bool)

(declare-fun res!165619 () Bool)

(assert (=> b!197868 (=> (not res!165619) (not e!135844))))

(assert (=> b!197868 (= res!165619 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308414))))

(declare-fun b!197869 () Bool)

(declare-fun lt!308418 () (_ BitVec 64))

(assert (=> b!197869 (= e!135844 (bvsle lt!308414 (bvmul lt!308418 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197869 (or (= lt!308418 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308418 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308418)))))

(assert (=> b!197869 (= lt!308418 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308356)))))))

(assert (= (and d!66861 res!165620) b!197868))

(assert (= (and b!197868 res!165619) b!197869))

(declare-fun m!305855 () Bool)

(assert (=> d!66861 m!305855))

(assert (=> d!66861 m!305747))

(assert (=> b!197845 d!66861))

(assert (=> b!197845 d!66697))

(declare-fun d!66863 () Bool)

(assert (=> d!66863 (= (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307303)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307303))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307303)))) (bvsub (bvmul ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307303)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307303))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307303))))))))

(assert (=> d!66695 d!66863))

(declare-fun d!66865 () Bool)

(assert (=> d!66865 (= (invariant!0 (currentBit!9273 (_1!9186 lt!307303)) (currentByte!9278 (_1!9186 lt!307303)) (size!4454 (buf!4940 (_1!9186 lt!307303)))) (and (bvsge (currentBit!9273 (_1!9186 lt!307303)) #b00000000000000000000000000000000) (bvslt (currentBit!9273 (_1!9186 lt!307303)) #b00000000000000000000000000001000) (bvsge (currentByte!9278 (_1!9186 lt!307303)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 (_1!9186 lt!307303)) (size!4454 (buf!4940 (_1!9186 lt!307303)))) (and (= (currentBit!9273 (_1!9186 lt!307303)) #b00000000000000000000000000000000) (= (currentByte!9278 (_1!9186 lt!307303)) (size!4454 (buf!4940 (_1!9186 lt!307303))))))))))

(assert (=> d!66695 d!66865))

(declare-fun d!66867 () Bool)

(declare-fun e!135845 () Bool)

(assert (=> d!66867 e!135845))

(declare-fun res!165622 () Bool)

(assert (=> d!66867 (=> (not res!165622) (not e!135845))))

(declare-fun lt!308423 () (_ BitVec 64))

(declare-fun lt!308421 () (_ BitVec 64))

(declare-fun lt!308420 () (_ BitVec 64))

(assert (=> d!66867 (= res!165622 (= lt!308420 (bvsub lt!308423 lt!308421)))))

(assert (=> d!66867 (or (= (bvand lt!308423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308421 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308423 lt!308421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66867 (= lt!308421 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308353)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308353))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308353)))))))

(declare-fun lt!308422 () (_ BitVec 64))

(declare-fun lt!308425 () (_ BitVec 64))

(assert (=> d!66867 (= lt!308423 (bvmul lt!308422 lt!308425))))

(assert (=> d!66867 (or (= lt!308422 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308425 (bvsdiv (bvmul lt!308422 lt!308425) lt!308422)))))

(assert (=> d!66867 (= lt!308425 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66867 (= lt!308422 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308353)))))))

(assert (=> d!66867 (= lt!308420 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308353))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308353)))))))

(assert (=> d!66867 (invariant!0 (currentBit!9273 (_2!9185 lt!308353)) (currentByte!9278 (_2!9185 lt!308353)) (size!4454 (buf!4940 (_2!9185 lt!308353))))))

(assert (=> d!66867 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308353))) (currentByte!9278 (_2!9185 lt!308353)) (currentBit!9273 (_2!9185 lt!308353))) lt!308420)))

(declare-fun b!197870 () Bool)

(declare-fun res!165621 () Bool)

(assert (=> b!197870 (=> (not res!165621) (not e!135845))))

(assert (=> b!197870 (= res!165621 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308420))))

(declare-fun b!197871 () Bool)

(declare-fun lt!308424 () (_ BitVec 64))

(assert (=> b!197871 (= e!135845 (bvsle lt!308420 (bvmul lt!308424 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197871 (or (= lt!308424 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308424 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308424)))))

(assert (=> b!197871 (= lt!308424 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308353)))))))

(assert (= (and d!66867 res!165622) b!197870))

(assert (= (and b!197870 res!165621) b!197871))

(declare-fun m!305857 () Bool)

(assert (=> d!66867 m!305857))

(declare-fun m!305859 () Bool)

(assert (=> d!66867 m!305859))

(assert (=> b!197847 d!66867))

(assert (=> b!197847 d!66697))

(declare-fun d!66869 () Bool)

(declare-fun res!165625 () Bool)

(declare-fun e!135847 () Bool)

(assert (=> d!66869 (=> (not res!165625) (not e!135847))))

(assert (=> d!66869 (= res!165625 (= (size!4454 (buf!4940 (_2!9187 lt!307621))) (size!4454 (buf!4940 (_2!9185 lt!307308)))))))

(assert (=> d!66869 (= (isPrefixOf!0 (_2!9187 lt!307621) (_2!9185 lt!307308)) e!135847)))

(declare-fun b!197872 () Bool)

(declare-fun res!165624 () Bool)

(assert (=> b!197872 (=> (not res!165624) (not e!135847))))

(assert (=> b!197872 (= res!165624 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_2!9187 lt!307621))) (currentByte!9278 (_2!9187 lt!307621)) (currentBit!9273 (_2!9187 lt!307621))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308)))))))

(declare-fun b!197873 () Bool)

(declare-fun e!135846 () Bool)

(assert (=> b!197873 (= e!135847 e!135846)))

(declare-fun res!165623 () Bool)

(assert (=> b!197873 (=> res!165623 e!135846)))

(assert (=> b!197873 (= res!165623 (= (size!4454 (buf!4940 (_2!9187 lt!307621))) #b00000000000000000000000000000000))))

(declare-fun b!197874 () Bool)

(assert (=> b!197874 (= e!135846 (arrayBitRangesEq!0 (buf!4940 (_2!9187 lt!307621)) (buf!4940 (_2!9185 lt!307308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9187 lt!307621))) (currentByte!9278 (_2!9187 lt!307621)) (currentBit!9273 (_2!9187 lt!307621)))))))

(assert (= (and d!66869 res!165625) b!197872))

(assert (= (and b!197872 res!165624) b!197873))

(assert (= (and b!197873 (not res!165623)) b!197874))

(declare-fun m!305861 () Bool)

(assert (=> b!197872 m!305861))

(assert (=> b!197872 m!305051))

(assert (=> b!197874 m!305861))

(assert (=> b!197874 m!305861))

(declare-fun m!305863 () Bool)

(assert (=> b!197874 m!305863))

(assert (=> b!197642 d!66869))

(declare-fun d!66871 () Bool)

(assert (=> d!66871 (= (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 thiss!1204)))))))

(assert (=> d!66699 d!66871))

(assert (=> d!66699 d!66851))

(declare-fun d!66873 () Bool)

(declare-fun e!135848 () Bool)

(assert (=> d!66873 e!135848))

(declare-fun res!165626 () Bool)

(assert (=> d!66873 (=> (not res!165626) (not e!135848))))

(assert (=> d!66873 (= res!165626 (= (buf!4940 (_2!9185 (increaseBitIndex!0 (_1!9187 lt!307301)))) (buf!4940 (_1!9187 lt!307301))))))

(declare-fun lt!308429 () Bool)

(assert (=> d!66873 (= lt!308429 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (_1!9187 lt!307301))) (currentByte!9278 (_1!9187 lt!307301)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (_1!9187 lt!307301))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308428 () tuple2!17100)

(assert (=> d!66873 (= lt!308428 (tuple2!17101 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (_1!9187 lt!307301))) (currentByte!9278 (_1!9187 lt!307301)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (_1!9187 lt!307301))))) #b00000000000000000000000000000000)) (_2!9185 (increaseBitIndex!0 (_1!9187 lt!307301)))))))

(assert (=> d!66873 (validate_offset_bit!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9187 lt!307301)))) ((_ sign_extend 32) (currentByte!9278 (_1!9187 lt!307301))) ((_ sign_extend 32) (currentBit!9273 (_1!9187 lt!307301))))))

(assert (=> d!66873 (= (readBit!0 (_1!9187 lt!307301)) lt!308428)))

(declare-fun b!197875 () Bool)

(declare-fun lt!308427 () (_ BitVec 64))

(declare-fun lt!308431 () (_ BitVec 64))

(assert (=> b!197875 (= e!135848 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 (increaseBitIndex!0 (_1!9187 lt!307301))))) (currentByte!9278 (_2!9185 (increaseBitIndex!0 (_1!9187 lt!307301)))) (currentBit!9273 (_2!9185 (increaseBitIndex!0 (_1!9187 lt!307301))))) (bvadd lt!308427 lt!308431)))))

(assert (=> b!197875 (or (not (= (bvand lt!308427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308431 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308427 lt!308431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197875 (= lt!308431 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!197875 (= lt!308427 (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307301))) (currentByte!9278 (_1!9187 lt!307301)) (currentBit!9273 (_1!9187 lt!307301))))))

(declare-fun lt!308432 () Bool)

(assert (=> b!197875 (= lt!308432 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (_1!9187 lt!307301))) (currentByte!9278 (_1!9187 lt!307301)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (_1!9187 lt!307301))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308430 () Bool)

(assert (=> b!197875 (= lt!308430 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (_1!9187 lt!307301))) (currentByte!9278 (_1!9187 lt!307301)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (_1!9187 lt!307301))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308426 () Bool)

(assert (=> b!197875 (= lt!308426 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (_1!9187 lt!307301))) (currentByte!9278 (_1!9187 lt!307301)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (_1!9187 lt!307301))))) #b00000000000000000000000000000000)))))

(assert (= (and d!66873 res!165626) b!197875))

(declare-fun m!305865 () Bool)

(assert (=> d!66873 m!305865))

(declare-fun m!305867 () Bool)

(assert (=> d!66873 m!305867))

(declare-fun m!305869 () Bool)

(assert (=> d!66873 m!305869))

(declare-fun m!305871 () Bool)

(assert (=> d!66873 m!305871))

(assert (=> b!197875 m!305865))

(declare-fun m!305873 () Bool)

(assert (=> b!197875 m!305873))

(assert (=> b!197875 m!305869))

(assert (=> b!197875 m!305867))

(declare-fun m!305875 () Bool)

(assert (=> b!197875 m!305875))

(assert (=> d!66715 d!66873))

(declare-fun b!197890 () Bool)

(declare-fun e!135865 () Bool)

(declare-fun e!135866 () Bool)

(assert (=> b!197890 (= e!135865 e!135866)))

(declare-fun res!165640 () Bool)

(assert (=> b!197890 (=> (not res!165640) (not e!135866))))

(declare-fun e!135863 () Bool)

(assert (=> b!197890 (= res!165640 e!135863)))

(declare-fun res!165638 () Bool)

(assert (=> b!197890 (=> res!165638 e!135863)))

(declare-datatypes ((tuple4!258 0))(
  ( (tuple4!259 (_1!9199 (_ BitVec 32)) (_2!9199 (_ BitVec 32)) (_3!645 (_ BitVec 32)) (_4!129 (_ BitVec 32))) )
))
(declare-fun lt!308439 () tuple4!258)

(assert (=> b!197890 (= res!165638 (bvsge (_1!9199 lt!308439) (_2!9199 lt!308439)))))

(declare-fun lt!308441 () (_ BitVec 32))

(assert (=> b!197890 (= lt!308441 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!308440 () (_ BitVec 32))

(assert (=> b!197890 (= lt!308440 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!258)

(assert (=> b!197890 (= lt!308439 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(declare-fun bm!3110 () Bool)

(declare-fun c!9844 () Bool)

(declare-fun call!3113 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3110 (= call!3113 (byteRangesEq!0 (ite c!9844 (select (arr!5384 (buf!4940 thiss!1204)) (_3!645 lt!308439)) (select (arr!5384 (buf!4940 thiss!1204)) (_4!129 lt!308439))) (ite c!9844 (select (arr!5384 (buf!4940 (_2!9185 lt!307286))) (_3!645 lt!308439)) (select (arr!5384 (buf!4940 (_2!9185 lt!307286))) (_4!129 lt!308439))) (ite c!9844 lt!308440 #b00000000000000000000000000000000) lt!308441))))

(declare-fun b!197891 () Bool)

(declare-fun res!165641 () Bool)

(assert (=> b!197891 (= res!165641 (= lt!308441 #b00000000000000000000000000000000))))

(declare-fun e!135864 () Bool)

(assert (=> b!197891 (=> res!165641 e!135864)))

(declare-fun e!135861 () Bool)

(assert (=> b!197891 (= e!135861 e!135864)))

(declare-fun b!197892 () Bool)

(declare-fun e!135862 () Bool)

(assert (=> b!197892 (= e!135862 call!3113)))

(declare-fun b!197893 () Bool)

(assert (=> b!197893 (= e!135866 e!135862)))

(assert (=> b!197893 (= c!9844 (= (_3!645 lt!308439) (_4!129 lt!308439)))))

(declare-fun d!66875 () Bool)

(declare-fun res!165637 () Bool)

(assert (=> d!66875 (=> res!165637 e!135865)))

(assert (=> d!66875 (= res!165637 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(assert (=> d!66875 (= (arrayBitRangesEq!0 (buf!4940 thiss!1204) (buf!4940 (_2!9185 lt!307286)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))) e!135865)))

(declare-fun b!197894 () Bool)

(assert (=> b!197894 (= e!135862 e!135861)))

(declare-fun res!165639 () Bool)

(assert (=> b!197894 (= res!165639 (byteRangesEq!0 (select (arr!5384 (buf!4940 thiss!1204)) (_3!645 lt!308439)) (select (arr!5384 (buf!4940 (_2!9185 lt!307286))) (_3!645 lt!308439)) lt!308440 #b00000000000000000000000000001000))))

(assert (=> b!197894 (=> (not res!165639) (not e!135861))))

(declare-fun b!197895 () Bool)

(assert (=> b!197895 (= e!135864 call!3113)))

(declare-fun b!197896 () Bool)

(declare-fun arrayRangesEq!691 (array!10105 array!10105 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!197896 (= e!135863 (arrayRangesEq!691 (buf!4940 thiss!1204) (buf!4940 (_2!9185 lt!307286)) (_1!9199 lt!308439) (_2!9199 lt!308439)))))

(assert (= (and d!66875 (not res!165637)) b!197890))

(assert (= (and b!197890 (not res!165638)) b!197896))

(assert (= (and b!197890 res!165640) b!197893))

(assert (= (and b!197893 c!9844) b!197892))

(assert (= (and b!197893 (not c!9844)) b!197894))

(assert (= (and b!197894 res!165639) b!197891))

(assert (= (and b!197891 (not res!165641)) b!197895))

(assert (= (or b!197892 b!197895) bm!3110))

(assert (=> b!197890 m!305049))

(declare-fun m!305877 () Bool)

(assert (=> b!197890 m!305877))

(declare-fun m!305879 () Bool)

(assert (=> bm!3110 m!305879))

(declare-fun m!305881 () Bool)

(assert (=> bm!3110 m!305881))

(declare-fun m!305883 () Bool)

(assert (=> bm!3110 m!305883))

(declare-fun m!305885 () Bool)

(assert (=> bm!3110 m!305885))

(declare-fun m!305887 () Bool)

(assert (=> bm!3110 m!305887))

(assert (=> b!197894 m!305879))

(assert (=> b!197894 m!305885))

(assert (=> b!197894 m!305879))

(assert (=> b!197894 m!305885))

(declare-fun m!305889 () Bool)

(assert (=> b!197894 m!305889))

(declare-fun m!305891 () Bool)

(assert (=> b!197896 m!305891))

(assert (=> b!197594 d!66875))

(assert (=> b!197594 d!66699))

(declare-fun b!197911 () Bool)

(declare-fun res!165655 () Bool)

(declare-fun e!135873 () Bool)

(assert (=> b!197911 (=> (not res!165655) (not e!135873))))

(declare-fun lt!308456 () tuple2!17102)

(assert (=> b!197911 (= res!165655 (= (bvand (_1!9196 lt!308456) (onesLSBLong!0 nBits!348)) (_1!9196 lt!308456)))))

(declare-fun e!135875 () tuple2!17102)

(declare-fun b!197913 () Bool)

(assert (=> b!197913 (= e!135875 (tuple2!17103 (bvor lt!307309 (ite (_2!9186 lt!307302) lt!307297 #b0000000000000000000000000000000000000000000000000000000000000000)) (_1!9187 lt!307307)))))

(declare-fun b!197914 () Bool)

(declare-fun res!165653 () Bool)

(assert (=> b!197914 (=> (not res!165653) (not e!135873))))

(declare-fun lt!308459 () (_ BitVec 64))

(declare-fun lt!308457 () (_ BitVec 64))

(assert (=> b!197914 (= res!165653 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9196 lt!308456))) (currentByte!9278 (_2!9196 lt!308456)) (currentBit!9273 (_2!9196 lt!308456))) (bvadd lt!308459 lt!308457)))))

(assert (=> b!197914 (or (not (= (bvand lt!308459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308457 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308459 lt!308457) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197914 (= lt!308457 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!197914 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!197914 (= lt!308459 (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307307))) (currentByte!9278 (_1!9187 lt!307307)) (currentBit!9273 (_1!9187 lt!307307))))))

(declare-fun b!197915 () Bool)

(declare-fun res!165656 () Bool)

(assert (=> b!197915 (=> (not res!165656) (not e!135873))))

(assert (=> b!197915 (= res!165656 (= (bvand (_1!9196 lt!308456) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand (bvor lt!307309 (ite (_2!9186 lt!307302) lt!307297 #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!197912 () Bool)

(declare-fun lt!308454 () tuple2!17102)

(assert (=> b!197912 (= e!135875 (tuple2!17103 (_1!9196 lt!308454) (_2!9196 lt!308454)))))

(declare-fun lt!308458 () tuple2!17100)

(assert (=> b!197912 (= lt!308458 (readBit!0 (_1!9187 lt!307307)))))

(assert (=> b!197912 (= lt!308454 (readNBitsLSBFirstsLoop!0 (_2!9195 lt!308458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor (bvor lt!307309 (ite (_2!9186 lt!307302) lt!307297 #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!9195 lt!308458) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!66877 () Bool)

(assert (=> d!66877 e!135873))

(declare-fun res!165654 () Bool)

(assert (=> d!66877 (=> (not res!165654) (not e!135873))))

(assert (=> d!66877 (= res!165654 (= (buf!4940 (_2!9196 lt!308456)) (buf!4940 (_1!9187 lt!307307))))))

(assert (=> d!66877 (= lt!308456 e!135875)))

(declare-fun c!9847 () Bool)

(assert (=> d!66877 (= c!9847 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!66877 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66877 (= (readNBitsLSBFirstsLoop!0 (_1!9187 lt!307307) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307309 (ite (_2!9186 lt!307302) lt!307297 #b0000000000000000000000000000000000000000000000000000000000000000))) lt!308456)))

(declare-fun b!197916 () Bool)

(declare-fun e!135874 () Bool)

(assert (=> b!197916 (= e!135873 e!135874)))

(declare-fun res!165652 () Bool)

(assert (=> b!197916 (=> res!165652 e!135874)))

(assert (=> b!197916 (= res!165652 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!197917 () Bool)

(declare-fun lt!308455 () (_ BitVec 64))

(assert (=> b!197917 (= e!135874 (= (= (bvand (bvlshr (_1!9196 lt!308456) lt!308455) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9186 (readBitPure!0 (_1!9187 lt!307307)))))))

(assert (=> b!197917 (and (bvsge lt!308455 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!308455 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!197917 (= lt!308455 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and d!66877 c!9847) b!197913))

(assert (= (and d!66877 (not c!9847)) b!197912))

(assert (= (and d!66877 res!165654) b!197914))

(assert (= (and b!197914 res!165653) b!197915))

(assert (= (and b!197915 res!165656) b!197911))

(assert (= (and b!197911 res!165655) b!197916))

(assert (= (and b!197916 (not res!165652)) b!197917))

(declare-fun m!305893 () Bool)

(assert (=> b!197914 m!305893))

(declare-fun m!305895 () Bool)

(assert (=> b!197914 m!305895))

(assert (=> b!197915 m!305773))

(declare-fun m!305897 () Bool)

(assert (=> b!197912 m!305897))

(declare-fun m!305899 () Bool)

(assert (=> b!197912 m!305899))

(declare-fun m!305901 () Bool)

(assert (=> b!197917 m!305901))

(assert (=> b!197911 m!305789))

(assert (=> d!66741 d!66877))

(declare-fun d!66879 () Bool)

(declare-fun e!135876 () Bool)

(assert (=> d!66879 e!135876))

(declare-fun res!165658 () Bool)

(assert (=> d!66879 (=> (not res!165658) (not e!135876))))

(declare-fun lt!308463 () (_ BitVec 64))

(declare-fun lt!308461 () (_ BitVec 64))

(declare-fun lt!308460 () (_ BitVec 64))

(assert (=> d!66879 (= res!165658 (= lt!308460 (bvsub lt!308463 lt!308461)))))

(assert (=> d!66879 (or (= (bvand lt!308463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308461 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308463 lt!308461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66879 (= lt!308461 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307522)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307522))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307522)))))))

(declare-fun lt!308462 () (_ BitVec 64))

(declare-fun lt!308465 () (_ BitVec 64))

(assert (=> d!66879 (= lt!308463 (bvmul lt!308462 lt!308465))))

(assert (=> d!66879 (or (= lt!308462 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308465 (bvsdiv (bvmul lt!308462 lt!308465) lt!308462)))))

(assert (=> d!66879 (= lt!308465 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66879 (= lt!308462 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307522)))))))

(assert (=> d!66879 (= lt!308460 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307522))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307522)))))))

(assert (=> d!66879 (invariant!0 (currentBit!9273 (_1!9186 lt!307522)) (currentByte!9278 (_1!9186 lt!307522)) (size!4454 (buf!4940 (_1!9186 lt!307522))))))

(assert (=> d!66879 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307522))) (currentByte!9278 (_1!9186 lt!307522)) (currentBit!9273 (_1!9186 lt!307522))) lt!308460)))

(declare-fun b!197918 () Bool)

(declare-fun res!165657 () Bool)

(assert (=> b!197918 (=> (not res!165657) (not e!135876))))

(assert (=> b!197918 (= res!165657 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308460))))

(declare-fun b!197919 () Bool)

(declare-fun lt!308464 () (_ BitVec 64))

(assert (=> b!197919 (= e!135876 (bvsle lt!308460 (bvmul lt!308464 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197919 (or (= lt!308464 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308464 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308464)))))

(assert (=> b!197919 (= lt!308464 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307522)))))))

(assert (= (and d!66879 res!165658) b!197918))

(assert (= (and b!197918 res!165657) b!197919))

(declare-fun m!305903 () Bool)

(assert (=> d!66879 m!305903))

(declare-fun m!305905 () Bool)

(assert (=> d!66879 m!305905))

(assert (=> b!197617 d!66879))

(declare-fun d!66881 () Bool)

(declare-fun e!135877 () Bool)

(assert (=> d!66881 e!135877))

(declare-fun res!165660 () Bool)

(assert (=> d!66881 (=> (not res!165660) (not e!135877))))

(declare-fun lt!308467 () (_ BitVec 64))

(declare-fun lt!308466 () (_ BitVec 64))

(declare-fun lt!308469 () (_ BitVec 64))

(assert (=> d!66881 (= res!165660 (= lt!308466 (bvsub lt!308469 lt!308467)))))

(assert (=> d!66881 (or (= (bvand lt!308469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308469 lt!308467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66881 (= lt!308467 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307519)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307519))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307519)))))))

(declare-fun lt!308468 () (_ BitVec 64))

(declare-fun lt!308471 () (_ BitVec 64))

(assert (=> d!66881 (= lt!308469 (bvmul lt!308468 lt!308471))))

(assert (=> d!66881 (or (= lt!308468 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308471 (bvsdiv (bvmul lt!308468 lt!308471) lt!308468)))))

(assert (=> d!66881 (= lt!308471 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66881 (= lt!308468 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307519)))))))

(assert (=> d!66881 (= lt!308466 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307519))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307519)))))))

(assert (=> d!66881 (invariant!0 (currentBit!9273 (_2!9185 lt!307519)) (currentByte!9278 (_2!9185 lt!307519)) (size!4454 (buf!4940 (_2!9185 lt!307519))))))

(assert (=> d!66881 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307519))) (currentByte!9278 (_2!9185 lt!307519)) (currentBit!9273 (_2!9185 lt!307519))) lt!308466)))

(declare-fun b!197920 () Bool)

(declare-fun res!165659 () Bool)

(assert (=> b!197920 (=> (not res!165659) (not e!135877))))

(assert (=> b!197920 (= res!165659 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308466))))

(declare-fun b!197921 () Bool)

(declare-fun lt!308470 () (_ BitVec 64))

(assert (=> b!197921 (= e!135877 (bvsle lt!308466 (bvmul lt!308470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197921 (or (= lt!308470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308470)))))

(assert (=> b!197921 (= lt!308470 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307519)))))))

(assert (= (and d!66881 res!165660) b!197920))

(assert (= (and b!197920 res!165659) b!197921))

(declare-fun m!305907 () Bool)

(assert (=> d!66881 m!305907))

(declare-fun m!305909 () Bool)

(assert (=> d!66881 m!305909))

(assert (=> b!197617 d!66881))

(assert (=> b!197592 d!66699))

(assert (=> b!197592 d!66697))

(declare-fun d!66883 () Bool)

(declare-fun res!165663 () Bool)

(declare-fun e!135879 () Bool)

(assert (=> d!66883 (=> (not res!165663) (not e!135879))))

(assert (=> d!66883 (= res!165663 (= (size!4454 (buf!4940 (_1!9187 lt!307621))) (size!4454 (buf!4940 (_2!9185 lt!307286)))))))

(assert (=> d!66883 (= (isPrefixOf!0 (_1!9187 lt!307621) (_2!9185 lt!307286)) e!135879)))

(declare-fun b!197922 () Bool)

(declare-fun res!165662 () Bool)

(assert (=> b!197922 (=> (not res!165662) (not e!135879))))

(assert (=> b!197922 (= res!165662 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307621))) (currentByte!9278 (_1!9187 lt!307621)) (currentBit!9273 (_1!9187 lt!307621))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(declare-fun b!197923 () Bool)

(declare-fun e!135878 () Bool)

(assert (=> b!197923 (= e!135879 e!135878)))

(declare-fun res!165661 () Bool)

(assert (=> b!197923 (=> res!165661 e!135878)))

(assert (=> b!197923 (= res!165661 (= (size!4454 (buf!4940 (_1!9187 lt!307621))) #b00000000000000000000000000000000))))

(declare-fun b!197924 () Bool)

(assert (=> b!197924 (= e!135878 (arrayBitRangesEq!0 (buf!4940 (_1!9187 lt!307621)) (buf!4940 (_2!9185 lt!307286)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307621))) (currentByte!9278 (_1!9187 lt!307621)) (currentBit!9273 (_1!9187 lt!307621)))))))

(assert (= (and d!66883 res!165663) b!197922))

(assert (= (and b!197922 res!165662) b!197923))

(assert (= (and b!197923 (not res!165661)) b!197924))

(declare-fun m!305911 () Bool)

(assert (=> b!197922 m!305911))

(assert (=> b!197922 m!305047))

(assert (=> b!197924 m!305911))

(assert (=> b!197924 m!305911))

(declare-fun m!305913 () Bool)

(assert (=> b!197924 m!305913))

(assert (=> b!197640 d!66883))

(declare-fun d!66885 () Bool)

(declare-fun res!165666 () Bool)

(declare-fun e!135881 () Bool)

(assert (=> d!66885 (=> (not res!165666) (not e!135881))))

(assert (=> d!66885 (= res!165666 (= (size!4454 (buf!4940 thiss!1204)) (size!4454 (buf!4940 (_2!9185 lt!307519)))))))

(assert (=> d!66885 (= (isPrefixOf!0 thiss!1204 (_2!9185 lt!307519)) e!135881)))

(declare-fun b!197925 () Bool)

(declare-fun res!165665 () Bool)

(assert (=> b!197925 (=> (not res!165665) (not e!135881))))

(assert (=> b!197925 (= res!165665 (bvsle (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307519))) (currentByte!9278 (_2!9185 lt!307519)) (currentBit!9273 (_2!9185 lt!307519)))))))

(declare-fun b!197926 () Bool)

(declare-fun e!135880 () Bool)

(assert (=> b!197926 (= e!135881 e!135880)))

(declare-fun res!165664 () Bool)

(assert (=> b!197926 (=> res!165664 e!135880)))

(assert (=> b!197926 (= res!165664 (= (size!4454 (buf!4940 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197927 () Bool)

(assert (=> b!197927 (= e!135880 (arrayBitRangesEq!0 (buf!4940 thiss!1204) (buf!4940 (_2!9185 lt!307519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(assert (= (and d!66885 res!165666) b!197925))

(assert (= (and b!197925 res!165665) b!197926))

(assert (= (and b!197926 (not res!165664)) b!197927))

(assert (=> b!197925 m!305049))

(assert (=> b!197925 m!305261))

(assert (=> b!197927 m!305049))

(assert (=> b!197927 m!305049))

(declare-fun m!305915 () Bool)

(assert (=> b!197927 m!305915))

(assert (=> b!197615 d!66885))

(assert (=> d!66727 d!66737))

(declare-fun d!66887 () Bool)

(assert (=> d!66887 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!307288)))

(assert (=> d!66887 true))

(declare-fun _$6!363 () Unit!13973)

(assert (=> d!66887 (= (choose!9 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!307308)) lt!307288 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))) _$6!363)))

(declare-fun bs!16587 () Bool)

(assert (= bs!16587 d!66887))

(assert (=> bs!16587 m!305101))

(assert (=> d!66727 d!66887))

(declare-fun b!197939 () Bool)

(declare-fun e!135893 () Bool)

(declare-fun e!135890 () Bool)

(assert (=> b!197939 (= e!135893 e!135890)))

(declare-fun res!165675 () Bool)

(assert (=> b!197939 (=> (not res!165675) (not e!135890))))

(declare-fun _$19!153 () tuple2!17080)

(declare-fun lt!308474 () tuple2!17082)

(assert (=> b!197939 (= res!165675 (and (= (_2!9186 lt!308474) lt!307300) (= (_1!9186 lt!308474) (_2!9185 _$19!153))))))

(assert (=> b!197939 (= lt!308474 (readBitPure!0 (readerFrom!0 (_2!9185 _$19!153) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))))

(declare-fun b!197940 () Bool)

(declare-fun res!165678 () Bool)

(assert (=> b!197940 (=> (not res!165678) (not e!135893))))

(assert (=> b!197940 (= res!165678 (isPrefixOf!0 thiss!1204 (_2!9185 _$19!153)))))

(declare-fun b!197941 () Bool)

(declare-fun res!165677 () Bool)

(assert (=> b!197941 (=> (not res!165677) (not e!135893))))

(assert (=> b!197941 (= res!165677 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 _$19!153))) (currentByte!9278 (_2!9185 _$19!153)) (currentBit!9273 (_2!9185 _$19!153))) (bvadd (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!66889 () Bool)

(assert (=> d!66889 e!135893))

(declare-fun res!165676 () Bool)

(assert (=> d!66889 (=> (not res!165676) (not e!135893))))

(assert (=> d!66889 (= res!165676 (= (size!4454 (buf!4940 thiss!1204)) (size!4454 (buf!4940 (_2!9185 _$19!153)))))))

(declare-fun e!135892 () Bool)

(assert (=> d!66889 (and (inv!12 (_2!9185 _$19!153)) e!135892)))

(assert (=> d!66889 (= (choose!16 thiss!1204 lt!307300) _$19!153)))

(declare-fun b!197942 () Bool)

(assert (=> b!197942 (= e!135892 (array_inv!4195 (buf!4940 (_2!9185 _$19!153))))))

(declare-fun b!197943 () Bool)

(assert (=> b!197943 (= e!135890 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308474))) (currentByte!9278 (_1!9186 lt!308474)) (currentBit!9273 (_1!9186 lt!308474))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 _$19!153))) (currentByte!9278 (_2!9185 _$19!153)) (currentBit!9273 (_2!9185 _$19!153)))))))

(assert (= d!66889 b!197942))

(assert (= (and d!66889 res!165676) b!197941))

(assert (= (and b!197941 res!165677) b!197940))

(assert (= (and b!197940 res!165678) b!197939))

(assert (= (and b!197939 res!165675) b!197943))

(declare-fun m!305917 () Bool)

(assert (=> b!197942 m!305917))

(declare-fun m!305919 () Bool)

(assert (=> d!66889 m!305919))

(declare-fun m!305921 () Bool)

(assert (=> b!197940 m!305921))

(declare-fun m!305923 () Bool)

(assert (=> b!197939 m!305923))

(assert (=> b!197939 m!305923))

(declare-fun m!305925 () Bool)

(assert (=> b!197939 m!305925))

(declare-fun m!305927 () Bool)

(assert (=> b!197943 m!305927))

(declare-fun m!305929 () Bool)

(assert (=> b!197943 m!305929))

(assert (=> b!197941 m!305929))

(assert (=> b!197941 m!305049))

(assert (=> d!66701 d!66889))

(declare-fun d!66891 () Bool)

(assert (=> d!66891 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 thiss!1204))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!16588 () Bool)

(assert (= bs!16588 d!66891))

(assert (=> bs!16588 m!305255))

(assert (=> d!66701 d!66891))

(declare-fun d!66893 () Bool)

(assert (=> d!66893 (= (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 thiss!1204)))))))

(assert (=> d!66719 d!66893))

(declare-fun lt!308475 () tuple2!17102)

(declare-fun d!66895 () Bool)

(assert (=> d!66895 (= lt!308475 (readNBitsLSBFirstsLoop!0 (_1!9187 lt!308340) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!66895 (= (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308340) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17087 (_2!9196 lt!308475) (_1!9196 lt!308475)))))

(declare-fun bs!16589 () Bool)

(assert (= bs!16589 d!66895))

(declare-fun m!305931 () Bool)

(assert (=> bs!16589 m!305931))

(assert (=> b!197856 d!66895))

(declare-fun d!66897 () Bool)

(assert (=> d!66897 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> b!197856 d!66897))

(declare-fun d!66899 () Bool)

(assert (=> d!66899 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308356)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308384)))

(declare-fun lt!308476 () Unit!13973)

(assert (=> d!66899 (= lt!308476 (choose!9 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!308356)) lt!308384 (BitStream!8017 (buf!4940 (_2!9185 lt!308356)) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (=> d!66899 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!308356)) lt!308384) lt!308476)))

(declare-fun bs!16590 () Bool)

(assert (= bs!16590 d!66899))

(assert (=> bs!16590 m!305835))

(declare-fun m!305933 () Bool)

(assert (=> bs!16590 m!305933))

(assert (=> b!197856 d!66899))

(declare-fun d!66901 () Bool)

(assert (=> d!66901 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!197856 d!66901))

(declare-fun d!66903 () Bool)

(assert (=> d!66903 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308356)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308384) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308356)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286)))) lt!308384))))

(declare-fun bs!16591 () Bool)

(assert (= bs!16591 d!66903))

(declare-fun m!305935 () Bool)

(assert (=> bs!16591 m!305935))

(assert (=> b!197856 d!66903))

(declare-fun b!197944 () Bool)

(declare-fun res!165680 () Bool)

(declare-fun e!135894 () Bool)

(assert (=> b!197944 (=> (not res!165680) (not e!135894))))

(declare-fun lt!308482 () tuple2!17084)

(assert (=> b!197944 (= res!165680 (isPrefixOf!0 (_1!9187 lt!308482) (_2!9185 lt!307286)))))

(declare-fun d!66905 () Bool)

(assert (=> d!66905 e!135894))

(declare-fun res!165681 () Bool)

(assert (=> d!66905 (=> (not res!165681) (not e!135894))))

(assert (=> d!66905 (= res!165681 (isPrefixOf!0 (_1!9187 lt!308482) (_2!9187 lt!308482)))))

(declare-fun lt!308493 () BitStream!8016)

(assert (=> d!66905 (= lt!308482 (tuple2!17085 lt!308493 (_2!9185 lt!308356)))))

(declare-fun lt!308491 () Unit!13973)

(declare-fun lt!308484 () Unit!13973)

(assert (=> d!66905 (= lt!308491 lt!308484)))

(assert (=> d!66905 (isPrefixOf!0 lt!308493 (_2!9185 lt!308356))))

(assert (=> d!66905 (= lt!308484 (lemmaIsPrefixTransitive!0 lt!308493 (_2!9185 lt!308356) (_2!9185 lt!308356)))))

(declare-fun lt!308486 () Unit!13973)

(declare-fun lt!308489 () Unit!13973)

(assert (=> d!66905 (= lt!308486 lt!308489)))

(assert (=> d!66905 (isPrefixOf!0 lt!308493 (_2!9185 lt!308356))))

(assert (=> d!66905 (= lt!308489 (lemmaIsPrefixTransitive!0 lt!308493 (_2!9185 lt!307286) (_2!9185 lt!308356)))))

(declare-fun lt!308494 () Unit!13973)

(declare-fun e!135895 () Unit!13973)

(assert (=> d!66905 (= lt!308494 e!135895)))

(declare-fun c!9848 () Bool)

(assert (=> d!66905 (= c!9848 (not (= (size!4454 (buf!4940 (_2!9185 lt!307286))) #b00000000000000000000000000000000)))))

(declare-fun lt!308485 () Unit!13973)

(declare-fun lt!308490 () Unit!13973)

(assert (=> d!66905 (= lt!308485 lt!308490)))

(assert (=> d!66905 (isPrefixOf!0 (_2!9185 lt!308356) (_2!9185 lt!308356))))

(assert (=> d!66905 (= lt!308490 (lemmaIsPrefixRefl!0 (_2!9185 lt!308356)))))

(declare-fun lt!308480 () Unit!13973)

(declare-fun lt!308477 () Unit!13973)

(assert (=> d!66905 (= lt!308480 lt!308477)))

(assert (=> d!66905 (= lt!308477 (lemmaIsPrefixRefl!0 (_2!9185 lt!308356)))))

(declare-fun lt!308496 () Unit!13973)

(declare-fun lt!308487 () Unit!13973)

(assert (=> d!66905 (= lt!308496 lt!308487)))

(assert (=> d!66905 (isPrefixOf!0 lt!308493 lt!308493)))

(assert (=> d!66905 (= lt!308487 (lemmaIsPrefixRefl!0 lt!308493))))

(declare-fun lt!308492 () Unit!13973)

(declare-fun lt!308481 () Unit!13973)

(assert (=> d!66905 (= lt!308492 lt!308481)))

(assert (=> d!66905 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!307286))))

(assert (=> d!66905 (= lt!308481 (lemmaIsPrefixRefl!0 (_2!9185 lt!307286)))))

(assert (=> d!66905 (= lt!308493 (BitStream!8017 (buf!4940 (_2!9185 lt!308356)) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(assert (=> d!66905 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!308356))))

(assert (=> d!66905 (= (reader!0 (_2!9185 lt!307286) (_2!9185 lt!308356)) lt!308482)))

(declare-fun b!197945 () Bool)

(declare-fun lt!308479 () Unit!13973)

(assert (=> b!197945 (= e!135895 lt!308479)))

(declare-fun lt!308483 () (_ BitVec 64))

(assert (=> b!197945 (= lt!308483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!308495 () (_ BitVec 64))

(assert (=> b!197945 (= lt!308495 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(assert (=> b!197945 (= lt!308479 (arrayBitRangesEqSymmetric!0 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!308356)) lt!308483 lt!308495))))

(assert (=> b!197945 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!308356)) (buf!4940 (_2!9185 lt!307286)) lt!308483 lt!308495)))

(declare-fun b!197946 () Bool)

(declare-fun res!165679 () Bool)

(assert (=> b!197946 (=> (not res!165679) (not e!135894))))

(assert (=> b!197946 (= res!165679 (isPrefixOf!0 (_2!9187 lt!308482) (_2!9185 lt!308356)))))

(declare-fun lt!308478 () (_ BitVec 64))

(declare-fun lt!308488 () (_ BitVec 64))

(declare-fun b!197947 () Bool)

(assert (=> b!197947 (= e!135894 (= (_1!9187 lt!308482) (withMovedBitIndex!0 (_2!9187 lt!308482) (bvsub lt!308488 lt!308478))))))

(assert (=> b!197947 (or (= (bvand lt!308488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308478 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308488 lt!308478) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197947 (= lt!308478 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308356))) (currentByte!9278 (_2!9185 lt!308356)) (currentBit!9273 (_2!9185 lt!308356))))))

(assert (=> b!197947 (= lt!308488 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(declare-fun b!197948 () Bool)

(declare-fun Unit!14016 () Unit!13973)

(assert (=> b!197948 (= e!135895 Unit!14016)))

(assert (= (and d!66905 c!9848) b!197945))

(assert (= (and d!66905 (not c!9848)) b!197948))

(assert (= (and d!66905 res!165681) b!197944))

(assert (= (and b!197944 res!165680) b!197946))

(assert (= (and b!197946 res!165679) b!197947))

(declare-fun m!305937 () Bool)

(assert (=> b!197946 m!305937))

(declare-fun m!305939 () Bool)

(assert (=> b!197944 m!305939))

(declare-fun m!305941 () Bool)

(assert (=> b!197947 m!305941))

(assert (=> b!197947 m!305749))

(assert (=> b!197947 m!305047))

(assert (=> b!197945 m!305047))

(declare-fun m!305943 () Bool)

(assert (=> b!197945 m!305943))

(declare-fun m!305945 () Bool)

(assert (=> b!197945 m!305945))

(declare-fun m!305947 () Bool)

(assert (=> d!66905 m!305947))

(declare-fun m!305949 () Bool)

(assert (=> d!66905 m!305949))

(declare-fun m!305951 () Bool)

(assert (=> d!66905 m!305951))

(assert (=> d!66905 m!305345))

(declare-fun m!305953 () Bool)

(assert (=> d!66905 m!305953))

(declare-fun m!305955 () Bool)

(assert (=> d!66905 m!305955))

(declare-fun m!305957 () Bool)

(assert (=> d!66905 m!305957))

(declare-fun m!305959 () Bool)

(assert (=> d!66905 m!305959))

(assert (=> d!66905 m!305355))

(declare-fun m!305961 () Bool)

(assert (=> d!66905 m!305961))

(assert (=> d!66905 m!305751))

(assert (=> b!197856 d!66905))

(declare-fun d!66907 () Bool)

(declare-fun res!165684 () Bool)

(declare-fun e!135897 () Bool)

(assert (=> d!66907 (=> (not res!165684) (not e!135897))))

(assert (=> d!66907 (= res!165684 (= (size!4454 (buf!4940 lt!307632)) (size!4454 (buf!4940 lt!307632))))))

(assert (=> d!66907 (= (isPrefixOf!0 lt!307632 lt!307632) e!135897)))

(declare-fun b!197949 () Bool)

(declare-fun res!165683 () Bool)

(assert (=> b!197949 (=> (not res!165683) (not e!135897))))

(assert (=> b!197949 (= res!165683 (bvsle (bitIndex!0 (size!4454 (buf!4940 lt!307632)) (currentByte!9278 lt!307632) (currentBit!9273 lt!307632)) (bitIndex!0 (size!4454 (buf!4940 lt!307632)) (currentByte!9278 lt!307632) (currentBit!9273 lt!307632))))))

(declare-fun b!197950 () Bool)

(declare-fun e!135896 () Bool)

(assert (=> b!197950 (= e!135897 e!135896)))

(declare-fun res!165682 () Bool)

(assert (=> b!197950 (=> res!165682 e!135896)))

(assert (=> b!197950 (= res!165682 (= (size!4454 (buf!4940 lt!307632)) #b00000000000000000000000000000000))))

(declare-fun b!197951 () Bool)

(assert (=> b!197951 (= e!135896 (arrayBitRangesEq!0 (buf!4940 lt!307632) (buf!4940 lt!307632) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 lt!307632)) (currentByte!9278 lt!307632) (currentBit!9273 lt!307632))))))

(assert (= (and d!66907 res!165684) b!197949))

(assert (= (and b!197949 res!165683) b!197950))

(assert (= (and b!197950 (not res!165682)) b!197951))

(declare-fun m!305963 () Bool)

(assert (=> b!197949 m!305963))

(assert (=> b!197949 m!305963))

(assert (=> b!197951 m!305963))

(assert (=> b!197951 m!305963))

(declare-fun m!305965 () Bool)

(assert (=> b!197951 m!305965))

(assert (=> d!66735 d!66907))

(declare-fun d!66909 () Bool)

(assert (=> d!66909 (isPrefixOf!0 lt!307632 (_2!9185 lt!307308))))

(declare-fun lt!308497 () Unit!13973)

(assert (=> d!66909 (= lt!308497 (choose!30 lt!307632 (_2!9185 lt!307308) (_2!9185 lt!307308)))))

(assert (=> d!66909 (isPrefixOf!0 lt!307632 (_2!9185 lt!307308))))

(assert (=> d!66909 (= (lemmaIsPrefixTransitive!0 lt!307632 (_2!9185 lt!307308) (_2!9185 lt!307308)) lt!308497)))

(declare-fun bs!16592 () Bool)

(assert (= bs!16592 d!66909))

(assert (=> bs!16592 m!305353))

(declare-fun m!305967 () Bool)

(assert (=> bs!16592 m!305967))

(assert (=> bs!16592 m!305353))

(assert (=> d!66735 d!66909))

(declare-fun d!66911 () Bool)

(assert (=> d!66911 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!307286))))

(declare-fun lt!308500 () Unit!13973)

(declare-fun choose!11 (BitStream!8016) Unit!13973)

(assert (=> d!66911 (= lt!308500 (choose!11 (_2!9185 lt!307286)))))

(assert (=> d!66911 (= (lemmaIsPrefixRefl!0 (_2!9185 lt!307286)) lt!308500)))

(declare-fun bs!16594 () Bool)

(assert (= bs!16594 d!66911))

(assert (=> bs!16594 m!305345))

(declare-fun m!305969 () Bool)

(assert (=> bs!16594 m!305969))

(assert (=> d!66735 d!66911))

(declare-fun d!66913 () Bool)

(declare-fun res!165687 () Bool)

(declare-fun e!135899 () Bool)

(assert (=> d!66913 (=> (not res!165687) (not e!135899))))

(assert (=> d!66913 (= res!165687 (= (size!4454 (buf!4940 (_2!9185 lt!307308))) (size!4454 (buf!4940 (_2!9185 lt!307308)))))))

(assert (=> d!66913 (= (isPrefixOf!0 (_2!9185 lt!307308) (_2!9185 lt!307308)) e!135899)))

(declare-fun b!197952 () Bool)

(declare-fun res!165686 () Bool)

(assert (=> b!197952 (=> (not res!165686) (not e!135899))))

(assert (=> b!197952 (= res!165686 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308)))))))

(declare-fun b!197953 () Bool)

(declare-fun e!135898 () Bool)

(assert (=> b!197953 (= e!135899 e!135898)))

(declare-fun res!165685 () Bool)

(assert (=> b!197953 (=> res!165685 e!135898)))

(assert (=> b!197953 (= res!165685 (= (size!4454 (buf!4940 (_2!9185 lt!307308))) #b00000000000000000000000000000000))))

(declare-fun b!197954 () Bool)

(assert (=> b!197954 (= e!135898 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307308)) (buf!4940 (_2!9185 lt!307308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308)))))))

(assert (= (and d!66913 res!165687) b!197952))

(assert (= (and b!197952 res!165686) b!197953))

(assert (= (and b!197953 (not res!165685)) b!197954))

(assert (=> b!197952 m!305051))

(assert (=> b!197952 m!305051))

(assert (=> b!197954 m!305051))

(assert (=> b!197954 m!305051))

(declare-fun m!305971 () Bool)

(assert (=> b!197954 m!305971))

(assert (=> d!66735 d!66913))

(assert (=> d!66735 d!66853))

(declare-fun d!66915 () Bool)

(declare-fun res!165690 () Bool)

(declare-fun e!135901 () Bool)

(assert (=> d!66915 (=> (not res!165690) (not e!135901))))

(assert (=> d!66915 (= res!165690 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) (size!4454 (buf!4940 (_2!9185 lt!307286)))))))

(assert (=> d!66915 (= (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!307286)) e!135901)))

(declare-fun b!197955 () Bool)

(declare-fun res!165689 () Bool)

(assert (=> b!197955 (=> (not res!165689) (not e!135901))))

(assert (=> b!197955 (= res!165689 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(declare-fun b!197956 () Bool)

(declare-fun e!135900 () Bool)

(assert (=> b!197956 (= e!135901 e!135900)))

(declare-fun res!165688 () Bool)

(assert (=> b!197956 (=> res!165688 e!135900)))

(assert (=> b!197956 (= res!165688 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) #b00000000000000000000000000000000))))

(declare-fun b!197957 () Bool)

(assert (=> b!197957 (= e!135900 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!307286)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (= (and d!66915 res!165690) b!197955))

(assert (= (and b!197955 res!165689) b!197956))

(assert (= (and b!197956 (not res!165688)) b!197957))

(assert (=> b!197955 m!305047))

(assert (=> b!197955 m!305047))

(assert (=> b!197957 m!305047))

(assert (=> b!197957 m!305047))

(declare-fun m!305973 () Bool)

(assert (=> b!197957 m!305973))

(assert (=> d!66735 d!66915))

(declare-fun d!66917 () Bool)

(assert (=> d!66917 (isPrefixOf!0 (_2!9185 lt!307308) (_2!9185 lt!307308))))

(declare-fun lt!308501 () Unit!13973)

(assert (=> d!66917 (= lt!308501 (choose!11 (_2!9185 lt!307308)))))

(assert (=> d!66917 (= (lemmaIsPrefixRefl!0 (_2!9185 lt!307308)) lt!308501)))

(declare-fun bs!16595 () Bool)

(assert (= bs!16595 d!66917))

(assert (=> bs!16595 m!305299))

(declare-fun m!305975 () Bool)

(assert (=> bs!16595 m!305975))

(assert (=> d!66735 d!66917))

(declare-fun d!66919 () Bool)

(declare-fun res!165693 () Bool)

(declare-fun e!135903 () Bool)

(assert (=> d!66919 (=> (not res!165693) (not e!135903))))

(assert (=> d!66919 (= res!165693 (= (size!4454 (buf!4940 lt!307632)) (size!4454 (buf!4940 (_2!9185 lt!307308)))))))

(assert (=> d!66919 (= (isPrefixOf!0 lt!307632 (_2!9185 lt!307308)) e!135903)))

(declare-fun b!197958 () Bool)

(declare-fun res!165692 () Bool)

(assert (=> b!197958 (=> (not res!165692) (not e!135903))))

(assert (=> b!197958 (= res!165692 (bvsle (bitIndex!0 (size!4454 (buf!4940 lt!307632)) (currentByte!9278 lt!307632) (currentBit!9273 lt!307632)) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308)))))))

(declare-fun b!197959 () Bool)

(declare-fun e!135902 () Bool)

(assert (=> b!197959 (= e!135903 e!135902)))

(declare-fun res!165691 () Bool)

(assert (=> b!197959 (=> res!165691 e!135902)))

(assert (=> b!197959 (= res!165691 (= (size!4454 (buf!4940 lt!307632)) #b00000000000000000000000000000000))))

(declare-fun b!197960 () Bool)

(assert (=> b!197960 (= e!135902 (arrayBitRangesEq!0 (buf!4940 lt!307632) (buf!4940 (_2!9185 lt!307308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 lt!307632)) (currentByte!9278 lt!307632) (currentBit!9273 lt!307632))))))

(assert (= (and d!66919 res!165693) b!197958))

(assert (= (and b!197958 res!165692) b!197959))

(assert (= (and b!197959 (not res!165691)) b!197960))

(assert (=> b!197958 m!305963))

(assert (=> b!197958 m!305051))

(assert (=> b!197960 m!305963))

(assert (=> b!197960 m!305963))

(declare-fun m!305977 () Bool)

(assert (=> b!197960 m!305977))

(assert (=> d!66735 d!66919))

(declare-fun d!66921 () Bool)

(assert (=> d!66921 (isPrefixOf!0 lt!307632 (_2!9185 lt!307308))))

(declare-fun lt!308502 () Unit!13973)

(assert (=> d!66921 (= lt!308502 (choose!30 lt!307632 (_2!9185 lt!307286) (_2!9185 lt!307308)))))

(assert (=> d!66921 (isPrefixOf!0 lt!307632 (_2!9185 lt!307286))))

(assert (=> d!66921 (= (lemmaIsPrefixTransitive!0 lt!307632 (_2!9185 lt!307286) (_2!9185 lt!307308)) lt!308502)))

(declare-fun bs!16596 () Bool)

(assert (= bs!16596 d!66921))

(assert (=> bs!16596 m!305353))

(declare-fun m!305979 () Bool)

(assert (=> bs!16596 m!305979))

(declare-fun m!305981 () Bool)

(assert (=> bs!16596 m!305981))

(assert (=> d!66735 d!66921))

(declare-fun d!66923 () Bool)

(assert (=> d!66923 (isPrefixOf!0 lt!307632 lt!307632)))

(declare-fun lt!308503 () Unit!13973)

(assert (=> d!66923 (= lt!308503 (choose!11 lt!307632))))

(assert (=> d!66923 (= (lemmaIsPrefixRefl!0 lt!307632) lt!308503)))

(declare-fun bs!16597 () Bool)

(assert (= bs!16597 d!66923))

(assert (=> bs!16597 m!305349))

(declare-fun m!305983 () Bool)

(assert (=> bs!16597 m!305983))

(assert (=> d!66735 d!66923))

(declare-fun d!66925 () Bool)

(declare-fun res!165696 () Bool)

(declare-fun e!135905 () Bool)

(assert (=> d!66925 (=> (not res!165696) (not e!135905))))

(assert (=> d!66925 (= res!165696 (= (size!4454 (buf!4940 (_1!9187 lt!307621))) (size!4454 (buf!4940 (_2!9187 lt!307621)))))))

(assert (=> d!66925 (= (isPrefixOf!0 (_1!9187 lt!307621) (_2!9187 lt!307621)) e!135905)))

(declare-fun b!197961 () Bool)

(declare-fun res!165695 () Bool)

(assert (=> b!197961 (=> (not res!165695) (not e!135905))))

(assert (=> b!197961 (= res!165695 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307621))) (currentByte!9278 (_1!9187 lt!307621)) (currentBit!9273 (_1!9187 lt!307621))) (bitIndex!0 (size!4454 (buf!4940 (_2!9187 lt!307621))) (currentByte!9278 (_2!9187 lt!307621)) (currentBit!9273 (_2!9187 lt!307621)))))))

(declare-fun b!197962 () Bool)

(declare-fun e!135904 () Bool)

(assert (=> b!197962 (= e!135905 e!135904)))

(declare-fun res!165694 () Bool)

(assert (=> b!197962 (=> res!165694 e!135904)))

(assert (=> b!197962 (= res!165694 (= (size!4454 (buf!4940 (_1!9187 lt!307621))) #b00000000000000000000000000000000))))

(declare-fun b!197963 () Bool)

(assert (=> b!197963 (= e!135904 (arrayBitRangesEq!0 (buf!4940 (_1!9187 lt!307621)) (buf!4940 (_2!9187 lt!307621)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307621))) (currentByte!9278 (_1!9187 lt!307621)) (currentBit!9273 (_1!9187 lt!307621)))))))

(assert (= (and d!66925 res!165696) b!197961))

(assert (= (and b!197961 res!165695) b!197962))

(assert (= (and b!197962 (not res!165694)) b!197963))

(assert (=> b!197961 m!305911))

(assert (=> b!197961 m!305861))

(assert (=> b!197963 m!305911))

(assert (=> b!197963 m!305911))

(declare-fun m!305985 () Bool)

(assert (=> b!197963 m!305985))

(assert (=> d!66735 d!66925))

(declare-fun d!66927 () Bool)

(assert (=> d!66927 (= (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307290)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307290))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307290)))) (bvsub (bvmul ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307290)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307290))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307290))))))))

(assert (=> d!66731 d!66927))

(declare-fun d!66929 () Bool)

(assert (=> d!66929 (= (invariant!0 (currentBit!9273 (_1!9186 lt!307290)) (currentByte!9278 (_1!9186 lt!307290)) (size!4454 (buf!4940 (_1!9186 lt!307290)))) (and (bvsge (currentBit!9273 (_1!9186 lt!307290)) #b00000000000000000000000000000000) (bvslt (currentBit!9273 (_1!9186 lt!307290)) #b00000000000000000000000000001000) (bvsge (currentByte!9278 (_1!9186 lt!307290)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 (_1!9186 lt!307290)) (size!4454 (buf!4940 (_1!9186 lt!307290)))) (and (= (currentBit!9273 (_1!9186 lt!307290)) #b00000000000000000000000000000000) (= (currentByte!9278 (_1!9186 lt!307290)) (size!4454 (buf!4940 (_1!9186 lt!307290))))))))))

(assert (=> d!66731 d!66929))

(declare-fun d!66931 () Bool)

(declare-fun e!135908 () Bool)

(assert (=> d!66931 e!135908))

(declare-fun res!165699 () Bool)

(assert (=> d!66931 (=> (not res!165699) (not e!135908))))

(declare-fun lt!308508 () BitStream!8016)

(declare-fun lt!308509 () (_ BitVec 64))

(assert (=> d!66931 (= res!165699 (= (bvadd lt!308509 (bvsub lt!307574 lt!307564)) (bitIndex!0 (size!4454 (buf!4940 lt!308508)) (currentByte!9278 lt!308508) (currentBit!9273 lt!308508))))))

(assert (=> d!66931 (or (not (= (bvand lt!308509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307574 lt!307564) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308509 (bvsub lt!307574 lt!307564)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66931 (= lt!308509 (bitIndex!0 (size!4454 (buf!4940 (_2!9187 lt!307568))) (currentByte!9278 (_2!9187 lt!307568)) (currentBit!9273 (_2!9187 lt!307568))))))

(declare-fun moveBitIndex!0 (BitStream!8016 (_ BitVec 64)) tuple2!17080)

(assert (=> d!66931 (= lt!308508 (_2!9185 (moveBitIndex!0 (_2!9187 lt!307568) (bvsub lt!307574 lt!307564))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8016 (_ BitVec 64)) Bool)

(assert (=> d!66931 (moveBitIndexPrecond!0 (_2!9187 lt!307568) (bvsub lt!307574 lt!307564))))

(assert (=> d!66931 (= (withMovedBitIndex!0 (_2!9187 lt!307568) (bvsub lt!307574 lt!307564)) lt!308508)))

(declare-fun b!197966 () Bool)

(assert (=> b!197966 (= e!135908 (= (size!4454 (buf!4940 (_2!9187 lt!307568))) (size!4454 (buf!4940 lt!308508))))))

(assert (= (and d!66931 res!165699) b!197966))

(declare-fun m!305987 () Bool)

(assert (=> d!66931 m!305987))

(declare-fun m!305989 () Bool)

(assert (=> d!66931 m!305989))

(declare-fun m!305991 () Bool)

(assert (=> d!66931 m!305991))

(declare-fun m!305993 () Bool)

(assert (=> d!66931 m!305993))

(assert (=> b!197631 d!66931))

(assert (=> b!197631 d!66745))

(assert (=> b!197631 d!66699))

(declare-fun d!66933 () Bool)

(declare-fun lt!308510 () tuple2!17102)

(assert (=> d!66933 (= lt!308510 (readNBitsLSBFirstsLoop!0 (_1!9187 lt!308355) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!66933 (= (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308355) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17087 (_2!9196 lt!308510) (_1!9196 lt!308510)))))

(declare-fun bs!16598 () Bool)

(assert (= bs!16598 d!66933))

(declare-fun m!305995 () Bool)

(assert (=> bs!16598 m!305995))

(assert (=> b!197854 d!66933))

(declare-fun lt!308511 () tuple2!17102)

(declare-fun d!66935 () Bool)

(assert (=> d!66935 (= lt!308511 (readNBitsLSBFirstsLoop!0 (_1!9187 lt!308337) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308348))))

(assert (=> d!66935 (= (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308337) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308348) (tuple2!17087 (_2!9196 lt!308511) (_1!9196 lt!308511)))))

(declare-fun bs!16599 () Bool)

(assert (= bs!16599 d!66935))

(declare-fun m!305997 () Bool)

(assert (=> bs!16599 m!305997))

(assert (=> b!197854 d!66935))

(declare-fun b!197967 () Bool)

(declare-fun res!165701 () Bool)

(declare-fun e!135909 () Bool)

(assert (=> b!197967 (=> (not res!165701) (not e!135909))))

(declare-fun lt!308517 () tuple2!17084)

(assert (=> b!197967 (= res!165701 (isPrefixOf!0 (_1!9187 lt!308517) (_2!9185 lt!307286)))))

(declare-fun d!66937 () Bool)

(assert (=> d!66937 e!135909))

(declare-fun res!165702 () Bool)

(assert (=> d!66937 (=> (not res!165702) (not e!135909))))

(assert (=> d!66937 (= res!165702 (isPrefixOf!0 (_1!9187 lt!308517) (_2!9187 lt!308517)))))

(declare-fun lt!308528 () BitStream!8016)

(assert (=> d!66937 (= lt!308517 (tuple2!17085 lt!308528 (_2!9185 lt!308349)))))

(declare-fun lt!308526 () Unit!13973)

(declare-fun lt!308519 () Unit!13973)

(assert (=> d!66937 (= lt!308526 lt!308519)))

(assert (=> d!66937 (isPrefixOf!0 lt!308528 (_2!9185 lt!308349))))

(assert (=> d!66937 (= lt!308519 (lemmaIsPrefixTransitive!0 lt!308528 (_2!9185 lt!308349) (_2!9185 lt!308349)))))

(declare-fun lt!308521 () Unit!13973)

(declare-fun lt!308524 () Unit!13973)

(assert (=> d!66937 (= lt!308521 lt!308524)))

(assert (=> d!66937 (isPrefixOf!0 lt!308528 (_2!9185 lt!308349))))

(assert (=> d!66937 (= lt!308524 (lemmaIsPrefixTransitive!0 lt!308528 (_2!9185 lt!307286) (_2!9185 lt!308349)))))

(declare-fun lt!308529 () Unit!13973)

(declare-fun e!135910 () Unit!13973)

(assert (=> d!66937 (= lt!308529 e!135910)))

(declare-fun c!9849 () Bool)

(assert (=> d!66937 (= c!9849 (not (= (size!4454 (buf!4940 (_2!9185 lt!307286))) #b00000000000000000000000000000000)))))

(declare-fun lt!308520 () Unit!13973)

(declare-fun lt!308525 () Unit!13973)

(assert (=> d!66937 (= lt!308520 lt!308525)))

(assert (=> d!66937 (isPrefixOf!0 (_2!9185 lt!308349) (_2!9185 lt!308349))))

(assert (=> d!66937 (= lt!308525 (lemmaIsPrefixRefl!0 (_2!9185 lt!308349)))))

(declare-fun lt!308515 () Unit!13973)

(declare-fun lt!308512 () Unit!13973)

(assert (=> d!66937 (= lt!308515 lt!308512)))

(assert (=> d!66937 (= lt!308512 (lemmaIsPrefixRefl!0 (_2!9185 lt!308349)))))

(declare-fun lt!308531 () Unit!13973)

(declare-fun lt!308522 () Unit!13973)

(assert (=> d!66937 (= lt!308531 lt!308522)))

(assert (=> d!66937 (isPrefixOf!0 lt!308528 lt!308528)))

(assert (=> d!66937 (= lt!308522 (lemmaIsPrefixRefl!0 lt!308528))))

(declare-fun lt!308527 () Unit!13973)

(declare-fun lt!308516 () Unit!13973)

(assert (=> d!66937 (= lt!308527 lt!308516)))

(assert (=> d!66937 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!307286))))

(assert (=> d!66937 (= lt!308516 (lemmaIsPrefixRefl!0 (_2!9185 lt!307286)))))

(assert (=> d!66937 (= lt!308528 (BitStream!8017 (buf!4940 (_2!9185 lt!308349)) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(assert (=> d!66937 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!308349))))

(assert (=> d!66937 (= (reader!0 (_2!9185 lt!307286) (_2!9185 lt!308349)) lt!308517)))

(declare-fun b!197968 () Bool)

(declare-fun lt!308514 () Unit!13973)

(assert (=> b!197968 (= e!135910 lt!308514)))

(declare-fun lt!308518 () (_ BitVec 64))

(assert (=> b!197968 (= lt!308518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!308530 () (_ BitVec 64))

(assert (=> b!197968 (= lt!308530 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(assert (=> b!197968 (= lt!308514 (arrayBitRangesEqSymmetric!0 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!308349)) lt!308518 lt!308530))))

(assert (=> b!197968 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!308349)) (buf!4940 (_2!9185 lt!307286)) lt!308518 lt!308530)))

(declare-fun b!197969 () Bool)

(declare-fun res!165700 () Bool)

(assert (=> b!197969 (=> (not res!165700) (not e!135909))))

(assert (=> b!197969 (= res!165700 (isPrefixOf!0 (_2!9187 lt!308517) (_2!9185 lt!308349)))))

(declare-fun b!197970 () Bool)

(declare-fun lt!308523 () (_ BitVec 64))

(declare-fun lt!308513 () (_ BitVec 64))

(assert (=> b!197970 (= e!135909 (= (_1!9187 lt!308517) (withMovedBitIndex!0 (_2!9187 lt!308517) (bvsub lt!308523 lt!308513))))))

(assert (=> b!197970 (or (= (bvand lt!308523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308513 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308523 lt!308513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197970 (= lt!308513 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))))))

(assert (=> b!197970 (= lt!308523 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(declare-fun b!197971 () Bool)

(declare-fun Unit!14017 () Unit!13973)

(assert (=> b!197971 (= e!135910 Unit!14017)))

(assert (= (and d!66937 c!9849) b!197968))

(assert (= (and d!66937 (not c!9849)) b!197971))

(assert (= (and d!66937 res!165702) b!197967))

(assert (= (and b!197967 res!165701) b!197969))

(assert (= (and b!197969 res!165700) b!197970))

(declare-fun m!305999 () Bool)

(assert (=> b!197969 m!305999))

(declare-fun m!306001 () Bool)

(assert (=> b!197967 m!306001))

(declare-fun m!306003 () Bool)

(assert (=> b!197970 m!306003))

(assert (=> b!197970 m!305815))

(assert (=> b!197970 m!305047))

(assert (=> b!197968 m!305047))

(declare-fun m!306005 () Bool)

(assert (=> b!197968 m!306005))

(declare-fun m!306007 () Bool)

(assert (=> b!197968 m!306007))

(declare-fun m!306009 () Bool)

(assert (=> d!66937 m!306009))

(declare-fun m!306011 () Bool)

(assert (=> d!66937 m!306011))

(declare-fun m!306013 () Bool)

(assert (=> d!66937 m!306013))

(assert (=> d!66937 m!305345))

(declare-fun m!306015 () Bool)

(assert (=> d!66937 m!306015))

(declare-fun m!306017 () Bool)

(assert (=> d!66937 m!306017))

(declare-fun m!306019 () Bool)

(assert (=> d!66937 m!306019))

(declare-fun m!306021 () Bool)

(assert (=> d!66937 m!306021))

(assert (=> d!66937 m!305355))

(declare-fun m!306023 () Bool)

(assert (=> d!66937 m!306023))

(declare-fun m!306025 () Bool)

(assert (=> d!66937 m!306025))

(assert (=> b!197854 d!66937))

(declare-fun d!66939 () Bool)

(declare-fun e!135911 () Bool)

(assert (=> d!66939 e!135911))

(declare-fun res!165703 () Bool)

(assert (=> d!66939 (=> (not res!165703) (not e!135911))))

(declare-fun lt!308532 () tuple2!17082)

(declare-fun lt!308533 () tuple2!17082)

(assert (=> d!66939 (= res!165703 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308532))) (currentByte!9278 (_1!9186 lt!308532)) (currentBit!9273 (_1!9186 lt!308532))) (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308533))) (currentByte!9278 (_1!9186 lt!308533)) (currentBit!9273 (_1!9186 lt!308533)))))))

(declare-fun lt!308535 () Unit!13973)

(declare-fun lt!308534 () BitStream!8016)

(assert (=> d!66939 (= lt!308535 (choose!50 lt!308354 (_2!9185 lt!308349) lt!308534 lt!308532 (tuple2!17083 (_1!9186 lt!308532) (_2!9186 lt!308532)) (_1!9186 lt!308532) (_2!9186 lt!308532) lt!308533 (tuple2!17083 (_1!9186 lt!308533) (_2!9186 lt!308533)) (_1!9186 lt!308533) (_2!9186 lt!308533)))))

(assert (=> d!66939 (= lt!308533 (readBitPure!0 lt!308534))))

(assert (=> d!66939 (= lt!308532 (readBitPure!0 lt!308354))))

(assert (=> d!66939 (= lt!308534 (BitStream!8017 (buf!4940 (_2!9185 lt!308349)) (currentByte!9278 lt!308354) (currentBit!9273 lt!308354)))))

(assert (=> d!66939 (invariant!0 (currentBit!9273 lt!308354) (currentByte!9278 lt!308354) (size!4454 (buf!4940 (_2!9185 lt!308349))))))

(assert (=> d!66939 (= (readBitPrefixLemma!0 lt!308354 (_2!9185 lt!308349)) lt!308535)))

(declare-fun b!197972 () Bool)

(assert (=> b!197972 (= e!135911 (= (_2!9186 lt!308532) (_2!9186 lt!308533)))))

(assert (= (and d!66939 res!165703) b!197972))

(assert (=> d!66939 m!305817))

(declare-fun m!306027 () Bool)

(assert (=> d!66939 m!306027))

(declare-fun m!306029 () Bool)

(assert (=> d!66939 m!306029))

(assert (=> d!66939 m!305761))

(declare-fun m!306031 () Bool)

(assert (=> d!66939 m!306031))

(declare-fun m!306033 () Bool)

(assert (=> d!66939 m!306033))

(assert (=> b!197854 d!66939))

(declare-fun d!66941 () Bool)

(declare-fun e!135912 () Bool)

(assert (=> d!66941 e!135912))

(declare-fun res!165704 () Bool)

(assert (=> d!66941 (=> (not res!165704) (not e!135912))))

(declare-fun lt!308537 () (_ BitVec 64))

(declare-fun lt!308536 () BitStream!8016)

(assert (=> d!66941 (= res!165704 (= (bvadd lt!308537 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4454 (buf!4940 lt!308536)) (currentByte!9278 lt!308536) (currentBit!9273 lt!308536))))))

(assert (=> d!66941 (or (not (= (bvand lt!308537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308537 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66941 (= lt!308537 (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!308337))) (currentByte!9278 (_1!9187 lt!308337)) (currentBit!9273 (_1!9187 lt!308337))))))

(assert (=> d!66941 (= lt!308536 (_2!9185 (moveBitIndex!0 (_1!9187 lt!308337) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!66941 (moveBitIndexPrecond!0 (_1!9187 lt!308337) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!66941 (= (withMovedBitIndex!0 (_1!9187 lt!308337) #b0000000000000000000000000000000000000000000000000000000000000001) lt!308536)))

(declare-fun b!197973 () Bool)

(assert (=> b!197973 (= e!135912 (= (size!4454 (buf!4940 (_1!9187 lt!308337))) (size!4454 (buf!4940 lt!308536))))))

(assert (= (and d!66941 res!165704) b!197973))

(declare-fun m!306035 () Bool)

(assert (=> d!66941 m!306035))

(declare-fun m!306037 () Bool)

(assert (=> d!66941 m!306037))

(declare-fun m!306039 () Bool)

(assert (=> d!66941 m!306039))

(declare-fun m!306041 () Bool)

(assert (=> d!66941 m!306041))

(assert (=> b!197854 d!66941))

(assert (=> b!197854 d!66697))

(declare-fun d!66943 () Bool)

(assert (=> d!66943 (= (invariant!0 (currentBit!9273 (_2!9185 lt!308349)) (currentByte!9278 (_2!9185 lt!308349)) (size!4454 (buf!4940 (_2!9185 lt!308349)))) (and (bvsge (currentBit!9273 (_2!9185 lt!308349)) #b00000000000000000000000000000000) (bvslt (currentBit!9273 (_2!9185 lt!308349)) #b00000000000000000000000000001000) (bvsge (currentByte!9278 (_2!9185 lt!308349)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 (_2!9185 lt!308349)) (size!4454 (buf!4940 (_2!9185 lt!308349)))) (and (= (currentBit!9273 (_2!9185 lt!308349)) #b00000000000000000000000000000000) (= (currentByte!9278 (_2!9185 lt!308349)) (size!4454 (buf!4940 (_2!9185 lt!308349))))))))))

(assert (=> b!197854 d!66943))

(declare-fun b!197974 () Bool)

(declare-fun res!165706 () Bool)

(declare-fun e!135913 () Bool)

(assert (=> b!197974 (=> (not res!165706) (not e!135913))))

(declare-fun lt!308543 () tuple2!17084)

(assert (=> b!197974 (= res!165706 (isPrefixOf!0 (_1!9187 lt!308543) (_2!9185 lt!308338)))))

(declare-fun d!66945 () Bool)

(assert (=> d!66945 e!135913))

(declare-fun res!165707 () Bool)

(assert (=> d!66945 (=> (not res!165707) (not e!135913))))

(assert (=> d!66945 (= res!165707 (isPrefixOf!0 (_1!9187 lt!308543) (_2!9187 lt!308543)))))

(declare-fun lt!308554 () BitStream!8016)

(assert (=> d!66945 (= lt!308543 (tuple2!17085 lt!308554 (_2!9185 lt!308349)))))

(declare-fun lt!308552 () Unit!13973)

(declare-fun lt!308545 () Unit!13973)

(assert (=> d!66945 (= lt!308552 lt!308545)))

(assert (=> d!66945 (isPrefixOf!0 lt!308554 (_2!9185 lt!308349))))

(assert (=> d!66945 (= lt!308545 (lemmaIsPrefixTransitive!0 lt!308554 (_2!9185 lt!308349) (_2!9185 lt!308349)))))

(declare-fun lt!308547 () Unit!13973)

(declare-fun lt!308550 () Unit!13973)

(assert (=> d!66945 (= lt!308547 lt!308550)))

(assert (=> d!66945 (isPrefixOf!0 lt!308554 (_2!9185 lt!308349))))

(assert (=> d!66945 (= lt!308550 (lemmaIsPrefixTransitive!0 lt!308554 (_2!9185 lt!308338) (_2!9185 lt!308349)))))

(declare-fun lt!308555 () Unit!13973)

(declare-fun e!135914 () Unit!13973)

(assert (=> d!66945 (= lt!308555 e!135914)))

(declare-fun c!9850 () Bool)

(assert (=> d!66945 (= c!9850 (not (= (size!4454 (buf!4940 (_2!9185 lt!308338))) #b00000000000000000000000000000000)))))

(declare-fun lt!308546 () Unit!13973)

(declare-fun lt!308551 () Unit!13973)

(assert (=> d!66945 (= lt!308546 lt!308551)))

(assert (=> d!66945 (isPrefixOf!0 (_2!9185 lt!308349) (_2!9185 lt!308349))))

(assert (=> d!66945 (= lt!308551 (lemmaIsPrefixRefl!0 (_2!9185 lt!308349)))))

(declare-fun lt!308541 () Unit!13973)

(declare-fun lt!308538 () Unit!13973)

(assert (=> d!66945 (= lt!308541 lt!308538)))

(assert (=> d!66945 (= lt!308538 (lemmaIsPrefixRefl!0 (_2!9185 lt!308349)))))

(declare-fun lt!308557 () Unit!13973)

(declare-fun lt!308548 () Unit!13973)

(assert (=> d!66945 (= lt!308557 lt!308548)))

(assert (=> d!66945 (isPrefixOf!0 lt!308554 lt!308554)))

(assert (=> d!66945 (= lt!308548 (lemmaIsPrefixRefl!0 lt!308554))))

(declare-fun lt!308553 () Unit!13973)

(declare-fun lt!308542 () Unit!13973)

(assert (=> d!66945 (= lt!308553 lt!308542)))

(assert (=> d!66945 (isPrefixOf!0 (_2!9185 lt!308338) (_2!9185 lt!308338))))

(assert (=> d!66945 (= lt!308542 (lemmaIsPrefixRefl!0 (_2!9185 lt!308338)))))

(assert (=> d!66945 (= lt!308554 (BitStream!8017 (buf!4940 (_2!9185 lt!308349)) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))))))

(assert (=> d!66945 (isPrefixOf!0 (_2!9185 lt!308338) (_2!9185 lt!308349))))

(assert (=> d!66945 (= (reader!0 (_2!9185 lt!308338) (_2!9185 lt!308349)) lt!308543)))

(declare-fun b!197975 () Bool)

(declare-fun lt!308540 () Unit!13973)

(assert (=> b!197975 (= e!135914 lt!308540)))

(declare-fun lt!308544 () (_ BitVec 64))

(assert (=> b!197975 (= lt!308544 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!308556 () (_ BitVec 64))

(assert (=> b!197975 (= lt!308556 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))))))

(assert (=> b!197975 (= lt!308540 (arrayBitRangesEqSymmetric!0 (buf!4940 (_2!9185 lt!308338)) (buf!4940 (_2!9185 lt!308349)) lt!308544 lt!308556))))

(assert (=> b!197975 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!308349)) (buf!4940 (_2!9185 lt!308338)) lt!308544 lt!308556)))

(declare-fun b!197976 () Bool)

(declare-fun res!165705 () Bool)

(assert (=> b!197976 (=> (not res!165705) (not e!135913))))

(assert (=> b!197976 (= res!165705 (isPrefixOf!0 (_2!9187 lt!308543) (_2!9185 lt!308349)))))

(declare-fun b!197977 () Bool)

(declare-fun lt!308549 () (_ BitVec 64))

(declare-fun lt!308539 () (_ BitVec 64))

(assert (=> b!197977 (= e!135913 (= (_1!9187 lt!308543) (withMovedBitIndex!0 (_2!9187 lt!308543) (bvsub lt!308549 lt!308539))))))

(assert (=> b!197977 (or (= (bvand lt!308549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308549 lt!308539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197977 (= lt!308539 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))))))

(assert (=> b!197977 (= lt!308549 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))))))

(declare-fun b!197978 () Bool)

(declare-fun Unit!14018 () Unit!13973)

(assert (=> b!197978 (= e!135914 Unit!14018)))

(assert (= (and d!66945 c!9850) b!197975))

(assert (= (and d!66945 (not c!9850)) b!197978))

(assert (= (and d!66945 res!165707) b!197974))

(assert (= (and b!197974 res!165706) b!197976))

(assert (= (and b!197976 res!165705) b!197977))

(declare-fun m!306043 () Bool)

(assert (=> b!197976 m!306043))

(declare-fun m!306045 () Bool)

(assert (=> b!197974 m!306045))

(declare-fun m!306047 () Bool)

(assert (=> b!197977 m!306047))

(assert (=> b!197977 m!305815))

(assert (=> b!197977 m!305801))

(assert (=> b!197975 m!305801))

(declare-fun m!306049 () Bool)

(assert (=> b!197975 m!306049))

(declare-fun m!306051 () Bool)

(assert (=> b!197975 m!306051))

(assert (=> d!66945 m!306009))

(declare-fun m!306053 () Bool)

(assert (=> d!66945 m!306053))

(declare-fun m!306055 () Bool)

(assert (=> d!66945 m!306055))

(declare-fun m!306057 () Bool)

(assert (=> d!66945 m!306057))

(declare-fun m!306059 () Bool)

(assert (=> d!66945 m!306059))

(declare-fun m!306061 () Bool)

(assert (=> d!66945 m!306061))

(declare-fun m!306063 () Bool)

(assert (=> d!66945 m!306063))

(declare-fun m!306065 () Bool)

(assert (=> d!66945 m!306065))

(declare-fun m!306067 () Bool)

(assert (=> d!66945 m!306067))

(assert (=> d!66945 m!306023))

(declare-fun m!306069 () Bool)

(assert (=> d!66945 m!306069))

(assert (=> b!197854 d!66945))

(declare-fun d!66947 () Bool)

(assert (=> d!66947 (= (invariant!0 (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286)) (size!4454 (buf!4940 (_2!9185 lt!308338)))) (and (bvsge (currentBit!9273 (_2!9185 lt!307286)) #b00000000000000000000000000000000) (bvslt (currentBit!9273 (_2!9185 lt!307286)) #b00000000000000000000000000001000) (bvsge (currentByte!9278 (_2!9185 lt!307286)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 (_2!9185 lt!307286)) (size!4454 (buf!4940 (_2!9185 lt!308338)))) (and (= (currentBit!9273 (_2!9185 lt!307286)) #b00000000000000000000000000000000) (= (currentByte!9278 (_2!9185 lt!307286)) (size!4454 (buf!4940 (_2!9185 lt!308338))))))))))

(assert (=> b!197854 d!66947))

(declare-fun d!66949 () Bool)

(declare-fun lt!308572 () tuple2!17086)

(declare-fun lt!308573 () tuple2!17086)

(assert (=> d!66949 (and (= (_2!9188 lt!308572) (_2!9188 lt!308573)) (= (_1!9188 lt!308572) (_1!9188 lt!308573)))))

(declare-fun lt!308571 () Bool)

(declare-fun lt!308574 () Unit!13973)

(declare-fun lt!308570 () BitStream!8016)

(declare-fun lt!308575 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17086 tuple2!17086 BitStream!8016 (_ BitVec 64) Bool BitStream!8016 (_ BitVec 64) tuple2!17086 tuple2!17086 BitStream!8016 (_ BitVec 64)) Unit!13973)

(assert (=> d!66949 (= lt!308574 (choose!56 (_1!9187 lt!308337) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308348 lt!308572 (tuple2!17087 (_1!9188 lt!308572) (_2!9188 lt!308572)) (_1!9188 lt!308572) (_2!9188 lt!308572) lt!308571 lt!308570 lt!308575 lt!308573 (tuple2!17087 (_1!9188 lt!308573) (_2!9188 lt!308573)) (_1!9188 lt!308573) (_2!9188 lt!308573)))))

(assert (=> d!66949 (= lt!308573 (readNBitsLSBFirstsLoopPure!0 lt!308570 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!308575))))

(assert (=> d!66949 (= lt!308575 (bvor lt!308348 (ite lt!308571 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66949 (= lt!308570 (withMovedBitIndex!0 (_1!9187 lt!308337) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!66949 (= lt!308571 (_2!9186 (readBitPure!0 (_1!9187 lt!308337))))))

(assert (=> d!66949 (= lt!308572 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308337) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308348))))

(assert (=> d!66949 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9187 lt!308337) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!308348) lt!308574)))

(declare-fun bs!16601 () Bool)

(assert (= bs!16601 d!66949))

(declare-fun m!306071 () Bool)

(assert (=> bs!16601 m!306071))

(assert (=> bs!16601 m!305797))

(declare-fun m!306073 () Bool)

(assert (=> bs!16601 m!306073))

(assert (=> bs!16601 m!305783))

(assert (=> bs!16601 m!305765))

(assert (=> b!197854 d!66949))

(declare-fun d!66951 () Bool)

(declare-fun e!135915 () Bool)

(assert (=> d!66951 e!135915))

(declare-fun res!165709 () Bool)

(assert (=> d!66951 (=> (not res!165709) (not e!135915))))

(declare-fun lt!308579 () (_ BitVec 64))

(declare-fun lt!308577 () (_ BitVec 64))

(declare-fun lt!308576 () (_ BitVec 64))

(assert (=> d!66951 (= res!165709 (= lt!308576 (bvsub lt!308579 lt!308577)))))

(assert (=> d!66951 (or (= (bvand lt!308579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308577 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308579 lt!308577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66951 (= lt!308577 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!308370)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!308370))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!308370)))))))

(declare-fun lt!308578 () (_ BitVec 64))

(declare-fun lt!308581 () (_ BitVec 64))

(assert (=> d!66951 (= lt!308579 (bvmul lt!308578 lt!308581))))

(assert (=> d!66951 (or (= lt!308578 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308581 (bvsdiv (bvmul lt!308578 lt!308581) lt!308578)))))

(assert (=> d!66951 (= lt!308581 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66951 (= lt!308578 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!308370)))))))

(assert (=> d!66951 (= lt!308576 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!308370))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!308370)))))))

(assert (=> d!66951 (invariant!0 (currentBit!9273 (_1!9186 lt!308370)) (currentByte!9278 (_1!9186 lt!308370)) (size!4454 (buf!4940 (_1!9186 lt!308370))))))

(assert (=> d!66951 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308370))) (currentByte!9278 (_1!9186 lt!308370)) (currentBit!9273 (_1!9186 lt!308370))) lt!308576)))

(declare-fun b!197979 () Bool)

(declare-fun res!165708 () Bool)

(assert (=> b!197979 (=> (not res!165708) (not e!135915))))

(assert (=> b!197979 (= res!165708 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308576))))

(declare-fun b!197980 () Bool)

(declare-fun lt!308580 () (_ BitVec 64))

(assert (=> b!197980 (= e!135915 (bvsle lt!308576 (bvmul lt!308580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197980 (or (= lt!308580 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308580 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308580)))))

(assert (=> b!197980 (= lt!308580 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!308370)))))))

(assert (= (and d!66951 res!165709) b!197979))

(assert (= (and b!197979 res!165708) b!197980))

(declare-fun m!306075 () Bool)

(assert (=> d!66951 m!306075))

(declare-fun m!306077 () Bool)

(assert (=> d!66951 m!306077))

(assert (=> b!197854 d!66951))

(declare-fun d!66953 () Bool)

(assert (=> d!66953 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308338))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308338))) lt!308358)))

(declare-fun lt!308582 () Unit!13973)

(assert (=> d!66953 (= lt!308582 (choose!9 (_2!9185 lt!308338) (buf!4940 (_2!9185 lt!308349)) lt!308358 (BitStream!8017 (buf!4940 (_2!9185 lt!308349)) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338)))))))

(assert (=> d!66953 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!308338) (buf!4940 (_2!9185 lt!308349)) lt!308358) lt!308582)))

(declare-fun bs!16602 () Bool)

(assert (= bs!16602 d!66953))

(assert (=> bs!16602 m!305799))

(declare-fun m!306079 () Bool)

(assert (=> bs!16602 m!306079))

(assert (=> b!197854 d!66953))

(declare-fun d!66955 () Bool)

(declare-fun lt!308583 () tuple2!17102)

(assert (=> d!66955 (= lt!308583 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9187 lt!308337) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308348 e!135829)))))

(assert (=> d!66955 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9187 lt!308337) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308348 e!135829)) (tuple2!17087 (_2!9196 lt!308583) (_1!9196 lt!308583)))))

(declare-fun bs!16603 () Bool)

(assert (= bs!16603 d!66955))

(assert (=> bs!16603 m!305765))

(declare-fun m!306081 () Bool)

(assert (=> bs!16603 m!306081))

(assert (=> b!197854 d!66955))

(declare-fun d!66957 () Bool)

(declare-fun e!135917 () Bool)

(assert (=> d!66957 e!135917))

(declare-fun res!165713 () Bool)

(assert (=> d!66957 (=> (not res!165713) (not e!135917))))

(declare-fun lt!308584 () tuple2!17080)

(assert (=> d!66957 (= res!165713 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) (size!4454 (buf!4940 (_2!9185 lt!308584)))))))

(assert (=> d!66957 (= lt!308584 (choose!16 (_2!9185 lt!307286) lt!308336))))

(assert (=> d!66957 (validate_offset_bit!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307286)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))))))

(assert (=> d!66957 (= (appendBit!0 (_2!9185 lt!307286) lt!308336) lt!308584)))

(declare-fun b!197981 () Bool)

(declare-fun res!165711 () Bool)

(assert (=> b!197981 (=> (not res!165711) (not e!135917))))

(declare-fun lt!308585 () (_ BitVec 64))

(declare-fun lt!308586 () (_ BitVec 64))

(assert (=> b!197981 (= res!165711 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308584))) (currentByte!9278 (_2!9185 lt!308584)) (currentBit!9273 (_2!9185 lt!308584))) (bvadd lt!308585 lt!308586)))))

(assert (=> b!197981 (or (not (= (bvand lt!308585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308586 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308585 lt!308586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197981 (= lt!308586 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!197981 (= lt!308585 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(declare-fun b!197984 () Bool)

(declare-fun e!135916 () Bool)

(declare-fun lt!308587 () tuple2!17082)

(assert (=> b!197984 (= e!135916 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308587))) (currentByte!9278 (_1!9186 lt!308587)) (currentBit!9273 (_1!9186 lt!308587))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308584))) (currentByte!9278 (_2!9185 lt!308584)) (currentBit!9273 (_2!9185 lt!308584)))))))

(declare-fun b!197983 () Bool)

(assert (=> b!197983 (= e!135917 e!135916)))

(declare-fun res!165710 () Bool)

(assert (=> b!197983 (=> (not res!165710) (not e!135916))))

(assert (=> b!197983 (= res!165710 (and (= (_2!9186 lt!308587) lt!308336) (= (_1!9186 lt!308587) (_2!9185 lt!308584))))))

(assert (=> b!197983 (= lt!308587 (readBitPure!0 (readerFrom!0 (_2!9185 lt!308584) (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286)))))))

(declare-fun b!197982 () Bool)

(declare-fun res!165712 () Bool)

(assert (=> b!197982 (=> (not res!165712) (not e!135917))))

(assert (=> b!197982 (= res!165712 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!308584)))))

(assert (= (and d!66957 res!165713) b!197981))

(assert (= (and b!197981 res!165711) b!197982))

(assert (= (and b!197982 res!165712) b!197983))

(assert (= (and b!197983 res!165710) b!197984))

(declare-fun m!306083 () Bool)

(assert (=> b!197982 m!306083))

(declare-fun m!306085 () Bool)

(assert (=> b!197984 m!306085))

(declare-fun m!306087 () Bool)

(assert (=> b!197984 m!306087))

(declare-fun m!306089 () Bool)

(assert (=> d!66957 m!306089))

(declare-fun m!306091 () Bool)

(assert (=> d!66957 m!306091))

(assert (=> b!197981 m!306087))

(assert (=> b!197981 m!305047))

(declare-fun m!306093 () Bool)

(assert (=> b!197983 m!306093))

(assert (=> b!197983 m!306093))

(declare-fun m!306095 () Bool)

(assert (=> b!197983 m!306095))

(assert (=> b!197854 d!66957))

(declare-fun d!66959 () Bool)

(declare-fun e!135918 () Bool)

(assert (=> d!66959 e!135918))

(declare-fun res!165715 () Bool)

(assert (=> d!66959 (=> (not res!165715) (not e!135918))))

(declare-fun lt!308589 () (_ BitVec 64))

(declare-fun lt!308588 () (_ BitVec 64))

(declare-fun lt!308591 () (_ BitVec 64))

(assert (=> d!66959 (= res!165715 (= lt!308588 (bvsub lt!308591 lt!308589)))))

(assert (=> d!66959 (or (= (bvand lt!308591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308591 lt!308589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66959 (= lt!308589 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308338)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308338))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308338)))))))

(declare-fun lt!308590 () (_ BitVec 64))

(declare-fun lt!308593 () (_ BitVec 64))

(assert (=> d!66959 (= lt!308591 (bvmul lt!308590 lt!308593))))

(assert (=> d!66959 (or (= lt!308590 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308593 (bvsdiv (bvmul lt!308590 lt!308593) lt!308590)))))

(assert (=> d!66959 (= lt!308593 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66959 (= lt!308590 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308338)))))))

(assert (=> d!66959 (= lt!308588 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308338))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308338)))))))

(assert (=> d!66959 (invariant!0 (currentBit!9273 (_2!9185 lt!308338)) (currentByte!9278 (_2!9185 lt!308338)) (size!4454 (buf!4940 (_2!9185 lt!308338))))))

(assert (=> d!66959 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) lt!308588)))

(declare-fun b!197985 () Bool)

(declare-fun res!165714 () Bool)

(assert (=> b!197985 (=> (not res!165714) (not e!135918))))

(assert (=> b!197985 (= res!165714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308588))))

(declare-fun b!197986 () Bool)

(declare-fun lt!308592 () (_ BitVec 64))

(assert (=> b!197986 (= e!135918 (bvsle lt!308588 (bvmul lt!308592 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197986 (or (= lt!308592 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308592 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308592)))))

(assert (=> b!197986 (= lt!308592 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308338)))))))

(assert (= (and d!66959 res!165715) b!197985))

(assert (= (and b!197985 res!165714) b!197986))

(declare-fun m!306097 () Bool)

(assert (=> d!66959 m!306097))

(declare-fun m!306099 () Bool)

(assert (=> d!66959 m!306099))

(assert (=> b!197854 d!66959))

(declare-fun d!66961 () Bool)

(assert (=> d!66961 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308341)))

(declare-fun lt!308594 () Unit!13973)

(assert (=> d!66961 (= lt!308594 (choose!9 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!308349)) lt!308341 (BitStream!8017 (buf!4940 (_2!9185 lt!308349)) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (=> d!66961 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!308349)) lt!308341) lt!308594)))

(declare-fun bs!16604 () Bool)

(assert (= bs!16604 d!66961))

(assert (=> bs!16604 m!305823))

(declare-fun m!306101 () Bool)

(assert (=> bs!16604 m!306101))

(assert (=> b!197854 d!66961))

(declare-fun d!66963 () Bool)

(assert (=> d!66963 (= (invariant!0 (currentBit!9273 lt!308354) (currentByte!9278 lt!308354) (size!4454 (buf!4940 (_2!9185 lt!308349)))) (and (bvsge (currentBit!9273 lt!308354) #b00000000000000000000000000000000) (bvslt (currentBit!9273 lt!308354) #b00000000000000000000000000001000) (bvsge (currentByte!9278 lt!308354) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 lt!308354) (size!4454 (buf!4940 (_2!9185 lt!308349)))) (and (= (currentBit!9273 lt!308354) #b00000000000000000000000000000000) (= (currentByte!9278 lt!308354) (size!4454 (buf!4940 (_2!9185 lt!308349))))))))))

(assert (=> b!197854 d!66963))

(declare-fun d!66965 () Bool)

(declare-fun e!135919 () Bool)

(assert (=> d!66965 e!135919))

(declare-fun res!165716 () Bool)

(assert (=> d!66965 (=> (not res!165716) (not e!135919))))

(declare-fun lt!308595 () BitStream!8016)

(declare-fun lt!308596 () (_ BitVec 64))

(assert (=> d!66965 (= res!165716 (= (bvadd lt!308596 (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))))) (bitIndex!0 (size!4454 (buf!4940 lt!308595)) (currentByte!9278 lt!308595) (currentBit!9273 lt!308595))))))

(assert (=> d!66965 (or (not (= (bvand lt!308596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308596 (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66965 (= lt!308596 (bitIndex!0 (size!4454 (buf!4940 (_2!9187 lt!308344))) (currentByte!9278 (_2!9187 lt!308344)) (currentBit!9273 (_2!9187 lt!308344))))))

(assert (=> d!66965 (= lt!308595 (_2!9185 (moveBitIndex!0 (_2!9187 lt!308344) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349)))))))))

(assert (=> d!66965 (moveBitIndexPrecond!0 (_2!9187 lt!308344) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349)))))))

(assert (=> d!66965 (= (withMovedBitIndex!0 (_2!9187 lt!308344) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))))) lt!308595)))

(declare-fun b!197987 () Bool)

(assert (=> b!197987 (= e!135919 (= (size!4454 (buf!4940 (_2!9187 lt!308344))) (size!4454 (buf!4940 lt!308595))))))

(assert (= (and d!66965 res!165716) b!197987))

(declare-fun m!306103 () Bool)

(assert (=> d!66965 m!306103))

(declare-fun m!306105 () Bool)

(assert (=> d!66965 m!306105))

(declare-fun m!306107 () Bool)

(assert (=> d!66965 m!306107))

(declare-fun m!306109 () Bool)

(assert (=> d!66965 m!306109))

(assert (=> b!197854 d!66965))

(declare-fun b!197988 () Bool)

(declare-fun e!135921 () tuple2!17080)

(declare-fun Unit!14019 () Unit!13973)

(assert (=> b!197988 (= e!135921 (tuple2!17081 Unit!14019 (_2!9185 lt!308338)))))

(declare-fun lt!308632 () Unit!13973)

(assert (=> b!197988 (= lt!308632 (lemmaIsPrefixRefl!0 (_2!9185 lt!308338)))))

(declare-fun call!3114 () Bool)

(assert (=> b!197988 call!3114))

(declare-fun lt!308607 () Unit!13973)

(assert (=> b!197988 (= lt!308607 lt!308632)))

(declare-fun b!197989 () Bool)

(declare-fun e!135926 () (_ BitVec 64))

(assert (=> b!197989 (= e!135926 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun c!9851 () Bool)

(declare-fun lt!308610 () tuple2!17080)

(declare-fun bm!3111 () Bool)

(assert (=> bm!3111 (= call!3114 (isPrefixOf!0 (_2!9185 lt!308338) (ite c!9851 (_2!9185 lt!308338) (_2!9185 lt!308610))))))

(declare-fun b!197990 () Bool)

(declare-fun res!165728 () Bool)

(declare-fun e!135927 () Bool)

(assert (=> b!197990 (=> (not res!165728) (not e!135927))))

(declare-fun lt!308600 () (_ BitVec 64))

(declare-fun lt!308617 () tuple2!17080)

(declare-fun lt!308622 () (_ BitVec 64))

(assert (=> b!197990 (= res!165728 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308617))) (currentByte!9278 (_2!9185 lt!308617)) (currentBit!9273 (_2!9185 lt!308617))) (bvsub lt!308622 lt!308600)))))

(assert (=> b!197990 (or (= (bvand lt!308622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308622 lt!308600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197990 (= lt!308600 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!308604 () (_ BitVec 64))

(declare-fun lt!308612 () (_ BitVec 64))

(assert (=> b!197990 (= lt!308622 (bvadd lt!308604 lt!308612))))

(assert (=> b!197990 (or (not (= (bvand lt!308604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308612 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308604 lt!308612) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197990 (= lt!308612 ((_ sign_extend 32) nBits!348))))

(assert (=> b!197990 (= lt!308604 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))))))

(declare-fun b!197991 () Bool)

(assert (=> b!197991 (= e!135926 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!197992 () Bool)

(declare-fun res!165720 () Bool)

(declare-fun lt!308614 () tuple2!17080)

(assert (=> b!197992 (= res!165720 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308614))) (currentByte!9278 (_2!9185 lt!308614)) (currentBit!9273 (_2!9185 lt!308614))) (bvadd (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!135923 () Bool)

(assert (=> b!197992 (=> (not res!165720) (not e!135923))))

(declare-fun b!197993 () Bool)

(declare-fun res!165727 () Bool)

(assert (=> b!197993 (= res!165727 (isPrefixOf!0 (_2!9185 lt!308338) (_2!9185 lt!308614)))))

(assert (=> b!197993 (=> (not res!165727) (not e!135923))))

(declare-fun b!197994 () Bool)

(declare-fun e!135924 () Bool)

(declare-fun lt!308630 () tuple2!17086)

(declare-fun lt!308601 () tuple2!17084)

(assert (=> b!197994 (= e!135924 (= (_1!9188 lt!308630) (_2!9187 lt!308601)))))

(declare-fun b!197995 () Bool)

(declare-fun res!165719 () Bool)

(assert (=> b!197995 (=> (not res!165719) (not e!135927))))

(assert (=> b!197995 (= res!165719 (= (size!4454 (buf!4940 (_2!9185 lt!308338))) (size!4454 (buf!4940 (_2!9185 lt!308617)))))))

(declare-fun b!197996 () Bool)

(declare-fun e!135920 () Bool)

(declare-fun lt!308647 () tuple2!17082)

(assert (=> b!197996 (= e!135920 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308647))) (currentByte!9278 (_1!9186 lt!308647)) (currentBit!9273 (_1!9186 lt!308647))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308614))) (currentByte!9278 (_2!9185 lt!308614)) (currentBit!9273 (_2!9185 lt!308614)))))))

(declare-fun b!197997 () Bool)

(declare-fun e!135925 () Bool)

(declare-fun lt!308645 () (_ BitVec 64))

(assert (=> b!197997 (= e!135925 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308338)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308338))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308338))) lt!308645))))

(declare-fun b!197998 () Bool)

(declare-fun e!135922 () Bool)

(declare-fun lt!308635 () tuple2!17086)

(declare-fun lt!308616 () tuple2!17084)

(assert (=> b!197998 (= e!135922 (= (_1!9188 lt!308635) (_2!9187 lt!308616)))))

(declare-fun b!197999 () Bool)

(assert (=> b!197999 (= e!135921 (tuple2!17081 (_1!9185 lt!308610) (_2!9185 lt!308610)))))

(declare-fun lt!308597 () Bool)

(assert (=> b!197999 (= lt!308597 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197999 (= lt!308614 (appendBit!0 (_2!9185 lt!308338) lt!308597))))

(declare-fun res!165718 () Bool)

(assert (=> b!197999 (= res!165718 (= (size!4454 (buf!4940 (_2!9185 lt!308338))) (size!4454 (buf!4940 (_2!9185 lt!308614)))))))

(assert (=> b!197999 (=> (not res!165718) (not e!135923))))

(assert (=> b!197999 e!135923))

(declare-fun lt!308599 () tuple2!17080)

(assert (=> b!197999 (= lt!308599 lt!308614)))

(assert (=> b!197999 (= lt!308610 (appendBitsLSBFirstLoopTR!0 (_2!9185 lt!308599) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!308649 () Unit!13973)

(assert (=> b!197999 (= lt!308649 (lemmaIsPrefixTransitive!0 (_2!9185 lt!308338) (_2!9185 lt!308599) (_2!9185 lt!308610)))))

(assert (=> b!197999 call!3114))

(declare-fun lt!308606 () Unit!13973)

(assert (=> b!197999 (= lt!308606 lt!308649)))

(assert (=> b!197999 (invariant!0 (currentBit!9273 (_2!9185 lt!308338)) (currentByte!9278 (_2!9185 lt!308338)) (size!4454 (buf!4940 (_2!9185 lt!308599))))))

(declare-fun lt!308615 () BitStream!8016)

(assert (=> b!197999 (= lt!308615 (BitStream!8017 (buf!4940 (_2!9185 lt!308599)) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))))))

(assert (=> b!197999 (invariant!0 (currentBit!9273 lt!308615) (currentByte!9278 lt!308615) (size!4454 (buf!4940 (_2!9185 lt!308610))))))

(declare-fun lt!308627 () BitStream!8016)

(assert (=> b!197999 (= lt!308627 (BitStream!8017 (buf!4940 (_2!9185 lt!308610)) (currentByte!9278 lt!308615) (currentBit!9273 lt!308615)))))

(declare-fun lt!308651 () tuple2!17082)

(assert (=> b!197999 (= lt!308651 (readBitPure!0 lt!308615))))

(declare-fun lt!308631 () tuple2!17082)

(assert (=> b!197999 (= lt!308631 (readBitPure!0 lt!308627))))

(declare-fun lt!308634 () Unit!13973)

(assert (=> b!197999 (= lt!308634 (readBitPrefixLemma!0 lt!308615 (_2!9185 lt!308610)))))

(declare-fun res!165721 () Bool)

(assert (=> b!197999 (= res!165721 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308651))) (currentByte!9278 (_1!9186 lt!308651)) (currentBit!9273 (_1!9186 lt!308651))) (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308631))) (currentByte!9278 (_1!9186 lt!308631)) (currentBit!9273 (_1!9186 lt!308631)))))))

(declare-fun e!135928 () Bool)

(assert (=> b!197999 (=> (not res!165721) (not e!135928))))

(assert (=> b!197999 e!135928))

(declare-fun lt!308625 () Unit!13973)

(assert (=> b!197999 (= lt!308625 lt!308634)))

(declare-fun lt!308598 () tuple2!17084)

(assert (=> b!197999 (= lt!308598 (reader!0 (_2!9185 lt!308338) (_2!9185 lt!308610)))))

(declare-fun lt!308605 () tuple2!17084)

(assert (=> b!197999 (= lt!308605 (reader!0 (_2!9185 lt!308599) (_2!9185 lt!308610)))))

(declare-fun lt!308639 () tuple2!17082)

(assert (=> b!197999 (= lt!308639 (readBitPure!0 (_1!9187 lt!308598)))))

(assert (=> b!197999 (= (_2!9186 lt!308639) lt!308597)))

(declare-fun lt!308628 () Unit!13973)

(declare-fun Unit!14020 () Unit!13973)

(assert (=> b!197999 (= lt!308628 Unit!14020)))

(declare-fun lt!308609 () (_ BitVec 64))

(assert (=> b!197999 (= lt!308609 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!308602 () (_ BitVec 64))

(assert (=> b!197999 (= lt!308602 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!308626 () Unit!13973)

(assert (=> b!197999 (= lt!308626 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!308338) (buf!4940 (_2!9185 lt!308610)) lt!308602))))

(assert (=> b!197999 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308610)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308338))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308338))) lt!308602)))

(declare-fun lt!308633 () Unit!13973)

(assert (=> b!197999 (= lt!308633 lt!308626)))

(declare-fun lt!308648 () tuple2!17086)

(assert (=> b!197999 (= lt!308648 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308598) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!308609))))

(declare-fun lt!308619 () (_ BitVec 64))

(assert (=> b!197999 (= lt!308619 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!308643 () Unit!13973)

(assert (=> b!197999 (= lt!308643 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!308599) (buf!4940 (_2!9185 lt!308610)) lt!308619))))

(assert (=> b!197999 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308610)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308599))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308599))) lt!308619)))

(declare-fun lt!308636 () Unit!13973)

(assert (=> b!197999 (= lt!308636 lt!308643)))

(declare-fun lt!308642 () tuple2!17086)

(assert (=> b!197999 (= lt!308642 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308605) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!308609 (ite (_2!9186 lt!308639) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!308623 () tuple2!17086)

(assert (=> b!197999 (= lt!308623 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308598) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!308609))))

(declare-fun c!9852 () Bool)

(assert (=> b!197999 (= c!9852 (_2!9186 (readBitPure!0 (_1!9187 lt!308598))))))

(declare-fun lt!308621 () tuple2!17086)

(assert (=> b!197999 (= lt!308621 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9187 lt!308598) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!308609 e!135926)))))

(declare-fun lt!308603 () Unit!13973)

(assert (=> b!197999 (= lt!308603 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9187 lt!308598) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!308609))))

(assert (=> b!197999 (and (= (_2!9188 lt!308623) (_2!9188 lt!308621)) (= (_1!9188 lt!308623) (_1!9188 lt!308621)))))

(declare-fun lt!308611 () Unit!13973)

(assert (=> b!197999 (= lt!308611 lt!308603)))

(assert (=> b!197999 (= (_1!9187 lt!308598) (withMovedBitIndex!0 (_2!9187 lt!308598) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308610))) (currentByte!9278 (_2!9185 lt!308610)) (currentBit!9273 (_2!9185 lt!308610))))))))

(declare-fun lt!308637 () Unit!13973)

(declare-fun Unit!14021 () Unit!13973)

(assert (=> b!197999 (= lt!308637 Unit!14021)))

(assert (=> b!197999 (= (_1!9187 lt!308605) (withMovedBitIndex!0 (_2!9187 lt!308605) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308599))) (currentByte!9278 (_2!9185 lt!308599)) (currentBit!9273 (_2!9185 lt!308599))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308610))) (currentByte!9278 (_2!9185 lt!308610)) (currentBit!9273 (_2!9185 lt!308610))))))))

(declare-fun lt!308608 () Unit!13973)

(declare-fun Unit!14022 () Unit!13973)

(assert (=> b!197999 (= lt!308608 Unit!14022)))

(assert (=> b!197999 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308599))) (currentByte!9278 (_2!9185 lt!308599)) (currentBit!9273 (_2!9185 lt!308599))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!308638 () Unit!13973)

(declare-fun Unit!14023 () Unit!13973)

(assert (=> b!197999 (= lt!308638 Unit!14023)))

(assert (=> b!197999 (= (_2!9188 lt!308648) (_2!9188 lt!308642))))

(declare-fun lt!308646 () Unit!13973)

(declare-fun Unit!14024 () Unit!13973)

(assert (=> b!197999 (= lt!308646 Unit!14024)))

(assert (=> b!197999 (invariant!0 (currentBit!9273 (_2!9185 lt!308610)) (currentByte!9278 (_2!9185 lt!308610)) (size!4454 (buf!4940 (_2!9185 lt!308610))))))

(declare-fun lt!308650 () Unit!13973)

(declare-fun Unit!14025 () Unit!13973)

(assert (=> b!197999 (= lt!308650 Unit!14025)))

(assert (=> b!197999 (= (size!4454 (buf!4940 (_2!9185 lt!308338))) (size!4454 (buf!4940 (_2!9185 lt!308610))))))

(declare-fun lt!308618 () Unit!13973)

(declare-fun Unit!14026 () Unit!13973)

(assert (=> b!197999 (= lt!308618 Unit!14026)))

(assert (=> b!197999 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308610))) (currentByte!9278 (_2!9185 lt!308610)) (currentBit!9273 (_2!9185 lt!308610))) (bvsub (bvadd (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308338))) (currentByte!9278 (_2!9185 lt!308338)) (currentBit!9273 (_2!9185 lt!308338))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!308613 () Unit!13973)

(declare-fun Unit!14027 () Unit!13973)

(assert (=> b!197999 (= lt!308613 Unit!14027)))

(declare-fun lt!308624 () Unit!13973)

(declare-fun Unit!14028 () Unit!13973)

(assert (=> b!197999 (= lt!308624 Unit!14028)))

(assert (=> b!197999 (= lt!308616 (reader!0 (_2!9185 lt!308338) (_2!9185 lt!308610)))))

(declare-fun lt!308629 () (_ BitVec 64))

(assert (=> b!197999 (= lt!308629 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!308652 () Unit!13973)

(assert (=> b!197999 (= lt!308652 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!308338) (buf!4940 (_2!9185 lt!308610)) lt!308629))))

(assert (=> b!197999 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308610)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308338))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308338))) lt!308629)))

(declare-fun lt!308640 () Unit!13973)

(assert (=> b!197999 (= lt!308640 lt!308652)))

(assert (=> b!197999 (= lt!308635 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308616) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun res!165724 () Bool)

(assert (=> b!197999 (= res!165724 (= (_2!9188 lt!308635) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!197999 (=> (not res!165724) (not e!135922))))

(assert (=> b!197999 e!135922))

(declare-fun lt!308644 () Unit!13973)

(declare-fun Unit!14029 () Unit!13973)

(assert (=> b!197999 (= lt!308644 Unit!14029)))

(declare-fun b!198000 () Bool)

(assert (=> b!198000 (= lt!308647 (readBitPure!0 (readerFrom!0 (_2!9185 lt!308614) (currentBit!9273 (_2!9185 lt!308338)) (currentByte!9278 (_2!9185 lt!308338)))))))

(declare-fun res!165717 () Bool)

(assert (=> b!198000 (= res!165717 (and (= (_2!9186 lt!308647) lt!308597) (= (_1!9186 lt!308647) (_2!9185 lt!308614))))))

(assert (=> b!198000 (=> (not res!165717) (not e!135920))))

(assert (=> b!198000 (= e!135923 e!135920)))

(declare-fun b!198001 () Bool)

(assert (=> b!198001 (= e!135927 e!135924)))

(declare-fun res!165723 () Bool)

(assert (=> b!198001 (=> (not res!165723) (not e!135924))))

(assert (=> b!198001 (= res!165723 (= (_2!9188 lt!308630) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!198001 (= lt!308630 (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308601) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun lt!308620 () Unit!13973)

(declare-fun lt!308641 () Unit!13973)

(assert (=> b!198001 (= lt!308620 lt!308641)))

(assert (=> b!198001 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308617)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308338))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308338))) lt!308645)))

(assert (=> b!198001 (= lt!308641 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!308338) (buf!4940 (_2!9185 lt!308617)) lt!308645))))

(assert (=> b!198001 e!135925))

(declare-fun res!165722 () Bool)

(assert (=> b!198001 (=> (not res!165722) (not e!135925))))

(assert (=> b!198001 (= res!165722 (and (= (size!4454 (buf!4940 (_2!9185 lt!308338))) (size!4454 (buf!4940 (_2!9185 lt!308617)))) (bvsge lt!308645 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198001 (= lt!308645 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (=> b!198001 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!198001 (= lt!308601 (reader!0 (_2!9185 lt!308338) (_2!9185 lt!308617)))))

(declare-fun d!66967 () Bool)

(assert (=> d!66967 e!135927))

(declare-fun res!165726 () Bool)

(assert (=> d!66967 (=> (not res!165726) (not e!135927))))

(assert (=> d!66967 (= res!165726 (invariant!0 (currentBit!9273 (_2!9185 lt!308617)) (currentByte!9278 (_2!9185 lt!308617)) (size!4454 (buf!4940 (_2!9185 lt!308617)))))))

(assert (=> d!66967 (= lt!308617 e!135921)))

(assert (=> d!66967 (= c!9851 (= (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) nBits!348))))

(assert (=> d!66967 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66967 (= (appendBitsLSBFirstLoopTR!0 (_2!9185 lt!308338) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) lt!308617)))

(declare-fun b!198002 () Bool)

(declare-fun res!165725 () Bool)

(assert (=> b!198002 (=> (not res!165725) (not e!135927))))

(assert (=> b!198002 (= res!165725 (isPrefixOf!0 (_2!9185 lt!308338) (_2!9185 lt!308617)))))

(declare-fun b!198003 () Bool)

(assert (=> b!198003 (= e!135928 (= (_2!9186 lt!308651) (_2!9186 lt!308631)))))

(assert (= (and d!66967 c!9851) b!197988))

(assert (= (and d!66967 (not c!9851)) b!197999))

(assert (= (and b!197999 res!165718) b!197992))

(assert (= (and b!197992 res!165720) b!197993))

(assert (= (and b!197993 res!165727) b!198000))

(assert (= (and b!198000 res!165717) b!197996))

(assert (= (and b!197999 res!165721) b!198003))

(assert (= (and b!197999 c!9852) b!197989))

(assert (= (and b!197999 (not c!9852)) b!197991))

(assert (= (and b!197999 res!165724) b!197998))

(assert (= (or b!197988 b!197999) bm!3111))

(assert (= (and d!66967 res!165726) b!197995))

(assert (= (and b!197995 res!165719) b!197990))

(assert (= (and b!197990 res!165728) b!198002))

(assert (= (and b!198002 res!165725) b!198001))

(assert (= (and b!198001 res!165722) b!197997))

(assert (= (and b!198001 res!165723) b!197994))

(declare-fun m!306111 () Bool)

(assert (=> d!66967 m!306111))

(declare-fun m!306113 () Bool)

(assert (=> b!197990 m!306113))

(assert (=> b!197990 m!305801))

(declare-fun m!306115 () Bool)

(assert (=> b!198002 m!306115))

(declare-fun m!306117 () Bool)

(assert (=> b!197993 m!306117))

(declare-fun m!306119 () Bool)

(assert (=> bm!3111 m!306119))

(declare-fun m!306121 () Bool)

(assert (=> b!197992 m!306121))

(assert (=> b!197992 m!305801))

(declare-fun m!306123 () Bool)

(assert (=> b!197996 m!306123))

(assert (=> b!197996 m!306121))

(declare-fun m!306125 () Bool)

(assert (=> b!197999 m!306125))

(declare-fun m!306127 () Bool)

(assert (=> b!197999 m!306127))

(declare-fun m!306129 () Bool)

(assert (=> b!197999 m!306129))

(declare-fun m!306131 () Bool)

(assert (=> b!197999 m!306131))

(declare-fun m!306133 () Bool)

(assert (=> b!197999 m!306133))

(declare-fun m!306135 () Bool)

(assert (=> b!197999 m!306135))

(declare-fun m!306137 () Bool)

(assert (=> b!197999 m!306137))

(declare-fun m!306139 () Bool)

(assert (=> b!197999 m!306139))

(declare-fun m!306141 () Bool)

(assert (=> b!197999 m!306141))

(declare-fun m!306143 () Bool)

(assert (=> b!197999 m!306143))

(declare-fun m!306145 () Bool)

(assert (=> b!197999 m!306145))

(declare-fun m!306147 () Bool)

(assert (=> b!197999 m!306147))

(declare-fun m!306149 () Bool)

(assert (=> b!197999 m!306149))

(declare-fun m!306151 () Bool)

(assert (=> b!197999 m!306151))

(assert (=> b!197999 m!305789))

(declare-fun m!306153 () Bool)

(assert (=> b!197999 m!306153))

(declare-fun m!306155 () Bool)

(assert (=> b!197999 m!306155))

(assert (=> b!197999 m!305801))

(declare-fun m!306157 () Bool)

(assert (=> b!197999 m!306157))

(declare-fun m!306159 () Bool)

(assert (=> b!197999 m!306159))

(declare-fun m!306161 () Bool)

(assert (=> b!197999 m!306161))

(declare-fun m!306163 () Bool)

(assert (=> b!197999 m!306163))

(assert (=> b!197999 m!306129))

(declare-fun m!306165 () Bool)

(assert (=> b!197999 m!306165))

(declare-fun m!306167 () Bool)

(assert (=> b!197999 m!306167))

(declare-fun m!306169 () Bool)

(assert (=> b!197999 m!306169))

(declare-fun m!306171 () Bool)

(assert (=> b!197999 m!306171))

(declare-fun m!306173 () Bool)

(assert (=> b!197999 m!306173))

(declare-fun m!306175 () Bool)

(assert (=> b!197999 m!306175))

(declare-fun m!306177 () Bool)

(assert (=> b!197999 m!306177))

(declare-fun m!306179 () Bool)

(assert (=> b!197999 m!306179))

(declare-fun m!306181 () Bool)

(assert (=> b!197999 m!306181))

(declare-fun m!306183 () Bool)

(assert (=> b!197999 m!306183))

(declare-fun m!306185 () Bool)

(assert (=> b!197999 m!306185))

(assert (=> b!197988 m!306067))

(declare-fun m!306187 () Bool)

(assert (=> b!198000 m!306187))

(assert (=> b!198000 m!306187))

(declare-fun m!306189 () Bool)

(assert (=> b!198000 m!306189))

(declare-fun m!306191 () Bool)

(assert (=> b!198001 m!306191))

(assert (=> b!198001 m!305789))

(declare-fun m!306193 () Bool)

(assert (=> b!198001 m!306193))

(assert (=> b!198001 m!306137))

(declare-fun m!306195 () Bool)

(assert (=> b!198001 m!306195))

(declare-fun m!306197 () Bool)

(assert (=> b!198001 m!306197))

(declare-fun m!306199 () Bool)

(assert (=> b!197997 m!306199))

(assert (=> b!197854 d!66967))

(declare-fun d!66969 () Bool)

(declare-fun e!135929 () Bool)

(assert (=> d!66969 e!135929))

(declare-fun res!165730 () Bool)

(assert (=> d!66969 (=> (not res!165730) (not e!135929))))

(declare-fun lt!308653 () (_ BitVec 64))

(declare-fun lt!308654 () (_ BitVec 64))

(declare-fun lt!308656 () (_ BitVec 64))

(assert (=> d!66969 (= res!165730 (= lt!308653 (bvsub lt!308656 lt!308654)))))

(assert (=> d!66969 (or (= (bvand lt!308656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308654 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308656 lt!308654) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66969 (= lt!308654 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!308390)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!308390))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!308390)))))))

(declare-fun lt!308655 () (_ BitVec 64))

(declare-fun lt!308658 () (_ BitVec 64))

(assert (=> d!66969 (= lt!308656 (bvmul lt!308655 lt!308658))))

(assert (=> d!66969 (or (= lt!308655 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308658 (bvsdiv (bvmul lt!308655 lt!308658) lt!308655)))))

(assert (=> d!66969 (= lt!308658 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66969 (= lt!308655 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!308390)))))))

(assert (=> d!66969 (= lt!308653 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!308390))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!308390)))))))

(assert (=> d!66969 (invariant!0 (currentBit!9273 (_1!9186 lt!308390)) (currentByte!9278 (_1!9186 lt!308390)) (size!4454 (buf!4940 (_1!9186 lt!308390))))))

(assert (=> d!66969 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308390))) (currentByte!9278 (_1!9186 lt!308390)) (currentBit!9273 (_1!9186 lt!308390))) lt!308653)))

(declare-fun b!198004 () Bool)

(declare-fun res!165729 () Bool)

(assert (=> b!198004 (=> (not res!165729) (not e!135929))))

(assert (=> b!198004 (= res!165729 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308653))))

(declare-fun b!198005 () Bool)

(declare-fun lt!308657 () (_ BitVec 64))

(assert (=> b!198005 (= e!135929 (bvsle lt!308653 (bvmul lt!308657 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198005 (or (= lt!308657 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308657 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308657)))))

(assert (=> b!198005 (= lt!308657 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!308390)))))))

(assert (= (and d!66969 res!165730) b!198004))

(assert (= (and b!198004 res!165729) b!198005))

(declare-fun m!306201 () Bool)

(assert (=> d!66969 m!306201))

(declare-fun m!306203 () Bool)

(assert (=> d!66969 m!306203))

(assert (=> b!197854 d!66969))

(declare-fun d!66971 () Bool)

(assert (=> d!66971 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308368)))

(declare-fun lt!308659 () Unit!13973)

(assert (=> d!66971 (= lt!308659 (choose!9 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!308349)) lt!308368 (BitStream!8017 (buf!4940 (_2!9185 lt!308349)) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (=> d!66971 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9185 lt!307286) (buf!4940 (_2!9185 lt!308349)) lt!308368) lt!308659)))

(declare-fun bs!16605 () Bool)

(assert (= bs!16605 d!66971))

(assert (=> bs!16605 m!305785))

(declare-fun m!306205 () Bool)

(assert (=> bs!16605 m!306205))

(assert (=> b!197854 d!66971))

(declare-fun d!66973 () Bool)

(assert (=> d!66973 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308368) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286)))) lt!308368))))

(declare-fun bs!16606 () Bool)

(assert (= bs!16606 d!66973))

(declare-fun m!306207 () Bool)

(assert (=> bs!16606 m!306207))

(assert (=> b!197854 d!66973))

(declare-fun d!66975 () Bool)

(declare-fun e!135930 () Bool)

(assert (=> d!66975 e!135930))

(declare-fun res!165731 () Bool)

(assert (=> d!66975 (=> (not res!165731) (not e!135930))))

(declare-fun lt!308661 () (_ BitVec 64))

(declare-fun lt!308660 () BitStream!8016)

(assert (=> d!66975 (= res!165731 (= (bvadd lt!308661 (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))))) (bitIndex!0 (size!4454 (buf!4940 lt!308660)) (currentByte!9278 lt!308660) (currentBit!9273 lt!308660))))))

(assert (=> d!66975 (or (not (= (bvand lt!308661 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308661 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308661 (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66975 (= lt!308661 (bitIndex!0 (size!4454 (buf!4940 (_2!9187 lt!308337))) (currentByte!9278 (_2!9187 lt!308337)) (currentBit!9273 (_2!9187 lt!308337))))))

(assert (=> d!66975 (= lt!308660 (_2!9185 (moveBitIndex!0 (_2!9187 lt!308337) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349)))))))))

(assert (=> d!66975 (moveBitIndexPrecond!0 (_2!9187 lt!308337) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349)))))))

(assert (=> d!66975 (= (withMovedBitIndex!0 (_2!9187 lt!308337) (bvsub (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))))) lt!308660)))

(declare-fun b!198006 () Bool)

(assert (=> b!198006 (= e!135930 (= (size!4454 (buf!4940 (_2!9187 lt!308337))) (size!4454 (buf!4940 lt!308660))))))

(assert (= (and d!66975 res!165731) b!198006))

(declare-fun m!306209 () Bool)

(assert (=> d!66975 m!306209))

(declare-fun m!306211 () Bool)

(assert (=> d!66975 m!306211))

(declare-fun m!306213 () Bool)

(assert (=> d!66975 m!306213))

(declare-fun m!306215 () Bool)

(assert (=> d!66975 m!306215))

(assert (=> b!197854 d!66975))

(declare-fun d!66977 () Bool)

(declare-fun lt!308662 () tuple2!17102)

(assert (=> d!66977 (= lt!308662 (readNBitsLSBFirstsLoop!0 (_1!9187 lt!308344) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308348 (ite (_2!9186 lt!308378) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!66977 (= (readNBitsLSBFirstsLoopPure!0 (_1!9187 lt!308344) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!308348 (ite (_2!9186 lt!308378) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17087 (_2!9196 lt!308662) (_1!9196 lt!308662)))))

(declare-fun bs!16607 () Bool)

(assert (= bs!16607 d!66977))

(declare-fun m!306217 () Bool)

(assert (=> bs!16607 m!306217))

(assert (=> b!197854 d!66977))

(assert (=> b!197854 d!66897))

(declare-fun d!66979 () Bool)

(declare-fun lt!308663 () tuple2!17100)

(assert (=> d!66979 (= lt!308663 (readBit!0 lt!308366))))

(assert (=> d!66979 (= (readBitPure!0 lt!308366) (tuple2!17083 (_2!9195 lt!308663) (_1!9195 lt!308663)))))

(declare-fun bs!16608 () Bool)

(assert (= bs!16608 d!66979))

(declare-fun m!306219 () Bool)

(assert (=> bs!16608 m!306219))

(assert (=> b!197854 d!66979))

(declare-fun d!66981 () Bool)

(declare-fun lt!308664 () tuple2!17100)

(assert (=> d!66981 (= lt!308664 (readBit!0 lt!308354))))

(assert (=> d!66981 (= (readBitPure!0 lt!308354) (tuple2!17083 (_2!9195 lt!308664) (_1!9195 lt!308664)))))

(declare-fun bs!16609 () Bool)

(assert (= bs!16609 d!66981))

(declare-fun m!306221 () Bool)

(assert (=> bs!16609 m!306221))

(assert (=> b!197854 d!66981))

(declare-fun d!66983 () Bool)

(declare-fun e!135931 () Bool)

(assert (=> d!66983 e!135931))

(declare-fun res!165733 () Bool)

(assert (=> d!66983 (=> (not res!165733) (not e!135931))))

(declare-fun lt!308666 () (_ BitVec 64))

(declare-fun lt!308665 () (_ BitVec 64))

(declare-fun lt!308668 () (_ BitVec 64))

(assert (=> d!66983 (= res!165733 (= lt!308665 (bvsub lt!308668 lt!308666)))))

(assert (=> d!66983 (or (= (bvand lt!308668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308666 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308668 lt!308666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66983 (= lt!308666 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308349))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308349)))))))

(declare-fun lt!308667 () (_ BitVec 64))

(declare-fun lt!308670 () (_ BitVec 64))

(assert (=> d!66983 (= lt!308668 (bvmul lt!308667 lt!308670))))

(assert (=> d!66983 (or (= lt!308667 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308670 (bvsdiv (bvmul lt!308667 lt!308670) lt!308667)))))

(assert (=> d!66983 (= lt!308670 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66983 (= lt!308667 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))))))

(assert (=> d!66983 (= lt!308665 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308349))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308349)))))))

(assert (=> d!66983 (invariant!0 (currentBit!9273 (_2!9185 lt!308349)) (currentByte!9278 (_2!9185 lt!308349)) (size!4454 (buf!4940 (_2!9185 lt!308349))))))

(assert (=> d!66983 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308349))) (currentByte!9278 (_2!9185 lt!308349)) (currentBit!9273 (_2!9185 lt!308349))) lt!308665)))

(declare-fun b!198007 () Bool)

(declare-fun res!165732 () Bool)

(assert (=> b!198007 (=> (not res!165732) (not e!135931))))

(assert (=> b!198007 (= res!165732 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308665))))

(declare-fun b!198008 () Bool)

(declare-fun lt!308669 () (_ BitVec 64))

(assert (=> b!198008 (= e!135931 (bvsle lt!308665 (bvmul lt!308669 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198008 (or (= lt!308669 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308669 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308669)))))

(assert (=> b!198008 (= lt!308669 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))))))

(assert (= (and d!66983 res!165733) b!198007))

(assert (= (and b!198007 res!165732) b!198008))

(declare-fun m!306223 () Bool)

(assert (=> d!66983 m!306223))

(assert (=> d!66983 m!305819))

(assert (=> b!197854 d!66983))

(declare-fun d!66985 () Bool)

(declare-fun lt!308671 () tuple2!17100)

(assert (=> d!66985 (= lt!308671 (readBit!0 (_1!9187 lt!308337)))))

(assert (=> d!66985 (= (readBitPure!0 (_1!9187 lt!308337)) (tuple2!17083 (_2!9195 lt!308671) (_1!9195 lt!308671)))))

(declare-fun bs!16610 () Bool)

(assert (= bs!16610 d!66985))

(declare-fun m!306225 () Bool)

(assert (=> bs!16610 m!306225))

(assert (=> b!197854 d!66985))

(declare-fun d!66987 () Bool)

(assert (=> d!66987 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!308349))))

(declare-fun lt!308672 () Unit!13973)

(assert (=> d!66987 (= lt!308672 (choose!30 (_2!9185 lt!307286) (_2!9185 lt!308338) (_2!9185 lt!308349)))))

(assert (=> d!66987 (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!308338))))

(assert (=> d!66987 (= (lemmaIsPrefixTransitive!0 (_2!9185 lt!307286) (_2!9185 lt!308338) (_2!9185 lt!308349)) lt!308672)))

(declare-fun bs!16611 () Bool)

(assert (= bs!16611 d!66987))

(assert (=> bs!16611 m!306025))

(declare-fun m!306227 () Bool)

(assert (=> bs!16611 m!306227))

(declare-fun m!306229 () Bool)

(assert (=> bs!16611 m!306229))

(assert (=> b!197854 d!66987))

(assert (=> b!197854 d!66901))

(declare-fun d!66989 () Bool)

(assert (=> d!66989 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308338))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308338))) lt!308358) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!308338))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!308338)))) lt!308358))))

(declare-fun bs!16612 () Bool)

(assert (= bs!16612 d!66989))

(declare-fun m!306231 () Bool)

(assert (=> bs!16612 m!306231))

(assert (=> b!197854 d!66989))

(declare-fun d!66991 () Bool)

(assert (=> d!66991 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308341) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!308349)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286)))) lt!308341))))

(declare-fun bs!16613 () Bool)

(assert (= bs!16613 d!66991))

(assert (=> bs!16613 m!306207))

(assert (=> b!197854 d!66991))

(assert (=> b!197629 d!66699))

(declare-fun d!66993 () Bool)

(assert (=> d!66993 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307308)) (buf!4940 thiss!1204) lt!307569 lt!307581)))

(declare-fun lt!308675 () Unit!13973)

(declare-fun choose!8 (array!10105 array!10105 (_ BitVec 64) (_ BitVec 64)) Unit!13973)

(assert (=> d!66993 (= lt!308675 (choose!8 (buf!4940 thiss!1204) (buf!4940 (_2!9185 lt!307308)) lt!307569 lt!307581))))

(assert (=> d!66993 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307569) (bvsle lt!307569 lt!307581))))

(assert (=> d!66993 (= (arrayBitRangesEqSymmetric!0 (buf!4940 thiss!1204) (buf!4940 (_2!9185 lt!307308)) lt!307569 lt!307581) lt!308675)))

(declare-fun bs!16614 () Bool)

(assert (= bs!16614 d!66993))

(assert (=> bs!16614 m!305279))

(declare-fun m!306233 () Bool)

(assert (=> bs!16614 m!306233))

(assert (=> b!197629 d!66993))

(declare-fun b!198009 () Bool)

(declare-fun e!135936 () Bool)

(declare-fun e!135937 () Bool)

(assert (=> b!198009 (= e!135936 e!135937)))

(declare-fun res!165737 () Bool)

(assert (=> b!198009 (=> (not res!165737) (not e!135937))))

(declare-fun e!135934 () Bool)

(assert (=> b!198009 (= res!165737 e!135934)))

(declare-fun res!165735 () Bool)

(assert (=> b!198009 (=> res!165735 e!135934)))

(declare-fun lt!308676 () tuple4!258)

(assert (=> b!198009 (= res!165735 (bvsge (_1!9199 lt!308676) (_2!9199 lt!308676)))))

(declare-fun lt!308678 () (_ BitVec 32))

(assert (=> b!198009 (= lt!308678 ((_ extract 31 0) (bvsrem lt!307581 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!308677 () (_ BitVec 32))

(assert (=> b!198009 (= lt!308677 ((_ extract 31 0) (bvsrem lt!307569 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198009 (= lt!308676 (arrayBitIndices!0 lt!307569 lt!307581))))

(declare-fun c!9853 () Bool)

(declare-fun bm!3112 () Bool)

(declare-fun call!3115 () Bool)

(assert (=> bm!3112 (= call!3115 (byteRangesEq!0 (ite c!9853 (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_3!645 lt!308676)) (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_4!129 lt!308676))) (ite c!9853 (select (arr!5384 (buf!4940 thiss!1204)) (_3!645 lt!308676)) (select (arr!5384 (buf!4940 thiss!1204)) (_4!129 lt!308676))) (ite c!9853 lt!308677 #b00000000000000000000000000000000) lt!308678))))

(declare-fun b!198010 () Bool)

(declare-fun res!165738 () Bool)

(assert (=> b!198010 (= res!165738 (= lt!308678 #b00000000000000000000000000000000))))

(declare-fun e!135935 () Bool)

(assert (=> b!198010 (=> res!165738 e!135935)))

(declare-fun e!135932 () Bool)

(assert (=> b!198010 (= e!135932 e!135935)))

(declare-fun b!198011 () Bool)

(declare-fun e!135933 () Bool)

(assert (=> b!198011 (= e!135933 call!3115)))

(declare-fun b!198012 () Bool)

(assert (=> b!198012 (= e!135937 e!135933)))

(assert (=> b!198012 (= c!9853 (= (_3!645 lt!308676) (_4!129 lt!308676)))))

(declare-fun d!66995 () Bool)

(declare-fun res!165734 () Bool)

(assert (=> d!66995 (=> res!165734 e!135936)))

(assert (=> d!66995 (= res!165734 (bvsge lt!307569 lt!307581))))

(assert (=> d!66995 (= (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307308)) (buf!4940 thiss!1204) lt!307569 lt!307581) e!135936)))

(declare-fun b!198013 () Bool)

(assert (=> b!198013 (= e!135933 e!135932)))

(declare-fun res!165736 () Bool)

(assert (=> b!198013 (= res!165736 (byteRangesEq!0 (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_3!645 lt!308676)) (select (arr!5384 (buf!4940 thiss!1204)) (_3!645 lt!308676)) lt!308677 #b00000000000000000000000000001000))))

(assert (=> b!198013 (=> (not res!165736) (not e!135932))))

(declare-fun b!198014 () Bool)

(assert (=> b!198014 (= e!135935 call!3115)))

(declare-fun b!198015 () Bool)

(assert (=> b!198015 (= e!135934 (arrayRangesEq!691 (buf!4940 (_2!9185 lt!307308)) (buf!4940 thiss!1204) (_1!9199 lt!308676) (_2!9199 lt!308676)))))

(assert (= (and d!66995 (not res!165734)) b!198009))

(assert (= (and b!198009 (not res!165735)) b!198015))

(assert (= (and b!198009 res!165737) b!198012))

(assert (= (and b!198012 c!9853) b!198011))

(assert (= (and b!198012 (not c!9853)) b!198013))

(assert (= (and b!198013 res!165736) b!198010))

(assert (= (and b!198010 (not res!165738)) b!198014))

(assert (= (or b!198011 b!198014) bm!3112))

(declare-fun m!306235 () Bool)

(assert (=> b!198009 m!306235))

(declare-fun m!306237 () Bool)

(assert (=> bm!3112 m!306237))

(declare-fun m!306239 () Bool)

(assert (=> bm!3112 m!306239))

(declare-fun m!306241 () Bool)

(assert (=> bm!3112 m!306241))

(declare-fun m!306243 () Bool)

(assert (=> bm!3112 m!306243))

(declare-fun m!306245 () Bool)

(assert (=> bm!3112 m!306245))

(assert (=> b!198013 m!306237))

(assert (=> b!198013 m!306243))

(assert (=> b!198013 m!306237))

(assert (=> b!198013 m!306243))

(declare-fun m!306247 () Bool)

(assert (=> b!198013 m!306247))

(declare-fun m!306249 () Bool)

(assert (=> b!198015 m!306249))

(assert (=> b!197629 d!66995))

(declare-fun d!66997 () Bool)

(declare-fun e!135938 () Bool)

(assert (=> d!66997 e!135938))

(declare-fun res!165739 () Bool)

(assert (=> d!66997 (=> (not res!165739) (not e!135938))))

(assert (=> d!66997 (= res!165739 (= (buf!4940 (_2!9185 (increaseBitIndex!0 lt!307296))) (buf!4940 lt!307296)))))

(declare-fun lt!308682 () Bool)

(assert (=> d!66997 (= lt!308682 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 lt!307296)) (currentByte!9278 lt!307296))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 lt!307296)))) #b00000000000000000000000000000000)))))

(declare-fun lt!308681 () tuple2!17100)

(assert (=> d!66997 (= lt!308681 (tuple2!17101 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 lt!307296)) (currentByte!9278 lt!307296))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 lt!307296)))) #b00000000000000000000000000000000)) (_2!9185 (increaseBitIndex!0 lt!307296))))))

(assert (=> d!66997 (validate_offset_bit!0 ((_ sign_extend 32) (size!4454 (buf!4940 lt!307296))) ((_ sign_extend 32) (currentByte!9278 lt!307296)) ((_ sign_extend 32) (currentBit!9273 lt!307296)))))

(assert (=> d!66997 (= (readBit!0 lt!307296) lt!308681)))

(declare-fun lt!308680 () (_ BitVec 64))

(declare-fun b!198016 () Bool)

(declare-fun lt!308684 () (_ BitVec 64))

(assert (=> b!198016 (= e!135938 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 (increaseBitIndex!0 lt!307296)))) (currentByte!9278 (_2!9185 (increaseBitIndex!0 lt!307296))) (currentBit!9273 (_2!9185 (increaseBitIndex!0 lt!307296)))) (bvadd lt!308680 lt!308684)))))

(assert (=> b!198016 (or (not (= (bvand lt!308680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308684 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308680 lt!308684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198016 (= lt!308684 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198016 (= lt!308680 (bitIndex!0 (size!4454 (buf!4940 lt!307296)) (currentByte!9278 lt!307296) (currentBit!9273 lt!307296)))))

(declare-fun lt!308685 () Bool)

(assert (=> b!198016 (= lt!308685 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 lt!307296)) (currentByte!9278 lt!307296))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 lt!307296)))) #b00000000000000000000000000000000)))))

(declare-fun lt!308683 () Bool)

(assert (=> b!198016 (= lt!308683 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 lt!307296)) (currentByte!9278 lt!307296))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 lt!307296)))) #b00000000000000000000000000000000)))))

(declare-fun lt!308679 () Bool)

(assert (=> b!198016 (= lt!308679 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 lt!307296)) (currentByte!9278 lt!307296))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 lt!307296)))) #b00000000000000000000000000000000)))))

(assert (= (and d!66997 res!165739) b!198016))

(declare-fun m!306251 () Bool)

(assert (=> d!66997 m!306251))

(declare-fun m!306253 () Bool)

(assert (=> d!66997 m!306253))

(declare-fun m!306255 () Bool)

(assert (=> d!66997 m!306255))

(declare-fun m!306257 () Bool)

(assert (=> d!66997 m!306257))

(assert (=> b!198016 m!306251))

(declare-fun m!306259 () Bool)

(assert (=> b!198016 m!306259))

(assert (=> b!198016 m!306255))

(assert (=> b!198016 m!306253))

(declare-fun m!306261 () Bool)

(assert (=> b!198016 m!306261))

(assert (=> d!66733 d!66997))

(declare-fun d!66999 () Bool)

(assert (=> d!66999 (= (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286)))) (bvsub (bvmul ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))))))))

(assert (=> d!66737 d!66999))

(declare-fun d!67001 () Bool)

(assert (=> d!67001 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307286)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286))) lt!308384) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307286)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307286))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307286)))) lt!308384))))

(declare-fun bs!16615 () Bool)

(assert (= bs!16615 d!67001))

(assert (=> bs!16615 m!305251))

(assert (=> b!197852 d!67001))

(declare-fun d!67003 () Bool)

(declare-fun res!165742 () Bool)

(declare-fun e!135940 () Bool)

(assert (=> d!67003 (=> (not res!165742) (not e!135940))))

(assert (=> d!67003 (= res!165742 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) (size!4454 (buf!4940 (_2!9185 lt!308353)))))))

(assert (=> d!67003 (= (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!308353)) e!135940)))

(declare-fun b!198017 () Bool)

(declare-fun res!165741 () Bool)

(assert (=> b!198017 (=> (not res!165741) (not e!135940))))

(assert (=> b!198017 (= res!165741 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308353))) (currentByte!9278 (_2!9185 lt!308353)) (currentBit!9273 (_2!9185 lt!308353)))))))

(declare-fun b!198018 () Bool)

(declare-fun e!135939 () Bool)

(assert (=> b!198018 (= e!135940 e!135939)))

(declare-fun res!165740 () Bool)

(assert (=> b!198018 (=> res!165740 e!135939)))

(assert (=> b!198018 (= res!165740 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) #b00000000000000000000000000000000))))

(declare-fun b!198019 () Bool)

(assert (=> b!198019 (= e!135939 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!308353)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (= (and d!67003 res!165742) b!198017))

(assert (= (and b!198017 res!165741) b!198018))

(assert (= (and b!198018 (not res!165740)) b!198019))

(assert (=> b!198017 m!305047))

(assert (=> b!198017 m!305757))

(assert (=> b!198019 m!305047))

(assert (=> b!198019 m!305047))

(declare-fun m!306263 () Bool)

(assert (=> b!198019 m!306263))

(assert (=> b!197848 d!67003))

(assert (=> d!66729 d!66719))

(declare-fun d!67005 () Bool)

(assert (=> d!67005 (validate_offset_bits!1 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 thiss!1204)) ((_ sign_extend 32) (currentBit!9273 thiss!1204)) lt!307306)))

(assert (=> d!67005 true))

(declare-fun _$6!364 () Unit!13973)

(assert (=> d!67005 (= (choose!9 thiss!1204 (buf!4940 (_2!9185 lt!307308)) lt!307306 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))) _$6!364)))

(declare-fun bs!16616 () Bool)

(assert (= bs!16616 d!67005))

(assert (=> bs!16616 m!305093))

(assert (=> d!66729 d!67005))

(declare-fun d!67007 () Bool)

(declare-fun e!135941 () Bool)

(assert (=> d!67007 e!135941))

(declare-fun res!165743 () Bool)

(assert (=> d!67007 (=> (not res!165743) (not e!135941))))

(declare-fun lt!308687 () (_ BitVec 64))

(declare-fun lt!308686 () BitStream!8016)

(assert (=> d!67007 (= res!165743 (= (bvadd lt!308687 (bvsub lt!307627 lt!307617)) (bitIndex!0 (size!4454 (buf!4940 lt!308686)) (currentByte!9278 lt!308686) (currentBit!9273 lt!308686))))))

(assert (=> d!67007 (or (not (= (bvand lt!308687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307627 lt!307617) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308687 (bvsub lt!307627 lt!307617)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67007 (= lt!308687 (bitIndex!0 (size!4454 (buf!4940 (_2!9187 lt!307621))) (currentByte!9278 (_2!9187 lt!307621)) (currentBit!9273 (_2!9187 lt!307621))))))

(assert (=> d!67007 (= lt!308686 (_2!9185 (moveBitIndex!0 (_2!9187 lt!307621) (bvsub lt!307627 lt!307617))))))

(assert (=> d!67007 (moveBitIndexPrecond!0 (_2!9187 lt!307621) (bvsub lt!307627 lt!307617))))

(assert (=> d!67007 (= (withMovedBitIndex!0 (_2!9187 lt!307621) (bvsub lt!307627 lt!307617)) lt!308686)))

(declare-fun b!198020 () Bool)

(assert (=> b!198020 (= e!135941 (= (size!4454 (buf!4940 (_2!9187 lt!307621))) (size!4454 (buf!4940 lt!308686))))))

(assert (= (and d!67007 res!165743) b!198020))

(declare-fun m!306265 () Bool)

(assert (=> d!67007 m!306265))

(assert (=> d!67007 m!305861))

(declare-fun m!306267 () Bool)

(assert (=> d!67007 m!306267))

(declare-fun m!306269 () Bool)

(assert (=> d!67007 m!306269))

(assert (=> b!197643 d!67007))

(assert (=> b!197643 d!66745))

(assert (=> b!197643 d!66697))

(assert (=> d!66749 d!66747))

(declare-fun d!67009 () Bool)

(assert (=> d!67009 (isPrefixOf!0 thiss!1204 (_2!9185 lt!307308))))

(assert (=> d!67009 true))

(declare-fun _$15!288 () Unit!13973)

(assert (=> d!67009 (= (choose!30 thiss!1204 (_2!9185 lt!307286) (_2!9185 lt!307308)) _$15!288)))

(declare-fun bs!16617 () Bool)

(assert (= bs!16617 d!67009))

(assert (=> bs!16617 m!305053))

(assert (=> d!66749 d!67009))

(assert (=> d!66749 d!66693))

(assert (=> b!197843 d!66911))

(assert (=> d!66725 d!66733))

(declare-fun d!67011 () Bool)

(declare-fun lt!308688 () tuple2!17100)

(assert (=> d!67011 (= lt!308688 (readBit!0 lt!307603))))

(assert (=> d!67011 (= (readBitPure!0 lt!307603) (tuple2!17083 (_2!9195 lt!308688) (_1!9195 lt!308688)))))

(declare-fun bs!16618 () Bool)

(assert (= bs!16618 d!67011))

(declare-fun m!306271 () Bool)

(assert (=> bs!16618 m!306271))

(assert (=> d!66725 d!67011))

(declare-fun d!67013 () Bool)

(declare-fun e!135942 () Bool)

(assert (=> d!67013 e!135942))

(declare-fun res!165745 () Bool)

(assert (=> d!67013 (=> (not res!165745) (not e!135942))))

(declare-fun lt!308692 () (_ BitVec 64))

(declare-fun lt!308690 () (_ BitVec 64))

(declare-fun lt!308689 () (_ BitVec 64))

(assert (=> d!67013 (= res!165745 (= lt!308689 (bvsub lt!308692 lt!308690)))))

(assert (=> d!67013 (or (= (bvand lt!308692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308690 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308692 lt!308690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67013 (= lt!308690 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307601)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307601))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307601)))))))

(declare-fun lt!308691 () (_ BitVec 64))

(declare-fun lt!308694 () (_ BitVec 64))

(assert (=> d!67013 (= lt!308692 (bvmul lt!308691 lt!308694))))

(assert (=> d!67013 (or (= lt!308691 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308694 (bvsdiv (bvmul lt!308691 lt!308694) lt!308691)))))

(assert (=> d!67013 (= lt!308694 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67013 (= lt!308691 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307601)))))))

(assert (=> d!67013 (= lt!308689 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307601))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307601)))))))

(assert (=> d!67013 (invariant!0 (currentBit!9273 (_1!9186 lt!307601)) (currentByte!9278 (_1!9186 lt!307601)) (size!4454 (buf!4940 (_1!9186 lt!307601))))))

(assert (=> d!67013 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307601))) (currentByte!9278 (_1!9186 lt!307601)) (currentBit!9273 (_1!9186 lt!307601))) lt!308689)))

(declare-fun b!198021 () Bool)

(declare-fun res!165744 () Bool)

(assert (=> b!198021 (=> (not res!165744) (not e!135942))))

(assert (=> b!198021 (= res!165744 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308689))))

(declare-fun b!198022 () Bool)

(declare-fun lt!308693 () (_ BitVec 64))

(assert (=> b!198022 (= e!135942 (bvsle lt!308689 (bvmul lt!308693 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198022 (or (= lt!308693 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308693 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308693)))))

(assert (=> b!198022 (= lt!308693 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307601)))))))

(assert (= (and d!67013 res!165745) b!198021))

(assert (= (and b!198021 res!165744) b!198022))

(declare-fun m!306273 () Bool)

(assert (=> d!67013 m!306273))

(declare-fun m!306275 () Bool)

(assert (=> d!67013 m!306275))

(assert (=> d!66725 d!67013))

(declare-fun d!67015 () Bool)

(declare-fun e!135943 () Bool)

(assert (=> d!67015 e!135943))

(declare-fun res!165747 () Bool)

(assert (=> d!67015 (=> (not res!165747) (not e!135943))))

(declare-fun lt!308696 () (_ BitVec 64))

(declare-fun lt!308698 () (_ BitVec 64))

(declare-fun lt!308695 () (_ BitVec 64))

(assert (=> d!67015 (= res!165747 (= lt!308695 (bvsub lt!308698 lt!308696)))))

(assert (=> d!67015 (or (= (bvand lt!308698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308696 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308698 lt!308696) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67015 (= lt!308696 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307602)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307602))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307602)))))))

(declare-fun lt!308697 () (_ BitVec 64))

(declare-fun lt!308700 () (_ BitVec 64))

(assert (=> d!67015 (= lt!308698 (bvmul lt!308697 lt!308700))))

(assert (=> d!67015 (or (= lt!308697 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308700 (bvsdiv (bvmul lt!308697 lt!308700) lt!308697)))))

(assert (=> d!67015 (= lt!308700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67015 (= lt!308697 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307602)))))))

(assert (=> d!67015 (= lt!308695 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307602))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307602)))))))

(assert (=> d!67015 (invariant!0 (currentBit!9273 (_1!9186 lt!307602)) (currentByte!9278 (_1!9186 lt!307602)) (size!4454 (buf!4940 (_1!9186 lt!307602))))))

(assert (=> d!67015 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!307602))) (currentByte!9278 (_1!9186 lt!307602)) (currentBit!9273 (_1!9186 lt!307602))) lt!308695)))

(declare-fun b!198023 () Bool)

(declare-fun res!165746 () Bool)

(assert (=> b!198023 (=> (not res!165746) (not e!135943))))

(assert (=> b!198023 (= res!165746 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308695))))

(declare-fun b!198024 () Bool)

(declare-fun lt!308699 () (_ BitVec 64))

(assert (=> b!198024 (= e!135943 (bvsle lt!308695 (bvmul lt!308699 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198024 (or (= lt!308699 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308699 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308699)))))

(assert (=> b!198024 (= lt!308699 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307602)))))))

(assert (= (and d!67015 res!165747) b!198023))

(assert (= (and b!198023 res!165746) b!198024))

(declare-fun m!306277 () Bool)

(assert (=> d!67015 m!306277))

(declare-fun m!306279 () Bool)

(assert (=> d!67015 m!306279))

(assert (=> d!66725 d!67015))

(declare-fun d!67017 () Bool)

(assert (=> d!67017 (= (invariant!0 (currentBit!9273 lt!307296) (currentByte!9278 lt!307296) (size!4454 (buf!4940 (_2!9185 lt!307308)))) (and (bvsge (currentBit!9273 lt!307296) #b00000000000000000000000000000000) (bvslt (currentBit!9273 lt!307296) #b00000000000000000000000000001000) (bvsge (currentByte!9278 lt!307296) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 lt!307296) (size!4454 (buf!4940 (_2!9185 lt!307308)))) (and (= (currentBit!9273 lt!307296) #b00000000000000000000000000000000) (= (currentByte!9278 lt!307296) (size!4454 (buf!4940 (_2!9185 lt!307308))))))))))

(assert (=> d!66725 d!67017))

(declare-fun d!67019 () Bool)

(declare-fun e!135946 () Bool)

(assert (=> d!67019 e!135946))

(declare-fun res!165750 () Bool)

(assert (=> d!67019 (=> (not res!165750) (not e!135946))))

(declare-fun lt!308709 () tuple2!17082)

(declare-fun lt!308707 () tuple2!17082)

(assert (=> d!67019 (= res!165750 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308709))) (currentByte!9278 (_1!9186 lt!308709)) (currentBit!9273 (_1!9186 lt!308709))) (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308707))) (currentByte!9278 (_1!9186 lt!308707)) (currentBit!9273 (_1!9186 lt!308707)))))))

(declare-fun lt!308708 () BitStream!8016)

(assert (=> d!67019 (= lt!308707 (readBitPure!0 lt!308708))))

(assert (=> d!67019 (= lt!308709 (readBitPure!0 lt!307296))))

(assert (=> d!67019 (= lt!308708 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 lt!307296) (currentBit!9273 lt!307296)))))

(assert (=> d!67019 (invariant!0 (currentBit!9273 lt!307296) (currentByte!9278 lt!307296) (size!4454 (buf!4940 (_2!9185 lt!307308))))))

(assert (=> d!67019 true))

(declare-fun _$9!69 () Unit!13973)

(assert (=> d!67019 (= (choose!50 lt!307296 (_2!9185 lt!307308) lt!307603 lt!307601 (tuple2!17083 (_1!9186 lt!307601) (_2!9186 lt!307601)) (_1!9186 lt!307601) (_2!9186 lt!307601) lt!307602 (tuple2!17083 (_1!9186 lt!307602) (_2!9186 lt!307602)) (_1!9186 lt!307602) (_2!9186 lt!307602)) _$9!69)))

(declare-fun b!198027 () Bool)

(assert (=> b!198027 (= e!135946 (= (_2!9186 lt!308709) (_2!9186 lt!308707)))))

(assert (= (and d!67019 res!165750) b!198027))

(assert (=> d!67019 m!305315))

(declare-fun m!306281 () Bool)

(assert (=> d!67019 m!306281))

(declare-fun m!306283 () Bool)

(assert (=> d!67019 m!306283))

(assert (=> d!67019 m!305099))

(declare-fun m!306285 () Bool)

(assert (=> d!67019 m!306285))

(assert (=> d!66725 d!67019))

(declare-fun d!67021 () Bool)

(declare-fun res!165753 () Bool)

(declare-fun e!135948 () Bool)

(assert (=> d!67021 (=> (not res!165753) (not e!135948))))

(assert (=> d!67021 (= res!165753 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) (size!4454 (buf!4940 (ite c!9840 (_2!9185 lt!307286) (_2!9185 lt!308349))))))))

(assert (=> d!67021 (= (isPrefixOf!0 (_2!9185 lt!307286) (ite c!9840 (_2!9185 lt!307286) (_2!9185 lt!308349))) e!135948)))

(declare-fun b!198028 () Bool)

(declare-fun res!165752 () Bool)

(assert (=> b!198028 (=> (not res!165752) (not e!135948))))

(assert (=> b!198028 (= res!165752 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (ite c!9840 (_2!9185 lt!307286) (_2!9185 lt!308349)))) (currentByte!9278 (ite c!9840 (_2!9185 lt!307286) (_2!9185 lt!308349))) (currentBit!9273 (ite c!9840 (_2!9185 lt!307286) (_2!9185 lt!308349))))))))

(declare-fun b!198029 () Bool)

(declare-fun e!135947 () Bool)

(assert (=> b!198029 (= e!135948 e!135947)))

(declare-fun res!165751 () Bool)

(assert (=> b!198029 (=> res!165751 e!135947)))

(assert (=> b!198029 (= res!165751 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) #b00000000000000000000000000000000))))

(declare-fun b!198030 () Bool)

(assert (=> b!198030 (= e!135947 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (ite c!9840 (_2!9185 lt!307286) (_2!9185 lt!308349))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (= (and d!67021 res!165753) b!198028))

(assert (= (and b!198028 res!165752) b!198029))

(assert (= (and b!198029 (not res!165751)) b!198030))

(assert (=> b!198028 m!305047))

(declare-fun m!306287 () Bool)

(assert (=> b!198028 m!306287))

(assert (=> b!198030 m!305047))

(assert (=> b!198030 m!305047))

(declare-fun m!306289 () Bool)

(assert (=> b!198030 m!306289))

(assert (=> bm!3107 d!67021))

(assert (=> d!66713 d!66747))

(declare-fun d!67023 () Bool)

(declare-fun res!165756 () Bool)

(declare-fun e!135950 () Bool)

(assert (=> d!67023 (=> (not res!165756) (not e!135950))))

(assert (=> d!67023 (= res!165756 (= (size!4454 (buf!4940 lt!307579)) (size!4454 (buf!4940 (_2!9185 lt!307308)))))))

(assert (=> d!67023 (= (isPrefixOf!0 lt!307579 (_2!9185 lt!307308)) e!135950)))

(declare-fun b!198031 () Bool)

(declare-fun res!165755 () Bool)

(assert (=> b!198031 (=> (not res!165755) (not e!135950))))

(assert (=> b!198031 (= res!165755 (bvsle (bitIndex!0 (size!4454 (buf!4940 lt!307579)) (currentByte!9278 lt!307579) (currentBit!9273 lt!307579)) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308)))))))

(declare-fun b!198032 () Bool)

(declare-fun e!135949 () Bool)

(assert (=> b!198032 (= e!135950 e!135949)))

(declare-fun res!165754 () Bool)

(assert (=> b!198032 (=> res!165754 e!135949)))

(assert (=> b!198032 (= res!165754 (= (size!4454 (buf!4940 lt!307579)) #b00000000000000000000000000000000))))

(declare-fun b!198033 () Bool)

(assert (=> b!198033 (= e!135949 (arrayBitRangesEq!0 (buf!4940 lt!307579) (buf!4940 (_2!9185 lt!307308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 lt!307579)) (currentByte!9278 lt!307579) (currentBit!9273 lt!307579))))))

(assert (= (and d!67023 res!165756) b!198031))

(assert (= (and b!198031 res!165755) b!198032))

(assert (= (and b!198032 (not res!165754)) b!198033))

(declare-fun m!306291 () Bool)

(assert (=> b!198031 m!306291))

(assert (=> b!198031 m!305051))

(assert (=> b!198033 m!306291))

(assert (=> b!198033 m!306291))

(declare-fun m!306293 () Bool)

(assert (=> b!198033 m!306293))

(assert (=> d!66713 d!67023))

(declare-fun d!67025 () Bool)

(assert (=> d!67025 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!308710 () Unit!13973)

(assert (=> d!67025 (= lt!308710 (choose!11 thiss!1204))))

(assert (=> d!67025 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!308710)))

(declare-fun bs!16619 () Bool)

(assert (= bs!16619 d!67025))

(assert (=> bs!16619 m!305287))

(declare-fun m!306295 () Bool)

(assert (=> bs!16619 m!306295))

(assert (=> d!66713 d!67025))

(declare-fun d!67027 () Bool)

(assert (=> d!67027 (isPrefixOf!0 lt!307579 (_2!9185 lt!307308))))

(declare-fun lt!308711 () Unit!13973)

(assert (=> d!67027 (= lt!308711 (choose!30 lt!307579 (_2!9185 lt!307308) (_2!9185 lt!307308)))))

(assert (=> d!67027 (isPrefixOf!0 lt!307579 (_2!9185 lt!307308))))

(assert (=> d!67027 (= (lemmaIsPrefixTransitive!0 lt!307579 (_2!9185 lt!307308) (_2!9185 lt!307308)) lt!308711)))

(declare-fun bs!16620 () Bool)

(assert (= bs!16620 d!67027))

(assert (=> bs!16620 m!305295))

(declare-fun m!306297 () Bool)

(assert (=> bs!16620 m!306297))

(assert (=> bs!16620 m!305295))

(assert (=> d!66713 d!67027))

(declare-fun d!67029 () Bool)

(assert (=> d!67029 (isPrefixOf!0 lt!307579 (_2!9185 lt!307308))))

(declare-fun lt!308712 () Unit!13973)

(assert (=> d!67029 (= lt!308712 (choose!30 lt!307579 thiss!1204 (_2!9185 lt!307308)))))

(assert (=> d!67029 (isPrefixOf!0 lt!307579 thiss!1204)))

(assert (=> d!67029 (= (lemmaIsPrefixTransitive!0 lt!307579 thiss!1204 (_2!9185 lt!307308)) lt!308712)))

(declare-fun bs!16621 () Bool)

(assert (= bs!16621 d!67029))

(assert (=> bs!16621 m!305295))

(declare-fun m!306299 () Bool)

(assert (=> bs!16621 m!306299))

(declare-fun m!306301 () Bool)

(assert (=> bs!16621 m!306301))

(assert (=> d!66713 d!67029))

(assert (=> d!66713 d!66913))

(declare-fun d!67031 () Bool)

(declare-fun res!165759 () Bool)

(declare-fun e!135952 () Bool)

(assert (=> d!67031 (=> (not res!165759) (not e!135952))))

(assert (=> d!67031 (= res!165759 (= (size!4454 (buf!4940 lt!307579)) (size!4454 (buf!4940 lt!307579))))))

(assert (=> d!67031 (= (isPrefixOf!0 lt!307579 lt!307579) e!135952)))

(declare-fun b!198034 () Bool)

(declare-fun res!165758 () Bool)

(assert (=> b!198034 (=> (not res!165758) (not e!135952))))

(assert (=> b!198034 (= res!165758 (bvsle (bitIndex!0 (size!4454 (buf!4940 lt!307579)) (currentByte!9278 lt!307579) (currentBit!9273 lt!307579)) (bitIndex!0 (size!4454 (buf!4940 lt!307579)) (currentByte!9278 lt!307579) (currentBit!9273 lt!307579))))))

(declare-fun b!198035 () Bool)

(declare-fun e!135951 () Bool)

(assert (=> b!198035 (= e!135952 e!135951)))

(declare-fun res!165757 () Bool)

(assert (=> b!198035 (=> res!165757 e!135951)))

(assert (=> b!198035 (= res!165757 (= (size!4454 (buf!4940 lt!307579)) #b00000000000000000000000000000000))))

(declare-fun b!198036 () Bool)

(assert (=> b!198036 (= e!135951 (arrayBitRangesEq!0 (buf!4940 lt!307579) (buf!4940 lt!307579) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 lt!307579)) (currentByte!9278 lt!307579) (currentBit!9273 lt!307579))))))

(assert (= (and d!67031 res!165759) b!198034))

(assert (= (and b!198034 res!165758) b!198035))

(assert (= (and b!198035 (not res!165757)) b!198036))

(assert (=> b!198034 m!306291))

(assert (=> b!198034 m!306291))

(assert (=> b!198036 m!306291))

(assert (=> b!198036 m!306291))

(declare-fun m!306303 () Bool)

(assert (=> b!198036 m!306303))

(assert (=> d!66713 d!67031))

(declare-fun d!67033 () Bool)

(declare-fun res!165762 () Bool)

(declare-fun e!135954 () Bool)

(assert (=> d!67033 (=> (not res!165762) (not e!135954))))

(assert (=> d!67033 (= res!165762 (= (size!4454 (buf!4940 (_1!9187 lt!307568))) (size!4454 (buf!4940 (_2!9187 lt!307568)))))))

(assert (=> d!67033 (= (isPrefixOf!0 (_1!9187 lt!307568) (_2!9187 lt!307568)) e!135954)))

(declare-fun b!198037 () Bool)

(declare-fun res!165761 () Bool)

(assert (=> b!198037 (=> (not res!165761) (not e!135954))))

(assert (=> b!198037 (= res!165761 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307568))) (currentByte!9278 (_1!9187 lt!307568)) (currentBit!9273 (_1!9187 lt!307568))) (bitIndex!0 (size!4454 (buf!4940 (_2!9187 lt!307568))) (currentByte!9278 (_2!9187 lt!307568)) (currentBit!9273 (_2!9187 lt!307568)))))))

(declare-fun b!198038 () Bool)

(declare-fun e!135953 () Bool)

(assert (=> b!198038 (= e!135954 e!135953)))

(declare-fun res!165760 () Bool)

(assert (=> b!198038 (=> res!165760 e!135953)))

(assert (=> b!198038 (= res!165760 (= (size!4454 (buf!4940 (_1!9187 lt!307568))) #b00000000000000000000000000000000))))

(declare-fun b!198039 () Bool)

(assert (=> b!198039 (= e!135953 (arrayBitRangesEq!0 (buf!4940 (_1!9187 lt!307568)) (buf!4940 (_2!9187 lt!307568)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307568))) (currentByte!9278 (_1!9187 lt!307568)) (currentBit!9273 (_1!9187 lt!307568)))))))

(assert (= (and d!67033 res!165762) b!198037))

(assert (= (and b!198037 res!165761) b!198038))

(assert (= (and b!198038 (not res!165760)) b!198039))

(declare-fun m!306305 () Bool)

(assert (=> b!198037 m!306305))

(assert (=> b!198037 m!305989))

(assert (=> b!198039 m!306305))

(assert (=> b!198039 m!306305))

(declare-fun m!306307 () Bool)

(assert (=> b!198039 m!306307))

(assert (=> d!66713 d!67033))

(assert (=> d!66713 d!66917))

(declare-fun d!67035 () Bool)

(assert (=> d!67035 (isPrefixOf!0 lt!307579 lt!307579)))

(declare-fun lt!308713 () Unit!13973)

(assert (=> d!67035 (= lt!308713 (choose!11 lt!307579))))

(assert (=> d!67035 (= (lemmaIsPrefixRefl!0 lt!307579) lt!308713)))

(declare-fun bs!16622 () Bool)

(assert (= bs!16622 d!67035))

(assert (=> bs!16622 m!305291))

(declare-fun m!306309 () Bool)

(assert (=> bs!16622 m!306309))

(assert (=> d!66713 d!67035))

(declare-fun d!67037 () Bool)

(declare-fun res!165765 () Bool)

(declare-fun e!135956 () Bool)

(assert (=> d!67037 (=> (not res!165765) (not e!135956))))

(assert (=> d!67037 (= res!165765 (= (size!4454 (buf!4940 thiss!1204)) (size!4454 (buf!4940 thiss!1204))))))

(assert (=> d!67037 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!135956)))

(declare-fun b!198040 () Bool)

(declare-fun res!165764 () Bool)

(assert (=> b!198040 (=> (not res!165764) (not e!135956))))

(assert (=> b!198040 (= res!165764 (bvsle (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)) (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(declare-fun b!198041 () Bool)

(declare-fun e!135955 () Bool)

(assert (=> b!198041 (= e!135956 e!135955)))

(declare-fun res!165763 () Bool)

(assert (=> b!198041 (=> res!165763 e!135955)))

(assert (=> b!198041 (= res!165763 (= (size!4454 (buf!4940 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!198042 () Bool)

(assert (=> b!198042 (= e!135955 (arrayBitRangesEq!0 (buf!4940 thiss!1204) (buf!4940 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(assert (= (and d!67037 res!165765) b!198040))

(assert (= (and b!198040 res!165764) b!198041))

(assert (= (and b!198041 (not res!165763)) b!198042))

(assert (=> b!198040 m!305049))

(assert (=> b!198040 m!305049))

(assert (=> b!198042 m!305049))

(assert (=> b!198042 m!305049))

(declare-fun m!306311 () Bool)

(assert (=> b!198042 m!306311))

(assert (=> d!66713 d!67037))

(assert (=> b!197641 d!66697))

(declare-fun d!67039 () Bool)

(assert (=> d!67039 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307308)) (buf!4940 (_2!9185 lt!307286)) lt!307622 lt!307634)))

(declare-fun lt!308714 () Unit!13973)

(assert (=> d!67039 (= lt!308714 (choose!8 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!307308)) lt!307622 lt!307634))))

(assert (=> d!67039 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307622) (bvsle lt!307622 lt!307634))))

(assert (=> d!67039 (= (arrayBitRangesEqSymmetric!0 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!307308)) lt!307622 lt!307634) lt!308714)))

(declare-fun bs!16623 () Bool)

(assert (= bs!16623 d!67039))

(assert (=> bs!16623 m!305339))

(declare-fun m!306313 () Bool)

(assert (=> bs!16623 m!306313))

(assert (=> b!197641 d!67039))

(declare-fun b!198043 () Bool)

(declare-fun e!135961 () Bool)

(declare-fun e!135962 () Bool)

(assert (=> b!198043 (= e!135961 e!135962)))

(declare-fun res!165769 () Bool)

(assert (=> b!198043 (=> (not res!165769) (not e!135962))))

(declare-fun e!135959 () Bool)

(assert (=> b!198043 (= res!165769 e!135959)))

(declare-fun res!165767 () Bool)

(assert (=> b!198043 (=> res!165767 e!135959)))

(declare-fun lt!308715 () tuple4!258)

(assert (=> b!198043 (= res!165767 (bvsge (_1!9199 lt!308715) (_2!9199 lt!308715)))))

(declare-fun lt!308717 () (_ BitVec 32))

(assert (=> b!198043 (= lt!308717 ((_ extract 31 0) (bvsrem lt!307634 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!308716 () (_ BitVec 32))

(assert (=> b!198043 (= lt!308716 ((_ extract 31 0) (bvsrem lt!307622 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198043 (= lt!308715 (arrayBitIndices!0 lt!307622 lt!307634))))

(declare-fun bm!3113 () Bool)

(declare-fun call!3116 () Bool)

(declare-fun c!9854 () Bool)

(assert (=> bm!3113 (= call!3116 (byteRangesEq!0 (ite c!9854 (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_3!645 lt!308715)) (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_4!129 lt!308715))) (ite c!9854 (select (arr!5384 (buf!4940 (_2!9185 lt!307286))) (_3!645 lt!308715)) (select (arr!5384 (buf!4940 (_2!9185 lt!307286))) (_4!129 lt!308715))) (ite c!9854 lt!308716 #b00000000000000000000000000000000) lt!308717))))

(declare-fun b!198044 () Bool)

(declare-fun res!165770 () Bool)

(assert (=> b!198044 (= res!165770 (= lt!308717 #b00000000000000000000000000000000))))

(declare-fun e!135960 () Bool)

(assert (=> b!198044 (=> res!165770 e!135960)))

(declare-fun e!135957 () Bool)

(assert (=> b!198044 (= e!135957 e!135960)))

(declare-fun b!198045 () Bool)

(declare-fun e!135958 () Bool)

(assert (=> b!198045 (= e!135958 call!3116)))

(declare-fun b!198046 () Bool)

(assert (=> b!198046 (= e!135962 e!135958)))

(assert (=> b!198046 (= c!9854 (= (_3!645 lt!308715) (_4!129 lt!308715)))))

(declare-fun d!67041 () Bool)

(declare-fun res!165766 () Bool)

(assert (=> d!67041 (=> res!165766 e!135961)))

(assert (=> d!67041 (= res!165766 (bvsge lt!307622 lt!307634))))

(assert (=> d!67041 (= (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307308)) (buf!4940 (_2!9185 lt!307286)) lt!307622 lt!307634) e!135961)))

(declare-fun b!198047 () Bool)

(assert (=> b!198047 (= e!135958 e!135957)))

(declare-fun res!165768 () Bool)

(assert (=> b!198047 (= res!165768 (byteRangesEq!0 (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_3!645 lt!308715)) (select (arr!5384 (buf!4940 (_2!9185 lt!307286))) (_3!645 lt!308715)) lt!308716 #b00000000000000000000000000001000))))

(assert (=> b!198047 (=> (not res!165768) (not e!135957))))

(declare-fun b!198048 () Bool)

(assert (=> b!198048 (= e!135960 call!3116)))

(declare-fun b!198049 () Bool)

(assert (=> b!198049 (= e!135959 (arrayRangesEq!691 (buf!4940 (_2!9185 lt!307308)) (buf!4940 (_2!9185 lt!307286)) (_1!9199 lt!308715) (_2!9199 lt!308715)))))

(assert (= (and d!67041 (not res!165766)) b!198043))

(assert (= (and b!198043 (not res!165767)) b!198049))

(assert (= (and b!198043 res!165769) b!198046))

(assert (= (and b!198046 c!9854) b!198045))

(assert (= (and b!198046 (not c!9854)) b!198047))

(assert (= (and b!198047 res!165768) b!198044))

(assert (= (and b!198044 (not res!165770)) b!198048))

(assert (= (or b!198045 b!198048) bm!3113))

(declare-fun m!306315 () Bool)

(assert (=> b!198043 m!306315))

(declare-fun m!306317 () Bool)

(assert (=> bm!3113 m!306317))

(declare-fun m!306319 () Bool)

(assert (=> bm!3113 m!306319))

(declare-fun m!306321 () Bool)

(assert (=> bm!3113 m!306321))

(declare-fun m!306323 () Bool)

(assert (=> bm!3113 m!306323))

(declare-fun m!306325 () Bool)

(assert (=> bm!3113 m!306325))

(assert (=> b!198047 m!306317))

(assert (=> b!198047 m!306323))

(assert (=> b!198047 m!306317))

(assert (=> b!198047 m!306323))

(declare-fun m!306327 () Bool)

(assert (=> b!198047 m!306327))

(declare-fun m!306329 () Bool)

(assert (=> b!198049 m!306329))

(assert (=> b!197641 d!67041))

(declare-fun d!67043 () Bool)

(assert (=> d!67043 (= (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307287)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307287))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307287)))) (bvsub (bvmul ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!307287)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!307287))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!307287))))))))

(assert (=> d!66721 d!67043))

(declare-fun d!67045 () Bool)

(assert (=> d!67045 (= (invariant!0 (currentBit!9273 (_1!9186 lt!307287)) (currentByte!9278 (_1!9186 lt!307287)) (size!4454 (buf!4940 (_1!9186 lt!307287)))) (and (bvsge (currentBit!9273 (_1!9186 lt!307287)) #b00000000000000000000000000000000) (bvslt (currentBit!9273 (_1!9186 lt!307287)) #b00000000000000000000000000001000) (bvsge (currentByte!9278 (_1!9186 lt!307287)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 (_1!9186 lt!307287)) (size!4454 (buf!4940 (_1!9186 lt!307287)))) (and (= (currentBit!9273 (_1!9186 lt!307287)) #b00000000000000000000000000000000) (= (currentByte!9278 (_1!9186 lt!307287)) (size!4454 (buf!4940 (_1!9186 lt!307287))))))))))

(assert (=> d!66721 d!67045))

(declare-fun b!198050 () Bool)

(declare-fun e!135967 () Bool)

(declare-fun e!135968 () Bool)

(assert (=> b!198050 (= e!135967 e!135968)))

(declare-fun res!165774 () Bool)

(assert (=> b!198050 (=> (not res!165774) (not e!135968))))

(declare-fun e!135965 () Bool)

(assert (=> b!198050 (= res!165774 e!135965)))

(declare-fun res!165772 () Bool)

(assert (=> b!198050 (=> res!165772 e!135965)))

(declare-fun lt!308718 () tuple4!258)

(assert (=> b!198050 (= res!165772 (bvsge (_1!9199 lt!308718) (_2!9199 lt!308718)))))

(declare-fun lt!308720 () (_ BitVec 32))

(assert (=> b!198050 (= lt!308720 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!308719 () (_ BitVec 32))

(assert (=> b!198050 (= lt!308719 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198050 (= lt!308718 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(declare-fun call!3117 () Bool)

(declare-fun bm!3114 () Bool)

(declare-fun c!9855 () Bool)

(assert (=> bm!3114 (= call!3117 (byteRangesEq!0 (ite c!9855 (select (arr!5384 (buf!4940 thiss!1204)) (_3!645 lt!308718)) (select (arr!5384 (buf!4940 thiss!1204)) (_4!129 lt!308718))) (ite c!9855 (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_3!645 lt!308718)) (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_4!129 lt!308718))) (ite c!9855 lt!308719 #b00000000000000000000000000000000) lt!308720))))

(declare-fun b!198051 () Bool)

(declare-fun res!165775 () Bool)

(assert (=> b!198051 (= res!165775 (= lt!308720 #b00000000000000000000000000000000))))

(declare-fun e!135966 () Bool)

(assert (=> b!198051 (=> res!165775 e!135966)))

(declare-fun e!135963 () Bool)

(assert (=> b!198051 (= e!135963 e!135966)))

(declare-fun b!198052 () Bool)

(declare-fun e!135964 () Bool)

(assert (=> b!198052 (= e!135964 call!3117)))

(declare-fun b!198053 () Bool)

(assert (=> b!198053 (= e!135968 e!135964)))

(assert (=> b!198053 (= c!9855 (= (_3!645 lt!308718) (_4!129 lt!308718)))))

(declare-fun d!67047 () Bool)

(declare-fun res!165771 () Bool)

(assert (=> d!67047 (=> res!165771 e!135967)))

(assert (=> d!67047 (= res!165771 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(assert (=> d!67047 (= (arrayBitRangesEq!0 (buf!4940 thiss!1204) (buf!4940 (_2!9185 lt!307308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))) e!135967)))

(declare-fun b!198054 () Bool)

(assert (=> b!198054 (= e!135964 e!135963)))

(declare-fun res!165773 () Bool)

(assert (=> b!198054 (= res!165773 (byteRangesEq!0 (select (arr!5384 (buf!4940 thiss!1204)) (_3!645 lt!308718)) (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_3!645 lt!308718)) lt!308719 #b00000000000000000000000000001000))))

(assert (=> b!198054 (=> (not res!165773) (not e!135963))))

(declare-fun b!198055 () Bool)

(assert (=> b!198055 (= e!135966 call!3117)))

(declare-fun b!198056 () Bool)

(assert (=> b!198056 (= e!135965 (arrayRangesEq!691 (buf!4940 thiss!1204) (buf!4940 (_2!9185 lt!307308)) (_1!9199 lt!308718) (_2!9199 lt!308718)))))

(assert (= (and d!67047 (not res!165771)) b!198050))

(assert (= (and b!198050 (not res!165772)) b!198056))

(assert (= (and b!198050 res!165774) b!198053))

(assert (= (and b!198053 c!9855) b!198052))

(assert (= (and b!198053 (not c!9855)) b!198054))

(assert (= (and b!198054 res!165773) b!198051))

(assert (= (and b!198051 (not res!165775)) b!198055))

(assert (= (or b!198052 b!198055) bm!3114))

(assert (=> b!198050 m!305049))

(assert (=> b!198050 m!305877))

(declare-fun m!306331 () Bool)

(assert (=> bm!3114 m!306331))

(declare-fun m!306333 () Bool)

(assert (=> bm!3114 m!306333))

(declare-fun m!306335 () Bool)

(assert (=> bm!3114 m!306335))

(declare-fun m!306337 () Bool)

(assert (=> bm!3114 m!306337))

(declare-fun m!306339 () Bool)

(assert (=> bm!3114 m!306339))

(assert (=> b!198054 m!306331))

(assert (=> b!198054 m!306337))

(assert (=> b!198054 m!306331))

(assert (=> b!198054 m!306337))

(declare-fun m!306341 () Bool)

(assert (=> b!198054 m!306341))

(declare-fun m!306343 () Bool)

(assert (=> b!198056 m!306343))

(assert (=> b!197649 d!67047))

(assert (=> b!197649 d!66699))

(declare-fun d!67049 () Bool)

(assert (=> d!67049 (= (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307308))) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307308)))) (bvsub (bvmul ((_ sign_extend 32) (size!4454 (buf!4940 (_2!9185 lt!307308)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_2!9185 lt!307308))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_2!9185 lt!307308))))))))

(assert (=> d!66745 d!67049))

(assert (=> d!66745 d!66707))

(declare-fun d!67051 () Bool)

(declare-fun lt!308721 () tuple2!17100)

(assert (=> d!67051 (= lt!308721 (readBit!0 (readerFrom!0 (_2!9185 lt!307519) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))))))

(assert (=> d!67051 (= (readBitPure!0 (readerFrom!0 (_2!9185 lt!307519) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204))) (tuple2!17083 (_2!9195 lt!308721) (_1!9195 lt!308721)))))

(declare-fun bs!16624 () Bool)

(assert (= bs!16624 d!67051))

(assert (=> bs!16624 m!305267))

(declare-fun m!306345 () Bool)

(assert (=> bs!16624 m!306345))

(assert (=> b!197616 d!67051))

(declare-fun d!67053 () Bool)

(declare-fun e!135969 () Bool)

(assert (=> d!67053 e!135969))

(declare-fun res!165776 () Bool)

(assert (=> d!67053 (=> (not res!165776) (not e!135969))))

(assert (=> d!67053 (= res!165776 (invariant!0 (currentBit!9273 (_2!9185 lt!307519)) (currentByte!9278 (_2!9185 lt!307519)) (size!4454 (buf!4940 (_2!9185 lt!307519)))))))

(assert (=> d!67053 (= (readerFrom!0 (_2!9185 lt!307519) (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204)) (BitStream!8017 (buf!4940 (_2!9185 lt!307519)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))

(declare-fun b!198057 () Bool)

(assert (=> b!198057 (= e!135969 (invariant!0 (currentBit!9273 thiss!1204) (currentByte!9278 thiss!1204) (size!4454 (buf!4940 (_2!9185 lt!307519)))))))

(assert (= (and d!67053 res!165776) b!198057))

(assert (=> d!67053 m!305909))

(declare-fun m!306347 () Bool)

(assert (=> b!198057 m!306347))

(assert (=> b!197616 d!67053))

(assert (=> b!197647 d!66699))

(assert (=> b!197647 d!66745))

(declare-fun d!67055 () Bool)

(assert (=> d!67055 (= (invariant!0 (currentBit!9273 (_2!9185 lt!308356)) (currentByte!9278 (_2!9185 lt!308356)) (size!4454 (buf!4940 (_2!9185 lt!308356)))) (and (bvsge (currentBit!9273 (_2!9185 lt!308356)) #b00000000000000000000000000000000) (bvslt (currentBit!9273 (_2!9185 lt!308356)) #b00000000000000000000000000001000) (bvsge (currentByte!9278 (_2!9185 lt!308356)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9278 (_2!9185 lt!308356)) (size!4454 (buf!4940 (_2!9185 lt!308356)))) (and (= (currentBit!9273 (_2!9185 lt!308356)) #b00000000000000000000000000000000) (= (currentByte!9278 (_2!9185 lt!308356)) (size!4454 (buf!4940 (_2!9185 lt!308356))))))))))

(assert (=> d!66751 d!67055))

(assert (=> b!197614 d!66881))

(assert (=> b!197614 d!66699))

(assert (=> d!66703 d!66851))

(declare-fun d!67057 () Bool)

(declare-fun e!135970 () Bool)

(assert (=> d!67057 e!135970))

(declare-fun res!165777 () Bool)

(assert (=> d!67057 (=> (not res!165777) (not e!135970))))

(assert (=> d!67057 (= res!165777 (= (buf!4940 (_2!9185 (increaseBitIndex!0 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))) (buf!4940 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))))

(declare-fun lt!308725 () Bool)

(assert (=> d!67057 (= lt!308725 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))) (currentByte!9278 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308724 () tuple2!17100)

(assert (=> d!67057 (= lt!308724 (tuple2!17101 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))) (currentByte!9278 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9185 (increaseBitIndex!0 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))))

(assert (=> d!67057 (validate_offset_bit!0 ((_ sign_extend 32) (size!4454 (buf!4940 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))) ((_ sign_extend 32) (currentByte!9278 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))) ((_ sign_extend 32) (currentBit!9273 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))))

(assert (=> d!67057 (= (readBit!0 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))) lt!308724)))

(declare-fun b!198058 () Bool)

(declare-fun lt!308723 () (_ BitVec 64))

(declare-fun lt!308727 () (_ BitVec 64))

(assert (=> b!198058 (= e!135970 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9185 (increaseBitIndex!0 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))) (currentByte!9278 (_2!9185 (increaseBitIndex!0 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))) (currentBit!9273 (_2!9185 (increaseBitIndex!0 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))) (bvadd lt!308723 lt!308727)))))

(assert (=> b!198058 (or (not (= (bvand lt!308723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308727 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308723 lt!308727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198058 (= lt!308727 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198058 (= lt!308723 (bitIndex!0 (size!4454 (buf!4940 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))) (currentByte!9278 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))) (currentBit!9273 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))))

(declare-fun lt!308728 () Bool)

(assert (=> b!198058 (= lt!308728 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))) (currentByte!9278 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308726 () Bool)

(assert (=> b!198058 (= lt!308726 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))) (currentByte!9278 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!308722 () Bool)

(assert (=> b!198058 (= lt!308722 (not (= (bvand ((_ sign_extend 24) (select (arr!5384 (buf!4940 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))) (currentByte!9278 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9273 (BitStream!8017 (buf!4940 (_2!9185 lt!307308)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!67057 res!165777) b!198058))

(declare-fun m!306349 () Bool)

(assert (=> d!67057 m!306349))

(declare-fun m!306351 () Bool)

(assert (=> d!67057 m!306351))

(declare-fun m!306353 () Bool)

(assert (=> d!67057 m!306353))

(declare-fun m!306355 () Bool)

(assert (=> d!67057 m!306355))

(assert (=> b!198058 m!306349))

(declare-fun m!306357 () Bool)

(assert (=> b!198058 m!306357))

(assert (=> b!198058 m!306353))

(assert (=> b!198058 m!306351))

(declare-fun m!306359 () Bool)

(assert (=> b!198058 m!306359))

(assert (=> d!66723 d!67057))

(declare-fun b!198059 () Bool)

(declare-fun e!135975 () Bool)

(declare-fun e!135976 () Bool)

(assert (=> b!198059 (= e!135975 e!135976)))

(declare-fun res!165781 () Bool)

(assert (=> b!198059 (=> (not res!165781) (not e!135976))))

(declare-fun e!135973 () Bool)

(assert (=> b!198059 (= res!165781 e!135973)))

(declare-fun res!165779 () Bool)

(assert (=> b!198059 (=> res!165779 e!135973)))

(declare-fun lt!308729 () tuple4!258)

(assert (=> b!198059 (= res!165779 (bvsge (_1!9199 lt!308729) (_2!9199 lt!308729)))))

(declare-fun lt!308731 () (_ BitVec 32))

(assert (=> b!198059 (= lt!308731 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!308730 () (_ BitVec 32))

(assert (=> b!198059 (= lt!308730 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198059 (= lt!308729 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(declare-fun call!3118 () Bool)

(declare-fun bm!3115 () Bool)

(declare-fun c!9856 () Bool)

(assert (=> bm!3115 (= call!3118 (byteRangesEq!0 (ite c!9856 (select (arr!5384 (buf!4940 (_2!9185 lt!307286))) (_3!645 lt!308729)) (select (arr!5384 (buf!4940 (_2!9185 lt!307286))) (_4!129 lt!308729))) (ite c!9856 (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_3!645 lt!308729)) (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_4!129 lt!308729))) (ite c!9856 lt!308730 #b00000000000000000000000000000000) lt!308731))))

(declare-fun b!198060 () Bool)

(declare-fun res!165782 () Bool)

(assert (=> b!198060 (= res!165782 (= lt!308731 #b00000000000000000000000000000000))))

(declare-fun e!135974 () Bool)

(assert (=> b!198060 (=> res!165782 e!135974)))

(declare-fun e!135971 () Bool)

(assert (=> b!198060 (= e!135971 e!135974)))

(declare-fun b!198061 () Bool)

(declare-fun e!135972 () Bool)

(assert (=> b!198061 (= e!135972 call!3118)))

(declare-fun b!198062 () Bool)

(assert (=> b!198062 (= e!135976 e!135972)))

(assert (=> b!198062 (= c!9856 (= (_3!645 lt!308729) (_4!129 lt!308729)))))

(declare-fun d!67059 () Bool)

(declare-fun res!165778 () Bool)

(assert (=> d!67059 (=> res!165778 e!135975)))

(assert (=> d!67059 (= res!165778 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (=> d!67059 (= (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!307308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))) e!135975)))

(declare-fun b!198063 () Bool)

(assert (=> b!198063 (= e!135972 e!135971)))

(declare-fun res!165780 () Bool)

(assert (=> b!198063 (= res!165780 (byteRangesEq!0 (select (arr!5384 (buf!4940 (_2!9185 lt!307286))) (_3!645 lt!308729)) (select (arr!5384 (buf!4940 (_2!9185 lt!307308))) (_3!645 lt!308729)) lt!308730 #b00000000000000000000000000001000))))

(assert (=> b!198063 (=> (not res!165780) (not e!135971))))

(declare-fun b!198064 () Bool)

(assert (=> b!198064 (= e!135974 call!3118)))

(declare-fun b!198065 () Bool)

(assert (=> b!198065 (= e!135973 (arrayRangesEq!691 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!307308)) (_1!9199 lt!308729) (_2!9199 lt!308729)))))

(assert (= (and d!67059 (not res!165778)) b!198059))

(assert (= (and b!198059 (not res!165779)) b!198065))

(assert (= (and b!198059 res!165781) b!198062))

(assert (= (and b!198062 c!9856) b!198061))

(assert (= (and b!198062 (not c!9856)) b!198063))

(assert (= (and b!198063 res!165780) b!198060))

(assert (= (and b!198060 (not res!165782)) b!198064))

(assert (= (or b!198061 b!198064) bm!3115))

(assert (=> b!198059 m!305047))

(declare-fun m!306361 () Bool)

(assert (=> b!198059 m!306361))

(declare-fun m!306363 () Bool)

(assert (=> bm!3115 m!306363))

(declare-fun m!306365 () Bool)

(assert (=> bm!3115 m!306365))

(declare-fun m!306367 () Bool)

(assert (=> bm!3115 m!306367))

(declare-fun m!306369 () Bool)

(assert (=> bm!3115 m!306369))

(declare-fun m!306371 () Bool)

(assert (=> bm!3115 m!306371))

(assert (=> b!198063 m!306363))

(assert (=> b!198063 m!306369))

(assert (=> b!198063 m!306363))

(assert (=> b!198063 m!306369))

(declare-fun m!306373 () Bool)

(assert (=> b!198063 m!306373))

(declare-fun m!306375 () Bool)

(assert (=> b!198065 m!306375))

(assert (=> b!197864 d!67059))

(assert (=> b!197864 d!66697))

(declare-fun d!67061 () Bool)

(declare-fun res!165785 () Bool)

(declare-fun e!135978 () Bool)

(assert (=> d!67061 (=> (not res!165785) (not e!135978))))

(assert (=> d!67061 (= res!165785 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) (size!4454 (buf!4940 (_2!9185 lt!308356)))))))

(assert (=> d!67061 (= (isPrefixOf!0 (_2!9185 lt!307286) (_2!9185 lt!308356)) e!135978)))

(declare-fun b!198066 () Bool)

(declare-fun res!165784 () Bool)

(assert (=> b!198066 (=> (not res!165784) (not e!135978))))

(assert (=> b!198066 (= res!165784 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!308356))) (currentByte!9278 (_2!9185 lt!308356)) (currentBit!9273 (_2!9185 lt!308356)))))))

(declare-fun b!198067 () Bool)

(declare-fun e!135977 () Bool)

(assert (=> b!198067 (= e!135978 e!135977)))

(declare-fun res!165783 () Bool)

(assert (=> b!198067 (=> res!165783 e!135977)))

(assert (=> b!198067 (= res!165783 (= (size!4454 (buf!4940 (_2!9185 lt!307286))) #b00000000000000000000000000000000))))

(declare-fun b!198068 () Bool)

(assert (=> b!198068 (= e!135977 (arrayBitRangesEq!0 (buf!4940 (_2!9185 lt!307286)) (buf!4940 (_2!9185 lt!308356)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307286))) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286)))))))

(assert (= (and d!67061 res!165785) b!198066))

(assert (= (and b!198066 res!165784) b!198067))

(assert (= (and b!198067 (not res!165783)) b!198068))

(assert (=> b!198066 m!305047))

(assert (=> b!198066 m!305749))

(assert (=> b!198068 m!305047))

(assert (=> b!198068 m!305047))

(declare-fun m!306377 () Bool)

(assert (=> b!198068 m!306377))

(assert (=> b!197857 d!67061))

(declare-fun b!198069 () Bool)

(declare-fun res!165789 () Bool)

(declare-fun e!135979 () Bool)

(assert (=> b!198069 (=> (not res!165789) (not e!135979))))

(declare-fun lt!308734 () tuple2!17102)

(assert (=> b!198069 (= res!165789 (= (bvand (_1!9196 lt!308734) (onesLSBLong!0 nBits!348)) (_1!9196 lt!308734)))))

(declare-fun b!198071 () Bool)

(declare-fun e!135981 () tuple2!17102)

(assert (=> b!198071 (= e!135981 (tuple2!17103 lt!307309 (_1!9187 lt!307301)))))

(declare-fun b!198072 () Bool)

(declare-fun res!165787 () Bool)

(assert (=> b!198072 (=> (not res!165787) (not e!135979))))

(declare-fun lt!308735 () (_ BitVec 64))

(declare-fun lt!308737 () (_ BitVec 64))

(assert (=> b!198072 (= res!165787 (= (bitIndex!0 (size!4454 (buf!4940 (_2!9196 lt!308734))) (currentByte!9278 (_2!9196 lt!308734)) (currentBit!9273 (_2!9196 lt!308734))) (bvadd lt!308737 lt!308735)))))

(assert (=> b!198072 (or (not (= (bvand lt!308737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308735 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!308737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!308737 lt!308735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198072 (= lt!308735 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (=> b!198072 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))

(assert (=> b!198072 (= lt!308737 (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307301))) (currentByte!9278 (_1!9187 lt!307301)) (currentBit!9273 (_1!9187 lt!307301))))))

(declare-fun b!198073 () Bool)

(declare-fun res!165790 () Bool)

(assert (=> b!198073 (=> (not res!165790) (not e!135979))))

(assert (=> b!198073 (= res!165790 (= (bvand (_1!9196 lt!308734) (onesLSBLong!0 i!590)) (bvand lt!307309 (onesLSBLong!0 i!590))))))

(declare-fun b!198070 () Bool)

(declare-fun lt!308732 () tuple2!17102)

(assert (=> b!198070 (= e!135981 (tuple2!17103 (_1!9196 lt!308732) (_2!9196 lt!308732)))))

(declare-fun lt!308736 () tuple2!17100)

(assert (=> b!198070 (= lt!308736 (readBit!0 (_1!9187 lt!307301)))))

(assert (=> b!198070 (= lt!308732 (readNBitsLSBFirstsLoop!0 (_2!9195 lt!308736) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!307309 (ite (_1!9195 lt!308736) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!67063 () Bool)

(assert (=> d!67063 e!135979))

(declare-fun res!165788 () Bool)

(assert (=> d!67063 (=> (not res!165788) (not e!135979))))

(assert (=> d!67063 (= res!165788 (= (buf!4940 (_2!9196 lt!308734)) (buf!4940 (_1!9187 lt!307301))))))

(assert (=> d!67063 (= lt!308734 e!135981)))

(declare-fun c!9857 () Bool)

(assert (=> d!67063 (= c!9857 (= nBits!348 i!590))))

(assert (=> d!67063 (and (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67063 (= (readNBitsLSBFirstsLoop!0 (_1!9187 lt!307301) nBits!348 i!590 lt!307309) lt!308734)))

(declare-fun b!198074 () Bool)

(declare-fun e!135980 () Bool)

(assert (=> b!198074 (= e!135979 e!135980)))

(declare-fun res!165786 () Bool)

(assert (=> b!198074 (=> res!165786 e!135980)))

(assert (=> b!198074 (= res!165786 (not (bvslt i!590 nBits!348)))))

(declare-fun b!198075 () Bool)

(declare-fun lt!308733 () (_ BitVec 64))

(assert (=> b!198075 (= e!135980 (= (= (bvand (bvlshr (_1!9196 lt!308734) lt!308733) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9186 (readBitPure!0 (_1!9187 lt!307301)))))))

(assert (=> b!198075 (and (bvsge lt!308733 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!308733 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!198075 (= lt!308733 ((_ sign_extend 32) i!590))))

(assert (= (and d!67063 c!9857) b!198071))

(assert (= (and d!67063 (not c!9857)) b!198070))

(assert (= (and d!67063 res!165788) b!198072))

(assert (= (and b!198072 res!165787) b!198073))

(assert (= (and b!198073 res!165790) b!198069))

(assert (= (and b!198069 res!165789) b!198074))

(assert (= (and b!198074 (not res!165786)) b!198075))

(declare-fun m!306379 () Bool)

(assert (=> b!198072 m!306379))

(assert (=> b!198072 m!305873))

(assert (=> b!198073 m!305107))

(assert (=> b!198070 m!305301))

(declare-fun m!306381 () Bool)

(assert (=> b!198070 m!306381))

(assert (=> b!198075 m!305111))

(assert (=> b!198069 m!305789))

(assert (=> d!66743 d!67063))

(assert (=> b!197862 d!66697))

(assert (=> b!197862 d!66745))

(declare-fun d!67065 () Bool)

(declare-fun lt!308738 () tuple2!17100)

(assert (=> d!67065 (= lt!308738 (readBit!0 (readerFrom!0 (_2!9185 lt!308353) (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286)))))))

(assert (=> d!67065 (= (readBitPure!0 (readerFrom!0 (_2!9185 lt!308353) (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286)))) (tuple2!17083 (_2!9195 lt!308738) (_1!9195 lt!308738)))))

(declare-fun bs!16625 () Bool)

(assert (= bs!16625 d!67065))

(assert (=> bs!16625 m!305825))

(declare-fun m!306383 () Bool)

(assert (=> bs!16625 m!306383))

(assert (=> b!197855 d!67065))

(declare-fun d!67067 () Bool)

(declare-fun e!135982 () Bool)

(assert (=> d!67067 e!135982))

(declare-fun res!165791 () Bool)

(assert (=> d!67067 (=> (not res!165791) (not e!135982))))

(assert (=> d!67067 (= res!165791 (invariant!0 (currentBit!9273 (_2!9185 lt!308353)) (currentByte!9278 (_2!9185 lt!308353)) (size!4454 (buf!4940 (_2!9185 lt!308353)))))))

(assert (=> d!67067 (= (readerFrom!0 (_2!9185 lt!308353) (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286))) (BitStream!8017 (buf!4940 (_2!9185 lt!308353)) (currentByte!9278 (_2!9185 lt!307286)) (currentBit!9273 (_2!9185 lt!307286))))))

(declare-fun b!198076 () Bool)

(assert (=> b!198076 (= e!135982 (invariant!0 (currentBit!9273 (_2!9185 lt!307286)) (currentByte!9278 (_2!9185 lt!307286)) (size!4454 (buf!4940 (_2!9185 lt!308353)))))))

(assert (= (and d!67067 res!165791) b!198076))

(assert (=> d!67067 m!305859))

(declare-fun m!306385 () Bool)

(assert (=> b!198076 m!306385))

(assert (=> b!197855 d!67067))

(declare-fun d!67069 () Bool)

(declare-fun res!165794 () Bool)

(declare-fun e!135984 () Bool)

(assert (=> d!67069 (=> (not res!165794) (not e!135984))))

(assert (=> d!67069 (= res!165794 (= (size!4454 (buf!4940 (_2!9187 lt!307568))) (size!4454 (buf!4940 (_2!9185 lt!307308)))))))

(assert (=> d!67069 (= (isPrefixOf!0 (_2!9187 lt!307568) (_2!9185 lt!307308)) e!135984)))

(declare-fun b!198077 () Bool)

(declare-fun res!165793 () Bool)

(assert (=> b!198077 (=> (not res!165793) (not e!135984))))

(assert (=> b!198077 (= res!165793 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_2!9187 lt!307568))) (currentByte!9278 (_2!9187 lt!307568)) (currentBit!9273 (_2!9187 lt!307568))) (bitIndex!0 (size!4454 (buf!4940 (_2!9185 lt!307308))) (currentByte!9278 (_2!9185 lt!307308)) (currentBit!9273 (_2!9185 lt!307308)))))))

(declare-fun b!198078 () Bool)

(declare-fun e!135983 () Bool)

(assert (=> b!198078 (= e!135984 e!135983)))

(declare-fun res!165792 () Bool)

(assert (=> b!198078 (=> res!165792 e!135983)))

(assert (=> b!198078 (= res!165792 (= (size!4454 (buf!4940 (_2!9187 lt!307568))) #b00000000000000000000000000000000))))

(declare-fun b!198079 () Bool)

(assert (=> b!198079 (= e!135983 (arrayBitRangesEq!0 (buf!4940 (_2!9187 lt!307568)) (buf!4940 (_2!9185 lt!307308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_2!9187 lt!307568))) (currentByte!9278 (_2!9187 lt!307568)) (currentBit!9273 (_2!9187 lt!307568)))))))

(assert (= (and d!67069 res!165794) b!198077))

(assert (= (and b!198077 res!165793) b!198078))

(assert (= (and b!198078 (not res!165792)) b!198079))

(assert (=> b!198077 m!305989))

(assert (=> b!198077 m!305051))

(assert (=> b!198079 m!305989))

(assert (=> b!198079 m!305989))

(declare-fun m!306387 () Bool)

(assert (=> b!198079 m!306387))

(assert (=> b!197630 d!67069))

(declare-fun d!67071 () Bool)

(declare-fun e!135985 () Bool)

(assert (=> d!67071 e!135985))

(declare-fun res!165796 () Bool)

(assert (=> d!67071 (=> (not res!165796) (not e!135985))))

(declare-fun lt!308742 () (_ BitVec 64))

(declare-fun lt!308739 () (_ BitVec 64))

(declare-fun lt!308740 () (_ BitVec 64))

(assert (=> d!67071 (= res!165796 (= lt!308739 (bvsub lt!308742 lt!308740)))))

(assert (=> d!67071 (or (= (bvand lt!308742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!308740 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!308742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!308742 lt!308740) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67071 (= lt!308740 (remainingBits!0 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!308386)))) ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!308386))) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!308386)))))))

(declare-fun lt!308741 () (_ BitVec 64))

(declare-fun lt!308744 () (_ BitVec 64))

(assert (=> d!67071 (= lt!308742 (bvmul lt!308741 lt!308744))))

(assert (=> d!67071 (or (= lt!308741 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!308744 (bvsdiv (bvmul lt!308741 lt!308744) lt!308741)))))

(assert (=> d!67071 (= lt!308744 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67071 (= lt!308741 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!308386)))))))

(assert (=> d!67071 (= lt!308739 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9278 (_1!9186 lt!308386))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9273 (_1!9186 lt!308386)))))))

(assert (=> d!67071 (invariant!0 (currentBit!9273 (_1!9186 lt!308386)) (currentByte!9278 (_1!9186 lt!308386)) (size!4454 (buf!4940 (_1!9186 lt!308386))))))

(assert (=> d!67071 (= (bitIndex!0 (size!4454 (buf!4940 (_1!9186 lt!308386))) (currentByte!9278 (_1!9186 lt!308386)) (currentBit!9273 (_1!9186 lt!308386))) lt!308739)))

(declare-fun b!198080 () Bool)

(declare-fun res!165795 () Bool)

(assert (=> b!198080 (=> (not res!165795) (not e!135985))))

(assert (=> b!198080 (= res!165795 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!308739))))

(declare-fun b!198081 () Bool)

(declare-fun lt!308743 () (_ BitVec 64))

(assert (=> b!198081 (= e!135985 (bvsle lt!308739 (bvmul lt!308743 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198081 (or (= lt!308743 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!308743 #b0000000000000000000000000000000000000000000000000000000000001000) lt!308743)))))

(assert (=> b!198081 (= lt!308743 ((_ sign_extend 32) (size!4454 (buf!4940 (_1!9186 lt!308386)))))))

(assert (= (and d!67071 res!165796) b!198080))

(assert (= (and b!198080 res!165795) b!198081))

(declare-fun m!306389 () Bool)

(assert (=> d!67071 m!306389))

(declare-fun m!306391 () Bool)

(assert (=> d!67071 m!306391))

(assert (=> b!197851 d!67071))

(assert (=> b!197851 d!66867))

(assert (=> d!66709 d!66871))

(declare-fun d!67073 () Bool)

(declare-fun res!165799 () Bool)

(declare-fun e!135987 () Bool)

(assert (=> d!67073 (=> (not res!165799) (not e!135987))))

(assert (=> d!67073 (= res!165799 (= (size!4454 (buf!4940 (_1!9187 lt!307568))) (size!4454 (buf!4940 thiss!1204))))))

(assert (=> d!67073 (= (isPrefixOf!0 (_1!9187 lt!307568) thiss!1204) e!135987)))

(declare-fun b!198082 () Bool)

(declare-fun res!165798 () Bool)

(assert (=> b!198082 (=> (not res!165798) (not e!135987))))

(assert (=> b!198082 (= res!165798 (bvsle (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307568))) (currentByte!9278 (_1!9187 lt!307568)) (currentBit!9273 (_1!9187 lt!307568))) (bitIndex!0 (size!4454 (buf!4940 thiss!1204)) (currentByte!9278 thiss!1204) (currentBit!9273 thiss!1204))))))

(declare-fun b!198083 () Bool)

(declare-fun e!135986 () Bool)

(assert (=> b!198083 (= e!135987 e!135986)))

(declare-fun res!165797 () Bool)

(assert (=> b!198083 (=> res!165797 e!135986)))

(assert (=> b!198083 (= res!165797 (= (size!4454 (buf!4940 (_1!9187 lt!307568))) #b00000000000000000000000000000000))))

(declare-fun b!198084 () Bool)

(assert (=> b!198084 (= e!135986 (arrayBitRangesEq!0 (buf!4940 (_1!9187 lt!307568)) (buf!4940 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4454 (buf!4940 (_1!9187 lt!307568))) (currentByte!9278 (_1!9187 lt!307568)) (currentBit!9273 (_1!9187 lt!307568)))))))

(assert (= (and d!67073 res!165799) b!198082))

(assert (= (and b!198082 res!165798) b!198083))

(assert (= (and b!198083 (not res!165797)) b!198084))

(assert (=> b!198082 m!306305))

(assert (=> b!198082 m!305049))

(assert (=> b!198084 m!306305))

(assert (=> b!198084 m!306305))

(declare-fun m!306393 () Bool)

(assert (=> b!198084 m!306393))

(assert (=> b!197628 d!67073))

(assert (=> d!66849 d!66857))

(check-sat (not b!197958) (not b!198077) (not b!197963) (not d!66909) (not b!198043) (not d!66953) (not b!197915) (not d!67001) (not b!197999) (not b!198066) (not b!198084) (not d!67005) (not d!67025) (not b!198039) (not b!197992) (not b!197949) (not b!198019) (not d!66923) (not d!66861) (not b!197981) (not d!66945) (not d!66977) (not b!197955) (not b!197968) (not b!198069) (not d!66889) (not b!197983) (not d!66955) (not d!66949) (not d!66989) (not b!197894) (not d!67009) (not b!197943) (not d!66983) (not d!66859) (not b!198057) (not b!198031) (not d!66935) (not b!197957) (not b!198075) (not b!198072) (not b!198054) (not b!198050) (not b!198015) (not b!197945) (not d!66997) (not d!66899) (not d!66971) (not d!67015) (not b!198030) (not bm!3113) (not b!197942) (not b!198016) (not b!197977) (not d!66959) (not d!67035) (not b!197922) (not b!198037) (not b!197912) (not d!66917) (not b!197984) (not d!67057) (not b!198070) (not b!197976) (not b!198047) (not d!66891) (not d!66881) (not d!67071) (not b!197952) (not b!197875) (not b!197960) (not b!197917) (not b!197874) (not b!197961) (not b!197947) (not d!67019) (not b!198033) (not b!197911) (not d!66981) (not b!198059) (not b!197954) (not d!66911) (not b!198013) (not b!198040) (not d!67053) (not b!197967) (not b!197927) (not b!197914) (not b!198082) (not b!198009) (not d!66903) (not d!66887) (not b!197939) (not d!66969) (not b!198063) (not b!197975) (not b!197996) (not d!66931) (not b!198017) (not d!66957) (not b!198042) (not b!198065) (not bm!3114) (not d!67039) (not b!197944) (not d!66975) (not b!197951) (not d!67013) (not d!66895) (not b!198076) (not bm!3111) (not d!66921) (not d!66991) (not b!198000) (not d!66961) (not d!66985) (not b!198034) (not b!198073) (not d!66993) (not b!197925) (not d!66987) (not d!66939) (not d!66979) (not d!66873) (not b!197969) (not b!197993) (not d!67007) (not b!197924) (not d!67027) (not b!197990) (not d!66937) (not d!66967) (not b!198001) (not b!198049) (not d!66867) (not b!197890) (not b!198079) (not b!197982) (not d!66965) (not b!198002) (not d!67067) (not d!66951) (not bm!3115) (not b!197867) (not b!197941) (not d!66905) (not b!197946) (not bm!3110) (not b!197896) (not b!197997) (not b!198036) (not d!67029) (not d!66941) (not b!198068) (not d!66879) (not d!67065) (not d!66933) (not bm!3112) (not b!197872) (not b!198058) (not b!197940) (not b!197974) (not b!198028) (not d!67011) (not d!66973) (not b!198056) (not b!197970) (not b!197988) (not d!67051))
(check-sat)
