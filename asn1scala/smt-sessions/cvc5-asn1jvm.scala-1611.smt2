; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45682 () Bool)

(assert start!45682)

(declare-fun b!220920 () Bool)

(declare-fun e!150009 () (_ BitVec 64))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> b!220920 (= e!150009 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)))))

(declare-fun b!220921 () Bool)

(declare-fun e!150010 () Bool)

(declare-datatypes ((array!10795 0))(
  ( (array!10796 (arr!5671 (Array (_ BitVec 32) (_ BitVec 8))) (size!4741 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8590 0))(
  ( (BitStream!8591 (buf!5288 array!10795) (currentByte!9924 (_ BitVec 32)) (currentBit!9919 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18956 0))(
  ( (tuple2!18957 (_1!10136 BitStream!8590) (_2!10136 (_ BitVec 64))) )
))
(declare-fun lt!348667 () tuple2!18956)

(declare-fun lt!348668 () tuple2!18956)

(assert (=> b!220921 (= e!150010 (or (not (= (_2!10136 lt!348667) (_2!10136 lt!348668))) (not (= (_1!10136 lt!348667) (_1!10136 lt!348668)))))))

(declare-fun bs!62 () BitStream!8590)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18956)

(declare-fun withMovedBitIndex!0 (BitStream!8590 (_ BitVec 64)) BitStream!8590)

(assert (=> b!220921 (= lt!348668 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150009)))))

(declare-fun c!10697 () Bool)

(declare-datatypes ((tuple2!18958 0))(
  ( (tuple2!18959 (_1!10137 BitStream!8590) (_2!10137 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8590) tuple2!18958)

(assert (=> b!220921 (= c!10697 (_2!10137 (readBitPure!0 bs!62)))))

(assert (=> b!220921 (= lt!348667 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220922 () Bool)

(declare-fun res!186058 () Bool)

(assert (=> b!220922 (=> (not res!186058) (not e!150010))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220922 (= res!186058 (validate_offset_bits!1 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) ((_ sign_extend 32) (currentByte!9924 bs!62)) ((_ sign_extend 32) (currentBit!9919 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun res!186059 () Bool)

(assert (=> start!45682 (=> (not res!186059) (not e!150010))))

(assert (=> start!45682 (= res!186059 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45682 e!150010))

(assert (=> start!45682 true))

(declare-fun e!150011 () Bool)

(declare-fun inv!12 (BitStream!8590) Bool)

(assert (=> start!45682 (and (inv!12 bs!62) e!150011)))

(declare-fun b!220923 () Bool)

(declare-fun res!186057 () Bool)

(assert (=> b!220923 (=> (not res!186057) (not e!150010))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220923 (= res!186057 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220924 () Bool)

(declare-fun res!186056 () Bool)

(assert (=> b!220924 (=> (not res!186056) (not e!150010))))

(assert (=> b!220924 (= res!186056 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220925 () Bool)

(declare-fun array_inv!4482 (array!10795) Bool)

(assert (=> b!220925 (= e!150011 (array_inv!4482 (buf!5288 bs!62)))))

(declare-fun b!220926 () Bool)

(assert (=> b!220926 (= e!150009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and start!45682 res!186059) b!220922))

(assert (= (and b!220922 res!186058) b!220923))

(assert (= (and b!220923 res!186057) b!220924))

(assert (= (and b!220924 res!186056) b!220921))

(assert (= (and b!220921 c!10697) b!220920))

(assert (= (and b!220921 (not c!10697)) b!220926))

(assert (= start!45682 b!220925))

(declare-fun m!339571 () Bool)

(assert (=> b!220921 m!339571))

(assert (=> b!220921 m!339571))

(declare-fun m!339573 () Bool)

(assert (=> b!220921 m!339573))

(declare-fun m!339575 () Bool)

(assert (=> b!220921 m!339575))

(declare-fun m!339577 () Bool)

(assert (=> b!220921 m!339577))

(declare-fun m!339579 () Bool)

(assert (=> b!220925 m!339579))

(declare-fun m!339581 () Bool)

(assert (=> b!220922 m!339581))

(declare-fun m!339583 () Bool)

(assert (=> start!45682 m!339583))

(declare-fun m!339585 () Bool)

(assert (=> b!220923 m!339585))

(push 1)

(assert (not start!45682))

(assert (not b!220925))

(assert (not b!220922))

(assert (not b!220923))

(assert (not b!220921))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74367 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74367 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) ((_ sign_extend 32) (currentByte!9924 bs!62)) ((_ sign_extend 32) (currentBit!9919 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) ((_ sign_extend 32) (currentByte!9924 bs!62)) ((_ sign_extend 32) (currentBit!9919 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18200 () Bool)

(assert (= bs!18200 d!74367))

(declare-fun m!339625 () Bool)

(assert (=> bs!18200 m!339625))

(assert (=> b!220922 d!74367))

(declare-fun d!74369 () Bool)

(assert (=> d!74369 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220923 d!74369))

(declare-fun d!74371 () Bool)

(assert (=> d!74371 (= (array_inv!4482 (buf!5288 bs!62)) (bvsge (size!4741 (buf!5288 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220925 d!74371))

(declare-fun d!74373 () Bool)

(declare-datatypes ((tuple2!18974 0))(
  ( (tuple2!18975 (_1!10145 (_ BitVec 64)) (_2!10145 BitStream!8590)) )
))
(declare-fun lt!348695 () tuple2!18974)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18974)

(assert (=> d!74373 (= lt!348695 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150009)))))

(assert (=> d!74373 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150009)) (tuple2!18957 (_2!10145 lt!348695) (_1!10145 lt!348695)))))

(declare-fun bs!18203 () Bool)

(assert (= bs!18203 d!74373))

(assert (=> bs!18203 m!339571))

(declare-fun m!339639 () Bool)

(assert (=> bs!18203 m!339639))

(assert (=> b!220921 d!74373))

(declare-fun d!74381 () Bool)

(declare-fun e!150042 () Bool)

(assert (=> d!74381 e!150042))

(declare-fun res!186089 () Bool)

(assert (=> d!74381 (=> (not res!186089) (not e!150042))))

(declare-fun lt!348702 () (_ BitVec 64))

(declare-fun lt!348701 () BitStream!8590)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!74381 (= res!186089 (= (bvadd lt!348702 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4741 (buf!5288 lt!348701)) (currentByte!9924 lt!348701) (currentBit!9919 lt!348701))))))

(assert (=> d!74381 (or (not (= (bvand lt!348702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348702 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74381 (= lt!348702 (bitIndex!0 (size!4741 (buf!5288 bs!62)) (currentByte!9924 bs!62) (currentBit!9919 bs!62)))))

(declare-datatypes ((Unit!15615 0))(
  ( (Unit!15616) )
))
(declare-datatypes ((tuple2!18976 0))(
  ( (tuple2!18977 (_1!10146 Unit!15615) (_2!10146 BitStream!8590)) )
))
(declare-fun moveBitIndex!0 (BitStream!8590 (_ BitVec 64)) tuple2!18976)

(assert (=> d!74381 (= lt!348701 (_2!10146 (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8590 (_ BitVec 64)) Bool)

(assert (=> d!74381 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74381 (= (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) lt!348701)))

(declare-fun b!220974 () Bool)

(assert (=> b!220974 (= e!150042 (= (size!4741 (buf!5288 bs!62)) (size!4741 (buf!5288 lt!348701))))))

(assert (= (and d!74381 res!186089) b!220974))

(declare-fun m!339641 () Bool)

(assert (=> d!74381 m!339641))

(declare-fun m!339643 () Bool)

(assert (=> d!74381 m!339643))

(declare-fun m!339645 () Bool)

(assert (=> d!74381 m!339645))

(declare-fun m!339647 () Bool)

(assert (=> d!74381 m!339647))

(assert (=> b!220921 d!74381))

(declare-fun d!74385 () Bool)

(declare-datatypes ((tuple2!18978 0))(
  ( (tuple2!18979 (_1!10147 Bool) (_2!10147 BitStream!8590)) )
))
(declare-fun lt!348705 () tuple2!18978)

(declare-fun readBit!0 (BitStream!8590) tuple2!18978)

(assert (=> d!74385 (= lt!348705 (readBit!0 bs!62))))

(assert (=> d!74385 (= (readBitPure!0 bs!62) (tuple2!18959 (_2!10147 lt!348705) (_1!10147 lt!348705)))))

(declare-fun bs!18204 () Bool)

(assert (= bs!18204 d!74385))

(declare-fun m!339649 () Bool)

(assert (=> bs!18204 m!339649))

(assert (=> b!220921 d!74385))

(declare-fun lt!348706 () tuple2!18974)

(declare-fun d!74387 () Bool)

(assert (=> d!74387 (= lt!348706 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74387 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18957 (_2!10145 lt!348706) (_1!10145 lt!348706)))))

(declare-fun bs!18205 () Bool)

(assert (= bs!18205 d!74387))

(declare-fun m!339651 () Bool)

(assert (=> bs!18205 m!339651))

(assert (=> b!220921 d!74387))

(declare-fun d!74389 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74389 (= (inv!12 bs!62) (invariant!0 (currentBit!9919 bs!62) (currentByte!9924 bs!62) (size!4741 (buf!5288 bs!62))))))

(declare-fun bs!18207 () Bool)

(assert (= bs!18207 d!74389))

(declare-fun m!339655 () Bool)

(assert (=> bs!18207 m!339655))

(assert (=> start!45682 d!74389))

(push 1)

(assert (not d!74389))

(assert (not d!74373))

(assert (not d!74387))

(assert (not d!74385))

(assert (not d!74381))

(assert (not d!74367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74413 () Bool)

(declare-fun e!150068 () Bool)

(assert (=> d!74413 e!150068))

(declare-fun res!186123 () Bool)

(assert (=> d!74413 (=> (not res!186123) (not e!150068))))

(declare-fun lt!348799 () (_ BitVec 64))

(declare-fun lt!348798 () (_ BitVec 64))

(declare-fun lt!348796 () (_ BitVec 64))

(assert (=> d!74413 (= res!186123 (= lt!348798 (bvsub lt!348799 lt!348796)))))

(assert (=> d!74413 (or (= (bvand lt!348799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348796 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348799 lt!348796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74413 (= lt!348796 (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 lt!348701))) ((_ sign_extend 32) (currentByte!9924 lt!348701)) ((_ sign_extend 32) (currentBit!9919 lt!348701))))))

(declare-fun lt!348797 () (_ BitVec 64))

(declare-fun lt!348795 () (_ BitVec 64))

(assert (=> d!74413 (= lt!348799 (bvmul lt!348797 lt!348795))))

(assert (=> d!74413 (or (= lt!348797 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348795 (bvsdiv (bvmul lt!348797 lt!348795) lt!348797)))))

(assert (=> d!74413 (= lt!348795 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74413 (= lt!348797 ((_ sign_extend 32) (size!4741 (buf!5288 lt!348701))))))

(assert (=> d!74413 (= lt!348798 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9924 lt!348701)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9919 lt!348701))))))

(assert (=> d!74413 (invariant!0 (currentBit!9919 lt!348701) (currentByte!9924 lt!348701) (size!4741 (buf!5288 lt!348701)))))

(assert (=> d!74413 (= (bitIndex!0 (size!4741 (buf!5288 lt!348701)) (currentByte!9924 lt!348701) (currentBit!9919 lt!348701)) lt!348798)))

(declare-fun b!221014 () Bool)

(declare-fun res!186124 () Bool)

(assert (=> b!221014 (=> (not res!186124) (not e!150068))))

(assert (=> b!221014 (= res!186124 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348798))))

(declare-fun b!221015 () Bool)

(declare-fun lt!348800 () (_ BitVec 64))

(assert (=> b!221015 (= e!150068 (bvsle lt!348798 (bvmul lt!348800 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221015 (or (= lt!348800 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348800 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348800)))))

(assert (=> b!221015 (= lt!348800 ((_ sign_extend 32) (size!4741 (buf!5288 lt!348701))))))

(assert (= (and d!74413 res!186123) b!221014))

(assert (= (and b!221014 res!186124) b!221015))

(declare-fun m!339695 () Bool)

(assert (=> d!74413 m!339695))

(declare-fun m!339697 () Bool)

(assert (=> d!74413 m!339697))

(assert (=> d!74381 d!74413))

(declare-fun d!74421 () Bool)

(declare-fun e!150069 () Bool)

(assert (=> d!74421 e!150069))

(declare-fun res!186125 () Bool)

(assert (=> d!74421 (=> (not res!186125) (not e!150069))))

(declare-fun lt!348805 () (_ BitVec 64))

(declare-fun lt!348802 () (_ BitVec 64))

(declare-fun lt!348804 () (_ BitVec 64))

(assert (=> d!74421 (= res!186125 (= lt!348804 (bvsub lt!348805 lt!348802)))))

(assert (=> d!74421 (or (= (bvand lt!348805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348802 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348805 lt!348802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74421 (= lt!348802 (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) ((_ sign_extend 32) (currentByte!9924 bs!62)) ((_ sign_extend 32) (currentBit!9919 bs!62))))))

(declare-fun lt!348803 () (_ BitVec 64))

(declare-fun lt!348801 () (_ BitVec 64))

(assert (=> d!74421 (= lt!348805 (bvmul lt!348803 lt!348801))))

(assert (=> d!74421 (or (= lt!348803 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348801 (bvsdiv (bvmul lt!348803 lt!348801) lt!348803)))))

(assert (=> d!74421 (= lt!348801 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74421 (= lt!348803 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))))))

(assert (=> d!74421 (= lt!348804 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9924 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9919 bs!62))))))

(assert (=> d!74421 (invariant!0 (currentBit!9919 bs!62) (currentByte!9924 bs!62) (size!4741 (buf!5288 bs!62)))))

(assert (=> d!74421 (= (bitIndex!0 (size!4741 (buf!5288 bs!62)) (currentByte!9924 bs!62) (currentBit!9919 bs!62)) lt!348804)))

(declare-fun b!221016 () Bool)

(declare-fun res!186126 () Bool)

(assert (=> b!221016 (=> (not res!186126) (not e!150069))))

(assert (=> b!221016 (= res!186126 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348804))))

(declare-fun b!221017 () Bool)

(declare-fun lt!348806 () (_ BitVec 64))

(assert (=> b!221017 (= e!150069 (bvsle lt!348804 (bvmul lt!348806 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221017 (or (= lt!348806 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348806 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348806)))))

(assert (=> b!221017 (= lt!348806 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))))))

(assert (= (and d!74421 res!186125) b!221016))

(assert (= (and b!221016 res!186126) b!221017))

(assert (=> d!74421 m!339625))

(assert (=> d!74421 m!339655))

(assert (=> d!74381 d!74421))

(declare-fun d!74423 () Bool)

(declare-fun lt!348846 () (_ BitVec 32))

(assert (=> d!74423 (= lt!348846 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!348850 () (_ BitVec 32))

(assert (=> d!74423 (= lt!348850 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!150085 () Bool)

(assert (=> d!74423 e!150085))

(declare-fun res!186137 () Bool)

(assert (=> d!74423 (=> (not res!186137) (not e!150085))))

(assert (=> d!74423 (= res!186137 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!15625 () Unit!15615)

(declare-fun Unit!15626 () Unit!15615)

(declare-fun Unit!15627 () Unit!15615)

(assert (=> d!74423 (= (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9919 bs!62) lt!348846) #b00000000000000000000000000000000) (tuple2!18977 Unit!15625 (BitStream!8591 (buf!5288 bs!62) (bvsub (bvadd (currentByte!9924 bs!62) lt!348850) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348846 (currentBit!9919 bs!62)))) (ite (bvsge (bvadd (currentBit!9919 bs!62) lt!348846) #b00000000000000000000000000001000) (tuple2!18977 Unit!15626 (BitStream!8591 (buf!5288 bs!62) (bvadd (currentByte!9924 bs!62) lt!348850 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9919 bs!62) lt!348846) #b00000000000000000000000000001000))) (tuple2!18977 Unit!15627 (BitStream!8591 (buf!5288 bs!62) (bvadd (currentByte!9924 bs!62) lt!348850) (bvadd (currentBit!9919 bs!62) lt!348846))))))))

(declare-fun b!221028 () Bool)

(declare-fun e!150084 () Bool)

(assert (=> b!221028 (= e!150085 e!150084)))

(declare-fun res!186138 () Bool)

(assert (=> b!221028 (=> (not res!186138) (not e!150084))))

(declare-fun lt!348848 () (_ BitVec 64))

(declare-fun lt!348847 () tuple2!18976)

(assert (=> b!221028 (= res!186138 (= (bvadd lt!348848 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4741 (buf!5288 (_2!10146 lt!348847))) (currentByte!9924 (_2!10146 lt!348847)) (currentBit!9919 (_2!10146 lt!348847)))))))

(assert (=> b!221028 (or (not (= (bvand lt!348848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348848 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221028 (= lt!348848 (bitIndex!0 (size!4741 (buf!5288 bs!62)) (currentByte!9924 bs!62) (currentBit!9919 bs!62)))))

(declare-fun lt!348845 () (_ BitVec 32))

(declare-fun lt!348849 () (_ BitVec 32))

(declare-fun Unit!15628 () Unit!15615)

(declare-fun Unit!15629 () Unit!15615)

(declare-fun Unit!15630 () Unit!15615)

(assert (=> b!221028 (= lt!348847 (ite (bvslt (bvadd (currentBit!9919 bs!62) lt!348845) #b00000000000000000000000000000000) (tuple2!18977 Unit!15628 (BitStream!8591 (buf!5288 bs!62) (bvsub (bvadd (currentByte!9924 bs!62) lt!348849) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348845 (currentBit!9919 bs!62)))) (ite (bvsge (bvadd (currentBit!9919 bs!62) lt!348845) #b00000000000000000000000000001000) (tuple2!18977 Unit!15629 (BitStream!8591 (buf!5288 bs!62) (bvadd (currentByte!9924 bs!62) lt!348849 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9919 bs!62) lt!348845) #b00000000000000000000000000001000))) (tuple2!18977 Unit!15630 (BitStream!8591 (buf!5288 bs!62) (bvadd (currentByte!9924 bs!62) lt!348849) (bvadd (currentBit!9919 bs!62) lt!348845))))))))

(assert (=> b!221028 (= lt!348845 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221028 (= lt!348849 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!221029 () Bool)

(assert (=> b!221029 (= e!150084 (and (= (size!4741 (buf!5288 bs!62)) (size!4741 (buf!5288 (_2!10146 lt!348847)))) (= (buf!5288 bs!62) (buf!5288 (_2!10146 lt!348847)))))))

(assert (= (and d!74423 res!186137) b!221028))

(assert (= (and b!221028 res!186138) b!221029))

(assert (=> d!74423 m!339647))

(declare-fun m!339699 () Bool)

(assert (=> b!221028 m!339699))

(assert (=> b!221028 m!339643))

(assert (=> d!74381 d!74423))

(declare-fun d!74431 () Bool)

(declare-fun res!186146 () Bool)

(declare-fun e!150093 () Bool)

(assert (=> d!74431 (=> (not res!186146) (not e!150093))))

(assert (=> d!74431 (= res!186146 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62)))))))))

(assert (=> d!74431 (= (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) e!150093)))

(declare-fun b!221039 () Bool)

(declare-fun lt!348868 () (_ BitVec 64))

(assert (=> b!221039 (= e!150093 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348868) (bvsle lt!348868 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62)))))))))

(assert (=> b!221039 (= lt!348868 (bvadd (bitIndex!0 (size!4741 (buf!5288 bs!62)) (currentByte!9924 bs!62) (currentBit!9919 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!74431 res!186146) b!221039))

(assert (=> b!221039 m!339643))

(assert (=> d!74381 d!74431))

(declare-fun d!74439 () Bool)

(declare-fun e!150106 () Bool)

(assert (=> d!74439 e!150106))

(declare-fun res!186155 () Bool)

(assert (=> d!74439 (=> (not res!186155) (not e!150106))))

(declare-fun increaseBitIndex!0 (BitStream!8590) tuple2!18976)

(assert (=> d!74439 (= res!186155 (= (buf!5288 (_2!10146 (increaseBitIndex!0 bs!62))) (buf!5288 bs!62)))))

(declare-fun lt!348902 () Bool)

(assert (=> d!74439 (= lt!348902 (not (= (bvand ((_ sign_extend 24) (select (arr!5671 (buf!5288 bs!62)) (currentByte!9924 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9919 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348900 () tuple2!18978)

(assert (=> d!74439 (= lt!348900 (tuple2!18979 (not (= (bvand ((_ sign_extend 24) (select (arr!5671 (buf!5288 bs!62)) (currentByte!9924 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9919 bs!62)))) #b00000000000000000000000000000000)) (_2!10146 (increaseBitIndex!0 bs!62))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!74439 (validate_offset_bit!0 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) ((_ sign_extend 32) (currentByte!9924 bs!62)) ((_ sign_extend 32) (currentBit!9919 bs!62)))))

(assert (=> d!74439 (= (readBit!0 bs!62) lt!348900)))

(declare-fun lt!348896 () (_ BitVec 64))

(declare-fun lt!348901 () (_ BitVec 64))

(declare-fun b!221054 () Bool)

(assert (=> b!221054 (= e!150106 (= (bitIndex!0 (size!4741 (buf!5288 (_2!10146 (increaseBitIndex!0 bs!62)))) (currentByte!9924 (_2!10146 (increaseBitIndex!0 bs!62))) (currentBit!9919 (_2!10146 (increaseBitIndex!0 bs!62)))) (bvadd lt!348896 lt!348901)))))

(assert (=> b!221054 (or (not (= (bvand lt!348896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348901 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348896 lt!348901) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221054 (= lt!348901 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!221054 (= lt!348896 (bitIndex!0 (size!4741 (buf!5288 bs!62)) (currentByte!9924 bs!62) (currentBit!9919 bs!62)))))

(declare-fun lt!348899 () Bool)

(assert (=> b!221054 (= lt!348899 (not (= (bvand ((_ sign_extend 24) (select (arr!5671 (buf!5288 bs!62)) (currentByte!9924 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9919 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348897 () Bool)

(assert (=> b!221054 (= lt!348897 (not (= (bvand ((_ sign_extend 24) (select (arr!5671 (buf!5288 bs!62)) (currentByte!9924 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9919 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348898 () Bool)

(assert (=> b!221054 (= lt!348898 (not (= (bvand ((_ sign_extend 24) (select (arr!5671 (buf!5288 bs!62)) (currentByte!9924 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9919 bs!62)))) #b00000000000000000000000000000000)))))

(assert (= (and d!74439 res!186155) b!221054))

(declare-fun m!339725 () Bool)

(assert (=> d!74439 m!339725))

(declare-fun m!339727 () Bool)

(assert (=> d!74439 m!339727))

(declare-fun m!339729 () Bool)

(assert (=> d!74439 m!339729))

(declare-fun m!339731 () Bool)

(assert (=> d!74439 m!339731))

(assert (=> b!221054 m!339725))

(declare-fun m!339733 () Bool)

(assert (=> b!221054 m!339733))

(assert (=> b!221054 m!339643))

(assert (=> b!221054 m!339729))

(assert (=> b!221054 m!339727))

(assert (=> d!74385 d!74439))

(declare-fun b!221101 () Bool)

(declare-fun res!186196 () Bool)

(declare-fun e!150129 () Bool)

(assert (=> b!221101 (=> (not res!186196) (not e!150129))))

(declare-fun lt!348959 () tuple2!18974)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!221101 (= res!186196 (= (bvand (_1!10145 lt!348959) (onesLSBLong!0 nBits!265)) (_1!10145 lt!348959)))))

(declare-fun b!221102 () Bool)

(declare-fun res!186198 () Bool)

(assert (=> b!221102 (=> (not res!186198) (not e!150129))))

(declare-fun lt!348961 () (_ BitVec 64))

(declare-fun lt!348962 () (_ BitVec 64))

(assert (=> b!221102 (= res!186198 (= (bitIndex!0 (size!4741 (buf!5288 (_2!10145 lt!348959))) (currentByte!9924 (_2!10145 lt!348959)) (currentBit!9919 (_2!10145 lt!348959))) (bvadd lt!348962 lt!348961)))))

(assert (=> b!221102 (or (not (= (bvand lt!348962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348961 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348962 lt!348961) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221102 (= lt!348961 ((_ sign_extend 32) (bvsub nBits!265 i!541)))))

(assert (=> b!221102 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))

(assert (=> b!221102 (= lt!348962 (bitIndex!0 (size!4741 (buf!5288 bs!62)) (currentByte!9924 bs!62) (currentBit!9919 bs!62)))))

(declare-fun b!221103 () Bool)

(declare-fun e!150128 () tuple2!18974)

(assert (=> b!221103 (= e!150128 (tuple2!18975 acc!113 bs!62))))

(declare-fun d!74443 () Bool)

(assert (=> d!74443 e!150129))

(declare-fun res!186197 () Bool)

(assert (=> d!74443 (=> (not res!186197) (not e!150129))))

(assert (=> d!74443 (= res!186197 (= (buf!5288 (_2!10145 lt!348959)) (buf!5288 bs!62)))))

(assert (=> d!74443 (= lt!348959 e!150128)))

(declare-fun c!10714 () Bool)

(assert (=> d!74443 (= c!10714 (= nBits!265 i!541))))

(assert (=> d!74443 (and (bvsle #b00000000000000000000000000000000 i!541) (bvsle i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74443 (= (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113) lt!348959)))

(declare-fun b!221104 () Bool)

(declare-fun e!150127 () Bool)

(assert (=> b!221104 (= e!150129 e!150127)))

(declare-fun res!186195 () Bool)

(assert (=> b!221104 (=> res!186195 e!150127)))

(assert (=> b!221104 (= res!186195 (not (bvslt i!541 nBits!265)))))

(declare-fun b!221105 () Bool)

(declare-fun res!186194 () Bool)

(assert (=> b!221105 (=> (not res!186194) (not e!150129))))

(assert (=> b!221105 (= res!186194 (= (bvand (_1!10145 lt!348959) (onesLSBLong!0 i!541)) (bvand acc!113 (onesLSBLong!0 i!541))))))

(declare-fun b!221106 () Bool)

(declare-fun lt!348958 () (_ BitVec 64))

(assert (=> b!221106 (= e!150127 (= (= (bvand (bvlshr (_1!10145 lt!348959) lt!348958) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10137 (readBitPure!0 bs!62))))))

(assert (=> b!221106 (and (bvsge lt!348958 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348958 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221106 (= lt!348958 ((_ sign_extend 32) i!541))))

(declare-fun b!221107 () Bool)

(declare-fun lt!348957 () tuple2!18974)

(assert (=> b!221107 (= e!150128 (tuple2!18975 (_1!10145 lt!348957) (_2!10145 lt!348957)))))

(declare-fun lt!348960 () tuple2!18978)

(assert (=> b!221107 (= lt!348960 (readBit!0 bs!62))))

(assert (=> b!221107 (= lt!348957 (readNBitsLSBFirstsLoop!0 (_2!10147 lt!348960) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10147 lt!348960) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74443 c!10714) b!221103))

(assert (= (and d!74443 (not c!10714)) b!221107))

(assert (= (and d!74443 res!186197) b!221102))

(assert (= (and b!221102 res!186198) b!221105))

(assert (= (and b!221105 res!186194) b!221101))

(assert (= (and b!221101 res!186196) b!221104))

(assert (= (and b!221104 (not res!186195)) b!221106))

(declare-fun m!339759 () Bool)

(assert (=> b!221101 m!339759))

(declare-fun m!339761 () Bool)

(assert (=> b!221105 m!339761))

(declare-fun m!339763 () Bool)

(assert (=> b!221102 m!339763))

(assert (=> b!221102 m!339643))

(assert (=> b!221106 m!339575))

(assert (=> b!221107 m!339649))

(declare-fun m!339765 () Bool)

(assert (=> b!221107 m!339765))

(assert (=> d!74387 d!74443))

(declare-fun b!221108 () Bool)

(declare-fun res!186201 () Bool)

(declare-fun e!150132 () Bool)

(assert (=> b!221108 (=> (not res!186201) (not e!150132))))

(declare-fun lt!348965 () tuple2!18974)

(assert (=> b!221108 (= res!186201 (= (bvand (_1!10145 lt!348965) (onesLSBLong!0 nBits!265)) (_1!10145 lt!348965)))))

(declare-fun b!221109 () Bool)

(declare-fun res!186203 () Bool)

(assert (=> b!221109 (=> (not res!186203) (not e!150132))))

(declare-fun lt!348967 () (_ BitVec 64))

(declare-fun lt!348968 () (_ BitVec 64))

(assert (=> b!221109 (= res!186203 (= (bitIndex!0 (size!4741 (buf!5288 (_2!10145 lt!348965))) (currentByte!9924 (_2!10145 lt!348965)) (currentBit!9919 (_2!10145 lt!348965))) (bvadd lt!348968 lt!348967)))))

(assert (=> b!221109 (or (not (= (bvand lt!348968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348967 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348968 lt!348967) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221109 (= lt!348967 ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541))))))

(assert (=> b!221109 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!541) #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)) #b10000000000000000000000000000000)))))

(assert (=> b!221109 (= lt!348968 (bitIndex!0 (size!4741 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun e!150131 () tuple2!18974)

(declare-fun b!221110 () Bool)

(assert (=> b!221110 (= e!150131 (tuple2!18975 (bvor acc!113 e!150009) (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!74455 () Bool)

(assert (=> d!74455 e!150132))

(declare-fun res!186202 () Bool)

(assert (=> d!74455 (=> (not res!186202) (not e!150132))))

(assert (=> d!74455 (= res!186202 (= (buf!5288 (_2!10145 lt!348965)) (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!74455 (= lt!348965 e!150131)))

(declare-fun c!10715 () Bool)

(assert (=> d!74455 (= c!10715 (= nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))

(assert (=> d!74455 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)) (bvsle (bvadd #b00000000000000000000000000000001 i!541) nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74455 (= (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150009)) lt!348965)))

(declare-fun b!221111 () Bool)

(declare-fun e!150130 () Bool)

(assert (=> b!221111 (= e!150132 e!150130)))

(declare-fun res!186200 () Bool)

(assert (=> b!221111 (=> res!186200 e!150130)))

(assert (=> b!221111 (= res!186200 (not (bvslt (bvadd #b00000000000000000000000000000001 i!541) nBits!265)))))

(declare-fun b!221112 () Bool)

(declare-fun res!186199 () Bool)

(assert (=> b!221112 (=> (not res!186199) (not e!150132))))

(assert (=> b!221112 (= res!186199 (= (bvand (_1!10145 lt!348965) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541))) (bvand (bvor acc!113 e!150009) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun b!221113 () Bool)

(declare-fun lt!348964 () (_ BitVec 64))

(assert (=> b!221113 (= e!150130 (= (= (bvand (bvlshr (_1!10145 lt!348965) lt!348964) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10137 (readBitPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!221113 (and (bvsge lt!348964 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348964 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221113 (= lt!348964 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-fun b!221114 () Bool)

(declare-fun lt!348963 () tuple2!18974)

(assert (=> b!221114 (= e!150131 (tuple2!18975 (_1!10145 lt!348963) (_2!10145 lt!348963)))))

(declare-fun lt!348966 () tuple2!18978)

(assert (=> b!221114 (= lt!348966 (readBit!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!221114 (= lt!348963 (readNBitsLSBFirstsLoop!0 (_2!10147 lt!348966) nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) (bvor (bvor acc!113 e!150009) (ite (_1!10147 lt!348966) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74455 c!10715) b!221110))

(assert (= (and d!74455 (not c!10715)) b!221114))

(assert (= (and d!74455 res!186202) b!221109))

(assert (= (and b!221109 res!186203) b!221112))

(assert (= (and b!221112 res!186199) b!221108))

(assert (= (and b!221108 res!186201) b!221111))

(assert (= (and b!221111 (not res!186200)) b!221113))

(assert (=> b!221108 m!339759))

(declare-fun m!339767 () Bool)

(assert (=> b!221112 m!339767))

(declare-fun m!339769 () Bool)

(assert (=> b!221109 m!339769))

(declare-fun m!339771 () Bool)

(assert (=> b!221109 m!339771))

(assert (=> b!221113 m!339571))

(declare-fun m!339773 () Bool)

(assert (=> b!221113 m!339773))

(assert (=> b!221114 m!339571))

(declare-fun m!339775 () Bool)

(assert (=> b!221114 m!339775))

(declare-fun m!339777 () Bool)

(assert (=> b!221114 m!339777))

(assert (=> d!74373 d!74455))

(declare-fun d!74457 () Bool)

(assert (=> d!74457 (= (invariant!0 (currentBit!9919 bs!62) (currentByte!9924 bs!62) (size!4741 (buf!5288 bs!62))) (and (bvsge (currentBit!9919 bs!62) #b00000000000000000000000000000000) (bvslt (currentBit!9919 bs!62) #b00000000000000000000000000001000) (bvsge (currentByte!9924 bs!62) #b00000000000000000000000000000000) (or (bvslt (currentByte!9924 bs!62) (size!4741 (buf!5288 bs!62))) (and (= (currentBit!9919 bs!62) #b00000000000000000000000000000000) (= (currentByte!9924 bs!62) (size!4741 (buf!5288 bs!62)))))))))

(assert (=> d!74389 d!74457))

(declare-fun d!74459 () Bool)

(assert (=> d!74459 (= (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) ((_ sign_extend 32) (currentByte!9924 bs!62)) ((_ sign_extend 32) (currentBit!9919 bs!62))) (bvsub (bvmul ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9924 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9919 bs!62)))))))

(assert (=> d!74367 d!74459))

(push 1)

(assert (not b!221114))

(assert (not d!74413))

(assert (not b!221054))

(assert (not b!221105))

(assert (not b!221039))

(assert (not b!221102))

(assert (not d!74423))

(assert (not b!221109))

(assert (not b!221106))

(assert (not b!221108))

(assert (not b!221112))

(assert (not b!221028))

(assert (not b!221101))

(assert (not b!221107))

(assert (not d!74439))

(assert (not d!74421))

(assert (not b!221113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!221106 d!74385))

(declare-fun d!74529 () Bool)

(declare-fun lt!349120 () tuple2!18978)

(assert (=> d!74529 (= lt!349120 (readBit!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!74529 (= (readBitPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (tuple2!18959 (_2!10147 lt!349120) (_1!10147 lt!349120)))))

(declare-fun bs!18216 () Bool)

(assert (= bs!18216 d!74529))

(assert (=> bs!18216 m!339571))

(assert (=> bs!18216 m!339775))

(assert (=> b!221113 d!74529))

(assert (=> d!74423 d!74431))

(assert (=> b!221107 d!74439))

(declare-fun b!221187 () Bool)

(declare-fun res!186269 () Bool)

(declare-fun e!150174 () Bool)

(assert (=> b!221187 (=> (not res!186269) (not e!150174))))

(declare-fun lt!349123 () tuple2!18974)

(assert (=> b!221187 (= res!186269 (= (bvand (_1!10145 lt!349123) (onesLSBLong!0 nBits!265)) (_1!10145 lt!349123)))))

(declare-fun b!221188 () Bool)

(declare-fun res!186271 () Bool)

(assert (=> b!221188 (=> (not res!186271) (not e!150174))))

(declare-fun lt!349125 () (_ BitVec 64))

(declare-fun lt!349126 () (_ BitVec 64))

(assert (=> b!221188 (= res!186271 (= (bitIndex!0 (size!4741 (buf!5288 (_2!10145 lt!349123))) (currentByte!9924 (_2!10145 lt!349123)) (currentBit!9919 (_2!10145 lt!349123))) (bvadd lt!349126 lt!349125)))))

(assert (=> b!221188 (or (not (= (bvand lt!349126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349125 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349126 lt!349125) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221188 (= lt!349125 ((_ sign_extend 32) (bvsub nBits!265 (bvadd i!541 #b00000000000000000000000000000001))))))

(assert (=> b!221188 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvadd i!541 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 (bvadd i!541 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!221188 (= lt!349126 (bitIndex!0 (size!4741 (buf!5288 (_2!10147 lt!348960))) (currentByte!9924 (_2!10147 lt!348960)) (currentBit!9919 (_2!10147 lt!348960))))))

(declare-fun e!150173 () tuple2!18974)

(declare-fun b!221189 () Bool)

(assert (=> b!221189 (= e!150173 (tuple2!18975 (bvor acc!113 (ite (_1!10147 lt!348960) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10147 lt!348960)))))

(declare-fun d!74531 () Bool)

(assert (=> d!74531 e!150174))

(declare-fun res!186270 () Bool)

(assert (=> d!74531 (=> (not res!186270) (not e!150174))))

(assert (=> d!74531 (= res!186270 (= (buf!5288 (_2!10145 lt!349123)) (buf!5288 (_2!10147 lt!348960))))))

(assert (=> d!74531 (= lt!349123 e!150173)))

(declare-fun c!10720 () Bool)

(assert (=> d!74531 (= c!10720 (= nBits!265 (bvadd i!541 #b00000000000000000000000000000001)))))

(assert (=> d!74531 (and (bvsle #b00000000000000000000000000000000 (bvadd i!541 #b00000000000000000000000000000001)) (bvsle (bvadd i!541 #b00000000000000000000000000000001) nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74531 (= (readNBitsLSBFirstsLoop!0 (_2!10147 lt!348960) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10147 lt!348960) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!349123)))

(declare-fun b!221190 () Bool)

(declare-fun e!150172 () Bool)

(assert (=> b!221190 (= e!150174 e!150172)))

(declare-fun res!186268 () Bool)

(assert (=> b!221190 (=> res!186268 e!150172)))

(assert (=> b!221190 (= res!186268 (not (bvslt (bvadd i!541 #b00000000000000000000000000000001) nBits!265)))))

(declare-fun b!221191 () Bool)

(declare-fun res!186267 () Bool)

(assert (=> b!221191 (=> (not res!186267) (not e!150174))))

(assert (=> b!221191 (= res!186267 (= (bvand (_1!10145 lt!349123) (onesLSBLong!0 (bvadd i!541 #b00000000000000000000000000000001))) (bvand (bvor acc!113 (ite (_1!10147 lt!348960) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd i!541 #b00000000000000000000000000000001)))))))

(declare-fun b!221192 () Bool)

(declare-fun lt!349122 () (_ BitVec 64))

(assert (=> b!221192 (= e!150172 (= (= (bvand (bvlshr (_1!10145 lt!349123) lt!349122) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10137 (readBitPure!0 (_2!10147 lt!348960)))))))

(assert (=> b!221192 (and (bvsge lt!349122 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!349122 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221192 (= lt!349122 ((_ sign_extend 32) (bvadd i!541 #b00000000000000000000000000000001)))))

(declare-fun b!221193 () Bool)

(declare-fun lt!349121 () tuple2!18974)

(assert (=> b!221193 (= e!150173 (tuple2!18975 (_1!10145 lt!349121) (_2!10145 lt!349121)))))

(declare-fun lt!349124 () tuple2!18978)

(assert (=> b!221193 (= lt!349124 (readBit!0 (_2!10147 lt!348960)))))

(assert (=> b!221193 (= lt!349121 (readNBitsLSBFirstsLoop!0 (_2!10147 lt!349124) nBits!265 (bvadd i!541 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor acc!113 (ite (_1!10147 lt!348960) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10147 lt!349124) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd i!541 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74531 c!10720) b!221189))

(assert (= (and d!74531 (not c!10720)) b!221193))

(assert (= (and d!74531 res!186270) b!221188))

(assert (= (and b!221188 res!186271) b!221191))

(assert (= (and b!221191 res!186267) b!221187))

(assert (= (and b!221187 res!186269) b!221190))

(assert (= (and b!221190 (not res!186268)) b!221192))

(assert (=> b!221187 m!339759))

(declare-fun m!339897 () Bool)

(assert (=> b!221191 m!339897))

(declare-fun m!339899 () Bool)

(assert (=> b!221188 m!339899))

(declare-fun m!339901 () Bool)

(assert (=> b!221188 m!339901))

(declare-fun m!339903 () Bool)

(assert (=> b!221192 m!339903))

(declare-fun m!339905 () Bool)

(assert (=> b!221193 m!339905))

(declare-fun m!339907 () Bool)

(assert (=> b!221193 m!339907))

(assert (=> b!221107 d!74531))

(declare-fun d!74533 () Bool)

(declare-fun e!150175 () Bool)

(assert (=> d!74533 e!150175))

(declare-fun res!186272 () Bool)

(assert (=> d!74533 (=> (not res!186272) (not e!150175))))

(assert (=> d!74533 (= res!186272 (= (buf!5288 (_2!10146 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!349133 () Bool)

(assert (=> d!74533 (= lt!349133 (not (= (bvand ((_ sign_extend 24) (select (arr!5671 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!349131 () tuple2!18978)

(assert (=> d!74533 (= lt!349131 (tuple2!18979 (not (= (bvand ((_ sign_extend 24) (select (arr!5671 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)) (_2!10146 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!74533 (validate_offset_bit!0 ((_ sign_extend 32) (size!4741 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!74533 (= (readBit!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!349131)))

(declare-fun lt!349132 () (_ BitVec 64))

(declare-fun lt!349127 () (_ BitVec 64))

(declare-fun b!221194 () Bool)

(assert (=> b!221194 (= e!150175 (= (bitIndex!0 (size!4741 (buf!5288 (_2!10146 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) (currentByte!9924 (_2!10146 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) (currentBit!9919 (_2!10146 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) (bvadd lt!349127 lt!349132)))))

(assert (=> b!221194 (or (not (= (bvand lt!349127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349132 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349127 lt!349132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221194 (= lt!349132 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!221194 (= lt!349127 (bitIndex!0 (size!4741 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!349130 () Bool)

(assert (=> b!221194 (= lt!349130 (not (= (bvand ((_ sign_extend 24) (select (arr!5671 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!349128 () Bool)

(assert (=> b!221194 (= lt!349128 (not (= (bvand ((_ sign_extend 24) (select (arr!5671 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!349129 () Bool)

(assert (=> b!221194 (= lt!349129 (not (= (bvand ((_ sign_extend 24) (select (arr!5671 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(assert (= (and d!74533 res!186272) b!221194))

(assert (=> d!74533 m!339571))

(declare-fun m!339909 () Bool)

(assert (=> d!74533 m!339909))

(declare-fun m!339911 () Bool)

(assert (=> d!74533 m!339911))

(declare-fun m!339913 () Bool)

(assert (=> d!74533 m!339913))

(declare-fun m!339915 () Bool)

(assert (=> d!74533 m!339915))

(assert (=> b!221194 m!339571))

(assert (=> b!221194 m!339909))

(declare-fun m!339917 () Bool)

(assert (=> b!221194 m!339917))

(assert (=> b!221194 m!339771))

(assert (=> b!221194 m!339913))

(assert (=> b!221194 m!339911))

(assert (=> b!221114 d!74533))

(declare-fun b!221195 () Bool)

(declare-fun res!186275 () Bool)

(declare-fun e!150178 () Bool)

(assert (=> b!221195 (=> (not res!186275) (not e!150178))))

(declare-fun lt!349136 () tuple2!18974)

(assert (=> b!221195 (= res!186275 (= (bvand (_1!10145 lt!349136) (onesLSBLong!0 nBits!265)) (_1!10145 lt!349136)))))

(declare-fun b!221196 () Bool)

(declare-fun res!186277 () Bool)

(assert (=> b!221196 (=> (not res!186277) (not e!150178))))

(declare-fun lt!349138 () (_ BitVec 64))

(declare-fun lt!349139 () (_ BitVec 64))

(assert (=> b!221196 (= res!186277 (= (bitIndex!0 (size!4741 (buf!5288 (_2!10145 lt!349136))) (currentByte!9924 (_2!10145 lt!349136)) (currentBit!9919 (_2!10145 lt!349136))) (bvadd lt!349139 lt!349138)))))

(assert (=> b!221196 (or (not (= (bvand lt!349139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349138 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349139 lt!349138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221196 (= lt!349138 ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001))))))

(assert (=> b!221196 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!221196 (= lt!349139 (bitIndex!0 (size!4741 (buf!5288 (_2!10147 lt!348966))) (currentByte!9924 (_2!10147 lt!348966)) (currentBit!9919 (_2!10147 lt!348966))))))

(declare-fun e!150177 () tuple2!18974)

(declare-fun b!221197 () Bool)

(assert (=> b!221197 (= e!150177 (tuple2!18975 (bvor (bvor acc!113 e!150009) (ite (_1!10147 lt!348966) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10147 lt!348966)))))

(declare-fun d!74535 () Bool)

(assert (=> d!74535 e!150178))

(declare-fun res!186276 () Bool)

(assert (=> d!74535 (=> (not res!186276) (not e!150178))))

(assert (=> d!74535 (= res!186276 (= (buf!5288 (_2!10145 lt!349136)) (buf!5288 (_2!10147 lt!348966))))))

(assert (=> d!74535 (= lt!349136 e!150177)))

(declare-fun c!10721 () Bool)

(assert (=> d!74535 (= c!10721 (= nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)))))

(assert (=> d!74535 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74535 (= (readNBitsLSBFirstsLoop!0 (_2!10147 lt!348966) nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) (bvor (bvor acc!113 e!150009) (ite (_1!10147 lt!348966) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!349136)))

(declare-fun b!221198 () Bool)

(declare-fun e!150176 () Bool)

(assert (=> b!221198 (= e!150178 e!150176)))

(declare-fun res!186274 () Bool)

(assert (=> b!221198 (=> res!186274 e!150176)))

(assert (=> b!221198 (= res!186274 (not (bvslt (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) nBits!265)))))

(declare-fun b!221199 () Bool)

(declare-fun res!186273 () Bool)

(assert (=> b!221199 (=> (not res!186273) (not e!150178))))

(assert (=> b!221199 (= res!186273 (= (bvand (_1!10145 lt!349136) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001))) (bvand (bvor (bvor acc!113 e!150009) (ite (_1!10147 lt!348966) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)))))))

(declare-fun lt!349135 () (_ BitVec 64))

(declare-fun b!221200 () Bool)

(assert (=> b!221200 (= e!150176 (= (= (bvand (bvlshr (_1!10145 lt!349136) lt!349135) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10137 (readBitPure!0 (_2!10147 lt!348966)))))))

(assert (=> b!221200 (and (bvsge lt!349135 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!349135 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221200 (= lt!349135 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)))))

(declare-fun b!221201 () Bool)

(declare-fun lt!349134 () tuple2!18974)

(assert (=> b!221201 (= e!150177 (tuple2!18975 (_1!10145 lt!349134) (_2!10145 lt!349134)))))

(declare-fun lt!349137 () tuple2!18978)

(assert (=> b!221201 (= lt!349137 (readBit!0 (_2!10147 lt!348966)))))

(assert (=> b!221201 (= lt!349134 (readNBitsLSBFirstsLoop!0 (_2!10147 lt!349137) nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!113 e!150009) (ite (_1!10147 lt!348966) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10147 lt!349137) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74535 c!10721) b!221197))

(assert (= (and d!74535 (not c!10721)) b!221201))

(assert (= (and d!74535 res!186276) b!221196))

(assert (= (and b!221196 res!186277) b!221199))

(assert (= (and b!221199 res!186273) b!221195))

(assert (= (and b!221195 res!186275) b!221198))

(assert (= (and b!221198 (not res!186274)) b!221200))

(assert (=> b!221195 m!339759))

(declare-fun m!339919 () Bool)

(assert (=> b!221199 m!339919))

(declare-fun m!339921 () Bool)

(assert (=> b!221196 m!339921))

(declare-fun m!339923 () Bool)

(assert (=> b!221196 m!339923))

(declare-fun m!339925 () Bool)

(assert (=> b!221200 m!339925))

(declare-fun m!339927 () Bool)

(assert (=> b!221201 m!339927))

(declare-fun m!339929 () Bool)

(assert (=> b!221201 m!339929))

(assert (=> b!221114 d!74535))

(declare-fun d!74537 () Bool)

(declare-fun e!150181 () Bool)

(assert (=> d!74537 e!150181))

(declare-fun res!186282 () Bool)

(assert (=> d!74537 (=> (not res!186282) (not e!150181))))

(declare-fun lt!349153 () tuple2!18976)

(declare-fun lt!349151 () (_ BitVec 64))

(declare-fun lt!349150 () (_ BitVec 64))

(assert (=> d!74537 (= res!186282 (= (bvadd lt!349151 lt!349150) (bitIndex!0 (size!4741 (buf!5288 (_2!10146 lt!349153))) (currentByte!9924 (_2!10146 lt!349153)) (currentBit!9919 (_2!10146 lt!349153)))))))

(assert (=> d!74537 (or (not (= (bvand lt!349151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349150 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349151 lt!349150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74537 (= lt!349150 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74537 (= lt!349151 (bitIndex!0 (size!4741 (buf!5288 bs!62)) (currentByte!9924 bs!62) (currentBit!9919 bs!62)))))

(declare-fun Unit!15641 () Unit!15615)

(declare-fun Unit!15642 () Unit!15615)

(assert (=> d!74537 (= lt!349153 (ite (bvslt (currentBit!9919 bs!62) #b00000000000000000000000000000111) (tuple2!18977 Unit!15641 (BitStream!8591 (buf!5288 bs!62) (currentByte!9924 bs!62) (bvadd (currentBit!9919 bs!62) #b00000000000000000000000000000001))) (tuple2!18977 Unit!15642 (BitStream!8591 (buf!5288 bs!62) (bvadd (currentByte!9924 bs!62) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!74537 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) ((_ sign_extend 32) (currentByte!9924 bs!62)) ((_ sign_extend 32) (currentBit!9919 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!74537 (= (increaseBitIndex!0 bs!62) lt!349153)))

(declare-fun b!221206 () Bool)

(declare-fun res!186283 () Bool)

(assert (=> b!221206 (=> (not res!186283) (not e!150181))))

(declare-fun lt!349154 () (_ BitVec 64))

(declare-fun lt!349152 () (_ BitVec 64))

(assert (=> b!221206 (= res!186283 (= (bvsub lt!349154 lt!349152) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!221206 (or (= (bvand lt!349154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349152 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349154 lt!349152) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221206 (= lt!349152 (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10146 lt!349153)))) ((_ sign_extend 32) (currentByte!9924 (_2!10146 lt!349153))) ((_ sign_extend 32) (currentBit!9919 (_2!10146 lt!349153)))))))

(assert (=> b!221206 (= lt!349154 (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) ((_ sign_extend 32) (currentByte!9924 bs!62)) ((_ sign_extend 32) (currentBit!9919 bs!62))))))

(declare-fun b!221207 () Bool)

(assert (=> b!221207 (= e!150181 (= (size!4741 (buf!5288 bs!62)) (size!4741 (buf!5288 (_2!10146 lt!349153)))))))

(assert (= (and d!74537 res!186282) b!221206))

(assert (= (and b!221206 res!186283) b!221207))

(declare-fun m!339931 () Bool)

(assert (=> d!74537 m!339931))

(assert (=> d!74537 m!339643))

(assert (=> d!74537 m!339625))

(declare-fun m!339933 () Bool)

(assert (=> b!221206 m!339933))

(assert (=> b!221206 m!339625))

(assert (=> d!74439 d!74537))

(declare-fun d!74539 () Bool)

(assert (=> d!74539 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) ((_ sign_extend 32) (currentByte!9924 bs!62)) ((_ sign_extend 32) (currentBit!9919 bs!62))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 bs!62))) ((_ sign_extend 32) (currentByte!9924 bs!62)) ((_ sign_extend 32) (currentBit!9919 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!18217 () Bool)

(assert (= bs!18217 d!74539))

(assert (=> bs!18217 m!339625))

(assert (=> d!74439 d!74539))

(declare-fun d!74541 () Bool)

(assert (=> d!74541 (= (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 lt!348701))) ((_ sign_extend 32) (currentByte!9924 lt!348701)) ((_ sign_extend 32) (currentBit!9919 lt!348701))) (bvsub (bvmul ((_ sign_extend 32) (size!4741 (buf!5288 lt!348701))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9924 lt!348701)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9919 lt!348701)))))))

(assert (=> d!74413 d!74541))

(declare-fun d!74543 () Bool)

(assert (=> d!74543 (= (invariant!0 (currentBit!9919 lt!348701) (currentByte!9924 lt!348701) (size!4741 (buf!5288 lt!348701))) (and (bvsge (currentBit!9919 lt!348701) #b00000000000000000000000000000000) (bvslt (currentBit!9919 lt!348701) #b00000000000000000000000000001000) (bvsge (currentByte!9924 lt!348701) #b00000000000000000000000000000000) (or (bvslt (currentByte!9924 lt!348701) (size!4741 (buf!5288 lt!348701))) (and (= (currentBit!9919 lt!348701) #b00000000000000000000000000000000) (= (currentByte!9924 lt!348701) (size!4741 (buf!5288 lt!348701)))))))))

(assert (=> d!74413 d!74543))

(assert (=> d!74421 d!74459))

(assert (=> d!74421 d!74457))

(declare-fun d!74545 () Bool)

(assert (=> d!74545 (= (onesLSBLong!0 i!541) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!541))))))

(assert (=> b!221105 d!74545))

(declare-fun d!74547 () Bool)

(assert (=> d!74547 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))))))

(assert (=> b!221112 d!74547))

(declare-fun d!74549 () Bool)

(assert (=> d!74549 (= (onesLSBLong!0 nBits!265) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!265))))))

(assert (=> b!221101 d!74549))

(assert (=> b!221108 d!74549))

(assert (=> b!221039 d!74421))

(declare-fun d!74551 () Bool)

(declare-fun e!150182 () Bool)

(assert (=> d!74551 e!150182))

(declare-fun res!186284 () Bool)

(assert (=> d!74551 (=> (not res!186284) (not e!150182))))

(declare-fun lt!349156 () (_ BitVec 64))

(declare-fun lt!349159 () (_ BitVec 64))

(declare-fun lt!349158 () (_ BitVec 64))

(assert (=> d!74551 (= res!186284 (= lt!349158 (bvsub lt!349159 lt!349156)))))

(assert (=> d!74551 (or (= (bvand lt!349159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349156 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349159 lt!349156) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74551 (= lt!349156 (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10145 lt!348959)))) ((_ sign_extend 32) (currentByte!9924 (_2!10145 lt!348959))) ((_ sign_extend 32) (currentBit!9919 (_2!10145 lt!348959)))))))

(declare-fun lt!349157 () (_ BitVec 64))

(declare-fun lt!349155 () (_ BitVec 64))

(assert (=> d!74551 (= lt!349159 (bvmul lt!349157 lt!349155))))

(assert (=> d!74551 (or (= lt!349157 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349155 (bvsdiv (bvmul lt!349157 lt!349155) lt!349157)))))

(assert (=> d!74551 (= lt!349155 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74551 (= lt!349157 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10145 lt!348959)))))))

(assert (=> d!74551 (= lt!349158 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9924 (_2!10145 lt!348959))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9919 (_2!10145 lt!348959)))))))

(assert (=> d!74551 (invariant!0 (currentBit!9919 (_2!10145 lt!348959)) (currentByte!9924 (_2!10145 lt!348959)) (size!4741 (buf!5288 (_2!10145 lt!348959))))))

(assert (=> d!74551 (= (bitIndex!0 (size!4741 (buf!5288 (_2!10145 lt!348959))) (currentByte!9924 (_2!10145 lt!348959)) (currentBit!9919 (_2!10145 lt!348959))) lt!349158)))

(declare-fun b!221208 () Bool)

(declare-fun res!186285 () Bool)

(assert (=> b!221208 (=> (not res!186285) (not e!150182))))

(assert (=> b!221208 (= res!186285 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349158))))

(declare-fun b!221209 () Bool)

(declare-fun lt!349160 () (_ BitVec 64))

(assert (=> b!221209 (= e!150182 (bvsle lt!349158 (bvmul lt!349160 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221209 (or (= lt!349160 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349160 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349160)))))

(assert (=> b!221209 (= lt!349160 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10145 lt!348959)))))))

(assert (= (and d!74551 res!186284) b!221208))

(assert (= (and b!221208 res!186285) b!221209))

(declare-fun m!339935 () Bool)

(assert (=> d!74551 m!339935))

(declare-fun m!339937 () Bool)

(assert (=> d!74551 m!339937))

(assert (=> b!221102 d!74551))

(assert (=> b!221102 d!74421))

(declare-fun d!74553 () Bool)

(declare-fun e!150183 () Bool)

(assert (=> d!74553 e!150183))

(declare-fun res!186286 () Bool)

(assert (=> d!74553 (=> (not res!186286) (not e!150183))))

(declare-fun lt!349164 () (_ BitVec 64))

(declare-fun lt!349165 () (_ BitVec 64))

(declare-fun lt!349162 () (_ BitVec 64))

(assert (=> d!74553 (= res!186286 (= lt!349164 (bvsub lt!349165 lt!349162)))))

(assert (=> d!74553 (or (= (bvand lt!349165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349165 lt!349162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74553 (= lt!349162 (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10145 lt!348965)))) ((_ sign_extend 32) (currentByte!9924 (_2!10145 lt!348965))) ((_ sign_extend 32) (currentBit!9919 (_2!10145 lt!348965)))))))

(declare-fun lt!349163 () (_ BitVec 64))

(declare-fun lt!349161 () (_ BitVec 64))

(assert (=> d!74553 (= lt!349165 (bvmul lt!349163 lt!349161))))

(assert (=> d!74553 (or (= lt!349163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349161 (bvsdiv (bvmul lt!349163 lt!349161) lt!349163)))))

(assert (=> d!74553 (= lt!349161 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74553 (= lt!349163 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10145 lt!348965)))))))

(assert (=> d!74553 (= lt!349164 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9924 (_2!10145 lt!348965))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9919 (_2!10145 lt!348965)))))))

(assert (=> d!74553 (invariant!0 (currentBit!9919 (_2!10145 lt!348965)) (currentByte!9924 (_2!10145 lt!348965)) (size!4741 (buf!5288 (_2!10145 lt!348965))))))

(assert (=> d!74553 (= (bitIndex!0 (size!4741 (buf!5288 (_2!10145 lt!348965))) (currentByte!9924 (_2!10145 lt!348965)) (currentBit!9919 (_2!10145 lt!348965))) lt!349164)))

(declare-fun b!221210 () Bool)

(declare-fun res!186287 () Bool)

(assert (=> b!221210 (=> (not res!186287) (not e!150183))))

(assert (=> b!221210 (= res!186287 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349164))))

(declare-fun b!221211 () Bool)

(declare-fun lt!349166 () (_ BitVec 64))

(assert (=> b!221211 (= e!150183 (bvsle lt!349164 (bvmul lt!349166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221211 (or (= lt!349166 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349166 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349166)))))

(assert (=> b!221211 (= lt!349166 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10145 lt!348965)))))))

(assert (= (and d!74553 res!186286) b!221210))

(assert (= (and b!221210 res!186287) b!221211))

(declare-fun m!339939 () Bool)

(assert (=> d!74553 m!339939))

(declare-fun m!339941 () Bool)

(assert (=> d!74553 m!339941))

(assert (=> b!221109 d!74553))

(declare-fun d!74555 () Bool)

(declare-fun e!150184 () Bool)

(assert (=> d!74555 e!150184))

(declare-fun res!186288 () Bool)

(assert (=> d!74555 (=> (not res!186288) (not e!150184))))

(declare-fun lt!349170 () (_ BitVec 64))

(declare-fun lt!349168 () (_ BitVec 64))

(declare-fun lt!349171 () (_ BitVec 64))

(assert (=> d!74555 (= res!186288 (= lt!349170 (bvsub lt!349171 lt!349168)))))

(assert (=> d!74555 (or (= (bvand lt!349171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349171 lt!349168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74555 (= lt!349168 (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun lt!349169 () (_ BitVec 64))

(declare-fun lt!349167 () (_ BitVec 64))

(assert (=> d!74555 (= lt!349171 (bvmul lt!349169 lt!349167))))

(assert (=> d!74555 (or (= lt!349169 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349167 (bvsdiv (bvmul lt!349169 lt!349167) lt!349169)))))

(assert (=> d!74555 (= lt!349167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74555 (= lt!349169 ((_ sign_extend 32) (size!4741 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!74555 (= lt!349170 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!74555 (invariant!0 (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (size!4741 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!74555 (= (bitIndex!0 (size!4741 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9924 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!9919 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) lt!349170)))

(declare-fun b!221212 () Bool)

(declare-fun res!186289 () Bool)

(assert (=> b!221212 (=> (not res!186289) (not e!150184))))

(assert (=> b!221212 (= res!186289 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349170))))

(declare-fun b!221213 () Bool)

(declare-fun lt!349172 () (_ BitVec 64))

(assert (=> b!221213 (= e!150184 (bvsle lt!349170 (bvmul lt!349172 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221213 (or (= lt!349172 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349172 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349172)))))

(assert (=> b!221213 (= lt!349172 ((_ sign_extend 32) (size!4741 (buf!5288 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (= (and d!74555 res!186288) b!221212))

(assert (= (and b!221212 res!186289) b!221213))

(declare-fun m!339943 () Bool)

(assert (=> d!74555 m!339943))

(declare-fun m!339945 () Bool)

(assert (=> d!74555 m!339945))

(assert (=> b!221109 d!74555))

(declare-fun d!74557 () Bool)

(declare-fun e!150185 () Bool)

(assert (=> d!74557 e!150185))

(declare-fun res!186290 () Bool)

(assert (=> d!74557 (=> (not res!186290) (not e!150185))))

(declare-fun lt!349177 () (_ BitVec 64))

(declare-fun lt!349174 () (_ BitVec 64))

(declare-fun lt!349176 () (_ BitVec 64))

(assert (=> d!74557 (= res!186290 (= lt!349176 (bvsub lt!349177 lt!349174)))))

(assert (=> d!74557 (or (= (bvand lt!349177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349177 lt!349174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74557 (= lt!349174 (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10146 lt!348847)))) ((_ sign_extend 32) (currentByte!9924 (_2!10146 lt!348847))) ((_ sign_extend 32) (currentBit!9919 (_2!10146 lt!348847)))))))

(declare-fun lt!349175 () (_ BitVec 64))

(declare-fun lt!349173 () (_ BitVec 64))

(assert (=> d!74557 (= lt!349177 (bvmul lt!349175 lt!349173))))

(assert (=> d!74557 (or (= lt!349175 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349173 (bvsdiv (bvmul lt!349175 lt!349173) lt!349175)))))

(assert (=> d!74557 (= lt!349173 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74557 (= lt!349175 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10146 lt!348847)))))))

(assert (=> d!74557 (= lt!349176 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9924 (_2!10146 lt!348847))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9919 (_2!10146 lt!348847)))))))

(assert (=> d!74557 (invariant!0 (currentBit!9919 (_2!10146 lt!348847)) (currentByte!9924 (_2!10146 lt!348847)) (size!4741 (buf!5288 (_2!10146 lt!348847))))))

(assert (=> d!74557 (= (bitIndex!0 (size!4741 (buf!5288 (_2!10146 lt!348847))) (currentByte!9924 (_2!10146 lt!348847)) (currentBit!9919 (_2!10146 lt!348847))) lt!349176)))

(declare-fun b!221214 () Bool)

(declare-fun res!186291 () Bool)

(assert (=> b!221214 (=> (not res!186291) (not e!150185))))

(assert (=> b!221214 (= res!186291 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349176))))

(declare-fun b!221215 () Bool)

(declare-fun lt!349178 () (_ BitVec 64))

(assert (=> b!221215 (= e!150185 (bvsle lt!349176 (bvmul lt!349178 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221215 (or (= lt!349178 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349178 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349178)))))

(assert (=> b!221215 (= lt!349178 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10146 lt!348847)))))))

(assert (= (and d!74557 res!186290) b!221214))

(assert (= (and b!221214 res!186291) b!221215))

(declare-fun m!339947 () Bool)

(assert (=> d!74557 m!339947))

(declare-fun m!339949 () Bool)

(assert (=> d!74557 m!339949))

(assert (=> b!221028 d!74557))

(assert (=> b!221028 d!74421))

(declare-fun d!74559 () Bool)

(declare-fun e!150186 () Bool)

(assert (=> d!74559 e!150186))

(declare-fun res!186292 () Bool)

(assert (=> d!74559 (=> (not res!186292) (not e!150186))))

(declare-fun lt!349182 () (_ BitVec 64))

(declare-fun lt!349180 () (_ BitVec 64))

(declare-fun lt!349183 () (_ BitVec 64))

(assert (=> d!74559 (= res!186292 (= lt!349182 (bvsub lt!349183 lt!349180)))))

(assert (=> d!74559 (or (= (bvand lt!349183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349180 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349183 lt!349180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74559 (= lt!349180 (remainingBits!0 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10146 (increaseBitIndex!0 bs!62))))) ((_ sign_extend 32) (currentByte!9924 (_2!10146 (increaseBitIndex!0 bs!62)))) ((_ sign_extend 32) (currentBit!9919 (_2!10146 (increaseBitIndex!0 bs!62))))))))

(declare-fun lt!349181 () (_ BitVec 64))

(declare-fun lt!349179 () (_ BitVec 64))

(assert (=> d!74559 (= lt!349183 (bvmul lt!349181 lt!349179))))

(assert (=> d!74559 (or (= lt!349181 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349179 (bvsdiv (bvmul lt!349181 lt!349179) lt!349181)))))

(assert (=> d!74559 (= lt!349179 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74559 (= lt!349181 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10146 (increaseBitIndex!0 bs!62))))))))

(assert (=> d!74559 (= lt!349182 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9924 (_2!10146 (increaseBitIndex!0 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9919 (_2!10146 (increaseBitIndex!0 bs!62))))))))

(assert (=> d!74559 (invariant!0 (currentBit!9919 (_2!10146 (increaseBitIndex!0 bs!62))) (currentByte!9924 (_2!10146 (increaseBitIndex!0 bs!62))) (size!4741 (buf!5288 (_2!10146 (increaseBitIndex!0 bs!62)))))))

(assert (=> d!74559 (= (bitIndex!0 (size!4741 (buf!5288 (_2!10146 (increaseBitIndex!0 bs!62)))) (currentByte!9924 (_2!10146 (increaseBitIndex!0 bs!62))) (currentBit!9919 (_2!10146 (increaseBitIndex!0 bs!62)))) lt!349182)))

(declare-fun b!221216 () Bool)

(declare-fun res!186293 () Bool)

(assert (=> b!221216 (=> (not res!186293) (not e!150186))))

(assert (=> b!221216 (= res!186293 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349182))))

(declare-fun b!221217 () Bool)

(declare-fun lt!349184 () (_ BitVec 64))

(assert (=> b!221217 (= e!150186 (bvsle lt!349182 (bvmul lt!349184 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221217 (or (= lt!349184 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349184 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349184)))))

(assert (=> b!221217 (= lt!349184 ((_ sign_extend 32) (size!4741 (buf!5288 (_2!10146 (increaseBitIndex!0 bs!62))))))))

(assert (= (and d!74559 res!186292) b!221216))

(assert (= (and b!221216 res!186293) b!221217))

(declare-fun m!339951 () Bool)

(assert (=> d!74559 m!339951))

(declare-fun m!339953 () Bool)

(assert (=> d!74559 m!339953))

(assert (=> b!221054 d!74559))

(assert (=> b!221054 d!74537))

(assert (=> b!221054 d!74421))

(push 1)

(assert (not b!221195))

(assert (not d!74557))

(assert (not b!221200))

(assert (not d!74553))

(assert (not d!74559))

(assert (not b!221188))

(assert (not b!221191))

(assert (not b!221199))

(assert (not b!221206))

(assert (not d!74539))

(assert (not b!221187))

(assert (not b!221193))

(assert (not b!221192))

(assert (not d!74551))

(assert (not d!74533))

(assert (not b!221201))

(assert (not d!74529))

(assert (not b!221196))

(assert (not d!74537))

(assert (not d!74555))

(assert (not b!221194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

