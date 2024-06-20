; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73182 () Bool)

(assert start!73182)

(declare-fun res!266934 () Bool)

(declare-fun e!234509 () Bool)

(assert (=> start!73182 (=> (not res!266934) (not e!234509))))

(declare-fun lt!447677 () (_ BitVec 64))

(declare-datatypes ((array!21000 0))(
  ( (array!21001 (arr!10212 (Array (_ BitVec 32) (_ BitVec 8))) (size!9120 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14402 0))(
  ( (BitStream!14403 (buf!8262 array!21000) (currentByte!15315 (_ BitVec 32)) (currentBit!15310 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14402)

(assert (=> start!73182 (= res!266934 (and (bvsgt lt!447677 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (currentBit!15310 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73182 (= lt!447677 (remainingBits!0 ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))) ((_ sign_extend 32) (currentByte!15315 thiss!877)) ((_ sign_extend 32) (currentBit!15310 thiss!877))))))

(assert (=> start!73182 e!234509))

(declare-fun e!234510 () Bool)

(declare-fun inv!12 (BitStream!14402) Bool)

(assert (=> start!73182 (and (inv!12 thiss!877) e!234510)))

(declare-fun b!325274 () Bool)

(declare-fun res!266935 () Bool)

(assert (=> b!325274 (=> (not res!266935) (not e!234509))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325274 (= res!266935 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9120 (buf!8262 thiss!877)) (currentByte!15315 thiss!877) (currentBit!15310 thiss!877))) (bitIndex!0 (size!9120 (buf!8262 thiss!877)) (currentByte!15315 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15310 thiss!877)))))))

(declare-fun b!325275 () Bool)

(declare-fun lt!447675 () (_ BitVec 64))

(declare-fun lt!447676 () (_ BitVec 64))

(assert (=> b!325275 (= e!234509 (and (not (= lt!447676 (bvand lt!447675 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!447676 (bvand (bvsub lt!447677 lt!447675) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325275 (= lt!447676 (bvand lt!447677 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325275 (= lt!447675 (remainingBits!0 ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))) ((_ sign_extend 32) (currentByte!15315 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15310 thiss!877)))))))

(declare-fun b!325276 () Bool)

(declare-fun array_inv!8672 (array!21000) Bool)

(assert (=> b!325276 (= e!234510 (array_inv!8672 (buf!8262 thiss!877)))))

(assert (= (and start!73182 res!266934) b!325274))

(assert (= (and b!325274 res!266935) b!325275))

(assert (= start!73182 b!325276))

(declare-fun m!463267 () Bool)

(assert (=> start!73182 m!463267))

(declare-fun m!463269 () Bool)

(assert (=> start!73182 m!463269))

(declare-fun m!463271 () Bool)

(assert (=> b!325274 m!463271))

(declare-fun m!463273 () Bool)

(assert (=> b!325274 m!463273))

(declare-fun m!463275 () Bool)

(assert (=> b!325275 m!463275))

(declare-fun m!463277 () Bool)

(assert (=> b!325276 m!463277))

(push 1)

(assert (not b!325276))

(assert (not b!325275))

(assert (not start!73182))

(assert (not b!325274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107114 () Bool)

(assert (=> d!107114 (= (array_inv!8672 (buf!8262 thiss!877)) (bvsge (size!9120 (buf!8262 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325276 d!107114))

(declare-fun d!107116 () Bool)

(assert (=> d!107116 (= (remainingBits!0 ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))) ((_ sign_extend 32) (currentByte!15315 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15310 thiss!877)))) (bvsub (bvmul ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15315 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15310 thiss!877))))))))

(assert (=> b!325275 d!107116))

(declare-fun d!107118 () Bool)

(assert (=> d!107118 (= (remainingBits!0 ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))) ((_ sign_extend 32) (currentByte!15315 thiss!877)) ((_ sign_extend 32) (currentBit!15310 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15315 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15310 thiss!877)))))))

(assert (=> start!73182 d!107118))

(declare-fun d!107120 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107120 (= (inv!12 thiss!877) (invariant!0 (currentBit!15310 thiss!877) (currentByte!15315 thiss!877) (size!9120 (buf!8262 thiss!877))))))

(declare-fun bs!28194 () Bool)

(assert (= bs!28194 d!107120))

(declare-fun m!463283 () Bool)

(assert (=> bs!28194 m!463283))

(assert (=> start!73182 d!107120))

(declare-fun d!107122 () Bool)

(declare-fun e!234521 () Bool)

(assert (=> d!107122 e!234521))

(declare-fun res!266957 () Bool)

(assert (=> d!107122 (=> (not res!266957) (not e!234521))))

(declare-fun lt!447743 () (_ BitVec 64))

(declare-fun lt!447741 () (_ BitVec 64))

(declare-fun lt!447739 () (_ BitVec 64))

(assert (=> d!107122 (= res!266957 (= lt!447741 (bvsub lt!447739 lt!447743)))))

(assert (=> d!107122 (or (= (bvand lt!447739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447743 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447739 lt!447743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107122 (= lt!447743 (remainingBits!0 ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))) ((_ sign_extend 32) (currentByte!15315 thiss!877)) ((_ sign_extend 32) (currentBit!15310 thiss!877))))))

(declare-fun lt!447740 () (_ BitVec 64))

(declare-fun lt!447742 () (_ BitVec 64))

(assert (=> d!107122 (= lt!447739 (bvmul lt!447740 lt!447742))))

(assert (=> d!107122 (or (= lt!447740 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447742 (bvsdiv (bvmul lt!447740 lt!447742) lt!447740)))))

(assert (=> d!107122 (= lt!447742 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107122 (= lt!447740 ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))))))

(assert (=> d!107122 (= lt!447741 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15315 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15310 thiss!877))))))

(assert (=> d!107122 (invariant!0 (currentBit!15310 thiss!877) (currentByte!15315 thiss!877) (size!9120 (buf!8262 thiss!877)))))

(assert (=> d!107122 (= (bitIndex!0 (size!9120 (buf!8262 thiss!877)) (currentByte!15315 thiss!877) (currentBit!15310 thiss!877)) lt!447741)))

(declare-fun b!325297 () Bool)

(declare-fun res!266956 () Bool)

(assert (=> b!325297 (=> (not res!266956) (not e!234521))))

(assert (=> b!325297 (= res!266956 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447741))))

(declare-fun b!325298 () Bool)

(declare-fun lt!447738 () (_ BitVec 64))

(assert (=> b!325298 (= e!234521 (bvsle lt!447741 (bvmul lt!447738 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325298 (or (= lt!447738 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447738 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447738)))))

(assert (=> b!325298 (= lt!447738 ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))))))

(assert (= (and d!107122 res!266957) b!325297))

(assert (= (and b!325297 res!266956) b!325298))

(assert (=> d!107122 m!463267))

(assert (=> d!107122 m!463283))

(assert (=> b!325274 d!107122))

(declare-fun d!107134 () Bool)

(declare-fun e!234522 () Bool)

(assert (=> d!107134 e!234522))

(declare-fun res!266959 () Bool)

(assert (=> d!107134 (=> (not res!266959) (not e!234522))))

(declare-fun lt!447749 () (_ BitVec 64))

(declare-fun lt!447745 () (_ BitVec 64))

(declare-fun lt!447747 () (_ BitVec 64))

(assert (=> d!107134 (= res!266959 (= lt!447747 (bvsub lt!447745 lt!447749)))))

(assert (=> d!107134 (or (= (bvand lt!447745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447745 lt!447749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107134 (= lt!447749 (remainingBits!0 ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))) ((_ sign_extend 32) (currentByte!15315 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15310 thiss!877)))))))

(declare-fun lt!447746 () (_ BitVec 64))

(declare-fun lt!447748 () (_ BitVec 64))

(assert (=> d!107134 (= lt!447745 (bvmul lt!447746 lt!447748))))

(assert (=> d!107134 (or (= lt!447746 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447748 (bvsdiv (bvmul lt!447746 lt!447748) lt!447746)))))

(assert (=> d!107134 (= lt!447748 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107134 (= lt!447746 ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))))))

(assert (=> d!107134 (= lt!447747 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15315 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15310 thiss!877)))))))

(assert (=> d!107134 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15310 thiss!877)) (currentByte!15315 thiss!877) (size!9120 (buf!8262 thiss!877)))))

(assert (=> d!107134 (= (bitIndex!0 (size!9120 (buf!8262 thiss!877)) (currentByte!15315 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15310 thiss!877))) lt!447747)))

(declare-fun b!325299 () Bool)

(declare-fun res!266958 () Bool)

(assert (=> b!325299 (=> (not res!266958) (not e!234522))))

(assert (=> b!325299 (= res!266958 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447747))))

(declare-fun b!325300 () Bool)

(declare-fun lt!447744 () (_ BitVec 64))

(assert (=> b!325300 (= e!234522 (bvsle lt!447747 (bvmul lt!447744 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325300 (or (= lt!447744 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447744 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447744)))))

(assert (=> b!325300 (= lt!447744 ((_ sign_extend 32) (size!9120 (buf!8262 thiss!877))))))

(assert (= (and d!107134 res!266959) b!325299))

(assert (= (and b!325299 res!266958) b!325300))

(assert (=> d!107134 m!463275))

(declare-fun m!463289 () Bool)

(assert (=> d!107134 m!463289))

(assert (=> b!325274 d!107134))

(push 1)

(assert (not d!107134))

(assert (not d!107120))

(assert (not d!107122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

