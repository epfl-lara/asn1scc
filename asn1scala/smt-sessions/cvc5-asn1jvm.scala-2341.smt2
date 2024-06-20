; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59726 () Bool)

(assert start!59726)

(declare-fun res!227074 () Bool)

(declare-fun e!192631 () Bool)

(assert (=> start!59726 (=> (not res!227074) (not e!192631))))

(declare-datatypes ((array!15242 0))(
  ( (array!15243 (arr!7615 (Array (_ BitVec 32) (_ BitVec 8))) (size!6628 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12070 0))(
  ( (BitStream!12071 (buf!7096 array!15242) (currentByte!13100 (_ BitVec 32)) (currentBit!13095 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12070)

(assert (=> start!59726 (= res!227074 (not (= (size!6628 (buf!7096 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59726 e!192631))

(declare-fun e!192629 () Bool)

(declare-fun inv!12 (BitStream!12070) Bool)

(assert (=> start!59726 (and (inv!12 bs!71) e!192629)))

(declare-fun b!272746 () Bool)

(declare-fun lt!410580 () (_ BitVec 64))

(assert (=> b!272746 (= e!192631 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410580)))))

(declare-fun lt!410582 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272746 (= lt!410582 (bitIndex!0 (size!6628 (buf!7096 bs!71)) (currentByte!13100 bs!71) (currentBit!13095 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15242 array!15242 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272746 (arrayBitRangesEq!0 (buf!7096 bs!71) (buf!7096 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410580)))

(assert (=> b!272746 (= lt!410580 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6628 (buf!7096 bs!71)))))))

(declare-datatypes ((Unit!19235 0))(
  ( (Unit!19236) )
))
(declare-fun lt!410581 () Unit!19235)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15242) Unit!19235)

(assert (=> b!272746 (= lt!410581 (arrayBitEqImpliesRangesEqLemma!0 (buf!7096 bs!71)))))

(declare-fun b!272747 () Bool)

(declare-fun array_inv!6352 (array!15242) Bool)

(assert (=> b!272747 (= e!192629 (array_inv!6352 (buf!7096 bs!71)))))

(assert (= (and start!59726 res!227074) b!272746))

(assert (= start!59726 b!272747))

(declare-fun m!405633 () Bool)

(assert (=> start!59726 m!405633))

(declare-fun m!405635 () Bool)

(assert (=> b!272746 m!405635))

(declare-fun m!405637 () Bool)

(assert (=> b!272746 m!405637))

(declare-fun m!405639 () Bool)

(assert (=> b!272746 m!405639))

(declare-fun m!405641 () Bool)

(assert (=> b!272747 m!405641))

(push 1)

(assert (not b!272746))

(assert (not start!59726))

(assert (not b!272747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93300 () Bool)

(declare-fun e!192656 () Bool)

(assert (=> d!93300 e!192656))

(declare-fun res!227094 () Bool)

(assert (=> d!93300 (=> (not res!227094) (not e!192656))))

(declare-fun lt!410642 () (_ BitVec 64))

(declare-fun lt!410640 () (_ BitVec 64))

(declare-fun lt!410639 () (_ BitVec 64))

(assert (=> d!93300 (= res!227094 (= lt!410642 (bvsub lt!410639 lt!410640)))))

(assert (=> d!93300 (or (= (bvand lt!410639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410640 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410639 lt!410640) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93300 (= lt!410640 (remainingBits!0 ((_ sign_extend 32) (size!6628 (buf!7096 bs!71))) ((_ sign_extend 32) (currentByte!13100 bs!71)) ((_ sign_extend 32) (currentBit!13095 bs!71))))))

(declare-fun lt!410638 () (_ BitVec 64))

(declare-fun lt!410641 () (_ BitVec 64))

(assert (=> d!93300 (= lt!410639 (bvmul lt!410638 lt!410641))))

(assert (=> d!93300 (or (= lt!410638 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410641 (bvsdiv (bvmul lt!410638 lt!410641) lt!410638)))))

(assert (=> d!93300 (= lt!410641 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93300 (= lt!410638 ((_ sign_extend 32) (size!6628 (buf!7096 bs!71))))))

(assert (=> d!93300 (= lt!410642 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13100 bs!71)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13095 bs!71))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93300 (invariant!0 (currentBit!13095 bs!71) (currentByte!13100 bs!71) (size!6628 (buf!7096 bs!71)))))

(assert (=> d!93300 (= (bitIndex!0 (size!6628 (buf!7096 bs!71)) (currentByte!13100 bs!71) (currentBit!13095 bs!71)) lt!410642)))

(declare-fun b!272772 () Bool)

(declare-fun res!227093 () Bool)

(assert (=> b!272772 (=> (not res!227093) (not e!192656))))

(assert (=> b!272772 (= res!227093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410642))))

(declare-fun b!272773 () Bool)

(declare-fun lt!410637 () (_ BitVec 64))

(assert (=> b!272773 (= e!192656 (bvsle lt!410642 (bvmul lt!410637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272773 (or (= lt!410637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410637)))))

(assert (=> b!272773 (= lt!410637 ((_ sign_extend 32) (size!6628 (buf!7096 bs!71))))))

(assert (= (and d!93300 res!227094) b!272772))

(assert (= (and b!272772 res!227093) b!272773))

(declare-fun m!405663 () Bool)

(assert (=> d!93300 m!405663))

(declare-fun m!405665 () Bool)

(assert (=> d!93300 m!405665))

(assert (=> b!272746 d!93300))

(declare-fun b!272820 () Bool)

(declare-fun e!192696 () Bool)

(declare-fun e!192695 () Bool)

(assert (=> b!272820 (= e!192696 e!192695)))

(declare-fun c!12571 () Bool)

(declare-datatypes ((tuple4!488 0))(
  ( (tuple4!489 (_1!12227 (_ BitVec 32)) (_2!12227 (_ BitVec 32)) (_3!1024 (_ BitVec 32)) (_4!244 (_ BitVec 32))) )
))
(declare-fun lt!410675 () tuple4!488)

(assert (=> b!272820 (= c!12571 (= (_3!1024 lt!410675) (_4!244 lt!410675)))))

(declare-fun b!272821 () Bool)

(declare-fun res!227132 () Bool)

(declare-fun lt!410673 () (_ BitVec 32))

(assert (=> b!272821 (= res!227132 (= lt!410673 #b00000000000000000000000000000000))))

(declare-fun e!192699 () Bool)

(assert (=> b!272821 (=> res!227132 e!192699)))

(declare-fun e!192697 () Bool)

(assert (=> b!272821 (= e!192697 e!192699)))

(declare-fun b!272822 () Bool)

(declare-fun e!192698 () Bool)

(declare-fun arrayRangesEq!1137 (array!15242 array!15242 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272822 (= e!192698 (arrayRangesEq!1137 (buf!7096 bs!71) (buf!7096 bs!71) (_1!12227 lt!410675) (_2!12227 lt!410675)))))

(declare-fun b!272823 () Bool)

(declare-fun call!4386 () Bool)

(assert (=> b!272823 (= e!192695 call!4386)))

(declare-fun b!272824 () Bool)

(declare-fun e!192700 () Bool)

(assert (=> b!272824 (= e!192700 e!192696)))

(declare-fun res!227129 () Bool)

(assert (=> b!272824 (=> (not res!227129) (not e!192696))))

(assert (=> b!272824 (= res!227129 e!192698)))

(declare-fun res!227130 () Bool)

(assert (=> b!272824 (=> res!227130 e!192698)))

(assert (=> b!272824 (= res!227130 (bvsge (_1!12227 lt!410675) (_2!12227 lt!410675)))))

(assert (=> b!272824 (= lt!410673 ((_ extract 31 0) (bvsrem lt!410580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410674 () (_ BitVec 32))

(assert (=> b!272824 (= lt!410674 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!488)

(assert (=> b!272824 (= lt!410675 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410580))))

(declare-fun d!93306 () Bool)

(declare-fun res!227133 () Bool)

(assert (=> d!93306 (=> res!227133 e!192700)))

(assert (=> d!93306 (= res!227133 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410580))))

(assert (=> d!93306 (= (arrayBitRangesEq!0 (buf!7096 bs!71) (buf!7096 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410580) e!192700)))

(declare-fun b!272825 () Bool)

(assert (=> b!272825 (= e!192695 e!192697)))

(declare-fun res!227131 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272825 (= res!227131 (byteRangesEq!0 (select (arr!7615 (buf!7096 bs!71)) (_3!1024 lt!410675)) (select (arr!7615 (buf!7096 bs!71)) (_3!1024 lt!410675)) lt!410674 #b00000000000000000000000000001000))))

(assert (=> b!272825 (=> (not res!227131) (not e!192697))))

(declare-fun b!272826 () Bool)

(assert (=> b!272826 (= e!192699 call!4386)))

(declare-fun bm!4383 () Bool)

(assert (=> bm!4383 (= call!4386 (byteRangesEq!0 (ite c!12571 (select (arr!7615 (buf!7096 bs!71)) (_3!1024 lt!410675)) (select (arr!7615 (buf!7096 bs!71)) (_4!244 lt!410675))) (ite c!12571 (select (arr!7615 (buf!7096 bs!71)) (_3!1024 lt!410675)) (select (arr!7615 (buf!7096 bs!71)) (_4!244 lt!410675))) (ite c!12571 lt!410674 #b00000000000000000000000000000000) lt!410673))))

(assert (= (and d!93306 (not res!227133)) b!272824))

(assert (= (and b!272824 (not res!227130)) b!272822))

(assert (= (and b!272824 res!227129) b!272820))

(assert (= (and b!272820 c!12571) b!272823))

(assert (= (and b!272820 (not c!12571)) b!272825))

(assert (= (and b!272825 res!227131) b!272821))

(assert (= (and b!272821 (not res!227132)) b!272826))

(assert (= (or b!272823 b!272826) bm!4383))

(declare-fun m!405675 () Bool)

(assert (=> b!272822 m!405675))

(declare-fun m!405677 () Bool)

(assert (=> b!272824 m!405677))

(declare-fun m!405679 () Bool)

(assert (=> b!272825 m!405679))

(assert (=> b!272825 m!405679))

(assert (=> b!272825 m!405679))

(assert (=> b!272825 m!405679))

(declare-fun m!405683 () Bool)

(assert (=> b!272825 m!405683))

(assert (=> bm!4383 m!405679))

(declare-fun m!405685 () Bool)

(assert (=> bm!4383 m!405685))

(assert (=> bm!4383 m!405679))

(assert (=> bm!4383 m!405685))

(declare-fun m!405695 () Bool)

(assert (=> bm!4383 m!405695))

(assert (=> b!272746 d!93306))

(declare-fun d!93312 () Bool)

(declare-fun e!192719 () Bool)

(assert (=> d!93312 e!192719))

(declare-fun res!227150 () Bool)

(assert (=> d!93312 (=> (not res!227150) (not e!192719))))

(declare-fun lt!410700 () (_ BitVec 64))

(declare-fun lt!410702 () (_ BitVec 64))

(assert (=> d!93312 (= res!227150 (or (= lt!410700 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410702 (bvsdiv (bvmul lt!410700 lt!410702) lt!410700))))))

(assert (=> d!93312 (= lt!410702 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93312 (= lt!410700 ((_ sign_extend 32) (size!6628 (buf!7096 bs!71))))))

(declare-fun lt!410701 () Unit!19235)

(declare-fun choose!44 (array!15242) Unit!19235)

(assert (=> d!93312 (= lt!410701 (choose!44 (buf!7096 bs!71)))))

(assert (=> d!93312 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7096 bs!71)) lt!410701)))

(declare-fun b!272847 () Bool)

(assert (=> b!272847 (= e!192719 (arrayBitRangesEq!0 (buf!7096 bs!71) (buf!7096 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6628 (buf!7096 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93312 res!227150) b!272847))

(declare-fun m!405711 () Bool)

(assert (=> d!93312 m!405711))

(declare-fun m!405715 () Bool)

(assert (=> b!272847 m!405715))

(assert (=> b!272746 d!93312))

(declare-fun d!93318 () Bool)

(assert (=> d!93318 (= (inv!12 bs!71) (invariant!0 (currentBit!13095 bs!71) (currentByte!13100 bs!71) (size!6628 (buf!7096 bs!71))))))

(declare-fun bs!23533 () Bool)

(assert (= bs!23533 d!93318))

(assert (=> bs!23533 m!405665))

(assert (=> start!59726 d!93318))

(declare-fun d!93326 () Bool)

(assert (=> d!93326 (= (array_inv!6352 (buf!7096 bs!71)) (bvsge (size!6628 (buf!7096 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!272747 d!93326))

(push 1)

(assert (not d!93312))

(assert (not b!272824))

(assert (not b!272822))

(assert (not d!93300))

(assert (not d!93318))

(assert (not bm!4383))

(assert (not b!272847))

(assert (not b!272825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

