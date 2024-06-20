; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30746 () Bool)

(assert start!30746)

(declare-fun res!130490 () Bool)

(declare-fun e!105387 () Bool)

(assert (=> start!30746 (=> (not res!130490) (not e!105387))))

(declare-fun from!240 () (_ BitVec 32))

(declare-datatypes ((array!7144 0))(
  ( (array!7145 (arr!4051 (Array (_ BitVec 32) (_ BitVec 8))) (size!3207 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7144)

(declare-fun to!236 () (_ BitVec 32))

(assert (=> start!30746 (= res!130490 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3207 arr!153))))))

(assert (=> start!30746 e!105387))

(assert (=> start!30746 true))

(declare-fun array_inv!2996 (array!7144) Bool)

(assert (=> start!30746 (array_inv!2996 arr!153)))

(declare-datatypes ((BitStream!5672 0))(
  ( (BitStream!5673 (buf!3710 array!7144) (currentByte!6801 (_ BitVec 32)) (currentBit!6796 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5672)

(declare-fun e!105389 () Bool)

(declare-fun inv!12 (BitStream!5672) Bool)

(assert (=> start!30746 (and (inv!12 bs!65) e!105389)))

(declare-fun b!156092 () Bool)

(declare-fun res!130489 () Bool)

(assert (=> b!156092 (=> (not res!130489) (not e!105387))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156092 (= res!130489 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3207 (buf!3710 bs!65))) ((_ sign_extend 32) (currentByte!6801 bs!65)) ((_ sign_extend 32) (currentBit!6796 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156093 () Bool)

(declare-datatypes ((tuple2!13902 0))(
  ( (tuple2!13903 (_1!7383 BitStream!5672) (_2!7383 array!7144)) )
))
(declare-fun lt!243483 () tuple2!13902)

(declare-fun lt!243484 () tuple2!13902)

(assert (=> b!156093 (= e!105387 (and (= from!240 (bvsub to!236 #b00000000000000000000000000000001)) (bvsle #b00000000000000000000000000000000 to!236) (bvsle (size!3207 (_2!7383 lt!243483)) (size!3207 (_2!7383 lt!243484))) (bvsgt to!236 (size!3207 (_2!7383 lt!243483)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5672 array!7144 (_ BitVec 32) (_ BitVec 32)) tuple2!13902)

(declare-fun withMovedByteIndex!0 (BitStream!5672 (_ BitVec 32)) BitStream!5672)

(declare-datatypes ((tuple2!13904 0))(
  ( (tuple2!13905 (_1!7384 BitStream!5672) (_2!7384 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5672) tuple2!13904)

(assert (=> b!156093 (= lt!243484 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156093 (= lt!243483 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156094 () Bool)

(assert (=> b!156094 (= e!105389 (array_inv!2996 (buf!3710 bs!65)))))

(assert (= (and start!30746 res!130490) b!156092))

(assert (= (and b!156092 res!130489) b!156093))

(assert (= start!30746 b!156094))

(declare-fun m!242829 () Bool)

(assert (=> start!30746 m!242829))

(declare-fun m!242831 () Bool)

(assert (=> start!30746 m!242831))

(declare-fun m!242833 () Bool)

(assert (=> b!156092 m!242833))

(declare-fun m!242835 () Bool)

(assert (=> b!156093 m!242835))

(declare-fun m!242837 () Bool)

(assert (=> b!156093 m!242837))

(assert (=> b!156093 m!242837))

(declare-fun m!242839 () Bool)

(assert (=> b!156093 m!242839))

(declare-fun m!242841 () Bool)

(assert (=> b!156093 m!242841))

(declare-fun m!242843 () Bool)

(assert (=> b!156093 m!242843))

(declare-fun m!242845 () Bool)

(assert (=> b!156094 m!242845))

(push 1)

(assert (not b!156093))

(assert (not start!30746))

(assert (not b!156092))

(assert (not b!156094))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-datatypes ((Unit!9953 0))(
  ( (Unit!9954) )
))
(declare-datatypes ((tuple3!634 0))(
  ( (tuple3!635 (_1!7391 Unit!9953) (_2!7391 BitStream!5672) (_3!434 array!7144)) )
))
(declare-fun lt!243497 () tuple3!634)

(declare-fun d!51806 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5672 array!7144 (_ BitVec 32) (_ BitVec 32)) tuple3!634)

(assert (=> d!51806 (= lt!243497 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51806 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13903 (_2!7391 lt!243497) (_3!434 lt!243497)))))

(declare-fun bs!12683 () Bool)

(assert (= bs!12683 d!51806))

(assert (=> bs!12683 m!242837))

(declare-fun m!242863 () Bool)

(assert (=> bs!12683 m!242863))

(assert (=> b!156093 d!51806))

(declare-fun d!51814 () Bool)

(declare-datatypes ((tuple2!13914 0))(
  ( (tuple2!13915 (_1!7392 Unit!9953) (_2!7392 BitStream!5672)) )
))
(declare-fun moveByteIndex!0 (BitStream!5672 (_ BitVec 32)) tuple2!13914)

(assert (=> d!51814 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7392 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12686 () Bool)

(assert (= bs!12686 d!51814))

(declare-fun m!242869 () Bool)

(assert (=> bs!12686 m!242869))

(assert (=> b!156093 d!51814))

(declare-fun d!51822 () Bool)

(declare-datatypes ((tuple2!13916 0))(
  ( (tuple2!13917 (_1!7393 (_ BitVec 8)) (_2!7393 BitStream!5672)) )
))
(declare-fun lt!243504 () tuple2!13916)

(declare-fun readByte!0 (BitStream!5672) tuple2!13916)

(assert (=> d!51822 (= lt!243504 (readByte!0 bs!65))))

(assert (=> d!51822 (= (readBytePure!0 bs!65) (tuple2!13905 (_2!7393 lt!243504) (_1!7393 lt!243504)))))

(declare-fun bs!12689 () Bool)

(assert (= bs!12689 d!51822))

(declare-fun m!242875 () Bool)

(assert (=> bs!12689 m!242875))

(assert (=> b!156093 d!51822))

(declare-fun lt!243505 () tuple3!634)

(declare-fun d!51828 () Bool)

(assert (=> d!51828 (= lt!243505 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51828 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13903 (_2!7391 lt!243505) (_3!434 lt!243505)))))

(declare-fun bs!12690 () Bool)

(assert (= bs!12690 d!51828))

(declare-fun m!242877 () Bool)

(assert (=> bs!12690 m!242877))

(assert (=> b!156093 d!51828))

(declare-fun d!51830 () Bool)

(assert (=> d!51830 (= (array_inv!2996 arr!153) (bvsge (size!3207 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30746 d!51830))

(declare-fun d!51832 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51832 (= (inv!12 bs!65) (invariant!0 (currentBit!6796 bs!65) (currentByte!6801 bs!65) (size!3207 (buf!3710 bs!65))))))

(declare-fun bs!12691 () Bool)

(assert (= bs!12691 d!51832))

(declare-fun m!242879 () Bool)

(assert (=> bs!12691 m!242879))

(assert (=> start!30746 d!51832))

(declare-fun d!51834 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51834 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3207 (buf!3710 bs!65))) ((_ sign_extend 32) (currentByte!6801 bs!65)) ((_ sign_extend 32) (currentBit!6796 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3207 (buf!3710 bs!65))) ((_ sign_extend 32) (currentByte!6801 bs!65)) ((_ sign_extend 32) (currentBit!6796 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12692 () Bool)

(assert (= bs!12692 d!51834))

(declare-fun m!242881 () Bool)

(assert (=> bs!12692 m!242881))

(assert (=> b!156092 d!51834))

(declare-fun d!51836 () Bool)

(assert (=> d!51836 (= (array_inv!2996 (buf!3710 bs!65)) (bvsge (size!3207 (buf!3710 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156094 d!51836))

(push 1)

(assert (not d!51822))

(assert (not d!51806))

(assert (not d!51828))

(assert (not d!51814))

(assert (not d!51834))

(assert (not d!51832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!156147 () Bool)

(declare-fun e!105426 () tuple3!634)

(declare-fun lt!243849 () Unit!9953)

(declare-fun lt!243830 () tuple3!634)

(assert (=> b!156147 (= e!105426 (tuple3!635 lt!243849 (_2!7391 lt!243830) (_3!434 lt!243830)))))

(declare-fun lt!243835 () tuple2!13916)

(assert (=> b!156147 (= lt!243835 (readByte!0 bs!65))))

(declare-fun lt!243838 () array!7144)

(assert (=> b!156147 (= lt!243838 (array!7145 (store (arr!4051 arr!153) from!240 (_1!7393 lt!243835)) (size!3207 arr!153)))))

(declare-fun lt!243820 () (_ BitVec 64))

(assert (=> b!156147 (= lt!243820 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243846 () (_ BitVec 32))

(assert (=> b!156147 (= lt!243846 (bvsub to!236 from!240))))

(declare-fun lt!243818 () Unit!9953)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5672 BitStream!5672 (_ BitVec 64) (_ BitVec 32)) Unit!9953)

(assert (=> b!156147 (= lt!243818 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7393 lt!243835) lt!243820 lt!243846))))

(assert (=> b!156147 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3207 (buf!3710 (_2!7393 lt!243835)))) ((_ sign_extend 32) (currentByte!6801 (_2!7393 lt!243835))) ((_ sign_extend 32) (currentBit!6796 (_2!7393 lt!243835))) (bvsub lt!243846 ((_ extract 31 0) (bvsdiv (bvadd lt!243820 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243850 () Unit!9953)

(assert (=> b!156147 (= lt!243850 lt!243818)))

(assert (=> b!156147 (= lt!243830 (readByteArrayLoop!0 (_2!7393 lt!243835) lt!243838 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156147 (= (bitIndex!0 (size!3207 (buf!3710 (_2!7393 lt!243835))) (currentByte!6801 (_2!7393 lt!243835)) (currentBit!6796 (_2!7393 lt!243835))) (bvadd (bitIndex!0 (size!3207 (buf!3710 bs!65)) (currentByte!6801 bs!65) (currentBit!6796 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243844 () Unit!9953)

(declare-fun Unit!9975 () Unit!9953)

(assert (=> b!156147 (= lt!243844 Unit!9975)))

(declare-fun call!2375 () (_ BitVec 64))

(assert (=> b!156147 (= (bvadd (bitIndex!0 (size!3207 (buf!3710 (_2!7393 lt!243835))) (currentByte!6801 (_2!7393 lt!243835)) (currentBit!6796 (_2!7393 lt!243835))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2375)))

(declare-fun lt!243819 () Unit!9953)

(declare-fun Unit!9976 () Unit!9953)

(assert (=> b!156147 (= lt!243819 Unit!9976)))

(assert (=> b!156147 (= (bvadd (bitIndex!0 (size!3207 (buf!3710 bs!65)) (currentByte!6801 bs!65) (currentBit!6796 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2375)))

(declare-fun lt!243824 () Unit!9953)

(declare-fun Unit!9977 () Unit!9953)

(assert (=> b!156147 (= lt!243824 Unit!9977)))

(assert (=> b!156147 (and (= (buf!3710 bs!65) (buf!3710 (_2!7391 lt!243830))) (= (size!3207 arr!153) (size!3207 (_3!434 lt!243830))))))

(declare-fun lt!243816 () Unit!9953)

(declare-fun Unit!9978 () Unit!9953)

(assert (=> b!156147 (= lt!243816 Unit!9978)))

(declare-fun lt!243827 () Unit!9953)

(declare-fun arrayUpdatedAtPrefixLemma!31 (array!7144 (_ BitVec 32) (_ BitVec 8)) Unit!9953)

(assert (=> b!156147 (= lt!243827 (arrayUpdatedAtPrefixLemma!31 arr!153 from!240 (_1!7393 lt!243835)))))

(declare-fun call!2373 () Bool)

(assert (=> b!156147 call!2373))

(declare-fun lt!243836 () Unit!9953)

(assert (=> b!156147 (= lt!243836 lt!243827)))

(declare-fun lt!243848 () (_ BitVec 32))

(assert (=> b!156147 (= lt!243848 #b00000000000000000000000000000000)))

(declare-fun lt!243840 () Unit!9953)

(declare-fun arrayRangesEqTransitive!96 (array!7144 array!7144 array!7144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9953)

(assert (=> b!156147 (= lt!243840 (arrayRangesEqTransitive!96 arr!153 lt!243838 (_3!434 lt!243830) lt!243848 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(declare-fun arrayRangesEq!420 (array!7144 array!7144 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156147 (arrayRangesEq!420 arr!153 (_3!434 lt!243830) lt!243848 from!240)))

(declare-fun lt!243834 () Unit!9953)

(assert (=> b!156147 (= lt!243834 lt!243840)))

(declare-fun call!2374 () Bool)

(assert (=> b!156147 call!2374))

(declare-fun lt!243829 () Unit!9953)

(declare-fun Unit!9983 () Unit!9953)

(assert (=> b!156147 (= lt!243829 Unit!9983)))

(declare-fun lt!243817 () Unit!9953)

(declare-fun arrayRangesEqImpliesEq!40 (array!7144 array!7144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9953)

(assert (=> b!156147 (= lt!243817 (arrayRangesEqImpliesEq!40 lt!243838 (_3!434 lt!243830) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156147 (= (select (store (arr!4051 arr!153) from!240 (_1!7393 lt!243835)) from!240) (select (arr!4051 (_3!434 lt!243830)) from!240))))

(declare-fun lt!243821 () Unit!9953)

(assert (=> b!156147 (= lt!243821 lt!243817)))

(declare-fun lt!243825 () Bool)

(assert (=> b!156147 (= lt!243825 (= (select (arr!4051 (_3!434 lt!243830)) from!240) (_1!7393 lt!243835)))))

(declare-fun Unit!9984 () Unit!9953)

(assert (=> b!156147 (= lt!243849 Unit!9984)))

(assert (=> b!156147 lt!243825))

(declare-fun b!156148 () Bool)

(declare-fun e!105428 () Bool)

(declare-fun lt!243826 () tuple3!634)

(assert (=> b!156148 (= e!105428 (= (select (arr!4051 (_3!434 lt!243826)) from!240) (_2!7384 (readBytePure!0 bs!65))))))

(assert (=> b!156148 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3207 (_3!434 lt!243826))))))

(declare-fun e!105427 () Bool)

(declare-fun b!156149 () Bool)

(assert (=> b!156149 (= e!105427 (arrayRangesEq!420 arr!153 (_3!434 lt!243826) #b00000000000000000000000000000000 from!240))))

(declare-fun d!51842 () Bool)

(assert (=> d!51842 e!105428))

(declare-fun res!130528 () Bool)

(assert (=> d!51842 (=> res!130528 e!105428)))

(assert (=> d!51842 (= res!130528 (bvsge from!240 to!236))))

(declare-fun lt!243823 () Bool)

(assert (=> d!51842 (= lt!243823 e!105427)))

(declare-fun res!130530 () Bool)

(assert (=> d!51842 (=> (not res!130530) (not e!105427))))

(declare-fun lt!243832 () (_ BitVec 64))

(declare-fun lt!243822 () (_ BitVec 64))

(assert (=> d!51842 (= res!130530 (= (bvadd lt!243822 lt!243832) (bitIndex!0 (size!3207 (buf!3710 (_2!7391 lt!243826))) (currentByte!6801 (_2!7391 lt!243826)) (currentBit!6796 (_2!7391 lt!243826)))))))

(assert (=> d!51842 (or (not (= (bvand lt!243822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243832 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243822 lt!243832) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243843 () (_ BitVec 64))

(assert (=> d!51842 (= lt!243832 (bvmul lt!243843 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51842 (or (= lt!243843 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243843 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243843)))))

(assert (=> d!51842 (= lt!243843 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51842 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51842 (= lt!243822 (bitIndex!0 (size!3207 (buf!3710 bs!65)) (currentByte!6801 bs!65) (currentBit!6796 bs!65)))))

(assert (=> d!51842 (= lt!243826 e!105426)))

(declare-fun c!8313 () Bool)

(assert (=> d!51842 (= c!8313 (bvslt from!240 to!236))))

(assert (=> d!51842 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3207 arr!153)))))

(assert (=> d!51842 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!243826)))

(declare-fun b!156150 () Bool)

(declare-fun res!130529 () Bool)

(assert (=> b!156150 (=> (not res!130529) (not e!105427))))

(assert (=> b!156150 (= res!130529 (and (= (buf!3710 bs!65) (buf!3710 (_2!7391 lt!243826))) (= (size!3207 arr!153) (size!3207 (_3!434 lt!243826)))))))

(declare-fun bm!2370 () Bool)

(assert (=> bm!2370 (= call!2375 (bitIndex!0 (ite c!8313 (size!3207 (buf!3710 (_2!7391 lt!243830))) (size!3207 (buf!3710 bs!65))) (ite c!8313 (currentByte!6801 (_2!7391 lt!243830)) (currentByte!6801 bs!65)) (ite c!8313 (currentBit!6796 (_2!7391 lt!243830)) (currentBit!6796 bs!65))))))

(declare-fun bm!2371 () Bool)

(assert (=> bm!2371 (= call!2373 (arrayRangesEq!420 arr!153 (ite c!8313 (array!7145 (store (arr!4051 arr!153) from!240 (_1!7393 lt!243835)) (size!3207 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8313 from!240 (size!3207 arr!153))))))

(declare-fun b!156151 () Bool)

(declare-fun lt!243841 () Unit!9953)

(assert (=> b!156151 (= e!105426 (tuple3!635 lt!243841 bs!65 arr!153))))

(assert (=> b!156151 (= call!2375 call!2375)))

(declare-fun lt!243845 () Unit!9953)

(declare-fun Unit!9988 () Unit!9953)

(assert (=> b!156151 (= lt!243845 Unit!9988)))

(declare-fun lt!243828 () Unit!9953)

(declare-fun arrayRangesEqReflexiveLemma!32 (array!7144) Unit!9953)

(assert (=> b!156151 (= lt!243828 (arrayRangesEqReflexiveLemma!32 arr!153))))

(assert (=> b!156151 call!2373))

(declare-fun lt!243847 () Unit!9953)

(assert (=> b!156151 (= lt!243847 lt!243828)))

(declare-fun lt!243833 () array!7144)

(assert (=> b!156151 (= lt!243833 arr!153)))

(declare-fun lt!243842 () array!7144)

(assert (=> b!156151 (= lt!243842 arr!153)))

(declare-fun lt!243831 () (_ BitVec 32))

(assert (=> b!156151 (= lt!243831 #b00000000000000000000000000000000)))

(declare-fun lt!243815 () (_ BitVec 32))

(assert (=> b!156151 (= lt!243815 (size!3207 arr!153))))

(declare-fun lt!243837 () (_ BitVec 32))

(assert (=> b!156151 (= lt!243837 #b00000000000000000000000000000000)))

(declare-fun lt!243839 () (_ BitVec 32))

(assert (=> b!156151 (= lt!243839 from!240)))

(declare-fun arrayRangesEqSlicedLemma!32 (array!7144 array!7144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9953)

(assert (=> b!156151 (= lt!243841 (arrayRangesEqSlicedLemma!32 lt!243833 lt!243842 lt!243831 lt!243815 lt!243837 lt!243839))))

(assert (=> b!156151 call!2374))

(declare-fun bm!2372 () Bool)

(assert (=> bm!2372 (= call!2374 (arrayRangesEq!420 (ite c!8313 arr!153 lt!243833) (ite c!8313 (_3!434 lt!243830) lt!243842) (ite c!8313 #b00000000000000000000000000000000 lt!243837) (ite c!8313 from!240 lt!243839)))))

(assert (= (and d!51842 c!8313) b!156147))

(assert (= (and d!51842 (not c!8313)) b!156151))

(assert (= (or b!156147 b!156151) bm!2372))

(assert (= (or b!156147 b!156151) bm!2371))

(assert (= (or b!156147 b!156151) bm!2370))

(assert (= (and d!51842 res!130530) b!156150))

(assert (= (and b!156150 res!130529) b!156149))

(assert (= (and d!51842 (not res!130528)) b!156148))

(declare-fun m!242979 () Bool)

(assert (=> bm!2371 m!242979))

(declare-fun m!242981 () Bool)

(assert (=> bm!2371 m!242981))

(declare-fun m!242983 () Bool)

(assert (=> bm!2370 m!242983))

(assert (=> b!156147 m!242875))

(declare-fun m!242985 () Bool)

(assert (=> b!156147 m!242985))

(declare-fun m!242987 () Bool)

(assert (=> b!156147 m!242987))

(declare-fun m!242989 () Bool)

(assert (=> b!156147 m!242989))

(assert (=> b!156147 m!242979))

(declare-fun m!242991 () Bool)

(assert (=> b!156147 m!242991))

(declare-fun m!242993 () Bool)

(assert (=> b!156147 m!242993))

(declare-fun m!242995 () Bool)

(assert (=> b!156147 m!242995))

(declare-fun m!242997 () Bool)

(assert (=> b!156147 m!242997))

(declare-fun m!242999 () Bool)

(assert (=> b!156147 m!242999))

(declare-fun m!243001 () Bool)

(assert (=> b!156147 m!243001))

(declare-fun m!243003 () Bool)

(assert (=> b!156147 m!243003))

(declare-fun m!243005 () Bool)

(assert (=> b!156147 m!243005))

(declare-fun m!243007 () Bool)

(assert (=> bm!2372 m!243007))

(declare-fun m!243009 () Bool)

(assert (=> b!156149 m!243009))

(declare-fun m!243011 () Bool)

(assert (=> d!51842 m!243011))

(assert (=> d!51842 m!242987))

(declare-fun m!243013 () Bool)

(assert (=> b!156148 m!243013))

(assert (=> b!156148 m!242835))

(declare-fun m!243015 () Bool)

(assert (=> b!156151 m!243015))

(declare-fun m!243017 () Bool)

(assert (=> b!156151 m!243017))

(assert (=> d!51828 d!51842))

(declare-fun d!51858 () Bool)

(declare-fun e!105434 () Bool)

(assert (=> d!51858 e!105434))

(declare-fun res!130536 () Bool)

(assert (=> d!51858 (=> (not res!130536) (not e!105434))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5672 (_ BitVec 32)) Bool)

(assert (=> d!51858 (= res!130536 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!9991 () Unit!9953)

(assert (=> d!51858 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13915 Unit!9991 (BitStream!5673 (buf!3710 bs!65) (bvadd (currentByte!6801 bs!65) #b00000000000000000000000000000001) (currentBit!6796 bs!65))))))

(declare-fun b!156159 () Bool)

(assert (=> b!156159 (= e!105434 (and (or (not (= (bvand (currentByte!6801 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6801 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6801 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6801 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6801 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51858 res!130536) b!156159))

(declare-fun m!243061 () Bool)

(assert (=> d!51858 m!243061))

(assert (=> d!51814 d!51858))

(declare-fun b!156160 () Bool)

(declare-fun e!105435 () tuple3!634)

(declare-fun lt!243921 () Unit!9953)

(declare-fun lt!243902 () tuple3!634)

(assert (=> b!156160 (= e!105435 (tuple3!635 lt!243921 (_2!7391 lt!243902) (_3!434 lt!243902)))))

(declare-fun lt!243907 () tuple2!13916)

(assert (=> b!156160 (= lt!243907 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!243910 () array!7144)

(assert (=> b!156160 (= lt!243910 (array!7145 (store (arr!4051 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7393 lt!243907)) (size!3207 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)))))))

(declare-fun lt!243892 () (_ BitVec 64))

(assert (=> b!156160 (= lt!243892 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243918 () (_ BitVec 32))

(assert (=> b!156160 (= lt!243918 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243890 () Unit!9953)

(assert (=> b!156160 (= lt!243890 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7393 lt!243907) lt!243892 lt!243918))))

(assert (=> b!156160 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3207 (buf!3710 (_2!7393 lt!243907)))) ((_ sign_extend 32) (currentByte!6801 (_2!7393 lt!243907))) ((_ sign_extend 32) (currentBit!6796 (_2!7393 lt!243907))) (bvsub lt!243918 ((_ extract 31 0) (bvsdiv (bvadd lt!243892 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243922 () Unit!9953)

(assert (=> b!156160 (= lt!243922 lt!243890)))

(assert (=> b!156160 (= lt!243902 (readByteArrayLoop!0 (_2!7393 lt!243907) lt!243910 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156160 (= (bitIndex!0 (size!3207 (buf!3710 (_2!7393 lt!243907))) (currentByte!6801 (_2!7393 lt!243907)) (currentBit!6796 (_2!7393 lt!243907))) (bvadd (bitIndex!0 (size!3207 (buf!3710 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6801 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6796 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243916 () Unit!9953)

(declare-fun Unit!9997 () Unit!9953)

(assert (=> b!156160 (= lt!243916 Unit!9997)))

(declare-fun call!2381 () (_ BitVec 64))

(assert (=> b!156160 (= (bvadd (bitIndex!0 (size!3207 (buf!3710 (_2!7393 lt!243907))) (currentByte!6801 (_2!7393 lt!243907)) (currentBit!6796 (_2!7393 lt!243907))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2381)))

(declare-fun lt!243891 () Unit!9953)

(declare-fun Unit!9998 () Unit!9953)

(assert (=> b!156160 (= lt!243891 Unit!9998)))

(assert (=> b!156160 (= (bvadd (bitIndex!0 (size!3207 (buf!3710 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6801 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6796 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2381)))

(declare-fun lt!243896 () Unit!9953)

(declare-fun Unit!9999 () Unit!9953)

(assert (=> b!156160 (= lt!243896 Unit!9999)))

(assert (=> b!156160 (and (= (buf!3710 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3710 (_2!7391 lt!243902))) (= (size!3207 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153))) (size!3207 (_3!434 lt!243902))))))

(declare-fun lt!243888 () Unit!9953)

(declare-fun Unit!10000 () Unit!9953)

(assert (=> b!156160 (= lt!243888 Unit!10000)))

(declare-fun lt!243899 () Unit!9953)

(assert (=> b!156160 (= lt!243899 (arrayUpdatedAtPrefixLemma!31 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7393 lt!243907)))))

(declare-fun call!2379 () Bool)

(assert (=> b!156160 call!2379))

(declare-fun lt!243908 () Unit!9953)

(assert (=> b!156160 (= lt!243908 lt!243899)))

(declare-fun lt!243920 () (_ BitVec 32))

(assert (=> b!156160 (= lt!243920 #b00000000000000000000000000000000)))

(declare-fun lt!243912 () Unit!9953)

(assert (=> b!156160 (= lt!243912 (arrayRangesEqTransitive!96 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)) lt!243910 (_3!434 lt!243902) lt!243920 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156160 (arrayRangesEq!420 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)) (_3!434 lt!243902) lt!243920 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!243906 () Unit!9953)

(assert (=> b!156160 (= lt!243906 lt!243912)))

(declare-fun call!2380 () Bool)

(assert (=> b!156160 call!2380))

(declare-fun lt!243901 () Unit!9953)

(declare-fun Unit!10001 () Unit!9953)

(assert (=> b!156160 (= lt!243901 Unit!10001)))

(declare-fun lt!243889 () Unit!9953)

(assert (=> b!156160 (= lt!243889 (arrayRangesEqImpliesEq!40 lt!243910 (_3!434 lt!243902) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156160 (= (select (store (arr!4051 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7393 lt!243907)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4051 (_3!434 lt!243902)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243893 () Unit!9953)

(assert (=> b!156160 (= lt!243893 lt!243889)))

(declare-fun lt!243897 () Bool)

(assert (=> b!156160 (= lt!243897 (= (select (arr!4051 (_3!434 lt!243902)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7393 lt!243907)))))

(declare-fun Unit!10002 () Unit!9953)

(assert (=> b!156160 (= lt!243921 Unit!10002)))

(assert (=> b!156160 lt!243897))

(declare-fun lt!243898 () tuple3!634)

(declare-fun b!156161 () Bool)

(declare-fun e!105437 () Bool)

(assert (=> b!156161 (= e!105437 (= (select (arr!4051 (_3!434 lt!243898)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7384 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!156161 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3207 (_3!434 lt!243898))))))

(declare-fun b!156162 () Bool)

(declare-fun e!105436 () Bool)

(assert (=> b!156162 (= e!105436 (arrayRangesEq!420 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)) (_3!434 lt!243898) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun d!51860 () Bool)

(assert (=> d!51860 e!105437))

(declare-fun res!130537 () Bool)

(assert (=> d!51860 (=> res!130537 e!105437)))

(assert (=> d!51860 (= res!130537 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!243895 () Bool)

(assert (=> d!51860 (= lt!243895 e!105436)))

(declare-fun res!130539 () Bool)

(assert (=> d!51860 (=> (not res!130539) (not e!105436))))

(declare-fun lt!243894 () (_ BitVec 64))

(declare-fun lt!243904 () (_ BitVec 64))

(assert (=> d!51860 (= res!130539 (= (bvadd lt!243894 lt!243904) (bitIndex!0 (size!3207 (buf!3710 (_2!7391 lt!243898))) (currentByte!6801 (_2!7391 lt!243898)) (currentBit!6796 (_2!7391 lt!243898)))))))

(assert (=> d!51860 (or (not (= (bvand lt!243894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243904 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243894 lt!243904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243915 () (_ BitVec 64))

(assert (=> d!51860 (= lt!243904 (bvmul lt!243915 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51860 (or (= lt!243915 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243915 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243915)))))

(assert (=> d!51860 (= lt!243915 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!51860 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!51860 (= lt!243894 (bitIndex!0 (size!3207 (buf!3710 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6801 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6796 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(assert (=> d!51860 (= lt!243898 e!105435)))

(declare-fun c!8315 () Bool)

(assert (=> d!51860 (= c!8315 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51860 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3207 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)))))))

(assert (=> d!51860 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!243898)))

(declare-fun b!156163 () Bool)

(declare-fun res!130538 () Bool)

(assert (=> b!156163 (=> (not res!130538) (not e!105436))))

(assert (=> b!156163 (= res!130538 (and (= (buf!3710 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3710 (_2!7391 lt!243898))) (= (size!3207 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153))) (size!3207 (_3!434 lt!243898)))))))

(declare-fun bm!2376 () Bool)

(assert (=> bm!2376 (= call!2381 (bitIndex!0 (ite c!8315 (size!3207 (buf!3710 (_2!7391 lt!243902))) (size!3207 (buf!3710 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))) (ite c!8315 (currentByte!6801 (_2!7391 lt!243902)) (currentByte!6801 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (ite c!8315 (currentBit!6796 (_2!7391 lt!243902)) (currentBit!6796 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(declare-fun bm!2377 () Bool)

(assert (=> bm!2377 (= call!2379 (arrayRangesEq!420 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)) (ite c!8315 (array!7145 (store (arr!4051 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7393 lt!243907)) (size!3207 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)))) (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153))) #b00000000000000000000000000000000 (ite c!8315 (bvadd #b00000000000000000000000000000001 from!240) (size!3207 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153))))))))

(declare-fun lt!243913 () Unit!9953)

(declare-fun b!156164 () Bool)

(assert (=> b!156164 (= e!105435 (tuple3!635 lt!243913 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153))))))

(assert (=> b!156164 (= call!2381 call!2381)))

(declare-fun lt!243917 () Unit!9953)

(declare-fun Unit!10007 () Unit!9953)

(assert (=> b!156164 (= lt!243917 Unit!10007)))

(declare-fun lt!243900 () Unit!9953)

(assert (=> b!156164 (= lt!243900 (arrayRangesEqReflexiveLemma!32 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153))))))

(assert (=> b!156164 call!2379))

(declare-fun lt!243919 () Unit!9953)

(assert (=> b!156164 (= lt!243919 lt!243900)))

(declare-fun lt!243905 () array!7144)

(assert (=> b!156164 (= lt!243905 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)))))

(declare-fun lt!243914 () array!7144)

(assert (=> b!156164 (= lt!243914 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)))))

(declare-fun lt!243903 () (_ BitVec 32))

(assert (=> b!156164 (= lt!243903 #b00000000000000000000000000000000)))

(declare-fun lt!243887 () (_ BitVec 32))

(assert (=> b!156164 (= lt!243887 (size!3207 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153))))))

(declare-fun lt!243909 () (_ BitVec 32))

(assert (=> b!156164 (= lt!243909 #b00000000000000000000000000000000)))

(declare-fun lt!243911 () (_ BitVec 32))

(assert (=> b!156164 (= lt!243911 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!156164 (= lt!243913 (arrayRangesEqSlicedLemma!32 lt!243905 lt!243914 lt!243903 lt!243887 lt!243909 lt!243911))))

(assert (=> b!156164 call!2380))

(declare-fun bm!2378 () Bool)

(assert (=> bm!2378 (= call!2380 (arrayRangesEq!420 (ite c!8315 (array!7145 (store (arr!4051 arr!153) from!240 (_2!7384 (readBytePure!0 bs!65))) (size!3207 arr!153)) lt!243905) (ite c!8315 (_3!434 lt!243902) lt!243914) (ite c!8315 #b00000000000000000000000000000000 lt!243909) (ite c!8315 (bvadd #b00000000000000000000000000000001 from!240) lt!243911)))))

(assert (= (and d!51860 c!8315) b!156160))

(assert (= (and d!51860 (not c!8315)) b!156164))

(assert (= (or b!156160 b!156164) bm!2378))

(assert (= (or b!156160 b!156164) bm!2377))

(assert (= (or b!156160 b!156164) bm!2376))

(assert (= (and d!51860 res!130539) b!156163))

(assert (= (and b!156163 res!130538) b!156162))

(assert (= (and d!51860 (not res!130537)) b!156161))

(declare-fun m!243065 () Bool)

(assert (=> bm!2377 m!243065))

(declare-fun m!243067 () Bool)

(assert (=> bm!2377 m!243067))

(declare-fun m!243069 () Bool)

(assert (=> bm!2376 m!243069))

(assert (=> b!156160 m!242837))

(declare-fun m!243071 () Bool)

(assert (=> b!156160 m!243071))

(declare-fun m!243073 () Bool)

(assert (=> b!156160 m!243073))

(declare-fun m!243075 () Bool)

(assert (=> b!156160 m!243075))

(declare-fun m!243077 () Bool)

(assert (=> b!156160 m!243077))

(assert (=> b!156160 m!243065))

(declare-fun m!243079 () Bool)

(assert (=> b!156160 m!243079))

(declare-fun m!243081 () Bool)

(assert (=> b!156160 m!243081))

(declare-fun m!243083 () Bool)

(assert (=> b!156160 m!243083))

(assert (=> b!156160 m!242837))

(declare-fun m!243085 () Bool)

(assert (=> b!156160 m!243085))

(declare-fun m!243087 () Bool)

(assert (=> b!156160 m!243087))

(declare-fun m!243089 () Bool)

(assert (=> b!156160 m!243089))

(declare-fun m!243091 () Bool)

(assert (=> b!156160 m!243091))

(declare-fun m!243093 () Bool)

(assert (=> b!156160 m!243093))

(declare-fun m!243095 () Bool)

(assert (=> bm!2378 m!243095))

(declare-fun m!243097 () Bool)

(assert (=> b!156162 m!243097))

(declare-fun m!243099 () Bool)

(assert (=> d!51860 m!243099))

(assert (=> d!51860 m!243075))

(declare-fun m!243101 () Bool)

(assert (=> b!156161 m!243101))

(assert (=> b!156161 m!242837))

(declare-fun m!243103 () Bool)

(assert (=> b!156161 m!243103))

(declare-fun m!243107 () Bool)

(assert (=> b!156164 m!243107))

(declare-fun m!243109 () Bool)

(assert (=> b!156164 m!243109))

(assert (=> d!51806 d!51860))

(declare-fun d!51866 () Bool)

(assert (=> d!51866 (= (invariant!0 (currentBit!6796 bs!65) (currentByte!6801 bs!65) (size!3207 (buf!3710 bs!65))) (and (bvsge (currentBit!6796 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6796 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6801 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6801 bs!65) (size!3207 (buf!3710 bs!65))) (and (= (currentBit!6796 bs!65) #b00000000000000000000000000000000) (= (currentByte!6801 bs!65) (size!3207 (buf!3710 bs!65)))))))))

(assert (=> d!51832 d!51866))

(declare-fun d!51870 () Bool)

(declare-fun lt!243991 () (_ BitVec 8))

(declare-fun lt!243989 () (_ BitVec 8))

(assert (=> d!51870 (= lt!243991 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4051 (buf!3710 bs!65)) (currentByte!6801 bs!65))) ((_ sign_extend 24) lt!243989))))))

(assert (=> d!51870 (= lt!243989 ((_ extract 7 0) (currentBit!6796 bs!65)))))

(declare-fun e!105449 () Bool)

(assert (=> d!51870 e!105449))

(declare-fun res!130553 () Bool)

(assert (=> d!51870 (=> (not res!130553) (not e!105449))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51870 (= res!130553 (validate_offset_bits!1 ((_ sign_extend 32) (size!3207 (buf!3710 bs!65))) ((_ sign_extend 32) (currentByte!6801 bs!65)) ((_ sign_extend 32) (currentBit!6796 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13922 0))(
  ( (tuple2!13923 (_1!7396 Unit!9953) (_2!7396 (_ BitVec 8))) )
))
(declare-fun Unit!10008 () Unit!9953)

(declare-fun Unit!10009 () Unit!9953)

(assert (=> d!51870 (= (readByte!0 bs!65) (tuple2!13917 (_2!7396 (ite (bvsgt ((_ sign_extend 24) lt!243989) #b00000000000000000000000000000000) (tuple2!13923 Unit!10008 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!243991) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4051 (buf!3710 bs!65)) (bvadd (currentByte!6801 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!243989)))))))) (tuple2!13923 Unit!10009 lt!243991))) (BitStream!5673 (buf!3710 bs!65) (bvadd (currentByte!6801 bs!65) #b00000000000000000000000000000001) (currentBit!6796 bs!65))))))

(declare-fun b!156178 () Bool)

(declare-fun e!105450 () Bool)

(assert (=> b!156178 (= e!105449 e!105450)))

(declare-fun res!130554 () Bool)

(assert (=> b!156178 (=> (not res!130554) (not e!105450))))

(declare-fun lt!243988 () tuple2!13916)

(assert (=> b!156178 (= res!130554 (= (buf!3710 (_2!7393 lt!243988)) (buf!3710 bs!65)))))

(declare-fun lt!243993 () (_ BitVec 8))

(declare-fun lt!243992 () (_ BitVec 8))

(declare-fun Unit!10010 () Unit!9953)

(declare-fun Unit!10011 () Unit!9953)

(assert (=> b!156178 (= lt!243988 (tuple2!13917 (_2!7396 (ite (bvsgt ((_ sign_extend 24) lt!243992) #b00000000000000000000000000000000) (tuple2!13923 Unit!10010 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!243993) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4051 (buf!3710 bs!65)) (bvadd (currentByte!6801 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!243992)))))))) (tuple2!13923 Unit!10011 lt!243993))) (BitStream!5673 (buf!3710 bs!65) (bvadd (currentByte!6801 bs!65) #b00000000000000000000000000000001) (currentBit!6796 bs!65))))))

(assert (=> b!156178 (= lt!243993 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4051 (buf!3710 bs!65)) (currentByte!6801 bs!65))) ((_ sign_extend 24) lt!243992))))))

(assert (=> b!156178 (= lt!243992 ((_ extract 7 0) (currentBit!6796 bs!65)))))

(declare-fun lt!243990 () (_ BitVec 64))

(declare-fun b!156179 () Bool)

(declare-fun lt!243987 () (_ BitVec 64))

(assert (=> b!156179 (= e!105450 (= (bitIndex!0 (size!3207 (buf!3710 (_2!7393 lt!243988))) (currentByte!6801 (_2!7393 lt!243988)) (currentBit!6796 (_2!7393 lt!243988))) (bvadd lt!243990 lt!243987)))))

(assert (=> b!156179 (or (not (= (bvand lt!243990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243987 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243990 lt!243987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156179 (= lt!243987 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156179 (= lt!243990 (bitIndex!0 (size!3207 (buf!3710 bs!65)) (currentByte!6801 bs!65) (currentBit!6796 bs!65)))))

(assert (= (and d!51870 res!130553) b!156178))

(assert (= (and b!156178 res!130554) b!156179))

(declare-fun m!243149 () Bool)

(assert (=> d!51870 m!243149))

(declare-fun m!243151 () Bool)

(assert (=> d!51870 m!243151))

(declare-fun m!243153 () Bool)

(assert (=> d!51870 m!243153))

(assert (=> b!156178 m!243153))

(assert (=> b!156178 m!243149))

(declare-fun m!243155 () Bool)

(assert (=> b!156179 m!243155))

(assert (=> b!156179 m!242987))

(assert (=> d!51822 d!51870))

(declare-fun d!51872 () Bool)

(assert (=> d!51872 (= (remainingBits!0 ((_ sign_extend 32) (size!3207 (buf!3710 bs!65))) ((_ sign_extend 32) (currentByte!6801 bs!65)) ((_ sign_extend 32) (currentBit!6796 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3207 (buf!3710 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6801 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6796 bs!65)))))))

(assert (=> d!51834 d!51872))

(push 1)

(assert (not b!156148))

(assert (not d!51858))

(assert (not b!156162))

(assert (not b!156179))

(assert (not b!156147))

(assert (not b!156160))

(assert (not d!51870))

(assert (not bm!2371))

(assert (not bm!2378))

(assert (not b!156164))

(assert (not b!156149))

(assert (not bm!2372))

(assert (not bm!2370))

(assert (not d!51860))

(assert (not bm!2377))

(assert (not b!156151))

(assert (not b!156161))

(assert (not d!51842))

(assert (not bm!2376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

