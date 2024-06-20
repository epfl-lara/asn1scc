; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31622 () Bool)

(assert start!31622)

(declare-fun b!158284 () Bool)

(declare-fun e!107551 () Bool)

(declare-fun e!107553 () Bool)

(assert (=> b!158284 (= e!107551 (not e!107553))))

(declare-fun res!132231 () Bool)

(assert (=> b!158284 (=> res!132231 e!107553)))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!158284 (= res!132231 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(declare-fun lt!249477 () (_ BitVec 64))

(declare-datatypes ((array!7364 0))(
  ( (array!7365 (arr!4251 (Array (_ BitVec 32) (_ BitVec 8))) (size!3342 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5856 0))(
  ( (BitStream!5857 (buf!3802 array!7364) (currentByte!6981 (_ BitVec 32)) (currentBit!6976 (_ BitVec 32))) )
))
(declare-fun lt!249476 () BitStream!5856)

(declare-fun lt!249482 () (_ BitVec 64))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158284 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) lt!249477 lt!249482 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!158284 (= lt!249482 ((_ sign_extend 32) (currentBit!6976 lt!249476)))))

(assert (=> b!158284 (= lt!249477 ((_ sign_extend 32) (currentByte!6981 lt!249476)))))

(declare-fun bs!65 () BitStream!5856)

(declare-datatypes ((Unit!10582 0))(
  ( (Unit!10583) )
))
(declare-fun lt!249484 () Unit!10582)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5856 BitStream!5856 (_ BitVec 64) (_ BitVec 32)) Unit!10582)

(assert (=> b!158284 (= lt!249484 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249476 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14436 0))(
  ( (tuple2!14437 (_1!7680 BitStream!5856) (_2!7680 (_ BitVec 8))) )
))
(declare-fun lt!249480 () tuple2!14436)

(declare-fun readBytePure!0 (BitStream!5856) tuple2!14436)

(assert (=> b!158284 (= lt!249480 (readBytePure!0 lt!249476))))

(declare-fun b!158285 () Bool)

(declare-fun e!107550 () Bool)

(assert (=> b!158285 (= e!107550 e!107551)))

(declare-fun res!132232 () Bool)

(assert (=> b!158285 (=> (not res!132232) (not e!107551))))

(assert (=> b!158285 (= res!132232 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!249481 () array!7364)

(declare-datatypes ((tuple2!14438 0))(
  ( (tuple2!14439 (_1!7681 BitStream!5856) (_2!7681 array!7364)) )
))
(declare-fun lt!249479 () tuple2!14438)

(declare-fun readByteArrayLoopPure!0 (BitStream!5856 array!7364 (_ BitVec 32) (_ BitVec 32)) tuple2!14438)

(assert (=> b!158285 (= lt!249479 (readByteArrayLoopPure!0 lt!249476 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun arr!153 () array!7364)

(assert (=> b!158285 (= lt!249481 (array!7365 (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (size!3342 arr!153)))))

(declare-fun withMovedByteIndex!0 (BitStream!5856 (_ BitVec 32)) BitStream!5856)

(assert (=> b!158285 (= lt!249476 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249486 () tuple2!14438)

(assert (=> b!158285 (= lt!249486 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!158286 () Bool)

(declare-fun res!132233 () Bool)

(assert (=> b!158286 (=> res!132233 e!107553)))

(assert (=> b!158286 (= res!132233 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) lt!249477 lt!249482 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!158287 () Bool)

(declare-fun arrayRangesEq!446 (array!7364 array!7364 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158287 (= e!107553 (arrayRangesEq!446 (_2!7681 lt!249486) (_2!7681 lt!249479) #b00000000000000000000000000000000 to!236))))

(declare-fun lt!249485 () tuple2!14438)

(assert (=> b!158287 (arrayRangesEq!446 (_2!7681 lt!249479) (_2!7681 lt!249485) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!249483 () Unit!10582)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5856 array!7364 (_ BitVec 32) (_ BitVec 32)) Unit!10582)

(assert (=> b!158287 (= lt!249483 (readByteArrayLoopArrayPrefixLemma!0 lt!249476 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!158287 (= lt!249485 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001) (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!249478 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!158287 (= lt!249478 (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))))))

(declare-fun res!132230 () Bool)

(assert (=> start!31622 (=> (not res!132230) (not e!107550))))

(assert (=> start!31622 (= res!132230 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3342 arr!153))))))

(assert (=> start!31622 e!107550))

(assert (=> start!31622 true))

(declare-fun array_inv!3091 (array!7364) Bool)

(assert (=> start!31622 (array_inv!3091 arr!153)))

(declare-fun e!107548 () Bool)

(declare-fun inv!12 (BitStream!5856) Bool)

(assert (=> start!31622 (and (inv!12 bs!65) e!107548)))

(declare-fun b!158288 () Bool)

(declare-fun res!132229 () Bool)

(assert (=> b!158288 (=> (not res!132229) (not e!107550))))

(assert (=> b!158288 (= res!132229 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 bs!65))) ((_ sign_extend 32) (currentByte!6981 bs!65)) ((_ sign_extend 32) (currentBit!6976 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158289 () Bool)

(assert (=> b!158289 (= e!107548 (array_inv!3091 (buf!3802 bs!65)))))

(assert (= (and start!31622 res!132230) b!158288))

(assert (= (and b!158288 res!132229) b!158285))

(assert (= (and b!158285 res!132232) b!158284))

(assert (= (and b!158284 (not res!132231)) b!158286))

(assert (= (and b!158286 (not res!132233)) b!158287))

(assert (= start!31622 b!158289))

(declare-fun m!248223 () Bool)

(assert (=> b!158286 m!248223))

(declare-fun m!248225 () Bool)

(assert (=> start!31622 m!248225))

(declare-fun m!248227 () Bool)

(assert (=> start!31622 m!248227))

(declare-fun m!248229 () Bool)

(assert (=> b!158285 m!248229))

(declare-fun m!248231 () Bool)

(assert (=> b!158285 m!248231))

(declare-fun m!248233 () Bool)

(assert (=> b!158285 m!248233))

(declare-fun m!248235 () Bool)

(assert (=> b!158285 m!248235))

(declare-fun m!248237 () Bool)

(assert (=> b!158285 m!248237))

(declare-fun m!248239 () Bool)

(assert (=> b!158287 m!248239))

(declare-fun m!248241 () Bool)

(assert (=> b!158287 m!248241))

(assert (=> b!158287 m!248231))

(assert (=> b!158287 m!248235))

(declare-fun m!248243 () Bool)

(assert (=> b!158287 m!248243))

(declare-fun m!248245 () Bool)

(assert (=> b!158287 m!248245))

(declare-fun m!248247 () Bool)

(assert (=> b!158287 m!248247))

(declare-fun m!248249 () Bool)

(assert (=> b!158287 m!248249))

(assert (=> b!158287 m!248239))

(declare-fun m!248251 () Bool)

(assert (=> b!158284 m!248251))

(declare-fun m!248253 () Bool)

(assert (=> b!158284 m!248253))

(declare-fun m!248255 () Bool)

(assert (=> b!158284 m!248255))

(declare-fun m!248257 () Bool)

(assert (=> b!158288 m!248257))

(declare-fun m!248259 () Bool)

(assert (=> b!158289 m!248259))

(check-sat (not b!158285) (not b!158284) (not start!31622) (not b!158287) (not b!158288) (not b!158289) (not b!158286))
(check-sat)
(get-model)

(declare-fun d!53018 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53018 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 bs!65))) ((_ sign_extend 32) (currentByte!6981 bs!65)) ((_ sign_extend 32) (currentBit!6976 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3342 (buf!3802 bs!65))) ((_ sign_extend 32) (currentByte!6981 bs!65)) ((_ sign_extend 32) (currentBit!6976 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13075 () Bool)

(assert (= bs!13075 d!53018))

(declare-fun m!248431 () Bool)

(assert (=> bs!13075 m!248431))

(assert (=> b!158288 d!53018))

(declare-fun d!53026 () Bool)

(declare-datatypes ((tuple2!14452 0))(
  ( (tuple2!14453 (_1!7690 (_ BitVec 8)) (_2!7690 BitStream!5856)) )
))
(declare-fun lt!249605 () tuple2!14452)

(declare-fun readByte!0 (BitStream!5856) tuple2!14452)

(assert (=> d!53026 (= lt!249605 (readByte!0 bs!65))))

(assert (=> d!53026 (= (readBytePure!0 bs!65) (tuple2!14437 (_2!7690 lt!249605) (_1!7690 lt!249605)))))

(declare-fun bs!13076 () Bool)

(assert (= bs!13076 d!53026))

(declare-fun m!248433 () Bool)

(assert (=> bs!13076 m!248433))

(assert (=> b!158287 d!53026))

(declare-fun d!53028 () Bool)

(declare-datatypes ((tuple3!694 0))(
  ( (tuple3!695 (_1!7691 Unit!10582) (_2!7691 BitStream!5856) (_3!464 array!7364)) )
))
(declare-fun lt!249608 () tuple3!694)

(declare-fun readByteArrayLoop!0 (BitStream!5856 array!7364 (_ BitVec 32) (_ BitVec 32)) tuple3!694)

(assert (=> d!53028 (= lt!249608 (readByteArrayLoop!0 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001) (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!53028 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001) (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) (tuple2!14439 (_2!7691 lt!249608) (_3!464 lt!249608)))))

(declare-fun bs!13078 () Bool)

(assert (= bs!13078 d!53028))

(assert (=> bs!13078 m!248239))

(declare-fun m!248439 () Bool)

(assert (=> bs!13078 m!248439))

(assert (=> b!158287 d!53028))

(declare-fun d!53036 () Bool)

(declare-fun lt!249617 () tuple2!14438)

(declare-fun lt!249619 () tuple2!14438)

(assert (=> d!53036 (arrayRangesEq!446 (_2!7681 lt!249617) (_2!7681 lt!249619) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!249620 () Unit!10582)

(declare-fun lt!249618 () BitStream!5856)

(declare-fun choose!35 (BitStream!5856 array!7364 (_ BitVec 32) (_ BitVec 32) tuple2!14438 array!7364 BitStream!5856 tuple2!14438 array!7364) Unit!10582)

(assert (=> d!53036 (= lt!249620 (choose!35 lt!249476 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!249617 (_2!7681 lt!249617) lt!249618 lt!249619 (_2!7681 lt!249619)))))

(assert (=> d!53036 (= lt!249619 (readByteArrayLoopPure!0 lt!249618 (array!7365 (store (arr!4251 lt!249481) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 (readBytePure!0 lt!249476))) (size!3342 lt!249481)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!53036 (= lt!249618 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001))))

(assert (=> d!53036 (= lt!249617 (readByteArrayLoopPure!0 lt!249476 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!53036 (= (readByteArrayLoopArrayPrefixLemma!0 lt!249476 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!249620)))

(declare-fun bs!13080 () Bool)

(assert (= bs!13080 d!53036))

(assert (=> bs!13080 m!248255))

(declare-fun m!248441 () Bool)

(assert (=> bs!13080 m!248441))

(assert (=> bs!13080 m!248239))

(declare-fun m!248443 () Bool)

(assert (=> bs!13080 m!248443))

(declare-fun m!248445 () Bool)

(assert (=> bs!13080 m!248445))

(declare-fun m!248447 () Bool)

(assert (=> bs!13080 m!248447))

(assert (=> bs!13080 m!248229))

(assert (=> b!158287 d!53036))

(declare-fun d!53038 () Bool)

(declare-fun res!132293 () Bool)

(declare-fun e!107615 () Bool)

(assert (=> d!53038 (=> res!132293 e!107615)))

(assert (=> d!53038 (= res!132293 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!53038 (= (arrayRangesEq!446 (_2!7681 lt!249479) (_2!7681 lt!249485) #b00000000000000000000000000000000 to!236) e!107615)))

(declare-fun b!158351 () Bool)

(declare-fun e!107616 () Bool)

(assert (=> b!158351 (= e!107615 e!107616)))

(declare-fun res!132294 () Bool)

(assert (=> b!158351 (=> (not res!132294) (not e!107616))))

(assert (=> b!158351 (= res!132294 (= (select (arr!4251 (_2!7681 lt!249479)) #b00000000000000000000000000000000) (select (arr!4251 (_2!7681 lt!249485)) #b00000000000000000000000000000000)))))

(declare-fun b!158352 () Bool)

(assert (=> b!158352 (= e!107616 (arrayRangesEq!446 (_2!7681 lt!249479) (_2!7681 lt!249485) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!53038 (not res!132293)) b!158351))

(assert (= (and b!158351 res!132294) b!158352))

(declare-fun m!248449 () Bool)

(assert (=> b!158351 m!248449))

(declare-fun m!248451 () Bool)

(assert (=> b!158351 m!248451))

(declare-fun m!248453 () Bool)

(assert (=> b!158352 m!248453))

(assert (=> b!158287 d!53038))

(declare-fun d!53040 () Bool)

(declare-fun res!132295 () Bool)

(declare-fun e!107617 () Bool)

(assert (=> d!53040 (=> res!132295 e!107617)))

(assert (=> d!53040 (= res!132295 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!53040 (= (arrayRangesEq!446 (_2!7681 lt!249486) (_2!7681 lt!249479) #b00000000000000000000000000000000 to!236) e!107617)))

(declare-fun b!158353 () Bool)

(declare-fun e!107618 () Bool)

(assert (=> b!158353 (= e!107617 e!107618)))

(declare-fun res!132296 () Bool)

(assert (=> b!158353 (=> (not res!132296) (not e!107618))))

(assert (=> b!158353 (= res!132296 (= (select (arr!4251 (_2!7681 lt!249486)) #b00000000000000000000000000000000) (select (arr!4251 (_2!7681 lt!249479)) #b00000000000000000000000000000000)))))

(declare-fun b!158354 () Bool)

(assert (=> b!158354 (= e!107618 (arrayRangesEq!446 (_2!7681 lt!249486) (_2!7681 lt!249479) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!53040 (not res!132295)) b!158353))

(assert (= (and b!158353 res!132296) b!158354))

(declare-fun m!248455 () Bool)

(assert (=> b!158353 m!248455))

(assert (=> b!158353 m!248449))

(declare-fun m!248457 () Bool)

(assert (=> b!158354 m!248457))

(assert (=> b!158287 d!53040))

(declare-fun d!53042 () Bool)

(declare-datatypes ((tuple2!14454 0))(
  ( (tuple2!14455 (_1!7692 Unit!10582) (_2!7692 BitStream!5856)) )
))
(declare-fun moveByteIndex!0 (BitStream!5856 (_ BitVec 32)) tuple2!14454)

(assert (=> d!53042 (= (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001) (_2!7692 (moveByteIndex!0 lt!249476 #b00000000000000000000000000000001)))))

(declare-fun bs!13081 () Bool)

(assert (= bs!13081 d!53042))

(declare-fun m!248459 () Bool)

(assert (=> bs!13081 m!248459))

(assert (=> b!158287 d!53042))

(declare-fun d!53044 () Bool)

(assert (=> d!53044 (= (array_inv!3091 arr!153) (bvsge (size!3342 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31622 d!53044))

(declare-fun d!53046 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53046 (= (inv!12 bs!65) (invariant!0 (currentBit!6976 bs!65) (currentByte!6981 bs!65) (size!3342 (buf!3802 bs!65))))))

(declare-fun bs!13082 () Bool)

(assert (= bs!13082 d!53046))

(declare-fun m!248461 () Bool)

(assert (=> bs!13082 m!248461))

(assert (=> start!31622 d!53046))

(declare-fun d!53048 () Bool)

(assert (=> d!53048 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) lt!249477 lt!249482 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) lt!249477 lt!249482) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13083 () Bool)

(assert (= bs!13083 d!53048))

(declare-fun m!248463 () Bool)

(assert (=> bs!13083 m!248463))

(assert (=> b!158286 d!53048))

(declare-fun d!53050 () Bool)

(declare-fun lt!249621 () tuple3!694)

(assert (=> d!53050 (= lt!249621 (readByteArrayLoop!0 lt!249476 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!53050 (= (readByteArrayLoopPure!0 lt!249476 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14439 (_2!7691 lt!249621) (_3!464 lt!249621)))))

(declare-fun bs!13084 () Bool)

(assert (= bs!13084 d!53050))

(declare-fun m!248465 () Bool)

(assert (=> bs!13084 m!248465))

(assert (=> b!158285 d!53050))

(assert (=> b!158285 d!53026))

(declare-fun d!53052 () Bool)

(assert (=> d!53052 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7692 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!13085 () Bool)

(assert (= bs!13085 d!53052))

(declare-fun m!248467 () Bool)

(assert (=> bs!13085 m!248467))

(assert (=> b!158285 d!53052))

(declare-fun d!53054 () Bool)

(declare-fun lt!249622 () tuple3!694)

(assert (=> d!53054 (= lt!249622 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!53054 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14439 (_2!7691 lt!249622) (_3!464 lt!249622)))))

(declare-fun bs!13086 () Bool)

(assert (= bs!13086 d!53054))

(declare-fun m!248469 () Bool)

(assert (=> bs!13086 m!248469))

(assert (=> b!158285 d!53054))

(declare-fun d!53056 () Bool)

(assert (=> d!53056 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) lt!249477 lt!249482 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) lt!249477 lt!249482) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13087 () Bool)

(assert (= bs!13087 d!53056))

(assert (=> bs!13087 m!248463))

(assert (=> b!158284 d!53056))

(declare-fun d!53058 () Bool)

(declare-fun e!107621 () Bool)

(assert (=> d!53058 e!107621))

(declare-fun res!132299 () Bool)

(assert (=> d!53058 (=> (not res!132299) (not e!107621))))

(assert (=> d!53058 (= res!132299 (and (or (let ((rhs!3504 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3504 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3504) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!53059 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!53059 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!53059 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3503 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3503 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3503) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!249631 () Unit!10582)

(declare-fun choose!57 (BitStream!5856 BitStream!5856 (_ BitVec 64) (_ BitVec 32)) Unit!10582)

(assert (=> d!53058 (= lt!249631 (choose!57 bs!65 lt!249476 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> d!53058 (= (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249476 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) lt!249631)))

(declare-fun b!158357 () Bool)

(declare-fun lt!249629 () (_ BitVec 32))

(assert (=> b!158357 (= e!107621 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) ((_ sign_extend 32) (currentByte!6981 lt!249476)) ((_ sign_extend 32) (currentBit!6976 lt!249476)) (bvsub (bvsub to!236 from!240) lt!249629)))))

(assert (=> b!158357 (or (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand lt!249629 #b10000000000000000000000000000000)) (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!236 from!240) lt!249629) #b10000000000000000000000000000000)))))

(declare-fun lt!249630 () (_ BitVec 64))

(assert (=> b!158357 (= lt!249629 ((_ extract 31 0) lt!249630))))

(assert (=> b!158357 (and (bvslt lt!249630 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!249630 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!158357 (= lt!249630 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!53058 res!132299) b!158357))

(declare-fun m!248471 () Bool)

(assert (=> d!53058 m!248471))

(declare-fun m!248473 () Bool)

(assert (=> b!158357 m!248473))

(assert (=> b!158284 d!53058))

(declare-fun d!53061 () Bool)

(declare-fun lt!249632 () tuple2!14452)

(assert (=> d!53061 (= lt!249632 (readByte!0 lt!249476))))

(assert (=> d!53061 (= (readBytePure!0 lt!249476) (tuple2!14437 (_2!7690 lt!249632) (_1!7690 lt!249632)))))

(declare-fun bs!13088 () Bool)

(assert (= bs!13088 d!53061))

(declare-fun m!248475 () Bool)

(assert (=> bs!13088 m!248475))

(assert (=> b!158284 d!53061))

(declare-fun d!53063 () Bool)

(assert (=> d!53063 (= (array_inv!3091 (buf!3802 bs!65)) (bvsge (size!3342 (buf!3802 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!158289 d!53063))

(check-sat (not d!53046) (not d!53056) (not d!53042) (not d!53018) (not d!53026) (not d!53048) (not d!53061) (not d!53028) (not d!53058) (not d!53036) (not d!53052) (not b!158352) (not d!53050) (not b!158357) (not d!53054) (not b!158354))
(check-sat)
(get-model)

(declare-fun d!53095 () Bool)

(declare-fun lt!250046 () (_ BitVec 8))

(declare-fun lt!250048 () (_ BitVec 8))

(assert (=> d!53095 (= lt!250046 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4251 (buf!3802 bs!65)) (currentByte!6981 bs!65))) ((_ sign_extend 24) lt!250048))))))

(assert (=> d!53095 (= lt!250048 ((_ extract 7 0) (currentBit!6976 bs!65)))))

(declare-fun e!107676 () Bool)

(assert (=> d!53095 e!107676))

(declare-fun res!132355 () Bool)

(assert (=> d!53095 (=> (not res!132355) (not e!107676))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!53095 (= res!132355 (validate_offset_bits!1 ((_ sign_extend 32) (size!3342 (buf!3802 bs!65))) ((_ sign_extend 32) (currentByte!6981 bs!65)) ((_ sign_extend 32) (currentBit!6976 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14460 0))(
  ( (tuple2!14461 (_1!7695 Unit!10582) (_2!7695 (_ BitVec 8))) )
))
(declare-fun Unit!10648 () Unit!10582)

(declare-fun Unit!10649 () Unit!10582)

(assert (=> d!53095 (= (readByte!0 bs!65) (tuple2!14453 (_2!7695 (ite (bvsgt ((_ sign_extend 24) lt!250048) #b00000000000000000000000000000000) (tuple2!14461 Unit!10648 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250046) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4251 (buf!3802 bs!65)) (bvadd (currentByte!6981 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!250048)))))))) (tuple2!14461 Unit!10649 lt!250046))) (BitStream!5857 (buf!3802 bs!65) (bvadd (currentByte!6981 bs!65) #b00000000000000000000000000000001) (currentBit!6976 bs!65))))))

(declare-fun b!158431 () Bool)

(declare-fun e!107675 () Bool)

(assert (=> b!158431 (= e!107676 e!107675)))

(declare-fun res!132356 () Bool)

(assert (=> b!158431 (=> (not res!132356) (not e!107675))))

(declare-fun lt!250042 () tuple2!14452)

(assert (=> b!158431 (= res!132356 (= (buf!3802 (_2!7690 lt!250042)) (buf!3802 bs!65)))))

(declare-fun lt!250047 () (_ BitVec 8))

(declare-fun lt!250043 () (_ BitVec 8))

(declare-fun Unit!10650 () Unit!10582)

(declare-fun Unit!10651 () Unit!10582)

(assert (=> b!158431 (= lt!250042 (tuple2!14453 (_2!7695 (ite (bvsgt ((_ sign_extend 24) lt!250047) #b00000000000000000000000000000000) (tuple2!14461 Unit!10650 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250043) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4251 (buf!3802 bs!65)) (bvadd (currentByte!6981 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!250047)))))))) (tuple2!14461 Unit!10651 lt!250043))) (BitStream!5857 (buf!3802 bs!65) (bvadd (currentByte!6981 bs!65) #b00000000000000000000000000000001) (currentBit!6976 bs!65))))))

(assert (=> b!158431 (= lt!250043 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4251 (buf!3802 bs!65)) (currentByte!6981 bs!65))) ((_ sign_extend 24) lt!250047))))))

(assert (=> b!158431 (= lt!250047 ((_ extract 7 0) (currentBit!6976 bs!65)))))

(declare-fun lt!250045 () (_ BitVec 64))

(declare-fun b!158432 () Bool)

(declare-fun lt!250044 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!158432 (= e!107675 (= (bitIndex!0 (size!3342 (buf!3802 (_2!7690 lt!250042))) (currentByte!6981 (_2!7690 lt!250042)) (currentBit!6976 (_2!7690 lt!250042))) (bvadd lt!250044 lt!250045)))))

(assert (=> b!158432 (or (not (= (bvand lt!250044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!250045 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!250044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!250044 lt!250045) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!158432 (= lt!250045 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!158432 (= lt!250044 (bitIndex!0 (size!3342 (buf!3802 bs!65)) (currentByte!6981 bs!65) (currentBit!6976 bs!65)))))

(assert (= (and d!53095 res!132355) b!158431))

(assert (= (and b!158431 res!132356) b!158432))

(declare-fun m!248765 () Bool)

(assert (=> d!53095 m!248765))

(declare-fun m!248767 () Bool)

(assert (=> d!53095 m!248767))

(declare-fun m!248769 () Bool)

(assert (=> d!53095 m!248769))

(assert (=> b!158431 m!248769))

(assert (=> b!158431 m!248765))

(declare-fun m!248771 () Bool)

(assert (=> b!158432 m!248771))

(declare-fun m!248773 () Bool)

(assert (=> b!158432 m!248773))

(assert (=> d!53026 d!53095))

(declare-fun d!53097 () Bool)

(declare-fun lt!250049 () tuple3!694)

(assert (=> d!53097 (= lt!250049 (readByteArrayLoop!0 lt!249618 (array!7365 (store (arr!4251 lt!249481) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 (readBytePure!0 lt!249476))) (size!3342 lt!249481)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!53097 (= (readByteArrayLoopPure!0 lt!249618 (array!7365 (store (arr!4251 lt!249481) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 (readBytePure!0 lt!249476))) (size!3342 lt!249481)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236) (tuple2!14439 (_2!7691 lt!250049) (_3!464 lt!250049)))))

(declare-fun bs!13090 () Bool)

(assert (= bs!13090 d!53097))

(declare-fun m!248775 () Bool)

(assert (=> bs!13090 m!248775))

(assert (=> d!53036 d!53097))

(declare-fun d!53099 () Bool)

(assert (=> d!53099 (arrayRangesEq!446 (_2!7681 (readByteArrayLoopPure!0 lt!249476 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) to!236)) (_2!7681 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001) (array!7365 (store (arr!4251 lt!249481) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 (readBytePure!0 lt!249476))) (size!3342 lt!249481)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236)) #b00000000000000000000000000000000 to!236)))

(assert (=> d!53099 true))

(declare-fun _$13!103 () Unit!10582)

(assert (=> d!53099 (= (choose!35 lt!249476 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!249617 (_2!7681 lt!249617) lt!249618 lt!249619 (_2!7681 lt!249619)) _$13!103)))

(declare-fun bs!13092 () Bool)

(assert (= bs!13092 d!53099))

(assert (=> bs!13092 m!248229))

(assert (=> bs!13092 m!248239))

(declare-fun m!248777 () Bool)

(assert (=> bs!13092 m!248777))

(assert (=> bs!13092 m!248443))

(assert (=> bs!13092 m!248239))

(assert (=> bs!13092 m!248255))

(declare-fun m!248779 () Bool)

(assert (=> bs!13092 m!248779))

(assert (=> d!53036 d!53099))

(assert (=> d!53036 d!53042))

(declare-fun d!53101 () Bool)

(declare-fun res!132357 () Bool)

(declare-fun e!107677 () Bool)

(assert (=> d!53101 (=> res!132357 e!107677)))

(assert (=> d!53101 (= res!132357 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!53101 (= (arrayRangesEq!446 (_2!7681 lt!249617) (_2!7681 lt!249619) #b00000000000000000000000000000000 to!236) e!107677)))

(declare-fun b!158433 () Bool)

(declare-fun e!107678 () Bool)

(assert (=> b!158433 (= e!107677 e!107678)))

(declare-fun res!132358 () Bool)

(assert (=> b!158433 (=> (not res!132358) (not e!107678))))

(assert (=> b!158433 (= res!132358 (= (select (arr!4251 (_2!7681 lt!249617)) #b00000000000000000000000000000000) (select (arr!4251 (_2!7681 lt!249619)) #b00000000000000000000000000000000)))))

(declare-fun b!158434 () Bool)

(assert (=> b!158434 (= e!107678 (arrayRangesEq!446 (_2!7681 lt!249617) (_2!7681 lt!249619) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!53101 (not res!132357)) b!158433))

(assert (= (and b!158433 res!132358) b!158434))

(declare-fun m!248781 () Bool)

(assert (=> b!158433 m!248781))

(declare-fun m!248783 () Bool)

(assert (=> b!158433 m!248783))

(declare-fun m!248785 () Bool)

(assert (=> b!158434 m!248785))

(assert (=> d!53036 d!53101))

(assert (=> d!53036 d!53050))

(assert (=> d!53036 d!53061))

(declare-fun d!53103 () Bool)

(declare-fun res!132359 () Bool)

(declare-fun e!107679 () Bool)

(assert (=> d!53103 (=> res!132359 e!107679)))

(assert (=> d!53103 (= res!132359 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!53103 (= (arrayRangesEq!446 (_2!7681 lt!249479) (_2!7681 lt!249485) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!107679)))

(declare-fun b!158435 () Bool)

(declare-fun e!107680 () Bool)

(assert (=> b!158435 (= e!107679 e!107680)))

(declare-fun res!132360 () Bool)

(assert (=> b!158435 (=> (not res!132360) (not e!107680))))

(assert (=> b!158435 (= res!132360 (= (select (arr!4251 (_2!7681 lt!249479)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4251 (_2!7681 lt!249485)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!158436 () Bool)

(assert (=> b!158436 (= e!107680 (arrayRangesEq!446 (_2!7681 lt!249479) (_2!7681 lt!249485) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!53103 (not res!132359)) b!158435))

(assert (= (and b!158435 res!132360) b!158436))

(declare-fun m!248787 () Bool)

(assert (=> b!158435 m!248787))

(declare-fun m!248789 () Bool)

(assert (=> b!158435 m!248789))

(declare-fun m!248791 () Bool)

(assert (=> b!158436 m!248791))

(assert (=> b!158352 d!53103))

(declare-fun d!53105 () Bool)

(assert (=> d!53105 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) ((_ sign_extend 32) (currentByte!6981 lt!249476)) ((_ sign_extend 32) (currentBit!6976 lt!249476)) (bvsub (bvsub to!236 from!240) lt!249629)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) lt!249629)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) ((_ sign_extend 32) (currentByte!6981 lt!249476)) ((_ sign_extend 32) (currentBit!6976 lt!249476))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13093 () Bool)

(assert (= bs!13093 d!53105))

(declare-fun m!248793 () Bool)

(assert (=> bs!13093 m!248793))

(assert (=> b!158357 d!53105))

(declare-fun d!53107 () Bool)

(assert (=> d!53107 (= (remainingBits!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) lt!249477 lt!249482) (bvsub (bvmul ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul lt!249477 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249482)))))

(assert (=> d!53056 d!53107))

(assert (=> d!53048 d!53107))

(declare-fun d!53109 () Bool)

(declare-fun e!107683 () Bool)

(assert (=> d!53109 e!107683))

(declare-fun res!132363 () Bool)

(assert (=> d!53109 (=> (not res!132363) (not e!107683))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5856 (_ BitVec 32)) Bool)

(assert (=> d!53109 (= res!132363 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10652 () Unit!10582)

(assert (=> d!53109 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14455 Unit!10652 (BitStream!5857 (buf!3802 bs!65) (bvadd (currentByte!6981 bs!65) #b00000000000000000000000000000001) (currentBit!6976 bs!65))))))

(declare-fun b!158439 () Bool)

(assert (=> b!158439 (= e!107683 (and (or (not (= (bvand (currentByte!6981 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6981 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6981 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6981 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6981 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!53109 res!132363) b!158439))

(declare-fun m!248795 () Bool)

(assert (=> d!53109 m!248795))

(assert (=> d!53052 d!53109))

(declare-fun d!53111 () Bool)

(declare-fun e!107690 () Bool)

(assert (=> d!53111 e!107690))

(declare-fun res!132370 () Bool)

(assert (=> d!53111 (=> res!132370 e!107690)))

(assert (=> d!53111 (= res!132370 (bvsge (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!250137 () Bool)

(declare-fun e!107692 () Bool)

(assert (=> d!53111 (= lt!250137 e!107692)))

(declare-fun res!132371 () Bool)

(assert (=> d!53111 (=> (not res!132371) (not e!107692))))

(declare-fun lt!250142 () (_ BitVec 64))

(declare-fun lt!250156 () tuple3!694)

(declare-fun lt!250138 () (_ BitVec 64))

(assert (=> d!53111 (= res!132371 (= (bvadd lt!250142 lt!250138) (bitIndex!0 (size!3342 (buf!3802 (_2!7691 lt!250156))) (currentByte!6981 (_2!7691 lt!250156)) (currentBit!6976 (_2!7691 lt!250156)))))))

(assert (=> d!53111 (or (not (= (bvand lt!250142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!250138 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!250142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!250142 lt!250138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!250128 () (_ BitVec 64))

(assert (=> d!53111 (= lt!250138 (bvmul lt!250128 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!53111 (or (= lt!250128 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!250128 #b0000000000000000000000000000000000000000000000000000000000001000) lt!250128)))))

(assert (=> d!53111 (= lt!250128 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))))))

(assert (=> d!53111 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000010 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!53111 (= lt!250142 (bitIndex!0 (size!3342 (buf!3802 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001))) (currentByte!6981 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001)) (currentBit!6976 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001))))))

(declare-fun e!107691 () tuple3!694)

(assert (=> d!53111 (= lt!250156 e!107691)))

(declare-fun c!8415 () Bool)

(assert (=> d!53111 (= c!8415 (bvslt (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!53111 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)) (bvsle (bvadd #b00000000000000000000000000000010 from!240) to!236) (bvsle to!236 (size!3342 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)))))))

(assert (=> d!53111 (= (readByteArrayLoop!0 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001) (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) lt!250156)))

(declare-fun call!2681 () Bool)

(declare-fun lt!250154 () (_ BitVec 32))

(declare-fun lt!250151 () tuple3!694)

(declare-fun lt!250132 () array!7364)

(declare-fun lt!250155 () (_ BitVec 32))

(declare-fun bm!2676 () Bool)

(declare-fun lt!250143 () array!7364)

(assert (=> bm!2676 (= call!2681 (arrayRangesEq!446 (ite c!8415 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)) lt!250132) (ite c!8415 (_3!464 lt!250151) lt!250143) (ite c!8415 #b00000000000000000000000000000000 lt!250154) (ite c!8415 (bvadd #b00000000000000000000000000000010 from!240) lt!250155)))))

(declare-fun b!158450 () Bool)

(assert (=> b!158450 (= e!107690 (= (select (arr!4251 (_3!464 lt!250156)) (bvadd #b00000000000000000000000000000010 from!240)) (_2!7680 (readBytePure!0 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001)))))))

(assert (=> b!158450 (and (bvsge (bvadd #b00000000000000000000000000000010 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000010 from!240) (size!3342 (_3!464 lt!250156))))))

(declare-fun bm!2677 () Bool)

(declare-fun call!2680 () (_ BitVec 64))

(assert (=> bm!2677 (= call!2680 (bitIndex!0 (ite c!8415 (size!3342 (buf!3802 (_2!7691 lt!250151))) (size!3342 (buf!3802 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001)))) (ite c!8415 (currentByte!6981 (_2!7691 lt!250151)) (currentByte!6981 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001))) (ite c!8415 (currentBit!6976 (_2!7691 lt!250151)) (currentBit!6976 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001)))))))

(declare-fun lt!250157 () Unit!10582)

(declare-fun b!158451 () Bool)

(assert (=> b!158451 (= e!107691 (tuple3!695 lt!250157 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001) (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153))))))

(assert (=> b!158451 (= call!2680 call!2680)))

(declare-fun lt!250152 () Unit!10582)

(declare-fun Unit!10653 () Unit!10582)

(assert (=> b!158451 (= lt!250152 Unit!10653)))

(declare-fun lt!250126 () Unit!10582)

(declare-fun arrayRangesEqReflexiveLemma!55 (array!7364) Unit!10582)

(assert (=> b!158451 (= lt!250126 (arrayRangesEqReflexiveLemma!55 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153))))))

(declare-fun call!2679 () Bool)

(assert (=> b!158451 call!2679))

(declare-fun lt!250135 () Unit!10582)

(assert (=> b!158451 (= lt!250135 lt!250126)))

(assert (=> b!158451 (= lt!250132 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)))))

(assert (=> b!158451 (= lt!250143 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)))))

(declare-fun lt!250139 () (_ BitVec 32))

(assert (=> b!158451 (= lt!250139 #b00000000000000000000000000000000)))

(declare-fun lt!250150 () (_ BitVec 32))

(assert (=> b!158451 (= lt!250150 (size!3342 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153))))))

(assert (=> b!158451 (= lt!250154 #b00000000000000000000000000000000)))

(assert (=> b!158451 (= lt!250155 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun arrayRangesEqSlicedLemma!55 (array!7364 array!7364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10582)

(assert (=> b!158451 (= lt!250157 (arrayRangesEqSlicedLemma!55 lt!250132 lt!250143 lt!250139 lt!250150 lt!250154 lt!250155))))

(assert (=> b!158451 call!2681))

(declare-fun b!158452 () Bool)

(declare-fun res!132372 () Bool)

(assert (=> b!158452 (=> (not res!132372) (not e!107692))))

(assert (=> b!158452 (= res!132372 (and (= (buf!3802 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001)) (buf!3802 (_2!7691 lt!250156))) (= (size!3342 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153))) (size!3342 (_3!464 lt!250156)))))))

(declare-fun bm!2678 () Bool)

(declare-fun lt!250127 () tuple2!14452)

(assert (=> bm!2678 (= call!2679 (arrayRangesEq!446 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)) (ite c!8415 (array!7365 (store (arr!4251 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7690 lt!250127)) (size!3342 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)))) (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153))) #b00000000000000000000000000000000 (ite c!8415 (bvadd #b00000000000000000000000000000010 from!240) (size!3342 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153))))))))

(declare-fun b!158453 () Bool)

(declare-fun lt!250136 () Unit!10582)

(assert (=> b!158453 (= e!107691 (tuple3!695 lt!250136 (_2!7691 lt!250151) (_3!464 lt!250151)))))

(assert (=> b!158453 (= lt!250127 (readByte!0 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001)))))

(declare-fun lt!250124 () array!7364)

(assert (=> b!158453 (= lt!250124 (array!7365 (store (arr!4251 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7690 lt!250127)) (size!3342 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)))))))

(declare-fun lt!250146 () (_ BitVec 64))

(assert (=> b!158453 (= lt!250146 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!250134 () (_ BitVec 32))

(assert (=> b!158453 (= lt!250134 (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!250147 () Unit!10582)

(assert (=> b!158453 (= lt!250147 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001) (_2!7690 lt!250127) lt!250146 lt!250134))))

(assert (=> b!158453 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 (_2!7690 lt!250127)))) ((_ sign_extend 32) (currentByte!6981 (_2!7690 lt!250127))) ((_ sign_extend 32) (currentBit!6976 (_2!7690 lt!250127))) (bvsub lt!250134 ((_ extract 31 0) (bvsdiv (bvadd lt!250146 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!250123 () Unit!10582)

(assert (=> b!158453 (= lt!250123 lt!250147)))

(assert (=> b!158453 (= lt!250151 (readByteArrayLoop!0 (_2!7690 lt!250127) lt!250124 (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!158453 (= (bitIndex!0 (size!3342 (buf!3802 (_2!7690 lt!250127))) (currentByte!6981 (_2!7690 lt!250127)) (currentBit!6976 (_2!7690 lt!250127))) (bvadd (bitIndex!0 (size!3342 (buf!3802 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001))) (currentByte!6981 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001)) (currentBit!6976 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!250130 () Unit!10582)

(declare-fun Unit!10654 () Unit!10582)

(assert (=> b!158453 (= lt!250130 Unit!10654)))

(assert (=> b!158453 (= (bvadd (bitIndex!0 (size!3342 (buf!3802 (_2!7690 lt!250127))) (currentByte!6981 (_2!7690 lt!250127)) (currentBit!6976 (_2!7690 lt!250127))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2680)))

(declare-fun lt!250129 () Unit!10582)

(declare-fun Unit!10655 () Unit!10582)

(assert (=> b!158453 (= lt!250129 Unit!10655)))

(assert (=> b!158453 (= (bvadd (bitIndex!0 (size!3342 (buf!3802 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001))) (currentByte!6981 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001)) (currentBit!6976 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2680)))

(declare-fun lt!250149 () Unit!10582)

(declare-fun Unit!10656 () Unit!10582)

(assert (=> b!158453 (= lt!250149 Unit!10656)))

(assert (=> b!158453 (and (= (buf!3802 (withMovedByteIndex!0 lt!249476 #b00000000000000000000000000000001)) (buf!3802 (_2!7691 lt!250151))) (= (size!3342 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153))) (size!3342 (_3!464 lt!250151))))))

(declare-fun lt!250122 () Unit!10582)

(declare-fun Unit!10657 () Unit!10582)

(assert (=> b!158453 (= lt!250122 Unit!10657)))

(declare-fun lt!250133 () Unit!10582)

(declare-fun arrayUpdatedAtPrefixLemma!55 (array!7364 (_ BitVec 32) (_ BitVec 8)) Unit!10582)

(assert (=> b!158453 (= lt!250133 (arrayUpdatedAtPrefixLemma!55 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) (_1!7690 lt!250127)))))

(assert (=> b!158453 call!2679))

(declare-fun lt!250148 () Unit!10582)

(assert (=> b!158453 (= lt!250148 lt!250133)))

(declare-fun lt!250144 () (_ BitVec 32))

(assert (=> b!158453 (= lt!250144 #b00000000000000000000000000000000)))

(declare-fun lt!250140 () Unit!10582)

(declare-fun arrayRangesEqTransitive!120 (array!7364 array!7364 array!7364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10582)

(assert (=> b!158453 (= lt!250140 (arrayRangesEqTransitive!120 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)) lt!250124 (_3!464 lt!250151) lt!250144 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158453 (arrayRangesEq!446 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)) (_3!464 lt!250151) lt!250144 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun lt!250153 () Unit!10582)

(assert (=> b!158453 (= lt!250153 lt!250140)))

(assert (=> b!158453 call!2681))

(declare-fun lt!250141 () Unit!10582)

(declare-fun Unit!10658 () Unit!10582)

(assert (=> b!158453 (= lt!250141 Unit!10658)))

(declare-fun lt!250125 () Unit!10582)

(declare-fun arrayRangesEqImpliesEq!64 (array!7364 array!7364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10582)

(assert (=> b!158453 (= lt!250125 (arrayRangesEqImpliesEq!64 lt!250124 (_3!464 lt!250151) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158453 (= (select (store (arr!4251 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7690 lt!250127)) (bvadd #b00000000000000000000000000000010 from!240)) (select (arr!4251 (_3!464 lt!250151)) (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!250131 () Unit!10582)

(assert (=> b!158453 (= lt!250131 lt!250125)))

(declare-fun lt!250145 () Bool)

(assert (=> b!158453 (= lt!250145 (= (select (arr!4251 (_3!464 lt!250151)) (bvadd #b00000000000000000000000000000010 from!240)) (_1!7690 lt!250127)))))

(declare-fun Unit!10659 () Unit!10582)

(assert (=> b!158453 (= lt!250136 Unit!10659)))

(assert (=> b!158453 lt!250145))

(declare-fun b!158454 () Bool)

(assert (=> b!158454 (= e!107692 (arrayRangesEq!446 (array!7365 (store (store (arr!4251 arr!153) from!240 (_2!7680 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7680 lt!249480)) (size!3342 arr!153)) (_3!464 lt!250156) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)))))

(assert (= (and d!53111 c!8415) b!158453))

(assert (= (and d!53111 (not c!8415)) b!158451))

(assert (= (or b!158453 b!158451) bm!2676))

(assert (= (or b!158453 b!158451) bm!2678))

(assert (= (or b!158453 b!158451) bm!2677))

(assert (= (and d!53111 res!132371) b!158452))

(assert (= (and b!158452 res!132372) b!158454))

(assert (= (and d!53111 (not res!132370)) b!158450))

(declare-fun m!248797 () Bool)

(assert (=> b!158454 m!248797))

(declare-fun m!248799 () Bool)

(assert (=> bm!2678 m!248799))

(declare-fun m!248801 () Bool)

(assert (=> bm!2678 m!248801))

(declare-fun m!248803 () Bool)

(assert (=> bm!2676 m!248803))

(declare-fun m!248805 () Bool)

(assert (=> bm!2677 m!248805))

(declare-fun m!248807 () Bool)

(assert (=> b!158453 m!248807))

(assert (=> b!158453 m!248799))

(declare-fun m!248809 () Bool)

(assert (=> b!158453 m!248809))

(declare-fun m!248811 () Bool)

(assert (=> b!158453 m!248811))

(declare-fun m!248813 () Bool)

(assert (=> b!158453 m!248813))

(assert (=> b!158453 m!248239))

(declare-fun m!248815 () Bool)

(assert (=> b!158453 m!248815))

(declare-fun m!248817 () Bool)

(assert (=> b!158453 m!248817))

(declare-fun m!248819 () Bool)

(assert (=> b!158453 m!248819))

(declare-fun m!248821 () Bool)

(assert (=> b!158453 m!248821))

(declare-fun m!248823 () Bool)

(assert (=> b!158453 m!248823))

(declare-fun m!248825 () Bool)

(assert (=> b!158453 m!248825))

(declare-fun m!248827 () Bool)

(assert (=> b!158453 m!248827))

(assert (=> b!158453 m!248239))

(declare-fun m!248829 () Bool)

(assert (=> b!158453 m!248829))

(declare-fun m!248831 () Bool)

(assert (=> d!53111 m!248831))

(assert (=> d!53111 m!248807))

(declare-fun m!248833 () Bool)

(assert (=> b!158451 m!248833))

(declare-fun m!248835 () Bool)

(assert (=> b!158451 m!248835))

(declare-fun m!248837 () Bool)

(assert (=> b!158450 m!248837))

(assert (=> b!158450 m!248239))

(declare-fun m!248839 () Bool)

(assert (=> b!158450 m!248839))

(assert (=> d!53028 d!53111))

(declare-fun d!53113 () Bool)

(declare-fun e!107693 () Bool)

(assert (=> d!53113 e!107693))

(declare-fun res!132373 () Bool)

(assert (=> d!53113 (=> res!132373 e!107693)))

(assert (=> d!53113 (= res!132373 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!250173 () Bool)

(declare-fun e!107695 () Bool)

(assert (=> d!53113 (= lt!250173 e!107695)))

(declare-fun res!132374 () Bool)

(assert (=> d!53113 (=> (not res!132374) (not e!107695))))

(declare-fun lt!250178 () (_ BitVec 64))

(declare-fun lt!250192 () tuple3!694)

(declare-fun lt!250174 () (_ BitVec 64))

(assert (=> d!53113 (= res!132374 (= (bvadd lt!250178 lt!250174) (bitIndex!0 (size!3342 (buf!3802 (_2!7691 lt!250192))) (currentByte!6981 (_2!7691 lt!250192)) (currentBit!6976 (_2!7691 lt!250192)))))))

(assert (=> d!53113 (or (not (= (bvand lt!250178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!250174 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!250178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!250178 lt!250174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!250164 () (_ BitVec 64))

(assert (=> d!53113 (= lt!250174 (bvmul lt!250164 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!53113 (or (= lt!250164 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!250164 #b0000000000000000000000000000000000000000000000000000000000001000) lt!250164)))))

(assert (=> d!53113 (= lt!250164 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!53113 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!53113 (= lt!250178 (bitIndex!0 (size!3342 (buf!3802 lt!249476)) (currentByte!6981 lt!249476) (currentBit!6976 lt!249476)))))

(declare-fun e!107694 () tuple3!694)

(assert (=> d!53113 (= lt!250192 e!107694)))

(declare-fun c!8416 () Bool)

(assert (=> d!53113 (= c!8416 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!53113 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3342 lt!249481)))))

(assert (=> d!53113 (= (readByteArrayLoop!0 lt!249476 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!250192)))

(declare-fun lt!250179 () array!7364)

(declare-fun lt!250168 () array!7364)

(declare-fun call!2684 () Bool)

(declare-fun lt!250187 () tuple3!694)

(declare-fun lt!250190 () (_ BitVec 32))

(declare-fun lt!250191 () (_ BitVec 32))

(declare-fun bm!2679 () Bool)

(assert (=> bm!2679 (= call!2684 (arrayRangesEq!446 (ite c!8416 lt!249481 lt!250168) (ite c!8416 (_3!464 lt!250187) lt!250179) (ite c!8416 #b00000000000000000000000000000000 lt!250190) (ite c!8416 (bvadd #b00000000000000000000000000000001 from!240) lt!250191)))))

(declare-fun b!158455 () Bool)

(assert (=> b!158455 (= e!107693 (= (select (arr!4251 (_3!464 lt!250192)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7680 (readBytePure!0 lt!249476))))))

(assert (=> b!158455 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3342 (_3!464 lt!250192))))))

(declare-fun call!2683 () (_ BitVec 64))

(declare-fun bm!2680 () Bool)

(assert (=> bm!2680 (= call!2683 (bitIndex!0 (ite c!8416 (size!3342 (buf!3802 (_2!7691 lt!250187))) (size!3342 (buf!3802 lt!249476))) (ite c!8416 (currentByte!6981 (_2!7691 lt!250187)) (currentByte!6981 lt!249476)) (ite c!8416 (currentBit!6976 (_2!7691 lt!250187)) (currentBit!6976 lt!249476))))))

(declare-fun b!158456 () Bool)

(declare-fun lt!250193 () Unit!10582)

(assert (=> b!158456 (= e!107694 (tuple3!695 lt!250193 lt!249476 lt!249481))))

(assert (=> b!158456 (= call!2683 call!2683)))

(declare-fun lt!250188 () Unit!10582)

(declare-fun Unit!10660 () Unit!10582)

(assert (=> b!158456 (= lt!250188 Unit!10660)))

(declare-fun lt!250162 () Unit!10582)

(assert (=> b!158456 (= lt!250162 (arrayRangesEqReflexiveLemma!55 lt!249481))))

(declare-fun call!2682 () Bool)

(assert (=> b!158456 call!2682))

(declare-fun lt!250171 () Unit!10582)

(assert (=> b!158456 (= lt!250171 lt!250162)))

(assert (=> b!158456 (= lt!250168 lt!249481)))

(assert (=> b!158456 (= lt!250179 lt!249481)))

(declare-fun lt!250175 () (_ BitVec 32))

(assert (=> b!158456 (= lt!250175 #b00000000000000000000000000000000)))

(declare-fun lt!250186 () (_ BitVec 32))

(assert (=> b!158456 (= lt!250186 (size!3342 lt!249481))))

(assert (=> b!158456 (= lt!250190 #b00000000000000000000000000000000)))

(assert (=> b!158456 (= lt!250191 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!158456 (= lt!250193 (arrayRangesEqSlicedLemma!55 lt!250168 lt!250179 lt!250175 lt!250186 lt!250190 lt!250191))))

(assert (=> b!158456 call!2684))

(declare-fun b!158457 () Bool)

(declare-fun res!132375 () Bool)

(assert (=> b!158457 (=> (not res!132375) (not e!107695))))

(assert (=> b!158457 (= res!132375 (and (= (buf!3802 lt!249476) (buf!3802 (_2!7691 lt!250192))) (= (size!3342 lt!249481) (size!3342 (_3!464 lt!250192)))))))

(declare-fun bm!2681 () Bool)

(declare-fun lt!250163 () tuple2!14452)

(assert (=> bm!2681 (= call!2682 (arrayRangesEq!446 lt!249481 (ite c!8416 (array!7365 (store (arr!4251 lt!249481) (bvadd #b00000000000000000000000000000001 from!240) (_1!7690 lt!250163)) (size!3342 lt!249481)) lt!249481) #b00000000000000000000000000000000 (ite c!8416 (bvadd #b00000000000000000000000000000001 from!240) (size!3342 lt!249481))))))

(declare-fun b!158458 () Bool)

(declare-fun lt!250172 () Unit!10582)

(assert (=> b!158458 (= e!107694 (tuple3!695 lt!250172 (_2!7691 lt!250187) (_3!464 lt!250187)))))

(assert (=> b!158458 (= lt!250163 (readByte!0 lt!249476))))

(declare-fun lt!250160 () array!7364)

(assert (=> b!158458 (= lt!250160 (array!7365 (store (arr!4251 lt!249481) (bvadd #b00000000000000000000000000000001 from!240) (_1!7690 lt!250163)) (size!3342 lt!249481)))))

(declare-fun lt!250182 () (_ BitVec 64))

(assert (=> b!158458 (= lt!250182 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!250170 () (_ BitVec 32))

(assert (=> b!158458 (= lt!250170 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!250183 () Unit!10582)

(assert (=> b!158458 (= lt!250183 (validateOffsetBytesFromBitIndexLemma!0 lt!249476 (_2!7690 lt!250163) lt!250182 lt!250170))))

(assert (=> b!158458 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 (_2!7690 lt!250163)))) ((_ sign_extend 32) (currentByte!6981 (_2!7690 lt!250163))) ((_ sign_extend 32) (currentBit!6976 (_2!7690 lt!250163))) (bvsub lt!250170 ((_ extract 31 0) (bvsdiv (bvadd lt!250182 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!250159 () Unit!10582)

(assert (=> b!158458 (= lt!250159 lt!250183)))

(assert (=> b!158458 (= lt!250187 (readByteArrayLoop!0 (_2!7690 lt!250163) lt!250160 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!158458 (= (bitIndex!0 (size!3342 (buf!3802 (_2!7690 lt!250163))) (currentByte!6981 (_2!7690 lt!250163)) (currentBit!6976 (_2!7690 lt!250163))) (bvadd (bitIndex!0 (size!3342 (buf!3802 lt!249476)) (currentByte!6981 lt!249476) (currentBit!6976 lt!249476)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!250166 () Unit!10582)

(declare-fun Unit!10661 () Unit!10582)

(assert (=> b!158458 (= lt!250166 Unit!10661)))

(assert (=> b!158458 (= (bvadd (bitIndex!0 (size!3342 (buf!3802 (_2!7690 lt!250163))) (currentByte!6981 (_2!7690 lt!250163)) (currentBit!6976 (_2!7690 lt!250163))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2683)))

(declare-fun lt!250165 () Unit!10582)

(declare-fun Unit!10662 () Unit!10582)

(assert (=> b!158458 (= lt!250165 Unit!10662)))

(assert (=> b!158458 (= (bvadd (bitIndex!0 (size!3342 (buf!3802 lt!249476)) (currentByte!6981 lt!249476) (currentBit!6976 lt!249476)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2683)))

(declare-fun lt!250185 () Unit!10582)

(declare-fun Unit!10663 () Unit!10582)

(assert (=> b!158458 (= lt!250185 Unit!10663)))

(assert (=> b!158458 (and (= (buf!3802 lt!249476) (buf!3802 (_2!7691 lt!250187))) (= (size!3342 lt!249481) (size!3342 (_3!464 lt!250187))))))

(declare-fun lt!250158 () Unit!10582)

(declare-fun Unit!10664 () Unit!10582)

(assert (=> b!158458 (= lt!250158 Unit!10664)))

(declare-fun lt!250169 () Unit!10582)

(assert (=> b!158458 (= lt!250169 (arrayUpdatedAtPrefixLemma!55 lt!249481 (bvadd #b00000000000000000000000000000001 from!240) (_1!7690 lt!250163)))))

(assert (=> b!158458 call!2682))

(declare-fun lt!250184 () Unit!10582)

(assert (=> b!158458 (= lt!250184 lt!250169)))

(declare-fun lt!250180 () (_ BitVec 32))

(assert (=> b!158458 (= lt!250180 #b00000000000000000000000000000000)))

(declare-fun lt!250176 () Unit!10582)

(assert (=> b!158458 (= lt!250176 (arrayRangesEqTransitive!120 lt!249481 lt!250160 (_3!464 lt!250187) lt!250180 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158458 (arrayRangesEq!446 lt!249481 (_3!464 lt!250187) lt!250180 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!250189 () Unit!10582)

(assert (=> b!158458 (= lt!250189 lt!250176)))

(assert (=> b!158458 call!2684))

(declare-fun lt!250177 () Unit!10582)

(declare-fun Unit!10665 () Unit!10582)

(assert (=> b!158458 (= lt!250177 Unit!10665)))

(declare-fun lt!250161 () Unit!10582)

(assert (=> b!158458 (= lt!250161 (arrayRangesEqImpliesEq!64 lt!250160 (_3!464 lt!250187) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158458 (= (select (store (arr!4251 lt!249481) (bvadd #b00000000000000000000000000000001 from!240) (_1!7690 lt!250163)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4251 (_3!464 lt!250187)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!250167 () Unit!10582)

(assert (=> b!158458 (= lt!250167 lt!250161)))

(declare-fun lt!250181 () Bool)

(assert (=> b!158458 (= lt!250181 (= (select (arr!4251 (_3!464 lt!250187)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7690 lt!250163)))))

(declare-fun Unit!10666 () Unit!10582)

(assert (=> b!158458 (= lt!250172 Unit!10666)))

(assert (=> b!158458 lt!250181))

(declare-fun b!158459 () Bool)

(assert (=> b!158459 (= e!107695 (arrayRangesEq!446 lt!249481 (_3!464 lt!250192) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(assert (= (and d!53113 c!8416) b!158458))

(assert (= (and d!53113 (not c!8416)) b!158456))

(assert (= (or b!158458 b!158456) bm!2679))

(assert (= (or b!158458 b!158456) bm!2681))

(assert (= (or b!158458 b!158456) bm!2680))

(assert (= (and d!53113 res!132374) b!158457))

(assert (= (and b!158457 res!132375) b!158459))

(assert (= (and d!53113 (not res!132373)) b!158455))

(declare-fun m!248841 () Bool)

(assert (=> b!158459 m!248841))

(declare-fun m!248843 () Bool)

(assert (=> bm!2681 m!248843))

(declare-fun m!248845 () Bool)

(assert (=> bm!2681 m!248845))

(declare-fun m!248847 () Bool)

(assert (=> bm!2679 m!248847))

(declare-fun m!248849 () Bool)

(assert (=> bm!2680 m!248849))

(declare-fun m!248851 () Bool)

(assert (=> b!158458 m!248851))

(assert (=> b!158458 m!248843))

(declare-fun m!248853 () Bool)

(assert (=> b!158458 m!248853))

(declare-fun m!248855 () Bool)

(assert (=> b!158458 m!248855))

(declare-fun m!248857 () Bool)

(assert (=> b!158458 m!248857))

(declare-fun m!248859 () Bool)

(assert (=> b!158458 m!248859))

(declare-fun m!248861 () Bool)

(assert (=> b!158458 m!248861))

(declare-fun m!248863 () Bool)

(assert (=> b!158458 m!248863))

(declare-fun m!248865 () Bool)

(assert (=> b!158458 m!248865))

(declare-fun m!248867 () Bool)

(assert (=> b!158458 m!248867))

(declare-fun m!248869 () Bool)

(assert (=> b!158458 m!248869))

(declare-fun m!248871 () Bool)

(assert (=> b!158458 m!248871))

(assert (=> b!158458 m!248475))

(declare-fun m!248873 () Bool)

(assert (=> d!53113 m!248873))

(assert (=> d!53113 m!248851))

(declare-fun m!248875 () Bool)

(assert (=> b!158456 m!248875))

(declare-fun m!248877 () Bool)

(assert (=> b!158456 m!248877))

(declare-fun m!248879 () Bool)

(assert (=> b!158455 m!248879))

(assert (=> b!158455 m!248255))

(assert (=> d!53050 d!53113))

(declare-fun d!53115 () Bool)

(assert (=> d!53115 (= (remainingBits!0 ((_ sign_extend 32) (size!3342 (buf!3802 bs!65))) ((_ sign_extend 32) (currentByte!6981 bs!65)) ((_ sign_extend 32) (currentBit!6976 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3342 (buf!3802 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6981 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6976 bs!65)))))))

(assert (=> d!53018 d!53115))

(declare-fun d!53117 () Bool)

(declare-fun res!132376 () Bool)

(declare-fun e!107696 () Bool)

(assert (=> d!53117 (=> res!132376 e!107696)))

(assert (=> d!53117 (= res!132376 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!53117 (= (arrayRangesEq!446 (_2!7681 lt!249486) (_2!7681 lt!249479) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!107696)))

(declare-fun b!158460 () Bool)

(declare-fun e!107697 () Bool)

(assert (=> b!158460 (= e!107696 e!107697)))

(declare-fun res!132377 () Bool)

(assert (=> b!158460 (=> (not res!132377) (not e!107697))))

(assert (=> b!158460 (= res!132377 (= (select (arr!4251 (_2!7681 lt!249486)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4251 (_2!7681 lt!249479)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!158461 () Bool)

(assert (=> b!158461 (= e!107697 (arrayRangesEq!446 (_2!7681 lt!249486) (_2!7681 lt!249479) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!53117 (not res!132376)) b!158460))

(assert (= (and b!158460 res!132377) b!158461))

(declare-fun m!248881 () Bool)

(assert (=> b!158460 m!248881))

(assert (=> b!158460 m!248787))

(declare-fun m!248883 () Bool)

(assert (=> b!158461 m!248883))

(assert (=> b!158354 d!53117))

(declare-fun d!53119 () Bool)

(assert (=> d!53119 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) ((_ sign_extend 32) (currentByte!6981 lt!249476)) ((_ sign_extend 32) (currentBit!6976 lt!249476)) (bvsub (bvsub to!236 from!240) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!53119 true))

(declare-fun _$7!121 () Unit!10582)

(assert (=> d!53119 (= (choose!57 bs!65 lt!249476 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) _$7!121)))

(declare-fun bs!13094 () Bool)

(assert (= bs!13094 d!53119))

(declare-fun m!248885 () Bool)

(assert (=> bs!13094 m!248885))

(assert (=> d!53058 d!53119))

(declare-fun d!53121 () Bool)

(assert (=> d!53121 (= (invariant!0 (currentBit!6976 bs!65) (currentByte!6981 bs!65) (size!3342 (buf!3802 bs!65))) (and (bvsge (currentBit!6976 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6976 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6981 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6981 bs!65) (size!3342 (buf!3802 bs!65))) (and (= (currentBit!6976 bs!65) #b00000000000000000000000000000000) (= (currentByte!6981 bs!65) (size!3342 (buf!3802 bs!65)))))))))

(assert (=> d!53046 d!53121))

(declare-fun d!53123 () Bool)

(declare-fun lt!250198 () (_ BitVec 8))

(declare-fun lt!250200 () (_ BitVec 8))

(assert (=> d!53123 (= lt!250198 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4251 (buf!3802 lt!249476)) (currentByte!6981 lt!249476))) ((_ sign_extend 24) lt!250200))))))

(assert (=> d!53123 (= lt!250200 ((_ extract 7 0) (currentBit!6976 lt!249476)))))

(declare-fun e!107699 () Bool)

(assert (=> d!53123 e!107699))

(declare-fun res!132378 () Bool)

(assert (=> d!53123 (=> (not res!132378) (not e!107699))))

(assert (=> d!53123 (= res!132378 (validate_offset_bits!1 ((_ sign_extend 32) (size!3342 (buf!3802 lt!249476))) ((_ sign_extend 32) (currentByte!6981 lt!249476)) ((_ sign_extend 32) (currentBit!6976 lt!249476)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10667 () Unit!10582)

(declare-fun Unit!10668 () Unit!10582)

(assert (=> d!53123 (= (readByte!0 lt!249476) (tuple2!14453 (_2!7695 (ite (bvsgt ((_ sign_extend 24) lt!250200) #b00000000000000000000000000000000) (tuple2!14461 Unit!10667 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250198) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4251 (buf!3802 lt!249476)) (bvadd (currentByte!6981 lt!249476) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!250200)))))))) (tuple2!14461 Unit!10668 lt!250198))) (BitStream!5857 (buf!3802 lt!249476) (bvadd (currentByte!6981 lt!249476) #b00000000000000000000000000000001) (currentBit!6976 lt!249476))))))

(declare-fun b!158462 () Bool)

(declare-fun e!107698 () Bool)

(assert (=> b!158462 (= e!107699 e!107698)))

(declare-fun res!132379 () Bool)

(assert (=> b!158462 (=> (not res!132379) (not e!107698))))

(declare-fun lt!250194 () tuple2!14452)

(assert (=> b!158462 (= res!132379 (= (buf!3802 (_2!7690 lt!250194)) (buf!3802 lt!249476)))))

(declare-fun lt!250199 () (_ BitVec 8))

(declare-fun lt!250195 () (_ BitVec 8))

(declare-fun Unit!10669 () Unit!10582)

(declare-fun Unit!10670 () Unit!10582)

(assert (=> b!158462 (= lt!250194 (tuple2!14453 (_2!7695 (ite (bvsgt ((_ sign_extend 24) lt!250199) #b00000000000000000000000000000000) (tuple2!14461 Unit!10669 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250195) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4251 (buf!3802 lt!249476)) (bvadd (currentByte!6981 lt!249476) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!250199)))))))) (tuple2!14461 Unit!10670 lt!250195))) (BitStream!5857 (buf!3802 lt!249476) (bvadd (currentByte!6981 lt!249476) #b00000000000000000000000000000001) (currentBit!6976 lt!249476))))))

(assert (=> b!158462 (= lt!250195 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4251 (buf!3802 lt!249476)) (currentByte!6981 lt!249476))) ((_ sign_extend 24) lt!250199))))))

(assert (=> b!158462 (= lt!250199 ((_ extract 7 0) (currentBit!6976 lt!249476)))))

(declare-fun lt!250197 () (_ BitVec 64))

(declare-fun lt!250196 () (_ BitVec 64))

(declare-fun b!158463 () Bool)

(assert (=> b!158463 (= e!107698 (= (bitIndex!0 (size!3342 (buf!3802 (_2!7690 lt!250194))) (currentByte!6981 (_2!7690 lt!250194)) (currentBit!6976 (_2!7690 lt!250194))) (bvadd lt!250196 lt!250197)))))

(assert (=> b!158463 (or (not (= (bvand lt!250196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!250197 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!250196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!250196 lt!250197) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!158463 (= lt!250197 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!158463 (= lt!250196 (bitIndex!0 (size!3342 (buf!3802 lt!249476)) (currentByte!6981 lt!249476) (currentBit!6976 lt!249476)))))

(assert (= (and d!53123 res!132378) b!158462))

(assert (= (and b!158462 res!132379) b!158463))

(declare-fun m!248887 () Bool)

(assert (=> d!53123 m!248887))

(declare-fun m!248889 () Bool)

(assert (=> d!53123 m!248889))

(declare-fun m!248891 () Bool)

(assert (=> d!53123 m!248891))

(assert (=> b!158462 m!248891))

(assert (=> b!158462 m!248887))

(declare-fun m!248893 () Bool)

(assert (=> b!158463 m!248893))

(assert (=> b!158463 m!248851))

(assert (=> d!53061 d!53123))

(declare-fun d!53125 () Bool)

(declare-fun e!107700 () Bool)

(assert (=> d!53125 e!107700))

(declare-fun res!132380 () Bool)

(assert (=> d!53125 (=> res!132380 e!107700)))

(assert (=> d!53125 (= res!132380 (bvsge from!240 to!236))))

(declare-fun lt!250216 () Bool)

(declare-fun e!107702 () Bool)

(assert (=> d!53125 (= lt!250216 e!107702)))

(declare-fun res!132381 () Bool)

(assert (=> d!53125 (=> (not res!132381) (not e!107702))))

(declare-fun lt!250221 () (_ BitVec 64))

(declare-fun lt!250235 () tuple3!694)

(declare-fun lt!250217 () (_ BitVec 64))

(assert (=> d!53125 (= res!132381 (= (bvadd lt!250221 lt!250217) (bitIndex!0 (size!3342 (buf!3802 (_2!7691 lt!250235))) (currentByte!6981 (_2!7691 lt!250235)) (currentBit!6976 (_2!7691 lt!250235)))))))

(assert (=> d!53125 (or (not (= (bvand lt!250221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!250217 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!250221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!250221 lt!250217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!250207 () (_ BitVec 64))

(assert (=> d!53125 (= lt!250217 (bvmul lt!250207 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!53125 (or (= lt!250207 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!250207 #b0000000000000000000000000000000000000000000000000000000000001000) lt!250207)))))

(assert (=> d!53125 (= lt!250207 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!53125 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!53125 (= lt!250221 (bitIndex!0 (size!3342 (buf!3802 bs!65)) (currentByte!6981 bs!65) (currentBit!6976 bs!65)))))

(declare-fun e!107701 () tuple3!694)

(assert (=> d!53125 (= lt!250235 e!107701)))

(declare-fun c!8417 () Bool)

(assert (=> d!53125 (= c!8417 (bvslt from!240 to!236))))

(assert (=> d!53125 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3342 arr!153)))))

(assert (=> d!53125 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!250235)))

(declare-fun call!2687 () Bool)

(declare-fun lt!250222 () array!7364)

(declare-fun lt!250211 () array!7364)

(declare-fun lt!250233 () (_ BitVec 32))

(declare-fun lt!250234 () (_ BitVec 32))

(declare-fun lt!250230 () tuple3!694)

(declare-fun bm!2682 () Bool)

(assert (=> bm!2682 (= call!2687 (arrayRangesEq!446 (ite c!8417 arr!153 lt!250211) (ite c!8417 (_3!464 lt!250230) lt!250222) (ite c!8417 #b00000000000000000000000000000000 lt!250233) (ite c!8417 from!240 lt!250234)))))

(declare-fun b!158464 () Bool)

(assert (=> b!158464 (= e!107700 (= (select (arr!4251 (_3!464 lt!250235)) from!240) (_2!7680 (readBytePure!0 bs!65))))))

(assert (=> b!158464 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3342 (_3!464 lt!250235))))))

(declare-fun call!2686 () (_ BitVec 64))

(declare-fun bm!2683 () Bool)

(assert (=> bm!2683 (= call!2686 (bitIndex!0 (ite c!8417 (size!3342 (buf!3802 (_2!7691 lt!250230))) (size!3342 (buf!3802 bs!65))) (ite c!8417 (currentByte!6981 (_2!7691 lt!250230)) (currentByte!6981 bs!65)) (ite c!8417 (currentBit!6976 (_2!7691 lt!250230)) (currentBit!6976 bs!65))))))

(declare-fun lt!250236 () Unit!10582)

(declare-fun b!158465 () Bool)

(assert (=> b!158465 (= e!107701 (tuple3!695 lt!250236 bs!65 arr!153))))

(assert (=> b!158465 (= call!2686 call!2686)))

(declare-fun lt!250231 () Unit!10582)

(declare-fun Unit!10671 () Unit!10582)

(assert (=> b!158465 (= lt!250231 Unit!10671)))

(declare-fun lt!250205 () Unit!10582)

(assert (=> b!158465 (= lt!250205 (arrayRangesEqReflexiveLemma!55 arr!153))))

(declare-fun call!2685 () Bool)

(assert (=> b!158465 call!2685))

(declare-fun lt!250214 () Unit!10582)

(assert (=> b!158465 (= lt!250214 lt!250205)))

(assert (=> b!158465 (= lt!250211 arr!153)))

(assert (=> b!158465 (= lt!250222 arr!153)))

(declare-fun lt!250218 () (_ BitVec 32))

(assert (=> b!158465 (= lt!250218 #b00000000000000000000000000000000)))

(declare-fun lt!250229 () (_ BitVec 32))

(assert (=> b!158465 (= lt!250229 (size!3342 arr!153))))

(assert (=> b!158465 (= lt!250233 #b00000000000000000000000000000000)))

(assert (=> b!158465 (= lt!250234 from!240)))

(assert (=> b!158465 (= lt!250236 (arrayRangesEqSlicedLemma!55 lt!250211 lt!250222 lt!250218 lt!250229 lt!250233 lt!250234))))

(assert (=> b!158465 call!2687))

(declare-fun b!158466 () Bool)

(declare-fun res!132382 () Bool)

(assert (=> b!158466 (=> (not res!132382) (not e!107702))))

(assert (=> b!158466 (= res!132382 (and (= (buf!3802 bs!65) (buf!3802 (_2!7691 lt!250235))) (= (size!3342 arr!153) (size!3342 (_3!464 lt!250235)))))))

(declare-fun bm!2684 () Bool)

(declare-fun lt!250206 () tuple2!14452)

(assert (=> bm!2684 (= call!2685 (arrayRangesEq!446 arr!153 (ite c!8417 (array!7365 (store (arr!4251 arr!153) from!240 (_1!7690 lt!250206)) (size!3342 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8417 from!240 (size!3342 arr!153))))))

(declare-fun b!158467 () Bool)

(declare-fun lt!250215 () Unit!10582)

(assert (=> b!158467 (= e!107701 (tuple3!695 lt!250215 (_2!7691 lt!250230) (_3!464 lt!250230)))))

(assert (=> b!158467 (= lt!250206 (readByte!0 bs!65))))

(declare-fun lt!250203 () array!7364)

(assert (=> b!158467 (= lt!250203 (array!7365 (store (arr!4251 arr!153) from!240 (_1!7690 lt!250206)) (size!3342 arr!153)))))

(declare-fun lt!250225 () (_ BitVec 64))

(assert (=> b!158467 (= lt!250225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!250213 () (_ BitVec 32))

(assert (=> b!158467 (= lt!250213 (bvsub to!236 from!240))))

(declare-fun lt!250226 () Unit!10582)

(assert (=> b!158467 (= lt!250226 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7690 lt!250206) lt!250225 lt!250213))))

(assert (=> b!158467 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3342 (buf!3802 (_2!7690 lt!250206)))) ((_ sign_extend 32) (currentByte!6981 (_2!7690 lt!250206))) ((_ sign_extend 32) (currentBit!6976 (_2!7690 lt!250206))) (bvsub lt!250213 ((_ extract 31 0) (bvsdiv (bvadd lt!250225 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!250202 () Unit!10582)

(assert (=> b!158467 (= lt!250202 lt!250226)))

(assert (=> b!158467 (= lt!250230 (readByteArrayLoop!0 (_2!7690 lt!250206) lt!250203 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!158467 (= (bitIndex!0 (size!3342 (buf!3802 (_2!7690 lt!250206))) (currentByte!6981 (_2!7690 lt!250206)) (currentBit!6976 (_2!7690 lt!250206))) (bvadd (bitIndex!0 (size!3342 (buf!3802 bs!65)) (currentByte!6981 bs!65) (currentBit!6976 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!250209 () Unit!10582)

(declare-fun Unit!10672 () Unit!10582)

(assert (=> b!158467 (= lt!250209 Unit!10672)))

(assert (=> b!158467 (= (bvadd (bitIndex!0 (size!3342 (buf!3802 (_2!7690 lt!250206))) (currentByte!6981 (_2!7690 lt!250206)) (currentBit!6976 (_2!7690 lt!250206))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2686)))

(declare-fun lt!250208 () Unit!10582)

(declare-fun Unit!10673 () Unit!10582)

(assert (=> b!158467 (= lt!250208 Unit!10673)))

(assert (=> b!158467 (= (bvadd (bitIndex!0 (size!3342 (buf!3802 bs!65)) (currentByte!6981 bs!65) (currentBit!6976 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2686)))

(declare-fun lt!250228 () Unit!10582)

(declare-fun Unit!10674 () Unit!10582)

(assert (=> b!158467 (= lt!250228 Unit!10674)))

(assert (=> b!158467 (and (= (buf!3802 bs!65) (buf!3802 (_2!7691 lt!250230))) (= (size!3342 arr!153) (size!3342 (_3!464 lt!250230))))))

(declare-fun lt!250201 () Unit!10582)

(declare-fun Unit!10675 () Unit!10582)

(assert (=> b!158467 (= lt!250201 Unit!10675)))

(declare-fun lt!250212 () Unit!10582)

(assert (=> b!158467 (= lt!250212 (arrayUpdatedAtPrefixLemma!55 arr!153 from!240 (_1!7690 lt!250206)))))

(assert (=> b!158467 call!2685))

(declare-fun lt!250227 () Unit!10582)

(assert (=> b!158467 (= lt!250227 lt!250212)))

(declare-fun lt!250223 () (_ BitVec 32))

(assert (=> b!158467 (= lt!250223 #b00000000000000000000000000000000)))

(declare-fun lt!250219 () Unit!10582)

(assert (=> b!158467 (= lt!250219 (arrayRangesEqTransitive!120 arr!153 lt!250203 (_3!464 lt!250230) lt!250223 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158467 (arrayRangesEq!446 arr!153 (_3!464 lt!250230) lt!250223 from!240)))

(declare-fun lt!250232 () Unit!10582)

(assert (=> b!158467 (= lt!250232 lt!250219)))

(assert (=> b!158467 call!2687))

(declare-fun lt!250220 () Unit!10582)

(declare-fun Unit!10676 () Unit!10582)

(assert (=> b!158467 (= lt!250220 Unit!10676)))

(declare-fun lt!250204 () Unit!10582)

(assert (=> b!158467 (= lt!250204 (arrayRangesEqImpliesEq!64 lt!250203 (_3!464 lt!250230) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158467 (= (select (store (arr!4251 arr!153) from!240 (_1!7690 lt!250206)) from!240) (select (arr!4251 (_3!464 lt!250230)) from!240))))

(declare-fun lt!250210 () Unit!10582)

(assert (=> b!158467 (= lt!250210 lt!250204)))

(declare-fun lt!250224 () Bool)

(assert (=> b!158467 (= lt!250224 (= (select (arr!4251 (_3!464 lt!250230)) from!240) (_1!7690 lt!250206)))))

(declare-fun Unit!10677 () Unit!10582)

(assert (=> b!158467 (= lt!250215 Unit!10677)))

(assert (=> b!158467 lt!250224))

(declare-fun b!158468 () Bool)

(assert (=> b!158468 (= e!107702 (arrayRangesEq!446 arr!153 (_3!464 lt!250235) #b00000000000000000000000000000000 from!240))))

(assert (= (and d!53125 c!8417) b!158467))

(assert (= (and d!53125 (not c!8417)) b!158465))

(assert (= (or b!158467 b!158465) bm!2682))

(assert (= (or b!158467 b!158465) bm!2684))

(assert (= (or b!158467 b!158465) bm!2683))

(assert (= (and d!53125 res!132381) b!158466))

(assert (= (and b!158466 res!132382) b!158468))

(assert (= (and d!53125 (not res!132380)) b!158464))

(declare-fun m!248895 () Bool)

(assert (=> b!158468 m!248895))

(declare-fun m!248897 () Bool)

(assert (=> bm!2684 m!248897))

(declare-fun m!248899 () Bool)

(assert (=> bm!2684 m!248899))

(declare-fun m!248901 () Bool)

(assert (=> bm!2682 m!248901))

(declare-fun m!248903 () Bool)

(assert (=> bm!2683 m!248903))

(assert (=> b!158467 m!248773))

(assert (=> b!158467 m!248897))

(declare-fun m!248905 () Bool)

(assert (=> b!158467 m!248905))

(declare-fun m!248907 () Bool)

(assert (=> b!158467 m!248907))

(declare-fun m!248909 () Bool)

(assert (=> b!158467 m!248909))

(declare-fun m!248911 () Bool)

(assert (=> b!158467 m!248911))

(declare-fun m!248913 () Bool)

(assert (=> b!158467 m!248913))

(declare-fun m!248915 () Bool)

(assert (=> b!158467 m!248915))

(declare-fun m!248917 () Bool)

(assert (=> b!158467 m!248917))

(declare-fun m!248919 () Bool)

(assert (=> b!158467 m!248919))

(declare-fun m!248921 () Bool)

(assert (=> b!158467 m!248921))

(declare-fun m!248923 () Bool)

(assert (=> b!158467 m!248923))

(assert (=> b!158467 m!248433))

(declare-fun m!248925 () Bool)

(assert (=> d!53125 m!248925))

(assert (=> d!53125 m!248773))

(declare-fun m!248927 () Bool)

(assert (=> b!158465 m!248927))

(declare-fun m!248929 () Bool)

(assert (=> b!158465 m!248929))

(declare-fun m!248931 () Bool)

(assert (=> b!158464 m!248931))

(assert (=> b!158464 m!248231))

(assert (=> d!53054 d!53125))

(declare-fun d!53127 () Bool)

(declare-fun e!107703 () Bool)

(assert (=> d!53127 e!107703))

(declare-fun res!132383 () Bool)

(assert (=> d!53127 (=> (not res!132383) (not e!107703))))

(assert (=> d!53127 (= res!132383 (moveByteIndexPrecond!0 lt!249476 #b00000000000000000000000000000001))))

(declare-fun Unit!10678 () Unit!10582)

(assert (=> d!53127 (= (moveByteIndex!0 lt!249476 #b00000000000000000000000000000001) (tuple2!14455 Unit!10678 (BitStream!5857 (buf!3802 lt!249476) (bvadd (currentByte!6981 lt!249476) #b00000000000000000000000000000001) (currentBit!6976 lt!249476))))))

(declare-fun b!158469 () Bool)

(assert (=> b!158469 (= e!107703 (and (or (not (= (bvand (currentByte!6981 lt!249476) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6981 lt!249476) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6981 lt!249476) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6981 lt!249476) #b00000000000000000000000000000001) (bvadd (currentByte!6981 lt!249476) #b00000000000000000000000000000001))))))

(assert (= (and d!53127 res!132383) b!158469))

(declare-fun m!248933 () Bool)

(assert (=> d!53127 m!248933))

(assert (=> d!53042 d!53127))

(check-sat (not d!53105) (not bm!2680) (not bm!2676) (not d!53097) (not d!53125) (not b!158434) (not d!53099) (not d!53127) (not b!158461) (not d!53123) (not bm!2683) (not b!158468) (not bm!2677) (not d!53109) (not b!158454) (not b!158453) (not d!53119) (not b!158456) (not bm!2679) (not b!158455) (not b!158451) (not bm!2681) (not bm!2684) (not bm!2678) (not b!158467) (not b!158450) (not b!158465) (not b!158432) (not d!53095) (not d!53111) (not b!158464) (not b!158459) (not b!158436) (not bm!2682) (not b!158463) (not d!53113) (not b!158458))
(check-sat)
