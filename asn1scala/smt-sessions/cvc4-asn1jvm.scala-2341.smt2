; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59730 () Bool)

(assert start!59730)

(declare-fun res!227080 () Bool)

(declare-fun e!192647 () Bool)

(assert (=> start!59730 (=> (not res!227080) (not e!192647))))

(declare-datatypes ((array!15246 0))(
  ( (array!15247 (arr!7617 (Array (_ BitVec 32) (_ BitVec 8))) (size!6630 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12074 0))(
  ( (BitStream!12075 (buf!7098 array!15246) (currentByte!13102 (_ BitVec 32)) (currentBit!13097 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12074)

(assert (=> start!59730 (= res!227080 (not (= (size!6630 (buf!7098 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59730 e!192647))

(declare-fun e!192648 () Bool)

(declare-fun inv!12 (BitStream!12074) Bool)

(assert (=> start!59730 (and (inv!12 bs!71) e!192648)))

(declare-fun b!272758 () Bool)

(declare-fun lt!410600 () (_ BitVec 64))

(assert (=> b!272758 (= e!192647 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410600)))))

(declare-fun lt!410599 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272758 (= lt!410599 (bitIndex!0 (size!6630 (buf!7098 bs!71)) (currentByte!13102 bs!71) (currentBit!13097 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15246 array!15246 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272758 (arrayBitRangesEq!0 (buf!7098 bs!71) (buf!7098 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410600)))

(assert (=> b!272758 (= lt!410600 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6630 (buf!7098 bs!71)))))))

(declare-datatypes ((Unit!19239 0))(
  ( (Unit!19240) )
))
(declare-fun lt!410598 () Unit!19239)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15246) Unit!19239)

(assert (=> b!272758 (= lt!410598 (arrayBitEqImpliesRangesEqLemma!0 (buf!7098 bs!71)))))

(declare-fun b!272759 () Bool)

(declare-fun array_inv!6354 (array!15246) Bool)

(assert (=> b!272759 (= e!192648 (array_inv!6354 (buf!7098 bs!71)))))

(assert (= (and start!59730 res!227080) b!272758))

(assert (= start!59730 b!272759))

(declare-fun m!405653 () Bool)

(assert (=> start!59730 m!405653))

(declare-fun m!405655 () Bool)

(assert (=> b!272758 m!405655))

(declare-fun m!405657 () Bool)

(assert (=> b!272758 m!405657))

(declare-fun m!405659 () Bool)

(assert (=> b!272758 m!405659))

(declare-fun m!405661 () Bool)

(assert (=> b!272759 m!405661))

(push 1)

(assert (not b!272758))

(assert (not start!59730))

(assert (not b!272759))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93302 () Bool)

(declare-fun e!192657 () Bool)

(assert (=> d!93302 e!192657))

(declare-fun res!227096 () Bool)

(assert (=> d!93302 (=> (not res!227096) (not e!192657))))

(declare-fun lt!410645 () (_ BitVec 64))

(declare-fun lt!410646 () (_ BitVec 64))

(declare-fun lt!410644 () (_ BitVec 64))

(assert (=> d!93302 (= res!227096 (= lt!410646 (bvsub lt!410645 lt!410644)))))

(assert (=> d!93302 (or (= (bvand lt!410645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410644 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410645 lt!410644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93302 (= lt!410644 (remainingBits!0 ((_ sign_extend 32) (size!6630 (buf!7098 bs!71))) ((_ sign_extend 32) (currentByte!13102 bs!71)) ((_ sign_extend 32) (currentBit!13097 bs!71))))))

(declare-fun lt!410647 () (_ BitVec 64))

(declare-fun lt!410648 () (_ BitVec 64))

(assert (=> d!93302 (= lt!410645 (bvmul lt!410647 lt!410648))))

(assert (=> d!93302 (or (= lt!410647 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410648 (bvsdiv (bvmul lt!410647 lt!410648) lt!410647)))))

(assert (=> d!93302 (= lt!410648 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93302 (= lt!410647 ((_ sign_extend 32) (size!6630 (buf!7098 bs!71))))))

(assert (=> d!93302 (= lt!410646 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13102 bs!71)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13097 bs!71))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93302 (invariant!0 (currentBit!13097 bs!71) (currentByte!13102 bs!71) (size!6630 (buf!7098 bs!71)))))

(assert (=> d!93302 (= (bitIndex!0 (size!6630 (buf!7098 bs!71)) (currentByte!13102 bs!71) (currentBit!13097 bs!71)) lt!410646)))

(declare-fun b!272774 () Bool)

(declare-fun res!227095 () Bool)

(assert (=> b!272774 (=> (not res!227095) (not e!192657))))

(assert (=> b!272774 (= res!227095 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410646))))

(declare-fun b!272775 () Bool)

(declare-fun lt!410643 () (_ BitVec 64))

(assert (=> b!272775 (= e!192657 (bvsle lt!410646 (bvmul lt!410643 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272775 (or (= lt!410643 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410643 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410643)))))

(assert (=> b!272775 (= lt!410643 ((_ sign_extend 32) (size!6630 (buf!7098 bs!71))))))

(assert (= (and d!93302 res!227096) b!272774))

(assert (= (and b!272774 res!227095) b!272775))

(declare-fun m!405667 () Bool)

(assert (=> d!93302 m!405667))

(declare-fun m!405669 () Bool)

(assert (=> d!93302 m!405669))

(assert (=> b!272758 d!93302))

(declare-fun b!272834 () Bool)

(declare-fun e!192710 () Bool)

(declare-fun call!4388 () Bool)

(assert (=> b!272834 (= e!192710 call!4388)))

(declare-datatypes ((tuple4!490 0))(
  ( (tuple4!491 (_1!12228 (_ BitVec 32)) (_2!12228 (_ BitVec 32)) (_3!1025 (_ BitVec 32)) (_4!245 (_ BitVec 32))) )
))
(declare-fun lt!410679 () tuple4!490)

(declare-fun bm!4385 () Bool)

(declare-fun lt!410681 () (_ BitVec 32))

(declare-fun lt!410680 () (_ BitVec 32))

(declare-fun c!12573 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4385 (= call!4388 (byteRangesEq!0 (ite c!12573 (select (arr!7617 (buf!7098 bs!71)) (_3!1025 lt!410679)) (select (arr!7617 (buf!7098 bs!71)) (_4!245 lt!410679))) (ite c!12573 (select (arr!7617 (buf!7098 bs!71)) (_3!1025 lt!410679)) (select (arr!7617 (buf!7098 bs!71)) (_4!245 lt!410679))) (ite c!12573 lt!410681 #b00000000000000000000000000000000) lt!410680))))

(declare-fun d!93308 () Bool)

(declare-fun res!227142 () Bool)

(declare-fun e!192707 () Bool)

(assert (=> d!93308 (=> res!227142 e!192707)))

(assert (=> d!93308 (= res!227142 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410600))))

(assert (=> d!93308 (= (arrayBitRangesEq!0 (buf!7098 bs!71) (buf!7098 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410600) e!192707)))

(declare-fun b!272835 () Bool)

(declare-fun e!192709 () Bool)

(assert (=> b!272835 (= e!192707 e!192709)))

(declare-fun res!227140 () Bool)

(assert (=> b!272835 (=> (not res!227140) (not e!192709))))

(declare-fun e!192708 () Bool)

(assert (=> b!272835 (= res!227140 e!192708)))

(declare-fun res!227139 () Bool)

(assert (=> b!272835 (=> res!227139 e!192708)))

(assert (=> b!272835 (= res!227139 (bvsge (_1!12228 lt!410679) (_2!12228 lt!410679)))))

(assert (=> b!272835 (= lt!410680 ((_ extract 31 0) (bvsrem lt!410600 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272835 (= lt!410681 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!490)

(assert (=> b!272835 (= lt!410679 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410600))))

(declare-fun b!272836 () Bool)

(declare-fun e!192711 () Bool)

(assert (=> b!272836 (= e!192710 e!192711)))

(declare-fun res!227143 () Bool)

(assert (=> b!272836 (= res!227143 (byteRangesEq!0 (select (arr!7617 (buf!7098 bs!71)) (_3!1025 lt!410679)) (select (arr!7617 (buf!7098 bs!71)) (_3!1025 lt!410679)) lt!410681 #b00000000000000000000000000001000))))

(assert (=> b!272836 (=> (not res!227143) (not e!192711))))

(declare-fun b!272837 () Bool)

(assert (=> b!272837 (= e!192709 e!192710)))

(assert (=> b!272837 (= c!12573 (= (_3!1025 lt!410679) (_4!245 lt!410679)))))

(declare-fun b!272838 () Bool)

(declare-fun e!192712 () Bool)

(assert (=> b!272838 (= e!192712 call!4388)))

(declare-fun b!272839 () Bool)

(declare-fun arrayRangesEq!1138 (array!15246 array!15246 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272839 (= e!192708 (arrayRangesEq!1138 (buf!7098 bs!71) (buf!7098 bs!71) (_1!12228 lt!410679) (_2!12228 lt!410679)))))

(declare-fun b!272840 () Bool)

(declare-fun res!227141 () Bool)

(assert (=> b!272840 (= res!227141 (= lt!410680 #b00000000000000000000000000000000))))

(assert (=> b!272840 (=> res!227141 e!192712)))

(assert (=> b!272840 (= e!192711 e!192712)))

(assert (= (and d!93308 (not res!227142)) b!272835))

(assert (= (and b!272835 (not res!227139)) b!272839))

(assert (= (and b!272835 res!227140) b!272837))

(assert (= (and b!272837 c!12573) b!272834))

(assert (= (and b!272837 (not c!12573)) b!272836))

(assert (= (and b!272836 res!227143) b!272840))

(assert (= (and b!272840 (not res!227141)) b!272838))

(assert (= (or b!272834 b!272838) bm!4385))

(declare-fun m!405697 () Bool)

(assert (=> bm!4385 m!405697))

(declare-fun m!405701 () Bool)

(assert (=> bm!4385 m!405701))

(assert (=> bm!4385 m!405701))

(declare-fun m!405703 () Bool)

(assert (=> bm!4385 m!405703))

(assert (=> bm!4385 m!405703))

(declare-fun m!405705 () Bool)

(assert (=> b!272835 m!405705))

(assert (=> b!272836 m!405703))

(assert (=> b!272836 m!405703))

(assert (=> b!272836 m!405703))

(assert (=> b!272836 m!405703))

(declare-fun m!405707 () Bool)

(assert (=> b!272836 m!405707))

(declare-fun m!405709 () Bool)

(assert (=> b!272839 m!405709))

(assert (=> b!272758 d!93308))

(declare-fun d!93316 () Bool)

(declare-fun e!192721 () Bool)

(assert (=> d!93316 e!192721))

(declare-fun res!227152 () Bool)

(assert (=> d!93316 (=> (not res!227152) (not e!192721))))

(declare-fun lt!410706 () (_ BitVec 64))

(declare-fun lt!410708 () (_ BitVec 64))

(assert (=> d!93316 (= res!227152 (or (= lt!410706 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410708 (bvsdiv (bvmul lt!410706 lt!410708) lt!410706))))))

(assert (=> d!93316 (= lt!410708 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93316 (= lt!410706 ((_ sign_extend 32) (size!6630 (buf!7098 bs!71))))))

(declare-fun lt!410707 () Unit!19239)

(declare-fun choose!44 (array!15246) Unit!19239)

(assert (=> d!93316 (= lt!410707 (choose!44 (buf!7098 bs!71)))))

(assert (=> d!93316 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7098 bs!71)) lt!410707)))

(declare-fun b!272849 () Bool)

(assert (=> b!272849 (= e!192721 (arrayBitRangesEq!0 (buf!7098 bs!71) (buf!7098 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6630 (buf!7098 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93316 res!227152) b!272849))

(declare-fun m!405719 () Bool)

(assert (=> d!93316 m!405719))

(declare-fun m!405721 () Bool)

(assert (=> b!272849 m!405721))

(assert (=> b!272758 d!93316))

(declare-fun d!93322 () Bool)

(assert (=> d!93322 (= (inv!12 bs!71) (invariant!0 (currentBit!13097 bs!71) (currentByte!13102 bs!71) (size!6630 (buf!7098 bs!71))))))

(declare-fun bs!23534 () Bool)

(assert (= bs!23534 d!93322))

(assert (=> bs!23534 m!405669))

(assert (=> start!59730 d!93322))

(declare-fun d!93328 () Bool)

(assert (=> d!93328 (= (array_inv!6354 (buf!7098 bs!71)) (bvsge (size!6630 (buf!7098 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!272759 d!93328))

(push 1)

(assert (not b!272839))

(assert (not bm!4385))

(assert (not d!93322))

(assert (not d!93316))

(assert (not b!272849))

(assert (not b!272836))

(assert (not b!272835))

(assert (not d!93302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

