; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31472 () Bool)

(assert start!31472)

(declare-fun res!131861 () Bool)

(declare-fun e!107071 () Bool)

(assert (=> start!31472 (=> (not res!131861) (not e!107071))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7312 0))(
  ( (array!7313 (arr!4210 (Array (_ BitVec 32) (_ BitVec 8))) (size!3309 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7312)

(assert (=> start!31472 (= res!131861 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3309 arr!153))))))

(assert (=> start!31472 e!107071))

(assert (=> start!31472 true))

(declare-fun array_inv!3068 (array!7312) Bool)

(assert (=> start!31472 (array_inv!3068 arr!153)))

(declare-datatypes ((BitStream!5810 0))(
  ( (BitStream!5811 (buf!3779 array!7312) (currentByte!6942 (_ BitVec 32)) (currentBit!6937 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5810)

(declare-fun e!107069 () Bool)

(declare-fun inv!12 (BitStream!5810) Bool)

(assert (=> start!31472 (and (inv!12 bs!65) e!107069)))

(declare-fun b!157830 () Bool)

(declare-fun e!107067 () Bool)

(declare-fun e!107068 () Bool)

(assert (=> b!157830 (= e!107067 e!107068)))

(declare-fun res!131860 () Bool)

(assert (=> b!157830 (=> (not res!131860) (not e!107068))))

(declare-fun lt!248540 () BitStream!5810)

(assert (=> b!157830 (= res!131860 (= (size!3309 (buf!3779 bs!65)) (size!3309 (buf!3779 lt!248540))))))

(declare-datatypes ((tuple2!14316 0))(
  ( (tuple2!14317 (_1!7614 BitStream!5810) (_2!7614 (_ BitVec 8))) )
))
(declare-fun lt!248541 () tuple2!14316)

(declare-fun readBytePure!0 (BitStream!5810) tuple2!14316)

(assert (=> b!157830 (= lt!248541 (readBytePure!0 lt!248540))))

(declare-fun b!157831 () Bool)

(assert (=> b!157831 (= e!107069 (array_inv!3068 (buf!3779 bs!65)))))

(declare-fun b!157832 () Bool)

(declare-fun res!131858 () Bool)

(assert (=> b!157832 (=> (not res!131858) (not e!107071))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157832 (= res!131858 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3309 (buf!3779 bs!65))) ((_ sign_extend 32) (currentByte!6942 bs!65)) ((_ sign_extend 32) (currentBit!6937 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157833 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157833 (= e!107068 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3309 (buf!3779 lt!248540)) (currentByte!6942 lt!248540) (currentBit!6937 lt!248540))))))

(declare-fun b!157834 () Bool)

(assert (=> b!157834 (= e!107071 e!107067)))

(declare-fun res!131859 () Bool)

(assert (=> b!157834 (=> (not res!131859) (not e!107067))))

(assert (=> b!157834 (= res!131859 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14318 0))(
  ( (tuple2!14319 (_1!7615 BitStream!5810) (_2!7615 array!7312)) )
))
(declare-fun lt!248539 () tuple2!14318)

(declare-fun readByteArrayLoopPure!0 (BitStream!5810 array!7312 (_ BitVec 32) (_ BitVec 32)) tuple2!14318)

(assert (=> b!157834 (= lt!248539 (readByteArrayLoopPure!0 lt!248540 (array!7313 (store (arr!4210 arr!153) from!240 (_2!7614 (readBytePure!0 bs!65))) (size!3309 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5810 (_ BitVec 32)) BitStream!5810)

(assert (=> b!157834 (= lt!248540 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248542 () tuple2!14318)

(assert (=> b!157834 (= lt!248542 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31472 res!131861) b!157832))

(assert (= (and b!157832 res!131858) b!157834))

(assert (= (and b!157834 res!131859) b!157830))

(assert (= (and b!157830 res!131860) b!157833))

(assert (= start!31472 b!157831))

(declare-fun m!247343 () Bool)

(assert (=> start!31472 m!247343))

(declare-fun m!247345 () Bool)

(assert (=> start!31472 m!247345))

(declare-fun m!247347 () Bool)

(assert (=> b!157834 m!247347))

(declare-fun m!247349 () Bool)

(assert (=> b!157834 m!247349))

(declare-fun m!247351 () Bool)

(assert (=> b!157834 m!247351))

(declare-fun m!247353 () Bool)

(assert (=> b!157834 m!247353))

(declare-fun m!247355 () Bool)

(assert (=> b!157834 m!247355))

(declare-fun m!247357 () Bool)

(assert (=> b!157831 m!247357))

(declare-fun m!247359 () Bool)

(assert (=> b!157830 m!247359))

(declare-fun m!247361 () Bool)

(assert (=> b!157833 m!247361))

(declare-fun m!247363 () Bool)

(assert (=> b!157832 m!247363))

(push 1)

(assert (not start!31472))

(assert (not b!157833))

(assert (not b!157834))

(assert (not b!157831))

(assert (not b!157832))

(assert (not b!157830))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52752 () Bool)

(assert (=> d!52752 (= (array_inv!3068 (buf!3779 bs!65)) (bvsge (size!3309 (buf!3779 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157831 d!52752))

(declare-fun d!52754 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52754 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3309 (buf!3779 bs!65))) ((_ sign_extend 32) (currentByte!6942 bs!65)) ((_ sign_extend 32) (currentBit!6937 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3309 (buf!3779 bs!65))) ((_ sign_extend 32) (currentByte!6942 bs!65)) ((_ sign_extend 32) (currentBit!6937 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12977 () Bool)

(assert (= bs!12977 d!52754))

(declare-fun m!247369 () Bool)

(assert (=> bs!12977 m!247369))

(assert (=> b!157832 d!52754))

(declare-fun d!52756 () Bool)

(declare-datatypes ((tuple2!14322 0))(
  ( (tuple2!14323 (_1!7618 (_ BitVec 8)) (_2!7618 BitStream!5810)) )
))
(declare-fun lt!248548 () tuple2!14322)

(declare-fun readByte!0 (BitStream!5810) tuple2!14322)

(assert (=> d!52756 (= lt!248548 (readByte!0 lt!248540))))

(assert (=> d!52756 (= (readBytePure!0 lt!248540) (tuple2!14317 (_2!7618 lt!248548) (_1!7618 lt!248548)))))

(declare-fun bs!12978 () Bool)

(assert (= bs!12978 d!52756))

(declare-fun m!247371 () Bool)

(assert (=> bs!12978 m!247371))

(assert (=> b!157830 d!52756))

(declare-fun d!52758 () Bool)

(assert (=> d!52758 (= (array_inv!3068 arr!153) (bvsge (size!3309 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31472 d!52758))

(declare-fun d!52760 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52760 (= (inv!12 bs!65) (invariant!0 (currentBit!6937 bs!65) (currentByte!6942 bs!65) (size!3309 (buf!3779 bs!65))))))

(declare-fun bs!12979 () Bool)

(assert (= bs!12979 d!52760))

(declare-fun m!247373 () Bool)

(assert (=> bs!12979 m!247373))

(assert (=> start!31472 d!52760))

(declare-fun d!52762 () Bool)

(declare-datatypes ((Unit!10500 0))(
  ( (Unit!10501) )
))
(declare-datatypes ((tuple3!680 0))(
  ( (tuple3!681 (_1!7620 Unit!10500) (_2!7620 BitStream!5810) (_3!457 array!7312)) )
))
(declare-fun lt!248569 () tuple3!680)

(declare-fun readByteArrayLoop!0 (BitStream!5810 array!7312 (_ BitVec 32) (_ BitVec 32)) tuple3!680)

(assert (=> d!52762 (= lt!248569 (readByteArrayLoop!0 lt!248540 (array!7313 (store (arr!4210 arr!153) from!240 (_2!7614 (readBytePure!0 bs!65))) (size!3309 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52762 (= (readByteArrayLoopPure!0 lt!248540 (array!7313 (store (arr!4210 arr!153) from!240 (_2!7614 (readBytePure!0 bs!65))) (size!3309 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14319 (_2!7620 lt!248569) (_3!457 lt!248569)))))

(declare-fun bs!12981 () Bool)

(assert (= bs!12981 d!52762))

(declare-fun m!247381 () Bool)

(assert (=> bs!12981 m!247381))

(assert (=> b!157834 d!52762))

(declare-fun d!52770 () Bool)

(declare-fun lt!248570 () tuple2!14322)

(assert (=> d!52770 (= lt!248570 (readByte!0 bs!65))))

(assert (=> d!52770 (= (readBytePure!0 bs!65) (tuple2!14317 (_2!7618 lt!248570) (_1!7618 lt!248570)))))

(declare-fun bs!12982 () Bool)

(assert (= bs!12982 d!52770))

(declare-fun m!247383 () Bool)

(assert (=> bs!12982 m!247383))

(assert (=> b!157834 d!52770))

(declare-fun d!52772 () Bool)

(declare-datatypes ((tuple2!14326 0))(
  ( (tuple2!14327 (_1!7621 Unit!10500) (_2!7621 BitStream!5810)) )
))
(declare-fun moveByteIndex!0 (BitStream!5810 (_ BitVec 32)) tuple2!14326)

(assert (=> d!52772 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7621 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12983 () Bool)

(assert (= bs!12983 d!52772))

(declare-fun m!247385 () Bool)

(assert (=> bs!12983 m!247385))

(assert (=> b!157834 d!52772))

(declare-fun d!52774 () Bool)

(declare-fun lt!248571 () tuple3!680)

(assert (=> d!52774 (= lt!248571 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52774 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14319 (_2!7620 lt!248571) (_3!457 lt!248571)))))

(declare-fun bs!12984 () Bool)

(assert (= bs!12984 d!52774))

(declare-fun m!247387 () Bool)

(assert (=> bs!12984 m!247387))

(assert (=> b!157834 d!52774))

(declare-fun d!52776 () Bool)

(declare-fun e!107078 () Bool)

(assert (=> d!52776 e!107078))

(declare-fun res!131872 () Bool)

(assert (=> d!52776 (=> (not res!131872) (not e!107078))))

(declare-fun lt!248592 () (_ BitVec 64))

(declare-fun lt!248594 () (_ BitVec 64))

(declare-fun lt!248589 () (_ BitVec 64))

(assert (=> d!52776 (= res!131872 (= lt!248594 (bvsub lt!248592 lt!248589)))))

(assert (=> d!52776 (or (= (bvand lt!248592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!248592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!248592 lt!248589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52776 (= lt!248589 (remainingBits!0 ((_ sign_extend 32) (size!3309 (buf!3779 lt!248540))) ((_ sign_extend 32) (currentByte!6942 lt!248540)) ((_ sign_extend 32) (currentBit!6937 lt!248540))))))

(declare-fun lt!248593 () (_ BitVec 64))

(declare-fun lt!248590 () (_ BitVec 64))

(assert (=> d!52776 (= lt!248592 (bvmul lt!248593 lt!248590))))

(assert (=> d!52776 (or (= lt!248593 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!248590 (bvsdiv (bvmul lt!248593 lt!248590) lt!248593)))))

(assert (=> d!52776 (= lt!248590 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!52776 (= lt!248593 ((_ sign_extend 32) (size!3309 (buf!3779 lt!248540))))))

(assert (=> d!52776 (= lt!248594 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6942 lt!248540)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6937 lt!248540))))))

(assert (=> d!52776 (invariant!0 (currentBit!6937 lt!248540) (currentByte!6942 lt!248540) (size!3309 (buf!3779 lt!248540)))))

(assert (=> d!52776 (= (bitIndex!0 (size!3309 (buf!3779 lt!248540)) (currentByte!6942 lt!248540) (currentBit!6937 lt!248540)) lt!248594)))

(declare-fun b!157845 () Bool)

(declare-fun res!131873 () Bool)

(assert (=> b!157845 (=> (not res!131873) (not e!107078))))

(assert (=> b!157845 (= res!131873 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!248594))))

(declare-fun b!157846 () Bool)

(declare-fun lt!248591 () (_ BitVec 64))

(assert (=> b!157846 (= e!107078 (bvsle lt!248594 (bvmul lt!248591 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!157846 (or (= lt!248591 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248591 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248591)))))

(assert (=> b!157846 (= lt!248591 ((_ sign_extend 32) (size!3309 (buf!3779 lt!248540))))))

(assert (= (and d!52776 res!131872) b!157845))

(assert (= (and b!157845 res!131873) b!157846))

(declare-fun m!247397 () Bool)

(assert (=> d!52776 m!247397))

(declare-fun m!247399 () Bool)

(assert (=> d!52776 m!247399))

(assert (=> b!157833 d!52776))

(push 1)

(assert (not d!52776))

(assert (not d!52772))

(assert (not d!52774))

(assert (not d!52770))

(assert (not d!52762))

(assert (not d!52756))

(assert (not d!52760))

(assert (not d!52754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

