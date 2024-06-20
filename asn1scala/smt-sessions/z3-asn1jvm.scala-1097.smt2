; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31540 () Bool)

(assert start!31540)

(declare-fun b!158004 () Bool)

(declare-fun res!132004 () Bool)

(declare-fun e!107249 () Bool)

(assert (=> b!158004 (=> (not res!132004) (not e!107249))))

(declare-datatypes ((array!7331 0))(
  ( (array!7332 (arr!4222 (Array (_ BitVec 32) (_ BitVec 8))) (size!3317 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5826 0))(
  ( (BitStream!5827 (buf!3787 array!7331) (currentByte!6958 (_ BitVec 32)) (currentBit!6953 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5826)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158004 (= res!132004 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3317 (buf!3787 bs!65))) ((_ sign_extend 32) (currentByte!6958 bs!65)) ((_ sign_extend 32) (currentBit!6953 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158005 () Bool)

(declare-fun e!107253 () Bool)

(declare-fun e!107252 () Bool)

(assert (=> b!158005 (= e!107253 e!107252)))

(declare-fun res!132001 () Bool)

(assert (=> b!158005 (=> (not res!132001) (not e!107252))))

(declare-fun lt!248911 () (_ BitVec 64))

(assert (=> b!158005 (= res!132001 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 lt!248911))))

(declare-fun lt!248908 () BitStream!5826)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!158005 (= lt!248911 (bitIndex!0 (size!3317 (buf!3787 lt!248908)) (currentByte!6958 lt!248908) (currentBit!6953 lt!248908)))))

(declare-fun b!158006 () Bool)

(declare-fun e!107250 () Bool)

(assert (=> b!158006 (= e!107249 e!107250)))

(declare-fun res!132002 () Bool)

(assert (=> b!158006 (=> (not res!132002) (not e!107250))))

(assert (=> b!158006 (= res!132002 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14362 0))(
  ( (tuple2!14363 (_1!7640 BitStream!5826) (_2!7640 array!7331)) )
))
(declare-fun lt!248910 () tuple2!14362)

(declare-fun arr!153 () array!7331)

(declare-fun readByteArrayLoopPure!0 (BitStream!5826 array!7331 (_ BitVec 32) (_ BitVec 32)) tuple2!14362)

(declare-datatypes ((tuple2!14364 0))(
  ( (tuple2!14365 (_1!7641 BitStream!5826) (_2!7641 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5826) tuple2!14364)

(assert (=> b!158006 (= lt!248910 (readByteArrayLoopPure!0 lt!248908 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5826 (_ BitVec 32)) BitStream!5826)

(assert (=> b!158006 (= lt!248908 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248912 () tuple2!14362)

(assert (=> b!158006 (= lt!248912 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun res!132005 () Bool)

(assert (=> start!31540 (=> (not res!132005) (not e!107249))))

(assert (=> start!31540 (= res!132005 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3317 arr!153))))))

(assert (=> start!31540 e!107249))

(assert (=> start!31540 true))

(declare-fun array_inv!3076 (array!7331) Bool)

(assert (=> start!31540 (array_inv!3076 arr!153)))

(declare-fun e!107251 () Bool)

(declare-fun inv!12 (BitStream!5826) Bool)

(assert (=> start!31540 (and (inv!12 bs!65) e!107251)))

(declare-fun b!158007 () Bool)

(assert (=> b!158007 (= e!107251 (array_inv!3076 (buf!3787 bs!65)))))

(declare-fun b!158008 () Bool)

(assert (=> b!158008 (= e!107250 e!107253)))

(declare-fun res!132003 () Bool)

(assert (=> b!158008 (=> (not res!132003) (not e!107253))))

(assert (=> b!158008 (= res!132003 (= (size!3317 (buf!3787 bs!65)) (size!3317 (buf!3787 lt!248908))))))

(declare-fun lt!248909 () tuple2!14364)

(assert (=> b!158008 (= lt!248909 (readBytePure!0 lt!248908))))

(declare-fun b!158009 () Bool)

(assert (=> b!158009 (= e!107252 (not (= lt!248911 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3317 (buf!3787 bs!65)) (currentByte!6958 bs!65) (currentBit!6953 bs!65))))))))

(assert (= (and start!31540 res!132005) b!158004))

(assert (= (and b!158004 res!132004) b!158006))

(assert (= (and b!158006 res!132002) b!158008))

(assert (= (and b!158008 res!132003) b!158005))

(assert (= (and b!158005 res!132001) b!158009))

(assert (= start!31540 b!158007))

(declare-fun m!247671 () Bool)

(assert (=> b!158007 m!247671))

(declare-fun m!247673 () Bool)

(assert (=> b!158005 m!247673))

(declare-fun m!247675 () Bool)

(assert (=> b!158006 m!247675))

(declare-fun m!247677 () Bool)

(assert (=> b!158006 m!247677))

(declare-fun m!247679 () Bool)

(assert (=> b!158006 m!247679))

(declare-fun m!247681 () Bool)

(assert (=> b!158006 m!247681))

(declare-fun m!247683 () Bool)

(assert (=> b!158006 m!247683))

(declare-fun m!247685 () Bool)

(assert (=> b!158004 m!247685))

(declare-fun m!247687 () Bool)

(assert (=> b!158009 m!247687))

(declare-fun m!247689 () Bool)

(assert (=> start!31540 m!247689))

(declare-fun m!247691 () Bool)

(assert (=> start!31540 m!247691))

(declare-fun m!247693 () Bool)

(assert (=> b!158008 m!247693))

(check-sat (not b!158009) (not b!158008) (not b!158006) (not b!158007) (not b!158005) (not b!158004) (not start!31540))
(check-sat)
(get-model)

(declare-fun d!52872 () Bool)

(declare-fun e!107286 () Bool)

(assert (=> d!52872 e!107286))

(declare-fun res!132042 () Bool)

(assert (=> d!52872 (=> (not res!132042) (not e!107286))))

(declare-fun lt!249008 () (_ BitVec 64))

(declare-fun lt!249004 () (_ BitVec 64))

(declare-fun lt!249006 () (_ BitVec 64))

(assert (=> d!52872 (= res!132042 (= lt!249006 (bvsub lt!249008 lt!249004)))))

(assert (=> d!52872 (or (= (bvand lt!249008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249004 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!249008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!249008 lt!249004) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52872 (= lt!249004 (remainingBits!0 ((_ sign_extend 32) (size!3317 (buf!3787 lt!248908))) ((_ sign_extend 32) (currentByte!6958 lt!248908)) ((_ sign_extend 32) (currentBit!6953 lt!248908))))))

(declare-fun lt!249005 () (_ BitVec 64))

(declare-fun lt!249007 () (_ BitVec 64))

(assert (=> d!52872 (= lt!249008 (bvmul lt!249005 lt!249007))))

(assert (=> d!52872 (or (= lt!249005 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!249007 (bvsdiv (bvmul lt!249005 lt!249007) lt!249005)))))

(assert (=> d!52872 (= lt!249007 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!52872 (= lt!249005 ((_ sign_extend 32) (size!3317 (buf!3787 lt!248908))))))

(assert (=> d!52872 (= lt!249006 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6958 lt!248908)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6953 lt!248908))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52872 (invariant!0 (currentBit!6953 lt!248908) (currentByte!6958 lt!248908) (size!3317 (buf!3787 lt!248908)))))

(assert (=> d!52872 (= (bitIndex!0 (size!3317 (buf!3787 lt!248908)) (currentByte!6958 lt!248908) (currentBit!6953 lt!248908)) lt!249006)))

(declare-fun b!158048 () Bool)

(declare-fun res!132041 () Bool)

(assert (=> b!158048 (=> (not res!132041) (not e!107286))))

(assert (=> b!158048 (= res!132041 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!249006))))

(declare-fun b!158049 () Bool)

(declare-fun lt!249009 () (_ BitVec 64))

(assert (=> b!158049 (= e!107286 (bvsle lt!249006 (bvmul lt!249009 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!158049 (or (= lt!249009 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!249009 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249009)))))

(assert (=> b!158049 (= lt!249009 ((_ sign_extend 32) (size!3317 (buf!3787 lt!248908))))))

(assert (= (and d!52872 res!132042) b!158048))

(assert (= (and b!158048 res!132041) b!158049))

(declare-fun m!247755 () Bool)

(assert (=> d!52872 m!247755))

(declare-fun m!247757 () Bool)

(assert (=> d!52872 m!247757))

(assert (=> b!158005 d!52872))

(declare-fun d!52874 () Bool)

(declare-datatypes ((Unit!10531 0))(
  ( (Unit!10532) )
))
(declare-datatypes ((tuple3!688 0))(
  ( (tuple3!689 (_1!7650 Unit!10531) (_2!7650 BitStream!5826) (_3!461 array!7331)) )
))
(declare-fun lt!249012 () tuple3!688)

(declare-fun readByteArrayLoop!0 (BitStream!5826 array!7331 (_ BitVec 32) (_ BitVec 32)) tuple3!688)

(assert (=> d!52874 (= lt!249012 (readByteArrayLoop!0 lt!248908 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52874 (= (readByteArrayLoopPure!0 lt!248908 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14363 (_2!7650 lt!249012) (_3!461 lt!249012)))))

(declare-fun bs!13019 () Bool)

(assert (= bs!13019 d!52874))

(declare-fun m!247759 () Bool)

(assert (=> bs!13019 m!247759))

(assert (=> b!158006 d!52874))

(declare-fun d!52876 () Bool)

(declare-datatypes ((tuple2!14378 0))(
  ( (tuple2!14379 (_1!7651 (_ BitVec 8)) (_2!7651 BitStream!5826)) )
))
(declare-fun lt!249015 () tuple2!14378)

(declare-fun readByte!0 (BitStream!5826) tuple2!14378)

(assert (=> d!52876 (= lt!249015 (readByte!0 bs!65))))

(assert (=> d!52876 (= (readBytePure!0 bs!65) (tuple2!14365 (_2!7651 lt!249015) (_1!7651 lt!249015)))))

(declare-fun bs!13020 () Bool)

(assert (= bs!13020 d!52876))

(declare-fun m!247761 () Bool)

(assert (=> bs!13020 m!247761))

(assert (=> b!158006 d!52876))

(declare-fun d!52878 () Bool)

(declare-datatypes ((tuple2!14380 0))(
  ( (tuple2!14381 (_1!7652 Unit!10531) (_2!7652 BitStream!5826)) )
))
(declare-fun moveByteIndex!0 (BitStream!5826 (_ BitVec 32)) tuple2!14380)

(assert (=> d!52878 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7652 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!13021 () Bool)

(assert (= bs!13021 d!52878))

(declare-fun m!247763 () Bool)

(assert (=> bs!13021 m!247763))

(assert (=> b!158006 d!52878))

(declare-fun lt!249016 () tuple3!688)

(declare-fun d!52880 () Bool)

(assert (=> d!52880 (= lt!249016 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52880 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14363 (_2!7650 lt!249016) (_3!461 lt!249016)))))

(declare-fun bs!13022 () Bool)

(assert (= bs!13022 d!52880))

(declare-fun m!247765 () Bool)

(assert (=> bs!13022 m!247765))

(assert (=> b!158006 d!52880))

(declare-fun d!52882 () Bool)

(declare-fun lt!249017 () tuple2!14378)

(assert (=> d!52882 (= lt!249017 (readByte!0 lt!248908))))

(assert (=> d!52882 (= (readBytePure!0 lt!248908) (tuple2!14365 (_2!7651 lt!249017) (_1!7651 lt!249017)))))

(declare-fun bs!13023 () Bool)

(assert (= bs!13023 d!52882))

(declare-fun m!247767 () Bool)

(assert (=> bs!13023 m!247767))

(assert (=> b!158008 d!52882))

(declare-fun d!52884 () Bool)

(assert (=> d!52884 (= (array_inv!3076 (buf!3787 bs!65)) (bvsge (size!3317 (buf!3787 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!158007 d!52884))

(declare-fun d!52886 () Bool)

(assert (=> d!52886 (= (array_inv!3076 arr!153) (bvsge (size!3317 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31540 d!52886))

(declare-fun d!52888 () Bool)

(assert (=> d!52888 (= (inv!12 bs!65) (invariant!0 (currentBit!6953 bs!65) (currentByte!6958 bs!65) (size!3317 (buf!3787 bs!65))))))

(declare-fun bs!13024 () Bool)

(assert (= bs!13024 d!52888))

(declare-fun m!247769 () Bool)

(assert (=> bs!13024 m!247769))

(assert (=> start!31540 d!52888))

(declare-fun d!52890 () Bool)

(assert (=> d!52890 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3317 (buf!3787 bs!65))) ((_ sign_extend 32) (currentByte!6958 bs!65)) ((_ sign_extend 32) (currentBit!6953 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3317 (buf!3787 bs!65))) ((_ sign_extend 32) (currentByte!6958 bs!65)) ((_ sign_extend 32) (currentBit!6953 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13025 () Bool)

(assert (= bs!13025 d!52890))

(declare-fun m!247771 () Bool)

(assert (=> bs!13025 m!247771))

(assert (=> b!158004 d!52890))

(declare-fun d!52892 () Bool)

(declare-fun e!107287 () Bool)

(assert (=> d!52892 e!107287))

(declare-fun res!132044 () Bool)

(assert (=> d!52892 (=> (not res!132044) (not e!107287))))

(declare-fun lt!249020 () (_ BitVec 64))

(declare-fun lt!249018 () (_ BitVec 64))

(declare-fun lt!249022 () (_ BitVec 64))

(assert (=> d!52892 (= res!132044 (= lt!249020 (bvsub lt!249022 lt!249018)))))

(assert (=> d!52892 (or (= (bvand lt!249022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249018 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!249022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!249022 lt!249018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52892 (= lt!249018 (remainingBits!0 ((_ sign_extend 32) (size!3317 (buf!3787 bs!65))) ((_ sign_extend 32) (currentByte!6958 bs!65)) ((_ sign_extend 32) (currentBit!6953 bs!65))))))

(declare-fun lt!249019 () (_ BitVec 64))

(declare-fun lt!249021 () (_ BitVec 64))

(assert (=> d!52892 (= lt!249022 (bvmul lt!249019 lt!249021))))

(assert (=> d!52892 (or (= lt!249019 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!249021 (bvsdiv (bvmul lt!249019 lt!249021) lt!249019)))))

(assert (=> d!52892 (= lt!249021 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!52892 (= lt!249019 ((_ sign_extend 32) (size!3317 (buf!3787 bs!65))))))

(assert (=> d!52892 (= lt!249020 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6958 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6953 bs!65))))))

(assert (=> d!52892 (invariant!0 (currentBit!6953 bs!65) (currentByte!6958 bs!65) (size!3317 (buf!3787 bs!65)))))

(assert (=> d!52892 (= (bitIndex!0 (size!3317 (buf!3787 bs!65)) (currentByte!6958 bs!65) (currentBit!6953 bs!65)) lt!249020)))

(declare-fun b!158050 () Bool)

(declare-fun res!132043 () Bool)

(assert (=> b!158050 (=> (not res!132043) (not e!107287))))

(assert (=> b!158050 (= res!132043 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!249020))))

(declare-fun b!158051 () Bool)

(declare-fun lt!249023 () (_ BitVec 64))

(assert (=> b!158051 (= e!107287 (bvsle lt!249020 (bvmul lt!249023 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!158051 (or (= lt!249023 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!249023 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249023)))))

(assert (=> b!158051 (= lt!249023 ((_ sign_extend 32) (size!3317 (buf!3787 bs!65))))))

(assert (= (and d!52892 res!132044) b!158050))

(assert (= (and b!158050 res!132043) b!158051))

(assert (=> d!52892 m!247771))

(assert (=> d!52892 m!247769))

(assert (=> b!158009 d!52892))

(check-sat (not d!52872) (not d!52892) (not d!52874) (not d!52876) (not d!52888) (not d!52890) (not d!52880) (not d!52882) (not d!52878))
(check-sat)
(get-model)

(declare-fun d!52894 () Bool)

(declare-fun lt!249038 () (_ BitVec 8))

(declare-fun lt!249041 () (_ BitVec 8))

(assert (=> d!52894 (= lt!249038 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4222 (buf!3787 bs!65)) (currentByte!6958 bs!65))) ((_ sign_extend 24) lt!249041))))))

(assert (=> d!52894 (= lt!249041 ((_ extract 7 0) (currentBit!6953 bs!65)))))

(declare-fun e!107292 () Bool)

(assert (=> d!52894 e!107292))

(declare-fun res!132050 () Bool)

(assert (=> d!52894 (=> (not res!132050) (not e!107292))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52894 (= res!132050 (validate_offset_bits!1 ((_ sign_extend 32) (size!3317 (buf!3787 bs!65))) ((_ sign_extend 32) (currentByte!6958 bs!65)) ((_ sign_extend 32) (currentBit!6953 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14382 0))(
  ( (tuple2!14383 (_1!7653 Unit!10531) (_2!7653 (_ BitVec 8))) )
))
(declare-fun Unit!10533 () Unit!10531)

(declare-fun Unit!10534 () Unit!10531)

(assert (=> d!52894 (= (readByte!0 bs!65) (tuple2!14379 (_2!7653 (ite (bvsgt ((_ sign_extend 24) lt!249041) #b00000000000000000000000000000000) (tuple2!14383 Unit!10533 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249038) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4222 (buf!3787 bs!65)) (bvadd (currentByte!6958 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249041)))))))) (tuple2!14383 Unit!10534 lt!249038))) (BitStream!5827 (buf!3787 bs!65) (bvadd (currentByte!6958 bs!65) #b00000000000000000000000000000001) (currentBit!6953 bs!65))))))

(declare-fun b!158056 () Bool)

(declare-fun e!107293 () Bool)

(assert (=> b!158056 (= e!107292 e!107293)))

(declare-fun res!132051 () Bool)

(assert (=> b!158056 (=> (not res!132051) (not e!107293))))

(declare-fun lt!249040 () tuple2!14378)

(assert (=> b!158056 (= res!132051 (= (buf!3787 (_2!7651 lt!249040)) (buf!3787 bs!65)))))

(declare-fun lt!249042 () (_ BitVec 8))

(declare-fun lt!249044 () (_ BitVec 8))

(declare-fun Unit!10535 () Unit!10531)

(declare-fun Unit!10536 () Unit!10531)

(assert (=> b!158056 (= lt!249040 (tuple2!14379 (_2!7653 (ite (bvsgt ((_ sign_extend 24) lt!249042) #b00000000000000000000000000000000) (tuple2!14383 Unit!10535 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249044) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4222 (buf!3787 bs!65)) (bvadd (currentByte!6958 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249042)))))))) (tuple2!14383 Unit!10536 lt!249044))) (BitStream!5827 (buf!3787 bs!65) (bvadd (currentByte!6958 bs!65) #b00000000000000000000000000000001) (currentBit!6953 bs!65))))))

(assert (=> b!158056 (= lt!249044 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4222 (buf!3787 bs!65)) (currentByte!6958 bs!65))) ((_ sign_extend 24) lt!249042))))))

(assert (=> b!158056 (= lt!249042 ((_ extract 7 0) (currentBit!6953 bs!65)))))

(declare-fun lt!249043 () (_ BitVec 64))

(declare-fun b!158057 () Bool)

(declare-fun lt!249039 () (_ BitVec 64))

(assert (=> b!158057 (= e!107293 (= (bitIndex!0 (size!3317 (buf!3787 (_2!7651 lt!249040))) (currentByte!6958 (_2!7651 lt!249040)) (currentBit!6953 (_2!7651 lt!249040))) (bvadd lt!249043 lt!249039)))))

(assert (=> b!158057 (or (not (= (bvand lt!249043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249039 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249043 lt!249039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!158057 (= lt!249039 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!158057 (= lt!249043 (bitIndex!0 (size!3317 (buf!3787 bs!65)) (currentByte!6958 bs!65) (currentBit!6953 bs!65)))))

(assert (= (and d!52894 res!132050) b!158056))

(assert (= (and b!158056 res!132051) b!158057))

(declare-fun m!247773 () Bool)

(assert (=> d!52894 m!247773))

(declare-fun m!247775 () Bool)

(assert (=> d!52894 m!247775))

(declare-fun m!247777 () Bool)

(assert (=> d!52894 m!247777))

(assert (=> b!158056 m!247777))

(assert (=> b!158056 m!247773))

(declare-fun m!247779 () Bool)

(assert (=> b!158057 m!247779))

(assert (=> b!158057 m!247687))

(assert (=> d!52876 d!52894))

(declare-fun d!52896 () Bool)

(declare-fun e!107296 () Bool)

(assert (=> d!52896 e!107296))

(declare-fun res!132054 () Bool)

(assert (=> d!52896 (=> (not res!132054) (not e!107296))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5826 (_ BitVec 32)) Bool)

(assert (=> d!52896 (= res!132054 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10537 () Unit!10531)

(assert (=> d!52896 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14381 Unit!10537 (BitStream!5827 (buf!3787 bs!65) (bvadd (currentByte!6958 bs!65) #b00000000000000000000000000000001) (currentBit!6953 bs!65))))))

(declare-fun b!158060 () Bool)

(assert (=> b!158060 (= e!107296 (and (or (not (= (bvand (currentByte!6958 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6958 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6958 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6958 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6958 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52896 res!132054) b!158060))

(declare-fun m!247781 () Bool)

(assert (=> d!52896 m!247781))

(assert (=> d!52878 d!52896))

(declare-fun d!52898 () Bool)

(assert (=> d!52898 (= (remainingBits!0 ((_ sign_extend 32) (size!3317 (buf!3787 bs!65))) ((_ sign_extend 32) (currentByte!6958 bs!65)) ((_ sign_extend 32) (currentBit!6953 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3317 (buf!3787 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6958 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6953 bs!65)))))))

(assert (=> d!52892 d!52898))

(declare-fun d!52900 () Bool)

(assert (=> d!52900 (= (invariant!0 (currentBit!6953 bs!65) (currentByte!6958 bs!65) (size!3317 (buf!3787 bs!65))) (and (bvsge (currentBit!6953 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6953 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6958 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6958 bs!65) (size!3317 (buf!3787 bs!65))) (and (= (currentBit!6953 bs!65) #b00000000000000000000000000000000) (= (currentByte!6958 bs!65) (size!3317 (buf!3787 bs!65)))))))))

(assert (=> d!52892 d!52900))

(declare-fun d!52902 () Bool)

(declare-fun lt!249045 () (_ BitVec 8))

(declare-fun lt!249048 () (_ BitVec 8))

(assert (=> d!52902 (= lt!249045 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4222 (buf!3787 lt!248908)) (currentByte!6958 lt!248908))) ((_ sign_extend 24) lt!249048))))))

(assert (=> d!52902 (= lt!249048 ((_ extract 7 0) (currentBit!6953 lt!248908)))))

(declare-fun e!107297 () Bool)

(assert (=> d!52902 e!107297))

(declare-fun res!132055 () Bool)

(assert (=> d!52902 (=> (not res!132055) (not e!107297))))

(assert (=> d!52902 (= res!132055 (validate_offset_bits!1 ((_ sign_extend 32) (size!3317 (buf!3787 lt!248908))) ((_ sign_extend 32) (currentByte!6958 lt!248908)) ((_ sign_extend 32) (currentBit!6953 lt!248908)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10538 () Unit!10531)

(declare-fun Unit!10539 () Unit!10531)

(assert (=> d!52902 (= (readByte!0 lt!248908) (tuple2!14379 (_2!7653 (ite (bvsgt ((_ sign_extend 24) lt!249048) #b00000000000000000000000000000000) (tuple2!14383 Unit!10538 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249045) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4222 (buf!3787 lt!248908)) (bvadd (currentByte!6958 lt!248908) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249048)))))))) (tuple2!14383 Unit!10539 lt!249045))) (BitStream!5827 (buf!3787 lt!248908) (bvadd (currentByte!6958 lt!248908) #b00000000000000000000000000000001) (currentBit!6953 lt!248908))))))

(declare-fun b!158061 () Bool)

(declare-fun e!107298 () Bool)

(assert (=> b!158061 (= e!107297 e!107298)))

(declare-fun res!132056 () Bool)

(assert (=> b!158061 (=> (not res!132056) (not e!107298))))

(declare-fun lt!249047 () tuple2!14378)

(assert (=> b!158061 (= res!132056 (= (buf!3787 (_2!7651 lt!249047)) (buf!3787 lt!248908)))))

(declare-fun lt!249051 () (_ BitVec 8))

(declare-fun lt!249049 () (_ BitVec 8))

(declare-fun Unit!10540 () Unit!10531)

(declare-fun Unit!10541 () Unit!10531)

(assert (=> b!158061 (= lt!249047 (tuple2!14379 (_2!7653 (ite (bvsgt ((_ sign_extend 24) lt!249049) #b00000000000000000000000000000000) (tuple2!14383 Unit!10540 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249051) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4222 (buf!3787 lt!248908)) (bvadd (currentByte!6958 lt!248908) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249049)))))))) (tuple2!14383 Unit!10541 lt!249051))) (BitStream!5827 (buf!3787 lt!248908) (bvadd (currentByte!6958 lt!248908) #b00000000000000000000000000000001) (currentBit!6953 lt!248908))))))

(assert (=> b!158061 (= lt!249051 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4222 (buf!3787 lt!248908)) (currentByte!6958 lt!248908))) ((_ sign_extend 24) lt!249049))))))

(assert (=> b!158061 (= lt!249049 ((_ extract 7 0) (currentBit!6953 lt!248908)))))

(declare-fun lt!249050 () (_ BitVec 64))

(declare-fun lt!249046 () (_ BitVec 64))

(declare-fun b!158062 () Bool)

(assert (=> b!158062 (= e!107298 (= (bitIndex!0 (size!3317 (buf!3787 (_2!7651 lt!249047))) (currentByte!6958 (_2!7651 lt!249047)) (currentBit!6953 (_2!7651 lt!249047))) (bvadd lt!249050 lt!249046)))))

(assert (=> b!158062 (or (not (= (bvand lt!249050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249046 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249050 lt!249046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!158062 (= lt!249046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!158062 (= lt!249050 (bitIndex!0 (size!3317 (buf!3787 lt!248908)) (currentByte!6958 lt!248908) (currentBit!6953 lt!248908)))))

(assert (= (and d!52902 res!132055) b!158061))

(assert (= (and b!158061 res!132056) b!158062))

(declare-fun m!247783 () Bool)

(assert (=> d!52902 m!247783))

(declare-fun m!247785 () Bool)

(assert (=> d!52902 m!247785))

(declare-fun m!247787 () Bool)

(assert (=> d!52902 m!247787))

(assert (=> b!158061 m!247787))

(assert (=> b!158061 m!247783))

(declare-fun m!247789 () Bool)

(assert (=> b!158062 m!247789))

(assert (=> b!158062 m!247673))

(assert (=> d!52882 d!52902))

(assert (=> d!52888 d!52900))

(declare-fun d!52904 () Bool)

(assert (=> d!52904 (= (remainingBits!0 ((_ sign_extend 32) (size!3317 (buf!3787 lt!248908))) ((_ sign_extend 32) (currentByte!6958 lt!248908)) ((_ sign_extend 32) (currentBit!6953 lt!248908))) (bvsub (bvmul ((_ sign_extend 32) (size!3317 (buf!3787 lt!248908))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6958 lt!248908)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6953 lt!248908)))))))

(assert (=> d!52872 d!52904))

(declare-fun d!52906 () Bool)

(assert (=> d!52906 (= (invariant!0 (currentBit!6953 lt!248908) (currentByte!6958 lt!248908) (size!3317 (buf!3787 lt!248908))) (and (bvsge (currentBit!6953 lt!248908) #b00000000000000000000000000000000) (bvslt (currentBit!6953 lt!248908) #b00000000000000000000000000001000) (bvsge (currentByte!6958 lt!248908) #b00000000000000000000000000000000) (or (bvslt (currentByte!6958 lt!248908) (size!3317 (buf!3787 lt!248908))) (and (= (currentBit!6953 lt!248908) #b00000000000000000000000000000000) (= (currentByte!6958 lt!248908) (size!3317 (buf!3787 lt!248908)))))))))

(assert (=> d!52872 d!52906))

(declare-fun e!107306 () tuple3!688)

(declare-fun lt!249127 () Unit!10531)

(declare-fun b!158073 () Bool)

(assert (=> b!158073 (= e!107306 (tuple3!689 lt!249127 lt!248908 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153))))))

(declare-fun call!2639 () (_ BitVec 64))

(assert (=> b!158073 (= call!2639 call!2639)))

(declare-fun lt!249135 () Unit!10531)

(declare-fun Unit!10542 () Unit!10531)

(assert (=> b!158073 (= lt!249135 Unit!10542)))

(declare-fun lt!249129 () Unit!10531)

(declare-fun arrayRangesEqReflexiveLemma!52 (array!7331) Unit!10531)

(assert (=> b!158073 (= lt!249129 (arrayRangesEqReflexiveLemma!52 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153))))))

(declare-fun call!2638 () Bool)

(assert (=> b!158073 call!2638))

(declare-fun lt!249149 () Unit!10531)

(assert (=> b!158073 (= lt!249149 lt!249129)))

(declare-fun lt!249138 () array!7331)

(assert (=> b!158073 (= lt!249138 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)))))

(declare-fun lt!249150 () array!7331)

(assert (=> b!158073 (= lt!249150 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)))))

(declare-fun lt!249145 () (_ BitVec 32))

(assert (=> b!158073 (= lt!249145 #b00000000000000000000000000000000)))

(declare-fun lt!249131 () (_ BitVec 32))

(assert (=> b!158073 (= lt!249131 (size!3317 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153))))))

(declare-fun lt!249128 () (_ BitVec 32))

(assert (=> b!158073 (= lt!249128 #b00000000000000000000000000000000)))

(declare-fun lt!249125 () (_ BitVec 32))

(assert (=> b!158073 (= lt!249125 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!52 (array!7331 array!7331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10531)

(assert (=> b!158073 (= lt!249127 (arrayRangesEqSlicedLemma!52 lt!249138 lt!249150 lt!249145 lt!249131 lt!249128 lt!249125))))

(declare-fun call!2637 () Bool)

(assert (=> b!158073 call!2637))

(declare-fun d!52908 () Bool)

(declare-fun e!107305 () Bool)

(assert (=> d!52908 e!107305))

(declare-fun res!132064 () Bool)

(assert (=> d!52908 (=> res!132064 e!107305)))

(assert (=> d!52908 (= res!132064 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!249155 () Bool)

(declare-fun e!107307 () Bool)

(assert (=> d!52908 (= lt!249155 e!107307)))

(declare-fun res!132063 () Bool)

(assert (=> d!52908 (=> (not res!132063) (not e!107307))))

(declare-fun lt!249134 () tuple3!688)

(declare-fun lt!249132 () (_ BitVec 64))

(declare-fun lt!249147 () (_ BitVec 64))

(assert (=> d!52908 (= res!132063 (= (bvadd lt!249147 lt!249132) (bitIndex!0 (size!3317 (buf!3787 (_2!7650 lt!249134))) (currentByte!6958 (_2!7650 lt!249134)) (currentBit!6953 (_2!7650 lt!249134)))))))

(assert (=> d!52908 (or (not (= (bvand lt!249147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249132 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249147 lt!249132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!249154 () (_ BitVec 64))

(assert (=> d!52908 (= lt!249132 (bvmul lt!249154 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52908 (or (= lt!249154 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!249154 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249154)))))

(assert (=> d!52908 (= lt!249154 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52908 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52908 (= lt!249147 (bitIndex!0 (size!3317 (buf!3787 lt!248908)) (currentByte!6958 lt!248908) (currentBit!6953 lt!248908)))))

(assert (=> d!52908 (= lt!249134 e!107306)))

(declare-fun c!8401 () Bool)

(assert (=> d!52908 (= c!8401 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52908 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3317 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)))))))

(assert (=> d!52908 (= (readByteArrayLoop!0 lt!248908 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!249134)))

(declare-fun b!158074 () Bool)

(declare-fun res!132065 () Bool)

(assert (=> b!158074 (=> (not res!132065) (not e!107307))))

(assert (=> b!158074 (= res!132065 (and (= (buf!3787 lt!248908) (buf!3787 (_2!7650 lt!249134))) (= (size!3317 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153))) (size!3317 (_3!461 lt!249134)))))))

(declare-fun bm!2634 () Bool)

(declare-fun lt!249141 () tuple3!688)

(declare-fun lt!249137 () (_ BitVec 32))

(declare-fun arrayRangesEq!444 (array!7331 array!7331 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2634 (= call!2637 (arrayRangesEq!444 (ite c!8401 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)) lt!249138) (ite c!8401 (_3!461 lt!249141) lt!249150) (ite c!8401 lt!249137 lt!249128) (ite c!8401 (bvadd #b00000000000000000000000000000001 from!240) lt!249125)))))

(declare-fun b!158075 () Bool)

(declare-fun lt!249157 () Unit!10531)

(assert (=> b!158075 (= e!107306 (tuple3!689 lt!249157 (_2!7650 lt!249141) (_3!461 lt!249141)))))

(declare-fun lt!249148 () tuple2!14378)

(assert (=> b!158075 (= lt!249148 (readByte!0 lt!248908))))

(declare-fun lt!249140 () array!7331)

(assert (=> b!158075 (= lt!249140 (array!7332 (store (arr!4222 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7651 lt!249148)) (size!3317 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)))))))

(declare-fun lt!249158 () (_ BitVec 64))

(assert (=> b!158075 (= lt!249158 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!249151 () (_ BitVec 32))

(assert (=> b!158075 (= lt!249151 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!249156 () Unit!10531)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5826 BitStream!5826 (_ BitVec 64) (_ BitVec 32)) Unit!10531)

(assert (=> b!158075 (= lt!249156 (validateOffsetBytesFromBitIndexLemma!0 lt!248908 (_2!7651 lt!249148) lt!249158 lt!249151))))

(assert (=> b!158075 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3317 (buf!3787 (_2!7651 lt!249148)))) ((_ sign_extend 32) (currentByte!6958 (_2!7651 lt!249148))) ((_ sign_extend 32) (currentBit!6953 (_2!7651 lt!249148))) (bvsub lt!249151 ((_ extract 31 0) (bvsdiv (bvadd lt!249158 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!249144 () Unit!10531)

(assert (=> b!158075 (= lt!249144 lt!249156)))

(assert (=> b!158075 (= lt!249141 (readByteArrayLoop!0 (_2!7651 lt!249148) lt!249140 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!158075 (= call!2639 (bvadd (bitIndex!0 (size!3317 (buf!3787 lt!248908)) (currentByte!6958 lt!248908) (currentBit!6953 lt!248908)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!249152 () Unit!10531)

(declare-fun Unit!10543 () Unit!10531)

(assert (=> b!158075 (= lt!249152 Unit!10543)))

(assert (=> b!158075 (= (bvadd call!2639 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3317 (buf!3787 (_2!7650 lt!249141))) (currentByte!6958 (_2!7650 lt!249141)) (currentBit!6953 (_2!7650 lt!249141))))))

(declare-fun lt!249130 () Unit!10531)

(declare-fun Unit!10544 () Unit!10531)

(assert (=> b!158075 (= lt!249130 Unit!10544)))

(assert (=> b!158075 (= (bvadd (bitIndex!0 (size!3317 (buf!3787 lt!248908)) (currentByte!6958 lt!248908) (currentBit!6953 lt!248908)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3317 (buf!3787 (_2!7650 lt!249141))) (currentByte!6958 (_2!7650 lt!249141)) (currentBit!6953 (_2!7650 lt!249141))))))

(declare-fun lt!249139 () Unit!10531)

(declare-fun Unit!10545 () Unit!10531)

(assert (=> b!158075 (= lt!249139 Unit!10545)))

(assert (=> b!158075 (and (= (buf!3787 lt!248908) (buf!3787 (_2!7650 lt!249141))) (= (size!3317 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153))) (size!3317 (_3!461 lt!249141))))))

(declare-fun lt!249133 () Unit!10531)

(declare-fun Unit!10546 () Unit!10531)

(assert (=> b!158075 (= lt!249133 Unit!10546)))

(declare-fun lt!249136 () Unit!10531)

(declare-fun arrayUpdatedAtPrefixLemma!52 (array!7331 (_ BitVec 32) (_ BitVec 8)) Unit!10531)

(assert (=> b!158075 (= lt!249136 (arrayUpdatedAtPrefixLemma!52 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7651 lt!249148)))))

(assert (=> b!158075 (arrayRangesEq!444 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)) (array!7332 (store (arr!4222 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7651 lt!249148)) (size!3317 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!249126 () Unit!10531)

(assert (=> b!158075 (= lt!249126 lt!249136)))

(assert (=> b!158075 (= lt!249137 #b00000000000000000000000000000000)))

(declare-fun lt!249143 () Unit!10531)

(declare-fun arrayRangesEqTransitive!117 (array!7331 array!7331 array!7331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10531)

(assert (=> b!158075 (= lt!249143 (arrayRangesEqTransitive!117 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)) lt!249140 (_3!461 lt!249141) lt!249137 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158075 call!2637))

(declare-fun lt!249146 () Unit!10531)

(assert (=> b!158075 (= lt!249146 lt!249143)))

(assert (=> b!158075 call!2638))

(declare-fun lt!249153 () Unit!10531)

(declare-fun Unit!10547 () Unit!10531)

(assert (=> b!158075 (= lt!249153 Unit!10547)))

(declare-fun lt!249159 () Unit!10531)

(declare-fun arrayRangesEqImpliesEq!61 (array!7331 array!7331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10531)

(assert (=> b!158075 (= lt!249159 (arrayRangesEqImpliesEq!61 lt!249140 (_3!461 lt!249141) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158075 (= (select (store (arr!4222 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7651 lt!249148)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4222 (_3!461 lt!249141)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!249124 () Unit!10531)

(assert (=> b!158075 (= lt!249124 lt!249159)))

(declare-fun lt!249142 () Bool)

(assert (=> b!158075 (= lt!249142 (= (select (arr!4222 (_3!461 lt!249141)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7651 lt!249148)))))

(declare-fun Unit!10548 () Unit!10531)

(assert (=> b!158075 (= lt!249157 Unit!10548)))

(assert (=> b!158075 lt!249142))

(declare-fun bm!2635 () Bool)

(assert (=> bm!2635 (= call!2638 (arrayRangesEq!444 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)) (ite c!8401 (_3!461 lt!249141) (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153))) #b00000000000000000000000000000000 (ite c!8401 (bvadd #b00000000000000000000000000000001 from!240) (size!3317 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153))))))))

(declare-fun b!158076 () Bool)

(assert (=> b!158076 (= e!107307 (arrayRangesEq!444 (array!7332 (store (arr!4222 arr!153) from!240 (_2!7641 (readBytePure!0 bs!65))) (size!3317 arr!153)) (_3!461 lt!249134) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun bm!2636 () Bool)

(assert (=> bm!2636 (= call!2639 (bitIndex!0 (ite c!8401 (size!3317 (buf!3787 (_2!7651 lt!249148))) (size!3317 (buf!3787 lt!248908))) (ite c!8401 (currentByte!6958 (_2!7651 lt!249148)) (currentByte!6958 lt!248908)) (ite c!8401 (currentBit!6953 (_2!7651 lt!249148)) (currentBit!6953 lt!248908))))))

(declare-fun b!158077 () Bool)

(assert (=> b!158077 (= e!107305 (= (select (arr!4222 (_3!461 lt!249134)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7641 (readBytePure!0 lt!248908))))))

(assert (=> b!158077 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3317 (_3!461 lt!249134))))))

(assert (= (and d!52908 c!8401) b!158075))

(assert (= (and d!52908 (not c!8401)) b!158073))

(assert (= (or b!158075 b!158073) bm!2634))

(assert (= (or b!158075 b!158073) bm!2635))

(assert (= (or b!158075 b!158073) bm!2636))

(assert (= (and d!52908 res!132063) b!158074))

(assert (= (and b!158074 res!132065) b!158076))

(assert (= (and d!52908 (not res!132064)) b!158077))

(declare-fun m!247791 () Bool)

(assert (=> bm!2636 m!247791))

(declare-fun m!247793 () Bool)

(assert (=> d!52908 m!247793))

(assert (=> d!52908 m!247673))

(declare-fun m!247795 () Bool)

(assert (=> b!158073 m!247795))

(declare-fun m!247797 () Bool)

(assert (=> b!158073 m!247797))

(declare-fun m!247799 () Bool)

(assert (=> b!158075 m!247799))

(declare-fun m!247801 () Bool)

(assert (=> b!158075 m!247801))

(declare-fun m!247803 () Bool)

(assert (=> b!158075 m!247803))

(declare-fun m!247805 () Bool)

(assert (=> b!158075 m!247805))

(declare-fun m!247807 () Bool)

(assert (=> b!158075 m!247807))

(declare-fun m!247809 () Bool)

(assert (=> b!158075 m!247809))

(declare-fun m!247811 () Bool)

(assert (=> b!158075 m!247811))

(declare-fun m!247813 () Bool)

(assert (=> b!158075 m!247813))

(declare-fun m!247815 () Bool)

(assert (=> b!158075 m!247815))

(declare-fun m!247817 () Bool)

(assert (=> b!158075 m!247817))

(assert (=> b!158075 m!247767))

(assert (=> b!158075 m!247673))

(declare-fun m!247819 () Bool)

(assert (=> b!158075 m!247819))

(declare-fun m!247821 () Bool)

(assert (=> b!158077 m!247821))

(assert (=> b!158077 m!247693))

(declare-fun m!247823 () Bool)

(assert (=> bm!2634 m!247823))

(declare-fun m!247825 () Bool)

(assert (=> b!158076 m!247825))

(declare-fun m!247827 () Bool)

(assert (=> bm!2635 m!247827))

(assert (=> d!52874 d!52908))

(declare-fun e!107309 () tuple3!688)

(declare-fun b!158078 () Bool)

(declare-fun lt!249163 () Unit!10531)

(assert (=> b!158078 (= e!107309 (tuple3!689 lt!249163 bs!65 arr!153))))

(declare-fun call!2642 () (_ BitVec 64))

(assert (=> b!158078 (= call!2642 call!2642)))

(declare-fun lt!249171 () Unit!10531)

(declare-fun Unit!10549 () Unit!10531)

(assert (=> b!158078 (= lt!249171 Unit!10549)))

(declare-fun lt!249165 () Unit!10531)

(assert (=> b!158078 (= lt!249165 (arrayRangesEqReflexiveLemma!52 arr!153))))

(declare-fun call!2641 () Bool)

(assert (=> b!158078 call!2641))

(declare-fun lt!249185 () Unit!10531)

(assert (=> b!158078 (= lt!249185 lt!249165)))

(declare-fun lt!249174 () array!7331)

(assert (=> b!158078 (= lt!249174 arr!153)))

(declare-fun lt!249186 () array!7331)

(assert (=> b!158078 (= lt!249186 arr!153)))

(declare-fun lt!249181 () (_ BitVec 32))

(assert (=> b!158078 (= lt!249181 #b00000000000000000000000000000000)))

(declare-fun lt!249167 () (_ BitVec 32))

(assert (=> b!158078 (= lt!249167 (size!3317 arr!153))))

(declare-fun lt!249164 () (_ BitVec 32))

(assert (=> b!158078 (= lt!249164 #b00000000000000000000000000000000)))

(declare-fun lt!249161 () (_ BitVec 32))

(assert (=> b!158078 (= lt!249161 from!240)))

(assert (=> b!158078 (= lt!249163 (arrayRangesEqSlicedLemma!52 lt!249174 lt!249186 lt!249181 lt!249167 lt!249164 lt!249161))))

(declare-fun call!2640 () Bool)

(assert (=> b!158078 call!2640))

(declare-fun d!52910 () Bool)

(declare-fun e!107308 () Bool)

(assert (=> d!52910 e!107308))

(declare-fun res!132067 () Bool)

(assert (=> d!52910 (=> res!132067 e!107308)))

(assert (=> d!52910 (= res!132067 (bvsge from!240 to!236))))

(declare-fun lt!249191 () Bool)

(declare-fun e!107310 () Bool)

(assert (=> d!52910 (= lt!249191 e!107310)))

(declare-fun res!132066 () Bool)

(assert (=> d!52910 (=> (not res!132066) (not e!107310))))

(declare-fun lt!249183 () (_ BitVec 64))

(declare-fun lt!249170 () tuple3!688)

(declare-fun lt!249168 () (_ BitVec 64))

(assert (=> d!52910 (= res!132066 (= (bvadd lt!249183 lt!249168) (bitIndex!0 (size!3317 (buf!3787 (_2!7650 lt!249170))) (currentByte!6958 (_2!7650 lt!249170)) (currentBit!6953 (_2!7650 lt!249170)))))))

(assert (=> d!52910 (or (not (= (bvand lt!249183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249168 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249183 lt!249168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!249190 () (_ BitVec 64))

(assert (=> d!52910 (= lt!249168 (bvmul lt!249190 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52910 (or (= lt!249190 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!249190 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249190)))))

(assert (=> d!52910 (= lt!249190 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52910 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52910 (= lt!249183 (bitIndex!0 (size!3317 (buf!3787 bs!65)) (currentByte!6958 bs!65) (currentBit!6953 bs!65)))))

(assert (=> d!52910 (= lt!249170 e!107309)))

(declare-fun c!8402 () Bool)

(assert (=> d!52910 (= c!8402 (bvslt from!240 to!236))))

(assert (=> d!52910 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3317 arr!153)))))

(assert (=> d!52910 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!249170)))

(declare-fun b!158079 () Bool)

(declare-fun res!132068 () Bool)

(assert (=> b!158079 (=> (not res!132068) (not e!107310))))

(assert (=> b!158079 (= res!132068 (and (= (buf!3787 bs!65) (buf!3787 (_2!7650 lt!249170))) (= (size!3317 arr!153) (size!3317 (_3!461 lt!249170)))))))

(declare-fun lt!249177 () tuple3!688)

(declare-fun lt!249173 () (_ BitVec 32))

(declare-fun bm!2637 () Bool)

(assert (=> bm!2637 (= call!2640 (arrayRangesEq!444 (ite c!8402 arr!153 lt!249174) (ite c!8402 (_3!461 lt!249177) lt!249186) (ite c!8402 lt!249173 lt!249164) (ite c!8402 from!240 lt!249161)))))

(declare-fun b!158080 () Bool)

(declare-fun lt!249193 () Unit!10531)

(assert (=> b!158080 (= e!107309 (tuple3!689 lt!249193 (_2!7650 lt!249177) (_3!461 lt!249177)))))

(declare-fun lt!249184 () tuple2!14378)

(assert (=> b!158080 (= lt!249184 (readByte!0 bs!65))))

(declare-fun lt!249176 () array!7331)

(assert (=> b!158080 (= lt!249176 (array!7332 (store (arr!4222 arr!153) from!240 (_1!7651 lt!249184)) (size!3317 arr!153)))))

(declare-fun lt!249194 () (_ BitVec 64))

(assert (=> b!158080 (= lt!249194 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!249187 () (_ BitVec 32))

(assert (=> b!158080 (= lt!249187 (bvsub to!236 from!240))))

(declare-fun lt!249192 () Unit!10531)

(assert (=> b!158080 (= lt!249192 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7651 lt!249184) lt!249194 lt!249187))))

(assert (=> b!158080 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3317 (buf!3787 (_2!7651 lt!249184)))) ((_ sign_extend 32) (currentByte!6958 (_2!7651 lt!249184))) ((_ sign_extend 32) (currentBit!6953 (_2!7651 lt!249184))) (bvsub lt!249187 ((_ extract 31 0) (bvsdiv (bvadd lt!249194 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!249180 () Unit!10531)

(assert (=> b!158080 (= lt!249180 lt!249192)))

(assert (=> b!158080 (= lt!249177 (readByteArrayLoop!0 (_2!7651 lt!249184) lt!249176 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!158080 (= call!2642 (bvadd (bitIndex!0 (size!3317 (buf!3787 bs!65)) (currentByte!6958 bs!65) (currentBit!6953 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!249188 () Unit!10531)

(declare-fun Unit!10550 () Unit!10531)

(assert (=> b!158080 (= lt!249188 Unit!10550)))

(assert (=> b!158080 (= (bvadd call!2642 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3317 (buf!3787 (_2!7650 lt!249177))) (currentByte!6958 (_2!7650 lt!249177)) (currentBit!6953 (_2!7650 lt!249177))))))

(declare-fun lt!249166 () Unit!10531)

(declare-fun Unit!10551 () Unit!10531)

(assert (=> b!158080 (= lt!249166 Unit!10551)))

(assert (=> b!158080 (= (bvadd (bitIndex!0 (size!3317 (buf!3787 bs!65)) (currentByte!6958 bs!65) (currentBit!6953 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3317 (buf!3787 (_2!7650 lt!249177))) (currentByte!6958 (_2!7650 lt!249177)) (currentBit!6953 (_2!7650 lt!249177))))))

(declare-fun lt!249175 () Unit!10531)

(declare-fun Unit!10552 () Unit!10531)

(assert (=> b!158080 (= lt!249175 Unit!10552)))

(assert (=> b!158080 (and (= (buf!3787 bs!65) (buf!3787 (_2!7650 lt!249177))) (= (size!3317 arr!153) (size!3317 (_3!461 lt!249177))))))

(declare-fun lt!249169 () Unit!10531)

(declare-fun Unit!10553 () Unit!10531)

(assert (=> b!158080 (= lt!249169 Unit!10553)))

(declare-fun lt!249172 () Unit!10531)

(assert (=> b!158080 (= lt!249172 (arrayUpdatedAtPrefixLemma!52 arr!153 from!240 (_1!7651 lt!249184)))))

(assert (=> b!158080 (arrayRangesEq!444 arr!153 (array!7332 (store (arr!4222 arr!153) from!240 (_1!7651 lt!249184)) (size!3317 arr!153)) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!249162 () Unit!10531)

(assert (=> b!158080 (= lt!249162 lt!249172)))

(assert (=> b!158080 (= lt!249173 #b00000000000000000000000000000000)))

(declare-fun lt!249179 () Unit!10531)

(assert (=> b!158080 (= lt!249179 (arrayRangesEqTransitive!117 arr!153 lt!249176 (_3!461 lt!249177) lt!249173 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158080 call!2640))

(declare-fun lt!249182 () Unit!10531)

(assert (=> b!158080 (= lt!249182 lt!249179)))

(assert (=> b!158080 call!2641))

(declare-fun lt!249189 () Unit!10531)

(declare-fun Unit!10554 () Unit!10531)

(assert (=> b!158080 (= lt!249189 Unit!10554)))

(declare-fun lt!249195 () Unit!10531)

(assert (=> b!158080 (= lt!249195 (arrayRangesEqImpliesEq!61 lt!249176 (_3!461 lt!249177) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158080 (= (select (store (arr!4222 arr!153) from!240 (_1!7651 lt!249184)) from!240) (select (arr!4222 (_3!461 lt!249177)) from!240))))

(declare-fun lt!249160 () Unit!10531)

(assert (=> b!158080 (= lt!249160 lt!249195)))

(declare-fun lt!249178 () Bool)

(assert (=> b!158080 (= lt!249178 (= (select (arr!4222 (_3!461 lt!249177)) from!240) (_1!7651 lt!249184)))))

(declare-fun Unit!10555 () Unit!10531)

(assert (=> b!158080 (= lt!249193 Unit!10555)))

(assert (=> b!158080 lt!249178))

(declare-fun bm!2638 () Bool)

(assert (=> bm!2638 (= call!2641 (arrayRangesEq!444 arr!153 (ite c!8402 (_3!461 lt!249177) arr!153) #b00000000000000000000000000000000 (ite c!8402 from!240 (size!3317 arr!153))))))

(declare-fun b!158081 () Bool)

(assert (=> b!158081 (= e!107310 (arrayRangesEq!444 arr!153 (_3!461 lt!249170) #b00000000000000000000000000000000 from!240))))

(declare-fun bm!2639 () Bool)

(assert (=> bm!2639 (= call!2642 (bitIndex!0 (ite c!8402 (size!3317 (buf!3787 (_2!7651 lt!249184))) (size!3317 (buf!3787 bs!65))) (ite c!8402 (currentByte!6958 (_2!7651 lt!249184)) (currentByte!6958 bs!65)) (ite c!8402 (currentBit!6953 (_2!7651 lt!249184)) (currentBit!6953 bs!65))))))

(declare-fun b!158082 () Bool)

(assert (=> b!158082 (= e!107308 (= (select (arr!4222 (_3!461 lt!249170)) from!240) (_2!7641 (readBytePure!0 bs!65))))))

(assert (=> b!158082 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3317 (_3!461 lt!249170))))))

(assert (= (and d!52910 c!8402) b!158080))

(assert (= (and d!52910 (not c!8402)) b!158078))

(assert (= (or b!158080 b!158078) bm!2637))

(assert (= (or b!158080 b!158078) bm!2638))

(assert (= (or b!158080 b!158078) bm!2639))

(assert (= (and d!52910 res!132066) b!158079))

(assert (= (and b!158079 res!132068) b!158081))

(assert (= (and d!52910 (not res!132067)) b!158082))

(declare-fun m!247829 () Bool)

(assert (=> bm!2639 m!247829))

(declare-fun m!247831 () Bool)

(assert (=> d!52910 m!247831))

(assert (=> d!52910 m!247687))

(declare-fun m!247833 () Bool)

(assert (=> b!158078 m!247833))

(declare-fun m!247835 () Bool)

(assert (=> b!158078 m!247835))

(declare-fun m!247837 () Bool)

(assert (=> b!158080 m!247837))

(declare-fun m!247839 () Bool)

(assert (=> b!158080 m!247839))

(declare-fun m!247841 () Bool)

(assert (=> b!158080 m!247841))

(declare-fun m!247843 () Bool)

(assert (=> b!158080 m!247843))

(declare-fun m!247845 () Bool)

(assert (=> b!158080 m!247845))

(declare-fun m!247847 () Bool)

(assert (=> b!158080 m!247847))

(declare-fun m!247849 () Bool)

(assert (=> b!158080 m!247849))

(declare-fun m!247851 () Bool)

(assert (=> b!158080 m!247851))

(declare-fun m!247853 () Bool)

(assert (=> b!158080 m!247853))

(declare-fun m!247855 () Bool)

(assert (=> b!158080 m!247855))

(assert (=> b!158080 m!247761))

(assert (=> b!158080 m!247687))

(declare-fun m!247857 () Bool)

(assert (=> b!158080 m!247857))

(declare-fun m!247859 () Bool)

(assert (=> b!158082 m!247859))

(assert (=> b!158082 m!247675))

(declare-fun m!247861 () Bool)

(assert (=> bm!2637 m!247861))

(declare-fun m!247863 () Bool)

(assert (=> b!158081 m!247863))

(declare-fun m!247865 () Bool)

(assert (=> bm!2638 m!247865))

(assert (=> d!52880 d!52910))

(assert (=> d!52890 d!52898))

(check-sat (not bm!2638) (not b!158078) (not b!158075) (not b!158073) (not b!158082) (not bm!2636) (not d!52894) (not bm!2635) (not bm!2637) (not b!158081) (not b!158076) (not d!52896) (not b!158077) (not b!158080) (not b!158062) (not b!158057) (not d!52902) (not d!52908) (not bm!2639) (not d!52910) (not bm!2634))
(check-sat)
