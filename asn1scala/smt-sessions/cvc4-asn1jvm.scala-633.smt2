; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17846 () Bool)

(assert start!17846)

(declare-fun b!87129 () Bool)

(declare-fun res!71650 () Bool)

(declare-fun e!57800 () Bool)

(assert (=> b!87129 (=> res!71650 e!57800)))

(declare-datatypes ((Unit!5735 0))(
  ( (Unit!5736) )
))
(declare-datatypes ((array!4114 0))(
  ( (array!4115 (arr!2495 (Array (_ BitVec 32) (_ BitVec 8))) (size!1858 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3278 0))(
  ( (BitStream!3279 (buf!2248 array!4114) (currentByte!4463 (_ BitVec 32)) (currentBit!4458 (_ BitVec 32))) )
))
(declare-datatypes ((tuple3!416 0))(
  ( (tuple3!417 (_1!3916 Unit!5735) (_2!3916 BitStream!3278) (_3!232 (_ BitVec 32))) )
))
(declare-fun lt!135519 () tuple3!416)

(declare-fun thiss!1151 () BitStream!3278)

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!87129 (= res!71650 (or (bvsgt (_3!232 lt!135519) nBits!336) (not (= (size!1858 (buf!2248 (_2!3916 lt!135519))) (size!1858 (buf!2248 thiss!1151))))))))

(declare-fun res!71652 () Bool)

(declare-fun e!57802 () Bool)

(assert (=> start!17846 (=> (not res!71652) (not e!57802))))

(assert (=> start!17846 (= res!71652 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17846 e!57802))

(declare-fun thiss!1152 () BitStream!3278)

(declare-fun e!57796 () Bool)

(declare-fun inv!12 (BitStream!3278) Bool)

(assert (=> start!17846 (and (inv!12 thiss!1152) e!57796)))

(declare-fun e!57804 () Bool)

(assert (=> start!17846 (and (inv!12 thiss!1151) e!57804)))

(assert (=> start!17846 true))

(declare-fun b!87130 () Bool)

(declare-fun res!71647 () Bool)

(assert (=> b!87130 (=> res!71647 e!57800)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87130 (= res!71647 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4458 (_2!3916 lt!135519)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4463 (_2!3916 lt!135519)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1858 (buf!2248 (_2!3916 lt!135519))))))))))

(declare-fun b!87131 () Bool)

(declare-fun res!71641 () Bool)

(assert (=> b!87131 (=> (not res!71641) (not e!57802))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87131 (= res!71641 (validate_offset_bits!1 ((_ sign_extend 32) (size!1858 (buf!2248 thiss!1151))) ((_ sign_extend 32) (currentByte!4463 thiss!1151)) ((_ sign_extend 32) (currentBit!4458 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87132 () Bool)

(declare-fun res!71636 () Bool)

(declare-fun e!57798 () Bool)

(assert (=> b!87132 (=> (not res!71636) (not e!57798))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!87132 (= res!71636 (bvslt i!576 nBits!336))))

(declare-fun b!87133 () Bool)

(assert (=> b!87133 (= e!57800 (bvsge ((_ sign_extend 32) (bvsub nBits!336 (_3!232 lt!135519))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87134 () Bool)

(declare-fun e!57799 () Bool)

(declare-fun e!57803 () Bool)

(assert (=> b!87134 (= e!57799 e!57803)))

(declare-fun res!71644 () Bool)

(assert (=> b!87134 (=> (not res!71644) (not e!57803))))

(declare-fun lt!135516 () (_ BitVec 64))

(declare-fun lt!135517 () (_ BitVec 64))

(assert (=> b!87134 (= res!71644 (= lt!135516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135517)))))

(declare-datatypes ((tuple2!7368 0))(
  ( (tuple2!7369 (_1!3917 Unit!5735) (_2!3917 BitStream!3278)) )
))
(declare-fun lt!135518 () tuple2!7368)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87134 (= lt!135516 (bitIndex!0 (size!1858 (buf!2248 (_2!3917 lt!135518))) (currentByte!4463 (_2!3917 lt!135518)) (currentBit!4458 (_2!3917 lt!135518))))))

(declare-fun b!87135 () Bool)

(declare-fun res!71648 () Bool)

(assert (=> b!87135 (=> (not res!71648) (not e!57802))))

(assert (=> b!87135 (= res!71648 (and (bvsle i!576 nBits!336) (= (size!1858 (buf!2248 thiss!1152)) (size!1858 (buf!2248 thiss!1151)))))))

(declare-fun b!87136 () Bool)

(declare-fun res!71643 () Bool)

(assert (=> b!87136 (=> res!71643 e!57800)))

(declare-fun lt!135515 () (_ BitVec 64))

(assert (=> b!87136 (= res!71643 (not (= (bitIndex!0 (size!1858 (buf!2248 (_2!3916 lt!135519))) (currentByte!4463 (_2!3916 lt!135519)) (currentBit!4458 (_2!3916 lt!135519))) (bvadd lt!135515 ((_ sign_extend 32) (_3!232 lt!135519))))))))

(declare-fun b!87137 () Bool)

(declare-fun res!71642 () Bool)

(assert (=> b!87137 (=> (not res!71642) (not e!57803))))

(declare-fun isPrefixOf!0 (BitStream!3278 BitStream!3278) Bool)

(assert (=> b!87137 (= res!71642 (isPrefixOf!0 thiss!1152 (_2!3917 lt!135518)))))

(declare-fun b!87138 () Bool)

(declare-fun res!71645 () Bool)

(assert (=> b!87138 (=> (not res!71645) (not e!57798))))

(assert (=> b!87138 (= res!71645 (validate_offset_bits!1 ((_ sign_extend 32) (size!1858 (buf!2248 thiss!1152))) ((_ sign_extend 32) (currentByte!4463 thiss!1152)) ((_ sign_extend 32) (currentBit!4458 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87139 () Bool)

(declare-fun res!71651 () Bool)

(declare-fun e!57794 () Bool)

(assert (=> b!87139 (=> res!71651 e!57794)))

(assert (=> b!87139 (= res!71651 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!87140 () Bool)

(declare-fun e!57797 () Bool)

(assert (=> b!87140 (= e!57803 e!57797)))

(declare-fun res!71646 () Bool)

(assert (=> b!87140 (=> (not res!71646) (not e!57797))))

(declare-fun lt!135513 () Bool)

(declare-datatypes ((tuple2!7370 0))(
  ( (tuple2!7371 (_1!3918 BitStream!3278) (_2!3918 Bool)) )
))
(declare-fun lt!135514 () tuple2!7370)

(assert (=> b!87140 (= res!71646 (and (= (_2!3918 lt!135514) lt!135513) (= (_1!3918 lt!135514) (_2!3917 lt!135518))))))

(declare-fun readBitPure!0 (BitStream!3278) tuple2!7370)

(declare-fun readerFrom!0 (BitStream!3278 (_ BitVec 32) (_ BitVec 32)) BitStream!3278)

(assert (=> b!87140 (= lt!135514 (readBitPure!0 (readerFrom!0 (_2!3917 lt!135518) (currentBit!4458 thiss!1152) (currentByte!4463 thiss!1152))))))

(declare-fun b!87141 () Bool)

(assert (=> b!87141 (= e!57798 (not e!57794))))

(declare-fun res!71637 () Bool)

(assert (=> b!87141 (=> res!71637 e!57794)))

(assert (=> b!87141 (= res!71637 (not (invariant!0 (currentBit!4458 (_2!3917 lt!135518)) (currentByte!4463 (_2!3917 lt!135518)) (size!1858 (buf!2248 (_2!3917 lt!135518))))))))

(assert (=> b!87141 e!57799))

(declare-fun res!71655 () Bool)

(assert (=> b!87141 (=> (not res!71655) (not e!57799))))

(assert (=> b!87141 (= res!71655 (= (size!1858 (buf!2248 thiss!1152)) (size!1858 (buf!2248 (_2!3917 lt!135518)))))))

(declare-fun appendBit!0 (BitStream!3278 Bool) tuple2!7368)

(assert (=> b!87141 (= lt!135518 (appendBit!0 thiss!1152 lt!135513))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87141 (= lt!135513 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87142 () Bool)

(declare-fun res!71639 () Bool)

(assert (=> b!87142 (=> (not res!71639) (not e!57802))))

(assert (=> b!87142 (= res!71639 (invariant!0 (currentBit!4458 thiss!1151) (currentByte!4463 thiss!1151) (size!1858 (buf!2248 thiss!1151))))))

(declare-fun b!87143 () Bool)

(declare-fun res!71653 () Bool)

(assert (=> b!87143 (=> (not res!71653) (not e!57802))))

(assert (=> b!87143 (= res!71653 (invariant!0 (currentBit!4458 thiss!1152) (currentByte!4463 thiss!1152) (size!1858 (buf!2248 thiss!1152))))))

(declare-fun b!87144 () Bool)

(declare-fun array_inv!1704 (array!4114) Bool)

(assert (=> b!87144 (= e!57796 (array_inv!1704 (buf!2248 thiss!1152)))))

(declare-fun b!87145 () Bool)

(assert (=> b!87145 (= e!57794 e!57800)))

(declare-fun res!71656 () Bool)

(assert (=> b!87145 (=> res!71656 e!57800)))

(assert (=> b!87145 (= res!71656 (bvslt (_3!232 lt!135519) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3278 (_ BitVec 64) BitStream!3278 (_ BitVec 32)) tuple3!416)

(assert (=> b!87145 (= lt!135519 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3917 lt!135518) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!87146 () Bool)

(declare-fun res!71638 () Bool)

(assert (=> b!87146 (=> res!71638 e!57800)))

(assert (=> b!87146 (= res!71638 (or (bvsgt ((_ sign_extend 32) (size!1858 (buf!2248 (_2!3916 lt!135519)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4463 (_2!3916 lt!135519))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4458 (_2!3916 lt!135519))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1858 (buf!2248 (_2!3916 lt!135519)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4463 (_2!3916 lt!135519))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4458 (_2!3916 lt!135519))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87147 () Bool)

(declare-fun res!71654 () Bool)

(assert (=> b!87147 (=> res!71654 e!57800)))

(assert (=> b!87147 (= res!71654 (not (invariant!0 (currentBit!4458 (_2!3916 lt!135519)) (currentByte!4463 (_2!3916 lt!135519)) (size!1858 (buf!2248 (_2!3916 lt!135519))))))))

(declare-fun b!87148 () Bool)

(assert (=> b!87148 (= e!57804 (array_inv!1704 (buf!2248 thiss!1151)))))

(declare-fun b!87149 () Bool)

(assert (=> b!87149 (= e!57802 e!57798)))

(declare-fun res!71640 () Bool)

(assert (=> b!87149 (=> (not res!71640) (not e!57798))))

(assert (=> b!87149 (= res!71640 (= lt!135517 (bvadd lt!135515 ((_ sign_extend 32) i!576))))))

(assert (=> b!87149 (= lt!135517 (bitIndex!0 (size!1858 (buf!2248 thiss!1152)) (currentByte!4463 thiss!1152) (currentBit!4458 thiss!1152)))))

(assert (=> b!87149 (= lt!135515 (bitIndex!0 (size!1858 (buf!2248 thiss!1151)) (currentByte!4463 thiss!1151) (currentBit!4458 thiss!1151)))))

(declare-fun b!87150 () Bool)

(assert (=> b!87150 (= e!57797 (= (bitIndex!0 (size!1858 (buf!2248 (_1!3918 lt!135514))) (currentByte!4463 (_1!3918 lt!135514)) (currentBit!4458 (_1!3918 lt!135514))) lt!135516))))

(declare-fun b!87151 () Bool)

(declare-fun res!71649 () Bool)

(assert (=> b!87151 (=> (not res!71649) (not e!57802))))

(assert (=> b!87151 (= res!71649 (bvsge i!576 #b00000000000000000000000000000000))))

(assert (= (and start!17846 res!71652) b!87131))

(assert (= (and b!87131 res!71641) b!87142))

(assert (= (and b!87142 res!71639) b!87151))

(assert (= (and b!87151 res!71649) b!87143))

(assert (= (and b!87143 res!71653) b!87135))

(assert (= (and b!87135 res!71648) b!87149))

(assert (= (and b!87149 res!71640) b!87138))

(assert (= (and b!87138 res!71645) b!87132))

(assert (= (and b!87132 res!71636) b!87141))

(assert (= (and b!87141 res!71655) b!87134))

(assert (= (and b!87134 res!71644) b!87137))

(assert (= (and b!87137 res!71642) b!87140))

(assert (= (and b!87140 res!71646) b!87150))

(assert (= (and b!87141 (not res!71637)) b!87139))

(assert (= (and b!87139 (not res!71651)) b!87145))

(assert (= (and b!87145 (not res!71656)) b!87147))

(assert (= (and b!87147 (not res!71654)) b!87129))

(assert (= (and b!87129 (not res!71650)) b!87136))

(assert (= (and b!87136 (not res!71643)) b!87146))

(assert (= (and b!87146 (not res!71638)) b!87130))

(assert (= (and b!87130 (not res!71647)) b!87133))

(assert (= start!17846 b!87144))

(assert (= start!17846 b!87148))

(declare-fun m!132701 () Bool)

(assert (=> b!87145 m!132701))

(declare-fun m!132703 () Bool)

(assert (=> b!87130 m!132703))

(declare-fun m!132705 () Bool)

(assert (=> b!87134 m!132705))

(declare-fun m!132707 () Bool)

(assert (=> b!87142 m!132707))

(declare-fun m!132709 () Bool)

(assert (=> b!87140 m!132709))

(assert (=> b!87140 m!132709))

(declare-fun m!132711 () Bool)

(assert (=> b!87140 m!132711))

(declare-fun m!132713 () Bool)

(assert (=> b!87147 m!132713))

(declare-fun m!132715 () Bool)

(assert (=> b!87131 m!132715))

(declare-fun m!132717 () Bool)

(assert (=> b!87143 m!132717))

(declare-fun m!132719 () Bool)

(assert (=> b!87137 m!132719))

(declare-fun m!132721 () Bool)

(assert (=> b!87150 m!132721))

(declare-fun m!132723 () Bool)

(assert (=> b!87148 m!132723))

(declare-fun m!132725 () Bool)

(assert (=> b!87144 m!132725))

(declare-fun m!132727 () Bool)

(assert (=> b!87141 m!132727))

(declare-fun m!132729 () Bool)

(assert (=> b!87141 m!132729))

(declare-fun m!132731 () Bool)

(assert (=> b!87149 m!132731))

(declare-fun m!132733 () Bool)

(assert (=> b!87149 m!132733))

(declare-fun m!132735 () Bool)

(assert (=> b!87138 m!132735))

(declare-fun m!132737 () Bool)

(assert (=> start!17846 m!132737))

(declare-fun m!132739 () Bool)

(assert (=> start!17846 m!132739))

(declare-fun m!132741 () Bool)

(assert (=> b!87136 m!132741))

(push 1)

(assert (not b!87148))

(assert (not b!87149))

(assert (not start!17846))

(assert (not b!87150))

(assert (not b!87134))

(assert (not b!87143))

(assert (not b!87147))

(assert (not b!87141))

(assert (not b!87138))

(assert (not b!87131))

(assert (not b!87140))

(assert (not b!87137))

(assert (not b!87136))

(assert (not b!87142))

(assert (not b!87144))

(assert (not b!87145))

(assert (not b!87130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

