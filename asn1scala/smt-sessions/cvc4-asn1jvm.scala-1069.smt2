; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30674 () Bool)

(assert start!30674)

(declare-fun res!130405 () Bool)

(declare-fun e!105287 () Bool)

(assert (=> start!30674 (=> (not res!130405) (not e!105287))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7135 0))(
  ( (array!7136 (arr!4042 (Array (_ BitVec 32) (_ BitVec 8))) (size!3204 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7135)

(assert (=> start!30674 (= res!130405 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3204 arr!153))))))

(assert (=> start!30674 e!105287))

(assert (=> start!30674 true))

(declare-fun array_inv!2993 (array!7135) Bool)

(assert (=> start!30674 (array_inv!2993 arr!153)))

(declare-datatypes ((BitStream!5666 0))(
  ( (BitStream!5667 (buf!3707 array!7135) (currentByte!6789 (_ BitVec 32)) (currentBit!6784 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5666)

(declare-fun e!105289 () Bool)

(declare-fun inv!12 (BitStream!5666) Bool)

(assert (=> start!30674 (and (inv!12 bs!65) e!105289)))

(declare-fun b!155978 () Bool)

(declare-fun res!130406 () Bool)

(assert (=> b!155978 (=> (not res!130406) (not e!105287))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155978 (= res!130406 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3204 (buf!3707 bs!65))) ((_ sign_extend 32) (currentByte!6789 bs!65)) ((_ sign_extend 32) (currentBit!6784 bs!65)) (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!13872 0))(
  ( (tuple2!13873 (_1!7365 BitStream!5666) (_2!7365 array!7135)) )
))
(declare-fun lt!242950 () tuple2!13872)

(declare-fun b!155979 () Bool)

(declare-fun lt!242949 () tuple2!13872)

(assert (=> b!155979 (= e!105287 (and (= from!240 (bvsub to!236 #b00000000000000000000000000000001)) (bvsle #b00000000000000000000000000000000 to!236) (bvsgt (size!3204 (_2!7365 lt!242949)) (size!3204 (_2!7365 lt!242950)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5666 array!7135 (_ BitVec 32) (_ BitVec 32)) tuple2!13872)

(declare-fun withMovedByteIndex!0 (BitStream!5666 (_ BitVec 32)) BitStream!5666)

(declare-datatypes ((tuple2!13874 0))(
  ( (tuple2!13875 (_1!7366 BitStream!5666) (_2!7366 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5666) tuple2!13874)

(assert (=> b!155979 (= lt!242950 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!155979 (= lt!242949 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155980 () Bool)

(assert (=> b!155980 (= e!105289 (array_inv!2993 (buf!3707 bs!65)))))

(assert (= (and start!30674 res!130405) b!155978))

(assert (= (and b!155978 res!130406) b!155979))

(assert (= start!30674 b!155980))

(declare-fun m!242457 () Bool)

(assert (=> start!30674 m!242457))

(declare-fun m!242459 () Bool)

(assert (=> start!30674 m!242459))

(declare-fun m!242461 () Bool)

(assert (=> b!155978 m!242461))

(declare-fun m!242463 () Bool)

(assert (=> b!155979 m!242463))

(declare-fun m!242465 () Bool)

(assert (=> b!155979 m!242465))

(assert (=> b!155979 m!242465))

(declare-fun m!242467 () Bool)

(assert (=> b!155979 m!242467))

(declare-fun m!242469 () Bool)

(assert (=> b!155979 m!242469))

(declare-fun m!242471 () Bool)

(assert (=> b!155979 m!242471))

(declare-fun m!242473 () Bool)

(assert (=> b!155980 m!242473))

(push 1)

(assert (not b!155980))

(assert (not start!30674))

(assert (not b!155979))

(assert (not b!155978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51712 () Bool)

(assert (=> d!51712 (= (array_inv!2993 (buf!3707 bs!65)) (bvsge (size!3204 (buf!3707 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155980 d!51712))

(declare-fun d!51714 () Bool)

(assert (=> d!51714 (= (array_inv!2993 arr!153) (bvsge (size!3204 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30674 d!51714))

(declare-fun d!51716 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51716 (= (inv!12 bs!65) (invariant!0 (currentBit!6784 bs!65) (currentByte!6789 bs!65) (size!3204 (buf!3707 bs!65))))))

(declare-fun bs!12656 () Bool)

(assert (= bs!12656 d!51716))

(declare-fun m!242479 () Bool)

(assert (=> bs!12656 m!242479))

(assert (=> start!30674 d!51716))

(declare-datatypes ((Unit!9888 0))(
  ( (Unit!9889) )
))
(declare-datatypes ((tuple3!626 0))(
  ( (tuple3!627 (_1!7370 Unit!9888) (_2!7370 BitStream!5666) (_3!430 array!7135)) )
))
(declare-fun lt!242958 () tuple3!626)

(declare-fun d!51718 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5666 array!7135 (_ BitVec 32) (_ BitVec 32)) tuple3!626)

(assert (=> d!51718 (= lt!242958 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51718 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13873 (_2!7370 lt!242958) (_3!430 lt!242958)))))

(declare-fun bs!12659 () Bool)

(assert (= bs!12659 d!51718))

(assert (=> bs!12659 m!242465))

(declare-fun m!242485 () Bool)

(assert (=> bs!12659 m!242485))

(assert (=> b!155979 d!51718))

(declare-fun d!51724 () Bool)

(declare-datatypes ((tuple2!13880 0))(
  ( (tuple2!13881 (_1!7371 Unit!9888) (_2!7371 BitStream!5666)) )
))
(declare-fun moveByteIndex!0 (BitStream!5666 (_ BitVec 32)) tuple2!13880)

(assert (=> d!51724 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7371 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12662 () Bool)

(assert (= bs!12662 d!51724))

(declare-fun m!242491 () Bool)

(assert (=> bs!12662 m!242491))

(assert (=> b!155979 d!51724))

(declare-fun d!51730 () Bool)

(declare-datatypes ((tuple2!13882 0))(
  ( (tuple2!13883 (_1!7372 (_ BitVec 8)) (_2!7372 BitStream!5666)) )
))
(declare-fun lt!242963 () tuple2!13882)

(declare-fun readByte!0 (BitStream!5666) tuple2!13882)

(assert (=> d!51730 (= lt!242963 (readByte!0 bs!65))))

(assert (=> d!51730 (= (readBytePure!0 bs!65) (tuple2!13875 (_2!7372 lt!242963) (_1!7372 lt!242963)))))

(declare-fun bs!12663 () Bool)

(assert (= bs!12663 d!51730))

(declare-fun m!242493 () Bool)

(assert (=> bs!12663 m!242493))

(assert (=> b!155979 d!51730))

(declare-fun d!51734 () Bool)

(declare-fun lt!242964 () tuple3!626)

(assert (=> d!51734 (= lt!242964 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51734 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13873 (_2!7370 lt!242964) (_3!430 lt!242964)))))

(declare-fun bs!12664 () Bool)

(assert (= bs!12664 d!51734))

(declare-fun m!242495 () Bool)

(assert (=> bs!12664 m!242495))

(assert (=> b!155979 d!51734))

(declare-fun d!51736 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51736 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3204 (buf!3707 bs!65))) ((_ sign_extend 32) (currentByte!6789 bs!65)) ((_ sign_extend 32) (currentBit!6784 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3204 (buf!3707 bs!65))) ((_ sign_extend 32) (currentByte!6789 bs!65)) ((_ sign_extend 32) (currentBit!6784 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12665 () Bool)

(assert (= bs!12665 d!51736))

(declare-fun m!242497 () Bool)

(assert (=> bs!12665 m!242497))

(assert (=> b!155978 d!51736))

(push 1)

(assert (not d!51724))

(assert (not d!51718))

(assert (not d!51736))

(assert (not d!51730))

(assert (not d!51716))

(assert (not d!51734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51754 () Bool)

(declare-fun e!105293 () Bool)

(assert (=> d!51754 e!105293))

(declare-fun res!130409 () Bool)

(assert (=> d!51754 (=> (not res!130409) (not e!105293))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5666 (_ BitVec 32)) Bool)

(assert (=> d!51754 (= res!130409 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!9892 () Unit!9888)

(assert (=> d!51754 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13881 Unit!9892 (BitStream!5667 (buf!3707 bs!65) (bvadd (currentByte!6789 bs!65) #b00000000000000000000000000000001) (currentBit!6784 bs!65))))))

(declare-fun b!155983 () Bool)

(assert (=> b!155983 (= e!105293 (and (or (not (= (bvand (currentByte!6789 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6789 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6789 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6789 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6789 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51754 res!130409) b!155983))

(declare-fun m!242511 () Bool)

(assert (=> d!51754 m!242511))

(assert (=> d!51724 d!51754))

(declare-fun d!51756 () Bool)

(declare-fun e!105315 () Bool)

(assert (=> d!51756 e!105315))

(declare-fun res!130429 () Bool)

(assert (=> d!51756 (=> res!130429 e!105315)))

(assert (=> d!51756 (= res!130429 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!243146 () Bool)

(declare-fun e!105313 () Bool)

(assert (=> d!51756 (= lt!243146 e!105313)))

(declare-fun res!130430 () Bool)

(assert (=> d!51756 (=> (not res!130430) (not e!105313))))

(declare-fun lt!243139 () (_ BitVec 64))

(declare-fun lt!243171 () (_ BitVec 64))

(declare-fun lt!243167 () tuple3!626)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!51756 (= res!130430 (= (bvadd lt!243171 lt!243139) (bitIndex!0 (size!3204 (buf!3707 (_2!7370 lt!243167))) (currentByte!6789 (_2!7370 lt!243167)) (currentBit!6784 (_2!7370 lt!243167)))))))

(assert (=> d!51756 (or (not (= (bvand lt!243171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243139 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243171 lt!243139) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243143 () (_ BitVec 64))

(assert (=> d!51756 (= lt!243139 (bvmul lt!243143 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51756 (or (= lt!243143 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243143 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243143)))))

(assert (=> d!51756 (= lt!243143 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!51756 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!51756 (= lt!243171 (bitIndex!0 (size!3204 (buf!3707 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6789 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6784 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(declare-fun e!105314 () tuple3!626)

(assert (=> d!51756 (= lt!243167 e!105314)))

(declare-fun c!8297 () Bool)

(assert (=> d!51756 (= c!8297 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51756 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3204 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)))))))

(assert (=> d!51756 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!243167)))

(declare-fun b!156007 () Bool)

(declare-fun res!130428 () Bool)

(assert (=> b!156007 (=> (not res!130428) (not e!105313))))

(assert (=> b!156007 (= res!130428 (and (= (buf!3707 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3707 (_2!7370 lt!243167))) (= (size!3204 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153))) (size!3204 (_3!430 lt!243167)))))))

(declare-fun bm!2322 () Bool)

(declare-fun call!2326 () (_ BitVec 64))

(assert (=> bm!2322 (= call!2326 (bitIndex!0 (size!3204 (buf!3707 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6789 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6784 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(declare-fun lt!243159 () Unit!9888)

(declare-fun b!156008 () Bool)

(assert (=> b!156008 (= e!105314 (tuple3!627 lt!243159 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153))))))

(assert (=> b!156008 (= call!2326 call!2326)))

(declare-fun lt!243165 () Unit!9888)

(declare-fun Unit!9893 () Unit!9888)

(assert (=> b!156008 (= lt!243165 Unit!9893)))

(declare-fun lt!243152 () Unit!9888)

(declare-fun arrayRangesEqReflexiveLemma!27 (array!7135) Unit!9888)

(assert (=> b!156008 (= lt!243152 (arrayRangesEqReflexiveLemma!27 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153))))))

(declare-fun call!2327 () Bool)

(assert (=> b!156008 call!2327))

(declare-fun lt!243172 () Unit!9888)

(assert (=> b!156008 (= lt!243172 lt!243152)))

(declare-fun lt!243138 () array!7135)

(assert (=> b!156008 (= lt!243138 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)))))

(declare-fun lt!243157 () array!7135)

(assert (=> b!156008 (= lt!243157 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)))))

(declare-fun lt!243158 () (_ BitVec 32))

(assert (=> b!156008 (= lt!243158 #b00000000000000000000000000000000)))

(declare-fun lt!243161 () (_ BitVec 32))

(assert (=> b!156008 (= lt!243161 (size!3204 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153))))))

(declare-fun lt!243142 () (_ BitVec 32))

(assert (=> b!156008 (= lt!243142 #b00000000000000000000000000000000)))

(declare-fun lt!243169 () (_ BitVec 32))

(assert (=> b!156008 (= lt!243169 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!27 (array!7135 array!7135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9888)

(assert (=> b!156008 (= lt!243159 (arrayRangesEqSlicedLemma!27 lt!243138 lt!243157 lt!243158 lt!243161 lt!243142 lt!243169))))

(declare-fun call!2325 () Bool)

(assert (=> b!156008 call!2325))

(declare-fun bm!2323 () Bool)

(declare-fun lt!243170 () tuple3!626)

(declare-fun arrayRangesEq!416 (array!7135 array!7135 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2323 (= call!2327 (arrayRangesEq!416 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)) (ite c!8297 (_3!430 lt!243170) (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153))) #b00000000000000000000000000000000 (ite c!8297 (bvadd #b00000000000000000000000000000001 from!240) (size!3204 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153))))))))

(declare-fun b!156009 () Bool)

(declare-fun lt!243154 () Unit!9888)

(assert (=> b!156009 (= e!105314 (tuple3!627 lt!243154 (_2!7370 lt!243170) (_3!430 lt!243170)))))

(declare-fun lt!243137 () tuple2!13882)

(assert (=> b!156009 (= lt!243137 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!243150 () array!7135)

(assert (=> b!156009 (= lt!243150 (array!7136 (store (arr!4042 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7372 lt!243137)) (size!3204 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)))))))

(declare-fun lt!243149 () (_ BitVec 64))

(assert (=> b!156009 (= lt!243149 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243166 () (_ BitVec 32))

(assert (=> b!156009 (= lt!243166 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243145 () Unit!9888)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5666 BitStream!5666 (_ BitVec 64) (_ BitVec 32)) Unit!9888)

(assert (=> b!156009 (= lt!243145 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7372 lt!243137) lt!243149 lt!243166))))

(assert (=> b!156009 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3204 (buf!3707 (_2!7372 lt!243137)))) ((_ sign_extend 32) (currentByte!6789 (_2!7372 lt!243137))) ((_ sign_extend 32) (currentBit!6784 (_2!7372 lt!243137))) (bvsub lt!243166 ((_ extract 31 0) (bvsdiv (bvadd lt!243149 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243163 () Unit!9888)

(assert (=> b!156009 (= lt!243163 lt!243145)))

(assert (=> b!156009 (= lt!243170 (readByteArrayLoop!0 (_2!7372 lt!243137) lt!243150 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156009 (= (bitIndex!0 (size!3204 (buf!3707 (_2!7372 lt!243137))) (currentByte!6789 (_2!7372 lt!243137)) (currentBit!6784 (_2!7372 lt!243137))) (bvadd call!2326 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243151 () Unit!9888)

(declare-fun Unit!9894 () Unit!9888)

(assert (=> b!156009 (= lt!243151 Unit!9894)))

(assert (=> b!156009 (= (bvadd (bitIndex!0 (size!3204 (buf!3707 (_2!7372 lt!243137))) (currentByte!6789 (_2!7372 lt!243137)) (currentBit!6784 (_2!7372 lt!243137))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3204 (buf!3707 (_2!7370 lt!243170))) (currentByte!6789 (_2!7370 lt!243170)) (currentBit!6784 (_2!7370 lt!243170))))))

(declare-fun lt!243162 () Unit!9888)

(declare-fun Unit!9895 () Unit!9888)

(assert (=> b!156009 (= lt!243162 Unit!9895)))

(assert (=> b!156009 (= (bvadd call!2326 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3204 (buf!3707 (_2!7370 lt!243170))) (currentByte!6789 (_2!7370 lt!243170)) (currentBit!6784 (_2!7370 lt!243170))))))

(declare-fun lt!243153 () Unit!9888)

(declare-fun Unit!9896 () Unit!9888)

(assert (=> b!156009 (= lt!243153 Unit!9896)))

(assert (=> b!156009 (and (= (buf!3707 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3707 (_2!7370 lt!243170))) (= (size!3204 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153))) (size!3204 (_3!430 lt!243170))))))

(declare-fun lt!243155 () Unit!9888)

(declare-fun Unit!9897 () Unit!9888)

(assert (=> b!156009 (= lt!243155 Unit!9897)))

(declare-fun lt!243168 () Unit!9888)

(declare-fun arrayUpdatedAtPrefixLemma!27 (array!7135 (_ BitVec 32) (_ BitVec 8)) Unit!9888)

(assert (=> b!156009 (= lt!243168 (arrayUpdatedAtPrefixLemma!27 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7372 lt!243137)))))

(assert (=> b!156009 call!2325))

(declare-fun lt!243140 () Unit!9888)

(assert (=> b!156009 (= lt!243140 lt!243168)))

(declare-fun lt!243148 () (_ BitVec 32))

(assert (=> b!156009 (= lt!243148 #b00000000000000000000000000000000)))

(declare-fun lt!243156 () Unit!9888)

(declare-fun arrayRangesEqTransitive!92 (array!7135 array!7135 array!7135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9888)

(assert (=> b!156009 (= lt!243156 (arrayRangesEqTransitive!92 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)) lt!243150 (_3!430 lt!243170) lt!243148 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156009 (arrayRangesEq!416 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)) (_3!430 lt!243170) lt!243148 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!243144 () Unit!9888)

(assert (=> b!156009 (= lt!243144 lt!243156)))

(assert (=> b!156009 call!2327))

(declare-fun lt!243164 () Unit!9888)

(declare-fun Unit!9898 () Unit!9888)

(assert (=> b!156009 (= lt!243164 Unit!9898)))

(declare-fun lt!243147 () Unit!9888)

(declare-fun arrayRangesEqImpliesEq!36 (array!7135 array!7135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9888)

(assert (=> b!156009 (= lt!243147 (arrayRangesEqImpliesEq!36 lt!243150 (_3!430 lt!243170) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156009 (= (select (store (arr!4042 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7372 lt!243137)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4042 (_3!430 lt!243170)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243141 () Unit!9888)

(assert (=> b!156009 (= lt!243141 lt!243147)))

(declare-fun lt!243160 () Bool)

(assert (=> b!156009 (= lt!243160 (= (select (arr!4042 (_3!430 lt!243170)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7372 lt!243137)))))

(declare-fun Unit!9899 () Unit!9888)

(assert (=> b!156009 (= lt!243154 Unit!9899)))

(assert (=> b!156009 lt!243160))

(declare-fun b!156010 () Bool)

(assert (=> b!156010 (= e!105315 (= (select (arr!4042 (_3!430 lt!243167)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7366 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!156010 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3204 (_3!430 lt!243167))))))

(declare-fun b!156011 () Bool)

(assert (=> b!156011 (= e!105313 (arrayRangesEq!416 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)) (_3!430 lt!243167) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun bm!2324 () Bool)

(assert (=> bm!2324 (= call!2325 (arrayRangesEq!416 (ite c!8297 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)) lt!243138) (ite c!8297 (array!7136 (store (arr!4042 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7372 lt!243137)) (size!3204 (array!7136 (store (arr!4042 arr!153) from!240 (_2!7366 (readBytePure!0 bs!65))) (size!3204 arr!153)))) lt!243157) (ite c!8297 #b00000000000000000000000000000000 lt!243142) (ite c!8297 (bvadd #b00000000000000000000000000000001 from!240) lt!243169)))))

(assert (= (and d!51756 c!8297) b!156009))

(assert (= (and d!51756 (not c!8297)) b!156008))

(assert (= (or b!156009 b!156008) bm!2324))

(assert (= (or b!156009 b!156008) bm!2323))

(assert (= (or b!156009 b!156008) bm!2322))

(assert (= (and d!51756 res!130430) b!156007))

(assert (= (and b!156007 res!130428) b!156011))

(assert (= (and d!51756 (not res!130429)) b!156010))

(declare-fun m!242525 () Bool)

(assert (=> bm!2324 m!242525))

(declare-fun m!242527 () Bool)

(assert (=> bm!2324 m!242527))

(declare-fun m!242529 () Bool)

(assert (=> b!156011 m!242529))

(declare-fun m!242531 () Bool)

(assert (=> bm!2322 m!242531))

(declare-fun m!242533 () Bool)

(assert (=> d!51756 m!242533))

(assert (=> d!51756 m!242531))

(declare-fun m!242535 () Bool)

(assert (=> b!156010 m!242535))

(assert (=> b!156010 m!242465))

(declare-fun m!242537 () Bool)

(assert (=> b!156010 m!242537))

(declare-fun m!242539 () Bool)

(assert (=> b!156009 m!242539))

(declare-fun m!242541 () Bool)

(assert (=> b!156009 m!242541))

(declare-fun m!242543 () Bool)

(assert (=> b!156009 m!242543))

(declare-fun m!242545 () Bool)

(assert (=> b!156009 m!242545))

(assert (=> b!156009 m!242525))

(assert (=> b!156009 m!242465))

(declare-fun m!242547 () Bool)

(assert (=> b!156009 m!242547))

(declare-fun m!242549 () Bool)

(assert (=> b!156009 m!242549))

(declare-fun m!242551 () Bool)

(assert (=> b!156009 m!242551))

(declare-fun m!242553 () Bool)

(assert (=> b!156009 m!242553))

(declare-fun m!242555 () Bool)

(assert (=> b!156009 m!242555))

(assert (=> b!156009 m!242465))

(declare-fun m!242557 () Bool)

(assert (=> b!156009 m!242557))

(declare-fun m!242559 () Bool)

(assert (=> b!156009 m!242559))

(declare-fun m!242561 () Bool)

(assert (=> b!156009 m!242561))

(declare-fun m!242563 () Bool)

(assert (=> bm!2323 m!242563))

(declare-fun m!242565 () Bool)

(assert (=> b!156008 m!242565))

(declare-fun m!242567 () Bool)

(assert (=> b!156008 m!242567))

(assert (=> d!51718 d!51756))

(declare-fun d!51768 () Bool)

(declare-fun lt!243263 () (_ BitVec 8))

(declare-fun lt!243262 () (_ BitVec 8))

(assert (=> d!51768 (= lt!243263 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4042 (buf!3707 bs!65)) (currentByte!6789 bs!65))) ((_ sign_extend 24) lt!243262))))))

(assert (=> d!51768 (= lt!243262 ((_ extract 7 0) (currentBit!6784 bs!65)))))

(declare-fun e!105328 () Bool)

(assert (=> d!51768 e!105328))

(declare-fun res!130448 () Bool)

(assert (=> d!51768 (=> (not res!130448) (not e!105328))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51768 (= res!130448 (validate_offset_bits!1 ((_ sign_extend 32) (size!3204 (buf!3707 bs!65))) ((_ sign_extend 32) (currentByte!6789 bs!65)) ((_ sign_extend 32) (currentBit!6784 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13888 0))(
  ( (tuple2!13889 (_1!7376 Unit!9888) (_2!7376 (_ BitVec 8))) )
))
(declare-fun Unit!9906 () Unit!9888)

(declare-fun Unit!9907 () Unit!9888)

(assert (=> d!51768 (= (readByte!0 bs!65) (tuple2!13883 (_2!7376 (ite (bvsgt ((_ sign_extend 24) lt!243262) #b00000000000000000000000000000000) (tuple2!13889 Unit!9906 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!243263) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4042 (buf!3707 bs!65)) (bvadd (currentByte!6789 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!243262)))))))) (tuple2!13889 Unit!9907 lt!243263))) (BitStream!5667 (buf!3707 bs!65) (bvadd (currentByte!6789 bs!65) #b00000000000000000000000000000001) (currentBit!6784 bs!65))))))

(declare-fun b!156032 () Bool)

(declare-fun e!105329 () Bool)

(assert (=> b!156032 (= e!105328 e!105329)))

(declare-fun res!130447 () Bool)

(assert (=> b!156032 (=> (not res!130447) (not e!105329))))

(declare-fun lt!243260 () tuple2!13882)

(assert (=> b!156032 (= res!130447 (= (buf!3707 (_2!7372 lt!243260)) (buf!3707 bs!65)))))

(declare-fun lt!243265 () (_ BitVec 8))

(declare-fun lt!243259 () (_ BitVec 8))

(declare-fun Unit!9909 () Unit!9888)

(declare-fun Unit!9910 () Unit!9888)

(assert (=> b!156032 (= lt!243260 (tuple2!13883 (_2!7376 (ite (bvsgt ((_ sign_extend 24) lt!243259) #b00000000000000000000000000000000) (tuple2!13889 Unit!9909 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!243265) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4042 (buf!3707 bs!65)) (bvadd (currentByte!6789 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!243259)))))))) (tuple2!13889 Unit!9910 lt!243265))) (BitStream!5667 (buf!3707 bs!65) (bvadd (currentByte!6789 bs!65) #b00000000000000000000000000000001) (currentBit!6784 bs!65))))))

(assert (=> b!156032 (= lt!243265 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4042 (buf!3707 bs!65)) (currentByte!6789 bs!65))) ((_ sign_extend 24) lt!243259))))))

(assert (=> b!156032 (= lt!243259 ((_ extract 7 0) (currentBit!6784 bs!65)))))

(declare-fun b!156033 () Bool)

(declare-fun lt!243264 () (_ BitVec 64))

(declare-fun lt!243261 () (_ BitVec 64))

(assert (=> b!156033 (= e!105329 (= (bitIndex!0 (size!3204 (buf!3707 (_2!7372 lt!243260))) (currentByte!6789 (_2!7372 lt!243260)) (currentBit!6784 (_2!7372 lt!243260))) (bvadd lt!243261 lt!243264)))))

(assert (=> b!156033 (or (not (= (bvand lt!243261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243264 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243261 lt!243264) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156033 (= lt!243264 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156033 (= lt!243261 (bitIndex!0 (size!3204 (buf!3707 bs!65)) (currentByte!6789 bs!65) (currentBit!6784 bs!65)))))

(assert (= (and d!51768 res!130448) b!156032))

(assert (= (and b!156032 res!130447) b!156033))

(declare-fun m!242653 () Bool)

(assert (=> d!51768 m!242653))

(declare-fun m!242655 () Bool)

(assert (=> d!51768 m!242655))

(declare-fun m!242657 () Bool)

(assert (=> d!51768 m!242657))

(assert (=> b!156032 m!242657))

(assert (=> b!156032 m!242653))

(declare-fun m!242659 () Bool)

(assert (=> b!156033 m!242659))

(declare-fun m!242661 () Bool)

(assert (=> b!156033 m!242661))

(assert (=> d!51730 d!51768))

(declare-fun d!51778 () Bool)

(declare-fun e!105332 () Bool)

(assert (=> d!51778 e!105332))

(declare-fun res!130450 () Bool)

(assert (=> d!51778 (=> res!130450 e!105332)))

(assert (=> d!51778 (= res!130450 (bvsge from!240 to!236))))

(declare-fun lt!243275 () Bool)

(declare-fun e!105330 () Bool)

(assert (=> d!51778 (= lt!243275 e!105330)))

(declare-fun res!130451 () Bool)

(assert (=> d!51778 (=> (not res!130451) (not e!105330))))

(declare-fun lt!243300 () (_ BitVec 64))

(declare-fun lt!243268 () (_ BitVec 64))

(declare-fun lt!243296 () tuple3!626)

(assert (=> d!51778 (= res!130451 (= (bvadd lt!243300 lt!243268) (bitIndex!0 (size!3204 (buf!3707 (_2!7370 lt!243296))) (currentByte!6789 (_2!7370 lt!243296)) (currentBit!6784 (_2!7370 lt!243296)))))))

(assert (=> d!51778 (or (not (= (bvand lt!243300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243268 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243300 lt!243268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243272 () (_ BitVec 64))

(assert (=> d!51778 (= lt!243268 (bvmul lt!243272 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51778 (or (= lt!243272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243272 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243272)))))

(assert (=> d!51778 (= lt!243272 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51778 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51778 (= lt!243300 (bitIndex!0 (size!3204 (buf!3707 bs!65)) (currentByte!6789 bs!65) (currentBit!6784 bs!65)))))

(declare-fun e!105331 () tuple3!626)

(assert (=> d!51778 (= lt!243296 e!105331)))

(declare-fun c!8300 () Bool)

(assert (=> d!51778 (= c!8300 (bvslt from!240 to!236))))

(assert (=> d!51778 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3204 arr!153)))))

(assert (=> d!51778 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!243296)))

(declare-fun b!156034 () Bool)

(declare-fun res!130449 () Bool)

(assert (=> b!156034 (=> (not res!130449) (not e!105330))))

(assert (=> b!156034 (= res!130449 (and (= (buf!3707 bs!65) (buf!3707 (_2!7370 lt!243296))) (= (size!3204 arr!153) (size!3204 (_3!430 lt!243296)))))))

(declare-fun bm!2331 () Bool)

(declare-fun call!2335 () (_ BitVec 64))

(assert (=> bm!2331 (= call!2335 (bitIndex!0 (size!3204 (buf!3707 bs!65)) (currentByte!6789 bs!65) (currentBit!6784 bs!65)))))

(declare-fun b!156035 () Bool)

(declare-fun lt!243288 () Unit!9888)

(assert (=> b!156035 (= e!105331 (tuple3!627 lt!243288 bs!65 arr!153))))

(assert (=> b!156035 (= call!2335 call!2335)))

(declare-fun lt!243294 () Unit!9888)

(declare-fun Unit!9911 () Unit!9888)

(assert (=> b!156035 (= lt!243294 Unit!9911)))

(declare-fun lt!243281 () Unit!9888)

(assert (=> b!156035 (= lt!243281 (arrayRangesEqReflexiveLemma!27 arr!153))))

(declare-fun call!2336 () Bool)

(assert (=> b!156035 call!2336))

(declare-fun lt!243301 () Unit!9888)

(assert (=> b!156035 (= lt!243301 lt!243281)))

(declare-fun lt!243267 () array!7135)

(assert (=> b!156035 (= lt!243267 arr!153)))

(declare-fun lt!243286 () array!7135)

(assert (=> b!156035 (= lt!243286 arr!153)))

(declare-fun lt!243287 () (_ BitVec 32))

(assert (=> b!156035 (= lt!243287 #b00000000000000000000000000000000)))

(declare-fun lt!243290 () (_ BitVec 32))

(assert (=> b!156035 (= lt!243290 (size!3204 arr!153))))

(declare-fun lt!243271 () (_ BitVec 32))

(assert (=> b!156035 (= lt!243271 #b00000000000000000000000000000000)))

(declare-fun lt!243298 () (_ BitVec 32))

(assert (=> b!156035 (= lt!243298 from!240)))

(assert (=> b!156035 (= lt!243288 (arrayRangesEqSlicedLemma!27 lt!243267 lt!243286 lt!243287 lt!243290 lt!243271 lt!243298))))

(declare-fun call!2334 () Bool)

(assert (=> b!156035 call!2334))

(declare-fun bm!2332 () Bool)

(declare-fun lt!243299 () tuple3!626)

(assert (=> bm!2332 (= call!2336 (arrayRangesEq!416 arr!153 (ite c!8300 (_3!430 lt!243299) arr!153) #b00000000000000000000000000000000 (ite c!8300 from!240 (size!3204 arr!153))))))

(declare-fun b!156036 () Bool)

(declare-fun lt!243283 () Unit!9888)

(assert (=> b!156036 (= e!105331 (tuple3!627 lt!243283 (_2!7370 lt!243299) (_3!430 lt!243299)))))

(declare-fun lt!243266 () tuple2!13882)

(assert (=> b!156036 (= lt!243266 (readByte!0 bs!65))))

(declare-fun lt!243279 () array!7135)

(assert (=> b!156036 (= lt!243279 (array!7136 (store (arr!4042 arr!153) from!240 (_1!7372 lt!243266)) (size!3204 arr!153)))))

(declare-fun lt!243278 () (_ BitVec 64))

(assert (=> b!156036 (= lt!243278 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243295 () (_ BitVec 32))

(assert (=> b!156036 (= lt!243295 (bvsub to!236 from!240))))

(declare-fun lt!243274 () Unit!9888)

(assert (=> b!156036 (= lt!243274 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7372 lt!243266) lt!243278 lt!243295))))

(assert (=> b!156036 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3204 (buf!3707 (_2!7372 lt!243266)))) ((_ sign_extend 32) (currentByte!6789 (_2!7372 lt!243266))) ((_ sign_extend 32) (currentBit!6784 (_2!7372 lt!243266))) (bvsub lt!243295 ((_ extract 31 0) (bvsdiv (bvadd lt!243278 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243292 () Unit!9888)

(assert (=> b!156036 (= lt!243292 lt!243274)))

(assert (=> b!156036 (= lt!243299 (readByteArrayLoop!0 (_2!7372 lt!243266) lt!243279 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156036 (= (bitIndex!0 (size!3204 (buf!3707 (_2!7372 lt!243266))) (currentByte!6789 (_2!7372 lt!243266)) (currentBit!6784 (_2!7372 lt!243266))) (bvadd call!2335 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243280 () Unit!9888)

(declare-fun Unit!9916 () Unit!9888)

(assert (=> b!156036 (= lt!243280 Unit!9916)))

(assert (=> b!156036 (= (bvadd (bitIndex!0 (size!3204 (buf!3707 (_2!7372 lt!243266))) (currentByte!6789 (_2!7372 lt!243266)) (currentBit!6784 (_2!7372 lt!243266))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3204 (buf!3707 (_2!7370 lt!243299))) (currentByte!6789 (_2!7370 lt!243299)) (currentBit!6784 (_2!7370 lt!243299))))))

(declare-fun lt!243291 () Unit!9888)

(declare-fun Unit!9921 () Unit!9888)

(assert (=> b!156036 (= lt!243291 Unit!9921)))

(assert (=> b!156036 (= (bvadd call!2335 (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3204 (buf!3707 (_2!7370 lt!243299))) (currentByte!6789 (_2!7370 lt!243299)) (currentBit!6784 (_2!7370 lt!243299))))))

(declare-fun lt!243282 () Unit!9888)

(declare-fun Unit!9922 () Unit!9888)

(assert (=> b!156036 (= lt!243282 Unit!9922)))

(assert (=> b!156036 (and (= (buf!3707 bs!65) (buf!3707 (_2!7370 lt!243299))) (= (size!3204 arr!153) (size!3204 (_3!430 lt!243299))))))

(declare-fun lt!243284 () Unit!9888)

(declare-fun Unit!9926 () Unit!9888)

(assert (=> b!156036 (= lt!243284 Unit!9926)))

(declare-fun lt!243297 () Unit!9888)

(assert (=> b!156036 (= lt!243297 (arrayUpdatedAtPrefixLemma!27 arr!153 from!240 (_1!7372 lt!243266)))))

(assert (=> b!156036 call!2334))

(declare-fun lt!243269 () Unit!9888)

(assert (=> b!156036 (= lt!243269 lt!243297)))

(declare-fun lt!243277 () (_ BitVec 32))

(assert (=> b!156036 (= lt!243277 #b00000000000000000000000000000000)))

(declare-fun lt!243285 () Unit!9888)

(assert (=> b!156036 (= lt!243285 (arrayRangesEqTransitive!92 arr!153 lt!243279 (_3!430 lt!243299) lt!243277 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156036 (arrayRangesEq!416 arr!153 (_3!430 lt!243299) lt!243277 from!240)))

(declare-fun lt!243273 () Unit!9888)

(assert (=> b!156036 (= lt!243273 lt!243285)))

(assert (=> b!156036 call!2336))

(declare-fun lt!243293 () Unit!9888)

(declare-fun Unit!9928 () Unit!9888)

(assert (=> b!156036 (= lt!243293 Unit!9928)))

(declare-fun lt!243276 () Unit!9888)

(assert (=> b!156036 (= lt!243276 (arrayRangesEqImpliesEq!36 lt!243279 (_3!430 lt!243299) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156036 (= (select (store (arr!4042 arr!153) from!240 (_1!7372 lt!243266)) from!240) (select (arr!4042 (_3!430 lt!243299)) from!240))))

(declare-fun lt!243270 () Unit!9888)

(assert (=> b!156036 (= lt!243270 lt!243276)))

(declare-fun lt!243289 () Bool)

(assert (=> b!156036 (= lt!243289 (= (select (arr!4042 (_3!430 lt!243299)) from!240) (_1!7372 lt!243266)))))

(declare-fun Unit!9929 () Unit!9888)

(assert (=> b!156036 (= lt!243283 Unit!9929)))

(assert (=> b!156036 lt!243289))

(declare-fun b!156037 () Bool)

(assert (=> b!156037 (= e!105332 (= (select (arr!4042 (_3!430 lt!243296)) from!240) (_2!7366 (readBytePure!0 bs!65))))))

(assert (=> b!156037 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3204 (_3!430 lt!243296))))))

(declare-fun b!156038 () Bool)

(assert (=> b!156038 (= e!105330 (arrayRangesEq!416 arr!153 (_3!430 lt!243296) #b00000000000000000000000000000000 from!240))))

(declare-fun bm!2333 () Bool)

(assert (=> bm!2333 (= call!2334 (arrayRangesEq!416 (ite c!8300 arr!153 lt!243267) (ite c!8300 (array!7136 (store (arr!4042 arr!153) from!240 (_1!7372 lt!243266)) (size!3204 arr!153)) lt!243286) (ite c!8300 #b00000000000000000000000000000000 lt!243271) (ite c!8300 from!240 lt!243298)))))

(assert (= (and d!51778 c!8300) b!156036))

(assert (= (and d!51778 (not c!8300)) b!156035))

(assert (= (or b!156036 b!156035) bm!2333))

(assert (= (or b!156036 b!156035) bm!2332))

(assert (= (or b!156036 b!156035) bm!2331))

(assert (= (and d!51778 res!130451) b!156034))

(assert (= (and b!156034 res!130449) b!156038))

(assert (= (and d!51778 (not res!130450)) b!156037))

(declare-fun m!242663 () Bool)

(assert (=> bm!2333 m!242663))

(declare-fun m!242665 () Bool)

(assert (=> bm!2333 m!242665))

(declare-fun m!242667 () Bool)

(assert (=> b!156038 m!242667))

(assert (=> bm!2331 m!242661))

(declare-fun m!242669 () Bool)

(assert (=> d!51778 m!242669))

(assert (=> d!51778 m!242661))

(declare-fun m!242671 () Bool)

(assert (=> b!156037 m!242671))

(assert (=> b!156037 m!242463))

(declare-fun m!242673 () Bool)

(assert (=> b!156036 m!242673))

(declare-fun m!242675 () Bool)

(assert (=> b!156036 m!242675))

(declare-fun m!242677 () Bool)

(assert (=> b!156036 m!242677))

(declare-fun m!242679 () Bool)

(assert (=> b!156036 m!242679))

(assert (=> b!156036 m!242663))

(assert (=> b!156036 m!242493))

(declare-fun m!242681 () Bool)

(assert (=> b!156036 m!242681))

(declare-fun m!242683 () Bool)

(assert (=> b!156036 m!242683))

(declare-fun m!242685 () Bool)

(assert (=> b!156036 m!242685))

(declare-fun m!242687 () Bool)

(assert (=> b!156036 m!242687))

(declare-fun m!242689 () Bool)

(assert (=> b!156036 m!242689))

(declare-fun m!242691 () Bool)

(assert (=> b!156036 m!242691))

(declare-fun m!242693 () Bool)

(assert (=> b!156036 m!242693))

(declare-fun m!242695 () Bool)

(assert (=> bm!2332 m!242695))

(declare-fun m!242697 () Bool)

(assert (=> b!156035 m!242697))

(declare-fun m!242699 () Bool)

(assert (=> b!156035 m!242699))

(assert (=> d!51734 d!51778))

(declare-fun d!51780 () Bool)

(assert (=> d!51780 (= (remainingBits!0 ((_ sign_extend 32) (size!3204 (buf!3707 bs!65))) ((_ sign_extend 32) (currentByte!6789 bs!65)) ((_ sign_extend 32) (currentBit!6784 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3204 (buf!3707 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6789 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6784 bs!65)))))))

(assert (=> d!51736 d!51780))

(declare-fun d!51782 () Bool)

(assert (=> d!51782 (= (invariant!0 (currentBit!6784 bs!65) (currentByte!6789 bs!65) (size!3204 (buf!3707 bs!65))) (and (bvsge (currentBit!6784 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6784 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6789 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6789 bs!65) (size!3204 (buf!3707 bs!65))) (and (= (currentBit!6784 bs!65) #b00000000000000000000000000000000) (= (currentByte!6789 bs!65) (size!3204 (buf!3707 bs!65)))))))))

(assert (=> d!51716 d!51782))

(push 1)

(assert (not b!156038))

(assert (not b!156008))

(assert (not bm!2324))

(assert (not bm!2332))

(assert (not b!156036))

(assert (not b!156009))

(assert (not bm!2331))

(assert (not b!156037))

(assert (not b!156010))

(assert (not b!156011))

(assert (not d!51754))

(assert (not bm!2323))

(assert (not d!51768))

(assert (not b!156033))

(assert (not bm!2333))

(assert (not d!51778))

(assert (not d!51756))

(assert (not bm!2322))

(assert (not b!156035))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

