; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38712 () Bool)

(assert start!38712)

(declare-fun b!174349 () Bool)

(declare-fun res!144402 () Bool)

(declare-fun e!121588 () Bool)

(assert (=> b!174349 (=> res!144402 e!121588)))

(declare-datatypes ((array!9387 0))(
  ( (array!9388 (arr!5072 (Array (_ BitVec 32) (_ BitVec 8))) (size!4142 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7392 0))(
  ( (BitStream!7393 (buf!4573 array!9387) (currentByte!8687 (_ BitVec 32)) (currentBit!8682 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7392)

(declare-datatypes ((Unit!12538 0))(
  ( (Unit!12539) )
))
(declare-datatypes ((tuple2!15046 0))(
  ( (tuple2!15047 (_1!8165 Unit!12538) (_2!8165 BitStream!7392)) )
))
(declare-fun lt!268745 () tuple2!15046)

(assert (=> b!174349 (= res!144402 (not (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 (_2!8165 lt!268745))))))))

(declare-fun b!174350 () Bool)

(declare-fun res!144401 () Bool)

(assert (=> b!174350 (=> res!144401 e!121588)))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174350 (= res!144401 (not (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!268745))) (currentByte!8687 (_2!8165 lt!268745)) (currentBit!8682 (_2!8165 lt!268745))) (bvadd (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) ((_ sign_extend 32) nBits!340)))))))

(declare-fun b!174351 () Bool)

(declare-fun e!121589 () Bool)

(assert (=> b!174351 (= e!121589 e!121588)))

(declare-fun res!144399 () Bool)

(assert (=> b!174351 (=> res!144399 e!121588)))

(assert (=> b!174351 (= res!144399 (not (= (size!4142 (buf!4573 (_2!8165 lt!268745))) (size!4142 (buf!4573 thiss!1187)))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7392 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15046)

(assert (=> b!174351 (= lt!268745 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!174352 () Bool)

(declare-fun res!144395 () Bool)

(assert (=> b!174352 (=> res!144395 e!121588)))

(declare-fun isPrefixOf!0 (BitStream!7392 BitStream!7392) Bool)

(assert (=> b!174352 (= res!144395 (not (isPrefixOf!0 thiss!1187 (_2!8165 lt!268745))))))

(declare-fun res!144400 () Bool)

(assert (=> start!38712 (=> (not res!144400) (not e!121589))))

(assert (=> start!38712 (= res!144400 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38712 e!121589))

(assert (=> start!38712 true))

(declare-fun e!121587 () Bool)

(declare-fun inv!12 (BitStream!7392) Bool)

(assert (=> start!38712 (and (inv!12 thiss!1187) e!121587)))

(declare-fun b!174353 () Bool)

(declare-fun e!121591 () Bool)

(declare-datatypes ((tuple2!15048 0))(
  ( (tuple2!15049 (_1!8166 BitStream!7392) (_2!8166 (_ BitVec 64))) )
))
(declare-fun lt!268742 () tuple2!15048)

(declare-datatypes ((tuple2!15050 0))(
  ( (tuple2!15051 (_1!8167 BitStream!7392) (_2!8167 BitStream!7392)) )
))
(declare-fun lt!268743 () tuple2!15050)

(assert (=> b!174353 (= e!121591 (not (= (_1!8166 lt!268742) (_2!8167 lt!268743))))))

(declare-fun b!174354 () Bool)

(assert (=> b!174354 (= e!121588 e!121591)))

(declare-fun res!144397 () Bool)

(assert (=> b!174354 (=> res!144397 e!121591)))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174354 (= res!144397 (not (= (_2!8166 lt!268742) (bvand v!186 (onesLSBLong!0 nBits!340)))))))

(declare-fun readNBitsLSBFirstPure!0 (BitStream!7392 (_ BitVec 32)) tuple2!15048)

(assert (=> b!174354 (= lt!268742 (readNBitsLSBFirstPure!0 (_1!8167 lt!268743) nBits!340))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174354 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!268744 () Unit!12538)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7392 array!9387 (_ BitVec 64)) Unit!12538)

(assert (=> b!174354 (= lt!268744 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4573 (_2!8165 lt!268745)) ((_ sign_extend 32) nBits!340)))))

(declare-fun reader!0 (BitStream!7392 BitStream!7392) tuple2!15050)

(assert (=> b!174354 (= lt!268743 (reader!0 thiss!1187 (_2!8165 lt!268745)))))

(declare-fun b!174355 () Bool)

(declare-fun res!144396 () Bool)

(assert (=> b!174355 (=> (not res!144396) (not e!121589))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174355 (= res!144396 (invariant!0 (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187) (size!4142 (buf!4573 thiss!1187))))))

(declare-fun b!174356 () Bool)

(declare-fun array_inv!3883 (array!9387) Bool)

(assert (=> b!174356 (= e!121587 (array_inv!3883 (buf!4573 thiss!1187)))))

(declare-fun b!174357 () Bool)

(declare-fun res!144398 () Bool)

(assert (=> b!174357 (=> (not res!144398) (not e!121589))))

(assert (=> b!174357 (= res!144398 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(assert (= (and start!38712 res!144400) b!174357))

(assert (= (and b!174357 res!144398) b!174355))

(assert (= (and b!174355 res!144396) b!174351))

(assert (= (and b!174351 (not res!144399)) b!174350))

(assert (= (and b!174350 (not res!144401)) b!174349))

(assert (= (and b!174349 (not res!144402)) b!174352))

(assert (= (and b!174352 (not res!144395)) b!174354))

(assert (= (and b!174354 (not res!144397)) b!174353))

(assert (= start!38712 b!174356))

(declare-fun m!273701 () Bool)

(assert (=> b!174354 m!273701))

(declare-fun m!273703 () Bool)

(assert (=> b!174354 m!273703))

(declare-fun m!273705 () Bool)

(assert (=> b!174354 m!273705))

(declare-fun m!273707 () Bool)

(assert (=> b!174354 m!273707))

(declare-fun m!273709 () Bool)

(assert (=> b!174354 m!273709))

(declare-fun m!273711 () Bool)

(assert (=> b!174355 m!273711))

(declare-fun m!273713 () Bool)

(assert (=> b!174350 m!273713))

(declare-fun m!273715 () Bool)

(assert (=> b!174350 m!273715))

(declare-fun m!273717 () Bool)

(assert (=> start!38712 m!273717))

(declare-fun m!273719 () Bool)

(assert (=> b!174352 m!273719))

(declare-fun m!273721 () Bool)

(assert (=> b!174357 m!273721))

(declare-fun m!273723 () Bool)

(assert (=> b!174356 m!273723))

(declare-fun m!273725 () Bool)

(assert (=> b!174351 m!273725))

(check-sat (not b!174351) (not b!174356) (not b!174354) (not b!174355) (not b!174352) (not b!174350) (not start!38712) (not b!174357))
(check-sat)
(get-model)

(declare-fun d!61395 () Bool)

(assert (=> d!61395 (= (onesLSBLong!0 nBits!340) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!340))))))

(assert (=> b!174354 d!61395))

(declare-fun d!61397 () Bool)

(assert (=> d!61397 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!268760 () Unit!12538)

(declare-fun choose!9 (BitStream!7392 array!9387 (_ BitVec 64) BitStream!7392) Unit!12538)

(assert (=> d!61397 (= lt!268760 (choose!9 thiss!1187 (buf!4573 (_2!8165 lt!268745)) ((_ sign_extend 32) nBits!340) (BitStream!7393 (buf!4573 (_2!8165 lt!268745)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(assert (=> d!61397 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4573 (_2!8165 lt!268745)) ((_ sign_extend 32) nBits!340)) lt!268760)))

(declare-fun bs!15303 () Bool)

(assert (= bs!15303 d!61397))

(assert (=> bs!15303 m!273703))

(declare-fun m!273753 () Bool)

(assert (=> bs!15303 m!273753))

(assert (=> b!174354 d!61397))

(declare-fun d!61399 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61399 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15304 () Bool)

(assert (= bs!15304 d!61399))

(declare-fun m!273755 () Bool)

(assert (=> bs!15304 m!273755))

(assert (=> b!174354 d!61399))

(declare-fun b!174395 () Bool)

(declare-fun e!121611 () Unit!12538)

(declare-fun lt!268813 () Unit!12538)

(assert (=> b!174395 (= e!121611 lt!268813)))

(declare-fun lt!268814 () (_ BitVec 64))

(assert (=> b!174395 (= lt!268814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!268808 () (_ BitVec 64))

(assert (=> b!174395 (= lt!268808 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9387 array!9387 (_ BitVec 64) (_ BitVec 64)) Unit!12538)

(assert (=> b!174395 (= lt!268813 (arrayBitRangesEqSymmetric!0 (buf!4573 thiss!1187) (buf!4573 (_2!8165 lt!268745)) lt!268814 lt!268808))))

(declare-fun arrayBitRangesEq!0 (array!9387 array!9387 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174395 (arrayBitRangesEq!0 (buf!4573 (_2!8165 lt!268745)) (buf!4573 thiss!1187) lt!268814 lt!268808)))

(declare-fun b!174396 () Bool)

(declare-fun res!144433 () Bool)

(declare-fun e!121612 () Bool)

(assert (=> b!174396 (=> (not res!144433) (not e!121612))))

(declare-fun lt!268805 () tuple2!15050)

(assert (=> b!174396 (= res!144433 (isPrefixOf!0 (_1!8167 lt!268805) thiss!1187))))

(declare-fun b!174397 () Bool)

(declare-fun lt!268807 () (_ BitVec 64))

(declare-fun lt!268815 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7392 (_ BitVec 64)) BitStream!7392)

(assert (=> b!174397 (= e!121612 (= (_1!8167 lt!268805) (withMovedBitIndex!0 (_2!8167 lt!268805) (bvsub lt!268807 lt!268815))))))

(assert (=> b!174397 (or (= (bvand lt!268807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268807 lt!268815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174397 (= lt!268815 (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!268745))) (currentByte!8687 (_2!8165 lt!268745)) (currentBit!8682 (_2!8165 lt!268745))))))

(assert (=> b!174397 (= lt!268807 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(declare-fun d!61401 () Bool)

(assert (=> d!61401 e!121612))

(declare-fun res!144435 () Bool)

(assert (=> d!61401 (=> (not res!144435) (not e!121612))))

(assert (=> d!61401 (= res!144435 (isPrefixOf!0 (_1!8167 lt!268805) (_2!8167 lt!268805)))))

(declare-fun lt!268818 () BitStream!7392)

(assert (=> d!61401 (= lt!268805 (tuple2!15051 lt!268818 (_2!8165 lt!268745)))))

(declare-fun lt!268806 () Unit!12538)

(declare-fun lt!268817 () Unit!12538)

(assert (=> d!61401 (= lt!268806 lt!268817)))

(assert (=> d!61401 (isPrefixOf!0 lt!268818 (_2!8165 lt!268745))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7392 BitStream!7392 BitStream!7392) Unit!12538)

(assert (=> d!61401 (= lt!268817 (lemmaIsPrefixTransitive!0 lt!268818 (_2!8165 lt!268745) (_2!8165 lt!268745)))))

(declare-fun lt!268809 () Unit!12538)

(declare-fun lt!268802 () Unit!12538)

(assert (=> d!61401 (= lt!268809 lt!268802)))

(assert (=> d!61401 (isPrefixOf!0 lt!268818 (_2!8165 lt!268745))))

(assert (=> d!61401 (= lt!268802 (lemmaIsPrefixTransitive!0 lt!268818 thiss!1187 (_2!8165 lt!268745)))))

(declare-fun lt!268810 () Unit!12538)

(assert (=> d!61401 (= lt!268810 e!121611)))

(declare-fun c!9171 () Bool)

(assert (=> d!61401 (= c!9171 (not (= (size!4142 (buf!4573 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!268811 () Unit!12538)

(declare-fun lt!268816 () Unit!12538)

(assert (=> d!61401 (= lt!268811 lt!268816)))

(assert (=> d!61401 (isPrefixOf!0 (_2!8165 lt!268745) (_2!8165 lt!268745))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7392) Unit!12538)

(assert (=> d!61401 (= lt!268816 (lemmaIsPrefixRefl!0 (_2!8165 lt!268745)))))

(declare-fun lt!268803 () Unit!12538)

(declare-fun lt!268812 () Unit!12538)

(assert (=> d!61401 (= lt!268803 lt!268812)))

(assert (=> d!61401 (= lt!268812 (lemmaIsPrefixRefl!0 (_2!8165 lt!268745)))))

(declare-fun lt!268820 () Unit!12538)

(declare-fun lt!268801 () Unit!12538)

(assert (=> d!61401 (= lt!268820 lt!268801)))

(assert (=> d!61401 (isPrefixOf!0 lt!268818 lt!268818)))

(assert (=> d!61401 (= lt!268801 (lemmaIsPrefixRefl!0 lt!268818))))

(declare-fun lt!268819 () Unit!12538)

(declare-fun lt!268804 () Unit!12538)

(assert (=> d!61401 (= lt!268819 lt!268804)))

(assert (=> d!61401 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61401 (= lt!268804 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61401 (= lt!268818 (BitStream!7393 (buf!4573 (_2!8165 lt!268745)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(assert (=> d!61401 (isPrefixOf!0 thiss!1187 (_2!8165 lt!268745))))

(assert (=> d!61401 (= (reader!0 thiss!1187 (_2!8165 lt!268745)) lt!268805)))

(declare-fun b!174398 () Bool)

(declare-fun Unit!12542 () Unit!12538)

(assert (=> b!174398 (= e!121611 Unit!12542)))

(declare-fun b!174399 () Bool)

(declare-fun res!144434 () Bool)

(assert (=> b!174399 (=> (not res!144434) (not e!121612))))

(assert (=> b!174399 (= res!144434 (isPrefixOf!0 (_2!8167 lt!268805) (_2!8165 lt!268745)))))

(assert (= (and d!61401 c!9171) b!174395))

(assert (= (and d!61401 (not c!9171)) b!174398))

(assert (= (and d!61401 res!144435) b!174396))

(assert (= (and b!174396 res!144433) b!174399))

(assert (= (and b!174399 res!144434) b!174397))

(declare-fun m!273757 () Bool)

(assert (=> b!174396 m!273757))

(declare-fun m!273759 () Bool)

(assert (=> b!174397 m!273759))

(assert (=> b!174397 m!273713))

(assert (=> b!174397 m!273715))

(declare-fun m!273761 () Bool)

(assert (=> d!61401 m!273761))

(declare-fun m!273763 () Bool)

(assert (=> d!61401 m!273763))

(declare-fun m!273765 () Bool)

(assert (=> d!61401 m!273765))

(assert (=> d!61401 m!273719))

(declare-fun m!273767 () Bool)

(assert (=> d!61401 m!273767))

(declare-fun m!273769 () Bool)

(assert (=> d!61401 m!273769))

(declare-fun m!273771 () Bool)

(assert (=> d!61401 m!273771))

(declare-fun m!273773 () Bool)

(assert (=> d!61401 m!273773))

(declare-fun m!273775 () Bool)

(assert (=> d!61401 m!273775))

(declare-fun m!273777 () Bool)

(assert (=> d!61401 m!273777))

(declare-fun m!273779 () Bool)

(assert (=> d!61401 m!273779))

(assert (=> b!174395 m!273715))

(declare-fun m!273781 () Bool)

(assert (=> b!174395 m!273781))

(declare-fun m!273783 () Bool)

(assert (=> b!174395 m!273783))

(declare-fun m!273785 () Bool)

(assert (=> b!174399 m!273785))

(assert (=> b!174354 d!61401))

(declare-fun d!61405 () Bool)

(declare-datatypes ((tuple2!15058 0))(
  ( (tuple2!15059 (_1!8171 (_ BitVec 64)) (_2!8171 BitStream!7392)) )
))
(declare-fun lt!268835 () tuple2!15058)

(declare-fun readNBitsLSBFirst!0 (BitStream!7392 (_ BitVec 32)) tuple2!15058)

(assert (=> d!61405 (= lt!268835 (readNBitsLSBFirst!0 (_1!8167 lt!268743) nBits!340))))

(assert (=> d!61405 (= (readNBitsLSBFirstPure!0 (_1!8167 lt!268743) nBits!340) (tuple2!15049 (_2!8171 lt!268835) (_1!8171 lt!268835)))))

(declare-fun bs!15305 () Bool)

(assert (= bs!15305 d!61405))

(declare-fun m!273787 () Bool)

(assert (=> bs!15305 m!273787))

(assert (=> b!174354 d!61405))

(declare-fun d!61407 () Bool)

(assert (=> d!61407 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187) (size!4142 (buf!4573 thiss!1187))))))

(declare-fun bs!15306 () Bool)

(assert (= bs!15306 d!61407))

(assert (=> bs!15306 m!273711))

(assert (=> start!38712 d!61407))

(declare-fun d!61409 () Bool)

(declare-fun e!121625 () Bool)

(assert (=> d!61409 e!121625))

(declare-fun res!144457 () Bool)

(assert (=> d!61409 (=> (not res!144457) (not e!121625))))

(declare-fun lt!268865 () (_ BitVec 64))

(declare-fun lt!268864 () (_ BitVec 64))

(declare-fun lt!268860 () (_ BitVec 64))

(assert (=> d!61409 (= res!144457 (= lt!268865 (bvsub lt!268860 lt!268864)))))

(assert (=> d!61409 (or (= (bvand lt!268860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268864 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268860 lt!268864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61409 (= lt!268864 (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!268745))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!268745)))))))

(declare-fun lt!268861 () (_ BitVec 64))

(declare-fun lt!268863 () (_ BitVec 64))

(assert (=> d!61409 (= lt!268860 (bvmul lt!268861 lt!268863))))

(assert (=> d!61409 (or (= lt!268861 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!268863 (bvsdiv (bvmul lt!268861 lt!268863) lt!268861)))))

(assert (=> d!61409 (= lt!268863 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61409 (= lt!268861 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))))))

(assert (=> d!61409 (= lt!268865 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!268745))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!268745)))))))

(assert (=> d!61409 (invariant!0 (currentBit!8682 (_2!8165 lt!268745)) (currentByte!8687 (_2!8165 lt!268745)) (size!4142 (buf!4573 (_2!8165 lt!268745))))))

(assert (=> d!61409 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!268745))) (currentByte!8687 (_2!8165 lt!268745)) (currentBit!8682 (_2!8165 lt!268745))) lt!268865)))

(declare-fun b!174421 () Bool)

(declare-fun res!144458 () Bool)

(assert (=> b!174421 (=> (not res!144458) (not e!121625))))

(assert (=> b!174421 (= res!144458 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268865))))

(declare-fun b!174422 () Bool)

(declare-fun lt!268862 () (_ BitVec 64))

(assert (=> b!174422 (= e!121625 (bvsle lt!268865 (bvmul lt!268862 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174422 (or (= lt!268862 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!268862 #b0000000000000000000000000000000000000000000000000000000000001000) lt!268862)))))

(assert (=> b!174422 (= lt!268862 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))))))

(assert (= (and d!61409 res!144457) b!174421))

(assert (= (and b!174421 res!144458) b!174422))

(declare-fun m!273797 () Bool)

(assert (=> d!61409 m!273797))

(declare-fun m!273799 () Bool)

(assert (=> d!61409 m!273799))

(assert (=> b!174350 d!61409))

(declare-fun d!61421 () Bool)

(declare-fun e!121626 () Bool)

(assert (=> d!61421 e!121626))

(declare-fun res!144459 () Bool)

(assert (=> d!61421 (=> (not res!144459) (not e!121626))))

(declare-fun lt!268872 () (_ BitVec 64))

(declare-fun lt!268873 () (_ BitVec 64))

(declare-fun lt!268868 () (_ BitVec 64))

(assert (=> d!61421 (= res!144459 (= lt!268873 (bvsub lt!268868 lt!268872)))))

(assert (=> d!61421 (or (= (bvand lt!268868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268872 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268868 lt!268872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61421 (= lt!268872 (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187))))))

(declare-fun lt!268869 () (_ BitVec 64))

(declare-fun lt!268871 () (_ BitVec 64))

(assert (=> d!61421 (= lt!268868 (bvmul lt!268869 lt!268871))))

(assert (=> d!61421 (or (= lt!268869 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!268871 (bvsdiv (bvmul lt!268869 lt!268871) lt!268869)))))

(assert (=> d!61421 (= lt!268871 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61421 (= lt!268869 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))))))

(assert (=> d!61421 (= lt!268873 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 thiss!1187))))))

(assert (=> d!61421 (invariant!0 (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187) (size!4142 (buf!4573 thiss!1187)))))

(assert (=> d!61421 (= (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) lt!268873)))

(declare-fun b!174423 () Bool)

(declare-fun res!144460 () Bool)

(assert (=> b!174423 (=> (not res!144460) (not e!121626))))

(assert (=> b!174423 (= res!144460 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268873))))

(declare-fun b!174424 () Bool)

(declare-fun lt!268870 () (_ BitVec 64))

(assert (=> b!174424 (= e!121626 (bvsle lt!268873 (bvmul lt!268870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174424 (or (= lt!268870 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!268870 #b0000000000000000000000000000000000000000000000000000000000001000) lt!268870)))))

(assert (=> b!174424 (= lt!268870 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))))))

(assert (= (and d!61421 res!144459) b!174423))

(assert (= (and b!174423 res!144460) b!174424))

(declare-fun m!273801 () Bool)

(assert (=> d!61421 m!273801))

(assert (=> d!61421 m!273711))

(assert (=> b!174350 d!61421))

(declare-fun d!61423 () Bool)

(assert (=> d!61423 (= (invariant!0 (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187) (size!4142 (buf!4573 thiss!1187))) (and (bvsge (currentBit!8682 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8682 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8687 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8687 thiss!1187) (size!4142 (buf!4573 thiss!1187))) (and (= (currentBit!8682 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8687 thiss!1187) (size!4142 (buf!4573 thiss!1187)))))))))

(assert (=> b!174355 d!61423))

(declare-fun d!61429 () Bool)

(assert (=> d!61429 (= (array_inv!3883 (buf!4573 thiss!1187)) (bvsge (size!4142 (buf!4573 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!174356 d!61429))

(declare-fun b!174487 () Bool)

(declare-fun e!121665 () Bool)

(declare-datatypes ((tuple2!15060 0))(
  ( (tuple2!15061 (_1!8172 BitStream!7392) (_2!8172 Bool)) )
))
(declare-fun lt!269153 () tuple2!15060)

(declare-fun lt!269116 () tuple2!15060)

(assert (=> b!174487 (= e!121665 (= (_2!8172 lt!269153) (_2!8172 lt!269116)))))

(declare-fun b!174488 () Bool)

(declare-fun e!121660 () Bool)

(declare-fun lt!269161 () (_ BitVec 64))

(assert (=> b!174488 (= e!121660 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269161))))

(declare-fun b!174489 () Bool)

(declare-fun lt!269166 () tuple2!15060)

(declare-fun lt!269155 () tuple2!15046)

(declare-fun readBitPure!0 (BitStream!7392) tuple2!15060)

(declare-fun readerFrom!0 (BitStream!7392 (_ BitVec 32) (_ BitVec 32)) BitStream!7392)

(assert (=> b!174489 (= lt!269166 (readBitPure!0 (readerFrom!0 (_2!8165 lt!269155) (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187))))))

(declare-fun res!144504 () Bool)

(declare-fun lt!269142 () Bool)

(assert (=> b!174489 (= res!144504 (and (= (_2!8172 lt!269166) lt!269142) (= (_1!8172 lt!269166) (_2!8165 lt!269155))))))

(declare-fun e!121657 () Bool)

(assert (=> b!174489 (=> (not res!144504) (not e!121657))))

(declare-fun e!121662 () Bool)

(assert (=> b!174489 (= e!121662 e!121657)))

(declare-fun b!174490 () Bool)

(declare-fun res!144513 () Bool)

(declare-fun e!121663 () Bool)

(assert (=> b!174490 (=> (not res!144513) (not e!121663))))

(declare-fun lt!269129 () tuple2!15046)

(assert (=> b!174490 (= res!144513 (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 (_2!8165 lt!269129)))))))

(declare-fun c!9182 () Bool)

(declare-fun bm!2885 () Bool)

(declare-fun call!2888 () Bool)

(assert (=> bm!2885 (= call!2888 (isPrefixOf!0 thiss!1187 (ite c!9182 thiss!1187 (_2!8165 lt!269155))))))

(declare-fun b!174491 () Bool)

(declare-fun res!144507 () Bool)

(assert (=> b!174491 (=> (not res!144507) (not e!121663))))

(declare-fun lt!269139 () (_ BitVec 64))

(declare-fun lt!269164 () (_ BitVec 64))

(assert (=> b!174491 (= res!144507 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269129))) (currentByte!8687 (_2!8165 lt!269129)) (currentBit!8682 (_2!8165 lt!269129))) (bvsub lt!269164 lt!269139)))))

(assert (=> b!174491 (or (= (bvand lt!269164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269139 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269164 lt!269139) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174491 (= lt!269139 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!269144 () (_ BitVec 64))

(declare-fun lt!269170 () (_ BitVec 64))

(assert (=> b!174491 (= lt!269164 (bvadd lt!269144 lt!269170))))

(assert (=> b!174491 (or (not (= (bvand lt!269144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269170 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269144 lt!269170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174491 (= lt!269170 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174491 (= lt!269144 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(declare-fun b!174492 () Bool)

(declare-fun e!121658 () (_ BitVec 64))

(assert (=> b!174492 (= e!121658 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!174493 () Bool)

(declare-fun res!144511 () Bool)

(assert (=> b!174493 (= res!144511 call!2888)))

(assert (=> b!174493 (=> (not res!144511) (not e!121662))))

(declare-fun d!61433 () Bool)

(assert (=> d!61433 e!121663))

(declare-fun res!144506 () Bool)

(assert (=> d!61433 (=> (not res!144506) (not e!121663))))

(assert (=> d!61433 (= res!144506 (invariant!0 (currentBit!8682 (_2!8165 lt!269129)) (currentByte!8687 (_2!8165 lt!269129)) (size!4142 (buf!4573 (_2!8165 lt!269129)))))))

(declare-fun e!121659 () tuple2!15046)

(assert (=> d!61433 (= lt!269129 e!121659)))

(assert (=> d!61433 (= c!9182 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61433 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61433 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!269129)))

(declare-fun b!174494 () Bool)

(assert (=> b!174494 (= e!121657 (= (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269166))) (currentByte!8687 (_1!8172 lt!269166)) (currentBit!8682 (_1!8172 lt!269166))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269155))) (currentByte!8687 (_2!8165 lt!269155)) (currentBit!8682 (_2!8165 lt!269155)))))))

(declare-fun b!174495 () Bool)

(declare-fun lt!269123 () tuple2!15046)

(assert (=> b!174495 (= e!121659 (tuple2!15047 (_1!8165 lt!269123) (_2!8165 lt!269123)))))

(assert (=> b!174495 (= lt!269142 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7392 Bool) tuple2!15046)

(assert (=> b!174495 (= lt!269155 (appendBit!0 thiss!1187 lt!269142))))

(declare-fun res!144508 () Bool)

(assert (=> b!174495 (= res!144508 (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 (_2!8165 lt!269155)))))))

(assert (=> b!174495 (=> (not res!144508) (not e!121662))))

(assert (=> b!174495 e!121662))

(declare-fun lt!269133 () tuple2!15046)

(assert (=> b!174495 (= lt!269133 lt!269155)))

(assert (=> b!174495 (= lt!269123 (appendBitsLSBFirstLoopTR!0 (_2!8165 lt!269133) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!269150 () Unit!12538)

(assert (=> b!174495 (= lt!269150 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8165 lt!269133) (_2!8165 lt!269123)))))

(assert (=> b!174495 (isPrefixOf!0 thiss!1187 (_2!8165 lt!269123))))

(declare-fun lt!269137 () Unit!12538)

(assert (=> b!174495 (= lt!269137 lt!269150)))

(assert (=> b!174495 (invariant!0 (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187) (size!4142 (buf!4573 (_2!8165 lt!269133))))))

(declare-fun lt!269169 () BitStream!7392)

(assert (=> b!174495 (= lt!269169 (BitStream!7393 (buf!4573 (_2!8165 lt!269133)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(assert (=> b!174495 (invariant!0 (currentBit!8682 lt!269169) (currentByte!8687 lt!269169) (size!4142 (buf!4573 (_2!8165 lt!269123))))))

(declare-fun lt!269154 () BitStream!7392)

(assert (=> b!174495 (= lt!269154 (BitStream!7393 (buf!4573 (_2!8165 lt!269123)) (currentByte!8687 lt!269169) (currentBit!8682 lt!269169)))))

(assert (=> b!174495 (= lt!269153 (readBitPure!0 lt!269169))))

(assert (=> b!174495 (= lt!269116 (readBitPure!0 lt!269154))))

(declare-fun lt!269160 () Unit!12538)

(declare-fun readBitPrefixLemma!0 (BitStream!7392 BitStream!7392) Unit!12538)

(assert (=> b!174495 (= lt!269160 (readBitPrefixLemma!0 lt!269169 (_2!8165 lt!269123)))))

(declare-fun res!144510 () Bool)

(assert (=> b!174495 (= res!144510 (= (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269153))) (currentByte!8687 (_1!8172 lt!269153)) (currentBit!8682 (_1!8172 lt!269153))) (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269116))) (currentByte!8687 (_1!8172 lt!269116)) (currentBit!8682 (_1!8172 lt!269116)))))))

(assert (=> b!174495 (=> (not res!144510) (not e!121665))))

(assert (=> b!174495 e!121665))

(declare-fun lt!269143 () Unit!12538)

(assert (=> b!174495 (= lt!269143 lt!269160)))

(declare-fun lt!269148 () tuple2!15050)

(assert (=> b!174495 (= lt!269148 (reader!0 thiss!1187 (_2!8165 lt!269123)))))

(declare-fun lt!269124 () tuple2!15050)

(assert (=> b!174495 (= lt!269124 (reader!0 (_2!8165 lt!269133) (_2!8165 lt!269123)))))

(declare-fun lt!269157 () tuple2!15060)

(assert (=> b!174495 (= lt!269157 (readBitPure!0 (_1!8167 lt!269148)))))

(assert (=> b!174495 (= (_2!8172 lt!269157) lt!269142)))

(declare-fun lt!269146 () Unit!12538)

(declare-fun Unit!12543 () Unit!12538)

(assert (=> b!174495 (= lt!269146 Unit!12543)))

(declare-fun lt!269119 () (_ BitVec 64))

(assert (=> b!174495 (= lt!269119 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!269132 () (_ BitVec 64))

(assert (=> b!174495 (= lt!269132 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!269134 () Unit!12538)

(assert (=> b!174495 (= lt!269134 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4573 (_2!8165 lt!269123)) lt!269132))))

(assert (=> b!174495 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269132)))

(declare-fun lt!269130 () Unit!12538)

(assert (=> b!174495 (= lt!269130 lt!269134)))

(declare-fun lt!269131 () tuple2!15048)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15048)

(assert (=> b!174495 (= lt!269131 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269148) nBits!340 #b00000000000000000000000000000000 lt!269119))))

(declare-fun lt!269127 () (_ BitVec 64))

(assert (=> b!174495 (= lt!269127 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!269128 () Unit!12538)

(assert (=> b!174495 (= lt!269128 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8165 lt!269133) (buf!4573 (_2!8165 lt!269123)) lt!269127))))

(assert (=> b!174495 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269133))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269133))) lt!269127)))

(declare-fun lt!269165 () Unit!12538)

(assert (=> b!174495 (= lt!269165 lt!269128)))

(declare-fun lt!269140 () tuple2!15048)

(assert (=> b!174495 (= lt!269140 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269124) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269119 (ite (_2!8172 lt!269157) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!269141 () tuple2!15048)

(assert (=> b!174495 (= lt!269141 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269148) nBits!340 #b00000000000000000000000000000000 lt!269119))))

(declare-fun c!9183 () Bool)

(assert (=> b!174495 (= c!9183 (_2!8172 (readBitPure!0 (_1!8167 lt!269148))))))

(declare-fun lt!269156 () tuple2!15048)

(assert (=> b!174495 (= lt!269156 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8167 lt!269148) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269119 e!121658)))))

(declare-fun lt!269117 () Unit!12538)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12538)

(assert (=> b!174495 (= lt!269117 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8167 lt!269148) nBits!340 #b00000000000000000000000000000000 lt!269119))))

(assert (=> b!174495 (and (= (_2!8166 lt!269141) (_2!8166 lt!269156)) (= (_1!8166 lt!269141) (_1!8166 lt!269156)))))

(declare-fun lt!269138 () Unit!12538)

(assert (=> b!174495 (= lt!269138 lt!269117)))

(assert (=> b!174495 (= (_1!8167 lt!269148) (withMovedBitIndex!0 (_2!8167 lt!269148) (bvsub (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))))))))

(declare-fun lt!269147 () Unit!12538)

(declare-fun Unit!12544 () Unit!12538)

(assert (=> b!174495 (= lt!269147 Unit!12544)))

(assert (=> b!174495 (= (_1!8167 lt!269124) (withMovedBitIndex!0 (_2!8167 lt!269124) (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))))))))

(declare-fun lt!269162 () Unit!12538)

(declare-fun Unit!12545 () Unit!12538)

(assert (=> b!174495 (= lt!269162 Unit!12545)))

(assert (=> b!174495 (= (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!269167 () Unit!12538)

(declare-fun Unit!12546 () Unit!12538)

(assert (=> b!174495 (= lt!269167 Unit!12546)))

(assert (=> b!174495 (= (_2!8166 lt!269131) (_2!8166 lt!269140))))

(declare-fun lt!269159 () Unit!12538)

(declare-fun Unit!12547 () Unit!12538)

(assert (=> b!174495 (= lt!269159 Unit!12547)))

(assert (=> b!174495 (invariant!0 (currentBit!8682 (_2!8165 lt!269123)) (currentByte!8687 (_2!8165 lt!269123)) (size!4142 (buf!4573 (_2!8165 lt!269123))))))

(declare-fun lt!269171 () Unit!12538)

(declare-fun Unit!12548 () Unit!12538)

(assert (=> b!174495 (= lt!269171 Unit!12548)))

(assert (=> b!174495 (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 (_2!8165 lt!269123))))))

(declare-fun lt!269136 () Unit!12538)

(declare-fun Unit!12549 () Unit!12538)

(assert (=> b!174495 (= lt!269136 Unit!12549)))

(assert (=> b!174495 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))) (bvsub (bvadd (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!269145 () Unit!12538)

(declare-fun Unit!12550 () Unit!12538)

(assert (=> b!174495 (= lt!269145 Unit!12550)))

(declare-fun lt!269120 () Unit!12538)

(declare-fun Unit!12551 () Unit!12538)

(assert (=> b!174495 (= lt!269120 Unit!12551)))

(declare-fun lt!269158 () tuple2!15050)

(assert (=> b!174495 (= lt!269158 (reader!0 thiss!1187 (_2!8165 lt!269123)))))

(declare-fun lt!269149 () (_ BitVec 64))

(assert (=> b!174495 (= lt!269149 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!269121 () Unit!12538)

(assert (=> b!174495 (= lt!269121 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4573 (_2!8165 lt!269123)) lt!269149))))

(assert (=> b!174495 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269149)))

(declare-fun lt!269122 () Unit!12538)

(assert (=> b!174495 (= lt!269122 lt!269121)))

(declare-fun lt!269151 () tuple2!15048)

(assert (=> b!174495 (= lt!269151 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269158) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!144503 () Bool)

(assert (=> b!174495 (= res!144503 (= (_2!8166 lt!269151) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun e!121661 () Bool)

(assert (=> b!174495 (=> (not res!144503) (not e!121661))))

(assert (=> b!174495 e!121661))

(declare-fun lt!269125 () Unit!12538)

(declare-fun Unit!12552 () Unit!12538)

(assert (=> b!174495 (= lt!269125 Unit!12552)))

(declare-fun b!174496 () Bool)

(declare-fun res!144512 () Bool)

(assert (=> b!174496 (= res!144512 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269155))) (currentByte!8687 (_2!8165 lt!269155)) (currentBit!8682 (_2!8165 lt!269155))) (bvadd (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!174496 (=> (not res!144512) (not e!121662))))

(declare-fun b!174497 () Bool)

(declare-fun e!121664 () Bool)

(declare-fun lt!269152 () tuple2!15048)

(declare-fun lt!269163 () tuple2!15050)

(assert (=> b!174497 (= e!121664 (= (_1!8166 lt!269152) (_2!8167 lt!269163)))))

(declare-fun b!174498 () Bool)

(declare-fun res!144509 () Bool)

(assert (=> b!174498 (=> (not res!144509) (not e!121663))))

(assert (=> b!174498 (= res!144509 (isPrefixOf!0 thiss!1187 (_2!8165 lt!269129)))))

(declare-fun b!174499 () Bool)

(declare-fun Unit!12553 () Unit!12538)

(assert (=> b!174499 (= e!121659 (tuple2!15047 Unit!12553 thiss!1187))))

(declare-fun lt!269168 () Unit!12538)

(assert (=> b!174499 (= lt!269168 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!174499 call!2888))

(declare-fun lt!269126 () Unit!12538)

(assert (=> b!174499 (= lt!269126 lt!269168)))

(declare-fun b!174500 () Bool)

(assert (=> b!174500 (= e!121661 (= (_1!8166 lt!269151) (_2!8167 lt!269158)))))

(declare-fun b!174501 () Bool)

(assert (=> b!174501 (= e!121663 e!121664)))

(declare-fun res!144514 () Bool)

(assert (=> b!174501 (=> (not res!144514) (not e!121664))))

(assert (=> b!174501 (= res!144514 (= (_2!8166 lt!269152) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!174501 (= lt!269152 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269163) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!269135 () Unit!12538)

(declare-fun lt!269118 () Unit!12538)

(assert (=> b!174501 (= lt!269135 lt!269118)))

(assert (=> b!174501 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269129)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269161)))

(assert (=> b!174501 (= lt!269118 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4573 (_2!8165 lt!269129)) lt!269161))))

(assert (=> b!174501 e!121660))

(declare-fun res!144505 () Bool)

(assert (=> b!174501 (=> (not res!144505) (not e!121660))))

(assert (=> b!174501 (= res!144505 (and (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 (_2!8165 lt!269129)))) (bvsge lt!269161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174501 (= lt!269161 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!174501 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!174501 (= lt!269163 (reader!0 thiss!1187 (_2!8165 lt!269129)))))

(declare-fun b!174502 () Bool)

(assert (=> b!174502 (= e!121658 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!61433 c!9182) b!174499))

(assert (= (and d!61433 (not c!9182)) b!174495))

(assert (= (and b!174495 res!144508) b!174496))

(assert (= (and b!174496 res!144512) b!174493))

(assert (= (and b!174493 res!144511) b!174489))

(assert (= (and b!174489 res!144504) b!174494))

(assert (= (and b!174495 res!144510) b!174487))

(assert (= (and b!174495 c!9183) b!174492))

(assert (= (and b!174495 (not c!9183)) b!174502))

(assert (= (and b!174495 res!144503) b!174500))

(assert (= (or b!174499 b!174493) bm!2885))

(assert (= (and d!61433 res!144506) b!174490))

(assert (= (and b!174490 res!144513) b!174491))

(assert (= (and b!174491 res!144507) b!174498))

(assert (= (and b!174498 res!144509) b!174501))

(assert (= (and b!174501 res!144505) b!174488))

(assert (= (and b!174501 res!144514) b!174497))

(declare-fun m!273875 () Bool)

(assert (=> d!61433 m!273875))

(declare-fun m!273877 () Bool)

(assert (=> b!174489 m!273877))

(assert (=> b!174489 m!273877))

(declare-fun m!273879 () Bool)

(assert (=> b!174489 m!273879))

(declare-fun m!273881 () Bool)

(assert (=> b!174496 m!273881))

(assert (=> b!174496 m!273715))

(declare-fun m!273883 () Bool)

(assert (=> b!174495 m!273883))

(declare-fun m!273885 () Bool)

(assert (=> b!174495 m!273885))

(declare-fun m!273887 () Bool)

(assert (=> b!174495 m!273887))

(declare-fun m!273889 () Bool)

(assert (=> b!174495 m!273889))

(declare-fun m!273891 () Bool)

(assert (=> b!174495 m!273891))

(declare-fun m!273893 () Bool)

(assert (=> b!174495 m!273893))

(declare-fun m!273895 () Bool)

(assert (=> b!174495 m!273895))

(declare-fun m!273897 () Bool)

(assert (=> b!174495 m!273897))

(declare-fun m!273899 () Bool)

(assert (=> b!174495 m!273899))

(assert (=> b!174495 m!273883))

(declare-fun m!273901 () Bool)

(assert (=> b!174495 m!273901))

(assert (=> b!174495 m!273715))

(declare-fun m!273903 () Bool)

(assert (=> b!174495 m!273903))

(declare-fun m!273905 () Bool)

(assert (=> b!174495 m!273905))

(declare-fun m!273907 () Bool)

(assert (=> b!174495 m!273907))

(declare-fun m!273909 () Bool)

(assert (=> b!174495 m!273909))

(declare-fun m!273911 () Bool)

(assert (=> b!174495 m!273911))

(declare-fun m!273913 () Bool)

(assert (=> b!174495 m!273913))

(declare-fun m!273915 () Bool)

(assert (=> b!174495 m!273915))

(declare-fun m!273917 () Bool)

(assert (=> b!174495 m!273917))

(declare-fun m!273919 () Bool)

(assert (=> b!174495 m!273919))

(declare-fun m!273921 () Bool)

(assert (=> b!174495 m!273921))

(declare-fun m!273923 () Bool)

(assert (=> b!174495 m!273923))

(declare-fun m!273925 () Bool)

(assert (=> b!174495 m!273925))

(declare-fun m!273927 () Bool)

(assert (=> b!174495 m!273927))

(assert (=> b!174495 m!273701))

(declare-fun m!273929 () Bool)

(assert (=> b!174495 m!273929))

(declare-fun m!273931 () Bool)

(assert (=> b!174495 m!273931))

(declare-fun m!273933 () Bool)

(assert (=> b!174495 m!273933))

(declare-fun m!273935 () Bool)

(assert (=> b!174495 m!273935))

(declare-fun m!273937 () Bool)

(assert (=> b!174495 m!273937))

(declare-fun m!273939 () Bool)

(assert (=> b!174495 m!273939))

(declare-fun m!273941 () Bool)

(assert (=> b!174495 m!273941))

(declare-fun m!273943 () Bool)

(assert (=> b!174495 m!273943))

(declare-fun m!273945 () Bool)

(assert (=> b!174495 m!273945))

(assert (=> b!174499 m!273765))

(declare-fun m!273947 () Bool)

(assert (=> b!174488 m!273947))

(declare-fun m!273949 () Bool)

(assert (=> b!174501 m!273949))

(assert (=> b!174501 m!273701))

(assert (=> b!174501 m!273931))

(declare-fun m!273951 () Bool)

(assert (=> b!174501 m!273951))

(declare-fun m!273953 () Bool)

(assert (=> b!174501 m!273953))

(declare-fun m!273955 () Bool)

(assert (=> b!174501 m!273955))

(declare-fun m!273957 () Bool)

(assert (=> b!174491 m!273957))

(assert (=> b!174491 m!273715))

(declare-fun m!273959 () Bool)

(assert (=> b!174498 m!273959))

(declare-fun m!273961 () Bool)

(assert (=> b!174494 m!273961))

(assert (=> b!174494 m!273881))

(declare-fun m!273963 () Bool)

(assert (=> bm!2885 m!273963))

(assert (=> b!174351 d!61433))

(declare-fun d!61455 () Bool)

(declare-fun res!144521 () Bool)

(declare-fun e!121671 () Bool)

(assert (=> d!61455 (=> (not res!144521) (not e!121671))))

(assert (=> d!61455 (= res!144521 (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 (_2!8165 lt!268745)))))))

(assert (=> d!61455 (= (isPrefixOf!0 thiss!1187 (_2!8165 lt!268745)) e!121671)))

(declare-fun b!174511 () Bool)

(declare-fun res!144522 () Bool)

(assert (=> b!174511 (=> (not res!144522) (not e!121671))))

(assert (=> b!174511 (= res!144522 (bvsle (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!268745))) (currentByte!8687 (_2!8165 lt!268745)) (currentBit!8682 (_2!8165 lt!268745)))))))

(declare-fun b!174512 () Bool)

(declare-fun e!121670 () Bool)

(assert (=> b!174512 (= e!121671 e!121670)))

(declare-fun res!144523 () Bool)

(assert (=> b!174512 (=> res!144523 e!121670)))

(assert (=> b!174512 (= res!144523 (= (size!4142 (buf!4573 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174513 () Bool)

(assert (=> b!174513 (= e!121670 (arrayBitRangesEq!0 (buf!4573 thiss!1187) (buf!4573 (_2!8165 lt!268745)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(assert (= (and d!61455 res!144521) b!174511))

(assert (= (and b!174511 res!144522) b!174512))

(assert (= (and b!174512 (not res!144523)) b!174513))

(assert (=> b!174511 m!273715))

(assert (=> b!174511 m!273713))

(assert (=> b!174513 m!273715))

(assert (=> b!174513 m!273715))

(declare-fun m!273965 () Bool)

(assert (=> b!174513 m!273965))

(assert (=> b!174352 d!61455))

(declare-fun d!61457 () Bool)

(assert (=> d!61457 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15315 () Bool)

(assert (= bs!15315 d!61457))

(assert (=> bs!15315 m!273801))

(assert (=> b!174357 d!61457))

(check-sat (not b!174396) (not d!61397) (not b!174498) (not b!174513) (not d!61401) (not b!174495) (not d!61407) (not b!174489) (not b!174511) (not b!174499) (not bm!2885) (not b!174494) (not b!174488) (not b!174496) (not d!61409) (not d!61421) (not d!61405) (not d!61457) (not b!174399) (not b!174397) (not b!174501) (not d!61399) (not b!174491) (not b!174395) (not d!61433))
(check-sat)
(get-model)

(declare-fun b!174756 () Bool)

(declare-fun e!121823 () Unit!12538)

(declare-fun lt!269810 () Unit!12538)

(assert (=> b!174756 (= e!121823 lt!269810)))

(declare-fun lt!269811 () (_ BitVec 64))

(assert (=> b!174756 (= lt!269811 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!269805 () (_ BitVec 64))

(assert (=> b!174756 (= lt!269805 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(assert (=> b!174756 (= lt!269810 (arrayBitRangesEqSymmetric!0 (buf!4573 thiss!1187) (buf!4573 (_2!8165 lt!269123)) lt!269811 lt!269805))))

(assert (=> b!174756 (arrayBitRangesEq!0 (buf!4573 (_2!8165 lt!269123)) (buf!4573 thiss!1187) lt!269811 lt!269805)))

(declare-fun b!174757 () Bool)

(declare-fun res!144726 () Bool)

(declare-fun e!121824 () Bool)

(assert (=> b!174757 (=> (not res!144726) (not e!121824))))

(declare-fun lt!269802 () tuple2!15050)

(assert (=> b!174757 (= res!144726 (isPrefixOf!0 (_1!8167 lt!269802) thiss!1187))))

(declare-fun lt!269812 () (_ BitVec 64))

(declare-fun b!174758 () Bool)

(declare-fun lt!269804 () (_ BitVec 64))

(assert (=> b!174758 (= e!121824 (= (_1!8167 lt!269802) (withMovedBitIndex!0 (_2!8167 lt!269802) (bvsub lt!269804 lt!269812))))))

(assert (=> b!174758 (or (= (bvand lt!269804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269812 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269804 lt!269812) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174758 (= lt!269812 (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))))))

(assert (=> b!174758 (= lt!269804 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(declare-fun d!61607 () Bool)

(assert (=> d!61607 e!121824))

(declare-fun res!144728 () Bool)

(assert (=> d!61607 (=> (not res!144728) (not e!121824))))

(assert (=> d!61607 (= res!144728 (isPrefixOf!0 (_1!8167 lt!269802) (_2!8167 lt!269802)))))

(declare-fun lt!269815 () BitStream!7392)

(assert (=> d!61607 (= lt!269802 (tuple2!15051 lt!269815 (_2!8165 lt!269123)))))

(declare-fun lt!269803 () Unit!12538)

(declare-fun lt!269814 () Unit!12538)

(assert (=> d!61607 (= lt!269803 lt!269814)))

(assert (=> d!61607 (isPrefixOf!0 lt!269815 (_2!8165 lt!269123))))

(assert (=> d!61607 (= lt!269814 (lemmaIsPrefixTransitive!0 lt!269815 (_2!8165 lt!269123) (_2!8165 lt!269123)))))

(declare-fun lt!269806 () Unit!12538)

(declare-fun lt!269799 () Unit!12538)

(assert (=> d!61607 (= lt!269806 lt!269799)))

(assert (=> d!61607 (isPrefixOf!0 lt!269815 (_2!8165 lt!269123))))

(assert (=> d!61607 (= lt!269799 (lemmaIsPrefixTransitive!0 lt!269815 thiss!1187 (_2!8165 lt!269123)))))

(declare-fun lt!269807 () Unit!12538)

(assert (=> d!61607 (= lt!269807 e!121823)))

(declare-fun c!9205 () Bool)

(assert (=> d!61607 (= c!9205 (not (= (size!4142 (buf!4573 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!269808 () Unit!12538)

(declare-fun lt!269813 () Unit!12538)

(assert (=> d!61607 (= lt!269808 lt!269813)))

(assert (=> d!61607 (isPrefixOf!0 (_2!8165 lt!269123) (_2!8165 lt!269123))))

(assert (=> d!61607 (= lt!269813 (lemmaIsPrefixRefl!0 (_2!8165 lt!269123)))))

(declare-fun lt!269800 () Unit!12538)

(declare-fun lt!269809 () Unit!12538)

(assert (=> d!61607 (= lt!269800 lt!269809)))

(assert (=> d!61607 (= lt!269809 (lemmaIsPrefixRefl!0 (_2!8165 lt!269123)))))

(declare-fun lt!269817 () Unit!12538)

(declare-fun lt!269798 () Unit!12538)

(assert (=> d!61607 (= lt!269817 lt!269798)))

(assert (=> d!61607 (isPrefixOf!0 lt!269815 lt!269815)))

(assert (=> d!61607 (= lt!269798 (lemmaIsPrefixRefl!0 lt!269815))))

(declare-fun lt!269816 () Unit!12538)

(declare-fun lt!269801 () Unit!12538)

(assert (=> d!61607 (= lt!269816 lt!269801)))

(assert (=> d!61607 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61607 (= lt!269801 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61607 (= lt!269815 (BitStream!7393 (buf!4573 (_2!8165 lt!269123)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(assert (=> d!61607 (isPrefixOf!0 thiss!1187 (_2!8165 lt!269123))))

(assert (=> d!61607 (= (reader!0 thiss!1187 (_2!8165 lt!269123)) lt!269802)))

(declare-fun b!174759 () Bool)

(declare-fun Unit!12592 () Unit!12538)

(assert (=> b!174759 (= e!121823 Unit!12592)))

(declare-fun b!174760 () Bool)

(declare-fun res!144727 () Bool)

(assert (=> b!174760 (=> (not res!144727) (not e!121824))))

(assert (=> b!174760 (= res!144727 (isPrefixOf!0 (_2!8167 lt!269802) (_2!8165 lt!269123)))))

(assert (= (and d!61607 c!9205) b!174756))

(assert (= (and d!61607 (not c!9205)) b!174759))

(assert (= (and d!61607 res!144728) b!174757))

(assert (= (and b!174757 res!144726) b!174760))

(assert (= (and b!174760 res!144727) b!174758))

(declare-fun m!274523 () Bool)

(assert (=> b!174757 m!274523))

(declare-fun m!274525 () Bool)

(assert (=> b!174758 m!274525))

(assert (=> b!174758 m!273937))

(assert (=> b!174758 m!273715))

(declare-fun m!274527 () Bool)

(assert (=> d!61607 m!274527))

(declare-fun m!274529 () Bool)

(assert (=> d!61607 m!274529))

(assert (=> d!61607 m!273765))

(assert (=> d!61607 m!273895))

(declare-fun m!274531 () Bool)

(assert (=> d!61607 m!274531))

(declare-fun m!274533 () Bool)

(assert (=> d!61607 m!274533))

(declare-fun m!274535 () Bool)

(assert (=> d!61607 m!274535))

(declare-fun m!274537 () Bool)

(assert (=> d!61607 m!274537))

(assert (=> d!61607 m!273775))

(declare-fun m!274539 () Bool)

(assert (=> d!61607 m!274539))

(declare-fun m!274541 () Bool)

(assert (=> d!61607 m!274541))

(assert (=> b!174756 m!273715))

(declare-fun m!274543 () Bool)

(assert (=> b!174756 m!274543))

(declare-fun m!274545 () Bool)

(assert (=> b!174756 m!274545))

(declare-fun m!274547 () Bool)

(assert (=> b!174760 m!274547))

(assert (=> b!174495 d!61607))

(declare-fun d!61609 () Bool)

(assert (=> d!61609 (= (invariant!0 (currentBit!8682 lt!269169) (currentByte!8687 lt!269169) (size!4142 (buf!4573 (_2!8165 lt!269123)))) (and (bvsge (currentBit!8682 lt!269169) #b00000000000000000000000000000000) (bvslt (currentBit!8682 lt!269169) #b00000000000000000000000000001000) (bvsge (currentByte!8687 lt!269169) #b00000000000000000000000000000000) (or (bvslt (currentByte!8687 lt!269169) (size!4142 (buf!4573 (_2!8165 lt!269123)))) (and (= (currentBit!8682 lt!269169) #b00000000000000000000000000000000) (= (currentByte!8687 lt!269169) (size!4142 (buf!4573 (_2!8165 lt!269123))))))))))

(assert (=> b!174495 d!61609))

(declare-fun d!61611 () Bool)

(assert (=> d!61611 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269149)))

(declare-fun lt!269818 () Unit!12538)

(assert (=> d!61611 (= lt!269818 (choose!9 thiss!1187 (buf!4573 (_2!8165 lt!269123)) lt!269149 (BitStream!7393 (buf!4573 (_2!8165 lt!269123)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(assert (=> d!61611 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4573 (_2!8165 lt!269123)) lt!269149) lt!269818)))

(declare-fun bs!15347 () Bool)

(assert (= bs!15347 d!61611))

(assert (=> bs!15347 m!273929))

(declare-fun m!274549 () Bool)

(assert (=> bs!15347 m!274549))

(assert (=> b!174495 d!61611))

(declare-fun lt!269821 () tuple2!15058)

(declare-fun d!61613 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15058)

(assert (=> d!61613 (= lt!269821 (readNBitsLSBFirstsLoop!0 (_1!8167 lt!269148) nBits!340 #b00000000000000000000000000000000 lt!269119))))

(assert (=> d!61613 (= (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269148) nBits!340 #b00000000000000000000000000000000 lt!269119) (tuple2!15049 (_2!8171 lt!269821) (_1!8171 lt!269821)))))

(declare-fun bs!15348 () Bool)

(assert (= bs!15348 d!61613))

(declare-fun m!274551 () Bool)

(assert (=> bs!15348 m!274551))

(assert (=> b!174495 d!61613))

(declare-fun d!61615 () Bool)

(assert (=> d!61615 (= (invariant!0 (currentBit!8682 (_2!8165 lt!269123)) (currentByte!8687 (_2!8165 lt!269123)) (size!4142 (buf!4573 (_2!8165 lt!269123)))) (and (bvsge (currentBit!8682 (_2!8165 lt!269123)) #b00000000000000000000000000000000) (bvslt (currentBit!8682 (_2!8165 lt!269123)) #b00000000000000000000000000001000) (bvsge (currentByte!8687 (_2!8165 lt!269123)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8687 (_2!8165 lt!269123)) (size!4142 (buf!4573 (_2!8165 lt!269123)))) (and (= (currentBit!8682 (_2!8165 lt!269123)) #b00000000000000000000000000000000) (= (currentByte!8687 (_2!8165 lt!269123)) (size!4142 (buf!4573 (_2!8165 lt!269123))))))))))

(assert (=> b!174495 d!61615))

(assert (=> b!174495 d!61395))

(declare-fun d!61617 () Bool)

(declare-fun e!121825 () Bool)

(assert (=> d!61617 e!121825))

(declare-fun res!144729 () Bool)

(assert (=> d!61617 (=> (not res!144729) (not e!121825))))

(declare-fun lt!269827 () (_ BitVec 64))

(declare-fun lt!269822 () (_ BitVec 64))

(declare-fun lt!269826 () (_ BitVec 64))

(assert (=> d!61617 (= res!144729 (= lt!269827 (bvsub lt!269822 lt!269826)))))

(assert (=> d!61617 (or (= (bvand lt!269822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269826 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269822 lt!269826) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61617 (= lt!269826 (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269123))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269123)))))))

(declare-fun lt!269823 () (_ BitVec 64))

(declare-fun lt!269825 () (_ BitVec 64))

(assert (=> d!61617 (= lt!269822 (bvmul lt!269823 lt!269825))))

(assert (=> d!61617 (or (= lt!269823 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269825 (bvsdiv (bvmul lt!269823 lt!269825) lt!269823)))))

(assert (=> d!61617 (= lt!269825 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61617 (= lt!269823 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))))))

(assert (=> d!61617 (= lt!269827 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269123))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269123)))))))

(assert (=> d!61617 (invariant!0 (currentBit!8682 (_2!8165 lt!269123)) (currentByte!8687 (_2!8165 lt!269123)) (size!4142 (buf!4573 (_2!8165 lt!269123))))))

(assert (=> d!61617 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))) lt!269827)))

(declare-fun b!174761 () Bool)

(declare-fun res!144730 () Bool)

(assert (=> b!174761 (=> (not res!144730) (not e!121825))))

(assert (=> b!174761 (= res!144730 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269827))))

(declare-fun b!174762 () Bool)

(declare-fun lt!269824 () (_ BitVec 64))

(assert (=> b!174762 (= e!121825 (bvsle lt!269827 (bvmul lt!269824 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174762 (or (= lt!269824 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269824 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269824)))))

(assert (=> b!174762 (= lt!269824 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))))))

(assert (= (and d!61617 res!144729) b!174761))

(assert (= (and b!174761 res!144730) b!174762))

(declare-fun m!274553 () Bool)

(assert (=> d!61617 m!274553))

(assert (=> d!61617 m!273899))

(assert (=> b!174495 d!61617))

(assert (=> b!174495 d!61421))

(declare-fun d!61619 () Bool)

(declare-fun e!121826 () Bool)

(assert (=> d!61619 e!121826))

(declare-fun res!144731 () Bool)

(assert (=> d!61619 (=> (not res!144731) (not e!121826))))

(declare-fun lt!269828 () (_ BitVec 64))

(declare-fun lt!269833 () (_ BitVec 64))

(declare-fun lt!269832 () (_ BitVec 64))

(assert (=> d!61619 (= res!144731 (= lt!269833 (bvsub lt!269828 lt!269832)))))

(assert (=> d!61619 (or (= (bvand lt!269828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269832 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269828 lt!269832) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61619 (= lt!269832 (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_1!8172 lt!269116)))) ((_ sign_extend 32) (currentByte!8687 (_1!8172 lt!269116))) ((_ sign_extend 32) (currentBit!8682 (_1!8172 lt!269116)))))))

(declare-fun lt!269829 () (_ BitVec 64))

(declare-fun lt!269831 () (_ BitVec 64))

(assert (=> d!61619 (= lt!269828 (bvmul lt!269829 lt!269831))))

(assert (=> d!61619 (or (= lt!269829 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269831 (bvsdiv (bvmul lt!269829 lt!269831) lt!269829)))))

(assert (=> d!61619 (= lt!269831 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61619 (= lt!269829 ((_ sign_extend 32) (size!4142 (buf!4573 (_1!8172 lt!269116)))))))

(assert (=> d!61619 (= lt!269833 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 (_1!8172 lt!269116))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 (_1!8172 lt!269116)))))))

(assert (=> d!61619 (invariant!0 (currentBit!8682 (_1!8172 lt!269116)) (currentByte!8687 (_1!8172 lt!269116)) (size!4142 (buf!4573 (_1!8172 lt!269116))))))

(assert (=> d!61619 (= (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269116))) (currentByte!8687 (_1!8172 lt!269116)) (currentBit!8682 (_1!8172 lt!269116))) lt!269833)))

(declare-fun b!174763 () Bool)

(declare-fun res!144732 () Bool)

(assert (=> b!174763 (=> (not res!144732) (not e!121826))))

(assert (=> b!174763 (= res!144732 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269833))))

(declare-fun b!174764 () Bool)

(declare-fun lt!269830 () (_ BitVec 64))

(assert (=> b!174764 (= e!121826 (bvsle lt!269833 (bvmul lt!269830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174764 (or (= lt!269830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269830)))))

(assert (=> b!174764 (= lt!269830 ((_ sign_extend 32) (size!4142 (buf!4573 (_1!8172 lt!269116)))))))

(assert (= (and d!61619 res!144731) b!174763))

(assert (= (and b!174763 res!144732) b!174764))

(declare-fun m!274555 () Bool)

(assert (=> d!61619 m!274555))

(declare-fun m!274557 () Bool)

(assert (=> d!61619 m!274557))

(assert (=> b!174495 d!61619))

(declare-fun d!61621 () Bool)

(declare-fun e!121829 () Bool)

(assert (=> d!61621 e!121829))

(declare-fun res!144735 () Bool)

(assert (=> d!61621 (=> (not res!144735) (not e!121829))))

(declare-fun lt!269842 () tuple2!15060)

(declare-fun lt!269844 () tuple2!15060)

(assert (=> d!61621 (= res!144735 (= (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269842))) (currentByte!8687 (_1!8172 lt!269842)) (currentBit!8682 (_1!8172 lt!269842))) (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269844))) (currentByte!8687 (_1!8172 lt!269844)) (currentBit!8682 (_1!8172 lt!269844)))))))

(declare-fun lt!269845 () Unit!12538)

(declare-fun lt!269843 () BitStream!7392)

(declare-fun choose!50 (BitStream!7392 BitStream!7392 BitStream!7392 tuple2!15060 tuple2!15060 BitStream!7392 Bool tuple2!15060 tuple2!15060 BitStream!7392 Bool) Unit!12538)

(assert (=> d!61621 (= lt!269845 (choose!50 lt!269169 (_2!8165 lt!269123) lt!269843 lt!269842 (tuple2!15061 (_1!8172 lt!269842) (_2!8172 lt!269842)) (_1!8172 lt!269842) (_2!8172 lt!269842) lt!269844 (tuple2!15061 (_1!8172 lt!269844) (_2!8172 lt!269844)) (_1!8172 lt!269844) (_2!8172 lt!269844)))))

(assert (=> d!61621 (= lt!269844 (readBitPure!0 lt!269843))))

(assert (=> d!61621 (= lt!269842 (readBitPure!0 lt!269169))))

(assert (=> d!61621 (= lt!269843 (BitStream!7393 (buf!4573 (_2!8165 lt!269123)) (currentByte!8687 lt!269169) (currentBit!8682 lt!269169)))))

(assert (=> d!61621 (invariant!0 (currentBit!8682 lt!269169) (currentByte!8687 lt!269169) (size!4142 (buf!4573 (_2!8165 lt!269123))))))

(assert (=> d!61621 (= (readBitPrefixLemma!0 lt!269169 (_2!8165 lt!269123)) lt!269845)))

(declare-fun b!174767 () Bool)

(assert (=> b!174767 (= e!121829 (= (_2!8172 lt!269842) (_2!8172 lt!269844)))))

(assert (= (and d!61621 res!144735) b!174767))

(assert (=> d!61621 m!273923))

(declare-fun m!274559 () Bool)

(assert (=> d!61621 m!274559))

(declare-fun m!274561 () Bool)

(assert (=> d!61621 m!274561))

(assert (=> d!61621 m!273909))

(declare-fun m!274563 () Bool)

(assert (=> d!61621 m!274563))

(declare-fun m!274565 () Bool)

(assert (=> d!61621 m!274565))

(assert (=> b!174495 d!61621))

(declare-fun b!174768 () Bool)

(declare-fun e!121838 () Bool)

(declare-fun lt!269883 () tuple2!15060)

(declare-fun lt!269846 () tuple2!15060)

(assert (=> b!174768 (= e!121838 (= (_2!8172 lt!269883) (_2!8172 lt!269846)))))

(declare-fun b!174769 () Bool)

(declare-fun e!121833 () Bool)

(declare-fun lt!269891 () (_ BitVec 64))

(assert (=> b!174769 (= e!121833 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269133)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269133))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269133))) lt!269891))))

(declare-fun b!174770 () Bool)

(declare-fun lt!269896 () tuple2!15060)

(declare-fun lt!269885 () tuple2!15046)

(assert (=> b!174770 (= lt!269896 (readBitPure!0 (readerFrom!0 (_2!8165 lt!269885) (currentBit!8682 (_2!8165 lt!269133)) (currentByte!8687 (_2!8165 lt!269133)))))))

(declare-fun res!144737 () Bool)

(declare-fun lt!269872 () Bool)

(assert (=> b!174770 (= res!144737 (and (= (_2!8172 lt!269896) lt!269872) (= (_1!8172 lt!269896) (_2!8165 lt!269885))))))

(declare-fun e!121830 () Bool)

(assert (=> b!174770 (=> (not res!144737) (not e!121830))))

(declare-fun e!121835 () Bool)

(assert (=> b!174770 (= e!121835 e!121830)))

(declare-fun b!174771 () Bool)

(declare-fun res!144746 () Bool)

(declare-fun e!121836 () Bool)

(assert (=> b!174771 (=> (not res!144746) (not e!121836))))

(declare-fun lt!269859 () tuple2!15046)

(assert (=> b!174771 (= res!144746 (= (size!4142 (buf!4573 (_2!8165 lt!269133))) (size!4142 (buf!4573 (_2!8165 lt!269859)))))))

(declare-fun bm!2897 () Bool)

(declare-fun call!2900 () Bool)

(declare-fun c!9206 () Bool)

(assert (=> bm!2897 (= call!2900 (isPrefixOf!0 (_2!8165 lt!269133) (ite c!9206 (_2!8165 lt!269133) (_2!8165 lt!269885))))))

(declare-fun b!174772 () Bool)

(declare-fun res!144740 () Bool)

(assert (=> b!174772 (=> (not res!144740) (not e!121836))))

(declare-fun lt!269894 () (_ BitVec 64))

(declare-fun lt!269869 () (_ BitVec 64))

(assert (=> b!174772 (= res!144740 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269859))) (currentByte!8687 (_2!8165 lt!269859)) (currentBit!8682 (_2!8165 lt!269859))) (bvsub lt!269894 lt!269869)))))

(assert (=> b!174772 (or (= (bvand lt!269894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269869 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269894 lt!269869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174772 (= lt!269869 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!269874 () (_ BitVec 64))

(declare-fun lt!269900 () (_ BitVec 64))

(assert (=> b!174772 (= lt!269894 (bvadd lt!269874 lt!269900))))

(assert (=> b!174772 (or (not (= (bvand lt!269874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269900 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269874 lt!269900) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174772 (= lt!269900 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174772 (= lt!269874 (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))))))

(declare-fun b!174773 () Bool)

(declare-fun e!121831 () (_ BitVec 64))

(assert (=> b!174773 (= e!121831 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174774 () Bool)

(declare-fun res!144744 () Bool)

(assert (=> b!174774 (= res!144744 call!2900)))

(assert (=> b!174774 (=> (not res!144744) (not e!121835))))

(declare-fun d!61623 () Bool)

(assert (=> d!61623 e!121836))

(declare-fun res!144739 () Bool)

(assert (=> d!61623 (=> (not res!144739) (not e!121836))))

(assert (=> d!61623 (= res!144739 (invariant!0 (currentBit!8682 (_2!8165 lt!269859)) (currentByte!8687 (_2!8165 lt!269859)) (size!4142 (buf!4573 (_2!8165 lt!269859)))))))

(declare-fun e!121832 () tuple2!15046)

(assert (=> d!61623 (= lt!269859 e!121832)))

(assert (=> d!61623 (= c!9206 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!340))))

(assert (=> d!61623 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61623 (= (appendBitsLSBFirstLoopTR!0 (_2!8165 lt!269133) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!269859)))

(declare-fun b!174775 () Bool)

(assert (=> b!174775 (= e!121830 (= (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269896))) (currentByte!8687 (_1!8172 lt!269896)) (currentBit!8682 (_1!8172 lt!269896))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269885))) (currentByte!8687 (_2!8165 lt!269885)) (currentBit!8682 (_2!8165 lt!269885)))))))

(declare-fun b!174776 () Bool)

(declare-fun lt!269853 () tuple2!15046)

(assert (=> b!174776 (= e!121832 (tuple2!15047 (_1!8165 lt!269853) (_2!8165 lt!269853)))))

(assert (=> b!174776 (= lt!269872 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174776 (= lt!269885 (appendBit!0 (_2!8165 lt!269133) lt!269872))))

(declare-fun res!144741 () Bool)

(assert (=> b!174776 (= res!144741 (= (size!4142 (buf!4573 (_2!8165 lt!269133))) (size!4142 (buf!4573 (_2!8165 lt!269885)))))))

(assert (=> b!174776 (=> (not res!144741) (not e!121835))))

(assert (=> b!174776 e!121835))

(declare-fun lt!269863 () tuple2!15046)

(assert (=> b!174776 (= lt!269863 lt!269885)))

(assert (=> b!174776 (= lt!269853 (appendBitsLSBFirstLoopTR!0 (_2!8165 lt!269863) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!269880 () Unit!12538)

(assert (=> b!174776 (= lt!269880 (lemmaIsPrefixTransitive!0 (_2!8165 lt!269133) (_2!8165 lt!269863) (_2!8165 lt!269853)))))

(assert (=> b!174776 (isPrefixOf!0 (_2!8165 lt!269133) (_2!8165 lt!269853))))

(declare-fun lt!269867 () Unit!12538)

(assert (=> b!174776 (= lt!269867 lt!269880)))

(assert (=> b!174776 (invariant!0 (currentBit!8682 (_2!8165 lt!269133)) (currentByte!8687 (_2!8165 lt!269133)) (size!4142 (buf!4573 (_2!8165 lt!269863))))))

(declare-fun lt!269899 () BitStream!7392)

(assert (=> b!174776 (= lt!269899 (BitStream!7393 (buf!4573 (_2!8165 lt!269863)) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))))))

(assert (=> b!174776 (invariant!0 (currentBit!8682 lt!269899) (currentByte!8687 lt!269899) (size!4142 (buf!4573 (_2!8165 lt!269853))))))

(declare-fun lt!269884 () BitStream!7392)

(assert (=> b!174776 (= lt!269884 (BitStream!7393 (buf!4573 (_2!8165 lt!269853)) (currentByte!8687 lt!269899) (currentBit!8682 lt!269899)))))

(assert (=> b!174776 (= lt!269883 (readBitPure!0 lt!269899))))

(assert (=> b!174776 (= lt!269846 (readBitPure!0 lt!269884))))

(declare-fun lt!269890 () Unit!12538)

(assert (=> b!174776 (= lt!269890 (readBitPrefixLemma!0 lt!269899 (_2!8165 lt!269853)))))

(declare-fun res!144743 () Bool)

(assert (=> b!174776 (= res!144743 (= (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269883))) (currentByte!8687 (_1!8172 lt!269883)) (currentBit!8682 (_1!8172 lt!269883))) (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269846))) (currentByte!8687 (_1!8172 lt!269846)) (currentBit!8682 (_1!8172 lt!269846)))))))

(assert (=> b!174776 (=> (not res!144743) (not e!121838))))

(assert (=> b!174776 e!121838))

(declare-fun lt!269873 () Unit!12538)

(assert (=> b!174776 (= lt!269873 lt!269890)))

(declare-fun lt!269878 () tuple2!15050)

(assert (=> b!174776 (= lt!269878 (reader!0 (_2!8165 lt!269133) (_2!8165 lt!269853)))))

(declare-fun lt!269854 () tuple2!15050)

(assert (=> b!174776 (= lt!269854 (reader!0 (_2!8165 lt!269863) (_2!8165 lt!269853)))))

(declare-fun lt!269887 () tuple2!15060)

(assert (=> b!174776 (= lt!269887 (readBitPure!0 (_1!8167 lt!269878)))))

(assert (=> b!174776 (= (_2!8172 lt!269887) lt!269872)))

(declare-fun lt!269876 () Unit!12538)

(declare-fun Unit!12593 () Unit!12538)

(assert (=> b!174776 (= lt!269876 Unit!12593)))

(declare-fun lt!269849 () (_ BitVec 64))

(assert (=> b!174776 (= lt!269849 (bvand v!186 (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!269862 () (_ BitVec 64))

(assert (=> b!174776 (= lt!269862 ((_ sign_extend 32) (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!269864 () Unit!12538)

(assert (=> b!174776 (= lt!269864 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8165 lt!269133) (buf!4573 (_2!8165 lt!269853)) lt!269862))))

(assert (=> b!174776 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269853)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269133))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269133))) lt!269862)))

(declare-fun lt!269860 () Unit!12538)

(assert (=> b!174776 (= lt!269860 lt!269864)))

(declare-fun lt!269861 () tuple2!15048)

(assert (=> b!174776 (= lt!269861 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269878) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!269849))))

(declare-fun lt!269857 () (_ BitVec 64))

(assert (=> b!174776 (= lt!269857 ((_ sign_extend 32) (bvsub (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!269858 () Unit!12538)

(assert (=> b!174776 (= lt!269858 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8165 lt!269863) (buf!4573 (_2!8165 lt!269853)) lt!269857))))

(assert (=> b!174776 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269853)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269863))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269863))) lt!269857)))

(declare-fun lt!269895 () Unit!12538)

(assert (=> b!174776 (= lt!269895 lt!269858)))

(declare-fun lt!269870 () tuple2!15048)

(assert (=> b!174776 (= lt!269870 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269854) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!269849 (ite (_2!8172 lt!269887) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!269871 () tuple2!15048)

(assert (=> b!174776 (= lt!269871 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269878) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!269849))))

(declare-fun c!9207 () Bool)

(assert (=> b!174776 (= c!9207 (_2!8172 (readBitPure!0 (_1!8167 lt!269878))))))

(declare-fun lt!269886 () tuple2!15048)

(assert (=> b!174776 (= lt!269886 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8167 lt!269878) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!269849 e!121831)))))

(declare-fun lt!269847 () Unit!12538)

(assert (=> b!174776 (= lt!269847 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8167 lt!269878) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!269849))))

(assert (=> b!174776 (and (= (_2!8166 lt!269871) (_2!8166 lt!269886)) (= (_1!8166 lt!269871) (_1!8166 lt!269886)))))

(declare-fun lt!269868 () Unit!12538)

(assert (=> b!174776 (= lt!269868 lt!269847)))

(assert (=> b!174776 (= (_1!8167 lt!269878) (withMovedBitIndex!0 (_2!8167 lt!269878) (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269853))) (currentByte!8687 (_2!8165 lt!269853)) (currentBit!8682 (_2!8165 lt!269853))))))))

(declare-fun lt!269877 () Unit!12538)

(declare-fun Unit!12594 () Unit!12538)

(assert (=> b!174776 (= lt!269877 Unit!12594)))

(assert (=> b!174776 (= (_1!8167 lt!269854) (withMovedBitIndex!0 (_2!8167 lt!269854) (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269863))) (currentByte!8687 (_2!8165 lt!269863)) (currentBit!8682 (_2!8165 lt!269863))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269853))) (currentByte!8687 (_2!8165 lt!269853)) (currentBit!8682 (_2!8165 lt!269853))))))))

(declare-fun lt!269892 () Unit!12538)

(declare-fun Unit!12595 () Unit!12538)

(assert (=> b!174776 (= lt!269892 Unit!12595)))

(assert (=> b!174776 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269863))) (currentByte!8687 (_2!8165 lt!269863)) (currentBit!8682 (_2!8165 lt!269863))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!269897 () Unit!12538)

(declare-fun Unit!12596 () Unit!12538)

(assert (=> b!174776 (= lt!269897 Unit!12596)))

(assert (=> b!174776 (= (_2!8166 lt!269861) (_2!8166 lt!269870))))

(declare-fun lt!269889 () Unit!12538)

(declare-fun Unit!12597 () Unit!12538)

(assert (=> b!174776 (= lt!269889 Unit!12597)))

(assert (=> b!174776 (invariant!0 (currentBit!8682 (_2!8165 lt!269853)) (currentByte!8687 (_2!8165 lt!269853)) (size!4142 (buf!4573 (_2!8165 lt!269853))))))

(declare-fun lt!269901 () Unit!12538)

(declare-fun Unit!12598 () Unit!12538)

(assert (=> b!174776 (= lt!269901 Unit!12598)))

(assert (=> b!174776 (= (size!4142 (buf!4573 (_2!8165 lt!269133))) (size!4142 (buf!4573 (_2!8165 lt!269853))))))

(declare-fun lt!269866 () Unit!12538)

(declare-fun Unit!12599 () Unit!12538)

(assert (=> b!174776 (= lt!269866 Unit!12599)))

(assert (=> b!174776 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269853))) (currentByte!8687 (_2!8165 lt!269853)) (currentBit!8682 (_2!8165 lt!269853))) (bvsub (bvadd (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!269875 () Unit!12538)

(declare-fun Unit!12600 () Unit!12538)

(assert (=> b!174776 (= lt!269875 Unit!12600)))

(declare-fun lt!269850 () Unit!12538)

(declare-fun Unit!12601 () Unit!12538)

(assert (=> b!174776 (= lt!269850 Unit!12601)))

(declare-fun lt!269888 () tuple2!15050)

(assert (=> b!174776 (= lt!269888 (reader!0 (_2!8165 lt!269133) (_2!8165 lt!269853)))))

(declare-fun lt!269879 () (_ BitVec 64))

(assert (=> b!174776 (= lt!269879 ((_ sign_extend 32) (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!269851 () Unit!12538)

(assert (=> b!174776 (= lt!269851 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8165 lt!269133) (buf!4573 (_2!8165 lt!269853)) lt!269879))))

(assert (=> b!174776 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269853)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269133))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269133))) lt!269879)))

(declare-fun lt!269852 () Unit!12538)

(assert (=> b!174776 (= lt!269852 lt!269851)))

(declare-fun lt!269881 () tuple2!15048)

(assert (=> b!174776 (= lt!269881 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269888) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvand v!186 (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun res!144736 () Bool)

(assert (=> b!174776 (= res!144736 (= (_2!8166 lt!269881) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun e!121834 () Bool)

(assert (=> b!174776 (=> (not res!144736) (not e!121834))))

(assert (=> b!174776 e!121834))

(declare-fun lt!269855 () Unit!12538)

(declare-fun Unit!12602 () Unit!12538)

(assert (=> b!174776 (= lt!269855 Unit!12602)))

(declare-fun b!174777 () Bool)

(declare-fun res!144745 () Bool)

(assert (=> b!174777 (= res!144745 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269885))) (currentByte!8687 (_2!8165 lt!269885)) (currentBit!8682 (_2!8165 lt!269885))) (bvadd (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!174777 (=> (not res!144745) (not e!121835))))

(declare-fun b!174778 () Bool)

(declare-fun e!121837 () Bool)

(declare-fun lt!269882 () tuple2!15048)

(declare-fun lt!269893 () tuple2!15050)

(assert (=> b!174778 (= e!121837 (= (_1!8166 lt!269882) (_2!8167 lt!269893)))))

(declare-fun b!174779 () Bool)

(declare-fun res!144742 () Bool)

(assert (=> b!174779 (=> (not res!144742) (not e!121836))))

(assert (=> b!174779 (= res!144742 (isPrefixOf!0 (_2!8165 lt!269133) (_2!8165 lt!269859)))))

(declare-fun b!174780 () Bool)

(declare-fun Unit!12603 () Unit!12538)

(assert (=> b!174780 (= e!121832 (tuple2!15047 Unit!12603 (_2!8165 lt!269133)))))

(declare-fun lt!269898 () Unit!12538)

(assert (=> b!174780 (= lt!269898 (lemmaIsPrefixRefl!0 (_2!8165 lt!269133)))))

(assert (=> b!174780 call!2900))

(declare-fun lt!269856 () Unit!12538)

(assert (=> b!174780 (= lt!269856 lt!269898)))

(declare-fun b!174781 () Bool)

(assert (=> b!174781 (= e!121834 (= (_1!8166 lt!269881) (_2!8167 lt!269888)))))

(declare-fun b!174782 () Bool)

(assert (=> b!174782 (= e!121836 e!121837)))

(declare-fun res!144747 () Bool)

(assert (=> b!174782 (=> (not res!144747) (not e!121837))))

(assert (=> b!174782 (= res!144747 (= (_2!8166 lt!269882) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!174782 (= lt!269882 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269893) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvand v!186 (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun lt!269865 () Unit!12538)

(declare-fun lt!269848 () Unit!12538)

(assert (=> b!174782 (= lt!269865 lt!269848)))

(assert (=> b!174782 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269859)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269133))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269133))) lt!269891)))

(assert (=> b!174782 (= lt!269848 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8165 lt!269133) (buf!4573 (_2!8165 lt!269859)) lt!269891))))

(assert (=> b!174782 e!121833))

(declare-fun res!144738 () Bool)

(assert (=> b!174782 (=> (not res!144738) (not e!121833))))

(assert (=> b!174782 (= res!144738 (and (= (size!4142 (buf!4573 (_2!8165 lt!269133))) (size!4142 (buf!4573 (_2!8165 lt!269859)))) (bvsge lt!269891 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174782 (= lt!269891 ((_ sign_extend 32) (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174782 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!174782 (= lt!269893 (reader!0 (_2!8165 lt!269133) (_2!8165 lt!269859)))))

(declare-fun b!174783 () Bool)

(assert (=> b!174783 (= e!121831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!61623 c!9206) b!174780))

(assert (= (and d!61623 (not c!9206)) b!174776))

(assert (= (and b!174776 res!144741) b!174777))

(assert (= (and b!174777 res!144745) b!174774))

(assert (= (and b!174774 res!144744) b!174770))

(assert (= (and b!174770 res!144737) b!174775))

(assert (= (and b!174776 res!144743) b!174768))

(assert (= (and b!174776 c!9207) b!174773))

(assert (= (and b!174776 (not c!9207)) b!174783))

(assert (= (and b!174776 res!144736) b!174781))

(assert (= (or b!174780 b!174774) bm!2897))

(assert (= (and d!61623 res!144739) b!174771))

(assert (= (and b!174771 res!144746) b!174772))

(assert (= (and b!174772 res!144740) b!174779))

(assert (= (and b!174779 res!144742) b!174782))

(assert (= (and b!174782 res!144738) b!174769))

(assert (= (and b!174782 res!144747) b!174778))

(declare-fun m!274567 () Bool)

(assert (=> d!61623 m!274567))

(declare-fun m!274569 () Bool)

(assert (=> b!174770 m!274569))

(assert (=> b!174770 m!274569))

(declare-fun m!274571 () Bool)

(assert (=> b!174770 m!274571))

(declare-fun m!274573 () Bool)

(assert (=> b!174777 m!274573))

(assert (=> b!174777 m!273943))

(declare-fun m!274575 () Bool)

(assert (=> b!174776 m!274575))

(declare-fun m!274577 () Bool)

(assert (=> b!174776 m!274577))

(declare-fun m!274579 () Bool)

(assert (=> b!174776 m!274579))

(declare-fun m!274581 () Bool)

(assert (=> b!174776 m!274581))

(declare-fun m!274583 () Bool)

(assert (=> b!174776 m!274583))

(declare-fun m!274585 () Bool)

(assert (=> b!174776 m!274585))

(declare-fun m!274587 () Bool)

(assert (=> b!174776 m!274587))

(declare-fun m!274589 () Bool)

(assert (=> b!174776 m!274589))

(declare-fun m!274591 () Bool)

(assert (=> b!174776 m!274591))

(assert (=> b!174776 m!274575))

(declare-fun m!274593 () Bool)

(assert (=> b!174776 m!274593))

(assert (=> b!174776 m!273943))

(declare-fun m!274595 () Bool)

(assert (=> b!174776 m!274595))

(declare-fun m!274597 () Bool)

(assert (=> b!174776 m!274597))

(declare-fun m!274599 () Bool)

(assert (=> b!174776 m!274599))

(declare-fun m!274601 () Bool)

(assert (=> b!174776 m!274601))

(declare-fun m!274603 () Bool)

(assert (=> b!174776 m!274603))

(declare-fun m!274605 () Bool)

(assert (=> b!174776 m!274605))

(declare-fun m!274607 () Bool)

(assert (=> b!174776 m!274607))

(declare-fun m!274609 () Bool)

(assert (=> b!174776 m!274609))

(declare-fun m!274611 () Bool)

(assert (=> b!174776 m!274611))

(declare-fun m!274613 () Bool)

(assert (=> b!174776 m!274613))

(declare-fun m!274615 () Bool)

(assert (=> b!174776 m!274615))

(declare-fun m!274617 () Bool)

(assert (=> b!174776 m!274617))

(declare-fun m!274619 () Bool)

(assert (=> b!174776 m!274619))

(assert (=> b!174776 m!273701))

(declare-fun m!274621 () Bool)

(assert (=> b!174776 m!274621))

(declare-fun m!274623 () Bool)

(assert (=> b!174776 m!274623))

(declare-fun m!274625 () Bool)

(assert (=> b!174776 m!274625))

(declare-fun m!274627 () Bool)

(assert (=> b!174776 m!274627))

(declare-fun m!274629 () Bool)

(assert (=> b!174776 m!274629))

(declare-fun m!274631 () Bool)

(assert (=> b!174776 m!274631))

(declare-fun m!274633 () Bool)

(assert (=> b!174776 m!274633))

(declare-fun m!274635 () Bool)

(assert (=> b!174776 m!274635))

(declare-fun m!274637 () Bool)

(assert (=> b!174776 m!274637))

(declare-fun m!274639 () Bool)

(assert (=> b!174780 m!274639))

(declare-fun m!274641 () Bool)

(assert (=> b!174769 m!274641))

(declare-fun m!274643 () Bool)

(assert (=> b!174782 m!274643))

(assert (=> b!174782 m!273701))

(assert (=> b!174782 m!274623))

(declare-fun m!274645 () Bool)

(assert (=> b!174782 m!274645))

(declare-fun m!274647 () Bool)

(assert (=> b!174782 m!274647))

(declare-fun m!274649 () Bool)

(assert (=> b!174782 m!274649))

(declare-fun m!274651 () Bool)

(assert (=> b!174772 m!274651))

(assert (=> b!174772 m!273943))

(declare-fun m!274653 () Bool)

(assert (=> b!174779 m!274653))

(declare-fun m!274655 () Bool)

(assert (=> b!174775 m!274655))

(assert (=> b!174775 m!274573))

(declare-fun m!274657 () Bool)

(assert (=> bm!2897 m!274657))

(assert (=> b!174495 d!61623))

(declare-fun d!61625 () Bool)

(declare-datatypes ((tuple2!15072 0))(
  ( (tuple2!15073 (_1!8179 Bool) (_2!8179 BitStream!7392)) )
))
(declare-fun lt!269904 () tuple2!15072)

(declare-fun readBit!0 (BitStream!7392) tuple2!15072)

(assert (=> d!61625 (= lt!269904 (readBit!0 (_1!8167 lt!269148)))))

(assert (=> d!61625 (= (readBitPure!0 (_1!8167 lt!269148)) (tuple2!15061 (_2!8179 lt!269904) (_1!8179 lt!269904)))))

(declare-fun bs!15349 () Bool)

(assert (= bs!15349 d!61625))

(declare-fun m!274659 () Bool)

(assert (=> bs!15349 m!274659))

(assert (=> b!174495 d!61625))

(declare-fun d!61627 () Bool)

(declare-fun e!121844 () Bool)

(assert (=> d!61627 e!121844))

(declare-fun res!144757 () Bool)

(assert (=> d!61627 (=> (not res!144757) (not e!121844))))

(declare-fun lt!269915 () tuple2!15046)

(assert (=> d!61627 (= res!144757 (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 (_2!8165 lt!269915)))))))

(declare-fun choose!16 (BitStream!7392 Bool) tuple2!15046)

(assert (=> d!61627 (= lt!269915 (choose!16 thiss!1187 lt!269142))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!61627 (validate_offset_bit!0 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)))))

(assert (=> d!61627 (= (appendBit!0 thiss!1187 lt!269142) lt!269915)))

(declare-fun b!174796 () Bool)

(declare-fun e!121843 () Bool)

(declare-fun lt!269914 () tuple2!15060)

(assert (=> b!174796 (= e!121843 (= (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269914))) (currentByte!8687 (_1!8172 lt!269914)) (currentBit!8682 (_1!8172 lt!269914))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269915))) (currentByte!8687 (_2!8165 lt!269915)) (currentBit!8682 (_2!8165 lt!269915)))))))

(declare-fun b!174794 () Bool)

(declare-fun res!144758 () Bool)

(assert (=> b!174794 (=> (not res!144758) (not e!121844))))

(assert (=> b!174794 (= res!144758 (isPrefixOf!0 thiss!1187 (_2!8165 lt!269915)))))

(declare-fun b!174793 () Bool)

(declare-fun res!144756 () Bool)

(assert (=> b!174793 (=> (not res!144756) (not e!121844))))

(declare-fun lt!269916 () (_ BitVec 64))

(declare-fun lt!269913 () (_ BitVec 64))

(assert (=> b!174793 (= res!144756 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269915))) (currentByte!8687 (_2!8165 lt!269915)) (currentBit!8682 (_2!8165 lt!269915))) (bvadd lt!269916 lt!269913)))))

(assert (=> b!174793 (or (not (= (bvand lt!269916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269913 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269916 lt!269913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174793 (= lt!269913 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!174793 (= lt!269916 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(declare-fun b!174795 () Bool)

(assert (=> b!174795 (= e!121844 e!121843)))

(declare-fun res!144759 () Bool)

(assert (=> b!174795 (=> (not res!144759) (not e!121843))))

(assert (=> b!174795 (= res!144759 (and (= (_2!8172 lt!269914) lt!269142) (= (_1!8172 lt!269914) (_2!8165 lt!269915))))))

(assert (=> b!174795 (= lt!269914 (readBitPure!0 (readerFrom!0 (_2!8165 lt!269915) (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187))))))

(assert (= (and d!61627 res!144757) b!174793))

(assert (= (and b!174793 res!144756) b!174794))

(assert (= (and b!174794 res!144758) b!174795))

(assert (= (and b!174795 res!144759) b!174796))

(declare-fun m!274661 () Bool)

(assert (=> b!174793 m!274661))

(assert (=> b!174793 m!273715))

(declare-fun m!274663 () Bool)

(assert (=> d!61627 m!274663))

(declare-fun m!274665 () Bool)

(assert (=> d!61627 m!274665))

(declare-fun m!274667 () Bool)

(assert (=> b!174794 m!274667))

(declare-fun m!274669 () Bool)

(assert (=> b!174795 m!274669))

(assert (=> b!174795 m!274669))

(declare-fun m!274671 () Bool)

(assert (=> b!174795 m!274671))

(declare-fun m!274673 () Bool)

(assert (=> b!174796 m!274673))

(assert (=> b!174796 m!274661))

(assert (=> b!174495 d!61627))

(declare-fun lt!269917 () tuple2!15058)

(declare-fun d!61629 () Bool)

(assert (=> d!61629 (= lt!269917 (readNBitsLSBFirstsLoop!0 (_1!8167 lt!269158) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(assert (=> d!61629 (= (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269158) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))) (tuple2!15049 (_2!8171 lt!269917) (_1!8171 lt!269917)))))

(declare-fun bs!15350 () Bool)

(assert (= bs!15350 d!61629))

(declare-fun m!274675 () Bool)

(assert (=> bs!15350 m!274675))

(assert (=> b!174495 d!61629))

(declare-fun d!61631 () Bool)

(assert (=> d!61631 (= (onesLSBLong!0 #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!174495 d!61631))

(declare-fun d!61633 () Bool)

(declare-fun e!121847 () Bool)

(assert (=> d!61633 e!121847))

(declare-fun res!144762 () Bool)

(assert (=> d!61633 (=> (not res!144762) (not e!121847))))

(declare-fun lt!269922 () BitStream!7392)

(declare-fun lt!269923 () (_ BitVec 64))

(assert (=> d!61633 (= res!144762 (= (bvadd lt!269923 (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))))) (bitIndex!0 (size!4142 (buf!4573 lt!269922)) (currentByte!8687 lt!269922) (currentBit!8682 lt!269922))))))

(assert (=> d!61633 (or (not (= (bvand lt!269923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269923 (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61633 (= lt!269923 (bitIndex!0 (size!4142 (buf!4573 (_2!8167 lt!269124))) (currentByte!8687 (_2!8167 lt!269124)) (currentBit!8682 (_2!8167 lt!269124))))))

(declare-fun moveBitIndex!0 (BitStream!7392 (_ BitVec 64)) tuple2!15046)

(assert (=> d!61633 (= lt!269922 (_2!8165 (moveBitIndex!0 (_2!8167 lt!269124) (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123)))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7392 (_ BitVec 64)) Bool)

(assert (=> d!61633 (moveBitIndexPrecond!0 (_2!8167 lt!269124) (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123)))))))

(assert (=> d!61633 (= (withMovedBitIndex!0 (_2!8167 lt!269124) (bvsub (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))))) lt!269922)))

(declare-fun b!174799 () Bool)

(assert (=> b!174799 (= e!121847 (= (size!4142 (buf!4573 (_2!8167 lt!269124))) (size!4142 (buf!4573 lt!269922))))))

(assert (= (and d!61633 res!144762) b!174799))

(declare-fun m!274677 () Bool)

(assert (=> d!61633 m!274677))

(declare-fun m!274679 () Bool)

(assert (=> d!61633 m!274679))

(declare-fun m!274681 () Bool)

(assert (=> d!61633 m!274681))

(declare-fun m!274683 () Bool)

(assert (=> d!61633 m!274683))

(assert (=> b!174495 d!61633))

(declare-fun d!61635 () Bool)

(declare-fun lt!269924 () tuple2!15058)

(assert (=> d!61635 (= lt!269924 (readNBitsLSBFirstsLoop!0 (_1!8167 lt!269124) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269119 (ite (_2!8172 lt!269157) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!61635 (= (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269124) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269119 (ite (_2!8172 lt!269157) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!15049 (_2!8171 lt!269924) (_1!8171 lt!269924)))))

(declare-fun bs!15351 () Bool)

(assert (= bs!15351 d!61635))

(declare-fun m!274685 () Bool)

(assert (=> bs!15351 m!274685))

(assert (=> b!174495 d!61635))

(declare-fun d!61637 () Bool)

(declare-fun e!121848 () Bool)

(assert (=> d!61637 e!121848))

(declare-fun res!144763 () Bool)

(assert (=> d!61637 (=> (not res!144763) (not e!121848))))

(declare-fun lt!269926 () (_ BitVec 64))

(declare-fun lt!269925 () BitStream!7392)

(assert (=> d!61637 (= res!144763 (= (bvadd lt!269926 (bvsub (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))))) (bitIndex!0 (size!4142 (buf!4573 lt!269925)) (currentByte!8687 lt!269925) (currentBit!8682 lt!269925))))))

(assert (=> d!61637 (or (not (= (bvand lt!269926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269926 (bvsub (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61637 (= lt!269926 (bitIndex!0 (size!4142 (buf!4573 (_2!8167 lt!269148))) (currentByte!8687 (_2!8167 lt!269148)) (currentBit!8682 (_2!8167 lt!269148))))))

(assert (=> d!61637 (= lt!269925 (_2!8165 (moveBitIndex!0 (_2!8167 lt!269148) (bvsub (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123)))))))))

(assert (=> d!61637 (moveBitIndexPrecond!0 (_2!8167 lt!269148) (bvsub (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123)))))))

(assert (=> d!61637 (= (withMovedBitIndex!0 (_2!8167 lt!269148) (bvsub (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))))) lt!269925)))

(declare-fun b!174800 () Bool)

(assert (=> b!174800 (= e!121848 (= (size!4142 (buf!4573 (_2!8167 lt!269148))) (size!4142 (buf!4573 lt!269925))))))

(assert (= (and d!61637 res!144763) b!174800))

(declare-fun m!274687 () Bool)

(assert (=> d!61637 m!274687))

(declare-fun m!274689 () Bool)

(assert (=> d!61637 m!274689))

(declare-fun m!274691 () Bool)

(assert (=> d!61637 m!274691))

(declare-fun m!274693 () Bool)

(assert (=> d!61637 m!274693))

(assert (=> b!174495 d!61637))

(declare-fun d!61639 () Bool)

(declare-fun e!121849 () Bool)

(assert (=> d!61639 e!121849))

(declare-fun res!144764 () Bool)

(assert (=> d!61639 (=> (not res!144764) (not e!121849))))

(declare-fun lt!269928 () (_ BitVec 64))

(declare-fun lt!269927 () BitStream!7392)

(assert (=> d!61639 (= res!144764 (= (bvadd lt!269928 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4142 (buf!4573 lt!269927)) (currentByte!8687 lt!269927) (currentBit!8682 lt!269927))))))

(assert (=> d!61639 (or (not (= (bvand lt!269928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269928 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61639 (= lt!269928 (bitIndex!0 (size!4142 (buf!4573 (_1!8167 lt!269148))) (currentByte!8687 (_1!8167 lt!269148)) (currentBit!8682 (_1!8167 lt!269148))))))

(assert (=> d!61639 (= lt!269927 (_2!8165 (moveBitIndex!0 (_1!8167 lt!269148) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!61639 (moveBitIndexPrecond!0 (_1!8167 lt!269148) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!61639 (= (withMovedBitIndex!0 (_1!8167 lt!269148) #b0000000000000000000000000000000000000000000000000000000000000001) lt!269927)))

(declare-fun b!174801 () Bool)

(assert (=> b!174801 (= e!121849 (= (size!4142 (buf!4573 (_1!8167 lt!269148))) (size!4142 (buf!4573 lt!269927))))))

(assert (= (and d!61639 res!144764) b!174801))

(declare-fun m!274695 () Bool)

(assert (=> d!61639 m!274695))

(declare-fun m!274697 () Bool)

(assert (=> d!61639 m!274697))

(declare-fun m!274699 () Bool)

(assert (=> d!61639 m!274699))

(declare-fun m!274701 () Bool)

(assert (=> d!61639 m!274701))

(assert (=> b!174495 d!61639))

(declare-fun d!61641 () Bool)

(declare-fun lt!269929 () tuple2!15072)

(assert (=> d!61641 (= lt!269929 (readBit!0 lt!269154))))

(assert (=> d!61641 (= (readBitPure!0 lt!269154) (tuple2!15061 (_2!8179 lt!269929) (_1!8179 lt!269929)))))

(declare-fun bs!15352 () Bool)

(assert (= bs!15352 d!61641))

(declare-fun m!274703 () Bool)

(assert (=> bs!15352 m!274703))

(assert (=> b!174495 d!61641))

(declare-fun d!61643 () Bool)

(assert (=> d!61643 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269132)))

(declare-fun lt!269930 () Unit!12538)

(assert (=> d!61643 (= lt!269930 (choose!9 thiss!1187 (buf!4573 (_2!8165 lt!269123)) lt!269132 (BitStream!7393 (buf!4573 (_2!8165 lt!269123)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(assert (=> d!61643 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4573 (_2!8165 lt!269123)) lt!269132) lt!269930)))

(declare-fun bs!15353 () Bool)

(assert (= bs!15353 d!61643))

(assert (=> bs!15353 m!273889))

(declare-fun m!274705 () Bool)

(assert (=> bs!15353 m!274705))

(assert (=> b!174495 d!61643))

(declare-fun d!61645 () Bool)

(assert (=> d!61645 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269133))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269133))) lt!269127) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269133))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269133)))) lt!269127))))

(declare-fun bs!15354 () Bool)

(assert (= bs!15354 d!61645))

(declare-fun m!274707 () Bool)

(assert (=> bs!15354 m!274707))

(assert (=> b!174495 d!61645))

(declare-fun d!61647 () Bool)

(assert (=> d!61647 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269132) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187))) lt!269132))))

(declare-fun bs!15355 () Bool)

(assert (= bs!15355 d!61647))

(declare-fun m!274709 () Bool)

(assert (=> bs!15355 m!274709))

(assert (=> b!174495 d!61647))

(declare-fun d!61649 () Bool)

(declare-fun lt!269931 () tuple2!15072)

(assert (=> d!61649 (= lt!269931 (readBit!0 lt!269169))))

(assert (=> d!61649 (= (readBitPure!0 lt!269169) (tuple2!15061 (_2!8179 lt!269931) (_1!8179 lt!269931)))))

(declare-fun bs!15356 () Bool)

(assert (= bs!15356 d!61649))

(declare-fun m!274711 () Bool)

(assert (=> bs!15356 m!274711))

(assert (=> b!174495 d!61649))

(declare-fun d!61651 () Bool)

(declare-fun res!144765 () Bool)

(declare-fun e!121851 () Bool)

(assert (=> d!61651 (=> (not res!144765) (not e!121851))))

(assert (=> d!61651 (= res!144765 (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 (_2!8165 lt!269123)))))))

(assert (=> d!61651 (= (isPrefixOf!0 thiss!1187 (_2!8165 lt!269123)) e!121851)))

(declare-fun b!174802 () Bool)

(declare-fun res!144766 () Bool)

(assert (=> b!174802 (=> (not res!144766) (not e!121851))))

(assert (=> b!174802 (= res!144766 (bvsle (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123)))))))

(declare-fun b!174803 () Bool)

(declare-fun e!121850 () Bool)

(assert (=> b!174803 (= e!121851 e!121850)))

(declare-fun res!144767 () Bool)

(assert (=> b!174803 (=> res!144767 e!121850)))

(assert (=> b!174803 (= res!144767 (= (size!4142 (buf!4573 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174804 () Bool)

(assert (=> b!174804 (= e!121850 (arrayBitRangesEq!0 (buf!4573 thiss!1187) (buf!4573 (_2!8165 lt!269123)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(assert (= (and d!61651 res!144765) b!174802))

(assert (= (and b!174802 res!144766) b!174803))

(assert (= (and b!174803 (not res!144767)) b!174804))

(assert (=> b!174802 m!273715))

(assert (=> b!174802 m!273937))

(assert (=> b!174804 m!273715))

(assert (=> b!174804 m!273715))

(declare-fun m!274713 () Bool)

(assert (=> b!174804 m!274713))

(assert (=> b!174495 d!61651))

(declare-fun d!61653 () Bool)

(assert (=> d!61653 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269149) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187))) lt!269149))))

(declare-fun bs!15357 () Bool)

(assert (= bs!15357 d!61653))

(assert (=> bs!15357 m!274709))

(assert (=> b!174495 d!61653))

(declare-fun d!61655 () Bool)

(declare-fun e!121852 () Bool)

(assert (=> d!61655 e!121852))

(declare-fun res!144768 () Bool)

(assert (=> d!61655 (=> (not res!144768) (not e!121852))))

(declare-fun lt!269936 () (_ BitVec 64))

(declare-fun lt!269937 () (_ BitVec 64))

(declare-fun lt!269932 () (_ BitVec 64))

(assert (=> d!61655 (= res!144768 (= lt!269937 (bvsub lt!269932 lt!269936)))))

(assert (=> d!61655 (or (= (bvand lt!269932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269936 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269932 lt!269936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61655 (= lt!269936 (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_1!8172 lt!269153)))) ((_ sign_extend 32) (currentByte!8687 (_1!8172 lt!269153))) ((_ sign_extend 32) (currentBit!8682 (_1!8172 lt!269153)))))))

(declare-fun lt!269933 () (_ BitVec 64))

(declare-fun lt!269935 () (_ BitVec 64))

(assert (=> d!61655 (= lt!269932 (bvmul lt!269933 lt!269935))))

(assert (=> d!61655 (or (= lt!269933 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269935 (bvsdiv (bvmul lt!269933 lt!269935) lt!269933)))))

(assert (=> d!61655 (= lt!269935 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61655 (= lt!269933 ((_ sign_extend 32) (size!4142 (buf!4573 (_1!8172 lt!269153)))))))

(assert (=> d!61655 (= lt!269937 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 (_1!8172 lt!269153))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 (_1!8172 lt!269153)))))))

(assert (=> d!61655 (invariant!0 (currentBit!8682 (_1!8172 lt!269153)) (currentByte!8687 (_1!8172 lt!269153)) (size!4142 (buf!4573 (_1!8172 lt!269153))))))

(assert (=> d!61655 (= (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269153))) (currentByte!8687 (_1!8172 lt!269153)) (currentBit!8682 (_1!8172 lt!269153))) lt!269937)))

(declare-fun b!174805 () Bool)

(declare-fun res!144769 () Bool)

(assert (=> b!174805 (=> (not res!144769) (not e!121852))))

(assert (=> b!174805 (= res!144769 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269937))))

(declare-fun b!174806 () Bool)

(declare-fun lt!269934 () (_ BitVec 64))

(assert (=> b!174806 (= e!121852 (bvsle lt!269937 (bvmul lt!269934 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174806 (or (= lt!269934 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269934 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269934)))))

(assert (=> b!174806 (= lt!269934 ((_ sign_extend 32) (size!4142 (buf!4573 (_1!8172 lt!269153)))))))

(assert (= (and d!61655 res!144768) b!174805))

(assert (= (and b!174805 res!144769) b!174806))

(declare-fun m!274715 () Bool)

(assert (=> d!61655 m!274715))

(declare-fun m!274717 () Bool)

(assert (=> d!61655 m!274717))

(assert (=> b!174495 d!61655))

(declare-fun d!61657 () Bool)

(assert (=> d!61657 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269123)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269133))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269133))) lt!269127)))

(declare-fun lt!269938 () Unit!12538)

(assert (=> d!61657 (= lt!269938 (choose!9 (_2!8165 lt!269133) (buf!4573 (_2!8165 lt!269123)) lt!269127 (BitStream!7393 (buf!4573 (_2!8165 lt!269123)) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133)))))))

(assert (=> d!61657 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8165 lt!269133) (buf!4573 (_2!8165 lt!269123)) lt!269127) lt!269938)))

(declare-fun bs!15358 () Bool)

(assert (= bs!15358 d!61657))

(assert (=> bs!15358 m!273933))

(declare-fun m!274719 () Bool)

(assert (=> bs!15358 m!274719))

(assert (=> b!174495 d!61657))

(declare-fun lt!269939 () tuple2!15058)

(declare-fun d!61659 () Bool)

(assert (=> d!61659 (= lt!269939 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8167 lt!269148) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269119 e!121658)))))

(assert (=> d!61659 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8167 lt!269148) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269119 e!121658)) (tuple2!15049 (_2!8171 lt!269939) (_1!8171 lt!269939)))))

(declare-fun bs!15359 () Bool)

(assert (= bs!15359 d!61659))

(assert (=> bs!15359 m!273883))

(declare-fun m!274721 () Bool)

(assert (=> bs!15359 m!274721))

(assert (=> b!174495 d!61659))

(declare-fun d!61661 () Bool)

(declare-fun lt!269952 () tuple2!15048)

(declare-fun lt!269955 () tuple2!15048)

(assert (=> d!61661 (and (= (_2!8166 lt!269952) (_2!8166 lt!269955)) (= (_1!8166 lt!269952) (_1!8166 lt!269955)))))

(declare-fun lt!269953 () BitStream!7392)

(declare-fun lt!269957 () Unit!12538)

(declare-fun lt!269954 () Bool)

(declare-fun lt!269956 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!15048 tuple2!15048 BitStream!7392 (_ BitVec 64) Bool BitStream!7392 (_ BitVec 64) tuple2!15048 tuple2!15048 BitStream!7392 (_ BitVec 64)) Unit!12538)

(assert (=> d!61661 (= lt!269957 (choose!56 (_1!8167 lt!269148) nBits!340 #b00000000000000000000000000000000 lt!269119 lt!269952 (tuple2!15049 (_1!8166 lt!269952) (_2!8166 lt!269952)) (_1!8166 lt!269952) (_2!8166 lt!269952) lt!269954 lt!269953 lt!269956 lt!269955 (tuple2!15049 (_1!8166 lt!269955) (_2!8166 lt!269955)) (_1!8166 lt!269955) (_2!8166 lt!269955)))))

(assert (=> d!61661 (= lt!269955 (readNBitsLSBFirstsLoopPure!0 lt!269953 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!269956))))

(assert (=> d!61661 (= lt!269956 (bvor lt!269119 (ite lt!269954 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61661 (= lt!269953 (withMovedBitIndex!0 (_1!8167 lt!269148) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!61661 (= lt!269954 (_2!8172 (readBitPure!0 (_1!8167 lt!269148))))))

(assert (=> d!61661 (= lt!269952 (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269148) nBits!340 #b00000000000000000000000000000000 lt!269119))))

(assert (=> d!61661 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8167 lt!269148) nBits!340 #b00000000000000000000000000000000 lt!269119) lt!269957)))

(declare-fun bs!15361 () Bool)

(assert (= bs!15361 d!61661))

(assert (=> bs!15361 m!273893))

(assert (=> bs!15361 m!273883))

(declare-fun m!274723 () Bool)

(assert (=> bs!15361 m!274723))

(declare-fun m!274725 () Bool)

(assert (=> bs!15361 m!274725))

(assert (=> bs!15361 m!273927))

(assert (=> b!174495 d!61661))

(declare-fun b!174807 () Bool)

(declare-fun e!121853 () Unit!12538)

(declare-fun lt!269970 () Unit!12538)

(assert (=> b!174807 (= e!121853 lt!269970)))

(declare-fun lt!269971 () (_ BitVec 64))

(assert (=> b!174807 (= lt!269971 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!269965 () (_ BitVec 64))

(assert (=> b!174807 (= lt!269965 (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))))))

(assert (=> b!174807 (= lt!269970 (arrayBitRangesEqSymmetric!0 (buf!4573 (_2!8165 lt!269133)) (buf!4573 (_2!8165 lt!269123)) lt!269971 lt!269965))))

(assert (=> b!174807 (arrayBitRangesEq!0 (buf!4573 (_2!8165 lt!269123)) (buf!4573 (_2!8165 lt!269133)) lt!269971 lt!269965)))

(declare-fun b!174808 () Bool)

(declare-fun res!144770 () Bool)

(declare-fun e!121854 () Bool)

(assert (=> b!174808 (=> (not res!144770) (not e!121854))))

(declare-fun lt!269962 () tuple2!15050)

(assert (=> b!174808 (= res!144770 (isPrefixOf!0 (_1!8167 lt!269962) (_2!8165 lt!269133)))))

(declare-fun lt!269964 () (_ BitVec 64))

(declare-fun lt!269972 () (_ BitVec 64))

(declare-fun b!174809 () Bool)

(assert (=> b!174809 (= e!121854 (= (_1!8167 lt!269962) (withMovedBitIndex!0 (_2!8167 lt!269962) (bvsub lt!269964 lt!269972))))))

(assert (=> b!174809 (or (= (bvand lt!269964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269972 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269964 lt!269972) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174809 (= lt!269972 (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269123))) (currentByte!8687 (_2!8165 lt!269123)) (currentBit!8682 (_2!8165 lt!269123))))))

(assert (=> b!174809 (= lt!269964 (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))))))

(declare-fun d!61663 () Bool)

(assert (=> d!61663 e!121854))

(declare-fun res!144772 () Bool)

(assert (=> d!61663 (=> (not res!144772) (not e!121854))))

(assert (=> d!61663 (= res!144772 (isPrefixOf!0 (_1!8167 lt!269962) (_2!8167 lt!269962)))))

(declare-fun lt!269975 () BitStream!7392)

(assert (=> d!61663 (= lt!269962 (tuple2!15051 lt!269975 (_2!8165 lt!269123)))))

(declare-fun lt!269963 () Unit!12538)

(declare-fun lt!269974 () Unit!12538)

(assert (=> d!61663 (= lt!269963 lt!269974)))

(assert (=> d!61663 (isPrefixOf!0 lt!269975 (_2!8165 lt!269123))))

(assert (=> d!61663 (= lt!269974 (lemmaIsPrefixTransitive!0 lt!269975 (_2!8165 lt!269123) (_2!8165 lt!269123)))))

(declare-fun lt!269966 () Unit!12538)

(declare-fun lt!269959 () Unit!12538)

(assert (=> d!61663 (= lt!269966 lt!269959)))

(assert (=> d!61663 (isPrefixOf!0 lt!269975 (_2!8165 lt!269123))))

(assert (=> d!61663 (= lt!269959 (lemmaIsPrefixTransitive!0 lt!269975 (_2!8165 lt!269133) (_2!8165 lt!269123)))))

(declare-fun lt!269967 () Unit!12538)

(assert (=> d!61663 (= lt!269967 e!121853)))

(declare-fun c!9208 () Bool)

(assert (=> d!61663 (= c!9208 (not (= (size!4142 (buf!4573 (_2!8165 lt!269133))) #b00000000000000000000000000000000)))))

(declare-fun lt!269968 () Unit!12538)

(declare-fun lt!269973 () Unit!12538)

(assert (=> d!61663 (= lt!269968 lt!269973)))

(assert (=> d!61663 (isPrefixOf!0 (_2!8165 lt!269123) (_2!8165 lt!269123))))

(assert (=> d!61663 (= lt!269973 (lemmaIsPrefixRefl!0 (_2!8165 lt!269123)))))

(declare-fun lt!269960 () Unit!12538)

(declare-fun lt!269969 () Unit!12538)

(assert (=> d!61663 (= lt!269960 lt!269969)))

(assert (=> d!61663 (= lt!269969 (lemmaIsPrefixRefl!0 (_2!8165 lt!269123)))))

(declare-fun lt!269977 () Unit!12538)

(declare-fun lt!269958 () Unit!12538)

(assert (=> d!61663 (= lt!269977 lt!269958)))

(assert (=> d!61663 (isPrefixOf!0 lt!269975 lt!269975)))

(assert (=> d!61663 (= lt!269958 (lemmaIsPrefixRefl!0 lt!269975))))

(declare-fun lt!269976 () Unit!12538)

(declare-fun lt!269961 () Unit!12538)

(assert (=> d!61663 (= lt!269976 lt!269961)))

(assert (=> d!61663 (isPrefixOf!0 (_2!8165 lt!269133) (_2!8165 lt!269133))))

(assert (=> d!61663 (= lt!269961 (lemmaIsPrefixRefl!0 (_2!8165 lt!269133)))))

(assert (=> d!61663 (= lt!269975 (BitStream!7393 (buf!4573 (_2!8165 lt!269123)) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))))))

(assert (=> d!61663 (isPrefixOf!0 (_2!8165 lt!269133) (_2!8165 lt!269123))))

(assert (=> d!61663 (= (reader!0 (_2!8165 lt!269133) (_2!8165 lt!269123)) lt!269962)))

(declare-fun b!174810 () Bool)

(declare-fun Unit!12604 () Unit!12538)

(assert (=> b!174810 (= e!121853 Unit!12604)))

(declare-fun b!174811 () Bool)

(declare-fun res!144771 () Bool)

(assert (=> b!174811 (=> (not res!144771) (not e!121854))))

(assert (=> b!174811 (= res!144771 (isPrefixOf!0 (_2!8167 lt!269962) (_2!8165 lt!269123)))))

(assert (= (and d!61663 c!9208) b!174807))

(assert (= (and d!61663 (not c!9208)) b!174810))

(assert (= (and d!61663 res!144772) b!174808))

(assert (= (and b!174808 res!144770) b!174811))

(assert (= (and b!174811 res!144771) b!174809))

(declare-fun m!274727 () Bool)

(assert (=> b!174808 m!274727))

(declare-fun m!274729 () Bool)

(assert (=> b!174809 m!274729))

(assert (=> b!174809 m!273937))

(assert (=> b!174809 m!273943))

(declare-fun m!274731 () Bool)

(assert (=> d!61663 m!274731))

(assert (=> d!61663 m!274529))

(assert (=> d!61663 m!274639))

(declare-fun m!274733 () Bool)

(assert (=> d!61663 m!274733))

(declare-fun m!274735 () Bool)

(assert (=> d!61663 m!274735))

(declare-fun m!274737 () Bool)

(assert (=> d!61663 m!274737))

(assert (=> d!61663 m!274535))

(declare-fun m!274739 () Bool)

(assert (=> d!61663 m!274739))

(declare-fun m!274741 () Bool)

(assert (=> d!61663 m!274741))

(declare-fun m!274743 () Bool)

(assert (=> d!61663 m!274743))

(declare-fun m!274745 () Bool)

(assert (=> d!61663 m!274745))

(assert (=> b!174807 m!273943))

(declare-fun m!274747 () Bool)

(assert (=> b!174807 m!274747))

(declare-fun m!274749 () Bool)

(assert (=> b!174807 m!274749))

(declare-fun m!274751 () Bool)

(assert (=> b!174811 m!274751))

(assert (=> b!174495 d!61663))

(declare-fun d!61665 () Bool)

(assert (=> d!61665 (isPrefixOf!0 thiss!1187 (_2!8165 lt!269123))))

(declare-fun lt!269980 () Unit!12538)

(declare-fun choose!30 (BitStream!7392 BitStream!7392 BitStream!7392) Unit!12538)

(assert (=> d!61665 (= lt!269980 (choose!30 thiss!1187 (_2!8165 lt!269133) (_2!8165 lt!269123)))))

(assert (=> d!61665 (isPrefixOf!0 thiss!1187 (_2!8165 lt!269133))))

(assert (=> d!61665 (= (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8165 lt!269133) (_2!8165 lt!269123)) lt!269980)))

(declare-fun bs!15362 () Bool)

(assert (= bs!15362 d!61665))

(assert (=> bs!15362 m!273895))

(declare-fun m!274753 () Bool)

(assert (=> bs!15362 m!274753))

(declare-fun m!274755 () Bool)

(assert (=> bs!15362 m!274755))

(assert (=> b!174495 d!61665))

(declare-fun d!61667 () Bool)

(declare-fun e!121855 () Bool)

(assert (=> d!61667 e!121855))

(declare-fun res!144773 () Bool)

(assert (=> d!61667 (=> (not res!144773) (not e!121855))))

(declare-fun lt!269985 () (_ BitVec 64))

(declare-fun lt!269986 () (_ BitVec 64))

(declare-fun lt!269981 () (_ BitVec 64))

(assert (=> d!61667 (= res!144773 (= lt!269986 (bvsub lt!269981 lt!269985)))))

(assert (=> d!61667 (or (= (bvand lt!269981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269985 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269981 lt!269985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61667 (= lt!269985 (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269133)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269133))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269133)))))))

(declare-fun lt!269982 () (_ BitVec 64))

(declare-fun lt!269984 () (_ BitVec 64))

(assert (=> d!61667 (= lt!269981 (bvmul lt!269982 lt!269984))))

(assert (=> d!61667 (or (= lt!269982 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269984 (bvsdiv (bvmul lt!269982 lt!269984) lt!269982)))))

(assert (=> d!61667 (= lt!269984 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61667 (= lt!269982 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269133)))))))

(assert (=> d!61667 (= lt!269986 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269133))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269133)))))))

(assert (=> d!61667 (invariant!0 (currentBit!8682 (_2!8165 lt!269133)) (currentByte!8687 (_2!8165 lt!269133)) (size!4142 (buf!4573 (_2!8165 lt!269133))))))

(assert (=> d!61667 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269133))) (currentByte!8687 (_2!8165 lt!269133)) (currentBit!8682 (_2!8165 lt!269133))) lt!269986)))

(declare-fun b!174812 () Bool)

(declare-fun res!144774 () Bool)

(assert (=> b!174812 (=> (not res!144774) (not e!121855))))

(assert (=> b!174812 (= res!144774 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269986))))

(declare-fun b!174813 () Bool)

(declare-fun lt!269983 () (_ BitVec 64))

(assert (=> b!174813 (= e!121855 (bvsle lt!269986 (bvmul lt!269983 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174813 (or (= lt!269983 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269983 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269983)))))

(assert (=> b!174813 (= lt!269983 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269133)))))))

(assert (= (and d!61667 res!144773) b!174812))

(assert (= (and b!174812 res!144774) b!174813))

(declare-fun m!274757 () Bool)

(assert (=> d!61667 m!274757))

(declare-fun m!274759 () Bool)

(assert (=> d!61667 m!274759))

(assert (=> b!174495 d!61667))

(declare-fun d!61669 () Bool)

(assert (=> d!61669 (= (invariant!0 (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187) (size!4142 (buf!4573 (_2!8165 lt!269133)))) (and (bvsge (currentBit!8682 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8682 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8687 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8687 thiss!1187) (size!4142 (buf!4573 (_2!8165 lt!269133)))) (and (= (currentBit!8682 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8687 thiss!1187) (size!4142 (buf!4573 (_2!8165 lt!269133))))))))))

(assert (=> b!174495 d!61669))

(declare-fun d!61671 () Bool)

(assert (=> d!61671 (= (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!268745))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!268745)))) (bvsub (bvmul ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!268745))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!268745))))))))

(assert (=> d!61409 d!61671))

(declare-fun d!61673 () Bool)

(assert (=> d!61673 (= (invariant!0 (currentBit!8682 (_2!8165 lt!268745)) (currentByte!8687 (_2!8165 lt!268745)) (size!4142 (buf!4573 (_2!8165 lt!268745)))) (and (bvsge (currentBit!8682 (_2!8165 lt!268745)) #b00000000000000000000000000000000) (bvslt (currentBit!8682 (_2!8165 lt!268745)) #b00000000000000000000000000001000) (bvsge (currentByte!8687 (_2!8165 lt!268745)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8687 (_2!8165 lt!268745)) (size!4142 (buf!4573 (_2!8165 lt!268745)))) (and (= (currentBit!8682 (_2!8165 lt!268745)) #b00000000000000000000000000000000) (= (currentByte!8687 (_2!8165 lt!268745)) (size!4142 (buf!4573 (_2!8165 lt!268745))))))))))

(assert (=> d!61409 d!61673))

(declare-fun d!61675 () Bool)

(declare-fun e!121856 () Bool)

(assert (=> d!61675 e!121856))

(declare-fun res!144775 () Bool)

(assert (=> d!61675 (=> (not res!144775) (not e!121856))))

(declare-fun lt!269987 () (_ BitVec 64))

(declare-fun lt!269991 () (_ BitVec 64))

(declare-fun lt!269992 () (_ BitVec 64))

(assert (=> d!61675 (= res!144775 (= lt!269992 (bvsub lt!269987 lt!269991)))))

(assert (=> d!61675 (or (= (bvand lt!269987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269991 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269987 lt!269991) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61675 (= lt!269991 (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_1!8172 lt!269166)))) ((_ sign_extend 32) (currentByte!8687 (_1!8172 lt!269166))) ((_ sign_extend 32) (currentBit!8682 (_1!8172 lt!269166)))))))

(declare-fun lt!269988 () (_ BitVec 64))

(declare-fun lt!269990 () (_ BitVec 64))

(assert (=> d!61675 (= lt!269987 (bvmul lt!269988 lt!269990))))

(assert (=> d!61675 (or (= lt!269988 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269990 (bvsdiv (bvmul lt!269988 lt!269990) lt!269988)))))

(assert (=> d!61675 (= lt!269990 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61675 (= lt!269988 ((_ sign_extend 32) (size!4142 (buf!4573 (_1!8172 lt!269166)))))))

(assert (=> d!61675 (= lt!269992 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 (_1!8172 lt!269166))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 (_1!8172 lt!269166)))))))

(assert (=> d!61675 (invariant!0 (currentBit!8682 (_1!8172 lt!269166)) (currentByte!8687 (_1!8172 lt!269166)) (size!4142 (buf!4573 (_1!8172 lt!269166))))))

(assert (=> d!61675 (= (bitIndex!0 (size!4142 (buf!4573 (_1!8172 lt!269166))) (currentByte!8687 (_1!8172 lt!269166)) (currentBit!8682 (_1!8172 lt!269166))) lt!269992)))

(declare-fun b!174814 () Bool)

(declare-fun res!144776 () Bool)

(assert (=> b!174814 (=> (not res!144776) (not e!121856))))

(assert (=> b!174814 (= res!144776 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269992))))

(declare-fun b!174815 () Bool)

(declare-fun lt!269989 () (_ BitVec 64))

(assert (=> b!174815 (= e!121856 (bvsle lt!269992 (bvmul lt!269989 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174815 (or (= lt!269989 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269989 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269989)))))

(assert (=> b!174815 (= lt!269989 ((_ sign_extend 32) (size!4142 (buf!4573 (_1!8172 lt!269166)))))))

(assert (= (and d!61675 res!144775) b!174814))

(assert (= (and b!174814 res!144776) b!174815))

(declare-fun m!274761 () Bool)

(assert (=> d!61675 m!274761))

(declare-fun m!274763 () Bool)

(assert (=> d!61675 m!274763))

(assert (=> b!174494 d!61675))

(declare-fun d!61677 () Bool)

(declare-fun e!121857 () Bool)

(assert (=> d!61677 e!121857))

(declare-fun res!144777 () Bool)

(assert (=> d!61677 (=> (not res!144777) (not e!121857))))

(declare-fun lt!269997 () (_ BitVec 64))

(declare-fun lt!269993 () (_ BitVec 64))

(declare-fun lt!269998 () (_ BitVec 64))

(assert (=> d!61677 (= res!144777 (= lt!269998 (bvsub lt!269993 lt!269997)))))

(assert (=> d!61677 (or (= (bvand lt!269993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269997 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269993 lt!269997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61677 (= lt!269997 (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269155)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269155))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269155)))))))

(declare-fun lt!269994 () (_ BitVec 64))

(declare-fun lt!269996 () (_ BitVec 64))

(assert (=> d!61677 (= lt!269993 (bvmul lt!269994 lt!269996))))

(assert (=> d!61677 (or (= lt!269994 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269996 (bvsdiv (bvmul lt!269994 lt!269996) lt!269994)))))

(assert (=> d!61677 (= lt!269996 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61677 (= lt!269994 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269155)))))))

(assert (=> d!61677 (= lt!269998 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269155))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269155)))))))

(assert (=> d!61677 (invariant!0 (currentBit!8682 (_2!8165 lt!269155)) (currentByte!8687 (_2!8165 lt!269155)) (size!4142 (buf!4573 (_2!8165 lt!269155))))))

(assert (=> d!61677 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269155))) (currentByte!8687 (_2!8165 lt!269155)) (currentBit!8682 (_2!8165 lt!269155))) lt!269998)))

(declare-fun b!174816 () Bool)

(declare-fun res!144778 () Bool)

(assert (=> b!174816 (=> (not res!144778) (not e!121857))))

(assert (=> b!174816 (= res!144778 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269998))))

(declare-fun b!174817 () Bool)

(declare-fun lt!269995 () (_ BitVec 64))

(assert (=> b!174817 (= e!121857 (bvsle lt!269998 (bvmul lt!269995 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174817 (or (= lt!269995 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269995 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269995)))))

(assert (=> b!174817 (= lt!269995 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269155)))))))

(assert (= (and d!61677 res!144777) b!174816))

(assert (= (and b!174816 res!144778) b!174817))

(declare-fun m!274765 () Bool)

(assert (=> d!61677 m!274765))

(declare-fun m!274767 () Bool)

(assert (=> d!61677 m!274767))

(assert (=> b!174494 d!61677))

(declare-fun d!61679 () Bool)

(declare-fun e!121860 () Bool)

(assert (=> d!61679 e!121860))

(declare-fun res!144781 () Bool)

(assert (=> d!61679 (=> (not res!144781) (not e!121860))))

(declare-fun lt!270010 () tuple2!15058)

(assert (=> d!61679 (= res!144781 (= (buf!4573 (_2!8171 lt!270010)) (buf!4573 (_1!8167 lt!268743))))))

(declare-fun lt!270009 () tuple2!15058)

(assert (=> d!61679 (= lt!270010 (tuple2!15059 (_1!8171 lt!270009) (_2!8171 lt!270009)))))

(assert (=> d!61679 (= lt!270009 (readNBitsLSBFirstsLoop!0 (_1!8167 lt!268743) nBits!340 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61679 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61679 (= (readNBitsLSBFirst!0 (_1!8167 lt!268743) nBits!340) lt!270010)))

(declare-fun b!174820 () Bool)

(declare-fun lt!270008 () (_ BitVec 64))

(declare-fun lt!270007 () (_ BitVec 64))

(assert (=> b!174820 (= e!121860 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8171 lt!270010))) (currentByte!8687 (_2!8171 lt!270010)) (currentBit!8682 (_2!8171 lt!270010))) (bvadd lt!270007 lt!270008)))))

(assert (=> b!174820 (or (not (= (bvand lt!270007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270008 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!270007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!270007 lt!270008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174820 (= lt!270008 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174820 (= lt!270007 (bitIndex!0 (size!4142 (buf!4573 (_1!8167 lt!268743))) (currentByte!8687 (_1!8167 lt!268743)) (currentBit!8682 (_1!8167 lt!268743))))))

(assert (= (and d!61679 res!144781) b!174820))

(declare-fun m!274769 () Bool)

(assert (=> d!61679 m!274769))

(declare-fun m!274771 () Bool)

(assert (=> b!174820 m!274771))

(declare-fun m!274773 () Bool)

(assert (=> b!174820 m!274773))

(assert (=> d!61405 d!61679))

(assert (=> b!174496 d!61677))

(assert (=> b!174496 d!61421))

(declare-fun d!61681 () Bool)

(assert (=> d!61681 (= (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187))) (bvsub (bvmul ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 thiss!1187)))))))

(assert (=> d!61421 d!61681))

(assert (=> d!61421 d!61423))

(assert (=> d!61407 d!61423))

(declare-fun d!61683 () Bool)

(assert (=> d!61683 (isPrefixOf!0 lt!268818 lt!268818)))

(declare-fun lt!270013 () Unit!12538)

(declare-fun choose!11 (BitStream!7392) Unit!12538)

(assert (=> d!61683 (= lt!270013 (choose!11 lt!268818))))

(assert (=> d!61683 (= (lemmaIsPrefixRefl!0 lt!268818) lt!270013)))

(declare-fun bs!15364 () Bool)

(assert (= bs!15364 d!61683))

(assert (=> bs!15364 m!273767))

(declare-fun m!274775 () Bool)

(assert (=> bs!15364 m!274775))

(assert (=> d!61401 d!61683))

(declare-fun d!61685 () Bool)

(assert (=> d!61685 (isPrefixOf!0 lt!268818 (_2!8165 lt!268745))))

(declare-fun lt!270014 () Unit!12538)

(assert (=> d!61685 (= lt!270014 (choose!30 lt!268818 (_2!8165 lt!268745) (_2!8165 lt!268745)))))

(assert (=> d!61685 (isPrefixOf!0 lt!268818 (_2!8165 lt!268745))))

(assert (=> d!61685 (= (lemmaIsPrefixTransitive!0 lt!268818 (_2!8165 lt!268745) (_2!8165 lt!268745)) lt!270014)))

(declare-fun bs!15365 () Bool)

(assert (= bs!15365 d!61685))

(assert (=> bs!15365 m!273769))

(declare-fun m!274777 () Bool)

(assert (=> bs!15365 m!274777))

(assert (=> bs!15365 m!273769))

(assert (=> d!61401 d!61685))

(declare-fun d!61687 () Bool)

(assert (=> d!61687 (isPrefixOf!0 lt!268818 (_2!8165 lt!268745))))

(declare-fun lt!270015 () Unit!12538)

(assert (=> d!61687 (= lt!270015 (choose!30 lt!268818 thiss!1187 (_2!8165 lt!268745)))))

(assert (=> d!61687 (isPrefixOf!0 lt!268818 thiss!1187)))

(assert (=> d!61687 (= (lemmaIsPrefixTransitive!0 lt!268818 thiss!1187 (_2!8165 lt!268745)) lt!270015)))

(declare-fun bs!15366 () Bool)

(assert (= bs!15366 d!61687))

(assert (=> bs!15366 m!273769))

(declare-fun m!274779 () Bool)

(assert (=> bs!15366 m!274779))

(declare-fun m!274781 () Bool)

(assert (=> bs!15366 m!274781))

(assert (=> d!61401 d!61687))

(declare-fun d!61689 () Bool)

(assert (=> d!61689 (isPrefixOf!0 thiss!1187 thiss!1187)))

(declare-fun lt!270016 () Unit!12538)

(assert (=> d!61689 (= lt!270016 (choose!11 thiss!1187))))

(assert (=> d!61689 (= (lemmaIsPrefixRefl!0 thiss!1187) lt!270016)))

(declare-fun bs!15367 () Bool)

(assert (= bs!15367 d!61689))

(assert (=> bs!15367 m!273775))

(declare-fun m!274783 () Bool)

(assert (=> bs!15367 m!274783))

(assert (=> d!61401 d!61689))

(declare-fun d!61691 () Bool)

(declare-fun res!144782 () Bool)

(declare-fun e!121862 () Bool)

(assert (=> d!61691 (=> (not res!144782) (not e!121862))))

(assert (=> d!61691 (= res!144782 (= (size!4142 (buf!4573 lt!268818)) (size!4142 (buf!4573 (_2!8165 lt!268745)))))))

(assert (=> d!61691 (= (isPrefixOf!0 lt!268818 (_2!8165 lt!268745)) e!121862)))

(declare-fun b!174821 () Bool)

(declare-fun res!144783 () Bool)

(assert (=> b!174821 (=> (not res!144783) (not e!121862))))

(assert (=> b!174821 (= res!144783 (bvsle (bitIndex!0 (size!4142 (buf!4573 lt!268818)) (currentByte!8687 lt!268818) (currentBit!8682 lt!268818)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!268745))) (currentByte!8687 (_2!8165 lt!268745)) (currentBit!8682 (_2!8165 lt!268745)))))))

(declare-fun b!174822 () Bool)

(declare-fun e!121861 () Bool)

(assert (=> b!174822 (= e!121862 e!121861)))

(declare-fun res!144784 () Bool)

(assert (=> b!174822 (=> res!144784 e!121861)))

(assert (=> b!174822 (= res!144784 (= (size!4142 (buf!4573 lt!268818)) #b00000000000000000000000000000000))))

(declare-fun b!174823 () Bool)

(assert (=> b!174823 (= e!121861 (arrayBitRangesEq!0 (buf!4573 lt!268818) (buf!4573 (_2!8165 lt!268745)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 lt!268818)) (currentByte!8687 lt!268818) (currentBit!8682 lt!268818))))))

(assert (= (and d!61691 res!144782) b!174821))

(assert (= (and b!174821 res!144783) b!174822))

(assert (= (and b!174822 (not res!144784)) b!174823))

(declare-fun m!274785 () Bool)

(assert (=> b!174821 m!274785))

(assert (=> b!174821 m!273713))

(assert (=> b!174823 m!274785))

(assert (=> b!174823 m!274785))

(declare-fun m!274787 () Bool)

(assert (=> b!174823 m!274787))

(assert (=> d!61401 d!61691))

(declare-fun d!61693 () Bool)

(declare-fun res!144785 () Bool)

(declare-fun e!121864 () Bool)

(assert (=> d!61693 (=> (not res!144785) (not e!121864))))

(assert (=> d!61693 (= res!144785 (= (size!4142 (buf!4573 lt!268818)) (size!4142 (buf!4573 lt!268818))))))

(assert (=> d!61693 (= (isPrefixOf!0 lt!268818 lt!268818) e!121864)))

(declare-fun b!174824 () Bool)

(declare-fun res!144786 () Bool)

(assert (=> b!174824 (=> (not res!144786) (not e!121864))))

(assert (=> b!174824 (= res!144786 (bvsle (bitIndex!0 (size!4142 (buf!4573 lt!268818)) (currentByte!8687 lt!268818) (currentBit!8682 lt!268818)) (bitIndex!0 (size!4142 (buf!4573 lt!268818)) (currentByte!8687 lt!268818) (currentBit!8682 lt!268818))))))

(declare-fun b!174825 () Bool)

(declare-fun e!121863 () Bool)

(assert (=> b!174825 (= e!121864 e!121863)))

(declare-fun res!144787 () Bool)

(assert (=> b!174825 (=> res!144787 e!121863)))

(assert (=> b!174825 (= res!144787 (= (size!4142 (buf!4573 lt!268818)) #b00000000000000000000000000000000))))

(declare-fun b!174826 () Bool)

(assert (=> b!174826 (= e!121863 (arrayBitRangesEq!0 (buf!4573 lt!268818) (buf!4573 lt!268818) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 lt!268818)) (currentByte!8687 lt!268818) (currentBit!8682 lt!268818))))))

(assert (= (and d!61693 res!144785) b!174824))

(assert (= (and b!174824 res!144786) b!174825))

(assert (= (and b!174825 (not res!144787)) b!174826))

(assert (=> b!174824 m!274785))

(assert (=> b!174824 m!274785))

(assert (=> b!174826 m!274785))

(assert (=> b!174826 m!274785))

(declare-fun m!274789 () Bool)

(assert (=> b!174826 m!274789))

(assert (=> d!61401 d!61693))

(declare-fun d!61695 () Bool)

(assert (=> d!61695 (isPrefixOf!0 (_2!8165 lt!268745) (_2!8165 lt!268745))))

(declare-fun lt!270017 () Unit!12538)

(assert (=> d!61695 (= lt!270017 (choose!11 (_2!8165 lt!268745)))))

(assert (=> d!61695 (= (lemmaIsPrefixRefl!0 (_2!8165 lt!268745)) lt!270017)))

(declare-fun bs!15368 () Bool)

(assert (= bs!15368 d!61695))

(assert (=> bs!15368 m!273763))

(declare-fun m!274791 () Bool)

(assert (=> bs!15368 m!274791))

(assert (=> d!61401 d!61695))

(declare-fun d!61697 () Bool)

(declare-fun res!144788 () Bool)

(declare-fun e!121866 () Bool)

(assert (=> d!61697 (=> (not res!144788) (not e!121866))))

(assert (=> d!61697 (= res!144788 (= (size!4142 (buf!4573 (_2!8165 lt!268745))) (size!4142 (buf!4573 (_2!8165 lt!268745)))))))

(assert (=> d!61697 (= (isPrefixOf!0 (_2!8165 lt!268745) (_2!8165 lt!268745)) e!121866)))

(declare-fun b!174827 () Bool)

(declare-fun res!144789 () Bool)

(assert (=> b!174827 (=> (not res!144789) (not e!121866))))

(assert (=> b!174827 (= res!144789 (bvsle (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!268745))) (currentByte!8687 (_2!8165 lt!268745)) (currentBit!8682 (_2!8165 lt!268745))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!268745))) (currentByte!8687 (_2!8165 lt!268745)) (currentBit!8682 (_2!8165 lt!268745)))))))

(declare-fun b!174828 () Bool)

(declare-fun e!121865 () Bool)

(assert (=> b!174828 (= e!121866 e!121865)))

(declare-fun res!144790 () Bool)

(assert (=> b!174828 (=> res!144790 e!121865)))

(assert (=> b!174828 (= res!144790 (= (size!4142 (buf!4573 (_2!8165 lt!268745))) #b00000000000000000000000000000000))))

(declare-fun b!174829 () Bool)

(assert (=> b!174829 (= e!121865 (arrayBitRangesEq!0 (buf!4573 (_2!8165 lt!268745)) (buf!4573 (_2!8165 lt!268745)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!268745))) (currentByte!8687 (_2!8165 lt!268745)) (currentBit!8682 (_2!8165 lt!268745)))))))

(assert (= (and d!61697 res!144788) b!174827))

(assert (= (and b!174827 res!144789) b!174828))

(assert (= (and b!174828 (not res!144790)) b!174829))

(assert (=> b!174827 m!273713))

(assert (=> b!174827 m!273713))

(assert (=> b!174829 m!273713))

(assert (=> b!174829 m!273713))

(declare-fun m!274793 () Bool)

(assert (=> b!174829 m!274793))

(assert (=> d!61401 d!61697))

(declare-fun d!61699 () Bool)

(declare-fun res!144791 () Bool)

(declare-fun e!121868 () Bool)

(assert (=> d!61699 (=> (not res!144791) (not e!121868))))

(assert (=> d!61699 (= res!144791 (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 thiss!1187))))))

(assert (=> d!61699 (= (isPrefixOf!0 thiss!1187 thiss!1187) e!121868)))

(declare-fun b!174830 () Bool)

(declare-fun res!144792 () Bool)

(assert (=> b!174830 (=> (not res!144792) (not e!121868))))

(assert (=> b!174830 (= res!144792 (bvsle (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(declare-fun b!174831 () Bool)

(declare-fun e!121867 () Bool)

(assert (=> b!174831 (= e!121868 e!121867)))

(declare-fun res!144793 () Bool)

(assert (=> b!174831 (=> res!144793 e!121867)))

(assert (=> b!174831 (= res!144793 (= (size!4142 (buf!4573 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174832 () Bool)

(assert (=> b!174832 (= e!121867 (arrayBitRangesEq!0 (buf!4573 thiss!1187) (buf!4573 thiss!1187) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(assert (= (and d!61699 res!144791) b!174830))

(assert (= (and b!174830 res!144792) b!174831))

(assert (= (and b!174831 (not res!144793)) b!174832))

(assert (=> b!174830 m!273715))

(assert (=> b!174830 m!273715))

(assert (=> b!174832 m!273715))

(assert (=> b!174832 m!273715))

(declare-fun m!274795 () Bool)

(assert (=> b!174832 m!274795))

(assert (=> d!61401 d!61699))

(declare-fun d!61701 () Bool)

(declare-fun res!144794 () Bool)

(declare-fun e!121870 () Bool)

(assert (=> d!61701 (=> (not res!144794) (not e!121870))))

(assert (=> d!61701 (= res!144794 (= (size!4142 (buf!4573 (_1!8167 lt!268805))) (size!4142 (buf!4573 (_2!8167 lt!268805)))))))

(assert (=> d!61701 (= (isPrefixOf!0 (_1!8167 lt!268805) (_2!8167 lt!268805)) e!121870)))

(declare-fun b!174833 () Bool)

(declare-fun res!144795 () Bool)

(assert (=> b!174833 (=> (not res!144795) (not e!121870))))

(assert (=> b!174833 (= res!144795 (bvsle (bitIndex!0 (size!4142 (buf!4573 (_1!8167 lt!268805))) (currentByte!8687 (_1!8167 lt!268805)) (currentBit!8682 (_1!8167 lt!268805))) (bitIndex!0 (size!4142 (buf!4573 (_2!8167 lt!268805))) (currentByte!8687 (_2!8167 lt!268805)) (currentBit!8682 (_2!8167 lt!268805)))))))

(declare-fun b!174834 () Bool)

(declare-fun e!121869 () Bool)

(assert (=> b!174834 (= e!121870 e!121869)))

(declare-fun res!144796 () Bool)

(assert (=> b!174834 (=> res!144796 e!121869)))

(assert (=> b!174834 (= res!144796 (= (size!4142 (buf!4573 (_1!8167 lt!268805))) #b00000000000000000000000000000000))))

(declare-fun b!174835 () Bool)

(assert (=> b!174835 (= e!121869 (arrayBitRangesEq!0 (buf!4573 (_1!8167 lt!268805)) (buf!4573 (_2!8167 lt!268805)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 (_1!8167 lt!268805))) (currentByte!8687 (_1!8167 lt!268805)) (currentBit!8682 (_1!8167 lt!268805)))))))

(assert (= (and d!61701 res!144794) b!174833))

(assert (= (and b!174833 res!144795) b!174834))

(assert (= (and b!174834 (not res!144796)) b!174835))

(declare-fun m!274797 () Bool)

(assert (=> b!174833 m!274797))

(declare-fun m!274799 () Bool)

(assert (=> b!174833 m!274799))

(assert (=> b!174835 m!274797))

(assert (=> b!174835 m!274797))

(declare-fun m!274801 () Bool)

(assert (=> b!174835 m!274801))

(assert (=> d!61401 d!61701))

(assert (=> d!61401 d!61455))

(declare-fun d!61703 () Bool)

(declare-fun lt!270018 () tuple2!15072)

(assert (=> d!61703 (= lt!270018 (readBit!0 (readerFrom!0 (_2!8165 lt!269155) (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187))))))

(assert (=> d!61703 (= (readBitPure!0 (readerFrom!0 (_2!8165 lt!269155) (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187))) (tuple2!15061 (_2!8179 lt!270018) (_1!8179 lt!270018)))))

(declare-fun bs!15369 () Bool)

(assert (= bs!15369 d!61703))

(assert (=> bs!15369 m!273877))

(declare-fun m!274803 () Bool)

(assert (=> bs!15369 m!274803))

(assert (=> b!174489 d!61703))

(declare-fun d!61705 () Bool)

(declare-fun e!121873 () Bool)

(assert (=> d!61705 e!121873))

(declare-fun res!144800 () Bool)

(assert (=> d!61705 (=> (not res!144800) (not e!121873))))

(assert (=> d!61705 (= res!144800 (invariant!0 (currentBit!8682 (_2!8165 lt!269155)) (currentByte!8687 (_2!8165 lt!269155)) (size!4142 (buf!4573 (_2!8165 lt!269155)))))))

(assert (=> d!61705 (= (readerFrom!0 (_2!8165 lt!269155) (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187)) (BitStream!7393 (buf!4573 (_2!8165 lt!269155)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(declare-fun b!174838 () Bool)

(assert (=> b!174838 (= e!121873 (invariant!0 (currentBit!8682 thiss!1187) (currentByte!8687 thiss!1187) (size!4142 (buf!4573 (_2!8165 lt!269155)))))))

(assert (= (and d!61705 res!144800) b!174838))

(assert (=> d!61705 m!274767))

(declare-fun m!274805 () Bool)

(assert (=> b!174838 m!274805))

(assert (=> b!174489 d!61705))

(assert (=> d!61397 d!61399))

(declare-fun d!61707 () Bool)

(assert (=> d!61707 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(assert (=> d!61707 true))

(declare-fun _$6!357 () Unit!12538)

(assert (=> d!61707 (= (choose!9 thiss!1187 (buf!4573 (_2!8165 lt!268745)) ((_ sign_extend 32) nBits!340) (BitStream!7393 (buf!4573 (_2!8165 lt!268745)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))) _$6!357)))

(declare-fun bs!15370 () Bool)

(assert (= bs!15370 d!61707))

(assert (=> bs!15370 m!273703))

(assert (=> d!61397 d!61707))

(declare-fun d!61709 () Bool)

(declare-fun e!121874 () Bool)

(assert (=> d!61709 e!121874))

(declare-fun res!144801 () Bool)

(assert (=> d!61709 (=> (not res!144801) (not e!121874))))

(declare-fun lt!270024 () (_ BitVec 64))

(declare-fun lt!270019 () (_ BitVec 64))

(declare-fun lt!270023 () (_ BitVec 64))

(assert (=> d!61709 (= res!144801 (= lt!270024 (bvsub lt!270019 lt!270023)))))

(assert (=> d!61709 (or (= (bvand lt!270019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270023 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270019 lt!270023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61709 (= lt!270023 (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269129)))) ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269129))) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269129)))))))

(declare-fun lt!270020 () (_ BitVec 64))

(declare-fun lt!270022 () (_ BitVec 64))

(assert (=> d!61709 (= lt!270019 (bvmul lt!270020 lt!270022))))

(assert (=> d!61709 (or (= lt!270020 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270022 (bvsdiv (bvmul lt!270020 lt!270022) lt!270020)))))

(assert (=> d!61709 (= lt!270022 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61709 (= lt!270020 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269129)))))))

(assert (=> d!61709 (= lt!270024 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 (_2!8165 lt!269129))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 (_2!8165 lt!269129)))))))

(assert (=> d!61709 (invariant!0 (currentBit!8682 (_2!8165 lt!269129)) (currentByte!8687 (_2!8165 lt!269129)) (size!4142 (buf!4573 (_2!8165 lt!269129))))))

(assert (=> d!61709 (= (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269129))) (currentByte!8687 (_2!8165 lt!269129)) (currentBit!8682 (_2!8165 lt!269129))) lt!270024)))

(declare-fun b!174839 () Bool)

(declare-fun res!144802 () Bool)

(assert (=> b!174839 (=> (not res!144802) (not e!121874))))

(assert (=> b!174839 (= res!144802 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270024))))

(declare-fun b!174840 () Bool)

(declare-fun lt!270021 () (_ BitVec 64))

(assert (=> b!174840 (= e!121874 (bvsle lt!270024 (bvmul lt!270021 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174840 (or (= lt!270021 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270021 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270021)))))

(assert (=> b!174840 (= lt!270021 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269129)))))))

(assert (= (and d!61709 res!144801) b!174839))

(assert (= (and b!174839 res!144802) b!174840))

(declare-fun m!274807 () Bool)

(assert (=> d!61709 m!274807))

(assert (=> d!61709 m!273875))

(assert (=> b!174491 d!61709))

(assert (=> b!174491 d!61421))

(declare-fun d!61711 () Bool)

(declare-fun res!144803 () Bool)

(declare-fun e!121876 () Bool)

(assert (=> d!61711 (=> (not res!144803) (not e!121876))))

(assert (=> d!61711 (= res!144803 (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 (ite c!9182 thiss!1187 (_2!8165 lt!269155))))))))

(assert (=> d!61711 (= (isPrefixOf!0 thiss!1187 (ite c!9182 thiss!1187 (_2!8165 lt!269155))) e!121876)))

(declare-fun b!174841 () Bool)

(declare-fun res!144804 () Bool)

(assert (=> b!174841 (=> (not res!144804) (not e!121876))))

(assert (=> b!174841 (= res!144804 (bvsle (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (ite c!9182 thiss!1187 (_2!8165 lt!269155)))) (currentByte!8687 (ite c!9182 thiss!1187 (_2!8165 lt!269155))) (currentBit!8682 (ite c!9182 thiss!1187 (_2!8165 lt!269155))))))))

(declare-fun b!174842 () Bool)

(declare-fun e!121875 () Bool)

(assert (=> b!174842 (= e!121876 e!121875)))

(declare-fun res!144805 () Bool)

(assert (=> b!174842 (=> res!144805 e!121875)))

(assert (=> b!174842 (= res!144805 (= (size!4142 (buf!4573 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174843 () Bool)

(assert (=> b!174843 (= e!121875 (arrayBitRangesEq!0 (buf!4573 thiss!1187) (buf!4573 (ite c!9182 thiss!1187 (_2!8165 lt!269155))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(assert (= (and d!61711 res!144803) b!174841))

(assert (= (and b!174841 res!144804) b!174842))

(assert (= (and b!174842 (not res!144805)) b!174843))

(assert (=> b!174841 m!273715))

(declare-fun m!274809 () Bool)

(assert (=> b!174841 m!274809))

(assert (=> b!174843 m!273715))

(assert (=> b!174843 m!273715))

(declare-fun m!274811 () Bool)

(assert (=> b!174843 m!274811))

(assert (=> bm!2885 d!61711))

(declare-fun b!174858 () Bool)

(declare-fun res!144816 () Bool)

(declare-fun lt!270032 () (_ BitVec 32))

(assert (=> b!174858 (= res!144816 (= lt!270032 #b00000000000000000000000000000000))))

(declare-fun e!121891 () Bool)

(assert (=> b!174858 (=> res!144816 e!121891)))

(declare-fun e!121892 () Bool)

(assert (=> b!174858 (= e!121892 e!121891)))

(declare-fun b!174859 () Bool)

(declare-fun e!121894 () Bool)

(declare-fun call!2903 () Bool)

(assert (=> b!174859 (= e!121894 call!2903)))

(declare-datatypes ((tuple4!254 0))(
  ( (tuple4!255 (_1!8180 (_ BitVec 32)) (_2!8180 (_ BitVec 32)) (_3!643 (_ BitVec 32)) (_4!127 (_ BitVec 32))) )
))
(declare-fun lt!270031 () tuple4!254)

(declare-fun b!174860 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174860 (= e!121891 (byteRangesEq!0 (select (arr!5072 (buf!4573 thiss!1187)) (_4!127 lt!270031)) (select (arr!5072 (buf!4573 (_2!8165 lt!268745))) (_4!127 lt!270031)) #b00000000000000000000000000000000 lt!270032))))

(declare-fun b!174861 () Bool)

(assert (=> b!174861 (= e!121894 e!121892)))

(declare-fun res!144818 () Bool)

(assert (=> b!174861 (= res!144818 call!2903)))

(assert (=> b!174861 (=> (not res!144818) (not e!121892))))

(declare-fun d!61713 () Bool)

(declare-fun res!144820 () Bool)

(declare-fun e!121890 () Bool)

(assert (=> d!61713 (=> res!144820 e!121890)))

(assert (=> d!61713 (= res!144820 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(assert (=> d!61713 (= (arrayBitRangesEq!0 (buf!4573 thiss!1187) (buf!4573 (_2!8165 lt!268745)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))) e!121890)))

(declare-fun e!121889 () Bool)

(declare-fun b!174862 () Bool)

(declare-fun arrayRangesEq!689 (array!9387 array!9387 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174862 (= e!121889 (arrayRangesEq!689 (buf!4573 thiss!1187) (buf!4573 (_2!8165 lt!268745)) (_1!8180 lt!270031) (_2!8180 lt!270031)))))

(declare-fun bm!2900 () Bool)

(declare-fun c!9211 () Bool)

(declare-fun lt!270033 () (_ BitVec 32))

(assert (=> bm!2900 (= call!2903 (byteRangesEq!0 (select (arr!5072 (buf!4573 thiss!1187)) (_3!643 lt!270031)) (select (arr!5072 (buf!4573 (_2!8165 lt!268745))) (_3!643 lt!270031)) lt!270033 (ite c!9211 lt!270032 #b00000000000000000000000000001000)))))

(declare-fun b!174863 () Bool)

(declare-fun e!121893 () Bool)

(assert (=> b!174863 (= e!121890 e!121893)))

(declare-fun res!144819 () Bool)

(assert (=> b!174863 (=> (not res!144819) (not e!121893))))

(assert (=> b!174863 (= res!144819 e!121889)))

(declare-fun res!144817 () Bool)

(assert (=> b!174863 (=> res!144817 e!121889)))

(assert (=> b!174863 (= res!144817 (bvsge (_1!8180 lt!270031) (_2!8180 lt!270031)))))

(assert (=> b!174863 (= lt!270032 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174863 (= lt!270033 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!254)

(assert (=> b!174863 (= lt!270031 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(declare-fun b!174864 () Bool)

(assert (=> b!174864 (= e!121893 e!121894)))

(assert (=> b!174864 (= c!9211 (= (_3!643 lt!270031) (_4!127 lt!270031)))))

(assert (= (and d!61713 (not res!144820)) b!174863))

(assert (= (and b!174863 (not res!144817)) b!174862))

(assert (= (and b!174863 res!144819) b!174864))

(assert (= (and b!174864 c!9211) b!174859))

(assert (= (and b!174864 (not c!9211)) b!174861))

(assert (= (and b!174861 res!144818) b!174858))

(assert (= (and b!174858 (not res!144816)) b!174860))

(assert (= (or b!174859 b!174861) bm!2900))

(declare-fun m!274813 () Bool)

(assert (=> b!174860 m!274813))

(declare-fun m!274815 () Bool)

(assert (=> b!174860 m!274815))

(assert (=> b!174860 m!274813))

(assert (=> b!174860 m!274815))

(declare-fun m!274817 () Bool)

(assert (=> b!174860 m!274817))

(declare-fun m!274819 () Bool)

(assert (=> b!174862 m!274819))

(declare-fun m!274821 () Bool)

(assert (=> bm!2900 m!274821))

(declare-fun m!274823 () Bool)

(assert (=> bm!2900 m!274823))

(assert (=> bm!2900 m!274821))

(assert (=> bm!2900 m!274823))

(declare-fun m!274825 () Bool)

(assert (=> bm!2900 m!274825))

(assert (=> b!174863 m!273715))

(declare-fun m!274827 () Bool)

(assert (=> b!174863 m!274827))

(assert (=> b!174513 d!61713))

(assert (=> b!174513 d!61421))

(declare-fun d!61715 () Bool)

(assert (=> d!61715 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269161) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 thiss!1187))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187))) lt!269161))))

(declare-fun bs!15371 () Bool)

(assert (= bs!15371 d!61715))

(assert (=> bs!15371 m!273801))

(assert (=> b!174488 d!61715))

(declare-fun d!61717 () Bool)

(declare-fun res!144821 () Bool)

(declare-fun e!121896 () Bool)

(assert (=> d!61717 (=> (not res!144821) (not e!121896))))

(assert (=> d!61717 (= res!144821 (= (size!4142 (buf!4573 (_2!8167 lt!268805))) (size!4142 (buf!4573 (_2!8165 lt!268745)))))))

(assert (=> d!61717 (= (isPrefixOf!0 (_2!8167 lt!268805) (_2!8165 lt!268745)) e!121896)))

(declare-fun b!174865 () Bool)

(declare-fun res!144822 () Bool)

(assert (=> b!174865 (=> (not res!144822) (not e!121896))))

(assert (=> b!174865 (= res!144822 (bvsle (bitIndex!0 (size!4142 (buf!4573 (_2!8167 lt!268805))) (currentByte!8687 (_2!8167 lt!268805)) (currentBit!8682 (_2!8167 lt!268805))) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!268745))) (currentByte!8687 (_2!8165 lt!268745)) (currentBit!8682 (_2!8165 lt!268745)))))))

(declare-fun b!174866 () Bool)

(declare-fun e!121895 () Bool)

(assert (=> b!174866 (= e!121896 e!121895)))

(declare-fun res!144823 () Bool)

(assert (=> b!174866 (=> res!144823 e!121895)))

(assert (=> b!174866 (= res!144823 (= (size!4142 (buf!4573 (_2!8167 lt!268805))) #b00000000000000000000000000000000))))

(declare-fun b!174867 () Bool)

(assert (=> b!174867 (= e!121895 (arrayBitRangesEq!0 (buf!4573 (_2!8167 lt!268805)) (buf!4573 (_2!8165 lt!268745)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 (_2!8167 lt!268805))) (currentByte!8687 (_2!8167 lt!268805)) (currentBit!8682 (_2!8167 lt!268805)))))))

(assert (= (and d!61717 res!144821) b!174865))

(assert (= (and b!174865 res!144822) b!174866))

(assert (= (and b!174866 (not res!144823)) b!174867))

(assert (=> b!174865 m!274799))

(assert (=> b!174865 m!273713))

(assert (=> b!174867 m!274799))

(assert (=> b!174867 m!274799))

(declare-fun m!274829 () Bool)

(assert (=> b!174867 m!274829))

(assert (=> b!174399 d!61717))

(assert (=> b!174395 d!61421))

(declare-fun d!61719 () Bool)

(assert (=> d!61719 (arrayBitRangesEq!0 (buf!4573 (_2!8165 lt!268745)) (buf!4573 thiss!1187) lt!268814 lt!268808)))

(declare-fun lt!270036 () Unit!12538)

(declare-fun choose!8 (array!9387 array!9387 (_ BitVec 64) (_ BitVec 64)) Unit!12538)

(assert (=> d!61719 (= lt!270036 (choose!8 (buf!4573 thiss!1187) (buf!4573 (_2!8165 lt!268745)) lt!268814 lt!268808))))

(assert (=> d!61719 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268814) (bvsle lt!268814 lt!268808))))

(assert (=> d!61719 (= (arrayBitRangesEqSymmetric!0 (buf!4573 thiss!1187) (buf!4573 (_2!8165 lt!268745)) lt!268814 lt!268808) lt!270036)))

(declare-fun bs!15372 () Bool)

(assert (= bs!15372 d!61719))

(assert (=> bs!15372 m!273783))

(declare-fun m!274831 () Bool)

(assert (=> bs!15372 m!274831))

(assert (=> b!174395 d!61719))

(declare-fun b!174868 () Bool)

(declare-fun res!144824 () Bool)

(declare-fun lt!270038 () (_ BitVec 32))

(assert (=> b!174868 (= res!144824 (= lt!270038 #b00000000000000000000000000000000))))

(declare-fun e!121899 () Bool)

(assert (=> b!174868 (=> res!144824 e!121899)))

(declare-fun e!121900 () Bool)

(assert (=> b!174868 (= e!121900 e!121899)))

(declare-fun b!174869 () Bool)

(declare-fun e!121902 () Bool)

(declare-fun call!2904 () Bool)

(assert (=> b!174869 (= e!121902 call!2904)))

(declare-fun lt!270037 () tuple4!254)

(declare-fun b!174870 () Bool)

(assert (=> b!174870 (= e!121899 (byteRangesEq!0 (select (arr!5072 (buf!4573 (_2!8165 lt!268745))) (_4!127 lt!270037)) (select (arr!5072 (buf!4573 thiss!1187)) (_4!127 lt!270037)) #b00000000000000000000000000000000 lt!270038))))

(declare-fun b!174871 () Bool)

(assert (=> b!174871 (= e!121902 e!121900)))

(declare-fun res!144826 () Bool)

(assert (=> b!174871 (= res!144826 call!2904)))

(assert (=> b!174871 (=> (not res!144826) (not e!121900))))

(declare-fun d!61721 () Bool)

(declare-fun res!144828 () Bool)

(declare-fun e!121898 () Bool)

(assert (=> d!61721 (=> res!144828 e!121898)))

(assert (=> d!61721 (= res!144828 (bvsge lt!268814 lt!268808))))

(assert (=> d!61721 (= (arrayBitRangesEq!0 (buf!4573 (_2!8165 lt!268745)) (buf!4573 thiss!1187) lt!268814 lt!268808) e!121898)))

(declare-fun e!121897 () Bool)

(declare-fun b!174872 () Bool)

(assert (=> b!174872 (= e!121897 (arrayRangesEq!689 (buf!4573 (_2!8165 lt!268745)) (buf!4573 thiss!1187) (_1!8180 lt!270037) (_2!8180 lt!270037)))))

(declare-fun bm!2901 () Bool)

(declare-fun c!9212 () Bool)

(declare-fun lt!270039 () (_ BitVec 32))

(assert (=> bm!2901 (= call!2904 (byteRangesEq!0 (select (arr!5072 (buf!4573 (_2!8165 lt!268745))) (_3!643 lt!270037)) (select (arr!5072 (buf!4573 thiss!1187)) (_3!643 lt!270037)) lt!270039 (ite c!9212 lt!270038 #b00000000000000000000000000001000)))))

(declare-fun b!174873 () Bool)

(declare-fun e!121901 () Bool)

(assert (=> b!174873 (= e!121898 e!121901)))

(declare-fun res!144827 () Bool)

(assert (=> b!174873 (=> (not res!144827) (not e!121901))))

(assert (=> b!174873 (= res!144827 e!121897)))

(declare-fun res!144825 () Bool)

(assert (=> b!174873 (=> res!144825 e!121897)))

(assert (=> b!174873 (= res!144825 (bvsge (_1!8180 lt!270037) (_2!8180 lt!270037)))))

(assert (=> b!174873 (= lt!270038 ((_ extract 31 0) (bvsrem lt!268808 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174873 (= lt!270039 ((_ extract 31 0) (bvsrem lt!268814 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174873 (= lt!270037 (arrayBitIndices!0 lt!268814 lt!268808))))

(declare-fun b!174874 () Bool)

(assert (=> b!174874 (= e!121901 e!121902)))

(assert (=> b!174874 (= c!9212 (= (_3!643 lt!270037) (_4!127 lt!270037)))))

(assert (= (and d!61721 (not res!144828)) b!174873))

(assert (= (and b!174873 (not res!144825)) b!174872))

(assert (= (and b!174873 res!144827) b!174874))

(assert (= (and b!174874 c!9212) b!174869))

(assert (= (and b!174874 (not c!9212)) b!174871))

(assert (= (and b!174871 res!144826) b!174868))

(assert (= (and b!174868 (not res!144824)) b!174870))

(assert (= (or b!174869 b!174871) bm!2901))

(declare-fun m!274833 () Bool)

(assert (=> b!174870 m!274833))

(declare-fun m!274835 () Bool)

(assert (=> b!174870 m!274835))

(assert (=> b!174870 m!274833))

(assert (=> b!174870 m!274835))

(declare-fun m!274837 () Bool)

(assert (=> b!174870 m!274837))

(declare-fun m!274839 () Bool)

(assert (=> b!174872 m!274839))

(declare-fun m!274841 () Bool)

(assert (=> bm!2901 m!274841))

(declare-fun m!274843 () Bool)

(assert (=> bm!2901 m!274843))

(assert (=> bm!2901 m!274841))

(assert (=> bm!2901 m!274843))

(declare-fun m!274845 () Bool)

(assert (=> bm!2901 m!274845))

(declare-fun m!274847 () Bool)

(assert (=> b!174873 m!274847))

(assert (=> b!174395 d!61721))

(declare-fun d!61723 () Bool)

(assert (=> d!61723 (= (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187))) (bvsub (bvmul ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!268745)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8687 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8682 thiss!1187)))))))

(assert (=> d!61399 d!61723))

(declare-fun d!61725 () Bool)

(declare-fun res!144829 () Bool)

(declare-fun e!121904 () Bool)

(assert (=> d!61725 (=> (not res!144829) (not e!121904))))

(assert (=> d!61725 (= res!144829 (= (size!4142 (buf!4573 (_1!8167 lt!268805))) (size!4142 (buf!4573 thiss!1187))))))

(assert (=> d!61725 (= (isPrefixOf!0 (_1!8167 lt!268805) thiss!1187) e!121904)))

(declare-fun b!174875 () Bool)

(declare-fun res!144830 () Bool)

(assert (=> b!174875 (=> (not res!144830) (not e!121904))))

(assert (=> b!174875 (= res!144830 (bvsle (bitIndex!0 (size!4142 (buf!4573 (_1!8167 lt!268805))) (currentByte!8687 (_1!8167 lt!268805)) (currentBit!8682 (_1!8167 lt!268805))) (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(declare-fun b!174876 () Bool)

(declare-fun e!121903 () Bool)

(assert (=> b!174876 (= e!121904 e!121903)))

(declare-fun res!144831 () Bool)

(assert (=> b!174876 (=> res!144831 e!121903)))

(assert (=> b!174876 (= res!144831 (= (size!4142 (buf!4573 (_1!8167 lt!268805))) #b00000000000000000000000000000000))))

(declare-fun b!174877 () Bool)

(assert (=> b!174877 (= e!121903 (arrayBitRangesEq!0 (buf!4573 (_1!8167 lt!268805)) (buf!4573 thiss!1187) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 (_1!8167 lt!268805))) (currentByte!8687 (_1!8167 lt!268805)) (currentBit!8682 (_1!8167 lt!268805)))))))

(assert (= (and d!61725 res!144829) b!174875))

(assert (= (and b!174875 res!144830) b!174876))

(assert (= (and b!174876 (not res!144831)) b!174877))

(assert (=> b!174875 m!274797))

(assert (=> b!174875 m!273715))

(assert (=> b!174877 m!274797))

(assert (=> b!174877 m!274797))

(declare-fun m!274849 () Bool)

(assert (=> b!174877 m!274849))

(assert (=> b!174396 d!61725))

(assert (=> b!174499 d!61689))

(assert (=> d!61457 d!61681))

(declare-fun d!61727 () Bool)

(declare-fun e!121905 () Bool)

(assert (=> d!61727 e!121905))

(declare-fun res!144832 () Bool)

(assert (=> d!61727 (=> (not res!144832) (not e!121905))))

(declare-fun lt!270040 () BitStream!7392)

(declare-fun lt!270041 () (_ BitVec 64))

(assert (=> d!61727 (= res!144832 (= (bvadd lt!270041 (bvsub lt!268807 lt!268815)) (bitIndex!0 (size!4142 (buf!4573 lt!270040)) (currentByte!8687 lt!270040) (currentBit!8682 lt!270040))))))

(assert (=> d!61727 (or (not (= (bvand lt!270041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268807 lt!268815) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!270041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!270041 (bvsub lt!268807 lt!268815)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61727 (= lt!270041 (bitIndex!0 (size!4142 (buf!4573 (_2!8167 lt!268805))) (currentByte!8687 (_2!8167 lt!268805)) (currentBit!8682 (_2!8167 lt!268805))))))

(assert (=> d!61727 (= lt!270040 (_2!8165 (moveBitIndex!0 (_2!8167 lt!268805) (bvsub lt!268807 lt!268815))))))

(assert (=> d!61727 (moveBitIndexPrecond!0 (_2!8167 lt!268805) (bvsub lt!268807 lt!268815))))

(assert (=> d!61727 (= (withMovedBitIndex!0 (_2!8167 lt!268805) (bvsub lt!268807 lt!268815)) lt!270040)))

(declare-fun b!174878 () Bool)

(assert (=> b!174878 (= e!121905 (= (size!4142 (buf!4573 (_2!8167 lt!268805))) (size!4142 (buf!4573 lt!270040))))))

(assert (= (and d!61727 res!144832) b!174878))

(declare-fun m!274851 () Bool)

(assert (=> d!61727 m!274851))

(assert (=> d!61727 m!274799))

(declare-fun m!274853 () Bool)

(assert (=> d!61727 m!274853))

(declare-fun m!274855 () Bool)

(assert (=> d!61727 m!274855))

(assert (=> b!174397 d!61727))

(assert (=> b!174397 d!61409))

(assert (=> b!174397 d!61421))

(declare-fun d!61729 () Bool)

(declare-fun res!144833 () Bool)

(declare-fun e!121907 () Bool)

(assert (=> d!61729 (=> (not res!144833) (not e!121907))))

(assert (=> d!61729 (= res!144833 (= (size!4142 (buf!4573 thiss!1187)) (size!4142 (buf!4573 (_2!8165 lt!269129)))))))

(assert (=> d!61729 (= (isPrefixOf!0 thiss!1187 (_2!8165 lt!269129)) e!121907)))

(declare-fun b!174879 () Bool)

(declare-fun res!144834 () Bool)

(assert (=> b!174879 (=> (not res!144834) (not e!121907))))

(assert (=> b!174879 (= res!144834 (bvsle (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)) (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269129))) (currentByte!8687 (_2!8165 lt!269129)) (currentBit!8682 (_2!8165 lt!269129)))))))

(declare-fun b!174880 () Bool)

(declare-fun e!121906 () Bool)

(assert (=> b!174880 (= e!121907 e!121906)))

(declare-fun res!144835 () Bool)

(assert (=> b!174880 (=> res!144835 e!121906)))

(assert (=> b!174880 (= res!144835 (= (size!4142 (buf!4573 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174881 () Bool)

(assert (=> b!174881 (= e!121906 (arrayBitRangesEq!0 (buf!4573 thiss!1187) (buf!4573 (_2!8165 lt!269129)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(assert (= (and d!61729 res!144833) b!174879))

(assert (= (and b!174879 res!144834) b!174880))

(assert (= (and b!174880 (not res!144835)) b!174881))

(assert (=> b!174879 m!273715))

(assert (=> b!174879 m!273957))

(assert (=> b!174881 m!273715))

(assert (=> b!174881 m!273715))

(declare-fun m!274857 () Bool)

(assert (=> b!174881 m!274857))

(assert (=> b!174498 d!61729))

(declare-fun d!61731 () Bool)

(assert (=> d!61731 (= (invariant!0 (currentBit!8682 (_2!8165 lt!269129)) (currentByte!8687 (_2!8165 lt!269129)) (size!4142 (buf!4573 (_2!8165 lt!269129)))) (and (bvsge (currentBit!8682 (_2!8165 lt!269129)) #b00000000000000000000000000000000) (bvslt (currentBit!8682 (_2!8165 lt!269129)) #b00000000000000000000000000001000) (bvsge (currentByte!8687 (_2!8165 lt!269129)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8687 (_2!8165 lt!269129)) (size!4142 (buf!4573 (_2!8165 lt!269129)))) (and (= (currentBit!8682 (_2!8165 lt!269129)) #b00000000000000000000000000000000) (= (currentByte!8687 (_2!8165 lt!269129)) (size!4142 (buf!4573 (_2!8165 lt!269129))))))))))

(assert (=> d!61433 d!61731))

(assert (=> b!174511 d!61421))

(assert (=> b!174511 d!61409))

(assert (=> b!174501 d!61631))

(declare-fun d!61733 () Bool)

(assert (=> d!61733 (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269129)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269161)))

(declare-fun lt!270042 () Unit!12538)

(assert (=> d!61733 (= lt!270042 (choose!9 thiss!1187 (buf!4573 (_2!8165 lt!269129)) lt!269161 (BitStream!7393 (buf!4573 (_2!8165 lt!269129)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187))))))

(assert (=> d!61733 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4573 (_2!8165 lt!269129)) lt!269161) lt!270042)))

(declare-fun bs!15373 () Bool)

(assert (= bs!15373 d!61733))

(assert (=> bs!15373 m!273953))

(declare-fun m!274859 () Bool)

(assert (=> bs!15373 m!274859))

(assert (=> b!174501 d!61733))

(declare-fun d!61735 () Bool)

(declare-fun lt!270043 () tuple2!15058)

(assert (=> d!61735 (= lt!270043 (readNBitsLSBFirstsLoop!0 (_1!8167 lt!269163) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(assert (=> d!61735 (= (readNBitsLSBFirstsLoopPure!0 (_1!8167 lt!269163) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))) (tuple2!15049 (_2!8171 lt!270043) (_1!8171 lt!270043)))))

(declare-fun bs!15374 () Bool)

(assert (= bs!15374 d!61735))

(declare-fun m!274861 () Bool)

(assert (=> bs!15374 m!274861))

(assert (=> b!174501 d!61735))

(declare-fun d!61737 () Bool)

(assert (=> d!61737 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269129)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187)) lt!269161) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4142 (buf!4573 (_2!8165 lt!269129)))) ((_ sign_extend 32) (currentByte!8687 thiss!1187)) ((_ sign_extend 32) (currentBit!8682 thiss!1187))) lt!269161))))

(declare-fun bs!15375 () Bool)

(assert (= bs!15375 d!61737))

(declare-fun m!274863 () Bool)

(assert (=> bs!15375 m!274863))

(assert (=> b!174501 d!61737))

(declare-fun b!174882 () Bool)

(declare-fun e!121908 () Unit!12538)

(declare-fun lt!270056 () Unit!12538)

(assert (=> b!174882 (= e!121908 lt!270056)))

(declare-fun lt!270057 () (_ BitVec 64))

(assert (=> b!174882 (= lt!270057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!270051 () (_ BitVec 64))

(assert (=> b!174882 (= lt!270051 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(assert (=> b!174882 (= lt!270056 (arrayBitRangesEqSymmetric!0 (buf!4573 thiss!1187) (buf!4573 (_2!8165 lt!269129)) lt!270057 lt!270051))))

(assert (=> b!174882 (arrayBitRangesEq!0 (buf!4573 (_2!8165 lt!269129)) (buf!4573 thiss!1187) lt!270057 lt!270051)))

(declare-fun b!174883 () Bool)

(declare-fun res!144836 () Bool)

(declare-fun e!121909 () Bool)

(assert (=> b!174883 (=> (not res!144836) (not e!121909))))

(declare-fun lt!270048 () tuple2!15050)

(assert (=> b!174883 (= res!144836 (isPrefixOf!0 (_1!8167 lt!270048) thiss!1187))))

(declare-fun b!174884 () Bool)

(declare-fun lt!270058 () (_ BitVec 64))

(declare-fun lt!270050 () (_ BitVec 64))

(assert (=> b!174884 (= e!121909 (= (_1!8167 lt!270048) (withMovedBitIndex!0 (_2!8167 lt!270048) (bvsub lt!270050 lt!270058))))))

(assert (=> b!174884 (or (= (bvand lt!270050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270058 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270050 lt!270058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174884 (= lt!270058 (bitIndex!0 (size!4142 (buf!4573 (_2!8165 lt!269129))) (currentByte!8687 (_2!8165 lt!269129)) (currentBit!8682 (_2!8165 lt!269129))))))

(assert (=> b!174884 (= lt!270050 (bitIndex!0 (size!4142 (buf!4573 thiss!1187)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(declare-fun d!61739 () Bool)

(assert (=> d!61739 e!121909))

(declare-fun res!144838 () Bool)

(assert (=> d!61739 (=> (not res!144838) (not e!121909))))

(assert (=> d!61739 (= res!144838 (isPrefixOf!0 (_1!8167 lt!270048) (_2!8167 lt!270048)))))

(declare-fun lt!270061 () BitStream!7392)

(assert (=> d!61739 (= lt!270048 (tuple2!15051 lt!270061 (_2!8165 lt!269129)))))

(declare-fun lt!270049 () Unit!12538)

(declare-fun lt!270060 () Unit!12538)

(assert (=> d!61739 (= lt!270049 lt!270060)))

(assert (=> d!61739 (isPrefixOf!0 lt!270061 (_2!8165 lt!269129))))

(assert (=> d!61739 (= lt!270060 (lemmaIsPrefixTransitive!0 lt!270061 (_2!8165 lt!269129) (_2!8165 lt!269129)))))

(declare-fun lt!270052 () Unit!12538)

(declare-fun lt!270045 () Unit!12538)

(assert (=> d!61739 (= lt!270052 lt!270045)))

(assert (=> d!61739 (isPrefixOf!0 lt!270061 (_2!8165 lt!269129))))

(assert (=> d!61739 (= lt!270045 (lemmaIsPrefixTransitive!0 lt!270061 thiss!1187 (_2!8165 lt!269129)))))

(declare-fun lt!270053 () Unit!12538)

(assert (=> d!61739 (= lt!270053 e!121908)))

(declare-fun c!9213 () Bool)

(assert (=> d!61739 (= c!9213 (not (= (size!4142 (buf!4573 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!270054 () Unit!12538)

(declare-fun lt!270059 () Unit!12538)

(assert (=> d!61739 (= lt!270054 lt!270059)))

(assert (=> d!61739 (isPrefixOf!0 (_2!8165 lt!269129) (_2!8165 lt!269129))))

(assert (=> d!61739 (= lt!270059 (lemmaIsPrefixRefl!0 (_2!8165 lt!269129)))))

(declare-fun lt!270046 () Unit!12538)

(declare-fun lt!270055 () Unit!12538)

(assert (=> d!61739 (= lt!270046 lt!270055)))

(assert (=> d!61739 (= lt!270055 (lemmaIsPrefixRefl!0 (_2!8165 lt!269129)))))

(declare-fun lt!270063 () Unit!12538)

(declare-fun lt!270044 () Unit!12538)

(assert (=> d!61739 (= lt!270063 lt!270044)))

(assert (=> d!61739 (isPrefixOf!0 lt!270061 lt!270061)))

(assert (=> d!61739 (= lt!270044 (lemmaIsPrefixRefl!0 lt!270061))))

(declare-fun lt!270062 () Unit!12538)

(declare-fun lt!270047 () Unit!12538)

(assert (=> d!61739 (= lt!270062 lt!270047)))

(assert (=> d!61739 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61739 (= lt!270047 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61739 (= lt!270061 (BitStream!7393 (buf!4573 (_2!8165 lt!269129)) (currentByte!8687 thiss!1187) (currentBit!8682 thiss!1187)))))

(assert (=> d!61739 (isPrefixOf!0 thiss!1187 (_2!8165 lt!269129))))

(assert (=> d!61739 (= (reader!0 thiss!1187 (_2!8165 lt!269129)) lt!270048)))

(declare-fun b!174885 () Bool)

(declare-fun Unit!12605 () Unit!12538)

(assert (=> b!174885 (= e!121908 Unit!12605)))

(declare-fun b!174886 () Bool)

(declare-fun res!144837 () Bool)

(assert (=> b!174886 (=> (not res!144837) (not e!121909))))

(assert (=> b!174886 (= res!144837 (isPrefixOf!0 (_2!8167 lt!270048) (_2!8165 lt!269129)))))

(assert (= (and d!61739 c!9213) b!174882))

(assert (= (and d!61739 (not c!9213)) b!174885))

(assert (= (and d!61739 res!144838) b!174883))

(assert (= (and b!174883 res!144836) b!174886))

(assert (= (and b!174886 res!144837) b!174884))

(declare-fun m!274865 () Bool)

(assert (=> b!174883 m!274865))

(declare-fun m!274867 () Bool)

(assert (=> b!174884 m!274867))

(assert (=> b!174884 m!273957))

(assert (=> b!174884 m!273715))

(declare-fun m!274869 () Bool)

(assert (=> d!61739 m!274869))

(declare-fun m!274871 () Bool)

(assert (=> d!61739 m!274871))

(assert (=> d!61739 m!273765))

(assert (=> d!61739 m!273959))

(declare-fun m!274873 () Bool)

(assert (=> d!61739 m!274873))

(declare-fun m!274875 () Bool)

(assert (=> d!61739 m!274875))

(declare-fun m!274877 () Bool)

(assert (=> d!61739 m!274877))

(declare-fun m!274879 () Bool)

(assert (=> d!61739 m!274879))

(assert (=> d!61739 m!273775))

(declare-fun m!274881 () Bool)

(assert (=> d!61739 m!274881))

(declare-fun m!274883 () Bool)

(assert (=> d!61739 m!274883))

(assert (=> b!174882 m!273715))

(declare-fun m!274885 () Bool)

(assert (=> b!174882 m!274885))

(declare-fun m!274887 () Bool)

(assert (=> b!174882 m!274887))

(declare-fun m!274889 () Bool)

(assert (=> b!174886 m!274889))

(assert (=> b!174501 d!61739))

(assert (=> b!174501 d!61395))

(check-sat (not d!61687) (not b!174830) (not b!174808) (not b!174832) (not d!61735) (not d!61643) (not d!61653) (not b!174867) (not d!61709) (not d!61629) (not d!61665) (not b!174770) (not b!174780) (not b!174794) (not d!61715) (not d!61727) (not d!61649) (not b!174821) (not b!174862) (not d!61655) (not d!61707) (not b!174756) (not b!174865) (not d!61685) (not d!61647) (not b!174843) (not d!61719) (not d!61611) (not b!174886) (not bm!2897) (not b!174863) (not bm!2900) (not d!61627) (not b!174826) (not d!61635) (not d!61737) (not b!174776) (not b!174820) (not b!174777) (not d!61677) (not b!174796) (not b!174782) (not d!61637) (not b!174775) (not d!61621) (not d!61639) (not b!174873) (not d!61705) (not d!61733) (not b!174758) (not b!174823) (not b!174772) (not d!61675) (not d!61679) (not b!174807) (not b!174824) (not bm!2901) (not b!174804) (not d!61663) (not b!174760) (not d!61625) (not d!61623) (not b!174872) (not d!61633) (not b!174881) (not b!174838) (not b!174877) (not b!174879) (not d!61703) (not b!174809) (not d!61695) (not b!174827) (not b!174802) (not b!174833) (not b!174835) (not b!174829) (not b!174811) (not b!174793) (not b!174883) (not d!61641) (not b!174795) (not b!174779) (not d!61683) (not d!61645) (not d!61607) (not d!61617) (not b!174860) (not d!61689) (not d!61657) (not b!174884) (not b!174841) (not b!174769) (not b!174882) (not b!174870) (not d!61613) (not b!174757) (not b!174875) (not d!61619) (not d!61659) (not d!61739) (not d!61667) (not d!61661))
(check-sat)
