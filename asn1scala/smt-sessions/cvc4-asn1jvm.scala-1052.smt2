; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30134 () Bool)

(assert start!30134)

(declare-fun b!154590 () Bool)

(declare-fun e!103958 () Bool)

(declare-fun lt!240952 () (_ BitVec 64))

(assert (=> b!154590 (= e!103958 (and (bvslt lt!240952 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!240952 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun lt!240953 () (_ BitVec 64))

(assert (=> b!154590 (= lt!240952 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!240953 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((array!7002 0))(
  ( (array!7003 (arr!3976 (Array (_ BitVec 32) (_ BitVec 8))) (size!3153 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5564 0))(
  ( (BitStream!5565 (buf!3656 array!7002) (currentByte!6681 (_ BitVec 32)) (currentBit!6676 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13694 0))(
  ( (tuple2!13695 (_1!7249 BitStream!5564) (_2!7249 (_ BitVec 8))) )
))
(declare-fun lt!240955 () tuple2!13694)

(declare-fun bs2!18 () BitStream!5564)

(declare-fun bs1!10 () BitStream!5564)

(declare-fun readBytePure!0 (BitStream!5564) tuple2!13694)

(assert (=> b!154590 (= lt!240955 (readBytePure!0 (BitStream!5565 (buf!3656 bs2!18) (currentByte!6681 bs1!10) (currentBit!6676 bs1!10))))))

(declare-fun lt!240954 () tuple2!13694)

(assert (=> b!154590 (= lt!240954 (readBytePure!0 bs1!10))))

(declare-fun b!154591 () Bool)

(declare-fun res!129364 () Bool)

(assert (=> b!154591 (=> (not res!129364) (not e!103958))))

(declare-fun lt!240951 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154591 (= res!129364 (bvsle lt!240951 (bitIndex!0 (size!3153 (buf!3656 bs2!18)) (currentByte!6681 bs2!18) (currentBit!6676 bs2!18))))))

(declare-fun res!129366 () Bool)

(declare-fun e!103959 () Bool)

(assert (=> start!30134 (=> (not res!129366) (not e!103959))))

(assert (=> start!30134 (= res!129366 (= (size!3153 (buf!3656 bs1!10)) (size!3153 (buf!3656 bs2!18))))))

(assert (=> start!30134 e!103959))

(declare-fun e!103955 () Bool)

(declare-fun inv!12 (BitStream!5564) Bool)

(assert (=> start!30134 (and (inv!12 bs1!10) e!103955)))

(declare-fun e!103957 () Bool)

(assert (=> start!30134 (and (inv!12 bs2!18) e!103957)))

(declare-fun b!154592 () Bool)

(declare-fun array_inv!2942 (array!7002) Bool)

(assert (=> b!154592 (= e!103957 (array_inv!2942 (buf!3656 bs2!18)))))

(declare-fun b!154593 () Bool)

(assert (=> b!154593 (= e!103959 e!103958)))

(declare-fun res!129365 () Bool)

(assert (=> b!154593 (=> (not res!129365) (not e!103958))))

(assert (=> b!154593 (= res!129365 (bvsle lt!240951 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3153 (buf!3656 bs1!10))))))))

(assert (=> b!154593 (= lt!240951 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240953))))

(assert (=> b!154593 (= lt!240953 (bitIndex!0 (size!3153 (buf!3656 bs1!10)) (currentByte!6681 bs1!10) (currentBit!6676 bs1!10)))))

(declare-fun b!154594 () Bool)

(declare-fun res!129363 () Bool)

(assert (=> b!154594 (=> (not res!129363) (not e!103958))))

(declare-fun arrayBitRangesEq!0 (array!7002 array!7002 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154594 (= res!129363 (arrayBitRangesEq!0 (buf!3656 bs1!10) (buf!3656 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240951))))

(declare-fun b!154595 () Bool)

(assert (=> b!154595 (= e!103955 (array_inv!2942 (buf!3656 bs1!10)))))

(assert (= (and start!30134 res!129366) b!154593))

(assert (= (and b!154593 res!129365) b!154591))

(assert (= (and b!154591 res!129364) b!154594))

(assert (= (and b!154594 res!129363) b!154590))

(assert (= start!30134 b!154595))

(assert (= start!30134 b!154592))

(declare-fun m!240553 () Bool)

(assert (=> b!154595 m!240553))

(declare-fun m!240555 () Bool)

(assert (=> b!154593 m!240555))

(declare-fun m!240557 () Bool)

(assert (=> b!154590 m!240557))

(declare-fun m!240559 () Bool)

(assert (=> b!154590 m!240559))

(declare-fun m!240561 () Bool)

(assert (=> b!154592 m!240561))

(declare-fun m!240563 () Bool)

(assert (=> b!154591 m!240563))

(declare-fun m!240565 () Bool)

(assert (=> start!30134 m!240565))

(declare-fun m!240567 () Bool)

(assert (=> start!30134 m!240567))

(declare-fun m!240569 () Bool)

(assert (=> b!154594 m!240569))

(push 1)

(assert (not b!154593))

(assert (not b!154594))

(assert (not b!154595))

(assert (not b!154592))

(assert (not b!154590))

(assert (not b!154591))

(assert (not start!30134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50974 () Bool)

(assert (=> d!50974 (= (array_inv!2942 (buf!3656 bs2!18)) (bvsge (size!3153 (buf!3656 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154592 d!50974))

(declare-fun d!50976 () Bool)

(declare-fun res!129423 () Bool)

(declare-fun e!104021 () Bool)

(assert (=> d!50976 (=> res!129423 e!104021)))

(assert (=> d!50976 (= res!129423 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240951))))

(assert (=> d!50976 (= (arrayBitRangesEq!0 (buf!3656 bs1!10) (buf!3656 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240951) e!104021)))

(declare-fun b!154668 () Bool)

(declare-fun e!104019 () Bool)

(declare-fun e!104020 () Bool)

(assert (=> b!154668 (= e!104019 e!104020)))

(declare-fun res!129427 () Bool)

(declare-fun lt!241037 () (_ BitVec 32))

(declare-datatypes ((tuple4!202 0))(
  ( (tuple4!203 (_1!7254 (_ BitVec 32)) (_2!7254 (_ BitVec 32)) (_3!404 (_ BitVec 32)) (_4!101 (_ BitVec 32))) )
))
(declare-fun lt!241038 () tuple4!202)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154668 (= res!129427 (byteRangesEq!0 (select (arr!3976 (buf!3656 bs1!10)) (_3!404 lt!241038)) (select (arr!3976 (buf!3656 bs2!18)) (_3!404 lt!241038)) lt!241037 #b00000000000000000000000000001000))))

(assert (=> b!154668 (=> (not res!129427) (not e!104020))))

(declare-fun b!154669 () Bool)

(declare-fun e!104016 () Bool)

(declare-fun call!2213 () Bool)

(assert (=> b!154669 (= e!104016 call!2213)))

(declare-fun b!154670 () Bool)

(declare-fun res!129425 () Bool)

(declare-fun lt!241036 () (_ BitVec 32))

(assert (=> b!154670 (= res!129425 (= lt!241036 #b00000000000000000000000000000000))))

(assert (=> b!154670 (=> res!129425 e!104016)))

(assert (=> b!154670 (= e!104020 e!104016)))

(declare-fun b!154671 () Bool)

(assert (=> b!154671 (= e!104019 call!2213)))

(declare-fun b!154672 () Bool)

(declare-fun e!104017 () Bool)

(assert (=> b!154672 (= e!104017 e!104019)))

(declare-fun c!8229 () Bool)

(assert (=> b!154672 (= c!8229 (= (_3!404 lt!241038) (_4!101 lt!241038)))))

(declare-fun e!104018 () Bool)

(declare-fun b!154673 () Bool)

(declare-fun arrayRangesEq!394 (array!7002 array!7002 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154673 (= e!104018 (arrayRangesEq!394 (buf!3656 bs1!10) (buf!3656 bs2!18) (_1!7254 lt!241038) (_2!7254 lt!241038)))))

(declare-fun b!154674 () Bool)

(assert (=> b!154674 (= e!104021 e!104017)))

(declare-fun res!129424 () Bool)

(assert (=> b!154674 (=> (not res!129424) (not e!104017))))

(assert (=> b!154674 (= res!129424 e!104018)))

(declare-fun res!129426 () Bool)

(assert (=> b!154674 (=> res!129426 e!104018)))

(assert (=> b!154674 (= res!129426 (bvsge (_1!7254 lt!241038) (_2!7254 lt!241038)))))

(assert (=> b!154674 (= lt!241036 ((_ extract 31 0) (bvsrem lt!240951 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154674 (= lt!241037 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!202)

(assert (=> b!154674 (= lt!241038 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240951))))

(declare-fun bm!2210 () Bool)

(assert (=> bm!2210 (= call!2213 (byteRangesEq!0 (ite c!8229 (select (arr!3976 (buf!3656 bs1!10)) (_3!404 lt!241038)) (select (arr!3976 (buf!3656 bs1!10)) (_4!101 lt!241038))) (ite c!8229 (select (arr!3976 (buf!3656 bs2!18)) (_3!404 lt!241038)) (select (arr!3976 (buf!3656 bs2!18)) (_4!101 lt!241038))) (ite c!8229 lt!241037 #b00000000000000000000000000000000) lt!241036))))

(assert (= (and d!50976 (not res!129423)) b!154674))

(assert (= (and b!154674 (not res!129426)) b!154673))

(assert (= (and b!154674 res!129424) b!154672))

(assert (= (and b!154672 c!8229) b!154671))

(assert (= (and b!154672 (not c!8229)) b!154668))

(assert (= (and b!154668 res!129427) b!154670))

(assert (= (and b!154670 (not res!129425)) b!154669))

(assert (= (or b!154671 b!154669) bm!2210))

(declare-fun m!240627 () Bool)

(assert (=> b!154668 m!240627))

(declare-fun m!240629 () Bool)

(assert (=> b!154668 m!240629))

(assert (=> b!154668 m!240627))

(assert (=> b!154668 m!240629))

(declare-fun m!240631 () Bool)

(assert (=> b!154668 m!240631))

(declare-fun m!240633 () Bool)

(assert (=> b!154673 m!240633))

(declare-fun m!240635 () Bool)

(assert (=> b!154674 m!240635))

(declare-fun m!240637 () Bool)

(assert (=> bm!2210 m!240637))

(assert (=> bm!2210 m!240629))

(declare-fun m!240639 () Bool)

(assert (=> bm!2210 m!240639))

(assert (=> bm!2210 m!240627))

(declare-fun m!240641 () Bool)

(assert (=> bm!2210 m!240641))

(assert (=> b!154594 d!50976))

(declare-fun d!50986 () Bool)

(declare-fun e!104024 () Bool)

(assert (=> d!50986 e!104024))

(declare-fun res!129432 () Bool)

(assert (=> d!50986 (=> (not res!129432) (not e!104024))))

(declare-fun lt!241055 () (_ BitVec 64))

(declare-fun lt!241051 () (_ BitVec 64))

(declare-fun lt!241052 () (_ BitVec 64))

(assert (=> d!50986 (= res!129432 (= lt!241055 (bvsub lt!241051 lt!241052)))))

(assert (=> d!50986 (or (= (bvand lt!241051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241052 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241051 lt!241052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50986 (= lt!241052 (remainingBits!0 ((_ sign_extend 32) (size!3153 (buf!3656 bs1!10))) ((_ sign_extend 32) (currentByte!6681 bs1!10)) ((_ sign_extend 32) (currentBit!6676 bs1!10))))))

(declare-fun lt!241053 () (_ BitVec 64))

(declare-fun lt!241056 () (_ BitVec 64))

(assert (=> d!50986 (= lt!241051 (bvmul lt!241053 lt!241056))))

(assert (=> d!50986 (or (= lt!241053 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241056 (bvsdiv (bvmul lt!241053 lt!241056) lt!241053)))))

(assert (=> d!50986 (= lt!241056 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50986 (= lt!241053 ((_ sign_extend 32) (size!3153 (buf!3656 bs1!10))))))

(assert (=> d!50986 (= lt!241055 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6681 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6676 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50986 (invariant!0 (currentBit!6676 bs1!10) (currentByte!6681 bs1!10) (size!3153 (buf!3656 bs1!10)))))

(assert (=> d!50986 (= (bitIndex!0 (size!3153 (buf!3656 bs1!10)) (currentByte!6681 bs1!10) (currentBit!6676 bs1!10)) lt!241055)))

(declare-fun b!154679 () Bool)

(declare-fun res!129433 () Bool)

(assert (=> b!154679 (=> (not res!129433) (not e!104024))))

(assert (=> b!154679 (= res!129433 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241055))))

(declare-fun b!154680 () Bool)

(declare-fun lt!241054 () (_ BitVec 64))

(assert (=> b!154680 (= e!104024 (bvsle lt!241055 (bvmul lt!241054 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154680 (or (= lt!241054 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241054 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241054)))))

(assert (=> b!154680 (= lt!241054 ((_ sign_extend 32) (size!3153 (buf!3656 bs1!10))))))

(assert (= (and d!50986 res!129432) b!154679))

(assert (= (and b!154679 res!129433) b!154680))

(declare-fun m!240643 () Bool)

(assert (=> d!50986 m!240643))

(declare-fun m!240645 () Bool)

(assert (=> d!50986 m!240645))

(assert (=> b!154593 d!50986))

(declare-fun d!50988 () Bool)

(assert (=> d!50988 (= (array_inv!2942 (buf!3656 bs1!10)) (bvsge (size!3153 (buf!3656 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154595 d!50988))

(declare-fun d!50990 () Bool)

(declare-datatypes ((tuple2!13700 0))(
  ( (tuple2!13701 (_1!7255 (_ BitVec 8)) (_2!7255 BitStream!5564)) )
))
(declare-fun lt!241059 () tuple2!13700)

(declare-fun readByte!0 (BitStream!5564) tuple2!13700)

(assert (=> d!50990 (= lt!241059 (readByte!0 (BitStream!5565 (buf!3656 bs2!18) (currentByte!6681 bs1!10) (currentBit!6676 bs1!10))))))

(assert (=> d!50990 (= (readBytePure!0 (BitStream!5565 (buf!3656 bs2!18) (currentByte!6681 bs1!10) (currentBit!6676 bs1!10))) (tuple2!13695 (_2!7255 lt!241059) (_1!7255 lt!241059)))))

(declare-fun bs!12475 () Bool)

(assert (= bs!12475 d!50990))

(declare-fun m!240647 () Bool)

(assert (=> bs!12475 m!240647))

(assert (=> b!154590 d!50990))

(declare-fun d!50992 () Bool)

(declare-fun lt!241060 () tuple2!13700)

(assert (=> d!50992 (= lt!241060 (readByte!0 bs1!10))))

(assert (=> d!50992 (= (readBytePure!0 bs1!10) (tuple2!13695 (_2!7255 lt!241060) (_1!7255 lt!241060)))))

(declare-fun bs!12476 () Bool)

(assert (= bs!12476 d!50992))

(declare-fun m!240649 () Bool)

(assert (=> bs!12476 m!240649))

(assert (=> b!154590 d!50992))

(declare-fun d!50994 () Bool)

(declare-fun e!104025 () Bool)

(assert (=> d!50994 e!104025))

(declare-fun res!129434 () Bool)

(assert (=> d!50994 (=> (not res!129434) (not e!104025))))

(declare-fun lt!241065 () (_ BitVec 64))

(declare-fun lt!241062 () (_ BitVec 64))

(declare-fun lt!241061 () (_ BitVec 64))

(assert (=> d!50994 (= res!129434 (= lt!241065 (bvsub lt!241061 lt!241062)))))

(assert (=> d!50994 (or (= (bvand lt!241061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241062 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241061 lt!241062) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50994 (= lt!241062 (remainingBits!0 ((_ sign_extend 32) (size!3153 (buf!3656 bs2!18))) ((_ sign_extend 32) (currentByte!6681 bs2!18)) ((_ sign_extend 32) (currentBit!6676 bs2!18))))))

(declare-fun lt!241063 () (_ BitVec 64))

(declare-fun lt!241066 () (_ BitVec 64))

(assert (=> d!50994 (= lt!241061 (bvmul lt!241063 lt!241066))))

(assert (=> d!50994 (or (= lt!241063 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241066 (bvsdiv (bvmul lt!241063 lt!241066) lt!241063)))))

(assert (=> d!50994 (= lt!241066 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50994 (= lt!241063 ((_ sign_extend 32) (size!3153 (buf!3656 bs2!18))))))

(assert (=> d!50994 (= lt!241065 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6681 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6676 bs2!18))))))

(assert (=> d!50994 (invariant!0 (currentBit!6676 bs2!18) (currentByte!6681 bs2!18) (size!3153 (buf!3656 bs2!18)))))

(assert (=> d!50994 (= (bitIndex!0 (size!3153 (buf!3656 bs2!18)) (currentByte!6681 bs2!18) (currentBit!6676 bs2!18)) lt!241065)))

(declare-fun b!154681 () Bool)

(declare-fun res!129435 () Bool)

(assert (=> b!154681 (=> (not res!129435) (not e!104025))))

(assert (=> b!154681 (= res!129435 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241065))))

(declare-fun b!154682 () Bool)

(declare-fun lt!241064 () (_ BitVec 64))

(assert (=> b!154682 (= e!104025 (bvsle lt!241065 (bvmul lt!241064 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154682 (or (= lt!241064 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241064 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241064)))))

(assert (=> b!154682 (= lt!241064 ((_ sign_extend 32) (size!3153 (buf!3656 bs2!18))))))

(assert (= (and d!50994 res!129434) b!154681))

(assert (= (and b!154681 res!129435) b!154682))

(declare-fun m!240651 () Bool)

(assert (=> d!50994 m!240651))

(declare-fun m!240653 () Bool)

(assert (=> d!50994 m!240653))

(assert (=> b!154591 d!50994))

(declare-fun d!50996 () Bool)

(assert (=> d!50996 (= (inv!12 bs1!10) (invariant!0 (currentBit!6676 bs1!10) (currentByte!6681 bs1!10) (size!3153 (buf!3656 bs1!10))))))

(declare-fun bs!12477 () Bool)

(assert (= bs!12477 d!50996))

(assert (=> bs!12477 m!240645))

(assert (=> start!30134 d!50996))

(declare-fun d!50998 () Bool)

(assert (=> d!50998 (= (inv!12 bs2!18) (invariant!0 (currentBit!6676 bs2!18) (currentByte!6681 bs2!18) (size!3153 (buf!3656 bs2!18))))))

(declare-fun bs!12478 () Bool)

(assert (= bs!12478 d!50998))

(assert (=> bs!12478 m!240653))

(assert (=> start!30134 d!50998))

(push 1)

(assert (not d!50990))

(assert (not d!50992))

(assert (not d!50986))

(assert (not d!50996))

(assert (not d!50994))

(assert (not d!50998))

(assert (not bm!2210))

(assert (not b!154668))

(assert (not b!154674))

(assert (not b!154673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

