; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29384 () Bool)

(assert start!29384)

(declare-fun res!127614 () Bool)

(declare-fun e!101758 () Bool)

(assert (=> start!29384 (=> (not res!127614) (not e!101758))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6798 0))(
  ( (array!6799 (arr!3892 (Array (_ BitVec 32) (_ BitVec 8))) (size!3075 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6798)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!29384 (= res!127614 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3075 arr!237))))))

(assert (=> start!29384 e!101758))

(assert (=> start!29384 true))

(declare-fun array_inv!2864 (array!6798) Bool)

(assert (=> start!29384 (array_inv!2864 arr!237)))

(declare-datatypes ((BitStream!5408 0))(
  ( (BitStream!5409 (buf!3572 array!6798) (currentByte!6513 (_ BitVec 32)) (currentBit!6508 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5408)

(declare-fun e!101757 () Bool)

(declare-fun inv!12 (BitStream!5408) Bool)

(assert (=> start!29384 (and (inv!12 thiss!1634) e!101757)))

(declare-fun b!152190 () Bool)

(declare-fun e!101760 () Bool)

(declare-fun e!101759 () Bool)

(assert (=> b!152190 (= e!101760 (not e!101759))))

(declare-fun res!127611 () Bool)

(assert (=> b!152190 (=> res!127611 e!101759)))

(declare-datatypes ((tuple2!13548 0))(
  ( (tuple2!13549 (_1!7149 BitStream!5408) (_2!7149 array!6798)) )
))
(declare-fun lt!238338 () tuple2!13548)

(declare-datatypes ((tuple2!13550 0))(
  ( (tuple2!13551 (_1!7150 BitStream!5408) (_2!7150 BitStream!5408)) )
))
(declare-fun lt!238339 () tuple2!13550)

(assert (=> b!152190 (= res!127611 (or (not (= (size!3075 (_2!7149 lt!238338)) (size!3075 arr!237))) (not (= (_1!7149 lt!238338) (_2!7150 lt!238339)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5408 array!6798 (_ BitVec 32) (_ BitVec 32)) tuple2!13548)

(assert (=> b!152190 (= lt!238338 (readByteArrayLoopPure!0 (_1!7150 lt!238339) arr!237 from!447 to!404))))

(declare-fun lt!238341 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152190 (validate_offset_bits!1 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) ((_ sign_extend 32) (currentByte!6513 thiss!1634)) ((_ sign_extend 32) (currentBit!6508 thiss!1634)) lt!238341)))

(declare-datatypes ((Unit!9665 0))(
  ( (Unit!9666) )
))
(declare-fun lt!238340 () Unit!9665)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5408 array!6798 (_ BitVec 64)) Unit!9665)

(assert (=> b!152190 (= lt!238340 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3572 thiss!1634) lt!238341))))

(declare-fun reader!0 (BitStream!5408 BitStream!5408) tuple2!13550)

(assert (=> b!152190 (= lt!238339 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!152191 () Bool)

(assert (=> b!152191 (= e!101758 (not e!101760))))

(declare-fun res!127612 () Bool)

(assert (=> b!152191 (=> (not res!127612) (not e!101760))))

(declare-fun lt!238337 () (_ BitVec 64))

(assert (=> b!152191 (= res!127612 (= lt!238337 (bvadd lt!238337 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!238341))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152191 (= lt!238337 (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634)))))

(assert (=> b!152191 (= lt!238341 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5408 BitStream!5408) Bool)

(assert (=> b!152191 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!238342 () Unit!9665)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5408) Unit!9665)

(assert (=> b!152191 (= lt!238342 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!152192 () Bool)

(declare-fun res!127610 () Bool)

(assert (=> b!152192 (=> (not res!127610) (not e!101758))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!152192 (= res!127610 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) ((_ sign_extend 32) (currentByte!6513 thiss!1634)) ((_ sign_extend 32) (currentBit!6508 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!152193 () Bool)

(declare-fun res!127613 () Bool)

(assert (=> b!152193 (=> (not res!127613) (not e!101758))))

(assert (=> b!152193 (= res!127613 (bvsge from!447 to!404))))

(declare-fun b!152194 () Bool)

(declare-fun arrayRangesEq!370 (array!6798 array!6798 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152194 (= e!101759 (not (arrayRangesEq!370 arr!237 (_2!7149 lt!238338) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!152195 () Bool)

(assert (=> b!152195 (= e!101757 (array_inv!2864 (buf!3572 thiss!1634)))))

(assert (= (and start!29384 res!127614) b!152192))

(assert (= (and b!152192 res!127610) b!152193))

(assert (= (and b!152193 res!127613) b!152191))

(assert (= (and b!152191 res!127612) b!152190))

(assert (= (and b!152190 (not res!127611)) b!152194))

(assert (= start!29384 b!152195))

(declare-fun m!237913 () Bool)

(assert (=> b!152195 m!237913))

(declare-fun m!237915 () Bool)

(assert (=> start!29384 m!237915))

(declare-fun m!237917 () Bool)

(assert (=> start!29384 m!237917))

(declare-fun m!237919 () Bool)

(assert (=> b!152192 m!237919))

(declare-fun m!237921 () Bool)

(assert (=> b!152194 m!237921))

(declare-fun m!237923 () Bool)

(assert (=> b!152190 m!237923))

(declare-fun m!237925 () Bool)

(assert (=> b!152190 m!237925))

(declare-fun m!237927 () Bool)

(assert (=> b!152190 m!237927))

(declare-fun m!237929 () Bool)

(assert (=> b!152190 m!237929))

(declare-fun m!237931 () Bool)

(assert (=> b!152191 m!237931))

(declare-fun m!237933 () Bool)

(assert (=> b!152191 m!237933))

(declare-fun m!237935 () Bool)

(assert (=> b!152191 m!237935))

(push 1)

(assert (not b!152194))

(assert (not start!29384))

(assert (not b!152190))

(assert (not b!152195))

(assert (not b!152191))

(assert (not b!152192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!49892 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!49892 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) ((_ sign_extend 32) (currentByte!6513 thiss!1634)) ((_ sign_extend 32) (currentBit!6508 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) ((_ sign_extend 32) (currentByte!6513 thiss!1634)) ((_ sign_extend 32) (currentBit!6508 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12200 () Bool)

(assert (= bs!12200 d!49892))

(declare-fun m!237937 () Bool)

(assert (=> bs!12200 m!237937))

(assert (=> b!152192 d!49892))

(declare-fun d!49894 () Bool)

(declare-datatypes ((tuple3!600 0))(
  ( (tuple3!601 (_1!7151 Unit!9665) (_2!7151 BitStream!5408) (_3!375 array!6798)) )
))
(declare-fun lt!238345 () tuple3!600)

(declare-fun readByteArrayLoop!0 (BitStream!5408 array!6798 (_ BitVec 32) (_ BitVec 32)) tuple3!600)

(assert (=> d!49894 (= lt!238345 (readByteArrayLoop!0 (_1!7150 lt!238339) arr!237 from!447 to!404))))

(assert (=> d!49894 (= (readByteArrayLoopPure!0 (_1!7150 lt!238339) arr!237 from!447 to!404) (tuple2!13549 (_2!7151 lt!238345) (_3!375 lt!238345)))))

(declare-fun bs!12201 () Bool)

(assert (= bs!12201 d!49894))

(declare-fun m!237939 () Bool)

(assert (=> bs!12201 m!237939))

(assert (=> b!152190 d!49894))

(declare-fun d!49896 () Bool)

(assert (=> d!49896 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) ((_ sign_extend 32) (currentByte!6513 thiss!1634)) ((_ sign_extend 32) (currentBit!6508 thiss!1634)) lt!238341) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) ((_ sign_extend 32) (currentByte!6513 thiss!1634)) ((_ sign_extend 32) (currentBit!6508 thiss!1634))) lt!238341))))

(declare-fun bs!12202 () Bool)

(assert (= bs!12202 d!49896))

(assert (=> bs!12202 m!237937))

(assert (=> b!152190 d!49896))

(declare-fun d!49898 () Bool)

(assert (=> d!49898 (validate_offset_bits!1 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) ((_ sign_extend 32) (currentByte!6513 thiss!1634)) ((_ sign_extend 32) (currentBit!6508 thiss!1634)) lt!238341)))

(declare-fun lt!238348 () Unit!9665)

(declare-fun choose!9 (BitStream!5408 array!6798 (_ BitVec 64) BitStream!5408) Unit!9665)

(assert (=> d!49898 (= lt!238348 (choose!9 thiss!1634 (buf!3572 thiss!1634) lt!238341 (BitStream!5409 (buf!3572 thiss!1634) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634))))))

(assert (=> d!49898 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3572 thiss!1634) lt!238341) lt!238348)))

(declare-fun bs!12203 () Bool)

(assert (= bs!12203 d!49898))

(assert (=> bs!12203 m!237925))

(declare-fun m!237941 () Bool)

(assert (=> bs!12203 m!237941))

(assert (=> b!152190 d!49898))

(declare-fun b!152218 () Bool)

(declare-fun e!101778 () Unit!9665)

(declare-fun lt!238410 () Unit!9665)

(assert (=> b!152218 (= e!101778 lt!238410)))

(declare-fun lt!238402 () (_ BitVec 64))

(assert (=> b!152218 (= lt!238402 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!238411 () (_ BitVec 64))

(assert (=> b!152218 (= lt!238411 (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6798 array!6798 (_ BitVec 64) (_ BitVec 64)) Unit!9665)

(assert (=> b!152218 (= lt!238410 (arrayBitRangesEqSymmetric!0 (buf!3572 thiss!1634) (buf!3572 thiss!1634) lt!238402 lt!238411))))

(declare-fun arrayBitRangesEq!0 (array!6798 array!6798 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152218 (arrayBitRangesEq!0 (buf!3572 thiss!1634) (buf!3572 thiss!1634) lt!238402 lt!238411)))

(declare-fun lt!238396 () tuple2!13550)

(declare-fun e!101777 () Bool)

(declare-fun lt!238399 () (_ BitVec 64))

(declare-fun lt!238409 () (_ BitVec 64))

(declare-fun b!152219 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5408 (_ BitVec 64)) BitStream!5408)

(assert (=> b!152219 (= e!101777 (= (_1!7150 lt!238396) (withMovedBitIndex!0 (_2!7150 lt!238396) (bvsub lt!238409 lt!238399))))))

(assert (=> b!152219 (or (= (bvand lt!238409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238399 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238409 lt!238399) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!152219 (= lt!238399 (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634)))))

(assert (=> b!152219 (= lt!238409 (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634)))))

(declare-fun b!152220 () Bool)

(declare-fun res!127634 () Bool)

(assert (=> b!152220 (=> (not res!127634) (not e!101777))))

(assert (=> b!152220 (= res!127634 (isPrefixOf!0 (_2!7150 lt!238396) thiss!1634))))

(declare-fun d!49900 () Bool)

(assert (=> d!49900 e!101777))

(declare-fun res!127635 () Bool)

(assert (=> d!49900 (=> (not res!127635) (not e!101777))))

(assert (=> d!49900 (= res!127635 (isPrefixOf!0 (_1!7150 lt!238396) (_2!7150 lt!238396)))))

(declare-fun lt!238398 () BitStream!5408)

(assert (=> d!49900 (= lt!238396 (tuple2!13551 lt!238398 thiss!1634))))

(declare-fun lt!238400 () Unit!9665)

(declare-fun lt!238403 () Unit!9665)

(assert (=> d!49900 (= lt!238400 lt!238403)))

(assert (=> d!49900 (isPrefixOf!0 lt!238398 thiss!1634)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5408 BitStream!5408 BitStream!5408) Unit!9665)

(assert (=> d!49900 (= lt!238403 (lemmaIsPrefixTransitive!0 lt!238398 thiss!1634 thiss!1634))))

(declare-fun lt!238408 () Unit!9665)

(declare-fun lt!238406 () Unit!9665)

(assert (=> d!49900 (= lt!238408 lt!238406)))

(assert (=> d!49900 (isPrefixOf!0 lt!238398 thiss!1634)))

(assert (=> d!49900 (= lt!238406 (lemmaIsPrefixTransitive!0 lt!238398 thiss!1634 thiss!1634))))

(declare-fun lt!238404 () Unit!9665)

(assert (=> d!49900 (= lt!238404 e!101778)))

(declare-fun c!8130 () Bool)

(assert (=> d!49900 (= c!8130 (not (= (size!3075 (buf!3572 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!238407 () Unit!9665)

(declare-fun lt!238395 () Unit!9665)

(assert (=> d!49900 (= lt!238407 lt!238395)))

(assert (=> d!49900 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49900 (= lt!238395 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238401 () Unit!9665)

(declare-fun lt!238412 () Unit!9665)

(assert (=> d!49900 (= lt!238401 lt!238412)))

(assert (=> d!49900 (= lt!238412 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238413 () Unit!9665)

(declare-fun lt!238397 () Unit!9665)

(assert (=> d!49900 (= lt!238413 lt!238397)))

(assert (=> d!49900 (isPrefixOf!0 lt!238398 lt!238398)))

(assert (=> d!49900 (= lt!238397 (lemmaIsPrefixRefl!0 lt!238398))))

(declare-fun lt!238405 () Unit!9665)

(declare-fun lt!238414 () Unit!9665)

(assert (=> d!49900 (= lt!238405 lt!238414)))

(assert (=> d!49900 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49900 (= lt!238414 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49900 (= lt!238398 (BitStream!5409 (buf!3572 thiss!1634) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634)))))

(assert (=> d!49900 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49900 (= (reader!0 thiss!1634 thiss!1634) lt!238396)))

(declare-fun b!152221 () Bool)

(declare-fun res!127633 () Bool)

(assert (=> b!152221 (=> (not res!127633) (not e!101777))))

(assert (=> b!152221 (= res!127633 (isPrefixOf!0 (_1!7150 lt!238396) thiss!1634))))

(declare-fun b!152222 () Bool)

(declare-fun Unit!9667 () Unit!9665)

(assert (=> b!152222 (= e!101778 Unit!9667)))

(assert (= (and d!49900 c!8130) b!152218))

(assert (= (and d!49900 (not c!8130)) b!152222))

(assert (= (and d!49900 res!127635) b!152221))

(assert (= (and b!152221 res!127633) b!152220))

(assert (= (and b!152220 res!127634) b!152219))

(declare-fun m!237963 () Bool)

(assert (=> b!152219 m!237963))

(assert (=> b!152219 m!237931))

(assert (=> b!152219 m!237931))

(declare-fun m!237965 () Bool)

(assert (=> b!152221 m!237965))

(assert (=> b!152218 m!237931))

(declare-fun m!237967 () Bool)

(assert (=> b!152218 m!237967))

(declare-fun m!237969 () Bool)

(assert (=> b!152218 m!237969))

(declare-fun m!237971 () Bool)

(assert (=> b!152220 m!237971))

(declare-fun m!237973 () Bool)

(assert (=> d!49900 m!237973))

(declare-fun m!237975 () Bool)

(assert (=> d!49900 m!237975))

(assert (=> d!49900 m!237933))

(declare-fun m!237977 () Bool)

(assert (=> d!49900 m!237977))

(assert (=> d!49900 m!237935))

(assert (=> d!49900 m!237935))

(assert (=> d!49900 m!237973))

(assert (=> d!49900 m!237933))

(declare-fun m!237979 () Bool)

(assert (=> d!49900 m!237979))

(assert (=> d!49900 m!237933))

(declare-fun m!237981 () Bool)

(assert (=> d!49900 m!237981))

(assert (=> b!152190 d!49900))

(declare-fun d!49920 () Bool)

(assert (=> d!49920 (= (array_inv!2864 arr!237) (bvsge (size!3075 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!29384 d!49920))

(declare-fun d!49922 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!49922 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6508 thiss!1634) (currentByte!6513 thiss!1634) (size!3075 (buf!3572 thiss!1634))))))

(declare-fun bs!12209 () Bool)

(assert (= bs!12209 d!49922))

(declare-fun m!237985 () Bool)

(assert (=> bs!12209 m!237985))

(assert (=> start!29384 d!49922))

(declare-fun d!49926 () Bool)

(declare-fun e!101781 () Bool)

(assert (=> d!49926 e!101781))

(declare-fun res!127641 () Bool)

(assert (=> d!49926 (=> (not res!127641) (not e!101781))))

(declare-fun lt!238431 () (_ BitVec 64))

(declare-fun lt!238430 () (_ BitVec 64))

(declare-fun lt!238435 () (_ BitVec 64))

(assert (=> d!49926 (= res!127641 (= lt!238430 (bvsub lt!238435 lt!238431)))))

(assert (=> d!49926 (or (= (bvand lt!238435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238431 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238435 lt!238431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49926 (= lt!238431 (remainingBits!0 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) ((_ sign_extend 32) (currentByte!6513 thiss!1634)) ((_ sign_extend 32) (currentBit!6508 thiss!1634))))))

(declare-fun lt!238432 () (_ BitVec 64))

(declare-fun lt!238433 () (_ BitVec 64))

(assert (=> d!49926 (= lt!238435 (bvmul lt!238432 lt!238433))))

(assert (=> d!49926 (or (= lt!238432 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!238433 (bvsdiv (bvmul lt!238432 lt!238433) lt!238432)))))

(assert (=> d!49926 (= lt!238433 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49926 (= lt!238432 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))))))

(assert (=> d!49926 (= lt!238430 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6513 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6508 thiss!1634))))))

(assert (=> d!49926 (invariant!0 (currentBit!6508 thiss!1634) (currentByte!6513 thiss!1634) (size!3075 (buf!3572 thiss!1634)))))

(assert (=> d!49926 (= (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634)) lt!238430)))

(declare-fun b!152227 () Bool)

(declare-fun res!127640 () Bool)

(assert (=> b!152227 (=> (not res!127640) (not e!101781))))

(assert (=> b!152227 (= res!127640 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!238430))))

(declare-fun b!152228 () Bool)

(declare-fun lt!238434 () (_ BitVec 64))

(assert (=> b!152228 (= e!101781 (bvsle lt!238430 (bvmul lt!238434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152228 (or (= lt!238434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!238434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!238434)))))

(assert (=> b!152228 (= lt!238434 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))))))

(assert (= (and d!49926 res!127641) b!152227))

(assert (= (and b!152227 res!127640) b!152228))

(assert (=> d!49926 m!237937))

(assert (=> d!49926 m!237985))

(assert (=> b!152191 d!49926))

(declare-fun d!49932 () Bool)

(declare-fun res!127648 () Bool)

(declare-fun e!101788 () Bool)

(assert (=> d!49932 (=> (not res!127648) (not e!101788))))

(assert (=> d!49932 (= res!127648 (= (size!3075 (buf!3572 thiss!1634)) (size!3075 (buf!3572 thiss!1634))))))

(assert (=> d!49932 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!101788)))

(declare-fun b!152239 () Bool)

(declare-fun res!127650 () Bool)

(assert (=> b!152239 (=> (not res!127650) (not e!101788))))

(assert (=> b!152239 (= res!127650 (bvsle (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634)) (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634))))))

(declare-fun b!152240 () Bool)

(declare-fun e!101789 () Bool)

(assert (=> b!152240 (= e!101788 e!101789)))

(declare-fun res!127649 () Bool)

(assert (=> b!152240 (=> res!127649 e!101789)))

(assert (=> b!152240 (= res!127649 (= (size!3075 (buf!3572 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!152241 () Bool)

(assert (=> b!152241 (= e!101789 (arrayBitRangesEq!0 (buf!3572 thiss!1634) (buf!3572 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634))))))

(assert (= (and d!49932 res!127648) b!152239))

(assert (= (and b!152239 res!127650) b!152240))

(assert (= (and b!152240 (not res!127649)) b!152241))

(assert (=> b!152239 m!237931))

(assert (=> b!152239 m!237931))

(assert (=> b!152241 m!237931))

(assert (=> b!152241 m!237931))

(declare-fun m!237991 () Bool)

(assert (=> b!152241 m!237991))

(assert (=> b!152191 d!49932))

(declare-fun d!49936 () Bool)

(assert (=> d!49936 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!238481 () Unit!9665)

(declare-fun choose!11 (BitStream!5408) Unit!9665)

(assert (=> d!49936 (= lt!238481 (choose!11 thiss!1634))))

(assert (=> d!49936 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!238481)))

(declare-fun bs!12214 () Bool)

(assert (= bs!12214 d!49936))

(assert (=> bs!12214 m!237933))

(declare-fun m!237993 () Bool)

(assert (=> bs!12214 m!237993))

(assert (=> b!152191 d!49936))

(declare-fun d!49938 () Bool)

(declare-fun res!127664 () Bool)

(declare-fun e!101798 () Bool)

(assert (=> d!49938 (=> res!127664 e!101798)))

(assert (=> d!49938 (= res!127664 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49938 (= (arrayRangesEq!370 arr!237 (_2!7149 lt!238338) #b00000000000000000000000000000000 to!404) e!101798)))

(declare-fun b!152257 () Bool)

(declare-fun e!101799 () Bool)

(assert (=> b!152257 (= e!101798 e!101799)))

(declare-fun res!127665 () Bool)

(assert (=> b!152257 (=> (not res!127665) (not e!101799))))

(assert (=> b!152257 (= res!127665 (= (select (arr!3892 arr!237) #b00000000000000000000000000000000) (select (arr!3892 (_2!7149 lt!238338)) #b00000000000000000000000000000000)))))

(declare-fun b!152258 () Bool)

(assert (=> b!152258 (= e!101799 (arrayRangesEq!370 arr!237 (_2!7149 lt!238338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49938 (not res!127664)) b!152257))

(assert (= (and b!152257 res!127665) b!152258))

(declare-fun m!237995 () Bool)

(assert (=> b!152257 m!237995))

(declare-fun m!237997 () Bool)

(assert (=> b!152257 m!237997))

(declare-fun m!237999 () Bool)

(assert (=> b!152258 m!237999))

(assert (=> b!152194 d!49938))

(declare-fun d!49940 () Bool)

(assert (=> d!49940 (= (array_inv!2864 (buf!3572 thiss!1634)) (bvsge (size!3075 (buf!3572 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!152195 d!49940))

(push 1)

(assert (not d!49936))

(assert (not d!49900))

(assert (not b!152239))

(assert (not d!49926))

(assert (not d!49896))

(assert (not d!49898))

(assert (not b!152221))

(assert (not d!49922))

(assert (not d!49892))

(assert (not b!152220))

(assert (not d!49894))

(assert (not b!152241))

(assert (not b!152218))

(assert (not b!152219))

(assert (not b!152258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!49936 d!49932))

(declare-fun d!49974 () Bool)

(assert (=> d!49974 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49974 true))

(declare-fun _$14!271 () Unit!9665)

(assert (=> d!49974 (= (choose!11 thiss!1634) _$14!271)))

(declare-fun bs!12224 () Bool)

(assert (= bs!12224 d!49974))

(assert (=> bs!12224 m!237933))

(assert (=> d!49936 d!49974))

(assert (=> b!152239 d!49926))

(assert (=> b!152218 d!49926))

(declare-fun d!49976 () Bool)

(assert (=> d!49976 (arrayBitRangesEq!0 (buf!3572 thiss!1634) (buf!3572 thiss!1634) lt!238402 lt!238411)))

(declare-fun lt!238676 () Unit!9665)

(declare-fun choose!8 (array!6798 array!6798 (_ BitVec 64) (_ BitVec 64)) Unit!9665)

(assert (=> d!49976 (= lt!238676 (choose!8 (buf!3572 thiss!1634) (buf!3572 thiss!1634) lt!238402 lt!238411))))

(assert (=> d!49976 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!238402) (bvsle lt!238402 lt!238411))))

(assert (=> d!49976 (= (arrayBitRangesEqSymmetric!0 (buf!3572 thiss!1634) (buf!3572 thiss!1634) lt!238402 lt!238411) lt!238676)))

(declare-fun bs!12225 () Bool)

(assert (= bs!12225 d!49976))

(assert (=> bs!12225 m!237969))

(declare-fun m!238061 () Bool)

(assert (=> bs!12225 m!238061))

(assert (=> b!152218 d!49976))

(declare-fun b!152339 () Bool)

(declare-fun e!101854 () Bool)

(declare-fun e!101853 () Bool)

(assert (=> b!152339 (= e!101854 e!101853)))

(declare-fun res!127732 () Bool)

(assert (=> b!152339 (=> (not res!127732) (not e!101853))))

(declare-fun e!101851 () Bool)

(assert (=> b!152339 (= res!127732 e!101851)))

(declare-fun res!127731 () Bool)

(assert (=> b!152339 (=> res!127731 e!101851)))

(declare-datatypes ((tuple4!152 0))(
  ( (tuple4!153 (_1!7158 (_ BitVec 32)) (_2!7158 (_ BitVec 32)) (_3!379 (_ BitVec 32)) (_4!76 (_ BitVec 32))) )
))
(declare-fun lt!238729 () tuple4!152)

(assert (=> b!152339 (= res!127731 (bvsge (_1!7158 lt!238729) (_2!7158 lt!238729)))))

(declare-fun lt!238727 () (_ BitVec 32))

(assert (=> b!152339 (= lt!238727 ((_ extract 31 0) (bvsrem lt!238411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!238728 () (_ BitVec 32))

(assert (=> b!152339 (= lt!238728 ((_ extract 31 0) (bvsrem lt!238402 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!152)

(assert (=> b!152339 (= lt!238729 (arrayBitIndices!0 lt!238402 lt!238411))))

(declare-fun b!152340 () Bool)

(declare-fun res!127733 () Bool)

(assert (=> b!152340 (= res!127733 (= lt!238727 #b00000000000000000000000000000000))))

(declare-fun e!101852 () Bool)

(assert (=> b!152340 (=> res!127733 e!101852)))

(declare-fun e!101850 () Bool)

(assert (=> b!152340 (= e!101850 e!101852)))

(declare-fun call!2114 () Bool)

(declare-fun bm!2111 () Bool)

(declare-fun c!8142 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2111 (= call!2114 (byteRangesEq!0 (select (arr!3892 (buf!3572 thiss!1634)) (_3!379 lt!238729)) (select (arr!3892 (buf!3572 thiss!1634)) (_3!379 lt!238729)) lt!238728 (ite c!8142 lt!238727 #b00000000000000000000000000001000)))))

(declare-fun b!152341 () Bool)

(declare-fun e!101855 () Bool)

(assert (=> b!152341 (= e!101855 e!101850)))

(declare-fun res!127734 () Bool)

(assert (=> b!152341 (= res!127734 call!2114)))

(assert (=> b!152341 (=> (not res!127734) (not e!101850))))

(declare-fun b!152342 () Bool)

(assert (=> b!152342 (= e!101855 call!2114)))

(declare-fun b!152344 () Bool)

(assert (=> b!152344 (= e!101853 e!101855)))

(assert (=> b!152344 (= c!8142 (= (_3!379 lt!238729) (_4!76 lt!238729)))))

(declare-fun b!152345 () Bool)

(assert (=> b!152345 (= e!101852 (byteRangesEq!0 (select (arr!3892 (buf!3572 thiss!1634)) (_4!76 lt!238729)) (select (arr!3892 (buf!3572 thiss!1634)) (_4!76 lt!238729)) #b00000000000000000000000000000000 lt!238727))))

(declare-fun d!49978 () Bool)

(declare-fun res!127730 () Bool)

(assert (=> d!49978 (=> res!127730 e!101854)))

(assert (=> d!49978 (= res!127730 (bvsge lt!238402 lt!238411))))

(assert (=> d!49978 (= (arrayBitRangesEq!0 (buf!3572 thiss!1634) (buf!3572 thiss!1634) lt!238402 lt!238411) e!101854)))

(declare-fun b!152343 () Bool)

(assert (=> b!152343 (= e!101851 (arrayRangesEq!370 (buf!3572 thiss!1634) (buf!3572 thiss!1634) (_1!7158 lt!238729) (_2!7158 lt!238729)))))

(assert (= (and d!49978 (not res!127730)) b!152339))

(assert (= (and b!152339 (not res!127731)) b!152343))

(assert (= (and b!152339 res!127732) b!152344))

(assert (= (and b!152344 c!8142) b!152342))

(assert (= (and b!152344 (not c!8142)) b!152341))

(assert (= (and b!152341 res!127734) b!152340))

(assert (= (and b!152340 (not res!127733)) b!152345))

(assert (= (or b!152342 b!152341) bm!2111))

(declare-fun m!238107 () Bool)

(assert (=> b!152339 m!238107))

(declare-fun m!238109 () Bool)

(assert (=> bm!2111 m!238109))

(assert (=> bm!2111 m!238109))

(assert (=> bm!2111 m!238109))

(assert (=> bm!2111 m!238109))

(declare-fun m!238111 () Bool)

(assert (=> bm!2111 m!238111))

(declare-fun m!238113 () Bool)

(assert (=> b!152345 m!238113))

(assert (=> b!152345 m!238113))

(assert (=> b!152345 m!238113))

(assert (=> b!152345 m!238113))

(declare-fun m!238115 () Bool)

(assert (=> b!152345 m!238115))

(declare-fun m!238117 () Bool)

(assert (=> b!152343 m!238117))

(assert (=> b!152218 d!49978))

(declare-fun d!49984 () Bool)

(assert (=> d!49984 (= (remainingBits!0 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) ((_ sign_extend 32) (currentByte!6513 thiss!1634)) ((_ sign_extend 32) (currentBit!6508 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6513 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6508 thiss!1634)))))))

(assert (=> d!49896 d!49984))

(assert (=> d!49898 d!49896))

(declare-fun d!49988 () Bool)

(assert (=> d!49988 (validate_offset_bits!1 ((_ sign_extend 32) (size!3075 (buf!3572 thiss!1634))) ((_ sign_extend 32) (currentByte!6513 thiss!1634)) ((_ sign_extend 32) (currentBit!6508 thiss!1634)) lt!238341)))

(assert (=> d!49988 true))

(declare-fun _$6!348 () Unit!9665)

(assert (=> d!49988 (= (choose!9 thiss!1634 (buf!3572 thiss!1634) lt!238341 (BitStream!5409 (buf!3572 thiss!1634) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634))) _$6!348)))

(declare-fun bs!12227 () Bool)

(assert (= bs!12227 d!49988))

(assert (=> bs!12227 m!237925))

(assert (=> d!49898 d!49988))

(declare-fun d!49992 () Bool)

(declare-fun res!127737 () Bool)

(declare-fun e!101858 () Bool)

(assert (=> d!49992 (=> (not res!127737) (not e!101858))))

(assert (=> d!49992 (= res!127737 (= (size!3075 (buf!3572 (_1!7150 lt!238396))) (size!3075 (buf!3572 thiss!1634))))))

(assert (=> d!49992 (= (isPrefixOf!0 (_1!7150 lt!238396) thiss!1634) e!101858)))

(declare-fun b!152348 () Bool)

(declare-fun res!127739 () Bool)

(assert (=> b!152348 (=> (not res!127739) (not e!101858))))

(assert (=> b!152348 (= res!127739 (bvsle (bitIndex!0 (size!3075 (buf!3572 (_1!7150 lt!238396))) (currentByte!6513 (_1!7150 lt!238396)) (currentBit!6508 (_1!7150 lt!238396))) (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634))))))

(declare-fun b!152349 () Bool)

(declare-fun e!101859 () Bool)

(assert (=> b!152349 (= e!101858 e!101859)))

(declare-fun res!127738 () Bool)

(assert (=> b!152349 (=> res!127738 e!101859)))

(assert (=> b!152349 (= res!127738 (= (size!3075 (buf!3572 (_1!7150 lt!238396))) #b00000000000000000000000000000000))))

(declare-fun b!152350 () Bool)

(assert (=> b!152350 (= e!101859 (arrayBitRangesEq!0 (buf!3572 (_1!7150 lt!238396)) (buf!3572 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3075 (buf!3572 (_1!7150 lt!238396))) (currentByte!6513 (_1!7150 lt!238396)) (currentBit!6508 (_1!7150 lt!238396)))))))

(assert (= (and d!49992 res!127737) b!152348))

(assert (= (and b!152348 res!127739) b!152349))

(assert (= (and b!152349 (not res!127738)) b!152350))

(declare-fun m!238125 () Bool)

(assert (=> b!152348 m!238125))

(assert (=> b!152348 m!237931))

(assert (=> b!152350 m!238125))

(assert (=> b!152350 m!238125))

(declare-fun m!238127 () Bool)

(assert (=> b!152350 m!238127))

(assert (=> b!152221 d!49992))

(declare-fun d!49994 () Bool)

(declare-fun e!101862 () Bool)

(assert (=> d!49994 e!101862))

(declare-fun res!127742 () Bool)

(assert (=> d!49994 (=> (not res!127742) (not e!101862))))

(declare-fun lt!238735 () (_ BitVec 64))

(declare-fun lt!238734 () BitStream!5408)

(assert (=> d!49994 (= res!127742 (= (bvadd lt!238735 (bvsub lt!238409 lt!238399)) (bitIndex!0 (size!3075 (buf!3572 lt!238734)) (currentByte!6513 lt!238734) (currentBit!6508 lt!238734))))))

(assert (=> d!49994 (or (not (= (bvand lt!238735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238409 lt!238399) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!238735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!238735 (bvsub lt!238409 lt!238399)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49994 (= lt!238735 (bitIndex!0 (size!3075 (buf!3572 (_2!7150 lt!238396))) (currentByte!6513 (_2!7150 lt!238396)) (currentBit!6508 (_2!7150 lt!238396))))))

(declare-datatypes ((tuple2!13558 0))(
  ( (tuple2!13559 (_1!7159 Unit!9665) (_2!7159 BitStream!5408)) )
))
(declare-fun moveBitIndex!0 (BitStream!5408 (_ BitVec 64)) tuple2!13558)

(assert (=> d!49994 (= lt!238734 (_2!7159 (moveBitIndex!0 (_2!7150 lt!238396) (bvsub lt!238409 lt!238399))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5408 (_ BitVec 64)) Bool)

(assert (=> d!49994 (moveBitIndexPrecond!0 (_2!7150 lt!238396) (bvsub lt!238409 lt!238399))))

(assert (=> d!49994 (= (withMovedBitIndex!0 (_2!7150 lt!238396) (bvsub lt!238409 lt!238399)) lt!238734)))

(declare-fun b!152353 () Bool)

(assert (=> b!152353 (= e!101862 (= (size!3075 (buf!3572 (_2!7150 lt!238396))) (size!3075 (buf!3572 lt!238734))))))

(assert (= (and d!49994 res!127742) b!152353))

(declare-fun m!238129 () Bool)

(assert (=> d!49994 m!238129))

(declare-fun m!238131 () Bool)

(assert (=> d!49994 m!238131))

(declare-fun m!238133 () Bool)

(assert (=> d!49994 m!238133))

(declare-fun m!238135 () Bool)

(assert (=> d!49994 m!238135))

(assert (=> b!152219 d!49994))

(assert (=> b!152219 d!49926))

(declare-fun d!49996 () Bool)

(declare-fun res!127743 () Bool)

(declare-fun e!101863 () Bool)

(assert (=> d!49996 (=> (not res!127743) (not e!101863))))

(assert (=> d!49996 (= res!127743 (= (size!3075 (buf!3572 lt!238398)) (size!3075 (buf!3572 thiss!1634))))))

(assert (=> d!49996 (= (isPrefixOf!0 lt!238398 thiss!1634) e!101863)))

(declare-fun b!152354 () Bool)

(declare-fun res!127745 () Bool)

(assert (=> b!152354 (=> (not res!127745) (not e!101863))))

(assert (=> b!152354 (= res!127745 (bvsle (bitIndex!0 (size!3075 (buf!3572 lt!238398)) (currentByte!6513 lt!238398) (currentBit!6508 lt!238398)) (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634))))))

(declare-fun b!152355 () Bool)

(declare-fun e!101864 () Bool)

(assert (=> b!152355 (= e!101863 e!101864)))

(declare-fun res!127744 () Bool)

(assert (=> b!152355 (=> res!127744 e!101864)))

(assert (=> b!152355 (= res!127744 (= (size!3075 (buf!3572 lt!238398)) #b00000000000000000000000000000000))))

(declare-fun b!152356 () Bool)

(assert (=> b!152356 (= e!101864 (arrayBitRangesEq!0 (buf!3572 lt!238398) (buf!3572 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3075 (buf!3572 lt!238398)) (currentByte!6513 lt!238398) (currentBit!6508 lt!238398))))))

(assert (= (and d!49996 res!127743) b!152354))

(assert (= (and b!152354 res!127745) b!152355))

(assert (= (and b!152355 (not res!127744)) b!152356))

(declare-fun m!238137 () Bool)

(assert (=> b!152354 m!238137))

(assert (=> b!152354 m!237931))

(assert (=> b!152356 m!238137))

(assert (=> b!152356 m!238137))

(declare-fun m!238139 () Bool)

(assert (=> b!152356 m!238139))

(assert (=> d!49900 d!49996))

(declare-fun d!49998 () Bool)

(declare-fun res!127748 () Bool)

(declare-fun e!101867 () Bool)

(assert (=> d!49998 (=> (not res!127748) (not e!101867))))

(assert (=> d!49998 (= res!127748 (= (size!3075 (buf!3572 lt!238398)) (size!3075 (buf!3572 lt!238398))))))

(assert (=> d!49998 (= (isPrefixOf!0 lt!238398 lt!238398) e!101867)))

(declare-fun b!152359 () Bool)

(declare-fun res!127750 () Bool)

(assert (=> b!152359 (=> (not res!127750) (not e!101867))))

(assert (=> b!152359 (= res!127750 (bvsle (bitIndex!0 (size!3075 (buf!3572 lt!238398)) (currentByte!6513 lt!238398) (currentBit!6508 lt!238398)) (bitIndex!0 (size!3075 (buf!3572 lt!238398)) (currentByte!6513 lt!238398) (currentBit!6508 lt!238398))))))

(declare-fun b!152360 () Bool)

(declare-fun e!101868 () Bool)

(assert (=> b!152360 (= e!101867 e!101868)))

(declare-fun res!127749 () Bool)

(assert (=> b!152360 (=> res!127749 e!101868)))

(assert (=> b!152360 (= res!127749 (= (size!3075 (buf!3572 lt!238398)) #b00000000000000000000000000000000))))

(declare-fun b!152361 () Bool)

(assert (=> b!152361 (= e!101868 (arrayBitRangesEq!0 (buf!3572 lt!238398) (buf!3572 lt!238398) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3075 (buf!3572 lt!238398)) (currentByte!6513 lt!238398) (currentBit!6508 lt!238398))))))

(assert (= (and d!49998 res!127748) b!152359))

(assert (= (and b!152359 res!127750) b!152360))

(assert (= (and b!152360 (not res!127749)) b!152361))

(assert (=> b!152359 m!238137))

(assert (=> b!152359 m!238137))

(assert (=> b!152361 m!238137))

(assert (=> b!152361 m!238137))

(declare-fun m!238141 () Bool)

(assert (=> b!152361 m!238141))

(assert (=> d!49900 d!49998))

(declare-fun d!50000 () Bool)

(declare-fun res!127755 () Bool)

(declare-fun e!101875 () Bool)

(assert (=> d!50000 (=> (not res!127755) (not e!101875))))

(assert (=> d!50000 (= res!127755 (= (size!3075 (buf!3572 (_1!7150 lt!238396))) (size!3075 (buf!3572 (_2!7150 lt!238396)))))))

(assert (=> d!50000 (= (isPrefixOf!0 (_1!7150 lt!238396) (_2!7150 lt!238396)) e!101875)))

(declare-fun b!152370 () Bool)

(declare-fun res!127757 () Bool)

(assert (=> b!152370 (=> (not res!127757) (not e!101875))))

(assert (=> b!152370 (= res!127757 (bvsle (bitIndex!0 (size!3075 (buf!3572 (_1!7150 lt!238396))) (currentByte!6513 (_1!7150 lt!238396)) (currentBit!6508 (_1!7150 lt!238396))) (bitIndex!0 (size!3075 (buf!3572 (_2!7150 lt!238396))) (currentByte!6513 (_2!7150 lt!238396)) (currentBit!6508 (_2!7150 lt!238396)))))))

(declare-fun b!152371 () Bool)

(declare-fun e!101876 () Bool)

(assert (=> b!152371 (= e!101875 e!101876)))

(declare-fun res!127756 () Bool)

(assert (=> b!152371 (=> res!127756 e!101876)))

(assert (=> b!152371 (= res!127756 (= (size!3075 (buf!3572 (_1!7150 lt!238396))) #b00000000000000000000000000000000))))

(declare-fun b!152372 () Bool)

(assert (=> b!152372 (= e!101876 (arrayBitRangesEq!0 (buf!3572 (_1!7150 lt!238396)) (buf!3572 (_2!7150 lt!238396)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3075 (buf!3572 (_1!7150 lt!238396))) (currentByte!6513 (_1!7150 lt!238396)) (currentBit!6508 (_1!7150 lt!238396)))))))

(assert (= (and d!50000 res!127755) b!152370))

(assert (= (and b!152370 res!127757) b!152371))

(assert (= (and b!152371 (not res!127756)) b!152372))

(assert (=> b!152370 m!238125))

(assert (=> b!152370 m!238131))

(assert (=> b!152372 m!238125))

(assert (=> b!152372 m!238125))

(declare-fun m!238143 () Bool)

(assert (=> b!152372 m!238143))

(assert (=> d!49900 d!50000))

(assert (=> d!49900 d!49932))

(declare-fun d!50002 () Bool)

(assert (=> d!50002 (isPrefixOf!0 lt!238398 thiss!1634)))

(declare-fun lt!238744 () Unit!9665)

(declare-fun choose!30 (BitStream!5408 BitStream!5408 BitStream!5408) Unit!9665)

(assert (=> d!50002 (= lt!238744 (choose!30 lt!238398 thiss!1634 thiss!1634))))

(assert (=> d!50002 (isPrefixOf!0 lt!238398 thiss!1634)))

(assert (=> d!50002 (= (lemmaIsPrefixTransitive!0 lt!238398 thiss!1634 thiss!1634) lt!238744)))

(declare-fun bs!12228 () Bool)

(assert (= bs!12228 d!50002))

(assert (=> bs!12228 m!237977))

(declare-fun m!238145 () Bool)

(assert (=> bs!12228 m!238145))

(assert (=> bs!12228 m!237977))

(assert (=> d!49900 d!50002))

(assert (=> d!49900 d!49936))

(declare-fun d!50004 () Bool)

(assert (=> d!50004 (isPrefixOf!0 lt!238398 lt!238398)))

(declare-fun lt!238748 () Unit!9665)

(assert (=> d!50004 (= lt!238748 (choose!11 lt!238398))))

(assert (=> d!50004 (= (lemmaIsPrefixRefl!0 lt!238398) lt!238748)))

(declare-fun bs!12229 () Bool)

(assert (= bs!12229 d!50004))

(assert (=> bs!12229 m!237981))

(declare-fun m!238147 () Bool)

(assert (=> bs!12229 m!238147))

(assert (=> d!49900 d!50004))

(declare-fun b!152384 () Bool)

(declare-fun e!101891 () Bool)

(declare-fun e!101890 () Bool)

(assert (=> b!152384 (= e!101891 e!101890)))

(declare-fun res!127769 () Bool)

(assert (=> b!152384 (=> (not res!127769) (not e!101890))))

(declare-fun e!101888 () Bool)

(assert (=> b!152384 (= res!127769 e!101888)))

(declare-fun res!127768 () Bool)

(assert (=> b!152384 (=> res!127768 e!101888)))

(declare-fun lt!238751 () tuple4!152)

(assert (=> b!152384 (= res!127768 (bvsge (_1!7158 lt!238751) (_2!7158 lt!238751)))))

(declare-fun lt!238749 () (_ BitVec 32))

(assert (=> b!152384 (= lt!238749 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!238750 () (_ BitVec 32))

(assert (=> b!152384 (= lt!238750 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152384 (= lt!238751 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634))))))

(declare-fun b!152385 () Bool)

(declare-fun res!127770 () Bool)

(assert (=> b!152385 (= res!127770 (= lt!238749 #b00000000000000000000000000000000))))

(declare-fun e!101889 () Bool)

(assert (=> b!152385 (=> res!127770 e!101889)))

(declare-fun e!101887 () Bool)

(assert (=> b!152385 (= e!101887 e!101889)))

(declare-fun c!8146 () Bool)

(declare-fun bm!2115 () Bool)

(declare-fun call!2118 () Bool)

(assert (=> bm!2115 (= call!2118 (byteRangesEq!0 (select (arr!3892 (buf!3572 thiss!1634)) (_3!379 lt!238751)) (select (arr!3892 (buf!3572 thiss!1634)) (_3!379 lt!238751)) lt!238750 (ite c!8146 lt!238749 #b00000000000000000000000000001000)))))

(declare-fun b!152386 () Bool)

(declare-fun e!101892 () Bool)

(assert (=> b!152386 (= e!101892 e!101887)))

(declare-fun res!127771 () Bool)

(assert (=> b!152386 (= res!127771 call!2118)))

(assert (=> b!152386 (=> (not res!127771) (not e!101887))))

(declare-fun b!152387 () Bool)

(assert (=> b!152387 (= e!101892 call!2118)))

(declare-fun b!152389 () Bool)

(assert (=> b!152389 (= e!101890 e!101892)))

(assert (=> b!152389 (= c!8146 (= (_3!379 lt!238751) (_4!76 lt!238751)))))

(declare-fun b!152390 () Bool)

(assert (=> b!152390 (= e!101889 (byteRangesEq!0 (select (arr!3892 (buf!3572 thiss!1634)) (_4!76 lt!238751)) (select (arr!3892 (buf!3572 thiss!1634)) (_4!76 lt!238751)) #b00000000000000000000000000000000 lt!238749))))

(declare-fun d!50006 () Bool)

(declare-fun res!127767 () Bool)

(assert (=> d!50006 (=> res!127767 e!101891)))

(assert (=> d!50006 (= res!127767 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634))))))

(assert (=> d!50006 (= (arrayBitRangesEq!0 (buf!3572 thiss!1634) (buf!3572 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634))) e!101891)))

(declare-fun b!152388 () Bool)

(assert (=> b!152388 (= e!101888 (arrayRangesEq!370 (buf!3572 thiss!1634) (buf!3572 thiss!1634) (_1!7158 lt!238751) (_2!7158 lt!238751)))))

(assert (= (and d!50006 (not res!127767)) b!152384))

(assert (= (and b!152384 (not res!127768)) b!152388))

(assert (= (and b!152384 res!127769) b!152389))

(assert (= (and b!152389 c!8146) b!152387))

(assert (= (and b!152389 (not c!8146)) b!152386))

(assert (= (and b!152386 res!127771) b!152385))

(assert (= (and b!152385 (not res!127770)) b!152390))

(assert (= (or b!152387 b!152386) bm!2115))

(assert (=> b!152384 m!237931))

(declare-fun m!238161 () Bool)

(assert (=> b!152384 m!238161))

(declare-fun m!238163 () Bool)

(assert (=> bm!2115 m!238163))

(assert (=> bm!2115 m!238163))

(assert (=> bm!2115 m!238163))

(assert (=> bm!2115 m!238163))

(declare-fun m!238165 () Bool)

(assert (=> bm!2115 m!238165))

(declare-fun m!238167 () Bool)

(assert (=> b!152390 m!238167))

(assert (=> b!152390 m!238167))

(assert (=> b!152390 m!238167))

(assert (=> b!152390 m!238167))

(declare-fun m!238171 () Bool)

(assert (=> b!152390 m!238171))

(declare-fun m!238173 () Bool)

(assert (=> b!152388 m!238173))

(assert (=> b!152241 d!50006))

(assert (=> b!152241 d!49926))

(declare-fun d!50010 () Bool)

(declare-fun res!127775 () Bool)

(declare-fun e!101895 () Bool)

(assert (=> d!50010 (=> res!127775 e!101895)))

(assert (=> d!50010 (= res!127775 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!50010 (= (arrayRangesEq!370 arr!237 (_2!7149 lt!238338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101895)))

(declare-fun b!152394 () Bool)

(declare-fun e!101896 () Bool)

(assert (=> b!152394 (= e!101895 e!101896)))

(declare-fun res!127776 () Bool)

(assert (=> b!152394 (=> (not res!127776) (not e!101896))))

(assert (=> b!152394 (= res!127776 (= (select (arr!3892 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3892 (_2!7149 lt!238338)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!152395 () Bool)

(assert (=> b!152395 (= e!101896 (arrayRangesEq!370 arr!237 (_2!7149 lt!238338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!50010 (not res!127775)) b!152394))

(assert (= (and b!152394 res!127776) b!152395))

(declare-fun m!238177 () Bool)

(assert (=> b!152394 m!238177))

(declare-fun m!238179 () Bool)

(assert (=> b!152394 m!238179))

(declare-fun m!238181 () Bool)

(assert (=> b!152395 m!238181))

(assert (=> b!152258 d!50010))

(declare-fun d!50014 () Bool)

(declare-fun res!127777 () Bool)

(declare-fun e!101897 () Bool)

(assert (=> d!50014 (=> (not res!127777) (not e!101897))))

(assert (=> d!50014 (= res!127777 (= (size!3075 (buf!3572 (_2!7150 lt!238396))) (size!3075 (buf!3572 thiss!1634))))))

(assert (=> d!50014 (= (isPrefixOf!0 (_2!7150 lt!238396) thiss!1634) e!101897)))

(declare-fun b!152396 () Bool)

(declare-fun res!127779 () Bool)

(assert (=> b!152396 (=> (not res!127779) (not e!101897))))

(assert (=> b!152396 (= res!127779 (bvsle (bitIndex!0 (size!3075 (buf!3572 (_2!7150 lt!238396))) (currentByte!6513 (_2!7150 lt!238396)) (currentBit!6508 (_2!7150 lt!238396))) (bitIndex!0 (size!3075 (buf!3572 thiss!1634)) (currentByte!6513 thiss!1634) (currentBit!6508 thiss!1634))))))

(declare-fun b!152397 () Bool)

(declare-fun e!101898 () Bool)

(assert (=> b!152397 (= e!101897 e!101898)))

(declare-fun res!127778 () Bool)

(assert (=> b!152397 (=> res!127778 e!101898)))

(assert (=> b!152397 (= res!127778 (= (size!3075 (buf!3572 (_2!7150 lt!238396))) #b00000000000000000000000000000000))))

(declare-fun b!152398 () Bool)

(assert (=> b!152398 (= e!101898 (arrayBitRangesEq!0 (buf!3572 (_2!7150 lt!238396)) (buf!3572 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3075 (buf!3572 (_2!7150 lt!238396))) (currentByte!6513 (_2!7150 lt!238396)) (currentBit!6508 (_2!7150 lt!238396)))))))

(assert (= (and d!50014 res!127777) b!152396))

(assert (= (and b!152396 res!127779) b!152397))

(assert (= (and b!152397 (not res!127778)) b!152398))

(assert (=> b!152396 m!238131))

(assert (=> b!152396 m!237931))

(assert (=> b!152398 m!238131))

(assert (=> b!152398 m!238131))

(declare-fun m!238183 () Bool)

(assert (=> b!152398 m!238183))

(assert (=> b!152220 d!50014))

(declare-fun d!50016 () Bool)

(assert (=> d!50016 (= (invariant!0 (currentBit!6508 thiss!1634) (currentByte!6513 thiss!1634) (size!3075 (buf!3572 thiss!1634))) (and (bvsge (currentBit!6508 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6508 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6513 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6513 thiss!1634) (size!3075 (buf!3572 thiss!1634))) (and (= (currentBit!6508 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6513 thiss!1634) (size!3075 (buf!3572 thiss!1634)))))))))

(assert (=> d!49922 d!50016))

(assert (=> d!49892 d!49984))

(declare-fun lt!238864 () tuple3!600)

(declare-fun call!2127 () Bool)

(declare-fun lt!238855 () (_ BitVec 32))

(declare-fun bm!2123 () Bool)

(declare-fun c!8150 () Bool)

(assert (=> bm!2123 (= call!2127 (arrayRangesEq!370 arr!237 (ite c!8150 (_3!375 lt!238864) arr!237) (ite c!8150 lt!238855 #b00000000000000000000000000000000) (ite c!8150 from!447 (size!3075 arr!237))))))

(declare-fun bm!2124 () Bool)

(declare-fun call!2128 () Bool)

(declare-fun lt!238853 () (_ BitVec 32))

(declare-fun lt!238866 () array!6798)

(declare-fun lt!238834 () (_ BitVec 32))

(declare-fun lt!238858 () array!6798)

(assert (=> bm!2124 (= call!2128 (arrayRangesEq!370 (ite c!8150 arr!237 lt!238858) (ite c!8150 (_3!375 lt!238864) lt!238866) (ite c!8150 #b00000000000000000000000000000000 lt!238834) (ite c!8150 from!447 lt!238853)))))

(declare-fun lt!238843 () tuple3!600)

(declare-fun b!152425 () Bool)

(declare-fun e!101917 () Bool)

(declare-datatypes ((tuple2!13560 0))(
  ( (tuple2!13561 (_1!7160 BitStream!5408) (_2!7160 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5408) tuple2!13560)

(assert (=> b!152425 (= e!101917 (= (select (arr!3892 (_3!375 lt!238843)) from!447) (_2!7160 (readBytePure!0 (_1!7150 lt!238339)))))))

(assert (=> b!152425 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3075 (_3!375 lt!238843))))))

(declare-fun bm!2125 () Bool)

(declare-fun call!2126 () (_ BitVec 64))

(assert (=> bm!2125 (= call!2126 (bitIndex!0 (ite c!8150 (size!3075 (buf!3572 (_2!7151 lt!238864))) (size!3075 (buf!3572 (_1!7150 lt!238339)))) (ite c!8150 (currentByte!6513 (_2!7151 lt!238864)) (currentByte!6513 (_1!7150 lt!238339))) (ite c!8150 (currentBit!6508 (_2!7151 lt!238864)) (currentBit!6508 (_1!7150 lt!238339)))))))

(declare-fun b!152426 () Bool)

(declare-fun e!101919 () tuple3!600)

(declare-fun lt!238851 () Unit!9665)

(assert (=> b!152426 (= e!101919 (tuple3!601 lt!238851 (_1!7150 lt!238339) arr!237))))

(assert (=> b!152426 (= call!2126 call!2126)))

(declare-fun lt!238863 () Unit!9665)

(declare-fun Unit!9677 () Unit!9665)

(assert (=> b!152426 (= lt!238863 Unit!9677)))

(declare-fun lt!238854 () Unit!9665)

(declare-fun arrayRangesEqReflexiveLemma!19 (array!6798) Unit!9665)

(assert (=> b!152426 (= lt!238854 (arrayRangesEqReflexiveLemma!19 arr!237))))

(assert (=> b!152426 call!2127))

(declare-fun lt!238838 () Unit!9665)

(assert (=> b!152426 (= lt!238838 lt!238854)))

(assert (=> b!152426 (= lt!238858 arr!237)))

(assert (=> b!152426 (= lt!238866 arr!237)))

(declare-fun lt!238839 () (_ BitVec 32))

(assert (=> b!152426 (= lt!238839 #b00000000000000000000000000000000)))

(declare-fun lt!238835 () (_ BitVec 32))

(assert (=> b!152426 (= lt!238835 (size!3075 arr!237))))

(assert (=> b!152426 (= lt!238834 #b00000000000000000000000000000000)))

(assert (=> b!152426 (= lt!238853 from!447)))

(declare-fun arrayRangesEqSlicedLemma!19 (array!6798 array!6798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9665)

(assert (=> b!152426 (= lt!238851 (arrayRangesEqSlicedLemma!19 lt!238858 lt!238866 lt!238839 lt!238835 lt!238834 lt!238853))))

(assert (=> b!152426 call!2128))

(declare-fun b!152427 () Bool)

(declare-fun lt!238856 () Unit!9665)

(assert (=> b!152427 (= e!101919 (tuple3!601 lt!238856 (_2!7151 lt!238864) (_3!375 lt!238864)))))

(declare-datatypes ((tuple2!13562 0))(
  ( (tuple2!13563 (_1!7161 (_ BitVec 8)) (_2!7161 BitStream!5408)) )
))
(declare-fun lt!238840 () tuple2!13562)

(declare-fun readByte!0 (BitStream!5408) tuple2!13562)

(assert (=> b!152427 (= lt!238840 (readByte!0 (_1!7150 lt!238339)))))

(declare-fun lt!238852 () array!6798)

(assert (=> b!152427 (= lt!238852 (array!6799 (store (arr!3892 arr!237) from!447 (_1!7161 lt!238840)) (size!3075 arr!237)))))

(declare-fun lt!238868 () (_ BitVec 64))

(assert (=> b!152427 (= lt!238868 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!238869 () (_ BitVec 32))

(assert (=> b!152427 (= lt!238869 (bvsub to!404 from!447))))

(declare-fun lt!238867 () Unit!9665)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5408 BitStream!5408 (_ BitVec 64) (_ BitVec 32)) Unit!9665)

(assert (=> b!152427 (= lt!238867 (validateOffsetBytesFromBitIndexLemma!0 (_1!7150 lt!238339) (_2!7161 lt!238840) lt!238868 lt!238869))))

(assert (=> b!152427 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3075 (buf!3572 (_2!7161 lt!238840)))) ((_ sign_extend 32) (currentByte!6513 (_2!7161 lt!238840))) ((_ sign_extend 32) (currentBit!6508 (_2!7161 lt!238840))) (bvsub lt!238869 ((_ extract 31 0) (bvsdiv (bvadd lt!238868 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!238841 () Unit!9665)

(assert (=> b!152427 (= lt!238841 lt!238867)))

(assert (=> b!152427 (= lt!238864 (readByteArrayLoop!0 (_2!7161 lt!238840) lt!238852 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!152427 (= (bitIndex!0 (size!3075 (buf!3572 (_2!7161 lt!238840))) (currentByte!6513 (_2!7161 lt!238840)) (currentBit!6508 (_2!7161 lt!238840))) (bvadd (bitIndex!0 (size!3075 (buf!3572 (_1!7150 lt!238339))) (currentByte!6513 (_1!7150 lt!238339)) (currentBit!6508 (_1!7150 lt!238339))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!238865 () Unit!9665)

(declare-fun Unit!9678 () Unit!9665)

(assert (=> b!152427 (= lt!238865 Unit!9678)))

(assert (=> b!152427 (= (bvadd (bitIndex!0 (size!3075 (buf!3572 (_2!7161 lt!238840))) (currentByte!6513 (_2!7161 lt!238840)) (currentBit!6508 (_2!7161 lt!238840))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2126)))

(declare-fun lt!238857 () Unit!9665)

(declare-fun Unit!9679 () Unit!9665)

(assert (=> b!152427 (= lt!238857 Unit!9679)))

(assert (=> b!152427 (= (bvadd (bitIndex!0 (size!3075 (buf!3572 (_1!7150 lt!238339))) (currentByte!6513 (_1!7150 lt!238339)) (currentBit!6508 (_1!7150 lt!238339))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2126)))

(declare-fun lt!238859 () Unit!9665)

(declare-fun Unit!9680 () Unit!9665)

(assert (=> b!152427 (= lt!238859 Unit!9680)))

(assert (=> b!152427 (and (= (buf!3572 (_1!7150 lt!238339)) (buf!3572 (_2!7151 lt!238864))) (= (size!3075 arr!237) (size!3075 (_3!375 lt!238864))))))

(declare-fun lt!238844 () Unit!9665)

(declare-fun Unit!9681 () Unit!9665)

(assert (=> b!152427 (= lt!238844 Unit!9681)))

(declare-fun lt!238846 () Unit!9665)

(declare-fun arrayUpdatedAtPrefixLemma!19 (array!6798 (_ BitVec 32) (_ BitVec 8)) Unit!9665)

(assert (=> b!152427 (= lt!238846 (arrayUpdatedAtPrefixLemma!19 arr!237 from!447 (_1!7161 lt!238840)))))

(assert (=> b!152427 (arrayRangesEq!370 arr!237 (array!6799 (store (arr!3892 arr!237) from!447 (_1!7161 lt!238840)) (size!3075 arr!237)) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!238849 () Unit!9665)

(assert (=> b!152427 (= lt!238849 lt!238846)))

(assert (=> b!152427 (= lt!238855 #b00000000000000000000000000000000)))

(declare-fun lt!238845 () Unit!9665)

(declare-fun arrayRangesEqTransitive!84 (array!6798 array!6798 array!6798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9665)

(assert (=> b!152427 (= lt!238845 (arrayRangesEqTransitive!84 arr!237 lt!238852 (_3!375 lt!238864) lt!238855 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!152427 call!2127))

(declare-fun lt!238861 () Unit!9665)

(assert (=> b!152427 (= lt!238861 lt!238845)))

(assert (=> b!152427 call!2128))

(declare-fun lt!238847 () Unit!9665)

(declare-fun Unit!9682 () Unit!9665)

(assert (=> b!152427 (= lt!238847 Unit!9682)))

(declare-fun lt!238842 () Unit!9665)

(declare-fun arrayRangesEqImpliesEq!19 (array!6798 array!6798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9665)

(assert (=> b!152427 (= lt!238842 (arrayRangesEqImpliesEq!19 lt!238852 (_3!375 lt!238864) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!152427 (= (select (store (arr!3892 arr!237) from!447 (_1!7161 lt!238840)) from!447) (select (arr!3892 (_3!375 lt!238864)) from!447))))

(declare-fun lt!238860 () Unit!9665)

(assert (=> b!152427 (= lt!238860 lt!238842)))

(declare-fun lt!238837 () Bool)

(assert (=> b!152427 (= lt!238837 (= (select (arr!3892 (_3!375 lt!238864)) from!447) (_1!7161 lt!238840)))))

(declare-fun Unit!9683 () Unit!9665)

(assert (=> b!152427 (= lt!238856 Unit!9683)))

(assert (=> b!152427 lt!238837))

(declare-fun d!50018 () Bool)

(assert (=> d!50018 e!101917))

(declare-fun res!127801 () Bool)

(assert (=> d!50018 (=> res!127801 e!101917)))

(assert (=> d!50018 (= res!127801 (bvsge from!447 to!404))))

(declare-fun lt!238862 () Bool)

(declare-fun e!101918 () Bool)

(assert (=> d!50018 (= lt!238862 e!101918)))

(declare-fun res!127800 () Bool)

(assert (=> d!50018 (=> (not res!127800) (not e!101918))))

(declare-fun lt!238836 () (_ BitVec 64))

(declare-fun lt!238850 () (_ BitVec 64))

(assert (=> d!50018 (= res!127800 (= (bvadd lt!238836 lt!238850) (bitIndex!0 (size!3075 (buf!3572 (_2!7151 lt!238843))) (currentByte!6513 (_2!7151 lt!238843)) (currentBit!6508 (_2!7151 lt!238843)))))))

(assert (=> d!50018 (or (not (= (bvand lt!238836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238850 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!238836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!238836 lt!238850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238848 () (_ BitVec 64))

(assert (=> d!50018 (= lt!238850 (bvmul lt!238848 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!50018 (or (= lt!238848 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!238848 #b0000000000000000000000000000000000000000000000000000000000001000) lt!238848)))))

(assert (=> d!50018 (= lt!238848 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!50018 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!50018 (= lt!238836 (bitIndex!0 (size!3075 (buf!3572 (_1!7150 lt!238339))) (currentByte!6513 (_1!7150 lt!238339)) (currentBit!6508 (_1!7150 lt!238339))))))

(assert (=> d!50018 (= lt!238843 e!101919)))

(assert (=> d!50018 (= c!8150 (bvslt from!447 to!404))))

(assert (=> d!50018 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3075 arr!237)))))

(assert (=> d!50018 (= (readByteArrayLoop!0 (_1!7150 lt!238339) arr!237 from!447 to!404) lt!238843)))

(declare-fun b!152428 () Bool)

(assert (=> b!152428 (= e!101918 (arrayRangesEq!370 arr!237 (_3!375 lt!238843) #b00000000000000000000000000000000 from!447))))

(declare-fun b!152429 () Bool)

(declare-fun res!127802 () Bool)

(assert (=> b!152429 (=> (not res!127802) (not e!101918))))

(assert (=> b!152429 (= res!127802 (and (= (buf!3572 (_1!7150 lt!238339)) (buf!3572 (_2!7151 lt!238843))) (= (size!3075 arr!237) (size!3075 (_3!375 lt!238843)))))))

(assert (= (and d!50018 c!8150) b!152427))

(assert (= (and d!50018 (not c!8150)) b!152426))

(assert (= (or b!152427 b!152426) bm!2124))

(assert (= (or b!152427 b!152426) bm!2123))

(assert (= (or b!152427 b!152426) bm!2125))

(assert (= (and d!50018 res!127800) b!152429))

(assert (= (and b!152429 res!127802) b!152428))

(assert (= (and d!50018 (not res!127801)) b!152425))

(declare-fun m!238211 () Bool)

(assert (=> b!152428 m!238211))

(declare-fun m!238213 () Bool)

(assert (=> d!50018 m!238213))

(declare-fun m!238215 () Bool)

(assert (=> d!50018 m!238215))

(declare-fun m!238217 () Bool)

(assert (=> b!152426 m!238217))

(declare-fun m!238219 () Bool)

(assert (=> b!152426 m!238219))

(declare-fun m!238221 () Bool)

(assert (=> bm!2125 m!238221))

(declare-fun m!238223 () Bool)

(assert (=> b!152425 m!238223))

(declare-fun m!238225 () Bool)

(assert (=> b!152425 m!238225))

(assert (=> b!152427 m!238215))

(declare-fun m!238227 () Bool)

(assert (=> b!152427 m!238227))

(declare-fun m!238229 () Bool)

(assert (=> b!152427 m!238229))

(declare-fun m!238231 () Bool)

(assert (=> b!152427 m!238231))

(declare-fun m!238233 () Bool)

(assert (=> b!152427 m!238233))

(declare-fun m!238235 () Bool)

(assert (=> b!152427 m!238235))

(declare-fun m!238237 () Bool)

(assert (=> b!152427 m!238237))

(declare-fun m!238239 () Bool)

(assert (=> b!152427 m!238239))

(declare-fun m!238241 () Bool)

(assert (=> b!152427 m!238241))

(declare-fun m!238243 () Bool)

(assert (=> b!152427 m!238243))

(declare-fun m!238245 () Bool)

(assert (=> b!152427 m!238245))

(declare-fun m!238247 () Bool)

(assert (=> b!152427 m!238247))

(declare-fun m!238249 () Bool)

(assert (=> b!152427 m!238249))

(declare-fun m!238251 () Bool)

(assert (=> bm!2123 m!238251))

(declare-fun m!238253 () Bool)

(assert (=> bm!2124 m!238253))

(assert (=> d!49894 d!50018))

(assert (=> d!49926 d!49984))

(assert (=> d!49926 d!50016))

(push 1)

(assert (not b!152359))

(assert (not b!152395))

(assert (not d!49988))

(assert (not b!152343))

(assert (not b!152339))

(assert (not d!50002))

(assert (not b!152426))

(assert (not bm!2123))

(assert (not b!152390))

(assert (not bm!2124))

(assert (not b!152398))

(assert (not d!50018))

(assert (not b!152350))

(assert (not b!152354))

(assert (not bm!2115))

(assert (not b!152384))

(assert (not b!152372))

(assert (not d!49994))

(assert (not b!152348))

(assert (not bm!2125))

(assert (not b!152356))

(assert (not b!152388))

(assert (not d!49976))

(assert (not b!152345))

(assert (not d!50004))

(assert (not b!152396))

(assert (not bm!2111))

(assert (not b!152361))

(assert (not d!49974))

(assert (not b!152427))

(assert (not b!152428))

(assert (not b!152370))

(assert (not b!152425))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

