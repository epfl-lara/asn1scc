; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17870 () Bool)

(assert start!17870)

(declare-fun b!87728 () Bool)

(declare-fun res!72167 () Bool)

(declare-fun e!58145 () Bool)

(assert (=> b!87728 (=> (not res!72167) (not e!58145))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!87728 (= res!72167 (bvslt i!576 nBits!336))))

(declare-fun b!87729 () Bool)

(declare-fun e!58140 () Bool)

(declare-fun e!58142 () Bool)

(assert (=> b!87729 (= e!58140 e!58142)))

(declare-fun res!72164 () Bool)

(assert (=> b!87729 (=> (not res!72164) (not e!58142))))

(declare-fun lt!135735 () (_ BitVec 64))

(declare-fun lt!135733 () (_ BitVec 64))

(assert (=> b!87729 (= res!72164 (= lt!135735 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135733)))))

(declare-datatypes ((array!4138 0))(
  ( (array!4139 (arr!2507 (Array (_ BitVec 32) (_ BitVec 8))) (size!1870 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3302 0))(
  ( (BitStream!3303 (buf!2260 array!4138) (currentByte!4475 (_ BitVec 32)) (currentBit!4470 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5759 0))(
  ( (Unit!5760) )
))
(declare-datatypes ((tuple2!7416 0))(
  ( (tuple2!7417 (_1!3941 Unit!5759) (_2!3941 BitStream!3302)) )
))
(declare-fun lt!135730 () tuple2!7416)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87729 (= lt!135735 (bitIndex!0 (size!1870 (buf!2260 (_2!3941 lt!135730))) (currentByte!4475 (_2!3941 lt!135730)) (currentBit!4470 (_2!3941 lt!135730))))))

(declare-fun b!87730 () Bool)

(declare-fun res!72174 () Bool)

(declare-fun e!58143 () Bool)

(assert (=> b!87730 (=> (not res!72174) (not e!58143))))

(declare-fun thiss!1152 () BitStream!3302)

(declare-fun thiss!1151 () BitStream!3302)

(assert (=> b!87730 (= res!72174 (and (bvsle i!576 nBits!336) (= (size!1870 (buf!2260 thiss!1152)) (size!1870 (buf!2260 thiss!1151)))))))

(declare-fun b!87731 () Bool)

(declare-fun res!72175 () Bool)

(assert (=> b!87731 (=> (not res!72175) (not e!58145))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87731 (= res!72175 (validate_offset_bits!1 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1152))) ((_ sign_extend 32) (currentByte!4475 thiss!1152)) ((_ sign_extend 32) (currentBit!4470 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87732 () Bool)

(declare-fun res!72165 () Bool)

(assert (=> b!87732 (=> (not res!72165) (not e!58143))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87732 (= res!72165 (invariant!0 (currentBit!4470 thiss!1151) (currentByte!4475 thiss!1151) (size!1870 (buf!2260 thiss!1151))))))

(declare-fun b!87733 () Bool)

(declare-fun res!72170 () Bool)

(assert (=> b!87733 (=> (not res!72170) (not e!58143))))

(assert (=> b!87733 (= res!72170 (validate_offset_bits!1 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1151))) ((_ sign_extend 32) (currentByte!4475 thiss!1151)) ((_ sign_extend 32) (currentBit!4470 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87734 () Bool)

(declare-fun e!58138 () Bool)

(declare-fun array_inv!1716 (array!4138) Bool)

(assert (=> b!87734 (= e!58138 (array_inv!1716 (buf!2260 thiss!1152)))))

(declare-fun b!87736 () Bool)

(assert (=> b!87736 (= e!58143 e!58145)))

(declare-fun res!72178 () Bool)

(assert (=> b!87736 (=> (not res!72178) (not e!58145))))

(declare-fun lt!135731 () (_ BitVec 64))

(assert (=> b!87736 (= res!72178 (= lt!135733 (bvadd lt!135731 ((_ sign_extend 32) i!576))))))

(assert (=> b!87736 (= lt!135733 (bitIndex!0 (size!1870 (buf!2260 thiss!1152)) (currentByte!4475 thiss!1152) (currentBit!4470 thiss!1152)))))

(assert (=> b!87736 (= lt!135731 (bitIndex!0 (size!1870 (buf!2260 thiss!1151)) (currentByte!4475 thiss!1151) (currentBit!4470 thiss!1151)))))

(declare-fun b!87737 () Bool)

(declare-fun e!58137 () Bool)

(assert (=> b!87737 (= e!58137 (array_inv!1716 (buf!2260 thiss!1151)))))

(declare-fun b!87738 () Bool)

(declare-fun e!58146 () Bool)

(assert (=> b!87738 (= e!58142 e!58146)))

(declare-fun res!72169 () Bool)

(assert (=> b!87738 (=> (not res!72169) (not e!58146))))

(declare-datatypes ((tuple2!7418 0))(
  ( (tuple2!7419 (_1!3942 BitStream!3302) (_2!3942 Bool)) )
))
(declare-fun lt!135732 () tuple2!7418)

(declare-fun lt!135734 () Bool)

(assert (=> b!87738 (= res!72169 (and (= (_2!3942 lt!135732) lt!135734) (= (_1!3942 lt!135732) (_2!3941 lt!135730))))))

(declare-fun readBitPure!0 (BitStream!3302) tuple2!7418)

(declare-fun readerFrom!0 (BitStream!3302 (_ BitVec 32) (_ BitVec 32)) BitStream!3302)

(assert (=> b!87738 (= lt!135732 (readBitPure!0 (readerFrom!0 (_2!3941 lt!135730) (currentBit!4470 thiss!1152) (currentByte!4475 thiss!1152))))))

(declare-fun b!87739 () Bool)

(declare-fun res!72163 () Bool)

(declare-fun e!58139 () Bool)

(assert (=> b!87739 (=> res!72163 e!58139)))

(assert (=> b!87739 (= res!72163 (not (= (bitIndex!0 (size!1870 (buf!2260 (_2!3941 lt!135730))) (currentByte!4475 (_2!3941 lt!135730)) (currentBit!4470 (_2!3941 lt!135730))) (bvadd lt!135731 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!87740 () Bool)

(assert (=> b!87740 (= e!58139 (or (bvsgt ((_ sign_extend 32) (size!1870 (buf!2260 (_2!3941 lt!135730)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4475 (_2!3941 lt!135730))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4470 (_2!3941 lt!135730))) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1870 (buf!2260 (_2!3941 lt!135730)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4475 (_2!3941 lt!135730))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4470 (_2!3941 lt!135730))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!87741 () Bool)

(assert (=> b!87741 (= e!58145 (not e!58139))))

(declare-fun res!72166 () Bool)

(assert (=> b!87741 (=> res!72166 e!58139)))

(assert (=> b!87741 (= res!72166 (not (invariant!0 (currentBit!4470 (_2!3941 lt!135730)) (currentByte!4475 (_2!3941 lt!135730)) (size!1870 (buf!2260 (_2!3941 lt!135730))))))))

(assert (=> b!87741 e!58140))

(declare-fun res!72172 () Bool)

(assert (=> b!87741 (=> (not res!72172) (not e!58140))))

(assert (=> b!87741 (= res!72172 (= (size!1870 (buf!2260 thiss!1152)) (size!1870 (buf!2260 (_2!3941 lt!135730)))))))

(declare-fun appendBit!0 (BitStream!3302 Bool) tuple2!7416)

(assert (=> b!87741 (= lt!135730 (appendBit!0 thiss!1152 lt!135734))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87741 (= lt!135734 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87742 () Bool)

(declare-fun res!72171 () Bool)

(assert (=> b!87742 (=> (not res!72171) (not e!58143))))

(assert (=> b!87742 (= res!72171 (invariant!0 (currentBit!4470 thiss!1152) (currentByte!4475 thiss!1152) (size!1870 (buf!2260 thiss!1152))))))

(declare-fun b!87743 () Bool)

(declare-fun res!72176 () Bool)

(assert (=> b!87743 (=> (not res!72176) (not e!58143))))

(assert (=> b!87743 (= res!72176 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87744 () Bool)

(assert (=> b!87744 (= e!58146 (= (bitIndex!0 (size!1870 (buf!2260 (_1!3942 lt!135732))) (currentByte!4475 (_1!3942 lt!135732)) (currentBit!4470 (_1!3942 lt!135732))) lt!135735))))

(declare-fun b!87745 () Bool)

(declare-fun res!72173 () Bool)

(assert (=> b!87745 (=> (not res!72173) (not e!58142))))

(declare-fun isPrefixOf!0 (BitStream!3302 BitStream!3302) Bool)

(assert (=> b!87745 (= res!72173 (isPrefixOf!0 thiss!1152 (_2!3941 lt!135730)))))

(declare-fun b!87735 () Bool)

(declare-fun res!72168 () Bool)

(assert (=> b!87735 (=> res!72168 e!58139)))

(assert (=> b!87735 (= res!72168 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1870 (buf!2260 (_2!3941 lt!135730))) (size!1870 (buf!2260 thiss!1151))))))))

(declare-fun res!72177 () Bool)

(assert (=> start!17870 (=> (not res!72177) (not e!58143))))

(assert (=> start!17870 (= res!72177 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17870 e!58143))

(declare-fun inv!12 (BitStream!3302) Bool)

(assert (=> start!17870 (and (inv!12 thiss!1152) e!58138)))

(assert (=> start!17870 (and (inv!12 thiss!1151) e!58137)))

(assert (=> start!17870 true))

(assert (= (and start!17870 res!72177) b!87733))

(assert (= (and b!87733 res!72170) b!87732))

(assert (= (and b!87732 res!72165) b!87743))

(assert (= (and b!87743 res!72176) b!87742))

(assert (= (and b!87742 res!72171) b!87730))

(assert (= (and b!87730 res!72174) b!87736))

(assert (= (and b!87736 res!72178) b!87731))

(assert (= (and b!87731 res!72175) b!87728))

(assert (= (and b!87728 res!72167) b!87741))

(assert (= (and b!87741 res!72172) b!87729))

(assert (= (and b!87729 res!72164) b!87745))

(assert (= (and b!87745 res!72173) b!87738))

(assert (= (and b!87738 res!72169) b!87744))

(assert (= (and b!87741 (not res!72166)) b!87735))

(assert (= (and b!87735 (not res!72168)) b!87739))

(assert (= (and b!87739 (not res!72163)) b!87740))

(assert (= start!17870 b!87734))

(assert (= start!17870 b!87737))

(declare-fun m!133105 () Bool)

(assert (=> b!87731 m!133105))

(declare-fun m!133107 () Bool)

(assert (=> b!87729 m!133107))

(declare-fun m!133109 () Bool)

(assert (=> b!87741 m!133109))

(declare-fun m!133111 () Bool)

(assert (=> b!87741 m!133111))

(declare-fun m!133113 () Bool)

(assert (=> b!87732 m!133113))

(assert (=> b!87739 m!133107))

(declare-fun m!133115 () Bool)

(assert (=> b!87736 m!133115))

(declare-fun m!133117 () Bool)

(assert (=> b!87736 m!133117))

(declare-fun m!133119 () Bool)

(assert (=> b!87738 m!133119))

(assert (=> b!87738 m!133119))

(declare-fun m!133121 () Bool)

(assert (=> b!87738 m!133121))

(declare-fun m!133123 () Bool)

(assert (=> b!87737 m!133123))

(declare-fun m!133125 () Bool)

(assert (=> b!87734 m!133125))

(declare-fun m!133127 () Bool)

(assert (=> b!87733 m!133127))

(declare-fun m!133129 () Bool)

(assert (=> b!87742 m!133129))

(declare-fun m!133131 () Bool)

(assert (=> start!17870 m!133131))

(declare-fun m!133133 () Bool)

(assert (=> start!17870 m!133133))

(declare-fun m!133135 () Bool)

(assert (=> b!87745 m!133135))

(declare-fun m!133137 () Bool)

(assert (=> b!87744 m!133137))

(push 1)

(assert (not b!87731))

(assert (not b!87744))

(assert (not b!87736))

(assert (not b!87739))

(assert (not b!87734))

(assert (not start!17870))

(assert (not b!87737))

(assert (not b!87732))

(assert (not b!87733))

(assert (not b!87742))

(assert (not b!87741))

(assert (not b!87729))

(assert (not b!87738))

(assert (not b!87745))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27620 () Bool)

(declare-fun res!72234 () Bool)

(declare-fun e!58178 () Bool)

(assert (=> d!27620 (=> (not res!72234) (not e!58178))))

(assert (=> d!27620 (= res!72234 (= (size!1870 (buf!2260 thiss!1152)) (size!1870 (buf!2260 (_2!3941 lt!135730)))))))

(assert (=> d!27620 (= (isPrefixOf!0 thiss!1152 (_2!3941 lt!135730)) e!58178)))

(declare-fun b!87799 () Bool)

(declare-fun res!72232 () Bool)

(assert (=> b!87799 (=> (not res!72232) (not e!58178))))

(assert (=> b!87799 (= res!72232 (bvsle (bitIndex!0 (size!1870 (buf!2260 thiss!1152)) (currentByte!4475 thiss!1152) (currentBit!4470 thiss!1152)) (bitIndex!0 (size!1870 (buf!2260 (_2!3941 lt!135730))) (currentByte!4475 (_2!3941 lt!135730)) (currentBit!4470 (_2!3941 lt!135730)))))))

(declare-fun b!87800 () Bool)

(declare-fun e!58177 () Bool)

(assert (=> b!87800 (= e!58178 e!58177)))

(declare-fun res!72233 () Bool)

(assert (=> b!87800 (=> res!72233 e!58177)))

(assert (=> b!87800 (= res!72233 (= (size!1870 (buf!2260 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!87801 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4138 array!4138 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87801 (= e!58177 (arrayBitRangesEq!0 (buf!2260 thiss!1152) (buf!2260 (_2!3941 lt!135730)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1870 (buf!2260 thiss!1152)) (currentByte!4475 thiss!1152) (currentBit!4470 thiss!1152))))))

(assert (= (and d!27620 res!72234) b!87799))

(assert (= (and b!87799 res!72232) b!87800))

(assert (= (and b!87800 (not res!72233)) b!87801))

(assert (=> b!87799 m!133115))

(assert (=> b!87799 m!133107))

(assert (=> b!87801 m!133115))

(assert (=> b!87801 m!133115))

(declare-fun m!133177 () Bool)

(assert (=> b!87801 m!133177))

(assert (=> b!87745 d!27620))

(declare-fun d!27622 () Bool)

(assert (=> d!27622 (= (array_inv!1716 (buf!2260 thiss!1152)) (bvsge (size!1870 (buf!2260 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!87734 d!27622))

(declare-fun d!27624 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27624 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1151))) ((_ sign_extend 32) (currentByte!4475 thiss!1151)) ((_ sign_extend 32) (currentBit!4470 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1151))) ((_ sign_extend 32) (currentByte!4475 thiss!1151)) ((_ sign_extend 32) (currentBit!4470 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6845 () Bool)

(assert (= bs!6845 d!27624))

(declare-fun m!133179 () Bool)

(assert (=> bs!6845 m!133179))

(assert (=> b!87733 d!27624))

(declare-fun d!27626 () Bool)

(assert (=> d!27626 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4470 thiss!1152) (currentByte!4475 thiss!1152) (size!1870 (buf!2260 thiss!1152))))))

(declare-fun bs!6846 () Bool)

(assert (= bs!6846 d!27626))

(assert (=> bs!6846 m!133129))

(assert (=> start!17870 d!27626))

(declare-fun d!27628 () Bool)

(assert (=> d!27628 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4470 thiss!1151) (currentByte!4475 thiss!1151) (size!1870 (buf!2260 thiss!1151))))))

(declare-fun bs!6847 () Bool)

(assert (= bs!6847 d!27628))

(assert (=> bs!6847 m!133113))

(assert (=> start!17870 d!27628))

(declare-fun d!27630 () Bool)

(declare-fun e!58190 () Bool)

(assert (=> d!27630 e!58190))

(declare-fun res!72255 () Bool)

(assert (=> d!27630 (=> (not res!72255) (not e!58190))))

(declare-fun lt!135844 () (_ BitVec 64))

(declare-fun lt!135849 () (_ BitVec 64))

(declare-fun lt!135846 () (_ BitVec 64))

(assert (=> d!27630 (= res!72255 (= lt!135849 (bvsub lt!135844 lt!135846)))))

(assert (=> d!27630 (or (= (bvand lt!135844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135846 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135844 lt!135846) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27630 (= lt!135846 (remainingBits!0 ((_ sign_extend 32) (size!1870 (buf!2260 (_1!3942 lt!135732)))) ((_ sign_extend 32) (currentByte!4475 (_1!3942 lt!135732))) ((_ sign_extend 32) (currentBit!4470 (_1!3942 lt!135732)))))))

(declare-fun lt!135845 () (_ BitVec 64))

(declare-fun lt!135848 () (_ BitVec 64))

(assert (=> d!27630 (= lt!135844 (bvmul lt!135845 lt!135848))))

(assert (=> d!27630 (or (= lt!135845 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135848 (bvsdiv (bvmul lt!135845 lt!135848) lt!135845)))))

(assert (=> d!27630 (= lt!135848 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27630 (= lt!135845 ((_ sign_extend 32) (size!1870 (buf!2260 (_1!3942 lt!135732)))))))

(assert (=> d!27630 (= lt!135849 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4475 (_1!3942 lt!135732))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4470 (_1!3942 lt!135732)))))))

(assert (=> d!27630 (invariant!0 (currentBit!4470 (_1!3942 lt!135732)) (currentByte!4475 (_1!3942 lt!135732)) (size!1870 (buf!2260 (_1!3942 lt!135732))))))

(assert (=> d!27630 (= (bitIndex!0 (size!1870 (buf!2260 (_1!3942 lt!135732))) (currentByte!4475 (_1!3942 lt!135732)) (currentBit!4470 (_1!3942 lt!135732))) lt!135849)))

(declare-fun b!87822 () Bool)

(declare-fun res!72256 () Bool)

(assert (=> b!87822 (=> (not res!72256) (not e!58190))))

(assert (=> b!87822 (= res!72256 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135849))))

(declare-fun b!87823 () Bool)

(declare-fun lt!135847 () (_ BitVec 64))

(assert (=> b!87823 (= e!58190 (bvsle lt!135849 (bvmul lt!135847 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87823 (or (= lt!135847 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135847 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135847)))))

(assert (=> b!87823 (= lt!135847 ((_ sign_extend 32) (size!1870 (buf!2260 (_1!3942 lt!135732)))))))

(assert (= (and d!27630 res!72255) b!87822))

(assert (= (and b!87822 res!72256) b!87823))

(declare-fun m!133199 () Bool)

(assert (=> d!27630 m!133199))

(declare-fun m!133201 () Bool)

(assert (=> d!27630 m!133201))

(assert (=> b!87744 d!27630))

(declare-fun d!27644 () Bool)

(assert (=> d!27644 (= (array_inv!1716 (buf!2260 thiss!1151)) (bvsge (size!1870 (buf!2260 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!87737 d!27644))

(declare-fun d!27646 () Bool)

(declare-fun e!58191 () Bool)

(assert (=> d!27646 e!58191))

(declare-fun res!72257 () Bool)

(assert (=> d!27646 (=> (not res!72257) (not e!58191))))

(declare-fun lt!135850 () (_ BitVec 64))

(declare-fun lt!135852 () (_ BitVec 64))

(declare-fun lt!135855 () (_ BitVec 64))

(assert (=> d!27646 (= res!72257 (= lt!135855 (bvsub lt!135850 lt!135852)))))

(assert (=> d!27646 (or (= (bvand lt!135850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135852 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135850 lt!135852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27646 (= lt!135852 (remainingBits!0 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1152))) ((_ sign_extend 32) (currentByte!4475 thiss!1152)) ((_ sign_extend 32) (currentBit!4470 thiss!1152))))))

(declare-fun lt!135851 () (_ BitVec 64))

(declare-fun lt!135854 () (_ BitVec 64))

(assert (=> d!27646 (= lt!135850 (bvmul lt!135851 lt!135854))))

(assert (=> d!27646 (or (= lt!135851 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135854 (bvsdiv (bvmul lt!135851 lt!135854) lt!135851)))))

(assert (=> d!27646 (= lt!135854 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27646 (= lt!135851 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1152))))))

(assert (=> d!27646 (= lt!135855 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4475 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4470 thiss!1152))))))

(assert (=> d!27646 (invariant!0 (currentBit!4470 thiss!1152) (currentByte!4475 thiss!1152) (size!1870 (buf!2260 thiss!1152)))))

(assert (=> d!27646 (= (bitIndex!0 (size!1870 (buf!2260 thiss!1152)) (currentByte!4475 thiss!1152) (currentBit!4470 thiss!1152)) lt!135855)))

(declare-fun b!87824 () Bool)

(declare-fun res!72258 () Bool)

(assert (=> b!87824 (=> (not res!72258) (not e!58191))))

(assert (=> b!87824 (= res!72258 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135855))))

(declare-fun b!87825 () Bool)

(declare-fun lt!135853 () (_ BitVec 64))

(assert (=> b!87825 (= e!58191 (bvsle lt!135855 (bvmul lt!135853 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87825 (or (= lt!135853 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135853 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135853)))))

(assert (=> b!87825 (= lt!135853 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1152))))))

(assert (= (and d!27646 res!72257) b!87824))

(assert (= (and b!87824 res!72258) b!87825))

(declare-fun m!133203 () Bool)

(assert (=> d!27646 m!133203))

(assert (=> d!27646 m!133129))

(assert (=> b!87736 d!27646))

(declare-fun d!27648 () Bool)

(declare-fun e!58192 () Bool)

(assert (=> d!27648 e!58192))

(declare-fun res!72259 () Bool)

(assert (=> d!27648 (=> (not res!72259) (not e!58192))))

(declare-fun lt!135856 () (_ BitVec 64))

(declare-fun lt!135858 () (_ BitVec 64))

(declare-fun lt!135861 () (_ BitVec 64))

(assert (=> d!27648 (= res!72259 (= lt!135861 (bvsub lt!135856 lt!135858)))))

(assert (=> d!27648 (or (= (bvand lt!135856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135858 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135856 lt!135858) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27648 (= lt!135858 (remainingBits!0 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1151))) ((_ sign_extend 32) (currentByte!4475 thiss!1151)) ((_ sign_extend 32) (currentBit!4470 thiss!1151))))))

(declare-fun lt!135857 () (_ BitVec 64))

(declare-fun lt!135860 () (_ BitVec 64))

(assert (=> d!27648 (= lt!135856 (bvmul lt!135857 lt!135860))))

(assert (=> d!27648 (or (= lt!135857 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135860 (bvsdiv (bvmul lt!135857 lt!135860) lt!135857)))))

(assert (=> d!27648 (= lt!135860 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27648 (= lt!135857 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1151))))))

(assert (=> d!27648 (= lt!135861 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4475 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4470 thiss!1151))))))

(assert (=> d!27648 (invariant!0 (currentBit!4470 thiss!1151) (currentByte!4475 thiss!1151) (size!1870 (buf!2260 thiss!1151)))))

(assert (=> d!27648 (= (bitIndex!0 (size!1870 (buf!2260 thiss!1151)) (currentByte!4475 thiss!1151) (currentBit!4470 thiss!1151)) lt!135861)))

(declare-fun b!87826 () Bool)

(declare-fun res!72260 () Bool)

(assert (=> b!87826 (=> (not res!72260) (not e!58192))))

(assert (=> b!87826 (= res!72260 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135861))))

(declare-fun b!87827 () Bool)

(declare-fun lt!135859 () (_ BitVec 64))

(assert (=> b!87827 (= e!58192 (bvsle lt!135861 (bvmul lt!135859 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87827 (or (= lt!135859 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135859 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135859)))))

(assert (=> b!87827 (= lt!135859 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1151))))))

(assert (= (and d!27648 res!72259) b!87826))

(assert (= (and b!87826 res!72260) b!87827))

(assert (=> d!27648 m!133179))

(assert (=> d!27648 m!133113))

(assert (=> b!87736 d!27648))

(declare-fun d!27650 () Bool)

(declare-fun e!58193 () Bool)

(assert (=> d!27650 e!58193))

(declare-fun res!72261 () Bool)

(assert (=> d!27650 (=> (not res!72261) (not e!58193))))

(declare-fun lt!135867 () (_ BitVec 64))

(declare-fun lt!135862 () (_ BitVec 64))

(declare-fun lt!135864 () (_ BitVec 64))

(assert (=> d!27650 (= res!72261 (= lt!135867 (bvsub lt!135862 lt!135864)))))

(assert (=> d!27650 (or (= (bvand lt!135862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135864 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135862 lt!135864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27650 (= lt!135864 (remainingBits!0 ((_ sign_extend 32) (size!1870 (buf!2260 (_2!3941 lt!135730)))) ((_ sign_extend 32) (currentByte!4475 (_2!3941 lt!135730))) ((_ sign_extend 32) (currentBit!4470 (_2!3941 lt!135730)))))))

(declare-fun lt!135863 () (_ BitVec 64))

(declare-fun lt!135866 () (_ BitVec 64))

(assert (=> d!27650 (= lt!135862 (bvmul lt!135863 lt!135866))))

(assert (=> d!27650 (or (= lt!135863 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135866 (bvsdiv (bvmul lt!135863 lt!135866) lt!135863)))))

(assert (=> d!27650 (= lt!135866 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27650 (= lt!135863 ((_ sign_extend 32) (size!1870 (buf!2260 (_2!3941 lt!135730)))))))

(assert (=> d!27650 (= lt!135867 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4475 (_2!3941 lt!135730))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4470 (_2!3941 lt!135730)))))))

(assert (=> d!27650 (invariant!0 (currentBit!4470 (_2!3941 lt!135730)) (currentByte!4475 (_2!3941 lt!135730)) (size!1870 (buf!2260 (_2!3941 lt!135730))))))

(assert (=> d!27650 (= (bitIndex!0 (size!1870 (buf!2260 (_2!3941 lt!135730))) (currentByte!4475 (_2!3941 lt!135730)) (currentBit!4470 (_2!3941 lt!135730))) lt!135867)))

(declare-fun b!87828 () Bool)

(declare-fun res!72262 () Bool)

(assert (=> b!87828 (=> (not res!72262) (not e!58193))))

(assert (=> b!87828 (= res!72262 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135867))))

(declare-fun b!87829 () Bool)

(declare-fun lt!135865 () (_ BitVec 64))

(assert (=> b!87829 (= e!58193 (bvsle lt!135867 (bvmul lt!135865 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87829 (or (= lt!135865 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135865 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135865)))))

(assert (=> b!87829 (= lt!135865 ((_ sign_extend 32) (size!1870 (buf!2260 (_2!3941 lt!135730)))))))

(assert (= (and d!27650 res!72261) b!87828))

(assert (= (and b!87828 res!72262) b!87829))

(declare-fun m!133205 () Bool)

(assert (=> d!27650 m!133205))

(assert (=> d!27650 m!133109))

(assert (=> b!87729 d!27650))

(declare-fun d!27652 () Bool)

(declare-datatypes ((tuple2!7424 0))(
  ( (tuple2!7425 (_1!3945 Bool) (_2!3945 BitStream!3302)) )
))
(declare-fun lt!135876 () tuple2!7424)

(declare-fun readBit!0 (BitStream!3302) tuple2!7424)

(assert (=> d!27652 (= lt!135876 (readBit!0 (readerFrom!0 (_2!3941 lt!135730) (currentBit!4470 thiss!1152) (currentByte!4475 thiss!1152))))))

(assert (=> d!27652 (= (readBitPure!0 (readerFrom!0 (_2!3941 lt!135730) (currentBit!4470 thiss!1152) (currentByte!4475 thiss!1152))) (tuple2!7419 (_2!3945 lt!135876) (_1!3945 lt!135876)))))

(declare-fun bs!6849 () Bool)

(assert (= bs!6849 d!27652))

(assert (=> bs!6849 m!133119))

(declare-fun m!133211 () Bool)

(assert (=> bs!6849 m!133211))

(assert (=> b!87738 d!27652))

(declare-fun d!27656 () Bool)

(declare-fun e!58203 () Bool)

(assert (=> d!27656 e!58203))

(declare-fun res!72277 () Bool)

(assert (=> d!27656 (=> (not res!72277) (not e!58203))))

(assert (=> d!27656 (= res!72277 (invariant!0 (currentBit!4470 (_2!3941 lt!135730)) (currentByte!4475 (_2!3941 lt!135730)) (size!1870 (buf!2260 (_2!3941 lt!135730)))))))

(assert (=> d!27656 (= (readerFrom!0 (_2!3941 lt!135730) (currentBit!4470 thiss!1152) (currentByte!4475 thiss!1152)) (BitStream!3303 (buf!2260 (_2!3941 lt!135730)) (currentByte!4475 thiss!1152) (currentBit!4470 thiss!1152)))))

(declare-fun b!87843 () Bool)

(assert (=> b!87843 (= e!58203 (invariant!0 (currentBit!4470 thiss!1152) (currentByte!4475 thiss!1152) (size!1870 (buf!2260 (_2!3941 lt!135730)))))))

(assert (= (and d!27656 res!72277) b!87843))

(assert (=> d!27656 m!133109))

(declare-fun m!133213 () Bool)

(assert (=> b!87843 m!133213))

(assert (=> b!87738 d!27656))

(assert (=> b!87739 d!27650))

(declare-fun d!27658 () Bool)

(assert (=> d!27658 (= (invariant!0 (currentBit!4470 thiss!1152) (currentByte!4475 thiss!1152) (size!1870 (buf!2260 thiss!1152))) (and (bvsge (currentBit!4470 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4470 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4475 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4475 thiss!1152) (size!1870 (buf!2260 thiss!1152))) (and (= (currentBit!4470 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4475 thiss!1152) (size!1870 (buf!2260 thiss!1152)))))))))

(assert (=> b!87742 d!27658))

(declare-fun d!27660 () Bool)

(assert (=> d!27660 (= (invariant!0 (currentBit!4470 thiss!1151) (currentByte!4475 thiss!1151) (size!1870 (buf!2260 thiss!1151))) (and (bvsge (currentBit!4470 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4470 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4475 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4475 thiss!1151) (size!1870 (buf!2260 thiss!1151))) (and (= (currentBit!4470 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4475 thiss!1151) (size!1870 (buf!2260 thiss!1151)))))))))

(assert (=> b!87732 d!27660))

(declare-fun d!27662 () Bool)

(assert (=> d!27662 (= (invariant!0 (currentBit!4470 (_2!3941 lt!135730)) (currentByte!4475 (_2!3941 lt!135730)) (size!1870 (buf!2260 (_2!3941 lt!135730)))) (and (bvsge (currentBit!4470 (_2!3941 lt!135730)) #b00000000000000000000000000000000) (bvslt (currentBit!4470 (_2!3941 lt!135730)) #b00000000000000000000000000001000) (bvsge (currentByte!4475 (_2!3941 lt!135730)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4475 (_2!3941 lt!135730)) (size!1870 (buf!2260 (_2!3941 lt!135730)))) (and (= (currentBit!4470 (_2!3941 lt!135730)) #b00000000000000000000000000000000) (= (currentByte!4475 (_2!3941 lt!135730)) (size!1870 (buf!2260 (_2!3941 lt!135730))))))))))

(assert (=> b!87741 d!27662))

(declare-fun b!87853 () Bool)

(declare-fun res!72287 () Bool)

(declare-fun e!58208 () Bool)

(assert (=> b!87853 (=> (not res!72287) (not e!58208))))

(declare-fun lt!135885 () (_ BitVec 64))

(declare-fun lt!135888 () tuple2!7416)

(declare-fun lt!135886 () (_ BitVec 64))

(assert (=> b!87853 (= res!72287 (= (bitIndex!0 (size!1870 (buf!2260 (_2!3941 lt!135888))) (currentByte!4475 (_2!3941 lt!135888)) (currentBit!4470 (_2!3941 lt!135888))) (bvadd lt!135885 lt!135886)))))

(assert (=> b!87853 (or (not (= (bvand lt!135885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135886 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!135885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!135885 lt!135886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!87853 (= lt!135886 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!87853 (= lt!135885 (bitIndex!0 (size!1870 (buf!2260 thiss!1152)) (currentByte!4475 thiss!1152) (currentBit!4470 thiss!1152)))))

(declare-fun d!27664 () Bool)

(assert (=> d!27664 e!58208))

(declare-fun res!72288 () Bool)

(assert (=> d!27664 (=> (not res!72288) (not e!58208))))

(assert (=> d!27664 (= res!72288 (= (size!1870 (buf!2260 thiss!1152)) (size!1870 (buf!2260 (_2!3941 lt!135888)))))))

(declare-fun choose!16 (BitStream!3302 Bool) tuple2!7416)

(assert (=> d!27664 (= lt!135888 (choose!16 thiss!1152 lt!135734))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27664 (validate_offset_bit!0 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1152))) ((_ sign_extend 32) (currentByte!4475 thiss!1152)) ((_ sign_extend 32) (currentBit!4470 thiss!1152)))))

(assert (=> d!27664 (= (appendBit!0 thiss!1152 lt!135734) lt!135888)))

(declare-fun b!87856 () Bool)

(declare-fun e!58209 () Bool)

(declare-fun lt!135887 () tuple2!7418)

(assert (=> b!87856 (= e!58209 (= (bitIndex!0 (size!1870 (buf!2260 (_1!3942 lt!135887))) (currentByte!4475 (_1!3942 lt!135887)) (currentBit!4470 (_1!3942 lt!135887))) (bitIndex!0 (size!1870 (buf!2260 (_2!3941 lt!135888))) (currentByte!4475 (_2!3941 lt!135888)) (currentBit!4470 (_2!3941 lt!135888)))))))

(declare-fun b!87855 () Bool)

(assert (=> b!87855 (= e!58208 e!58209)))

(declare-fun res!72286 () Bool)

(assert (=> b!87855 (=> (not res!72286) (not e!58209))))

(assert (=> b!87855 (= res!72286 (and (= (_2!3942 lt!135887) lt!135734) (= (_1!3942 lt!135887) (_2!3941 lt!135888))))))

(assert (=> b!87855 (= lt!135887 (readBitPure!0 (readerFrom!0 (_2!3941 lt!135888) (currentBit!4470 thiss!1152) (currentByte!4475 thiss!1152))))))

(declare-fun b!87854 () Bool)

(declare-fun res!72289 () Bool)

(assert (=> b!87854 (=> (not res!72289) (not e!58208))))

(assert (=> b!87854 (= res!72289 (isPrefixOf!0 thiss!1152 (_2!3941 lt!135888)))))

(assert (= (and d!27664 res!72288) b!87853))

(assert (= (and b!87853 res!72287) b!87854))

(assert (= (and b!87854 res!72289) b!87855))

(assert (= (and b!87855 res!72286) b!87856))

(declare-fun m!133215 () Bool)

(assert (=> d!27664 m!133215))

(declare-fun m!133217 () Bool)

(assert (=> d!27664 m!133217))

(declare-fun m!133219 () Bool)

(assert (=> b!87854 m!133219))

(declare-fun m!133221 () Bool)

(assert (=> b!87853 m!133221))

(assert (=> b!87853 m!133115))

(declare-fun m!133223 () Bool)

(assert (=> b!87856 m!133223))

(assert (=> b!87856 m!133221))

(declare-fun m!133225 () Bool)

(assert (=> b!87855 m!133225))

(assert (=> b!87855 m!133225))

(declare-fun m!133227 () Bool)

(assert (=> b!87855 m!133227))

(assert (=> b!87741 d!27664))

(declare-fun d!27666 () Bool)

(assert (=> d!27666 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1152))) ((_ sign_extend 32) (currentByte!4475 thiss!1152)) ((_ sign_extend 32) (currentBit!4470 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1870 (buf!2260 thiss!1152))) ((_ sign_extend 32) (currentByte!4475 thiss!1152)) ((_ sign_extend 32) (currentBit!4470 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6850 () Bool)

(assert (= bs!6850 d!27666))

(assert (=> bs!6850 m!133203))

(assert (=> b!87731 d!27666))

(push 1)

(assert (not b!87856))

(assert (not d!27652))

(assert (not d!27656))

(assert (not d!27628))

(assert (not d!27646))

(assert (not d!27664))

(assert (not b!87854))

(assert (not d!27630))

(assert (not d!27626))

(assert (not b!87801))

(assert (not d!27650))

(assert (not d!27624))

(assert (not b!87853))

(assert (not b!87843))

(assert (not d!27648))

(assert (not d!27666))

(assert (not b!87855))

(assert (not b!87799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

