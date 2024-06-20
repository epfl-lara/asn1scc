; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31624 () Bool)

(assert start!31624)

(declare-fun b!158302 () Bool)

(declare-datatypes ((array!7366 0))(
  ( (array!7367 (arr!4254 (Array (_ BitVec 32) (_ BitVec 8))) (size!3345 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5858 0))(
  ( (BitStream!5859 (buf!3803 array!7366) (currentByte!6982 (_ BitVec 32)) (currentBit!6977 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14440 0))(
  ( (tuple2!14441 (_1!7682 BitStream!5858) (_2!7682 array!7366)) )
))
(declare-fun lt!249511 () tuple2!14440)

(declare-fun e!107570 () Bool)

(declare-fun to!236 () (_ BitVec 32))

(declare-fun lt!249509 () tuple2!14440)

(declare-fun arrayRangesEq!447 (array!7366 array!7366 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158302 (= e!107570 (arrayRangesEq!447 (_2!7682 lt!249511) (_2!7682 lt!249509) #b00000000000000000000000000000000 to!236))))

(declare-fun lt!249510 () tuple2!14440)

(assert (=> b!158302 (arrayRangesEq!447 (_2!7682 lt!249509) (_2!7682 lt!249510) #b00000000000000000000000000000000 to!236)))

(declare-datatypes ((Unit!10584 0))(
  ( (Unit!10585) )
))
(declare-fun lt!249517 () Unit!10584)

(declare-fun lt!249518 () BitStream!5858)

(declare-fun lt!249516 () array!7366)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5858 array!7366 (_ BitVec 32) (_ BitVec 32)) Unit!10584)

(assert (=> b!158302 (= lt!249517 (readByteArrayLoopArrayPrefixLemma!0 lt!249518 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun bs!65 () BitStream!5858)

(declare-fun arr!153 () array!7366)

(declare-datatypes ((tuple2!14442 0))(
  ( (tuple2!14443 (_1!7683 BitStream!5858) (_2!7683 (_ BitVec 8))) )
))
(declare-fun lt!249519 () tuple2!14442)

(declare-fun readByteArrayLoopPure!0 (BitStream!5858 array!7366 (_ BitVec 32) (_ BitVec 32)) tuple2!14440)

(declare-fun withMovedByteIndex!0 (BitStream!5858 (_ BitVec 32)) BitStream!5858)

(declare-fun readBytePure!0 (BitStream!5858) tuple2!14442)

(assert (=> b!158302 (= lt!249510 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001) (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!249515 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!158302 (= lt!249515 (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))))))

(declare-fun b!158303 () Bool)

(declare-fun res!132244 () Bool)

(assert (=> b!158303 (=> res!132244 e!107570)))

(declare-fun lt!249512 () (_ BitVec 64))

(declare-fun lt!249513 () (_ BitVec 64))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158303 (= res!132244 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) lt!249512 lt!249513 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!158304 () Bool)

(declare-fun res!132246 () Bool)

(declare-fun e!107569 () Bool)

(assert (=> b!158304 (=> (not res!132246) (not e!107569))))

(assert (=> b!158304 (= res!132246 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 bs!65))) ((_ sign_extend 32) (currentByte!6982 bs!65)) ((_ sign_extend 32) (currentBit!6977 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158305 () Bool)

(declare-fun e!107571 () Bool)

(assert (=> b!158305 (= e!107571 (not e!107570))))

(declare-fun res!132245 () Bool)

(assert (=> b!158305 (=> res!132245 e!107570)))

(assert (=> b!158305 (= res!132245 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!158305 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) lt!249512 lt!249513 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!158305 (= lt!249513 ((_ sign_extend 32) (currentBit!6977 lt!249518)))))

(assert (=> b!158305 (= lt!249512 ((_ sign_extend 32) (currentByte!6982 lt!249518)))))

(declare-fun lt!249514 () Unit!10584)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5858 BitStream!5858 (_ BitVec 64) (_ BitVec 32)) Unit!10584)

(assert (=> b!158305 (= lt!249514 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249518 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!158305 (= lt!249519 (readBytePure!0 lt!249518))))

(declare-fun res!132247 () Bool)

(assert (=> start!31624 (=> (not res!132247) (not e!107569))))

(assert (=> start!31624 (= res!132247 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3345 arr!153))))))

(assert (=> start!31624 e!107569))

(assert (=> start!31624 true))

(declare-fun array_inv!3092 (array!7366) Bool)

(assert (=> start!31624 (array_inv!3092 arr!153)))

(declare-fun e!107566 () Bool)

(declare-fun inv!12 (BitStream!5858) Bool)

(assert (=> start!31624 (and (inv!12 bs!65) e!107566)))

(declare-fun b!158306 () Bool)

(assert (=> b!158306 (= e!107569 e!107571)))

(declare-fun res!132248 () Bool)

(assert (=> b!158306 (=> (not res!132248) (not e!107571))))

(assert (=> b!158306 (= res!132248 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(assert (=> b!158306 (= lt!249509 (readByteArrayLoopPure!0 lt!249518 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!158306 (= lt!249516 (array!7367 (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (size!3345 arr!153)))))

(assert (=> b!158306 (= lt!249518 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(assert (=> b!158306 (= lt!249511 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!158307 () Bool)

(assert (=> b!158307 (= e!107566 (array_inv!3092 (buf!3803 bs!65)))))

(assert (= (and start!31624 res!132247) b!158304))

(assert (= (and b!158304 res!132246) b!158306))

(assert (= (and b!158306 res!132248) b!158305))

(assert (= (and b!158305 (not res!132245)) b!158303))

(assert (= (and b!158303 (not res!132244)) b!158302))

(assert (= start!31624 b!158307))

(declare-fun m!248261 () Bool)

(assert (=> b!158307 m!248261))

(declare-fun m!248263 () Bool)

(assert (=> b!158305 m!248263))

(declare-fun m!248265 () Bool)

(assert (=> b!158305 m!248265))

(declare-fun m!248267 () Bool)

(assert (=> b!158305 m!248267))

(declare-fun m!248269 () Bool)

(assert (=> b!158302 m!248269))

(declare-fun m!248271 () Bool)

(assert (=> b!158302 m!248271))

(declare-fun m!248273 () Bool)

(assert (=> b!158302 m!248273))

(declare-fun m!248275 () Bool)

(assert (=> b!158302 m!248275))

(declare-fun m!248277 () Bool)

(assert (=> b!158302 m!248277))

(declare-fun m!248279 () Bool)

(assert (=> b!158302 m!248279))

(declare-fun m!248281 () Bool)

(assert (=> b!158302 m!248281))

(declare-fun m!248283 () Bool)

(assert (=> b!158302 m!248283))

(assert (=> b!158302 m!248269))

(declare-fun m!248285 () Bool)

(assert (=> b!158303 m!248285))

(declare-fun m!248287 () Bool)

(assert (=> start!31624 m!248287))

(declare-fun m!248289 () Bool)

(assert (=> start!31624 m!248289))

(declare-fun m!248291 () Bool)

(assert (=> b!158306 m!248291))

(assert (=> b!158306 m!248273))

(declare-fun m!248293 () Bool)

(assert (=> b!158306 m!248293))

(assert (=> b!158306 m!248277))

(declare-fun m!248295 () Bool)

(assert (=> b!158306 m!248295))

(declare-fun m!248297 () Bool)

(assert (=> b!158304 m!248297))

(push 1)

(assert (not b!158303))

(assert (not b!158302))

(assert (not b!158306))

(assert (not b!158307))

(assert (not start!31624))

(assert (not b!158304))

(assert (not b!158305))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-datatypes ((tuple3!690 0))(
  ( (tuple3!691 (_1!7684 Unit!10584) (_2!7684 BitStream!5858) (_3!462 array!7366)) )
))
(declare-fun lt!249522 () tuple3!690)

(declare-fun d!52922 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5858 array!7366 (_ BitVec 32) (_ BitVec 32)) tuple3!690)

(assert (=> d!52922 (= lt!249522 (readByteArrayLoop!0 lt!249518 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52922 (= (readByteArrayLoopPure!0 lt!249518 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14441 (_2!7684 lt!249522) (_3!462 lt!249522)))))

(declare-fun bs!13041 () Bool)

(assert (= bs!13041 d!52922))

(declare-fun m!248299 () Bool)

(assert (=> bs!13041 m!248299))

(assert (=> b!158306 d!52922))

(declare-fun d!52924 () Bool)

(declare-datatypes ((tuple2!14444 0))(
  ( (tuple2!14445 (_1!7685 (_ BitVec 8)) (_2!7685 BitStream!5858)) )
))
(declare-fun lt!249525 () tuple2!14444)

(declare-fun readByte!0 (BitStream!5858) tuple2!14444)

(assert (=> d!52924 (= lt!249525 (readByte!0 bs!65))))

(assert (=> d!52924 (= (readBytePure!0 bs!65) (tuple2!14443 (_2!7685 lt!249525) (_1!7685 lt!249525)))))

(declare-fun bs!13042 () Bool)

(assert (= bs!13042 d!52924))

(declare-fun m!248301 () Bool)

(assert (=> bs!13042 m!248301))

(assert (=> b!158306 d!52924))

(declare-fun d!52926 () Bool)

(declare-datatypes ((tuple2!14446 0))(
  ( (tuple2!14447 (_1!7686 Unit!10584) (_2!7686 BitStream!5858)) )
))
(declare-fun moveByteIndex!0 (BitStream!5858 (_ BitVec 32)) tuple2!14446)

(assert (=> d!52926 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7686 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!13043 () Bool)

(assert (= bs!13043 d!52926))

(declare-fun m!248303 () Bool)

(assert (=> bs!13043 m!248303))

(assert (=> b!158306 d!52926))

(declare-fun lt!249526 () tuple3!690)

(declare-fun d!52928 () Bool)

(assert (=> d!52928 (= lt!249526 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52928 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14441 (_2!7684 lt!249526) (_3!462 lt!249526)))))

(declare-fun bs!13044 () Bool)

(assert (= bs!13044 d!52928))

(declare-fun m!248305 () Bool)

(assert (=> bs!13044 m!248305))

(assert (=> b!158306 d!52928))

(declare-fun d!52930 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52930 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) lt!249512 lt!249513 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) lt!249512 lt!249513) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13045 () Bool)

(assert (= bs!13045 d!52930))

(declare-fun m!248307 () Bool)

(assert (=> bs!13045 m!248307))

(assert (=> b!158305 d!52930))

(declare-fun d!52932 () Bool)

(declare-fun e!107574 () Bool)

(assert (=> d!52932 e!107574))

(declare-fun res!132251 () Bool)

(assert (=> d!52932 (=> (not res!132251) (not e!107574))))

(assert (=> d!52932 (= res!132251 (and (or (let ((rhs!3494 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3494 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3494) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!52933 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!52933 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!52933 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3493 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3493 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3493) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!249534 () Unit!10584)

(declare-fun choose!57 (BitStream!5858 BitStream!5858 (_ BitVec 64) (_ BitVec 32)) Unit!10584)

(assert (=> d!52932 (= lt!249534 (choose!57 bs!65 lt!249518 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> d!52932 (= (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249518 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) lt!249534)))

(declare-fun lt!249533 () (_ BitVec 32))

(declare-fun b!158310 () Bool)

(assert (=> b!158310 (= e!107574 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) ((_ sign_extend 32) (currentByte!6982 lt!249518)) ((_ sign_extend 32) (currentBit!6977 lt!249518)) (bvsub (bvsub to!236 from!240) lt!249533)))))

(assert (=> b!158310 (or (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand lt!249533 #b10000000000000000000000000000000)) (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!236 from!240) lt!249533) #b10000000000000000000000000000000)))))

(declare-fun lt!249535 () (_ BitVec 64))

(assert (=> b!158310 (= lt!249533 ((_ extract 31 0) lt!249535))))

(assert (=> b!158310 (and (bvslt lt!249535 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!249535 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!158310 (= lt!249535 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!52932 res!132251) b!158310))

(declare-fun m!248309 () Bool)

(assert (=> d!52932 m!248309))

(declare-fun m!248311 () Bool)

(assert (=> b!158310 m!248311))

(assert (=> b!158305 d!52932))

(declare-fun d!52937 () Bool)

(declare-fun lt!249536 () tuple2!14444)

(assert (=> d!52937 (= lt!249536 (readByte!0 lt!249518))))

(assert (=> d!52937 (= (readBytePure!0 lt!249518) (tuple2!14443 (_2!7685 lt!249536) (_1!7685 lt!249536)))))

(declare-fun bs!13046 () Bool)

(assert (= bs!13046 d!52937))

(declare-fun m!248313 () Bool)

(assert (=> bs!13046 m!248313))

(assert (=> b!158305 d!52937))

(declare-fun d!52939 () Bool)

(assert (=> d!52939 (= (array_inv!3092 arr!153) (bvsge (size!3345 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31624 d!52939))

(declare-fun d!52941 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52941 (= (inv!12 bs!65) (invariant!0 (currentBit!6977 bs!65) (currentByte!6982 bs!65) (size!3345 (buf!3803 bs!65))))))

(declare-fun bs!13047 () Bool)

(assert (= bs!13047 d!52941))

(declare-fun m!248315 () Bool)

(assert (=> bs!13047 m!248315))

(assert (=> start!31624 d!52941))

(declare-fun d!52943 () Bool)

(assert (=> d!52943 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 bs!65))) ((_ sign_extend 32) (currentByte!6982 bs!65)) ((_ sign_extend 32) (currentBit!6977 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3345 (buf!3803 bs!65))) ((_ sign_extend 32) (currentByte!6982 bs!65)) ((_ sign_extend 32) (currentBit!6977 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13048 () Bool)

(assert (= bs!13048 d!52943))

(declare-fun m!248317 () Bool)

(assert (=> bs!13048 m!248317))

(assert (=> b!158304 d!52943))

(declare-fun d!52945 () Bool)

(assert (=> d!52945 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) lt!249512 lt!249513 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) lt!249512 lt!249513) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13049 () Bool)

(assert (= bs!13049 d!52945))

(assert (=> bs!13049 m!248307))

(assert (=> b!158303 d!52945))

(assert (=> b!158302 d!52924))

(declare-fun d!52947 () Bool)

(declare-fun lt!249537 () tuple3!690)

(assert (=> d!52947 (= lt!249537 (readByteArrayLoop!0 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001) (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52947 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001) (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) (tuple2!14441 (_2!7684 lt!249537) (_3!462 lt!249537)))))

(declare-fun bs!13050 () Bool)

(assert (= bs!13050 d!52947))

(assert (=> bs!13050 m!248269))

(declare-fun m!248319 () Bool)

(assert (=> bs!13050 m!248319))

(assert (=> b!158302 d!52947))

(declare-fun d!52949 () Bool)

(declare-fun res!132256 () Bool)

(declare-fun e!107579 () Bool)

(assert (=> d!52949 (=> res!132256 e!107579)))

(assert (=> d!52949 (= res!132256 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52949 (= (arrayRangesEq!447 (_2!7682 lt!249511) (_2!7682 lt!249509) #b00000000000000000000000000000000 to!236) e!107579)))

(declare-fun b!158315 () Bool)

(declare-fun e!107580 () Bool)

(assert (=> b!158315 (= e!107579 e!107580)))

(declare-fun res!132257 () Bool)

(assert (=> b!158315 (=> (not res!132257) (not e!107580))))

(assert (=> b!158315 (= res!132257 (= (select (arr!4254 (_2!7682 lt!249511)) #b00000000000000000000000000000000) (select (arr!4254 (_2!7682 lt!249509)) #b00000000000000000000000000000000)))))

(declare-fun b!158316 () Bool)

(assert (=> b!158316 (= e!107580 (arrayRangesEq!447 (_2!7682 lt!249511) (_2!7682 lt!249509) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52949 (not res!132256)) b!158315))

(assert (= (and b!158315 res!132257) b!158316))

(declare-fun m!248323 () Bool)

(assert (=> b!158315 m!248323))

(declare-fun m!248325 () Bool)

(assert (=> b!158315 m!248325))

(declare-fun m!248327 () Bool)

(assert (=> b!158316 m!248327))

(assert (=> b!158302 d!52949))

(declare-fun d!52953 () Bool)

(declare-fun res!132258 () Bool)

(declare-fun e!107581 () Bool)

(assert (=> d!52953 (=> res!132258 e!107581)))

(assert (=> d!52953 (= res!132258 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52953 (= (arrayRangesEq!447 (_2!7682 lt!249509) (_2!7682 lt!249510) #b00000000000000000000000000000000 to!236) e!107581)))

(declare-fun b!158317 () Bool)

(declare-fun e!107582 () Bool)

(assert (=> b!158317 (= e!107581 e!107582)))

(declare-fun res!132259 () Bool)

(assert (=> b!158317 (=> (not res!132259) (not e!107582))))

(assert (=> b!158317 (= res!132259 (= (select (arr!4254 (_2!7682 lt!249509)) #b00000000000000000000000000000000) (select (arr!4254 (_2!7682 lt!249510)) #b00000000000000000000000000000000)))))

(declare-fun b!158318 () Bool)

(assert (=> b!158318 (= e!107582 (arrayRangesEq!447 (_2!7682 lt!249509) (_2!7682 lt!249510) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52953 (not res!132258)) b!158317))

(assert (= (and b!158317 res!132259) b!158318))

(assert (=> b!158317 m!248325))

(declare-fun m!248329 () Bool)

(assert (=> b!158317 m!248329))

(declare-fun m!248331 () Bool)

(assert (=> b!158318 m!248331))

(assert (=> b!158302 d!52953))

(declare-fun d!52955 () Bool)

(assert (=> d!52955 (= (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001) (_2!7686 (moveByteIndex!0 lt!249518 #b00000000000000000000000000000001)))))

(declare-fun bs!13052 () Bool)

(assert (= bs!13052 d!52955))

(declare-fun m!248333 () Bool)

(assert (=> bs!13052 m!248333))

(assert (=> b!158302 d!52955))

(declare-fun d!52957 () Bool)

(declare-fun lt!249553 () tuple2!14440)

(declare-fun lt!249555 () tuple2!14440)

(assert (=> d!52957 (arrayRangesEq!447 (_2!7682 lt!249553) (_2!7682 lt!249555) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!249556 () Unit!10584)

(declare-fun lt!249554 () BitStream!5858)

(declare-fun choose!35 (BitStream!5858 array!7366 (_ BitVec 32) (_ BitVec 32) tuple2!14440 array!7366 BitStream!5858 tuple2!14440 array!7366) Unit!10584)

(assert (=> d!52957 (= lt!249556 (choose!35 lt!249518 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!249553 (_2!7682 lt!249553) lt!249554 lt!249555 (_2!7682 lt!249555)))))

(assert (=> d!52957 (= lt!249555 (readByteArrayLoopPure!0 lt!249554 (array!7367 (store (arr!4254 lt!249516) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 (readBytePure!0 lt!249518))) (size!3345 lt!249516)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52957 (= lt!249554 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001))))

(assert (=> d!52957 (= lt!249553 (readByteArrayLoopPure!0 lt!249518 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52957 (= (readByteArrayLoopArrayPrefixLemma!0 lt!249518 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!249556)))

(declare-fun bs!13061 () Bool)

(assert (= bs!13061 d!52957))

(assert (=> bs!13061 m!248291))

(declare-fun m!248347 () Bool)

(assert (=> bs!13061 m!248347))

(declare-fun m!248349 () Bool)

(assert (=> bs!13061 m!248349))

(assert (=> bs!13061 m!248267))

(assert (=> bs!13061 m!248269))

(declare-fun m!248351 () Bool)

(assert (=> bs!13061 m!248351))

(declare-fun m!248353 () Bool)

(assert (=> bs!13061 m!248353))

(assert (=> b!158302 d!52957))

(declare-fun d!52978 () Bool)

(assert (=> d!52978 (= (array_inv!3092 (buf!3803 bs!65)) (bvsge (size!3345 (buf!3803 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!158307 d!52978))

(push 1)

(assert (not d!52932))

(assert (not d!52955))

(assert (not d!52928))

(assert (not d!52941))

(assert (not d!52937))

(assert (not d!52930))

(assert (not d!52943))

(assert (not b!158318))

(assert (not d!52922))

(assert (not d!52945))

(assert (not b!158316))

(assert (not d!52947))

(assert (not d!52924))

(assert (not d!52926))

(assert (not b!158310))

(assert (not d!52957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52992 () Bool)

(assert (=> d!52992 (= (remainingBits!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) lt!249512 lt!249513) (bvsub (bvmul ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul lt!249512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249513)))))

(assert (=> d!52930 d!52992))

(declare-fun d!52994 () Bool)

(declare-fun res!132271 () Bool)

(declare-fun e!107594 () Bool)

(assert (=> d!52994 (=> res!132271 e!107594)))

(assert (=> d!52994 (= res!132271 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52994 (= (arrayRangesEq!447 (_2!7682 lt!249553) (_2!7682 lt!249555) #b00000000000000000000000000000000 to!236) e!107594)))

(declare-fun b!158330 () Bool)

(declare-fun e!107595 () Bool)

(assert (=> b!158330 (= e!107594 e!107595)))

(declare-fun res!132272 () Bool)

(assert (=> b!158330 (=> (not res!132272) (not e!107595))))

(assert (=> b!158330 (= res!132272 (= (select (arr!4254 (_2!7682 lt!249553)) #b00000000000000000000000000000000) (select (arr!4254 (_2!7682 lt!249555)) #b00000000000000000000000000000000)))))

(declare-fun b!158331 () Bool)

(assert (=> b!158331 (= e!107595 (arrayRangesEq!447 (_2!7682 lt!249553) (_2!7682 lt!249555) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52994 (not res!132271)) b!158330))

(assert (= (and b!158330 res!132272) b!158331))

(declare-fun m!248383 () Bool)

(assert (=> b!158330 m!248383))

(declare-fun m!248385 () Bool)

(assert (=> b!158330 m!248385))

(declare-fun m!248387 () Bool)

(assert (=> b!158331 m!248387))

(assert (=> d!52957 d!52994))

(assert (=> d!52957 d!52922))

(declare-fun d!52996 () Bool)

(assert (=> d!52996 (arrayRangesEq!447 (_2!7682 (readByteArrayLoopPure!0 lt!249518 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) to!236)) (_2!7682 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001) (array!7367 (store (arr!4254 lt!249516) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 (readBytePure!0 lt!249518))) (size!3345 lt!249516)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236)) #b00000000000000000000000000000000 to!236)))

(assert (=> d!52996 true))

(declare-fun _$13!97 () Unit!10584)

(assert (=> d!52996 (= (choose!35 lt!249518 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!249553 (_2!7682 lt!249553) lt!249554 lt!249555 (_2!7682 lt!249555)) _$13!97)))

(declare-fun bs!13068 () Bool)

(assert (= bs!13068 d!52996))

(assert (=> bs!13068 m!248291))

(assert (=> bs!13068 m!248269))

(declare-fun m!248389 () Bool)

(assert (=> bs!13068 m!248389))

(assert (=> bs!13068 m!248349))

(assert (=> bs!13068 m!248269))

(declare-fun m!248391 () Bool)

(assert (=> bs!13068 m!248391))

(assert (=> bs!13068 m!248267))

(assert (=> d!52957 d!52996))

(assert (=> d!52957 d!52937))

(declare-fun d!52998 () Bool)

(declare-fun lt!249580 () tuple3!690)

(assert (=> d!52998 (= lt!249580 (readByteArrayLoop!0 lt!249554 (array!7367 (store (arr!4254 lt!249516) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 (readBytePure!0 lt!249518))) (size!3345 lt!249516)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52998 (= (readByteArrayLoopPure!0 lt!249554 (array!7367 (store (arr!4254 lt!249516) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 (readBytePure!0 lt!249518))) (size!3345 lt!249516)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236) (tuple2!14441 (_2!7684 lt!249580) (_3!462 lt!249580)))))

(declare-fun bs!13069 () Bool)

(assert (= bs!13069 d!52998))

(declare-fun m!248393 () Bool)

(assert (=> bs!13069 m!248393))

(assert (=> d!52957 d!52998))

(assert (=> d!52957 d!52955))

(declare-fun d!53000 () Bool)

(assert (=> d!53000 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) ((_ sign_extend 32) (currentByte!6982 lt!249518)) ((_ sign_extend 32) (currentBit!6977 lt!249518)) (bvsub (bvsub to!236 from!240) lt!249533)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) lt!249533)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) ((_ sign_extend 32) (currentByte!6982 lt!249518)) ((_ sign_extend 32) (currentBit!6977 lt!249518))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13070 () Bool)

(assert (= bs!13070 d!53000))

(declare-fun m!248395 () Bool)

(assert (=> bs!13070 m!248395))

(assert (=> b!158310 d!53000))

(declare-fun lt!249740 () tuple3!690)

(declare-fun e!107628 () Bool)

(declare-fun b!158368 () Bool)

(assert (=> b!158368 (= e!107628 (arrayRangesEq!447 lt!249516 (_3!462 lt!249740) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!158369 () Bool)

(declare-fun lt!249709 () Unit!10584)

(declare-fun e!107629 () tuple3!690)

(assert (=> b!158369 (= e!107629 (tuple3!691 lt!249709 lt!249518 lt!249516))))

(declare-fun call!2651 () (_ BitVec 64))

(assert (=> b!158369 (= call!2651 call!2651)))

(declare-fun lt!249726 () Unit!10584)

(declare-fun Unit!10586 () Unit!10584)

(assert (=> b!158369 (= lt!249726 Unit!10586)))

(declare-fun lt!249720 () Unit!10584)

(declare-fun arrayRangesEqReflexiveLemma!53 (array!7366) Unit!10584)

(assert (=> b!158369 (= lt!249720 (arrayRangesEqReflexiveLemma!53 lt!249516))))

(declare-fun call!2649 () Bool)

(assert (=> b!158369 call!2649))

(declare-fun lt!249729 () Unit!10584)

(assert (=> b!158369 (= lt!249729 lt!249720)))

(declare-fun lt!249722 () array!7366)

(assert (=> b!158369 (= lt!249722 lt!249516)))

(declare-fun lt!249724 () array!7366)

(assert (=> b!158369 (= lt!249724 lt!249516)))

(declare-fun lt!249730 () (_ BitVec 32))

(assert (=> b!158369 (= lt!249730 #b00000000000000000000000000000000)))

(declare-fun lt!249728 () (_ BitVec 32))

(assert (=> b!158369 (= lt!249728 (size!3345 lt!249516))))

(declare-fun lt!249735 () (_ BitVec 32))

(assert (=> b!158369 (= lt!249735 #b00000000000000000000000000000000)))

(declare-fun lt!249710 () (_ BitVec 32))

(assert (=> b!158369 (= lt!249710 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!53 (array!7366 array!7366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10584)

(assert (=> b!158369 (= lt!249709 (arrayRangesEqSlicedLemma!53 lt!249722 lt!249724 lt!249730 lt!249728 lt!249735 lt!249710))))

(declare-fun call!2650 () Bool)

(assert (=> b!158369 call!2650))

(declare-fun b!158370 () Bool)

(declare-fun lt!249733 () Unit!10584)

(declare-fun lt!249711 () tuple3!690)

(assert (=> b!158370 (= e!107629 (tuple3!691 lt!249733 (_2!7684 lt!249711) (_3!462 lt!249711)))))

(declare-fun lt!249713 () tuple2!14444)

(assert (=> b!158370 (= lt!249713 (readByte!0 lt!249518))))

(declare-fun lt!249725 () array!7366)

(assert (=> b!158370 (= lt!249725 (array!7367 (store (arr!4254 lt!249516) (bvadd #b00000000000000000000000000000001 from!240) (_1!7685 lt!249713)) (size!3345 lt!249516)))))

(declare-fun lt!249718 () (_ BitVec 64))

(assert (=> b!158370 (= lt!249718 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!249737 () (_ BitVec 32))

(assert (=> b!158370 (= lt!249737 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!249708 () Unit!10584)

(assert (=> b!158370 (= lt!249708 (validateOffsetBytesFromBitIndexLemma!0 lt!249518 (_2!7685 lt!249713) lt!249718 lt!249737))))

(assert (=> b!158370 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 (_2!7685 lt!249713)))) ((_ sign_extend 32) (currentByte!6982 (_2!7685 lt!249713))) ((_ sign_extend 32) (currentBit!6977 (_2!7685 lt!249713))) (bvsub lt!249737 ((_ extract 31 0) (bvsdiv (bvadd lt!249718 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!249731 () Unit!10584)

(assert (=> b!158370 (= lt!249731 lt!249708)))

(assert (=> b!158370 (= lt!249711 (readByteArrayLoop!0 (_2!7685 lt!249713) lt!249725 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!158370 (= (bitIndex!0 (size!3345 (buf!3803 (_2!7685 lt!249713))) (currentByte!6982 (_2!7685 lt!249713)) (currentBit!6977 (_2!7685 lt!249713))) (bvadd call!2651 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!249723 () Unit!10584)

(declare-fun Unit!10587 () Unit!10584)

(assert (=> b!158370 (= lt!249723 Unit!10587)))

(assert (=> b!158370 (= (bvadd (bitIndex!0 (size!3345 (buf!3803 (_2!7685 lt!249713))) (currentByte!6982 (_2!7685 lt!249713)) (currentBit!6977 (_2!7685 lt!249713))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3345 (buf!3803 (_2!7684 lt!249711))) (currentByte!6982 (_2!7684 lt!249711)) (currentBit!6977 (_2!7684 lt!249711))))))

(declare-fun lt!249727 () Unit!10584)

(declare-fun Unit!10588 () Unit!10584)

(assert (=> b!158370 (= lt!249727 Unit!10588)))

(assert (=> b!158370 (= (bvadd call!2651 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3345 (buf!3803 (_2!7684 lt!249711))) (currentByte!6982 (_2!7684 lt!249711)) (currentBit!6977 (_2!7684 lt!249711))))))

(declare-fun lt!249714 () Unit!10584)

(declare-fun Unit!10589 () Unit!10584)

(assert (=> b!158370 (= lt!249714 Unit!10589)))

(assert (=> b!158370 (and (= (buf!3803 lt!249518) (buf!3803 (_2!7684 lt!249711))) (= (size!3345 lt!249516) (size!3345 (_3!462 lt!249711))))))

(declare-fun lt!249732 () Unit!10584)

(declare-fun Unit!10590 () Unit!10584)

(assert (=> b!158370 (= lt!249732 Unit!10590)))

(declare-fun lt!249716 () Unit!10584)

(declare-fun arrayUpdatedAtPrefixLemma!53 (array!7366 (_ BitVec 32) (_ BitVec 8)) Unit!10584)

(assert (=> b!158370 (= lt!249716 (arrayUpdatedAtPrefixLemma!53 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) (_1!7685 lt!249713)))))

(assert (=> b!158370 call!2649))

(declare-fun lt!249705 () Unit!10584)

(assert (=> b!158370 (= lt!249705 lt!249716)))

(declare-fun lt!249719 () (_ BitVec 32))

(assert (=> b!158370 (= lt!249719 #b00000000000000000000000000000000)))

(declare-fun lt!249738 () Unit!10584)

(declare-fun arrayRangesEqTransitive!118 (array!7366 array!7366 array!7366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10584)

(assert (=> b!158370 (= lt!249738 (arrayRangesEqTransitive!118 lt!249516 lt!249725 (_3!462 lt!249711) lt!249719 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158370 call!2650))

(declare-fun lt!249736 () Unit!10584)

(assert (=> b!158370 (= lt!249736 lt!249738)))

(assert (=> b!158370 (arrayRangesEq!447 lt!249516 (_3!462 lt!249711) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!249717 () Unit!10584)

(declare-fun Unit!10591 () Unit!10584)

(assert (=> b!158370 (= lt!249717 Unit!10591)))

(declare-fun lt!249721 () Unit!10584)

(declare-fun arrayRangesEqImpliesEq!62 (array!7366 array!7366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10584)

(assert (=> b!158370 (= lt!249721 (arrayRangesEqImpliesEq!62 lt!249725 (_3!462 lt!249711) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158370 (= (select (store (arr!4254 lt!249516) (bvadd #b00000000000000000000000000000001 from!240) (_1!7685 lt!249713)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4254 (_3!462 lt!249711)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!249706 () Unit!10584)

(assert (=> b!158370 (= lt!249706 lt!249721)))

(declare-fun lt!249712 () Bool)

(assert (=> b!158370 (= lt!249712 (= (select (arr!4254 (_3!462 lt!249711)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7685 lt!249713)))))

(declare-fun Unit!10592 () Unit!10584)

(assert (=> b!158370 (= lt!249733 Unit!10592)))

(assert (=> b!158370 lt!249712))

(declare-fun e!107630 () Bool)

(declare-fun b!158371 () Bool)

(assert (=> b!158371 (= e!107630 (= (select (arr!4254 (_3!462 lt!249740)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7683 (readBytePure!0 lt!249518))))))

(assert (=> b!158371 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3345 (_3!462 lt!249740))))))

(declare-fun bm!2646 () Bool)

(assert (=> bm!2646 (= call!2651 (bitIndex!0 (size!3345 (buf!3803 lt!249518)) (currentByte!6982 lt!249518) (currentBit!6977 lt!249518)))))

(declare-fun d!53002 () Bool)

(assert (=> d!53002 e!107630))

(declare-fun res!132308 () Bool)

(assert (=> d!53002 (=> res!132308 e!107630)))

(assert (=> d!53002 (= res!132308 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!249739 () Bool)

(assert (=> d!53002 (= lt!249739 e!107628)))

(declare-fun res!132307 () Bool)

(assert (=> d!53002 (=> (not res!132307) (not e!107628))))

(declare-fun lt!249707 () (_ BitVec 64))

(declare-fun lt!249715 () (_ BitVec 64))

(assert (=> d!53002 (= res!132307 (= (bvadd lt!249707 lt!249715) (bitIndex!0 (size!3345 (buf!3803 (_2!7684 lt!249740))) (currentByte!6982 (_2!7684 lt!249740)) (currentBit!6977 (_2!7684 lt!249740)))))))

(assert (=> d!53002 (or (not (= (bvand lt!249707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249715 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249707 lt!249715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!249734 () (_ BitVec 64))

(assert (=> d!53002 (= lt!249715 (bvmul lt!249734 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!53002 (or (= lt!249734 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!249734 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249734)))))

(assert (=> d!53002 (= lt!249734 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!53002 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!53002 (= lt!249707 (bitIndex!0 (size!3345 (buf!3803 lt!249518)) (currentByte!6982 lt!249518) (currentBit!6977 lt!249518)))))

(assert (=> d!53002 (= lt!249740 e!107629)))

(declare-fun c!8405 () Bool)

(assert (=> d!53002 (= c!8405 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!53002 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3345 lt!249516)))))

(assert (=> d!53002 (= (readByteArrayLoop!0 lt!249518 lt!249516 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!249740)))

(declare-fun bm!2647 () Bool)

(assert (=> bm!2647 (= call!2650 (arrayRangesEq!447 (ite c!8405 lt!249516 lt!249722) (ite c!8405 (_3!462 lt!249711) lt!249724) (ite c!8405 lt!249719 lt!249735) (ite c!8405 (bvadd #b00000000000000000000000000000001 from!240) lt!249710)))))

(declare-fun b!158372 () Bool)

(declare-fun res!132306 () Bool)

(assert (=> b!158372 (=> (not res!132306) (not e!107628))))

(assert (=> b!158372 (= res!132306 (and (= (buf!3803 lt!249518) (buf!3803 (_2!7684 lt!249740))) (= (size!3345 lt!249516) (size!3345 (_3!462 lt!249740)))))))

(declare-fun bm!2648 () Bool)

(assert (=> bm!2648 (= call!2649 (arrayRangesEq!447 lt!249516 (ite c!8405 (array!7367 (store (arr!4254 lt!249516) (bvadd #b00000000000000000000000000000001 from!240) (_1!7685 lt!249713)) (size!3345 lt!249516)) lt!249516) #b00000000000000000000000000000000 (ite c!8405 (bvadd #b00000000000000000000000000000001 from!240) (size!3345 lt!249516))))))

(assert (= (and d!53002 c!8405) b!158370))

(assert (= (and d!53002 (not c!8405)) b!158369))

(assert (= (or b!158370 b!158369) bm!2647))

(assert (= (or b!158370 b!158369) bm!2648))

(assert (= (or b!158370 b!158369) bm!2646))

(assert (= (and d!53002 res!132307) b!158372))

(assert (= (and b!158372 res!132306) b!158368))

(assert (= (and d!53002 (not res!132308)) b!158371))

(declare-fun m!248477 () Bool)

(assert (=> b!158368 m!248477))

(declare-fun m!248479 () Bool)

(assert (=> b!158371 m!248479))

(assert (=> b!158371 m!248267))

(declare-fun m!248481 () Bool)

(assert (=> b!158370 m!248481))

(declare-fun m!248483 () Bool)

(assert (=> b!158370 m!248483))

(declare-fun m!248485 () Bool)

(assert (=> b!158370 m!248485))

(declare-fun m!248487 () Bool)

(assert (=> b!158370 m!248487))

(declare-fun m!248489 () Bool)

(assert (=> b!158370 m!248489))

(declare-fun m!248491 () Bool)

(assert (=> b!158370 m!248491))

(declare-fun m!248493 () Bool)

(assert (=> b!158370 m!248493))

(declare-fun m!248495 () Bool)

(assert (=> b!158370 m!248495))

(declare-fun m!248497 () Bool)

(assert (=> b!158370 m!248497))

(assert (=> b!158370 m!248313))

(declare-fun m!248499 () Bool)

(assert (=> b!158370 m!248499))

(declare-fun m!248501 () Bool)

(assert (=> b!158370 m!248501))

(declare-fun m!248503 () Bool)

(assert (=> b!158370 m!248503))

(declare-fun m!248505 () Bool)

(assert (=> bm!2647 m!248505))

(assert (=> bm!2648 m!248503))

(declare-fun m!248507 () Bool)

(assert (=> bm!2648 m!248507))

(declare-fun m!248509 () Bool)

(assert (=> d!53002 m!248509))

(declare-fun m!248511 () Bool)

(assert (=> d!53002 m!248511))

(assert (=> bm!2646 m!248511))

(declare-fun m!248513 () Bool)

(assert (=> b!158369 m!248513))

(declare-fun m!248515 () Bool)

(assert (=> b!158369 m!248515))

(assert (=> d!52922 d!53002))

(declare-fun d!53065 () Bool)

(declare-fun res!132309 () Bool)

(declare-fun e!107631 () Bool)

(assert (=> d!53065 (=> res!132309 e!107631)))

(assert (=> d!53065 (= res!132309 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!53065 (= (arrayRangesEq!447 (_2!7682 lt!249511) (_2!7682 lt!249509) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!107631)))

(declare-fun b!158373 () Bool)

(declare-fun e!107632 () Bool)

(assert (=> b!158373 (= e!107631 e!107632)))

(declare-fun res!132310 () Bool)

(assert (=> b!158373 (=> (not res!132310) (not e!107632))))

(assert (=> b!158373 (= res!132310 (= (select (arr!4254 (_2!7682 lt!249511)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4254 (_2!7682 lt!249509)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!158374 () Bool)

(assert (=> b!158374 (= e!107632 (arrayRangesEq!447 (_2!7682 lt!249511) (_2!7682 lt!249509) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!53065 (not res!132309)) b!158373))

(assert (= (and b!158373 res!132310) b!158374))

(declare-fun m!248517 () Bool)

(assert (=> b!158373 m!248517))

(declare-fun m!248519 () Bool)

(assert (=> b!158373 m!248519))

(declare-fun m!248521 () Bool)

(assert (=> b!158374 m!248521))

(assert (=> b!158316 d!53065))

(declare-fun lt!249776 () tuple3!690)

(declare-fun e!107633 () Bool)

(declare-fun b!158375 () Bool)

(assert (=> b!158375 (= e!107633 (arrayRangesEq!447 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)) (_3!462 lt!249776) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun e!107634 () tuple3!690)

(declare-fun lt!249745 () Unit!10584)

(declare-fun b!158376 () Bool)

(assert (=> b!158376 (= e!107634 (tuple3!691 lt!249745 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001) (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153))))))

(declare-fun call!2654 () (_ BitVec 64))

(assert (=> b!158376 (= call!2654 call!2654)))

(declare-fun lt!249762 () Unit!10584)

(declare-fun Unit!10598 () Unit!10584)

(assert (=> b!158376 (= lt!249762 Unit!10598)))

(declare-fun lt!249756 () Unit!10584)

(assert (=> b!158376 (= lt!249756 (arrayRangesEqReflexiveLemma!53 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153))))))

(declare-fun call!2652 () Bool)

(assert (=> b!158376 call!2652))

(declare-fun lt!249765 () Unit!10584)

(assert (=> b!158376 (= lt!249765 lt!249756)))

(declare-fun lt!249758 () array!7366)

(assert (=> b!158376 (= lt!249758 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)))))

(declare-fun lt!249760 () array!7366)

(assert (=> b!158376 (= lt!249760 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)))))

(declare-fun lt!249766 () (_ BitVec 32))

(assert (=> b!158376 (= lt!249766 #b00000000000000000000000000000000)))

(declare-fun lt!249764 () (_ BitVec 32))

(assert (=> b!158376 (= lt!249764 (size!3345 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153))))))

(declare-fun lt!249771 () (_ BitVec 32))

(assert (=> b!158376 (= lt!249771 #b00000000000000000000000000000000)))

(declare-fun lt!249746 () (_ BitVec 32))

(assert (=> b!158376 (= lt!249746 (bvadd #b00000000000000000000000000000010 from!240))))

(assert (=> b!158376 (= lt!249745 (arrayRangesEqSlicedLemma!53 lt!249758 lt!249760 lt!249766 lt!249764 lt!249771 lt!249746))))

(declare-fun call!2653 () Bool)

(assert (=> b!158376 call!2653))

(declare-fun b!158377 () Bool)

(declare-fun lt!249769 () Unit!10584)

(declare-fun lt!249747 () tuple3!690)

(assert (=> b!158377 (= e!107634 (tuple3!691 lt!249769 (_2!7684 lt!249747) (_3!462 lt!249747)))))

(declare-fun lt!249749 () tuple2!14444)

(assert (=> b!158377 (= lt!249749 (readByte!0 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001)))))

(declare-fun lt!249761 () array!7366)

(assert (=> b!158377 (= lt!249761 (array!7367 (store (arr!4254 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7685 lt!249749)) (size!3345 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)))))))

(declare-fun lt!249754 () (_ BitVec 64))

(assert (=> b!158377 (= lt!249754 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!249773 () (_ BitVec 32))

(assert (=> b!158377 (= lt!249773 (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!249744 () Unit!10584)

(assert (=> b!158377 (= lt!249744 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001) (_2!7685 lt!249749) lt!249754 lt!249773))))

(assert (=> b!158377 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 (_2!7685 lt!249749)))) ((_ sign_extend 32) (currentByte!6982 (_2!7685 lt!249749))) ((_ sign_extend 32) (currentBit!6977 (_2!7685 lt!249749))) (bvsub lt!249773 ((_ extract 31 0) (bvsdiv (bvadd lt!249754 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!249767 () Unit!10584)

(assert (=> b!158377 (= lt!249767 lt!249744)))

(assert (=> b!158377 (= lt!249747 (readByteArrayLoop!0 (_2!7685 lt!249749) lt!249761 (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!158377 (= (bitIndex!0 (size!3345 (buf!3803 (_2!7685 lt!249749))) (currentByte!6982 (_2!7685 lt!249749)) (currentBit!6977 (_2!7685 lt!249749))) (bvadd call!2654 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!249759 () Unit!10584)

(declare-fun Unit!10603 () Unit!10584)

(assert (=> b!158377 (= lt!249759 Unit!10603)))

(assert (=> b!158377 (= (bvadd (bitIndex!0 (size!3345 (buf!3803 (_2!7685 lt!249749))) (currentByte!6982 (_2!7685 lt!249749)) (currentBit!6977 (_2!7685 lt!249749))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3345 (buf!3803 (_2!7684 lt!249747))) (currentByte!6982 (_2!7684 lt!249747)) (currentBit!6977 (_2!7684 lt!249747))))))

(declare-fun lt!249763 () Unit!10584)

(declare-fun Unit!10605 () Unit!10584)

(assert (=> b!158377 (= lt!249763 Unit!10605)))

(assert (=> b!158377 (= (bvadd call!2654 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3345 (buf!3803 (_2!7684 lt!249747))) (currentByte!6982 (_2!7684 lt!249747)) (currentBit!6977 (_2!7684 lt!249747))))))

(declare-fun lt!249750 () Unit!10584)

(declare-fun Unit!10607 () Unit!10584)

(assert (=> b!158377 (= lt!249750 Unit!10607)))

(assert (=> b!158377 (and (= (buf!3803 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001)) (buf!3803 (_2!7684 lt!249747))) (= (size!3345 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153))) (size!3345 (_3!462 lt!249747))))))

(declare-fun lt!249768 () Unit!10584)

(declare-fun Unit!10608 () Unit!10584)

(assert (=> b!158377 (= lt!249768 Unit!10608)))

(declare-fun lt!249752 () Unit!10584)

(assert (=> b!158377 (= lt!249752 (arrayUpdatedAtPrefixLemma!53 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) (_1!7685 lt!249749)))))

(assert (=> b!158377 call!2652))

(declare-fun lt!249741 () Unit!10584)

(assert (=> b!158377 (= lt!249741 lt!249752)))

(declare-fun lt!249755 () (_ BitVec 32))

(assert (=> b!158377 (= lt!249755 #b00000000000000000000000000000000)))

(declare-fun lt!249774 () Unit!10584)

(assert (=> b!158377 (= lt!249774 (arrayRangesEqTransitive!118 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)) lt!249761 (_3!462 lt!249747) lt!249755 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158377 call!2653))

(declare-fun lt!249772 () Unit!10584)

(assert (=> b!158377 (= lt!249772 lt!249774)))

(assert (=> b!158377 (arrayRangesEq!447 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)) (_3!462 lt!249747) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun lt!249753 () Unit!10584)

(declare-fun Unit!10609 () Unit!10584)

(assert (=> b!158377 (= lt!249753 Unit!10609)))

(declare-fun lt!249757 () Unit!10584)

(assert (=> b!158377 (= lt!249757 (arrayRangesEqImpliesEq!62 lt!249761 (_3!462 lt!249747) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158377 (= (select (store (arr!4254 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7685 lt!249749)) (bvadd #b00000000000000000000000000000010 from!240)) (select (arr!4254 (_3!462 lt!249747)) (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!249742 () Unit!10584)

(assert (=> b!158377 (= lt!249742 lt!249757)))

(declare-fun lt!249748 () Bool)

(assert (=> b!158377 (= lt!249748 (= (select (arr!4254 (_3!462 lt!249747)) (bvadd #b00000000000000000000000000000010 from!240)) (_1!7685 lt!249749)))))

(declare-fun Unit!10610 () Unit!10584)

(assert (=> b!158377 (= lt!249769 Unit!10610)))

(assert (=> b!158377 lt!249748))

(declare-fun e!107635 () Bool)

(declare-fun b!158378 () Bool)

(assert (=> b!158378 (= e!107635 (= (select (arr!4254 (_3!462 lt!249776)) (bvadd #b00000000000000000000000000000010 from!240)) (_2!7683 (readBytePure!0 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001)))))))

(assert (=> b!158378 (and (bvsge (bvadd #b00000000000000000000000000000010 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000010 from!240) (size!3345 (_3!462 lt!249776))))))

(declare-fun bm!2649 () Bool)

(assert (=> bm!2649 (= call!2654 (bitIndex!0 (size!3345 (buf!3803 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001))) (currentByte!6982 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001)) (currentBit!6977 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001))))))

(declare-fun d!53067 () Bool)

(assert (=> d!53067 e!107635))

(declare-fun res!132313 () Bool)

(assert (=> d!53067 (=> res!132313 e!107635)))

(assert (=> d!53067 (= res!132313 (bvsge (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!249775 () Bool)

(assert (=> d!53067 (= lt!249775 e!107633)))

(declare-fun res!132312 () Bool)

(assert (=> d!53067 (=> (not res!132312) (not e!107633))))

(declare-fun lt!249743 () (_ BitVec 64))

(declare-fun lt!249751 () (_ BitVec 64))

(assert (=> d!53067 (= res!132312 (= (bvadd lt!249743 lt!249751) (bitIndex!0 (size!3345 (buf!3803 (_2!7684 lt!249776))) (currentByte!6982 (_2!7684 lt!249776)) (currentBit!6977 (_2!7684 lt!249776)))))))

(assert (=> d!53067 (or (not (= (bvand lt!249743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249751 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249743 lt!249751) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!249770 () (_ BitVec 64))

(assert (=> d!53067 (= lt!249751 (bvmul lt!249770 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!53067 (or (= lt!249770 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!249770 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249770)))))

(assert (=> d!53067 (= lt!249770 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))))))

(assert (=> d!53067 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000010 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!53067 (= lt!249743 (bitIndex!0 (size!3345 (buf!3803 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001))) (currentByte!6982 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001)) (currentBit!6977 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001))))))

(assert (=> d!53067 (= lt!249776 e!107634)))

(declare-fun c!8406 () Bool)

(assert (=> d!53067 (= c!8406 (bvslt (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!53067 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)) (bvsle (bvadd #b00000000000000000000000000000010 from!240) to!236) (bvsle to!236 (size!3345 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)))))))

(assert (=> d!53067 (= (readByteArrayLoop!0 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001) (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) lt!249776)))

(declare-fun bm!2650 () Bool)

(assert (=> bm!2650 (= call!2653 (arrayRangesEq!447 (ite c!8406 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)) lt!249758) (ite c!8406 (_3!462 lt!249747) lt!249760) (ite c!8406 lt!249755 lt!249771) (ite c!8406 (bvadd #b00000000000000000000000000000010 from!240) lt!249746)))))

(declare-fun b!158379 () Bool)

(declare-fun res!132311 () Bool)

(assert (=> b!158379 (=> (not res!132311) (not e!107633))))

(assert (=> b!158379 (= res!132311 (and (= (buf!3803 (withMovedByteIndex!0 lt!249518 #b00000000000000000000000000000001)) (buf!3803 (_2!7684 lt!249776))) (= (size!3345 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153))) (size!3345 (_3!462 lt!249776)))))))

(declare-fun bm!2651 () Bool)

(assert (=> bm!2651 (= call!2652 (arrayRangesEq!447 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)) (ite c!8406 (array!7367 (store (arr!4254 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7685 lt!249749)) (size!3345 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153)))) (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153))) #b00000000000000000000000000000000 (ite c!8406 (bvadd #b00000000000000000000000000000010 from!240) (size!3345 (array!7367 (store (store (arr!4254 arr!153) from!240 (_2!7683 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7683 lt!249519)) (size!3345 arr!153))))))))

(assert (= (and d!53067 c!8406) b!158377))

(assert (= (and d!53067 (not c!8406)) b!158376))

(assert (= (or b!158377 b!158376) bm!2650))

(assert (= (or b!158377 b!158376) bm!2651))

(assert (= (or b!158377 b!158376) bm!2649))

(assert (= (and d!53067 res!132312) b!158379))

(assert (= (and b!158379 res!132311) b!158375))

(assert (= (and d!53067 (not res!132313)) b!158378))

(declare-fun m!248523 () Bool)

(assert (=> b!158375 m!248523))

(declare-fun m!248525 () Bool)

(assert (=> b!158378 m!248525))

(assert (=> b!158378 m!248269))

(declare-fun m!248527 () Bool)

(assert (=> b!158378 m!248527))

(declare-fun m!248529 () Bool)

(assert (=> b!158377 m!248529))

(declare-fun m!248531 () Bool)

(assert (=> b!158377 m!248531))

(declare-fun m!248533 () Bool)

(assert (=> b!158377 m!248533))

(declare-fun m!248535 () Bool)

(assert (=> b!158377 m!248535))

(declare-fun m!248537 () Bool)

(assert (=> b!158377 m!248537))

(declare-fun m!248539 () Bool)

(assert (=> b!158377 m!248539))

(assert (=> b!158377 m!248269))

(declare-fun m!248541 () Bool)

(assert (=> b!158377 m!248541))

(declare-fun m!248543 () Bool)

(assert (=> b!158377 m!248543))

(declare-fun m!248545 () Bool)

(assert (=> b!158377 m!248545))

(assert (=> b!158377 m!248269))

(declare-fun m!248547 () Bool)

(assert (=> b!158377 m!248547))

(declare-fun m!248549 () Bool)

(assert (=> b!158377 m!248549))

(declare-fun m!248551 () Bool)

(assert (=> b!158377 m!248551))

(declare-fun m!248553 () Bool)

(assert (=> b!158377 m!248553))

(declare-fun m!248555 () Bool)

(assert (=> bm!2650 m!248555))

(assert (=> bm!2651 m!248553))

(declare-fun m!248557 () Bool)

(assert (=> bm!2651 m!248557))

(declare-fun m!248559 () Bool)

(assert (=> d!53067 m!248559))

(declare-fun m!248561 () Bool)

(assert (=> d!53067 m!248561))

(assert (=> bm!2649 m!248561))

(declare-fun m!248563 () Bool)

(assert (=> b!158376 m!248563))

(declare-fun m!248565 () Bool)

(assert (=> b!158376 m!248565))

(assert (=> d!52947 d!53067))

(declare-fun d!53069 () Bool)

(assert (=> d!53069 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) ((_ sign_extend 32) (currentByte!6982 lt!249518)) ((_ sign_extend 32) (currentBit!6977 lt!249518)) (bvsub (bvsub to!236 from!240) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!53069 true))

(declare-fun _$7!118 () Unit!10584)

(assert (=> d!53069 (= (choose!57 bs!65 lt!249518 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) _$7!118)))

(declare-fun bs!13089 () Bool)

(assert (= bs!13089 d!53069))

(declare-fun m!248567 () Bool)

(assert (=> bs!13089 m!248567))

(assert (=> d!52932 d!53069))

(declare-fun d!53071 () Bool)

(declare-fun lt!249792 () (_ BitVec 8))

(declare-fun lt!249791 () (_ BitVec 8))

(assert (=> d!53071 (= lt!249792 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4254 (buf!3803 lt!249518)) (currentByte!6982 lt!249518))) ((_ sign_extend 24) lt!249791))))))

(assert (=> d!53071 (= lt!249791 ((_ extract 7 0) (currentBit!6977 lt!249518)))))

(declare-fun e!107640 () Bool)

(assert (=> d!53071 e!107640))

(declare-fun res!132320 () Bool)

(assert (=> d!53071 (=> (not res!132320) (not e!107640))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!53071 (= res!132320 (validate_offset_bits!1 ((_ sign_extend 32) (size!3345 (buf!3803 lt!249518))) ((_ sign_extend 32) (currentByte!6982 lt!249518)) ((_ sign_extend 32) (currentBit!6977 lt!249518)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14458 0))(
  ( (tuple2!14459 (_1!7694 Unit!10584) (_2!7694 (_ BitVec 8))) )
))
(declare-fun Unit!10619 () Unit!10584)

(declare-fun Unit!10620 () Unit!10584)

(assert (=> d!53071 (= (readByte!0 lt!249518) (tuple2!14445 (_2!7694 (ite (bvsgt ((_ sign_extend 24) lt!249791) #b00000000000000000000000000000000) (tuple2!14459 Unit!10619 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249792) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4254 (buf!3803 lt!249518)) (bvadd (currentByte!6982 lt!249518) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249791)))))))) (tuple2!14459 Unit!10620 lt!249792))) (BitStream!5859 (buf!3803 lt!249518) (bvadd (currentByte!6982 lt!249518) #b00000000000000000000000000000001) (currentBit!6977 lt!249518))))))

(declare-fun b!158384 () Bool)

(declare-fun e!107641 () Bool)

(assert (=> b!158384 (= e!107640 e!107641)))

(declare-fun res!132319 () Bool)

(assert (=> b!158384 (=> (not res!132319) (not e!107641))))

(declare-fun lt!249795 () tuple2!14444)

(assert (=> b!158384 (= res!132319 (= (buf!3803 (_2!7685 lt!249795)) (buf!3803 lt!249518)))))

(declare-fun lt!249793 () (_ BitVec 8))

(declare-fun lt!249797 () (_ BitVec 8))

(declare-fun Unit!10621 () Unit!10584)

(declare-fun Unit!10622 () Unit!10584)

(assert (=> b!158384 (= lt!249795 (tuple2!14445 (_2!7694 (ite (bvsgt ((_ sign_extend 24) lt!249793) #b00000000000000000000000000000000) (tuple2!14459 Unit!10621 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249797) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4254 (buf!3803 lt!249518)) (bvadd (currentByte!6982 lt!249518) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249793)))))))) (tuple2!14459 Unit!10622 lt!249797))) (BitStream!5859 (buf!3803 lt!249518) (bvadd (currentByte!6982 lt!249518) #b00000000000000000000000000000001) (currentBit!6977 lt!249518))))))

(assert (=> b!158384 (= lt!249797 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4254 (buf!3803 lt!249518)) (currentByte!6982 lt!249518))) ((_ sign_extend 24) lt!249793))))))

(assert (=> b!158384 (= lt!249793 ((_ extract 7 0) (currentBit!6977 lt!249518)))))

(declare-fun b!158385 () Bool)

(declare-fun lt!249794 () (_ BitVec 64))

(declare-fun lt!249796 () (_ BitVec 64))

(assert (=> b!158385 (= e!107641 (= (bitIndex!0 (size!3345 (buf!3803 (_2!7685 lt!249795))) (currentByte!6982 (_2!7685 lt!249795)) (currentBit!6977 (_2!7685 lt!249795))) (bvadd lt!249796 lt!249794)))))

(assert (=> b!158385 (or (not (= (bvand lt!249796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249794 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249796 lt!249794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!158385 (= lt!249794 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!158385 (= lt!249796 (bitIndex!0 (size!3345 (buf!3803 lt!249518)) (currentByte!6982 lt!249518) (currentBit!6977 lt!249518)))))

(assert (= (and d!53071 res!132320) b!158384))

(assert (= (and b!158384 res!132319) b!158385))

(declare-fun m!248569 () Bool)

(assert (=> d!53071 m!248569))

(declare-fun m!248571 () Bool)

(assert (=> d!53071 m!248571))

(declare-fun m!248573 () Bool)

(assert (=> d!53071 m!248573))

(assert (=> b!158384 m!248573))

(assert (=> b!158384 m!248569))

(declare-fun m!248575 () Bool)

(assert (=> b!158385 m!248575))

(assert (=> b!158385 m!248511))

(assert (=> d!52937 d!53071))

(declare-fun d!53073 () Bool)

(declare-fun e!107644 () Bool)

(assert (=> d!53073 e!107644))

(declare-fun res!132323 () Bool)

(assert (=> d!53073 (=> (not res!132323) (not e!107644))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5858 (_ BitVec 32)) Bool)

(assert (=> d!53073 (= res!132323 (moveByteIndexPrecond!0 lt!249518 #b00000000000000000000000000000001))))

(declare-fun Unit!10627 () Unit!10584)

(assert (=> d!53073 (= (moveByteIndex!0 lt!249518 #b00000000000000000000000000000001) (tuple2!14447 Unit!10627 (BitStream!5859 (buf!3803 lt!249518) (bvadd (currentByte!6982 lt!249518) #b00000000000000000000000000000001) (currentBit!6977 lt!249518))))))

(declare-fun b!158388 () Bool)

(assert (=> b!158388 (= e!107644 (and (or (not (= (bvand (currentByte!6982 lt!249518) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6982 lt!249518) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6982 lt!249518) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6982 lt!249518) #b00000000000000000000000000000001) (bvadd (currentByte!6982 lt!249518) #b00000000000000000000000000000001))))))

(assert (= (and d!53073 res!132323) b!158388))

(declare-fun m!248577 () Bool)

(assert (=> d!53073 m!248577))

(assert (=> d!52955 d!53073))

(declare-fun d!53075 () Bool)

(declare-fun res!132324 () Bool)

(declare-fun e!107645 () Bool)

(assert (=> d!53075 (=> res!132324 e!107645)))

(assert (=> d!53075 (= res!132324 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!53075 (= (arrayRangesEq!447 (_2!7682 lt!249509) (_2!7682 lt!249510) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!107645)))

(declare-fun b!158389 () Bool)

(declare-fun e!107646 () Bool)

(assert (=> b!158389 (= e!107645 e!107646)))

(declare-fun res!132325 () Bool)

(assert (=> b!158389 (=> (not res!132325) (not e!107646))))

(assert (=> b!158389 (= res!132325 (= (select (arr!4254 (_2!7682 lt!249509)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4254 (_2!7682 lt!249510)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!158390 () Bool)

(assert (=> b!158390 (= e!107646 (arrayRangesEq!447 (_2!7682 lt!249509) (_2!7682 lt!249510) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!53075 (not res!132324)) b!158389))

(assert (= (and b!158389 res!132325) b!158390))

(assert (=> b!158389 m!248519))

(declare-fun m!248579 () Bool)

(assert (=> b!158389 m!248579))

(declare-fun m!248581 () Bool)

(assert (=> b!158390 m!248581))

(assert (=> b!158318 d!53075))

(declare-fun lt!249833 () tuple3!690)

(declare-fun e!107647 () Bool)

(declare-fun b!158391 () Bool)

(assert (=> b!158391 (= e!107647 (arrayRangesEq!447 arr!153 (_3!462 lt!249833) #b00000000000000000000000000000000 from!240))))

(declare-fun b!158392 () Bool)

(declare-fun lt!249802 () Unit!10584)

(declare-fun e!107648 () tuple3!690)

(assert (=> b!158392 (= e!107648 (tuple3!691 lt!249802 bs!65 arr!153))))

(declare-fun call!2657 () (_ BitVec 64))

(assert (=> b!158392 (= call!2657 call!2657)))

(declare-fun lt!249819 () Unit!10584)

(declare-fun Unit!10632 () Unit!10584)

(assert (=> b!158392 (= lt!249819 Unit!10632)))

(declare-fun lt!249813 () Unit!10584)

(assert (=> b!158392 (= lt!249813 (arrayRangesEqReflexiveLemma!53 arr!153))))

(declare-fun call!2655 () Bool)

(assert (=> b!158392 call!2655))

(declare-fun lt!249822 () Unit!10584)

(assert (=> b!158392 (= lt!249822 lt!249813)))

(declare-fun lt!249815 () array!7366)

(assert (=> b!158392 (= lt!249815 arr!153)))

(declare-fun lt!249817 () array!7366)

(assert (=> b!158392 (= lt!249817 arr!153)))

(declare-fun lt!249823 () (_ BitVec 32))

(assert (=> b!158392 (= lt!249823 #b00000000000000000000000000000000)))

(declare-fun lt!249821 () (_ BitVec 32))

(assert (=> b!158392 (= lt!249821 (size!3345 arr!153))))

(declare-fun lt!249828 () (_ BitVec 32))

(assert (=> b!158392 (= lt!249828 #b00000000000000000000000000000000)))

(declare-fun lt!249803 () (_ BitVec 32))

(assert (=> b!158392 (= lt!249803 from!240)))

(assert (=> b!158392 (= lt!249802 (arrayRangesEqSlicedLemma!53 lt!249815 lt!249817 lt!249823 lt!249821 lt!249828 lt!249803))))

(declare-fun call!2656 () Bool)

(assert (=> b!158392 call!2656))

(declare-fun b!158393 () Bool)

(declare-fun lt!249826 () Unit!10584)

(declare-fun lt!249804 () tuple3!690)

(assert (=> b!158393 (= e!107648 (tuple3!691 lt!249826 (_2!7684 lt!249804) (_3!462 lt!249804)))))

(declare-fun lt!249806 () tuple2!14444)

(assert (=> b!158393 (= lt!249806 (readByte!0 bs!65))))

(declare-fun lt!249818 () array!7366)

(assert (=> b!158393 (= lt!249818 (array!7367 (store (arr!4254 arr!153) from!240 (_1!7685 lt!249806)) (size!3345 arr!153)))))

(declare-fun lt!249811 () (_ BitVec 64))

(assert (=> b!158393 (= lt!249811 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!249830 () (_ BitVec 32))

(assert (=> b!158393 (= lt!249830 (bvsub to!236 from!240))))

(declare-fun lt!249801 () Unit!10584)

(assert (=> b!158393 (= lt!249801 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7685 lt!249806) lt!249811 lt!249830))))

(assert (=> b!158393 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3345 (buf!3803 (_2!7685 lt!249806)))) ((_ sign_extend 32) (currentByte!6982 (_2!7685 lt!249806))) ((_ sign_extend 32) (currentBit!6977 (_2!7685 lt!249806))) (bvsub lt!249830 ((_ extract 31 0) (bvsdiv (bvadd lt!249811 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!249824 () Unit!10584)

(assert (=> b!158393 (= lt!249824 lt!249801)))

(assert (=> b!158393 (= lt!249804 (readByteArrayLoop!0 (_2!7685 lt!249806) lt!249818 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!158393 (= (bitIndex!0 (size!3345 (buf!3803 (_2!7685 lt!249806))) (currentByte!6982 (_2!7685 lt!249806)) (currentBit!6977 (_2!7685 lt!249806))) (bvadd call!2657 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!249816 () Unit!10584)

(declare-fun Unit!10635 () Unit!10584)

(assert (=> b!158393 (= lt!249816 Unit!10635)))

(assert (=> b!158393 (= (bvadd (bitIndex!0 (size!3345 (buf!3803 (_2!7685 lt!249806))) (currentByte!6982 (_2!7685 lt!249806)) (currentBit!6977 (_2!7685 lt!249806))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3345 (buf!3803 (_2!7684 lt!249804))) (currentByte!6982 (_2!7684 lt!249804)) (currentBit!6977 (_2!7684 lt!249804))))))

(declare-fun lt!249820 () Unit!10584)

(declare-fun Unit!10636 () Unit!10584)

(assert (=> b!158393 (= lt!249820 Unit!10636)))

(assert (=> b!158393 (= (bvadd call!2657 (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3345 (buf!3803 (_2!7684 lt!249804))) (currentByte!6982 (_2!7684 lt!249804)) (currentBit!6977 (_2!7684 lt!249804))))))

(declare-fun lt!249807 () Unit!10584)

(declare-fun Unit!10637 () Unit!10584)

(assert (=> b!158393 (= lt!249807 Unit!10637)))

(assert (=> b!158393 (and (= (buf!3803 bs!65) (buf!3803 (_2!7684 lt!249804))) (= (size!3345 arr!153) (size!3345 (_3!462 lt!249804))))))

(declare-fun lt!249825 () Unit!10584)

(declare-fun Unit!10638 () Unit!10584)

(assert (=> b!158393 (= lt!249825 Unit!10638)))

(declare-fun lt!249809 () Unit!10584)

(assert (=> b!158393 (= lt!249809 (arrayUpdatedAtPrefixLemma!53 arr!153 from!240 (_1!7685 lt!249806)))))

(assert (=> b!158393 call!2655))

(declare-fun lt!249798 () Unit!10584)

(assert (=> b!158393 (= lt!249798 lt!249809)))

(declare-fun lt!249812 () (_ BitVec 32))

(assert (=> b!158393 (= lt!249812 #b00000000000000000000000000000000)))

(declare-fun lt!249831 () Unit!10584)

(assert (=> b!158393 (= lt!249831 (arrayRangesEqTransitive!118 arr!153 lt!249818 (_3!462 lt!249804) lt!249812 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158393 call!2656))

(declare-fun lt!249829 () Unit!10584)

(assert (=> b!158393 (= lt!249829 lt!249831)))

(assert (=> b!158393 (arrayRangesEq!447 arr!153 (_3!462 lt!249804) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!249810 () Unit!10584)

(declare-fun Unit!10639 () Unit!10584)

(assert (=> b!158393 (= lt!249810 Unit!10639)))

(declare-fun lt!249814 () Unit!10584)

(assert (=> b!158393 (= lt!249814 (arrayRangesEqImpliesEq!62 lt!249818 (_3!462 lt!249804) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158393 (= (select (store (arr!4254 arr!153) from!240 (_1!7685 lt!249806)) from!240) (select (arr!4254 (_3!462 lt!249804)) from!240))))

(declare-fun lt!249799 () Unit!10584)

(assert (=> b!158393 (= lt!249799 lt!249814)))

(declare-fun lt!249805 () Bool)

(assert (=> b!158393 (= lt!249805 (= (select (arr!4254 (_3!462 lt!249804)) from!240) (_1!7685 lt!249806)))))

(declare-fun Unit!10641 () Unit!10584)

(assert (=> b!158393 (= lt!249826 Unit!10641)))

(assert (=> b!158393 lt!249805))

(declare-fun e!107649 () Bool)

(declare-fun b!158394 () Bool)

(assert (=> b!158394 (= e!107649 (= (select (arr!4254 (_3!462 lt!249833)) from!240) (_2!7683 (readBytePure!0 bs!65))))))

(assert (=> b!158394 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3345 (_3!462 lt!249833))))))

(declare-fun bm!2652 () Bool)

(assert (=> bm!2652 (= call!2657 (bitIndex!0 (size!3345 (buf!3803 bs!65)) (currentByte!6982 bs!65) (currentBit!6977 bs!65)))))

(declare-fun d!53077 () Bool)

(assert (=> d!53077 e!107649))

(declare-fun res!132328 () Bool)

(assert (=> d!53077 (=> res!132328 e!107649)))

(assert (=> d!53077 (= res!132328 (bvsge from!240 to!236))))

(declare-fun lt!249832 () Bool)

(assert (=> d!53077 (= lt!249832 e!107647)))

(declare-fun res!132327 () Bool)

(assert (=> d!53077 (=> (not res!132327) (not e!107647))))

(declare-fun lt!249808 () (_ BitVec 64))

(declare-fun lt!249800 () (_ BitVec 64))

(assert (=> d!53077 (= res!132327 (= (bvadd lt!249800 lt!249808) (bitIndex!0 (size!3345 (buf!3803 (_2!7684 lt!249833))) (currentByte!6982 (_2!7684 lt!249833)) (currentBit!6977 (_2!7684 lt!249833)))))))

(assert (=> d!53077 (or (not (= (bvand lt!249800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249808 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249800 lt!249808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!249827 () (_ BitVec 64))

(assert (=> d!53077 (= lt!249808 (bvmul lt!249827 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!53077 (or (= lt!249827 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!249827 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249827)))))

(assert (=> d!53077 (= lt!249827 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!53077 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!53077 (= lt!249800 (bitIndex!0 (size!3345 (buf!3803 bs!65)) (currentByte!6982 bs!65) (currentBit!6977 bs!65)))))

(assert (=> d!53077 (= lt!249833 e!107648)))

(declare-fun c!8407 () Bool)

(assert (=> d!53077 (= c!8407 (bvslt from!240 to!236))))

(assert (=> d!53077 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3345 arr!153)))))

(assert (=> d!53077 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!249833)))

(declare-fun bm!2653 () Bool)

(assert (=> bm!2653 (= call!2656 (arrayRangesEq!447 (ite c!8407 arr!153 lt!249815) (ite c!8407 (_3!462 lt!249804) lt!249817) (ite c!8407 lt!249812 lt!249828) (ite c!8407 from!240 lt!249803)))))

(declare-fun b!158395 () Bool)

(declare-fun res!132326 () Bool)

(assert (=> b!158395 (=> (not res!132326) (not e!107647))))

(assert (=> b!158395 (= res!132326 (and (= (buf!3803 bs!65) (buf!3803 (_2!7684 lt!249833))) (= (size!3345 arr!153) (size!3345 (_3!462 lt!249833)))))))

(declare-fun bm!2654 () Bool)

(assert (=> bm!2654 (= call!2655 (arrayRangesEq!447 arr!153 (ite c!8407 (array!7367 (store (arr!4254 arr!153) from!240 (_1!7685 lt!249806)) (size!3345 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8407 from!240 (size!3345 arr!153))))))

(assert (= (and d!53077 c!8407) b!158393))

(assert (= (and d!53077 (not c!8407)) b!158392))

(assert (= (or b!158393 b!158392) bm!2653))

(assert (= (or b!158393 b!158392) bm!2654))

(assert (= (or b!158393 b!158392) bm!2652))

(assert (= (and d!53077 res!132327) b!158395))

(assert (= (and b!158395 res!132326) b!158391))

(assert (= (and d!53077 (not res!132328)) b!158394))

(declare-fun m!248583 () Bool)

(assert (=> b!158391 m!248583))

(declare-fun m!248585 () Bool)

(assert (=> b!158394 m!248585))

(assert (=> b!158394 m!248273))

(declare-fun m!248587 () Bool)

(assert (=> b!158393 m!248587))

(declare-fun m!248589 () Bool)

(assert (=> b!158393 m!248589))

(declare-fun m!248591 () Bool)

(assert (=> b!158393 m!248591))

(declare-fun m!248593 () Bool)

(assert (=> b!158393 m!248593))

(declare-fun m!248595 () Bool)

(assert (=> b!158393 m!248595))

(declare-fun m!248597 () Bool)

(assert (=> b!158393 m!248597))

(declare-fun m!248599 () Bool)

(assert (=> b!158393 m!248599))

(declare-fun m!248601 () Bool)

(assert (=> b!158393 m!248601))

(declare-fun m!248603 () Bool)

(assert (=> b!158393 m!248603))

(assert (=> b!158393 m!248301))

(declare-fun m!248605 () Bool)

(assert (=> b!158393 m!248605))

(declare-fun m!248607 () Bool)

(assert (=> b!158393 m!248607))

(declare-fun m!248609 () Bool)

(assert (=> b!158393 m!248609))

(declare-fun m!248611 () Bool)

(assert (=> bm!2653 m!248611))

(assert (=> bm!2654 m!248609))

(declare-fun m!248613 () Bool)

(assert (=> bm!2654 m!248613))

(declare-fun m!248615 () Bool)

(assert (=> d!53077 m!248615))

(declare-fun m!248617 () Bool)

(assert (=> d!53077 m!248617))

(assert (=> bm!2652 m!248617))

(declare-fun m!248619 () Bool)

(assert (=> b!158392 m!248619))

(declare-fun m!248621 () Bool)

(assert (=> b!158392 m!248621))

(assert (=> d!52928 d!53077))

(declare-fun d!53079 () Bool)

(assert (=> d!53079 (= (remainingBits!0 ((_ sign_extend 32) (size!3345 (buf!3803 bs!65))) ((_ sign_extend 32) (currentByte!6982 bs!65)) ((_ sign_extend 32) (currentBit!6977 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3345 (buf!3803 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6982 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6977 bs!65)))))))

(assert (=> d!52943 d!53079))

(assert (=> d!52945 d!52992))

(declare-fun d!53081 () Bool)

(declare-fun e!107650 () Bool)

(assert (=> d!53081 e!107650))

(declare-fun res!132329 () Bool)

(assert (=> d!53081 (=> (not res!132329) (not e!107650))))

(assert (=> d!53081 (= res!132329 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10643 () Unit!10584)

(assert (=> d!53081 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14447 Unit!10643 (BitStream!5859 (buf!3803 bs!65) (bvadd (currentByte!6982 bs!65) #b00000000000000000000000000000001) (currentBit!6977 bs!65))))))

(declare-fun b!158396 () Bool)

(assert (=> b!158396 (= e!107650 (and (or (not (= (bvand (currentByte!6982 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6982 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6982 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6982 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6982 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!53081 res!132329) b!158396))

(declare-fun m!248623 () Bool)

(assert (=> d!53081 m!248623))

(assert (=> d!52926 d!53081))

(declare-fun d!53083 () Bool)

(declare-fun lt!249835 () (_ BitVec 8))

(declare-fun lt!249834 () (_ BitVec 8))

(assert (=> d!53083 (= lt!249835 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4254 (buf!3803 bs!65)) (currentByte!6982 bs!65))) ((_ sign_extend 24) lt!249834))))))

(assert (=> d!53083 (= lt!249834 ((_ extract 7 0) (currentBit!6977 bs!65)))))

(declare-fun e!107651 () Bool)

(assert (=> d!53083 e!107651))

(declare-fun res!132331 () Bool)

(assert (=> d!53083 (=> (not res!132331) (not e!107651))))

(assert (=> d!53083 (= res!132331 (validate_offset_bits!1 ((_ sign_extend 32) (size!3345 (buf!3803 bs!65))) ((_ sign_extend 32) (currentByte!6982 bs!65)) ((_ sign_extend 32) (currentBit!6977 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10644 () Unit!10584)

(declare-fun Unit!10645 () Unit!10584)

(assert (=> d!53083 (= (readByte!0 bs!65) (tuple2!14445 (_2!7694 (ite (bvsgt ((_ sign_extend 24) lt!249834) #b00000000000000000000000000000000) (tuple2!14459 Unit!10644 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249835) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4254 (buf!3803 bs!65)) (bvadd (currentByte!6982 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249834)))))))) (tuple2!14459 Unit!10645 lt!249835))) (BitStream!5859 (buf!3803 bs!65) (bvadd (currentByte!6982 bs!65) #b00000000000000000000000000000001) (currentBit!6977 bs!65))))))

(declare-fun b!158397 () Bool)

(declare-fun e!107652 () Bool)

(assert (=> b!158397 (= e!107651 e!107652)))

(declare-fun res!132330 () Bool)

(assert (=> b!158397 (=> (not res!132330) (not e!107652))))

(declare-fun lt!249838 () tuple2!14444)

(assert (=> b!158397 (= res!132330 (= (buf!3803 (_2!7685 lt!249838)) (buf!3803 bs!65)))))

(declare-fun lt!249840 () (_ BitVec 8))

(declare-fun lt!249836 () (_ BitVec 8))

(declare-fun Unit!10646 () Unit!10584)

(declare-fun Unit!10647 () Unit!10584)

(assert (=> b!158397 (= lt!249838 (tuple2!14445 (_2!7694 (ite (bvsgt ((_ sign_extend 24) lt!249836) #b00000000000000000000000000000000) (tuple2!14459 Unit!10646 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249840) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4254 (buf!3803 bs!65)) (bvadd (currentByte!6982 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249836)))))))) (tuple2!14459 Unit!10647 lt!249840))) (BitStream!5859 (buf!3803 bs!65) (bvadd (currentByte!6982 bs!65) #b00000000000000000000000000000001) (currentBit!6977 bs!65))))))

(assert (=> b!158397 (= lt!249840 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4254 (buf!3803 bs!65)) (currentByte!6982 bs!65))) ((_ sign_extend 24) lt!249836))))))

(assert (=> b!158397 (= lt!249836 ((_ extract 7 0) (currentBit!6977 bs!65)))))

(declare-fun lt!249837 () (_ BitVec 64))

(declare-fun b!158398 () Bool)

(declare-fun lt!249839 () (_ BitVec 64))

(assert (=> b!158398 (= e!107652 (= (bitIndex!0 (size!3345 (buf!3803 (_2!7685 lt!249838))) (currentByte!6982 (_2!7685 lt!249838)) (currentBit!6977 (_2!7685 lt!249838))) (bvadd lt!249839 lt!249837)))))

(assert (=> b!158398 (or (not (= (bvand lt!249839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249837 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249839 lt!249837) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!158398 (= lt!249837 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!158398 (= lt!249839 (bitIndex!0 (size!3345 (buf!3803 bs!65)) (currentByte!6982 bs!65) (currentBit!6977 bs!65)))))

(assert (= (and d!53083 res!132331) b!158397))

(assert (= (and b!158397 res!132330) b!158398))

(declare-fun m!248625 () Bool)

(assert (=> d!53083 m!248625))

(declare-fun m!248627 () Bool)

(assert (=> d!53083 m!248627))

(declare-fun m!248629 () Bool)

(assert (=> d!53083 m!248629))

(assert (=> b!158397 m!248629))

(assert (=> b!158397 m!248625))

(declare-fun m!248631 () Bool)

(assert (=> b!158398 m!248631))

(assert (=> b!158398 m!248617))

(assert (=> d!52924 d!53083))

(declare-fun d!53085 () Bool)

(assert (=> d!53085 (= (invariant!0 (currentBit!6977 bs!65) (currentByte!6982 bs!65) (size!3345 (buf!3803 bs!65))) (and (bvsge (currentBit!6977 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6977 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6982 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6982 bs!65) (size!3345 (buf!3803 bs!65))) (and (= (currentBit!6977 bs!65) #b00000000000000000000000000000000) (= (currentByte!6982 bs!65) (size!3345 (buf!3803 bs!65)))))))))

(assert (=> d!52941 d!53085))

(push 1)

(assert (not bm!2654))

(assert (not bm!2651))

(assert (not d!53073))

(assert (not bm!2652))

(assert (not b!158378))

(assert (not b!158377))

(assert (not b!158385))

(assert (not b!158390))

(assert (not b!158398))

(assert (not b!158370))

(assert (not d!53000))

(assert (not d!53067))

(assert (not d!53077))

(assert (not b!158368))

(assert (not b!158376))

(assert (not b!158393))

(assert (not b!158374))

(assert (not bm!2646))

(assert (not d!53069))

(assert (not d!53081))

(assert (not b!158394))

(assert (not d!53002))

(assert (not bm!2647))

(assert (not bm!2649))

(assert (not d!52996))

(assert (not b!158392))

(assert (not b!158375))

(assert (not b!158391))

(assert (not b!158331))

(assert (not bm!2653))

(assert (not bm!2648))

(assert (not bm!2650))

(assert (not b!158371))

(assert (not d!53083))

(assert (not d!52998))

(assert (not b!158369))

(assert (not d!53071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

