; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73074 () Bool)

(assert start!73074)

(declare-fun b!325113 () Bool)

(declare-fun res!266820 () Bool)

(declare-fun e!234351 () Bool)

(assert (=> b!325113 (=> (not res!266820) (not e!234351))))

(declare-datatypes ((array!20961 0))(
  ( (array!20962 (arr!10197 (Array (_ BitVec 32) (_ BitVec 8))) (size!9105 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14372 0))(
  ( (BitStream!14373 (buf!8247 array!20961) (currentByte!15279 (_ BitVec 32)) (currentBit!15274 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14372)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325113 (= res!266820 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9105 (buf!8247 thiss!877)) (currentByte!15279 thiss!877) (currentBit!15274 thiss!877))) (bitIndex!0 (size!9105 (buf!8247 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15279 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun res!266821 () Bool)

(assert (=> start!73074 (=> (not res!266821) (not e!234351))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73074 (= res!266821 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))) ((_ sign_extend 32) (currentByte!15279 thiss!877)) ((_ sign_extend 32) (currentBit!15274 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73074 e!234351))

(declare-fun e!234354 () Bool)

(declare-fun inv!12 (BitStream!14372) Bool)

(assert (=> start!73074 (and (inv!12 thiss!877) e!234354)))

(declare-fun b!325114 () Bool)

(declare-fun e!234353 () Bool)

(declare-fun lt!447506 () (_ BitVec 64))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325114 (= e!234353 (not (invariant!0 #b00000000000000000000000000000000 ((_ extract 31 0) lt!447506) ((_ extract 31 0) ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877)))))))))

(declare-fun b!325115 () Bool)

(declare-fun res!266818 () Bool)

(assert (=> b!325115 (=> (not res!266818) (not e!234351))))

(assert (=> b!325115 (= res!266818 (bvsge (currentBit!15274 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325116 () Bool)

(assert (=> b!325116 (= e!234351 e!234353)))

(declare-fun res!266819 () Bool)

(assert (=> b!325116 (=> (not res!266819) (not e!234353))))

(assert (=> b!325116 (= res!266819 (and (bvsle ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447506 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge lt!447506 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325116 (= lt!447506 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15279 thiss!877))))))

(declare-fun b!325117 () Bool)

(declare-fun array_inv!8657 (array!20961) Bool)

(assert (=> b!325117 (= e!234354 (array_inv!8657 (buf!8247 thiss!877)))))

(assert (= (and start!73074 res!266821) b!325115))

(assert (= (and b!325115 res!266818) b!325113))

(assert (= (and b!325113 res!266820) b!325116))

(assert (= (and b!325116 res!266819) b!325114))

(assert (= start!73074 b!325117))

(declare-fun m!463111 () Bool)

(assert (=> b!325113 m!463111))

(declare-fun m!463113 () Bool)

(assert (=> b!325113 m!463113))

(declare-fun m!463115 () Bool)

(assert (=> start!73074 m!463115))

(declare-fun m!463117 () Bool)

(assert (=> start!73074 m!463117))

(declare-fun m!463119 () Bool)

(assert (=> b!325114 m!463119))

(declare-fun m!463121 () Bool)

(assert (=> b!325117 m!463121))

(push 1)

(assert (not b!325117))

(assert (not start!73074))

(assert (not b!325113))

(assert (not b!325114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107004 () Bool)

(assert (=> d!107004 (= (array_inv!8657 (buf!8247 thiss!877)) (bvsge (size!9105 (buf!8247 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325117 d!107004))

(declare-fun d!107008 () Bool)

(assert (=> d!107008 (= (remainingBits!0 ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))) ((_ sign_extend 32) (currentByte!15279 thiss!877)) ((_ sign_extend 32) (currentBit!15274 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15279 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15274 thiss!877)))))))

(assert (=> start!73074 d!107008))

(declare-fun d!107012 () Bool)

(assert (=> d!107012 (= (inv!12 thiss!877) (invariant!0 (currentBit!15274 thiss!877) (currentByte!15279 thiss!877) (size!9105 (buf!8247 thiss!877))))))

(declare-fun bs!28167 () Bool)

(assert (= bs!28167 d!107012))

(declare-fun m!463129 () Bool)

(assert (=> bs!28167 m!463129))

(assert (=> start!73074 d!107012))

(declare-fun d!107014 () Bool)

(declare-fun e!234365 () Bool)

(assert (=> d!107014 e!234365))

(declare-fun res!266842 () Bool)

(assert (=> d!107014 (=> (not res!266842) (not e!234365))))

(declare-fun lt!447572 () (_ BitVec 64))

(declare-fun lt!447567 () (_ BitVec 64))

(declare-fun lt!447569 () (_ BitVec 64))

(assert (=> d!107014 (= res!266842 (= lt!447572 (bvsub lt!447569 lt!447567)))))

(assert (=> d!107014 (or (= (bvand lt!447569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447567 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447569 lt!447567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107014 (= lt!447567 (remainingBits!0 ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))) ((_ sign_extend 32) (currentByte!15279 thiss!877)) ((_ sign_extend 32) (currentBit!15274 thiss!877))))))

(declare-fun lt!447571 () (_ BitVec 64))

(declare-fun lt!447570 () (_ BitVec 64))

(assert (=> d!107014 (= lt!447569 (bvmul lt!447571 lt!447570))))

(assert (=> d!107014 (or (= lt!447571 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447570 (bvsdiv (bvmul lt!447571 lt!447570) lt!447571)))))

(assert (=> d!107014 (= lt!447570 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107014 (= lt!447571 ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))))))

(assert (=> d!107014 (= lt!447572 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15279 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15274 thiss!877))))))

(assert (=> d!107014 (invariant!0 (currentBit!15274 thiss!877) (currentByte!15279 thiss!877) (size!9105 (buf!8247 thiss!877)))))

(assert (=> d!107014 (= (bitIndex!0 (size!9105 (buf!8247 thiss!877)) (currentByte!15279 thiss!877) (currentBit!15274 thiss!877)) lt!447572)))

(declare-fun b!325138 () Bool)

(declare-fun res!266843 () Bool)

(assert (=> b!325138 (=> (not res!266843) (not e!234365))))

(assert (=> b!325138 (= res!266843 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447572))))

(declare-fun b!325139 () Bool)

(declare-fun lt!447568 () (_ BitVec 64))

(assert (=> b!325139 (= e!234365 (bvsle lt!447572 (bvmul lt!447568 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325139 (or (= lt!447568 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447568 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447568)))))

(assert (=> b!325139 (= lt!447568 ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))))))

(assert (= (and d!107014 res!266842) b!325138))

(assert (= (and b!325138 res!266843) b!325139))

(assert (=> d!107014 m!463115))

(assert (=> d!107014 m!463129))

(assert (=> b!325113 d!107014))

(declare-fun d!107026 () Bool)

(declare-fun e!234366 () Bool)

(assert (=> d!107026 e!234366))

(declare-fun res!266844 () Bool)

(assert (=> d!107026 (=> (not res!266844) (not e!234366))))

(declare-fun lt!447578 () (_ BitVec 64))

(declare-fun lt!447575 () (_ BitVec 64))

(declare-fun lt!447573 () (_ BitVec 64))

(assert (=> d!107026 (= res!266844 (= lt!447578 (bvsub lt!447575 lt!447573)))))

(assert (=> d!107026 (or (= (bvand lt!447575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447573 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447575 lt!447573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107026 (= lt!447573 (remainingBits!0 ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15279 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447577 () (_ BitVec 64))

(declare-fun lt!447576 () (_ BitVec 64))

(assert (=> d!107026 (= lt!447575 (bvmul lt!447577 lt!447576))))

(assert (=> d!107026 (or (= lt!447577 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447576 (bvsdiv (bvmul lt!447577 lt!447576) lt!447577)))))

(assert (=> d!107026 (= lt!447576 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107026 (= lt!447577 ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))))))

(assert (=> d!107026 (= lt!447578 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15279 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!107026 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15279 thiss!877)) (size!9105 (buf!8247 thiss!877)))))

(assert (=> d!107026 (= (bitIndex!0 (size!9105 (buf!8247 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15279 thiss!877)) #b00000000000000000000000000000000) lt!447578)))

(declare-fun b!325140 () Bool)

(declare-fun res!266845 () Bool)

(assert (=> b!325140 (=> (not res!266845) (not e!234366))))

(assert (=> b!325140 (= res!266845 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447578))))

(declare-fun b!325141 () Bool)

(declare-fun lt!447574 () (_ BitVec 64))

(assert (=> b!325141 (= e!234366 (bvsle lt!447578 (bvmul lt!447574 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325141 (or (= lt!447574 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447574 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447574)))))

(assert (=> b!325141 (= lt!447574 ((_ sign_extend 32) (size!9105 (buf!8247 thiss!877))))))

(assert (= (and d!107026 res!266844) b!325140))

(assert (= (and b!325140 res!266845) b!325141))

(declare-fun m!463137 () Bool)

(assert (=> d!107026 m!463137))

(declare-fun m!463139 () Bool)

