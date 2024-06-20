; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17868 () Bool)

(assert start!17868)

(declare-fun b!87674 () Bool)

(declare-fun res!72117 () Bool)

(declare-fun e!58110 () Bool)

(assert (=> b!87674 (=> (not res!72117) (not e!58110))))

(declare-datatypes ((array!4136 0))(
  ( (array!4137 (arr!2506 (Array (_ BitVec 32) (_ BitVec 8))) (size!1869 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3300 0))(
  ( (BitStream!3301 (buf!2259 array!4136) (currentByte!4474 (_ BitVec 32)) (currentBit!4469 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3300)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87674 (= res!72117 (validate_offset_bits!1 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1151))) ((_ sign_extend 32) (currentByte!4474 thiss!1151)) ((_ sign_extend 32) (currentBit!4469 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87675 () Bool)

(declare-fun res!72129 () Bool)

(declare-fun e!58111 () Bool)

(assert (=> b!87675 (=> res!72129 e!58111)))

(declare-fun i!576 () (_ BitVec 32))

(declare-datatypes ((Unit!5757 0))(
  ( (Unit!5758) )
))
(declare-datatypes ((tuple2!7412 0))(
  ( (tuple2!7413 (_1!3939 Unit!5757) (_2!3939 BitStream!3300)) )
))
(declare-fun lt!135717 () tuple2!7412)

(declare-fun lt!135713 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87675 (= res!72129 (not (= (bitIndex!0 (size!1869 (buf!2259 (_2!3939 lt!135717))) (currentByte!4474 (_2!3939 lt!135717)) (currentBit!4469 (_2!3939 lt!135717))) (bvadd lt!135713 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!87676 () Bool)

(declare-fun res!72130 () Bool)

(declare-fun e!58107 () Bool)

(assert (=> b!87676 (=> (not res!72130) (not e!58107))))

(declare-fun thiss!1152 () BitStream!3300)

(declare-fun isPrefixOf!0 (BitStream!3300 BitStream!3300) Bool)

(assert (=> b!87676 (= res!72130 (isPrefixOf!0 thiss!1152 (_2!3939 lt!135717)))))

(declare-fun b!87677 () Bool)

(declare-fun res!72122 () Bool)

(assert (=> b!87677 (=> (not res!72122) (not e!58110))))

(assert (=> b!87677 (= res!72122 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87678 () Bool)

(declare-fun e!58109 () Bool)

(declare-fun array_inv!1715 (array!4136) Bool)

(assert (=> b!87678 (= e!58109 (array_inv!1715 (buf!2259 thiss!1151)))))

(declare-fun b!87679 () Bool)

(declare-fun res!72124 () Bool)

(assert (=> b!87679 (=> (not res!72124) (not e!58110))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87679 (= res!72124 (invariant!0 (currentBit!4469 thiss!1152) (currentByte!4474 thiss!1152) (size!1869 (buf!2259 thiss!1152))))))

(declare-fun b!87680 () Bool)

(declare-fun res!72125 () Bool)

(assert (=> b!87680 (=> (not res!72125) (not e!58110))))

(assert (=> b!87680 (= res!72125 (invariant!0 (currentBit!4469 thiss!1151) (currentByte!4474 thiss!1151) (size!1869 (buf!2259 thiss!1151))))))

(declare-fun b!87681 () Bool)

(declare-fun res!72123 () Bool)

(declare-fun e!58114 () Bool)

(assert (=> b!87681 (=> (not res!72123) (not e!58114))))

(assert (=> b!87681 (= res!72123 (bvslt i!576 nBits!336))))

(declare-fun b!87682 () Bool)

(declare-fun res!72128 () Bool)

(assert (=> b!87682 (=> res!72128 e!58111)))

(assert (=> b!87682 (= res!72128 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1869 (buf!2259 (_2!3939 lt!135717))) (size!1869 (buf!2259 thiss!1151))))))))

(declare-fun b!87684 () Bool)

(assert (=> b!87684 (= e!58114 (not e!58111))))

(declare-fun res!72121 () Bool)

(assert (=> b!87684 (=> res!72121 e!58111)))

(assert (=> b!87684 (= res!72121 (not (invariant!0 (currentBit!4469 (_2!3939 lt!135717)) (currentByte!4474 (_2!3939 lt!135717)) (size!1869 (buf!2259 (_2!3939 lt!135717))))))))

(declare-fun e!58112 () Bool)

(assert (=> b!87684 e!58112))

(declare-fun res!72115 () Bool)

(assert (=> b!87684 (=> (not res!72115) (not e!58112))))

(assert (=> b!87684 (= res!72115 (= (size!1869 (buf!2259 thiss!1152)) (size!1869 (buf!2259 (_2!3939 lt!135717)))))))

(declare-fun lt!135715 () Bool)

(declare-fun appendBit!0 (BitStream!3300 Bool) tuple2!7412)

(assert (=> b!87684 (= lt!135717 (appendBit!0 thiss!1152 lt!135715))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87684 (= lt!135715 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87685 () Bool)

(declare-fun e!58115 () Bool)

(declare-datatypes ((tuple2!7414 0))(
  ( (tuple2!7415 (_1!3940 BitStream!3300) (_2!3940 Bool)) )
))
(declare-fun lt!135714 () tuple2!7414)

(declare-fun lt!135712 () (_ BitVec 64))

(assert (=> b!87685 (= e!58115 (= (bitIndex!0 (size!1869 (buf!2259 (_1!3940 lt!135714))) (currentByte!4474 (_1!3940 lt!135714)) (currentBit!4469 (_1!3940 lt!135714))) lt!135712))))

(declare-fun b!87686 () Bool)

(declare-fun res!72126 () Bool)

(assert (=> b!87686 (=> (not res!72126) (not e!58114))))

(assert (=> b!87686 (= res!72126 (validate_offset_bits!1 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1152))) ((_ sign_extend 32) (currentByte!4474 thiss!1152)) ((_ sign_extend 32) (currentBit!4469 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87687 () Bool)

(assert (=> b!87687 (= e!58110 e!58114)))

(declare-fun res!72118 () Bool)

(assert (=> b!87687 (=> (not res!72118) (not e!58114))))

(declare-fun lt!135716 () (_ BitVec 64))

(assert (=> b!87687 (= res!72118 (= lt!135716 (bvadd lt!135713 ((_ sign_extend 32) i!576))))))

(assert (=> b!87687 (= lt!135716 (bitIndex!0 (size!1869 (buf!2259 thiss!1152)) (currentByte!4474 thiss!1152) (currentBit!4469 thiss!1152)))))

(assert (=> b!87687 (= lt!135713 (bitIndex!0 (size!1869 (buf!2259 thiss!1151)) (currentByte!4474 thiss!1151) (currentBit!4469 thiss!1151)))))

(declare-fun b!87688 () Bool)

(declare-fun e!58116 () Bool)

(assert (=> b!87688 (= e!58116 (array_inv!1715 (buf!2259 thiss!1152)))))

(declare-fun b!87689 () Bool)

(assert (=> b!87689 (= e!58107 e!58115)))

(declare-fun res!72119 () Bool)

(assert (=> b!87689 (=> (not res!72119) (not e!58115))))

(assert (=> b!87689 (= res!72119 (and (= (_2!3940 lt!135714) lt!135715) (= (_1!3940 lt!135714) (_2!3939 lt!135717))))))

(declare-fun readBitPure!0 (BitStream!3300) tuple2!7414)

(declare-fun readerFrom!0 (BitStream!3300 (_ BitVec 32) (_ BitVec 32)) BitStream!3300)

(assert (=> b!87689 (= lt!135714 (readBitPure!0 (readerFrom!0 (_2!3939 lt!135717) (currentBit!4469 thiss!1152) (currentByte!4474 thiss!1152))))))

(declare-fun b!87690 () Bool)

(assert (=> b!87690 (= e!58111 (or (bvsgt ((_ sign_extend 32) (size!1869 (buf!2259 (_2!3939 lt!135717)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4474 (_2!3939 lt!135717))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4469 (_2!3939 lt!135717))) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1869 (buf!2259 (_2!3939 lt!135717)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4474 (_2!3939 lt!135717))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4469 (_2!3939 lt!135717))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!87691 () Bool)

(declare-fun res!72116 () Bool)

(assert (=> b!87691 (=> (not res!72116) (not e!58110))))

(assert (=> b!87691 (= res!72116 (and (bvsle i!576 nBits!336) (= (size!1869 (buf!2259 thiss!1152)) (size!1869 (buf!2259 thiss!1151)))))))

(declare-fun b!87683 () Bool)

(assert (=> b!87683 (= e!58112 e!58107)))

(declare-fun res!72127 () Bool)

(assert (=> b!87683 (=> (not res!72127) (not e!58107))))

(assert (=> b!87683 (= res!72127 (= lt!135712 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135716)))))

(assert (=> b!87683 (= lt!135712 (bitIndex!0 (size!1869 (buf!2259 (_2!3939 lt!135717))) (currentByte!4474 (_2!3939 lt!135717)) (currentBit!4469 (_2!3939 lt!135717))))))

(declare-fun res!72120 () Bool)

(assert (=> start!17868 (=> (not res!72120) (not e!58110))))

(assert (=> start!17868 (= res!72120 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17868 e!58110))

(declare-fun inv!12 (BitStream!3300) Bool)

(assert (=> start!17868 (and (inv!12 thiss!1152) e!58116)))

(assert (=> start!17868 (and (inv!12 thiss!1151) e!58109)))

(assert (=> start!17868 true))

(assert (= (and start!17868 res!72120) b!87674))

(assert (= (and b!87674 res!72117) b!87680))

(assert (= (and b!87680 res!72125) b!87677))

(assert (= (and b!87677 res!72122) b!87679))

(assert (= (and b!87679 res!72124) b!87691))

(assert (= (and b!87691 res!72116) b!87687))

(assert (= (and b!87687 res!72118) b!87686))

(assert (= (and b!87686 res!72126) b!87681))

(assert (= (and b!87681 res!72123) b!87684))

(assert (= (and b!87684 res!72115) b!87683))

(assert (= (and b!87683 res!72127) b!87676))

(assert (= (and b!87676 res!72130) b!87689))

(assert (= (and b!87689 res!72119) b!87685))

(assert (= (and b!87684 (not res!72121)) b!87682))

(assert (= (and b!87682 (not res!72128)) b!87675))

(assert (= (and b!87675 (not res!72129)) b!87690))

(assert (= start!17868 b!87688))

(assert (= start!17868 b!87678))

(declare-fun m!133071 () Bool)

(assert (=> b!87685 m!133071))

(declare-fun m!133073 () Bool)

(assert (=> b!87683 m!133073))

(declare-fun m!133075 () Bool)

(assert (=> b!87686 m!133075))

(declare-fun m!133077 () Bool)

(assert (=> b!87678 m!133077))

(declare-fun m!133079 () Bool)

(assert (=> b!87676 m!133079))

(declare-fun m!133081 () Bool)

(assert (=> b!87687 m!133081))

(declare-fun m!133083 () Bool)

(assert (=> b!87687 m!133083))

(declare-fun m!133085 () Bool)

(assert (=> b!87688 m!133085))

(declare-fun m!133087 () Bool)

(assert (=> start!17868 m!133087))

(declare-fun m!133089 () Bool)

(assert (=> start!17868 m!133089))

(declare-fun m!133091 () Bool)

(assert (=> b!87680 m!133091))

(declare-fun m!133093 () Bool)

(assert (=> b!87689 m!133093))

(assert (=> b!87689 m!133093))

(declare-fun m!133095 () Bool)

(assert (=> b!87689 m!133095))

(declare-fun m!133097 () Bool)

(assert (=> b!87684 m!133097))

(declare-fun m!133099 () Bool)

(assert (=> b!87684 m!133099))

(assert (=> b!87675 m!133073))

(declare-fun m!133101 () Bool)

(assert (=> b!87674 m!133101))

(declare-fun m!133103 () Bool)

(assert (=> b!87679 m!133103))

(check-sat (not b!87686) (not b!87688) (not b!87687) (not start!17868) (not b!87679) (not b!87689) (not b!87678) (not b!87674) (not b!87675) (not b!87680) (not b!87683) (not b!87685) (not b!87676) (not b!87684))
(check-sat)
(get-model)

(declare-fun d!27566 () Bool)

(assert (=> d!27566 (= (invariant!0 (currentBit!4469 (_2!3939 lt!135717)) (currentByte!4474 (_2!3939 lt!135717)) (size!1869 (buf!2259 (_2!3939 lt!135717)))) (and (bvsge (currentBit!4469 (_2!3939 lt!135717)) #b00000000000000000000000000000000) (bvslt (currentBit!4469 (_2!3939 lt!135717)) #b00000000000000000000000000001000) (bvsge (currentByte!4474 (_2!3939 lt!135717)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4474 (_2!3939 lt!135717)) (size!1869 (buf!2259 (_2!3939 lt!135717)))) (and (= (currentBit!4469 (_2!3939 lt!135717)) #b00000000000000000000000000000000) (= (currentByte!4474 (_2!3939 lt!135717)) (size!1869 (buf!2259 (_2!3939 lt!135717))))))))))

(assert (=> b!87684 d!27566))

(declare-fun b!87758 () Bool)

(declare-fun e!58151 () Bool)

(declare-fun lt!135747 () tuple2!7414)

(declare-fun lt!135746 () tuple2!7412)

(assert (=> b!87758 (= e!58151 (= (bitIndex!0 (size!1869 (buf!2259 (_1!3940 lt!135747))) (currentByte!4474 (_1!3940 lt!135747)) (currentBit!4469 (_1!3940 lt!135747))) (bitIndex!0 (size!1869 (buf!2259 (_2!3939 lt!135746))) (currentByte!4474 (_2!3939 lt!135746)) (currentBit!4469 (_2!3939 lt!135746)))))))

(declare-fun d!27568 () Bool)

(declare-fun e!58152 () Bool)

(assert (=> d!27568 e!58152))

(declare-fun res!72188 () Bool)

(assert (=> d!27568 (=> (not res!72188) (not e!58152))))

(assert (=> d!27568 (= res!72188 (= (size!1869 (buf!2259 thiss!1152)) (size!1869 (buf!2259 (_2!3939 lt!135746)))))))

(declare-fun choose!16 (BitStream!3300 Bool) tuple2!7412)

(assert (=> d!27568 (= lt!135746 (choose!16 thiss!1152 lt!135715))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27568 (validate_offset_bit!0 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1152))) ((_ sign_extend 32) (currentByte!4474 thiss!1152)) ((_ sign_extend 32) (currentBit!4469 thiss!1152)))))

(assert (=> d!27568 (= (appendBit!0 thiss!1152 lt!135715) lt!135746)))

(declare-fun b!87757 () Bool)

(assert (=> b!87757 (= e!58152 e!58151)))

(declare-fun res!72189 () Bool)

(assert (=> b!87757 (=> (not res!72189) (not e!58151))))

(assert (=> b!87757 (= res!72189 (and (= (_2!3940 lt!135747) lt!135715) (= (_1!3940 lt!135747) (_2!3939 lt!135746))))))

(assert (=> b!87757 (= lt!135747 (readBitPure!0 (readerFrom!0 (_2!3939 lt!135746) (currentBit!4469 thiss!1152) (currentByte!4474 thiss!1152))))))

(declare-fun b!87755 () Bool)

(declare-fun res!72187 () Bool)

(assert (=> b!87755 (=> (not res!72187) (not e!58152))))

(declare-fun lt!135745 () (_ BitVec 64))

(declare-fun lt!135744 () (_ BitVec 64))

(assert (=> b!87755 (= res!72187 (= (bitIndex!0 (size!1869 (buf!2259 (_2!3939 lt!135746))) (currentByte!4474 (_2!3939 lt!135746)) (currentBit!4469 (_2!3939 lt!135746))) (bvadd lt!135744 lt!135745)))))

(assert (=> b!87755 (or (not (= (bvand lt!135744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135745 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!135744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!135744 lt!135745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!87755 (= lt!135745 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!87755 (= lt!135744 (bitIndex!0 (size!1869 (buf!2259 thiss!1152)) (currentByte!4474 thiss!1152) (currentBit!4469 thiss!1152)))))

(declare-fun b!87756 () Bool)

(declare-fun res!72190 () Bool)

(assert (=> b!87756 (=> (not res!72190) (not e!58152))))

(assert (=> b!87756 (= res!72190 (isPrefixOf!0 thiss!1152 (_2!3939 lt!135746)))))

(assert (= (and d!27568 res!72188) b!87755))

(assert (= (and b!87755 res!72187) b!87756))

(assert (= (and b!87756 res!72190) b!87757))

(assert (= (and b!87757 res!72189) b!87758))

(declare-fun m!133139 () Bool)

(assert (=> b!87758 m!133139))

(declare-fun m!133141 () Bool)

(assert (=> b!87758 m!133141))

(declare-fun m!133143 () Bool)

(assert (=> b!87757 m!133143))

(assert (=> b!87757 m!133143))

(declare-fun m!133145 () Bool)

(assert (=> b!87757 m!133145))

(declare-fun m!133147 () Bool)

(assert (=> b!87756 m!133147))

(declare-fun m!133149 () Bool)

(assert (=> d!27568 m!133149))

(declare-fun m!133151 () Bool)

(assert (=> d!27568 m!133151))

(assert (=> b!87755 m!133141))

(assert (=> b!87755 m!133081))

(assert (=> b!87684 d!27568))

(declare-fun d!27570 () Bool)

(declare-fun e!58155 () Bool)

(assert (=> d!27570 e!58155))

(declare-fun res!72196 () Bool)

(assert (=> d!27570 (=> (not res!72196) (not e!58155))))

(declare-fun lt!135765 () (_ BitVec 64))

(declare-fun lt!135761 () (_ BitVec 64))

(declare-fun lt!135760 () (_ BitVec 64))

(assert (=> d!27570 (= res!72196 (= lt!135765 (bvsub lt!135761 lt!135760)))))

(assert (=> d!27570 (or (= (bvand lt!135761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135760 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135761 lt!135760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27570 (= lt!135760 (remainingBits!0 ((_ sign_extend 32) (size!1869 (buf!2259 (_2!3939 lt!135717)))) ((_ sign_extend 32) (currentByte!4474 (_2!3939 lt!135717))) ((_ sign_extend 32) (currentBit!4469 (_2!3939 lt!135717)))))))

(declare-fun lt!135762 () (_ BitVec 64))

(declare-fun lt!135763 () (_ BitVec 64))

(assert (=> d!27570 (= lt!135761 (bvmul lt!135762 lt!135763))))

(assert (=> d!27570 (or (= lt!135762 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135763 (bvsdiv (bvmul lt!135762 lt!135763) lt!135762)))))

(assert (=> d!27570 (= lt!135763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27570 (= lt!135762 ((_ sign_extend 32) (size!1869 (buf!2259 (_2!3939 lt!135717)))))))

(assert (=> d!27570 (= lt!135765 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4474 (_2!3939 lt!135717))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4469 (_2!3939 lt!135717)))))))

(assert (=> d!27570 (invariant!0 (currentBit!4469 (_2!3939 lt!135717)) (currentByte!4474 (_2!3939 lt!135717)) (size!1869 (buf!2259 (_2!3939 lt!135717))))))

(assert (=> d!27570 (= (bitIndex!0 (size!1869 (buf!2259 (_2!3939 lt!135717))) (currentByte!4474 (_2!3939 lt!135717)) (currentBit!4469 (_2!3939 lt!135717))) lt!135765)))

(declare-fun b!87763 () Bool)

(declare-fun res!72195 () Bool)

(assert (=> b!87763 (=> (not res!72195) (not e!58155))))

(assert (=> b!87763 (= res!72195 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135765))))

(declare-fun b!87764 () Bool)

(declare-fun lt!135764 () (_ BitVec 64))

(assert (=> b!87764 (= e!58155 (bvsle lt!135765 (bvmul lt!135764 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87764 (or (= lt!135764 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135764 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135764)))))

(assert (=> b!87764 (= lt!135764 ((_ sign_extend 32) (size!1869 (buf!2259 (_2!3939 lt!135717)))))))

(assert (= (and d!27570 res!72196) b!87763))

(assert (= (and b!87763 res!72195) b!87764))

(declare-fun m!133153 () Bool)

(assert (=> d!27570 m!133153))

(assert (=> d!27570 m!133097))

(assert (=> b!87683 d!27570))

(declare-fun d!27572 () Bool)

(assert (=> d!27572 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1152))) ((_ sign_extend 32) (currentByte!4474 thiss!1152)) ((_ sign_extend 32) (currentBit!4469 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1152))) ((_ sign_extend 32) (currentByte!4474 thiss!1152)) ((_ sign_extend 32) (currentBit!4469 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6836 () Bool)

(assert (= bs!6836 d!27572))

(declare-fun m!133155 () Bool)

(assert (=> bs!6836 m!133155))

(assert (=> b!87686 d!27572))

(declare-fun d!27574 () Bool)

(declare-fun e!58156 () Bool)

(assert (=> d!27574 e!58156))

(declare-fun res!72198 () Bool)

(assert (=> d!27574 (=> (not res!72198) (not e!58156))))

(declare-fun lt!135766 () (_ BitVec 64))

(declare-fun lt!135767 () (_ BitVec 64))

(declare-fun lt!135771 () (_ BitVec 64))

(assert (=> d!27574 (= res!72198 (= lt!135771 (bvsub lt!135767 lt!135766)))))

(assert (=> d!27574 (or (= (bvand lt!135767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135766 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135767 lt!135766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27574 (= lt!135766 (remainingBits!0 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1152))) ((_ sign_extend 32) (currentByte!4474 thiss!1152)) ((_ sign_extend 32) (currentBit!4469 thiss!1152))))))

(declare-fun lt!135768 () (_ BitVec 64))

(declare-fun lt!135769 () (_ BitVec 64))

(assert (=> d!27574 (= lt!135767 (bvmul lt!135768 lt!135769))))

(assert (=> d!27574 (or (= lt!135768 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135769 (bvsdiv (bvmul lt!135768 lt!135769) lt!135768)))))

(assert (=> d!27574 (= lt!135769 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27574 (= lt!135768 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1152))))))

(assert (=> d!27574 (= lt!135771 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4474 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4469 thiss!1152))))))

(assert (=> d!27574 (invariant!0 (currentBit!4469 thiss!1152) (currentByte!4474 thiss!1152) (size!1869 (buf!2259 thiss!1152)))))

(assert (=> d!27574 (= (bitIndex!0 (size!1869 (buf!2259 thiss!1152)) (currentByte!4474 thiss!1152) (currentBit!4469 thiss!1152)) lt!135771)))

(declare-fun b!87765 () Bool)

(declare-fun res!72197 () Bool)

(assert (=> b!87765 (=> (not res!72197) (not e!58156))))

(assert (=> b!87765 (= res!72197 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135771))))

(declare-fun b!87766 () Bool)

(declare-fun lt!135770 () (_ BitVec 64))

(assert (=> b!87766 (= e!58156 (bvsle lt!135771 (bvmul lt!135770 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87766 (or (= lt!135770 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135770 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135770)))))

(assert (=> b!87766 (= lt!135770 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1152))))))

(assert (= (and d!27574 res!72198) b!87765))

(assert (= (and b!87765 res!72197) b!87766))

(assert (=> d!27574 m!133155))

(assert (=> d!27574 m!133103))

(assert (=> b!87687 d!27574))

(declare-fun d!27576 () Bool)

(declare-fun e!58157 () Bool)

(assert (=> d!27576 e!58157))

(declare-fun res!72200 () Bool)

(assert (=> d!27576 (=> (not res!72200) (not e!58157))))

(declare-fun lt!135777 () (_ BitVec 64))

(declare-fun lt!135773 () (_ BitVec 64))

(declare-fun lt!135772 () (_ BitVec 64))

(assert (=> d!27576 (= res!72200 (= lt!135777 (bvsub lt!135773 lt!135772)))))

(assert (=> d!27576 (or (= (bvand lt!135773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135772 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135773 lt!135772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27576 (= lt!135772 (remainingBits!0 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1151))) ((_ sign_extend 32) (currentByte!4474 thiss!1151)) ((_ sign_extend 32) (currentBit!4469 thiss!1151))))))

(declare-fun lt!135774 () (_ BitVec 64))

(declare-fun lt!135775 () (_ BitVec 64))

(assert (=> d!27576 (= lt!135773 (bvmul lt!135774 lt!135775))))

(assert (=> d!27576 (or (= lt!135774 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135775 (bvsdiv (bvmul lt!135774 lt!135775) lt!135774)))))

(assert (=> d!27576 (= lt!135775 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27576 (= lt!135774 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1151))))))

(assert (=> d!27576 (= lt!135777 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4474 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4469 thiss!1151))))))

(assert (=> d!27576 (invariant!0 (currentBit!4469 thiss!1151) (currentByte!4474 thiss!1151) (size!1869 (buf!2259 thiss!1151)))))

(assert (=> d!27576 (= (bitIndex!0 (size!1869 (buf!2259 thiss!1151)) (currentByte!4474 thiss!1151) (currentBit!4469 thiss!1151)) lt!135777)))

(declare-fun b!87767 () Bool)

(declare-fun res!72199 () Bool)

(assert (=> b!87767 (=> (not res!72199) (not e!58157))))

(assert (=> b!87767 (= res!72199 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135777))))

(declare-fun b!87768 () Bool)

(declare-fun lt!135776 () (_ BitVec 64))

(assert (=> b!87768 (= e!58157 (bvsle lt!135777 (bvmul lt!135776 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87768 (or (= lt!135776 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135776 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135776)))))

(assert (=> b!87768 (= lt!135776 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1151))))))

(assert (= (and d!27576 res!72200) b!87767))

(assert (= (and b!87767 res!72199) b!87768))

(declare-fun m!133157 () Bool)

(assert (=> d!27576 m!133157))

(assert (=> d!27576 m!133091))

(assert (=> b!87687 d!27576))

(declare-fun d!27578 () Bool)

(declare-fun res!72207 () Bool)

(declare-fun e!58162 () Bool)

(assert (=> d!27578 (=> (not res!72207) (not e!58162))))

(assert (=> d!27578 (= res!72207 (= (size!1869 (buf!2259 thiss!1152)) (size!1869 (buf!2259 (_2!3939 lt!135717)))))))

(assert (=> d!27578 (= (isPrefixOf!0 thiss!1152 (_2!3939 lt!135717)) e!58162)))

(declare-fun b!87775 () Bool)

(declare-fun res!72209 () Bool)

(assert (=> b!87775 (=> (not res!72209) (not e!58162))))

(assert (=> b!87775 (= res!72209 (bvsle (bitIndex!0 (size!1869 (buf!2259 thiss!1152)) (currentByte!4474 thiss!1152) (currentBit!4469 thiss!1152)) (bitIndex!0 (size!1869 (buf!2259 (_2!3939 lt!135717))) (currentByte!4474 (_2!3939 lt!135717)) (currentBit!4469 (_2!3939 lt!135717)))))))

(declare-fun b!87776 () Bool)

(declare-fun e!58163 () Bool)

(assert (=> b!87776 (= e!58162 e!58163)))

(declare-fun res!72208 () Bool)

(assert (=> b!87776 (=> res!72208 e!58163)))

(assert (=> b!87776 (= res!72208 (= (size!1869 (buf!2259 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!87777 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4136 array!4136 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87777 (= e!58163 (arrayBitRangesEq!0 (buf!2259 thiss!1152) (buf!2259 (_2!3939 lt!135717)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1869 (buf!2259 thiss!1152)) (currentByte!4474 thiss!1152) (currentBit!4469 thiss!1152))))))

(assert (= (and d!27578 res!72207) b!87775))

(assert (= (and b!87775 res!72209) b!87776))

(assert (= (and b!87776 (not res!72208)) b!87777))

(assert (=> b!87775 m!133081))

(assert (=> b!87775 m!133073))

(assert (=> b!87777 m!133081))

(assert (=> b!87777 m!133081))

(declare-fun m!133159 () Bool)

(assert (=> b!87777 m!133159))

(assert (=> b!87676 d!27578))

(declare-fun d!27580 () Bool)

(declare-fun e!58164 () Bool)

(assert (=> d!27580 e!58164))

(declare-fun res!72211 () Bool)

(assert (=> d!27580 (=> (not res!72211) (not e!58164))))

(declare-fun lt!135779 () (_ BitVec 64))

(declare-fun lt!135783 () (_ BitVec 64))

(declare-fun lt!135778 () (_ BitVec 64))

(assert (=> d!27580 (= res!72211 (= lt!135783 (bvsub lt!135779 lt!135778)))))

(assert (=> d!27580 (or (= (bvand lt!135779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135778 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135779 lt!135778) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27580 (= lt!135778 (remainingBits!0 ((_ sign_extend 32) (size!1869 (buf!2259 (_1!3940 lt!135714)))) ((_ sign_extend 32) (currentByte!4474 (_1!3940 lt!135714))) ((_ sign_extend 32) (currentBit!4469 (_1!3940 lt!135714)))))))

(declare-fun lt!135780 () (_ BitVec 64))

(declare-fun lt!135781 () (_ BitVec 64))

(assert (=> d!27580 (= lt!135779 (bvmul lt!135780 lt!135781))))

(assert (=> d!27580 (or (= lt!135780 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135781 (bvsdiv (bvmul lt!135780 lt!135781) lt!135780)))))

(assert (=> d!27580 (= lt!135781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27580 (= lt!135780 ((_ sign_extend 32) (size!1869 (buf!2259 (_1!3940 lt!135714)))))))

(assert (=> d!27580 (= lt!135783 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4474 (_1!3940 lt!135714))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4469 (_1!3940 lt!135714)))))))

(assert (=> d!27580 (invariant!0 (currentBit!4469 (_1!3940 lt!135714)) (currentByte!4474 (_1!3940 lt!135714)) (size!1869 (buf!2259 (_1!3940 lt!135714))))))

(assert (=> d!27580 (= (bitIndex!0 (size!1869 (buf!2259 (_1!3940 lt!135714))) (currentByte!4474 (_1!3940 lt!135714)) (currentBit!4469 (_1!3940 lt!135714))) lt!135783)))

(declare-fun b!87778 () Bool)

(declare-fun res!72210 () Bool)

(assert (=> b!87778 (=> (not res!72210) (not e!58164))))

(assert (=> b!87778 (= res!72210 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135783))))

(declare-fun b!87779 () Bool)

(declare-fun lt!135782 () (_ BitVec 64))

(assert (=> b!87779 (= e!58164 (bvsle lt!135783 (bvmul lt!135782 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87779 (or (= lt!135782 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135782 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135782)))))

(assert (=> b!87779 (= lt!135782 ((_ sign_extend 32) (size!1869 (buf!2259 (_1!3940 lt!135714)))))))

(assert (= (and d!27580 res!72211) b!87778))

(assert (= (and b!87778 res!72210) b!87779))

(declare-fun m!133161 () Bool)

(assert (=> d!27580 m!133161))

(declare-fun m!133163 () Bool)

(assert (=> d!27580 m!133163))

(assert (=> b!87685 d!27580))

(declare-fun d!27582 () Bool)

(assert (=> d!27582 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1151))) ((_ sign_extend 32) (currentByte!4474 thiss!1151)) ((_ sign_extend 32) (currentBit!4469 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1869 (buf!2259 thiss!1151))) ((_ sign_extend 32) (currentByte!4474 thiss!1151)) ((_ sign_extend 32) (currentBit!4469 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6837 () Bool)

(assert (= bs!6837 d!27582))

(assert (=> bs!6837 m!133157))

(assert (=> b!87674 d!27582))

(assert (=> b!87675 d!27570))

(declare-fun d!27584 () Bool)

(declare-datatypes ((tuple2!7420 0))(
  ( (tuple2!7421 (_1!3943 Bool) (_2!3943 BitStream!3300)) )
))
(declare-fun lt!135786 () tuple2!7420)

(declare-fun readBit!0 (BitStream!3300) tuple2!7420)

(assert (=> d!27584 (= lt!135786 (readBit!0 (readerFrom!0 (_2!3939 lt!135717) (currentBit!4469 thiss!1152) (currentByte!4474 thiss!1152))))))

(assert (=> d!27584 (= (readBitPure!0 (readerFrom!0 (_2!3939 lt!135717) (currentBit!4469 thiss!1152) (currentByte!4474 thiss!1152))) (tuple2!7415 (_2!3943 lt!135786) (_1!3943 lt!135786)))))

(declare-fun bs!6838 () Bool)

(assert (= bs!6838 d!27584))

(assert (=> bs!6838 m!133093))

(declare-fun m!133165 () Bool)

(assert (=> bs!6838 m!133165))

(assert (=> b!87689 d!27584))

(declare-fun d!27586 () Bool)

(declare-fun e!58167 () Bool)

(assert (=> d!27586 e!58167))

(declare-fun res!72215 () Bool)

(assert (=> d!27586 (=> (not res!72215) (not e!58167))))

(assert (=> d!27586 (= res!72215 (invariant!0 (currentBit!4469 (_2!3939 lt!135717)) (currentByte!4474 (_2!3939 lt!135717)) (size!1869 (buf!2259 (_2!3939 lt!135717)))))))

(assert (=> d!27586 (= (readerFrom!0 (_2!3939 lt!135717) (currentBit!4469 thiss!1152) (currentByte!4474 thiss!1152)) (BitStream!3301 (buf!2259 (_2!3939 lt!135717)) (currentByte!4474 thiss!1152) (currentBit!4469 thiss!1152)))))

(declare-fun b!87782 () Bool)

(assert (=> b!87782 (= e!58167 (invariant!0 (currentBit!4469 thiss!1152) (currentByte!4474 thiss!1152) (size!1869 (buf!2259 (_2!3939 lt!135717)))))))

(assert (= (and d!27586 res!72215) b!87782))

(assert (=> d!27586 m!133097))

(declare-fun m!133169 () Bool)

(assert (=> b!87782 m!133169))

(assert (=> b!87689 d!27586))

(declare-fun d!27592 () Bool)

(assert (=> d!27592 (= (array_inv!1715 (buf!2259 thiss!1151)) (bvsge (size!1869 (buf!2259 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!87678 d!27592))

(declare-fun d!27594 () Bool)

(assert (=> d!27594 (= (invariant!0 (currentBit!4469 thiss!1152) (currentByte!4474 thiss!1152) (size!1869 (buf!2259 thiss!1152))) (and (bvsge (currentBit!4469 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4469 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4474 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4474 thiss!1152) (size!1869 (buf!2259 thiss!1152))) (and (= (currentBit!4469 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4474 thiss!1152) (size!1869 (buf!2259 thiss!1152)))))))))

(assert (=> b!87679 d!27594))

(declare-fun d!27596 () Bool)

(assert (=> d!27596 (= (array_inv!1715 (buf!2259 thiss!1152)) (bvsge (size!1869 (buf!2259 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!87688 d!27596))

(declare-fun d!27598 () Bool)

(assert (=> d!27598 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4469 thiss!1152) (currentByte!4474 thiss!1152) (size!1869 (buf!2259 thiss!1152))))))

(declare-fun bs!6840 () Bool)

(assert (= bs!6840 d!27598))

(assert (=> bs!6840 m!133103))

(assert (=> start!17868 d!27598))

(declare-fun d!27600 () Bool)

(assert (=> d!27600 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4469 thiss!1151) (currentByte!4474 thiss!1151) (size!1869 (buf!2259 thiss!1151))))))

(declare-fun bs!6841 () Bool)

(assert (= bs!6841 d!27600))

(assert (=> bs!6841 m!133091))

(assert (=> start!17868 d!27600))

(declare-fun d!27602 () Bool)

(assert (=> d!27602 (= (invariant!0 (currentBit!4469 thiss!1151) (currentByte!4474 thiss!1151) (size!1869 (buf!2259 thiss!1151))) (and (bvsge (currentBit!4469 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4469 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4474 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4474 thiss!1151) (size!1869 (buf!2259 thiss!1151))) (and (= (currentBit!4469 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4474 thiss!1151) (size!1869 (buf!2259 thiss!1151)))))))))

(assert (=> b!87680 d!27602))

(check-sat (not d!27570) (not b!87777) (not d!27572) (not d!27586) (not b!87782) (not d!27600) (not b!87755) (not d!27582) (not b!87775) (not d!27598) (not d!27574) (not b!87758) (not b!87757) (not d!27576) (not d!27584) (not d!27580) (not b!87756) (not d!27568))
