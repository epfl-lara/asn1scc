; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31396 () Bool)

(assert start!31396)

(declare-fun b!157669 () Bool)

(declare-fun res!131735 () Bool)

(declare-fun e!106917 () Bool)

(assert (=> b!157669 (=> (not res!131735) (not e!106917))))

(declare-datatypes ((array!7299 0))(
  ( (array!7300 (arr!4199 (Array (_ BitVec 32) (_ BitVec 8))) (size!3304 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5800 0))(
  ( (BitStream!5801 (buf!3774 array!7299) (currentByte!6928 (_ BitVec 32)) (currentBit!6923 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5800)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157669 (= res!131735 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3304 (buf!3774 bs!65))) ((_ sign_extend 32) (currentByte!6928 bs!65)) ((_ sign_extend 32) (currentBit!6923 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157671 () Bool)

(declare-fun e!106915 () Bool)

(declare-fun lt!247939 () BitStream!5800)

(assert (=> b!157671 (= e!106915 (not (= (size!3304 (buf!3774 bs!65)) (size!3304 (buf!3774 lt!247939)))))))

(declare-datatypes ((tuple2!14278 0))(
  ( (tuple2!14279 (_1!7592 BitStream!5800) (_2!7592 (_ BitVec 8))) )
))
(declare-fun lt!247942 () tuple2!14278)

(declare-fun readBytePure!0 (BitStream!5800) tuple2!14278)

(assert (=> b!157671 (= lt!247942 (readBytePure!0 lt!247939))))

(declare-fun b!157672 () Bool)

(declare-fun e!106919 () Bool)

(declare-fun array_inv!3063 (array!7299) Bool)

(assert (=> b!157672 (= e!106919 (array_inv!3063 (buf!3774 bs!65)))))

(declare-fun b!157670 () Bool)

(assert (=> b!157670 (= e!106917 e!106915)))

(declare-fun res!131733 () Bool)

(assert (=> b!157670 (=> (not res!131733) (not e!106915))))

(assert (=> b!157670 (= res!131733 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14280 0))(
  ( (tuple2!14281 (_1!7593 BitStream!5800) (_2!7593 array!7299)) )
))
(declare-fun lt!247941 () tuple2!14280)

(declare-fun arr!153 () array!7299)

(declare-fun readByteArrayLoopPure!0 (BitStream!5800 array!7299 (_ BitVec 32) (_ BitVec 32)) tuple2!14280)

(assert (=> b!157670 (= lt!247941 (readByteArrayLoopPure!0 lt!247939 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5800 (_ BitVec 32)) BitStream!5800)

(assert (=> b!157670 (= lt!247939 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!247940 () tuple2!14280)

(assert (=> b!157670 (= lt!247940 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun res!131734 () Bool)

(assert (=> start!31396 (=> (not res!131734) (not e!106917))))

(assert (=> start!31396 (= res!131734 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3304 arr!153))))))

(assert (=> start!31396 e!106917))

(assert (=> start!31396 true))

(assert (=> start!31396 (array_inv!3063 arr!153)))

(declare-fun inv!12 (BitStream!5800) Bool)

(assert (=> start!31396 (and (inv!12 bs!65) e!106919)))

(assert (= (and start!31396 res!131734) b!157669))

(assert (= (and b!157669 res!131735) b!157670))

(assert (= (and b!157670 res!131733) b!157671))

(assert (= start!31396 b!157672))

(declare-fun m!246903 () Bool)

(assert (=> start!31396 m!246903))

(declare-fun m!246905 () Bool)

(assert (=> start!31396 m!246905))

(declare-fun m!246907 () Bool)

(assert (=> b!157670 m!246907))

(declare-fun m!246909 () Bool)

(assert (=> b!157670 m!246909))

(declare-fun m!246911 () Bool)

(assert (=> b!157670 m!246911))

(declare-fun m!246913 () Bool)

(assert (=> b!157670 m!246913))

(declare-fun m!246915 () Bool)

(assert (=> b!157670 m!246915))

(declare-fun m!246917 () Bool)

(assert (=> b!157671 m!246917))

(declare-fun m!246919 () Bool)

(assert (=> b!157669 m!246919))

(declare-fun m!246921 () Bool)

(assert (=> b!157672 m!246921))

(push 1)

(assert (not b!157671))

(assert (not start!31396))

(assert (not b!157669))

(assert (not b!157672))

(assert (not b!157670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52646 () Bool)

(assert (=> d!52646 (= (array_inv!3063 (buf!3774 bs!65)) (bvsge (size!3304 (buf!3774 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157672 d!52646))

(declare-fun d!52648 () Bool)

(assert (=> d!52648 (= (array_inv!3063 arr!153) (bvsge (size!3304 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31396 d!52648))

(declare-fun d!52650 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52650 (= (inv!12 bs!65) (invariant!0 (currentBit!6923 bs!65) (currentByte!6928 bs!65) (size!3304 (buf!3774 bs!65))))))

(declare-fun bs!12951 () Bool)

(assert (= bs!12951 d!52650))

(declare-fun m!246963 () Bool)

(assert (=> bs!12951 m!246963))

(assert (=> start!31396 d!52650))

(declare-fun d!52652 () Bool)

(declare-datatypes ((tuple2!14290 0))(
  ( (tuple2!14291 (_1!7598 (_ BitVec 8)) (_2!7598 BitStream!5800)) )
))
(declare-fun lt!247969 () tuple2!14290)

(declare-fun readByte!0 (BitStream!5800) tuple2!14290)

(assert (=> d!52652 (= lt!247969 (readByte!0 lt!247939))))

(assert (=> d!52652 (= (readBytePure!0 lt!247939) (tuple2!14279 (_2!7598 lt!247969) (_1!7598 lt!247969)))))

(declare-fun bs!12952 () Bool)

(assert (= bs!12952 d!52652))

(declare-fun m!246965 () Bool)

(assert (=> bs!12952 m!246965))

(assert (=> b!157671 d!52652))

(declare-datatypes ((Unit!10423 0))(
  ( (Unit!10424) )
))
(declare-datatypes ((tuple3!672 0))(
  ( (tuple3!673 (_1!7600 Unit!10423) (_2!7600 BitStream!5800) (_3!453 array!7299)) )
))
(declare-fun lt!247975 () tuple3!672)

(declare-fun d!52656 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5800 array!7299 (_ BitVec 32) (_ BitVec 32)) tuple3!672)

(assert (=> d!52656 (= lt!247975 (readByteArrayLoop!0 lt!247939 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52656 (= (readByteArrayLoopPure!0 lt!247939 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14281 (_2!7600 lt!247975) (_3!453 lt!247975)))))

(declare-fun bs!12955 () Bool)

(assert (= bs!12955 d!52656))

(declare-fun m!246971 () Bool)

(assert (=> bs!12955 m!246971))

(assert (=> b!157670 d!52656))

(declare-fun d!52666 () Bool)

(declare-fun lt!247976 () tuple2!14290)

(assert (=> d!52666 (= lt!247976 (readByte!0 bs!65))))

(assert (=> d!52666 (= (readBytePure!0 bs!65) (tuple2!14279 (_2!7598 lt!247976) (_1!7598 lt!247976)))))

(declare-fun bs!12956 () Bool)

(assert (= bs!12956 d!52666))

(declare-fun m!246973 () Bool)

(assert (=> bs!12956 m!246973))

(assert (=> b!157670 d!52666))

(declare-fun d!52668 () Bool)

(declare-datatypes ((tuple2!14294 0))(
  ( (tuple2!14295 (_1!7602 Unit!10423) (_2!7602 BitStream!5800)) )
))
(declare-fun moveByteIndex!0 (BitStream!5800 (_ BitVec 32)) tuple2!14294)

(assert (=> d!52668 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7602 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12959 () Bool)

(assert (= bs!12959 d!52668))

(declare-fun m!246979 () Bool)

(assert (=> bs!12959 m!246979))

(assert (=> b!157670 d!52668))

(declare-fun d!52674 () Bool)

(declare-fun lt!247981 () tuple3!672)

(assert (=> d!52674 (= lt!247981 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52674 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14281 (_2!7600 lt!247981) (_3!453 lt!247981)))))

(declare-fun bs!12961 () Bool)

(assert (= bs!12961 d!52674))

(declare-fun m!246982 () Bool)

(assert (=> bs!12961 m!246982))

(assert (=> b!157670 d!52674))

(declare-fun d!52678 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52678 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3304 (buf!3774 bs!65))) ((_ sign_extend 32) (currentByte!6928 bs!65)) ((_ sign_extend 32) (currentBit!6923 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3304 (buf!3774 bs!65))) ((_ sign_extend 32) (currentByte!6928 bs!65)) ((_ sign_extend 32) (currentBit!6923 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12964 () Bool)

(assert (= bs!12964 d!52678))

(declare-fun m!246989 () Bool)

(assert (=> bs!12964 m!246989))

(assert (=> b!157669 d!52678))

(push 1)

(assert (not d!52668))

(assert (not d!52666))

(assert (not d!52652))

(assert (not d!52678))

(assert (not d!52674))

(assert (not d!52656))

(assert (not d!52650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52708 () Bool)

(assert (=> d!52708 (= (invariant!0 (currentBit!6923 bs!65) (currentByte!6928 bs!65) (size!3304 (buf!3774 bs!65))) (and (bvsge (currentBit!6923 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6923 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6928 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6928 bs!65) (size!3304 (buf!3774 bs!65))) (and (= (currentBit!6923 bs!65) #b00000000000000000000000000000000) (= (currentByte!6928 bs!65) (size!3304 (buf!3774 bs!65)))))))))

(assert (=> d!52650 d!52708))

(declare-fun e!106988 () tuple3!672)

(declare-fun b!157747 () Bool)

(declare-fun lt!248283 () Unit!10423)

(assert (=> b!157747 (= e!106988 (tuple3!673 lt!248283 lt!247939 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153))))))

(declare-fun call!2603 () (_ BitVec 64))

(assert (=> b!157747 (= call!2603 call!2603)))

(declare-fun lt!248263 () Unit!10423)

(declare-fun Unit!10452 () Unit!10423)

(assert (=> b!157747 (= lt!248263 Unit!10452)))

(declare-fun lt!248272 () Unit!10423)

(declare-fun arrayRangesEqReflexiveLemma!49 (array!7299) Unit!10423)

(assert (=> b!157747 (= lt!248272 (arrayRangesEqReflexiveLemma!49 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153))))))

(declare-fun call!2602 () Bool)

(assert (=> b!157747 call!2602))

(declare-fun lt!248288 () Unit!10423)

(assert (=> b!157747 (= lt!248288 lt!248272)))

(declare-fun lt!248278 () array!7299)

(assert (=> b!157747 (= lt!248278 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)))))

(declare-fun lt!248270 () array!7299)

(assert (=> b!157747 (= lt!248270 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)))))

(declare-fun lt!248279 () (_ BitVec 32))

(assert (=> b!157747 (= lt!248279 #b00000000000000000000000000000000)))

(declare-fun lt!248274 () (_ BitVec 32))

(assert (=> b!157747 (= lt!248274 (size!3304 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153))))))

(declare-fun lt!248271 () (_ BitVec 32))

(assert (=> b!157747 (= lt!248271 #b00000000000000000000000000000000)))

(declare-fun lt!248267 () (_ BitVec 32))

(assert (=> b!157747 (= lt!248267 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!49 (array!7299 array!7299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10423)

(assert (=> b!157747 (= lt!248283 (arrayRangesEqSlicedLemma!49 lt!248278 lt!248270 lt!248279 lt!248274 lt!248271 lt!248267))))

(declare-fun call!2601 () Bool)

(assert (=> b!157747 call!2601))

(declare-fun lt!248276 () tuple3!672)

(declare-fun b!157748 () Bool)

(declare-fun e!106990 () Bool)

(declare-fun arrayRangesEq!441 (array!7299 array!7299 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!157748 (= e!106990 (arrayRangesEq!441 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)) (_3!453 lt!248276) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!157749 () Bool)

(declare-fun e!106989 () Bool)

(assert (=> b!157749 (= e!106989 (= (select (arr!4199 (_3!453 lt!248276)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7592 (readBytePure!0 lt!247939))))))

(assert (=> b!157749 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3304 (_3!453 lt!248276))))))

(declare-fun d!52710 () Bool)

(assert (=> d!52710 e!106989))

(declare-fun res!131795 () Bool)

(assert (=> d!52710 (=> res!131795 e!106989)))

(assert (=> d!52710 (= res!131795 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!248258 () Bool)

(assert (=> d!52710 (= lt!248258 e!106990)))

(declare-fun res!131796 () Bool)

(assert (=> d!52710 (=> (not res!131796) (not e!106990))))

(declare-fun lt!248290 () (_ BitVec 64))

(declare-fun lt!248287 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!52710 (= res!131796 (= (bvadd lt!248290 lt!248287) (bitIndex!0 (size!3304 (buf!3774 (_2!7600 lt!248276))) (currentByte!6928 (_2!7600 lt!248276)) (currentBit!6923 (_2!7600 lt!248276)))))))

(assert (=> d!52710 (or (not (= (bvand lt!248290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248287 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248290 lt!248287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!248266 () (_ BitVec 64))

(assert (=> d!52710 (= lt!248287 (bvmul lt!248266 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52710 (or (= lt!248266 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248266 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248266)))))

(assert (=> d!52710 (= lt!248266 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52710 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52710 (= lt!248290 (bitIndex!0 (size!3304 (buf!3774 lt!247939)) (currentByte!6928 lt!247939) (currentBit!6923 lt!247939)))))

(assert (=> d!52710 (= lt!248276 e!106988)))

(declare-fun c!8389 () Bool)

(assert (=> d!52710 (= c!8389 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52710 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3304 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)))))))

(assert (=> d!52710 (= (readByteArrayLoop!0 lt!247939 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!248276)))

(declare-fun bm!2598 () Bool)

(assert (=> bm!2598 (= call!2603 (bitIndex!0 (size!3304 (buf!3774 lt!247939)) (currentByte!6928 lt!247939) (currentBit!6923 lt!247939)))))

(declare-fun b!157750 () Bool)

(declare-fun res!131794 () Bool)

(assert (=> b!157750 (=> (not res!131794) (not e!106990))))

(assert (=> b!157750 (= res!131794 (and (= (buf!3774 lt!247939) (buf!3774 (_2!7600 lt!248276))) (= (size!3304 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153))) (size!3304 (_3!453 lt!248276)))))))

(declare-fun b!157751 () Bool)

(declare-fun lt!248284 () Unit!10423)

(declare-fun lt!248269 () tuple3!672)

(assert (=> b!157751 (= e!106988 (tuple3!673 lt!248284 (_2!7600 lt!248269) (_3!453 lt!248269)))))

(declare-fun lt!248289 () tuple2!14290)

(assert (=> b!157751 (= lt!248289 (readByte!0 lt!247939))))

(declare-fun lt!248291 () array!7299)

(assert (=> b!157751 (= lt!248291 (array!7300 (store (arr!4199 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7598 lt!248289)) (size!3304 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)))))))

(declare-fun lt!248275 () (_ BitVec 64))

(assert (=> b!157751 (= lt!248275 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!248277 () (_ BitVec 32))

(assert (=> b!157751 (= lt!248277 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!248285 () Unit!10423)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5800 BitStream!5800 (_ BitVec 64) (_ BitVec 32)) Unit!10423)

(assert (=> b!157751 (= lt!248285 (validateOffsetBytesFromBitIndexLemma!0 lt!247939 (_2!7598 lt!248289) lt!248275 lt!248277))))

(assert (=> b!157751 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3304 (buf!3774 (_2!7598 lt!248289)))) ((_ sign_extend 32) (currentByte!6928 (_2!7598 lt!248289))) ((_ sign_extend 32) (currentBit!6923 (_2!7598 lt!248289))) (bvsub lt!248277 ((_ extract 31 0) (bvsdiv (bvadd lt!248275 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!248261 () Unit!10423)

(assert (=> b!157751 (= lt!248261 lt!248285)))

(assert (=> b!157751 (= lt!248269 (readByteArrayLoop!0 (_2!7598 lt!248289) lt!248291 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157751 (= (bitIndex!0 (size!3304 (buf!3774 (_2!7598 lt!248289))) (currentByte!6928 (_2!7598 lt!248289)) (currentBit!6923 (_2!7598 lt!248289))) (bvadd call!2603 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!248268 () Unit!10423)

(declare-fun Unit!10455 () Unit!10423)

(assert (=> b!157751 (= lt!248268 Unit!10455)))

(assert (=> b!157751 (= (bvadd (bitIndex!0 (size!3304 (buf!3774 (_2!7598 lt!248289))) (currentByte!6928 (_2!7598 lt!248289)) (currentBit!6923 (_2!7598 lt!248289))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3304 (buf!3774 (_2!7600 lt!248269))) (currentByte!6928 (_2!7600 lt!248269)) (currentBit!6923 (_2!7600 lt!248269))))))

(declare-fun lt!248257 () Unit!10423)

(declare-fun Unit!10456 () Unit!10423)

(assert (=> b!157751 (= lt!248257 Unit!10456)))

(assert (=> b!157751 (= (bvadd call!2603 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3304 (buf!3774 (_2!7600 lt!248269))) (currentByte!6928 (_2!7600 lt!248269)) (currentBit!6923 (_2!7600 lt!248269))))))

(declare-fun lt!248280 () Unit!10423)

(declare-fun Unit!10459 () Unit!10423)

(assert (=> b!157751 (= lt!248280 Unit!10459)))

(assert (=> b!157751 (and (= (buf!3774 lt!247939) (buf!3774 (_2!7600 lt!248269))) (= (size!3304 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153))) (size!3304 (_3!453 lt!248269))))))

(declare-fun lt!248273 () Unit!10423)

(declare-fun Unit!10460 () Unit!10423)

(assert (=> b!157751 (= lt!248273 Unit!10460)))

(declare-fun lt!248256 () Unit!10423)

(declare-fun arrayUpdatedAtPrefixLemma!49 (array!7299 (_ BitVec 32) (_ BitVec 8)) Unit!10423)

(assert (=> b!157751 (= lt!248256 (arrayUpdatedAtPrefixLemma!49 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7598 lt!248289)))))

(assert (=> b!157751 (arrayRangesEq!441 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)) (array!7300 (store (arr!4199 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7598 lt!248289)) (size!3304 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!248259 () Unit!10423)

(assert (=> b!157751 (= lt!248259 lt!248256)))

(declare-fun lt!248262 () (_ BitVec 32))

(assert (=> b!157751 (= lt!248262 #b00000000000000000000000000000000)))

(declare-fun lt!248265 () Unit!10423)

(declare-fun arrayRangesEqTransitive!114 (array!7299 array!7299 array!7299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10423)

(assert (=> b!157751 (= lt!248265 (arrayRangesEqTransitive!114 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)) lt!248291 (_3!453 lt!248269) lt!248262 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157751 call!2602))

(declare-fun lt!248260 () Unit!10423)

(assert (=> b!157751 (= lt!248260 lt!248265)))

(assert (=> b!157751 call!2601))

(declare-fun lt!248281 () Unit!10423)

(declare-fun Unit!10461 () Unit!10423)

(assert (=> b!157751 (= lt!248281 Unit!10461)))

(declare-fun lt!248286 () Unit!10423)

(declare-fun arrayRangesEqImpliesEq!58 (array!7299 array!7299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10423)

(assert (=> b!157751 (= lt!248286 (arrayRangesEqImpliesEq!58 lt!248291 (_3!453 lt!248269) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157751 (= (select (store (arr!4199 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7598 lt!248289)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4199 (_3!453 lt!248269)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!248264 () Unit!10423)

(assert (=> b!157751 (= lt!248264 lt!248286)))

(declare-fun lt!248282 () Bool)

(assert (=> b!157751 (= lt!248282 (= (select (arr!4199 (_3!453 lt!248269)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7598 lt!248289)))))

(declare-fun Unit!10463 () Unit!10423)

(assert (=> b!157751 (= lt!248284 Unit!10463)))

(assert (=> b!157751 lt!248282))

(declare-fun bm!2599 () Bool)

(assert (=> bm!2599 (= call!2602 (arrayRangesEq!441 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)) (ite c!8389 (_3!453 lt!248269) (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153))) (ite c!8389 lt!248262 #b00000000000000000000000000000000) (ite c!8389 (bvadd #b00000000000000000000000000000001 from!240) (size!3304 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153))))))))

(declare-fun bm!2600 () Bool)

(assert (=> bm!2600 (= call!2601 (arrayRangesEq!441 (ite c!8389 (array!7300 (store (arr!4199 arr!153) from!240 (_2!7592 (readBytePure!0 bs!65))) (size!3304 arr!153)) lt!248278) (ite c!8389 (_3!453 lt!248269) lt!248270) (ite c!8389 #b00000000000000000000000000000000 lt!248271) (ite c!8389 (bvadd #b00000000000000000000000000000001 from!240) lt!248267)))))

(assert (= (and d!52710 c!8389) b!157751))

(assert (= (and d!52710 (not c!8389)) b!157747))

(assert (= (or b!157751 b!157747) bm!2600))

(assert (= (or b!157751 b!157747) bm!2599))

(assert (= (or b!157751 b!157747) bm!2598))

(assert (= (and d!52710 res!131796) b!157750))

(assert (= (and b!157750 res!131794) b!157748))

(assert (= (and d!52710 (not res!131795)) b!157749))

(declare-fun m!247115 () Bool)

(assert (=> d!52710 m!247115))

(declare-fun m!247117 () Bool)

(assert (=> d!52710 m!247117))

(declare-fun m!247119 () Bool)

(assert (=> bm!2600 m!247119))

(declare-fun m!247121 () Bool)

(assert (=> b!157751 m!247121))

(declare-fun m!247123 () Bool)

(assert (=> b!157751 m!247123))

(declare-fun m!247125 () Bool)

(assert (=> b!157751 m!247125))

(assert (=> b!157751 m!246965))

(declare-fun m!247127 () Bool)

(assert (=> b!157751 m!247127))

(declare-fun m!247129 () Bool)

(assert (=> b!157751 m!247129))

(declare-fun m!247131 () Bool)

(assert (=> b!157751 m!247131))

(declare-fun m!247133 () Bool)

(assert (=> b!157751 m!247133))

(declare-fun m!247135 () Bool)

(assert (=> b!157751 m!247135))

(declare-fun m!247137 () Bool)

(assert (=> b!157751 m!247137))

(declare-fun m!247139 () Bool)

(assert (=> b!157751 m!247139))

(declare-fun m!247141 () Bool)

(assert (=> b!157751 m!247141))

(declare-fun m!247143 () Bool)

(assert (=> b!157751 m!247143))

(declare-fun m!247145 () Bool)

(assert (=> b!157749 m!247145))

(assert (=> b!157749 m!246917))

(declare-fun m!247147 () Bool)

(assert (=> b!157748 m!247147))

(assert (=> bm!2598 m!247117))

(declare-fun m!247149 () Bool)

(assert (=> bm!2599 m!247149))

(declare-fun m!247151 () Bool)

(assert (=> b!157747 m!247151))

(declare-fun m!247153 () Bool)

(assert (=> b!157747 m!247153))

(assert (=> d!52656 d!52710))

(declare-fun d!52728 () Bool)

(assert (=> d!52728 (= (remainingBits!0 ((_ sign_extend 32) (size!3304 (buf!3774 bs!65))) ((_ sign_extend 32) (currentByte!6928 bs!65)) ((_ sign_extend 32) (currentBit!6923 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3304 (buf!3774 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6928 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6923 bs!65)))))))

(assert (=> d!52678 d!52728))

(declare-fun e!106991 () tuple3!672)

(declare-fun lt!248319 () Unit!10423)

(declare-fun b!157752 () Bool)

(assert (=> b!157752 (= e!106991 (tuple3!673 lt!248319 bs!65 arr!153))))

(declare-fun call!2606 () (_ BitVec 64))

(assert (=> b!157752 (= call!2606 call!2606)))

(declare-fun lt!248299 () Unit!10423)

(declare-fun Unit!10468 () Unit!10423)

(assert (=> b!157752 (= lt!248299 Unit!10468)))

(declare-fun lt!248308 () Unit!10423)

(assert (=> b!157752 (= lt!248308 (arrayRangesEqReflexiveLemma!49 arr!153))))

(declare-fun call!2605 () Bool)

(assert (=> b!157752 call!2605))

(declare-fun lt!248324 () Unit!10423)

(assert (=> b!157752 (= lt!248324 lt!248308)))

(declare-fun lt!248314 () array!7299)

(assert (=> b!157752 (= lt!248314 arr!153)))

(declare-fun lt!248306 () array!7299)

(assert (=> b!157752 (= lt!248306 arr!153)))

(declare-fun lt!248315 () (_ BitVec 32))

(assert (=> b!157752 (= lt!248315 #b00000000000000000000000000000000)))

(declare-fun lt!248310 () (_ BitVec 32))

(assert (=> b!157752 (= lt!248310 (size!3304 arr!153))))

(declare-fun lt!248307 () (_ BitVec 32))

(assert (=> b!157752 (= lt!248307 #b00000000000000000000000000000000)))

(declare-fun lt!248303 () (_ BitVec 32))

(assert (=> b!157752 (= lt!248303 from!240)))

(assert (=> b!157752 (= lt!248319 (arrayRangesEqSlicedLemma!49 lt!248314 lt!248306 lt!248315 lt!248310 lt!248307 lt!248303))))

(declare-fun call!2604 () Bool)

(assert (=> b!157752 call!2604))

(declare-fun b!157753 () Bool)

(declare-fun e!106993 () Bool)

(declare-fun lt!248312 () tuple3!672)

(assert (=> b!157753 (= e!106993 (arrayRangesEq!441 arr!153 (_3!453 lt!248312) #b00000000000000000000000000000000 from!240))))

(declare-fun b!157754 () Bool)

(declare-fun e!106992 () Bool)

(assert (=> b!157754 (= e!106992 (= (select (arr!4199 (_3!453 lt!248312)) from!240) (_2!7592 (readBytePure!0 bs!65))))))

(assert (=> b!157754 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3304 (_3!453 lt!248312))))))

(declare-fun d!52730 () Bool)

(assert (=> d!52730 e!106992))

(declare-fun res!131798 () Bool)

(assert (=> d!52730 (=> res!131798 e!106992)))

(assert (=> d!52730 (= res!131798 (bvsge from!240 to!236))))

(declare-fun lt!248294 () Bool)

(assert (=> d!52730 (= lt!248294 e!106993)))

(declare-fun res!131799 () Bool)

(assert (=> d!52730 (=> (not res!131799) (not e!106993))))

(declare-fun lt!248326 () (_ BitVec 64))

(declare-fun lt!248323 () (_ BitVec 64))

(assert (=> d!52730 (= res!131799 (= (bvadd lt!248326 lt!248323) (bitIndex!0 (size!3304 (buf!3774 (_2!7600 lt!248312))) (currentByte!6928 (_2!7600 lt!248312)) (currentBit!6923 (_2!7600 lt!248312)))))))

(assert (=> d!52730 (or (not (= (bvand lt!248326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248323 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248326 lt!248323) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!248302 () (_ BitVec 64))

(assert (=> d!52730 (= lt!248323 (bvmul lt!248302 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52730 (or (= lt!248302 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248302 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248302)))))

(assert (=> d!52730 (= lt!248302 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52730 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52730 (= lt!248326 (bitIndex!0 (size!3304 (buf!3774 bs!65)) (currentByte!6928 bs!65) (currentBit!6923 bs!65)))))

(assert (=> d!52730 (= lt!248312 e!106991)))

(declare-fun c!8390 () Bool)

(assert (=> d!52730 (= c!8390 (bvslt from!240 to!236))))

(assert (=> d!52730 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3304 arr!153)))))

(assert (=> d!52730 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!248312)))

(declare-fun bm!2601 () Bool)

(assert (=> bm!2601 (= call!2606 (bitIndex!0 (size!3304 (buf!3774 bs!65)) (currentByte!6928 bs!65) (currentBit!6923 bs!65)))))

(declare-fun b!157755 () Bool)

(declare-fun res!131797 () Bool)

(assert (=> b!157755 (=> (not res!131797) (not e!106993))))

(assert (=> b!157755 (= res!131797 (and (= (buf!3774 bs!65) (buf!3774 (_2!7600 lt!248312))) (= (size!3304 arr!153) (size!3304 (_3!453 lt!248312)))))))

(declare-fun b!157756 () Bool)

(declare-fun lt!248320 () Unit!10423)

(declare-fun lt!248305 () tuple3!672)

(assert (=> b!157756 (= e!106991 (tuple3!673 lt!248320 (_2!7600 lt!248305) (_3!453 lt!248305)))))

(declare-fun lt!248325 () tuple2!14290)

(assert (=> b!157756 (= lt!248325 (readByte!0 bs!65))))

(declare-fun lt!248327 () array!7299)

(assert (=> b!157756 (= lt!248327 (array!7300 (store (arr!4199 arr!153) from!240 (_1!7598 lt!248325)) (size!3304 arr!153)))))

(declare-fun lt!248311 () (_ BitVec 64))

(assert (=> b!157756 (= lt!248311 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!248313 () (_ BitVec 32))

(assert (=> b!157756 (= lt!248313 (bvsub to!236 from!240))))

(declare-fun lt!248321 () Unit!10423)

(assert (=> b!157756 (= lt!248321 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7598 lt!248325) lt!248311 lt!248313))))

(assert (=> b!157756 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3304 (buf!3774 (_2!7598 lt!248325)))) ((_ sign_extend 32) (currentByte!6928 (_2!7598 lt!248325))) ((_ sign_extend 32) (currentBit!6923 (_2!7598 lt!248325))) (bvsub lt!248313 ((_ extract 31 0) (bvsdiv (bvadd lt!248311 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!248297 () Unit!10423)

(assert (=> b!157756 (= lt!248297 lt!248321)))

(assert (=> b!157756 (= lt!248305 (readByteArrayLoop!0 (_2!7598 lt!248325) lt!248327 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157756 (= (bitIndex!0 (size!3304 (buf!3774 (_2!7598 lt!248325))) (currentByte!6928 (_2!7598 lt!248325)) (currentBit!6923 (_2!7598 lt!248325))) (bvadd call!2606 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!248304 () Unit!10423)

(declare-fun Unit!10472 () Unit!10423)

(assert (=> b!157756 (= lt!248304 Unit!10472)))

(assert (=> b!157756 (= (bvadd (bitIndex!0 (size!3304 (buf!3774 (_2!7598 lt!248325))) (currentByte!6928 (_2!7598 lt!248325)) (currentBit!6923 (_2!7598 lt!248325))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3304 (buf!3774 (_2!7600 lt!248305))) (currentByte!6928 (_2!7600 lt!248305)) (currentBit!6923 (_2!7600 lt!248305))))))

(declare-fun lt!248293 () Unit!10423)

(declare-fun Unit!10473 () Unit!10423)

(assert (=> b!157756 (= lt!248293 Unit!10473)))

(assert (=> b!157756 (= (bvadd call!2606 (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3304 (buf!3774 (_2!7600 lt!248305))) (currentByte!6928 (_2!7600 lt!248305)) (currentBit!6923 (_2!7600 lt!248305))))))

(declare-fun lt!248316 () Unit!10423)

(declare-fun Unit!10474 () Unit!10423)

(assert (=> b!157756 (= lt!248316 Unit!10474)))

(assert (=> b!157756 (and (= (buf!3774 bs!65) (buf!3774 (_2!7600 lt!248305))) (= (size!3304 arr!153) (size!3304 (_3!453 lt!248305))))))

(declare-fun lt!248309 () Unit!10423)

(declare-fun Unit!10475 () Unit!10423)

(assert (=> b!157756 (= lt!248309 Unit!10475)))

(declare-fun lt!248292 () Unit!10423)

(assert (=> b!157756 (= lt!248292 (arrayUpdatedAtPrefixLemma!49 arr!153 from!240 (_1!7598 lt!248325)))))

(assert (=> b!157756 (arrayRangesEq!441 arr!153 (array!7300 (store (arr!4199 arr!153) from!240 (_1!7598 lt!248325)) (size!3304 arr!153)) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!248295 () Unit!10423)

(assert (=> b!157756 (= lt!248295 lt!248292)))

(declare-fun lt!248298 () (_ BitVec 32))

(assert (=> b!157756 (= lt!248298 #b00000000000000000000000000000000)))

(declare-fun lt!248301 () Unit!10423)

(assert (=> b!157756 (= lt!248301 (arrayRangesEqTransitive!114 arr!153 lt!248327 (_3!453 lt!248305) lt!248298 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157756 call!2605))

(declare-fun lt!248296 () Unit!10423)

(assert (=> b!157756 (= lt!248296 lt!248301)))

(assert (=> b!157756 call!2604))

(declare-fun lt!248317 () Unit!10423)

(declare-fun Unit!10478 () Unit!10423)

(assert (=> b!157756 (= lt!248317 Unit!10478)))

(declare-fun lt!248322 () Unit!10423)

(assert (=> b!157756 (= lt!248322 (arrayRangesEqImpliesEq!58 lt!248327 (_3!453 lt!248305) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157756 (= (select (store (arr!4199 arr!153) from!240 (_1!7598 lt!248325)) from!240) (select (arr!4199 (_3!453 lt!248305)) from!240))))

(declare-fun lt!248300 () Unit!10423)

(assert (=> b!157756 (= lt!248300 lt!248322)))

(declare-fun lt!248318 () Bool)

(assert (=> b!157756 (= lt!248318 (= (select (arr!4199 (_3!453 lt!248305)) from!240) (_1!7598 lt!248325)))))

(declare-fun Unit!10479 () Unit!10423)

(assert (=> b!157756 (= lt!248320 Unit!10479)))

(assert (=> b!157756 lt!248318))

(declare-fun bm!2602 () Bool)

(assert (=> bm!2602 (= call!2605 (arrayRangesEq!441 arr!153 (ite c!8390 (_3!453 lt!248305) arr!153) (ite c!8390 lt!248298 #b00000000000000000000000000000000) (ite c!8390 from!240 (size!3304 arr!153))))))

(declare-fun bm!2603 () Bool)

(assert (=> bm!2603 (= call!2604 (arrayRangesEq!441 (ite c!8390 arr!153 lt!248314) (ite c!8390 (_3!453 lt!248305) lt!248306) (ite c!8390 #b00000000000000000000000000000000 lt!248307) (ite c!8390 from!240 lt!248303)))))

(assert (= (and d!52730 c!8390) b!157756))

(assert (= (and d!52730 (not c!8390)) b!157752))

(assert (= (or b!157756 b!157752) bm!2603))

(assert (= (or b!157756 b!157752) bm!2602))

(assert (= (or b!157756 b!157752) bm!2601))

(assert (= (and d!52730 res!131799) b!157755))

(assert (= (and b!157755 res!131797) b!157753))

(assert (= (and d!52730 (not res!131798)) b!157754))

(declare-fun m!247155 () Bool)

(assert (=> d!52730 m!247155))

(declare-fun m!247157 () Bool)

(assert (=> d!52730 m!247157))

(declare-fun m!247159 () Bool)

(assert (=> bm!2603 m!247159))

(declare-fun m!247161 () Bool)

(assert (=> b!157756 m!247161))

(declare-fun m!247163 () Bool)

(assert (=> b!157756 m!247163))

(declare-fun m!247165 () Bool)

(assert (=> b!157756 m!247165))

(assert (=> b!157756 m!246973))

(declare-fun m!247167 () Bool)

(assert (=> b!157756 m!247167))

(declare-fun m!247169 () Bool)

(assert (=> b!157756 m!247169))

(declare-fun m!247171 () Bool)

(assert (=> b!157756 m!247171))

(declare-fun m!247173 () Bool)

(assert (=> b!157756 m!247173))

(declare-fun m!247175 () Bool)

(assert (=> b!157756 m!247175))

(declare-fun m!247177 () Bool)

(assert (=> b!157756 m!247177))

(declare-fun m!247179 () Bool)

(assert (=> b!157756 m!247179))

(declare-fun m!247181 () Bool)

(assert (=> b!157756 m!247181))

(declare-fun m!247183 () Bool)

(assert (=> b!157756 m!247183))

(declare-fun m!247185 () Bool)

(assert (=> b!157754 m!247185))

(assert (=> b!157754 m!246907))

(declare-fun m!247187 () Bool)

(assert (=> b!157753 m!247187))

(assert (=> bm!2601 m!247157))

(declare-fun m!247189 () Bool)

(assert (=> bm!2602 m!247189))

(declare-fun m!247191 () Bool)

(assert (=> b!157752 m!247191))

(declare-fun m!247193 () Bool)

(assert (=> b!157752 m!247193))

(assert (=> d!52674 d!52730))

(declare-fun d!52732 () Bool)

(declare-fun e!106996 () Bool)

(assert (=> d!52732 e!106996))

(declare-fun res!131802 () Bool)

(assert (=> d!52732 (=> (not res!131802) (not e!106996))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5800 (_ BitVec 32)) Bool)

(assert (=> d!52732 (= res!131802 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10482 () Unit!10423)

(assert (=> d!52732 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14295 Unit!10482 (BitStream!5801 (buf!3774 bs!65) (bvadd (currentByte!6928 bs!65) #b00000000000000000000000000000001) (currentBit!6923 bs!65))))))

(declare-fun b!157759 () Bool)

(assert (=> b!157759 (= e!106996 (and (or (not (= (bvand (currentByte!6928 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6928 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6928 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6928 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6928 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52732 res!131802) b!157759))

(declare-fun m!247195 () Bool)

(assert (=> d!52732 m!247195))

(assert (=> d!52668 d!52732))

(declare-fun d!52734 () Bool)

(declare-fun lt!248419 () (_ BitVec 8))

(declare-fun lt!248420 () (_ BitVec 8))

(assert (=> d!52734 (= lt!248419 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4199 (buf!3774 lt!247939)) (currentByte!6928 lt!247939))) ((_ sign_extend 24) lt!248420))))))

(assert (=> d!52734 (= lt!248420 ((_ extract 7 0) (currentBit!6923 lt!247939)))))

(declare-fun e!107008 () Bool)

(assert (=> d!52734 e!107008))

(declare-fun res!131815 () Bool)

(assert (=> d!52734 (=> (not res!131815) (not e!107008))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52734 (= res!131815 (validate_offset_bits!1 ((_ sign_extend 32) (size!3304 (buf!3774 lt!247939))) ((_ sign_extend 32) (currentByte!6928 lt!247939)) ((_ sign_extend 32) (currentBit!6923 lt!247939)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14306 0))(
  ( (tuple2!14307 (_1!7609 Unit!10423) (_2!7609 (_ BitVec 8))) )
))
(declare-fun Unit!10484 () Unit!10423)

(declare-fun Unit!10485 () Unit!10423)

(assert (=> d!52734 (= (readByte!0 lt!247939) (tuple2!14291 (_2!7609 (ite (bvsgt ((_ sign_extend 24) lt!248420) #b00000000000000000000000000000000) (tuple2!14307 Unit!10484 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248419) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4199 (buf!3774 lt!247939)) (bvadd (currentByte!6928 lt!247939) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248420)))))))) (tuple2!14307 Unit!10485 lt!248419))) (BitStream!5801 (buf!3774 lt!247939) (bvadd (currentByte!6928 lt!247939) #b00000000000000000000000000000001) (currentBit!6923 lt!247939))))))

(declare-fun b!157774 () Bool)

(declare-fun e!107007 () Bool)

(assert (=> b!157774 (= e!107008 e!107007)))

(declare-fun res!131814 () Bool)

(assert (=> b!157774 (=> (not res!131814) (not e!107007))))

(declare-fun lt!248417 () tuple2!14290)

(assert (=> b!157774 (= res!131814 (= (buf!3774 (_2!7598 lt!248417)) (buf!3774 lt!247939)))))

(declare-fun lt!248416 () (_ BitVec 8))

(declare-fun lt!248414 () (_ BitVec 8))

(declare-fun Unit!10489 () Unit!10423)

(declare-fun Unit!10490 () Unit!10423)

(assert (=> b!157774 (= lt!248417 (tuple2!14291 (_2!7609 (ite (bvsgt ((_ sign_extend 24) lt!248416) #b00000000000000000000000000000000) (tuple2!14307 Unit!10489 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248414) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4199 (buf!3774 lt!247939)) (bvadd (currentByte!6928 lt!247939) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248416)))))))) (tuple2!14307 Unit!10490 lt!248414))) (BitStream!5801 (buf!3774 lt!247939) (bvadd (currentByte!6928 lt!247939) #b00000000000000000000000000000001) (currentBit!6923 lt!247939))))))

(assert (=> b!157774 (= lt!248414 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4199 (buf!3774 lt!247939)) (currentByte!6928 lt!247939))) ((_ sign_extend 24) lt!248416))))))

(assert (=> b!157774 (= lt!248416 ((_ extract 7 0) (currentBit!6923 lt!247939)))))

(declare-fun lt!248418 () (_ BitVec 64))

(declare-fun lt!248415 () (_ BitVec 64))

(declare-fun b!157775 () Bool)

(assert (=> b!157775 (= e!107007 (= (bitIndex!0 (size!3304 (buf!3774 (_2!7598 lt!248417))) (currentByte!6928 (_2!7598 lt!248417)) (currentBit!6923 (_2!7598 lt!248417))) (bvadd lt!248418 lt!248415)))))

(assert (=> b!157775 (or (not (= (bvand lt!248418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248415 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248418 lt!248415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157775 (= lt!248415 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157775 (= lt!248418 (bitIndex!0 (size!3304 (buf!3774 lt!247939)) (currentByte!6928 lt!247939) (currentBit!6923 lt!247939)))))

(assert (= (and d!52734 res!131815) b!157774))

(assert (= (and b!157774 res!131814) b!157775))

(declare-fun m!247197 () Bool)

(assert (=> d!52734 m!247197))

(declare-fun m!247199 () Bool)

(assert (=> d!52734 m!247199))

(declare-fun m!247201 () Bool)

(assert (=> d!52734 m!247201))

(assert (=> b!157774 m!247201))

(assert (=> b!157774 m!247197))

(declare-fun m!247203 () Bool)

(assert (=> b!157775 m!247203))

(assert (=> b!157775 m!247117))

(assert (=> d!52652 d!52734))

(declare-fun d!52736 () Bool)

(declare-fun lt!248426 () (_ BitVec 8))

(declare-fun lt!248427 () (_ BitVec 8))

(assert (=> d!52736 (= lt!248426 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4199 (buf!3774 bs!65)) (currentByte!6928 bs!65))) ((_ sign_extend 24) lt!248427))))))

(assert (=> d!52736 (= lt!248427 ((_ extract 7 0) (currentBit!6923 bs!65)))))

(declare-fun e!107010 () Bool)

(assert (=> d!52736 e!107010))

(declare-fun res!131817 () Bool)

(assert (=> d!52736 (=> (not res!131817) (not e!107010))))

(assert (=> d!52736 (= res!131817 (validate_offset_bits!1 ((_ sign_extend 32) (size!3304 (buf!3774 bs!65))) ((_ sign_extend 32) (currentByte!6928 bs!65)) ((_ sign_extend 32) (currentBit!6923 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10494 () Unit!10423)

(declare-fun Unit!10495 () Unit!10423)

(assert (=> d!52736 (= (readByte!0 bs!65) (tuple2!14291 (_2!7609 (ite (bvsgt ((_ sign_extend 24) lt!248427) #b00000000000000000000000000000000) (tuple2!14307 Unit!10494 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248426) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4199 (buf!3774 bs!65)) (bvadd (currentByte!6928 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248427)))))))) (tuple2!14307 Unit!10495 lt!248426))) (BitStream!5801 (buf!3774 bs!65) (bvadd (currentByte!6928 bs!65) #b00000000000000000000000000000001) (currentBit!6923 bs!65))))))

(declare-fun b!157776 () Bool)

(declare-fun e!107009 () Bool)

(assert (=> b!157776 (= e!107010 e!107009)))

(declare-fun res!131816 () Bool)

(assert (=> b!157776 (=> (not res!131816) (not e!107009))))

(declare-fun lt!248424 () tuple2!14290)

(assert (=> b!157776 (= res!131816 (= (buf!3774 (_2!7598 lt!248424)) (buf!3774 bs!65)))))

(declare-fun lt!248421 () (_ BitVec 8))

(declare-fun lt!248423 () (_ BitVec 8))

(declare-fun Unit!10496 () Unit!10423)

(declare-fun Unit!10497 () Unit!10423)

(assert (=> b!157776 (= lt!248424 (tuple2!14291 (_2!7609 (ite (bvsgt ((_ sign_extend 24) lt!248423) #b00000000000000000000000000000000) (tuple2!14307 Unit!10496 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248421) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4199 (buf!3774 bs!65)) (bvadd (currentByte!6928 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248423)))))))) (tuple2!14307 Unit!10497 lt!248421))) (BitStream!5801 (buf!3774 bs!65) (bvadd (currentByte!6928 bs!65) #b00000000000000000000000000000001) (currentBit!6923 bs!65))))))

(assert (=> b!157776 (= lt!248421 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4199 (buf!3774 bs!65)) (currentByte!6928 bs!65))) ((_ sign_extend 24) lt!248423))))))

(assert (=> b!157776 (= lt!248423 ((_ extract 7 0) (currentBit!6923 bs!65)))))

(declare-fun lt!248422 () (_ BitVec 64))

(declare-fun b!157777 () Bool)

(declare-fun lt!248425 () (_ BitVec 64))

(assert (=> b!157777 (= e!107009 (= (bitIndex!0 (size!3304 (buf!3774 (_2!7598 lt!248424))) (currentByte!6928 (_2!7598 lt!248424)) (currentBit!6923 (_2!7598 lt!248424))) (bvadd lt!248425 lt!248422)))))

(assert (=> b!157777 (or (not (= (bvand lt!248425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248422 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248425 lt!248422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157777 (= lt!248422 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157777 (= lt!248425 (bitIndex!0 (size!3304 (buf!3774 bs!65)) (currentByte!6928 bs!65) (currentBit!6923 bs!65)))))

(assert (= (and d!52736 res!131817) b!157776))

(assert (= (and b!157776 res!131816) b!157777))

(declare-fun m!247205 () Bool)

(assert (=> d!52736 m!247205))

(declare-fun m!247207 () Bool)

(assert (=> d!52736 m!247207))

(declare-fun m!247209 () Bool)

(assert (=> d!52736 m!247209))

(assert (=> b!157776 m!247209))

(assert (=> b!157776 m!247205))

(declare-fun m!247211 () Bool)

(assert (=> b!157777 m!247211))

(assert (=> b!157777 m!247157))

(assert (=> d!52666 d!52736))

(push 1)

(assert (not d!52730))

(assert (not b!157749))

(assert (not b!157752))

(assert (not bm!2601))

(assert (not b!157748))

(assert (not d!52736))

(assert (not b!157753))

(assert (not b!157747))

(assert (not b!157754))

(assert (not bm!2603))

(assert (not bm!2600))

(assert (not bm!2599))

(assert (not b!157777))

(assert (not bm!2598))

(assert (not bm!2602))

(assert (not b!157751))

(assert (not b!157775))

(assert (not b!157756))

(assert (not d!52732))

(assert (not d!52734))

(assert (not d!52710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

