; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31470 () Bool)

(assert start!31470)

(declare-fun b!157815 () Bool)

(declare-fun e!107052 () Bool)

(declare-datatypes ((array!7310 0))(
  ( (array!7311 (arr!4209 (Array (_ BitVec 32) (_ BitVec 8))) (size!3308 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5808 0))(
  ( (BitStream!5809 (buf!3778 array!7310) (currentByte!6941 (_ BitVec 32)) (currentBit!6936 (_ BitVec 32))) )
))
(declare-fun lt!248528 () BitStream!5808)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157815 (= e!107052 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3308 (buf!3778 lt!248528)) (currentByte!6941 lt!248528) (currentBit!6936 lt!248528))))))

(declare-fun res!131848 () Bool)

(declare-fun e!107054 () Bool)

(assert (=> start!31470 (=> (not res!131848) (not e!107054))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7310)

(assert (=> start!31470 (= res!131848 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3308 arr!153))))))

(assert (=> start!31470 e!107054))

(assert (=> start!31470 true))

(declare-fun array_inv!3067 (array!7310) Bool)

(assert (=> start!31470 (array_inv!3067 arr!153)))

(declare-fun bs!65 () BitStream!5808)

(declare-fun e!107053 () Bool)

(declare-fun inv!12 (BitStream!5808) Bool)

(assert (=> start!31470 (and (inv!12 bs!65) e!107053)))

(declare-fun b!157816 () Bool)

(declare-fun e!107049 () Bool)

(assert (=> b!157816 (= e!107049 e!107052)))

(declare-fun res!131849 () Bool)

(assert (=> b!157816 (=> (not res!131849) (not e!107052))))

(assert (=> b!157816 (= res!131849 (= (size!3308 (buf!3778 bs!65)) (size!3308 (buf!3778 lt!248528))))))

(declare-datatypes ((tuple2!14312 0))(
  ( (tuple2!14313 (_1!7612 BitStream!5808) (_2!7612 (_ BitVec 8))) )
))
(declare-fun lt!248530 () tuple2!14312)

(declare-fun readBytePure!0 (BitStream!5808) tuple2!14312)

(assert (=> b!157816 (= lt!248530 (readBytePure!0 lt!248528))))

(declare-fun b!157817 () Bool)

(declare-fun res!131846 () Bool)

(assert (=> b!157817 (=> (not res!131846) (not e!107054))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157817 (= res!131846 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3308 (buf!3778 bs!65))) ((_ sign_extend 32) (currentByte!6941 bs!65)) ((_ sign_extend 32) (currentBit!6936 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157818 () Bool)

(assert (=> b!157818 (= e!107054 e!107049)))

(declare-fun res!131847 () Bool)

(assert (=> b!157818 (=> (not res!131847) (not e!107049))))

(assert (=> b!157818 (= res!131847 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14314 0))(
  ( (tuple2!14315 (_1!7613 BitStream!5808) (_2!7613 array!7310)) )
))
(declare-fun lt!248529 () tuple2!14314)

(declare-fun readByteArrayLoopPure!0 (BitStream!5808 array!7310 (_ BitVec 32) (_ BitVec 32)) tuple2!14314)

(assert (=> b!157818 (= lt!248529 (readByteArrayLoopPure!0 lt!248528 (array!7311 (store (arr!4209 arr!153) from!240 (_2!7612 (readBytePure!0 bs!65))) (size!3308 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5808 (_ BitVec 32)) BitStream!5808)

(assert (=> b!157818 (= lt!248528 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248527 () tuple2!14314)

(assert (=> b!157818 (= lt!248527 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157819 () Bool)

(assert (=> b!157819 (= e!107053 (array_inv!3067 (buf!3778 bs!65)))))

(assert (= (and start!31470 res!131848) b!157817))

(assert (= (and b!157817 res!131846) b!157818))

(assert (= (and b!157818 res!131847) b!157816))

(assert (= (and b!157816 res!131849) b!157815))

(assert (= start!31470 b!157819))

(declare-fun m!247321 () Bool)

(assert (=> b!157817 m!247321))

(declare-fun m!247323 () Bool)

(assert (=> b!157816 m!247323))

(declare-fun m!247325 () Bool)

(assert (=> b!157815 m!247325))

(declare-fun m!247327 () Bool)

(assert (=> b!157819 m!247327))

(declare-fun m!247329 () Bool)

(assert (=> start!31470 m!247329))

(declare-fun m!247331 () Bool)

(assert (=> start!31470 m!247331))

(declare-fun m!247333 () Bool)

(assert (=> b!157818 m!247333))

(declare-fun m!247335 () Bool)

(assert (=> b!157818 m!247335))

(declare-fun m!247337 () Bool)

(assert (=> b!157818 m!247337))

(declare-fun m!247339 () Bool)

(assert (=> b!157818 m!247339))

(declare-fun m!247341 () Bool)

(assert (=> b!157818 m!247341))

(check-sat (not b!157818) (not b!157815) (not start!31470) (not b!157819) (not b!157817) (not b!157816))
(check-sat)
(get-model)

(declare-fun d!52784 () Bool)

(assert (=> d!52784 (= (array_inv!3067 (buf!3778 bs!65)) (bvsge (size!3308 (buf!3778 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157819 d!52784))

(declare-datatypes ((Unit!10502 0))(
  ( (Unit!10503) )
))
(declare-datatypes ((tuple3!682 0))(
  ( (tuple3!683 (_1!7622 Unit!10502) (_2!7622 BitStream!5808) (_3!458 array!7310)) )
))
(declare-fun lt!248597 () tuple3!682)

(declare-fun d!52786 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5808 array!7310 (_ BitVec 32) (_ BitVec 32)) tuple3!682)

(assert (=> d!52786 (= lt!248597 (readByteArrayLoop!0 lt!248528 (array!7311 (store (arr!4209 arr!153) from!240 (_2!7612 (readBytePure!0 bs!65))) (size!3308 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52786 (= (readByteArrayLoopPure!0 lt!248528 (array!7311 (store (arr!4209 arr!153) from!240 (_2!7612 (readBytePure!0 bs!65))) (size!3308 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14315 (_2!7622 lt!248597) (_3!458 lt!248597)))))

(declare-fun bs!12989 () Bool)

(assert (= bs!12989 d!52786))

(declare-fun m!247401 () Bool)

(assert (=> bs!12989 m!247401))

(assert (=> b!157818 d!52786))

(declare-fun d!52788 () Bool)

(declare-datatypes ((tuple2!14328 0))(
  ( (tuple2!14329 (_1!7623 (_ BitVec 8)) (_2!7623 BitStream!5808)) )
))
(declare-fun lt!248600 () tuple2!14328)

(declare-fun readByte!0 (BitStream!5808) tuple2!14328)

(assert (=> d!52788 (= lt!248600 (readByte!0 bs!65))))

(assert (=> d!52788 (= (readBytePure!0 bs!65) (tuple2!14313 (_2!7623 lt!248600) (_1!7623 lt!248600)))))

(declare-fun bs!12990 () Bool)

(assert (= bs!12990 d!52788))

(declare-fun m!247403 () Bool)

(assert (=> bs!12990 m!247403))

(assert (=> b!157818 d!52788))

(declare-fun d!52790 () Bool)

(declare-datatypes ((tuple2!14330 0))(
  ( (tuple2!14331 (_1!7624 Unit!10502) (_2!7624 BitStream!5808)) )
))
(declare-fun moveByteIndex!0 (BitStream!5808 (_ BitVec 32)) tuple2!14330)

(assert (=> d!52790 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7624 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12991 () Bool)

(assert (= bs!12991 d!52790))

(declare-fun m!247405 () Bool)

(assert (=> bs!12991 m!247405))

(assert (=> b!157818 d!52790))

(declare-fun d!52792 () Bool)

(declare-fun lt!248601 () tuple3!682)

(assert (=> d!52792 (= lt!248601 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52792 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14315 (_2!7622 lt!248601) (_3!458 lt!248601)))))

(declare-fun bs!12992 () Bool)

(assert (= bs!12992 d!52792))

(declare-fun m!247407 () Bool)

(assert (=> bs!12992 m!247407))

(assert (=> b!157818 d!52792))

(declare-fun d!52794 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52794 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3308 (buf!3778 bs!65))) ((_ sign_extend 32) (currentByte!6941 bs!65)) ((_ sign_extend 32) (currentBit!6936 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3308 (buf!3778 bs!65))) ((_ sign_extend 32) (currentByte!6941 bs!65)) ((_ sign_extend 32) (currentBit!6936 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12993 () Bool)

(assert (= bs!12993 d!52794))

(declare-fun m!247409 () Bool)

(assert (=> bs!12993 m!247409))

(assert (=> b!157817 d!52794))

(declare-fun d!52796 () Bool)

(assert (=> d!52796 (= (array_inv!3067 arr!153) (bvsge (size!3308 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31470 d!52796))

(declare-fun d!52798 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52798 (= (inv!12 bs!65) (invariant!0 (currentBit!6936 bs!65) (currentByte!6941 bs!65) (size!3308 (buf!3778 bs!65))))))

(declare-fun bs!12994 () Bool)

(assert (= bs!12994 d!52798))

(declare-fun m!247411 () Bool)

(assert (=> bs!12994 m!247411))

(assert (=> start!31470 d!52798))

(declare-fun d!52800 () Bool)

(declare-fun e!107081 () Bool)

(assert (=> d!52800 e!107081))

(declare-fun res!131879 () Bool)

(assert (=> d!52800 (=> (not res!131879) (not e!107081))))

(declare-fun lt!248617 () (_ BitVec 64))

(declare-fun lt!248615 () (_ BitVec 64))

(declare-fun lt!248614 () (_ BitVec 64))

(assert (=> d!52800 (= res!131879 (= lt!248615 (bvsub lt!248614 lt!248617)))))

(assert (=> d!52800 (or (= (bvand lt!248614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248617 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!248614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!248614 lt!248617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52800 (= lt!248617 (remainingBits!0 ((_ sign_extend 32) (size!3308 (buf!3778 lt!248528))) ((_ sign_extend 32) (currentByte!6941 lt!248528)) ((_ sign_extend 32) (currentBit!6936 lt!248528))))))

(declare-fun lt!248619 () (_ BitVec 64))

(declare-fun lt!248618 () (_ BitVec 64))

(assert (=> d!52800 (= lt!248614 (bvmul lt!248619 lt!248618))))

(assert (=> d!52800 (or (= lt!248619 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!248618 (bvsdiv (bvmul lt!248619 lt!248618) lt!248619)))))

(assert (=> d!52800 (= lt!248618 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!52800 (= lt!248619 ((_ sign_extend 32) (size!3308 (buf!3778 lt!248528))))))

(assert (=> d!52800 (= lt!248615 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6941 lt!248528)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6936 lt!248528))))))

(assert (=> d!52800 (invariant!0 (currentBit!6936 lt!248528) (currentByte!6941 lt!248528) (size!3308 (buf!3778 lt!248528)))))

(assert (=> d!52800 (= (bitIndex!0 (size!3308 (buf!3778 lt!248528)) (currentByte!6941 lt!248528) (currentBit!6936 lt!248528)) lt!248615)))

(declare-fun b!157851 () Bool)

(declare-fun res!131878 () Bool)

(assert (=> b!157851 (=> (not res!131878) (not e!107081))))

(assert (=> b!157851 (= res!131878 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!248615))))

(declare-fun b!157852 () Bool)

(declare-fun lt!248616 () (_ BitVec 64))

(assert (=> b!157852 (= e!107081 (bvsle lt!248615 (bvmul lt!248616 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!157852 (or (= lt!248616 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248616 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248616)))))

(assert (=> b!157852 (= lt!248616 ((_ sign_extend 32) (size!3308 (buf!3778 lt!248528))))))

(assert (= (and d!52800 res!131879) b!157851))

(assert (= (and b!157851 res!131878) b!157852))

(declare-fun m!247413 () Bool)

(assert (=> d!52800 m!247413))

(declare-fun m!247415 () Bool)

(assert (=> d!52800 m!247415))

(assert (=> b!157815 d!52800))

(declare-fun d!52802 () Bool)

(declare-fun lt!248620 () tuple2!14328)

(assert (=> d!52802 (= lt!248620 (readByte!0 lt!248528))))

(assert (=> d!52802 (= (readBytePure!0 lt!248528) (tuple2!14313 (_2!7623 lt!248620) (_1!7623 lt!248620)))))

(declare-fun bs!12995 () Bool)

(assert (= bs!12995 d!52802))

(declare-fun m!247417 () Bool)

(assert (=> bs!12995 m!247417))

(assert (=> b!157816 d!52802))

(check-sat (not d!52792) (not d!52794) (not d!52786) (not d!52798) (not d!52802) (not d!52790) (not d!52788) (not d!52800))
(check-sat)
