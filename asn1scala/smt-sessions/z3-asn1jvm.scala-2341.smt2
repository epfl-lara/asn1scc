; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59728 () Bool)

(assert start!59728)

(declare-fun res!227077 () Bool)

(declare-fun e!192640 () Bool)

(assert (=> start!59728 (=> (not res!227077) (not e!192640))))

(declare-datatypes ((array!15244 0))(
  ( (array!15245 (arr!7616 (Array (_ BitVec 32) (_ BitVec 8))) (size!6629 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12072 0))(
  ( (BitStream!12073 (buf!7097 array!15244) (currentByte!13101 (_ BitVec 32)) (currentBit!13096 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12072)

(assert (=> start!59728 (= res!227077 (not (= (size!6629 (buf!7097 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59728 e!192640))

(declare-fun e!192638 () Bool)

(declare-fun inv!12 (BitStream!12072) Bool)

(assert (=> start!59728 (and (inv!12 bs!71) e!192638)))

(declare-fun b!272752 () Bool)

(declare-fun lt!410590 () (_ BitVec 64))

(assert (=> b!272752 (= e!192640 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410590)))))

(declare-fun lt!410589 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272752 (= lt!410589 (bitIndex!0 (size!6629 (buf!7097 bs!71)) (currentByte!13101 bs!71) (currentBit!13096 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15244 array!15244 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272752 (arrayBitRangesEq!0 (buf!7097 bs!71) (buf!7097 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410590)))

(assert (=> b!272752 (= lt!410590 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6629 (buf!7097 bs!71)))))))

(declare-datatypes ((Unit!19237 0))(
  ( (Unit!19238) )
))
(declare-fun lt!410591 () Unit!19237)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15244) Unit!19237)

(assert (=> b!272752 (= lt!410591 (arrayBitEqImpliesRangesEqLemma!0 (buf!7097 bs!71)))))

(declare-fun b!272753 () Bool)

(declare-fun array_inv!6353 (array!15244) Bool)

(assert (=> b!272753 (= e!192638 (array_inv!6353 (buf!7097 bs!71)))))

(assert (= (and start!59728 res!227077) b!272752))

(assert (= start!59728 b!272753))

(declare-fun m!405643 () Bool)

(assert (=> start!59728 m!405643))

(declare-fun m!405645 () Bool)

(assert (=> b!272752 m!405645))

(declare-fun m!405647 () Bool)

(assert (=> b!272752 m!405647))

(declare-fun m!405649 () Bool)

(assert (=> b!272752 m!405649))

(declare-fun m!405651 () Bool)

(assert (=> b!272753 m!405651))

(check-sat (not b!272752) (not b!272753) (not start!59728))
(check-sat)
(get-model)

(declare-fun d!93304 () Bool)

(declare-fun e!192658 () Bool)

(assert (=> d!93304 e!192658))

(declare-fun res!227098 () Bool)

(assert (=> d!93304 (=> (not res!227098) (not e!192658))))

(declare-fun lt!410650 () (_ BitVec 64))

(declare-fun lt!410651 () (_ BitVec 64))

(declare-fun lt!410654 () (_ BitVec 64))

(assert (=> d!93304 (= res!227098 (= lt!410651 (bvsub lt!410654 lt!410650)))))

(assert (=> d!93304 (or (= (bvand lt!410654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410650 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410654 lt!410650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93304 (= lt!410650 (remainingBits!0 ((_ sign_extend 32) (size!6629 (buf!7097 bs!71))) ((_ sign_extend 32) (currentByte!13101 bs!71)) ((_ sign_extend 32) (currentBit!13096 bs!71))))))

(declare-fun lt!410649 () (_ BitVec 64))

(declare-fun lt!410653 () (_ BitVec 64))

(assert (=> d!93304 (= lt!410654 (bvmul lt!410649 lt!410653))))

(assert (=> d!93304 (or (= lt!410649 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410653 (bvsdiv (bvmul lt!410649 lt!410653) lt!410649)))))

(assert (=> d!93304 (= lt!410653 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93304 (= lt!410649 ((_ sign_extend 32) (size!6629 (buf!7097 bs!71))))))

(assert (=> d!93304 (= lt!410651 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13101 bs!71)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13096 bs!71))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93304 (invariant!0 (currentBit!13096 bs!71) (currentByte!13101 bs!71) (size!6629 (buf!7097 bs!71)))))

(assert (=> d!93304 (= (bitIndex!0 (size!6629 (buf!7097 bs!71)) (currentByte!13101 bs!71) (currentBit!13096 bs!71)) lt!410651)))

(declare-fun b!272776 () Bool)

(declare-fun res!227097 () Bool)

(assert (=> b!272776 (=> (not res!227097) (not e!192658))))

(assert (=> b!272776 (= res!227097 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410651))))

(declare-fun b!272777 () Bool)

(declare-fun lt!410652 () (_ BitVec 64))

(assert (=> b!272777 (= e!192658 (bvsle lt!410651 (bvmul lt!410652 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272777 (or (= lt!410652 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410652 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410652)))))

(assert (=> b!272777 (= lt!410652 ((_ sign_extend 32) (size!6629 (buf!7097 bs!71))))))

(assert (= (and d!93304 res!227098) b!272776))

(assert (= (and b!272776 res!227097) b!272777))

(declare-fun m!405671 () Bool)

(assert (=> d!93304 m!405671))

(declare-fun m!405673 () Bool)

(assert (=> d!93304 m!405673))

(assert (=> b!272752 d!93304))

(declare-fun b!272827 () Bool)

(declare-fun lt!410676 () (_ BitVec 32))

(declare-datatypes ((tuple4!486 0))(
  ( (tuple4!487 (_1!12226 (_ BitVec 32)) (_2!12226 (_ BitVec 32)) (_3!1023 (_ BitVec 32)) (_4!243 (_ BitVec 32))) )
))
(declare-fun lt!410677 () tuple4!486)

(declare-fun e!192705 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272827 (= e!192705 (byteRangesEq!0 (select (arr!7616 (buf!7097 bs!71)) (_4!243 lt!410677)) (select (arr!7616 (buf!7097 bs!71)) (_4!243 lt!410677)) #b00000000000000000000000000000000 lt!410676))))

(declare-fun b!272828 () Bool)

(declare-fun e!192702 () Bool)

(declare-fun arrayRangesEq!1136 (array!15244 array!15244 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272828 (= e!192702 (arrayRangesEq!1136 (buf!7097 bs!71) (buf!7097 bs!71) (_1!12226 lt!410677) (_2!12226 lt!410677)))))

(declare-fun b!272829 () Bool)

(declare-fun e!192706 () Bool)

(declare-fun call!4387 () Bool)

(assert (=> b!272829 (= e!192706 call!4387)))

(declare-fun d!93310 () Bool)

(declare-fun res!227135 () Bool)

(declare-fun e!192701 () Bool)

(assert (=> d!93310 (=> res!227135 e!192701)))

(assert (=> d!93310 (= res!227135 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410590))))

(assert (=> d!93310 (= (arrayBitRangesEq!0 (buf!7097 bs!71) (buf!7097 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410590) e!192701)))

(declare-fun b!272830 () Bool)

(declare-fun e!192703 () Bool)

(assert (=> b!272830 (= e!192703 e!192706)))

(declare-fun c!12572 () Bool)

(assert (=> b!272830 (= c!12572 (= (_3!1023 lt!410677) (_4!243 lt!410677)))))

(declare-fun b!272831 () Bool)

(assert (=> b!272831 (= e!192701 e!192703)))

(declare-fun res!227138 () Bool)

(assert (=> b!272831 (=> (not res!227138) (not e!192703))))

(assert (=> b!272831 (= res!227138 e!192702)))

(declare-fun res!227136 () Bool)

(assert (=> b!272831 (=> res!227136 e!192702)))

(assert (=> b!272831 (= res!227136 (bvsge (_1!12226 lt!410677) (_2!12226 lt!410677)))))

(assert (=> b!272831 (= lt!410676 ((_ extract 31 0) (bvsrem lt!410590 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410678 () (_ BitVec 32))

(assert (=> b!272831 (= lt!410678 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!486)

(assert (=> b!272831 (= lt!410677 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410590))))

(declare-fun b!272832 () Bool)

(declare-fun res!227134 () Bool)

(assert (=> b!272832 (= res!227134 (= lt!410676 #b00000000000000000000000000000000))))

(assert (=> b!272832 (=> res!227134 e!192705)))

(declare-fun e!192704 () Bool)

(assert (=> b!272832 (= e!192704 e!192705)))

(declare-fun b!272833 () Bool)

(assert (=> b!272833 (= e!192706 e!192704)))

(declare-fun res!227137 () Bool)

(assert (=> b!272833 (= res!227137 call!4387)))

(assert (=> b!272833 (=> (not res!227137) (not e!192704))))

(declare-fun bm!4384 () Bool)

(assert (=> bm!4384 (= call!4387 (byteRangesEq!0 (select (arr!7616 (buf!7097 bs!71)) (_3!1023 lt!410677)) (select (arr!7616 (buf!7097 bs!71)) (_3!1023 lt!410677)) lt!410678 (ite c!12572 lt!410676 #b00000000000000000000000000001000)))))

(assert (= (and d!93310 (not res!227135)) b!272831))

(assert (= (and b!272831 (not res!227136)) b!272828))

(assert (= (and b!272831 res!227138) b!272830))

(assert (= (and b!272830 c!12572) b!272829))

(assert (= (and b!272830 (not c!12572)) b!272833))

(assert (= (and b!272833 res!227137) b!272832))

(assert (= (and b!272832 (not res!227134)) b!272827))

(assert (= (or b!272829 b!272833) bm!4384))

(declare-fun m!405681 () Bool)

(assert (=> b!272827 m!405681))

(assert (=> b!272827 m!405681))

(assert (=> b!272827 m!405681))

(assert (=> b!272827 m!405681))

(declare-fun m!405687 () Bool)

(assert (=> b!272827 m!405687))

(declare-fun m!405689 () Bool)

(assert (=> b!272828 m!405689))

(declare-fun m!405691 () Bool)

(assert (=> b!272831 m!405691))

(declare-fun m!405693 () Bool)

(assert (=> bm!4384 m!405693))

(assert (=> bm!4384 m!405693))

(assert (=> bm!4384 m!405693))

(assert (=> bm!4384 m!405693))

(declare-fun m!405699 () Bool)

(assert (=> bm!4384 m!405699))

(assert (=> b!272752 d!93310))

(declare-fun d!93314 () Bool)

(declare-fun e!192720 () Bool)

(assert (=> d!93314 e!192720))

(declare-fun res!227151 () Bool)

(assert (=> d!93314 (=> (not res!227151) (not e!192720))))

(declare-fun lt!410705 () (_ BitVec 64))

(declare-fun lt!410704 () (_ BitVec 64))

(assert (=> d!93314 (= res!227151 (or (= lt!410705 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410704 (bvsdiv (bvmul lt!410705 lt!410704) lt!410705))))))

(assert (=> d!93314 (= lt!410704 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93314 (= lt!410705 ((_ sign_extend 32) (size!6629 (buf!7097 bs!71))))))

(declare-fun lt!410703 () Unit!19237)

(declare-fun choose!44 (array!15244) Unit!19237)

(assert (=> d!93314 (= lt!410703 (choose!44 (buf!7097 bs!71)))))

(assert (=> d!93314 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7097 bs!71)) lt!410703)))

(declare-fun b!272848 () Bool)

(assert (=> b!272848 (= e!192720 (arrayBitRangesEq!0 (buf!7097 bs!71) (buf!7097 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6629 (buf!7097 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93314 res!227151) b!272848))

(declare-fun m!405713 () Bool)

(assert (=> d!93314 m!405713))

(declare-fun m!405717 () Bool)

(assert (=> b!272848 m!405717))

(assert (=> b!272752 d!93314))

(declare-fun d!93320 () Bool)

(assert (=> d!93320 (= (array_inv!6353 (buf!7097 bs!71)) (bvsge (size!6629 (buf!7097 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!272753 d!93320))

(declare-fun d!93324 () Bool)

(assert (=> d!93324 (= (inv!12 bs!71) (invariant!0 (currentBit!13096 bs!71) (currentByte!13101 bs!71) (size!6629 (buf!7097 bs!71))))))

(declare-fun bs!23535 () Bool)

(assert (= bs!23535 d!93324))

(assert (=> bs!23535 m!405673))

(assert (=> start!59728 d!93324))

(check-sat (not d!93304) (not bm!4384) (not d!93324) (not b!272831) (not b!272828) (not b!272827) (not d!93314) (not b!272848))
