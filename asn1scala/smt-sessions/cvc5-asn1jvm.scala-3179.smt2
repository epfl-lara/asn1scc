; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73070 () Bool)

(assert start!73070)

(declare-fun b!325083 () Bool)

(declare-fun res!266795 () Bool)

(declare-fun e!234329 () Bool)

(assert (=> b!325083 (=> (not res!266795) (not e!234329))))

(declare-datatypes ((array!20957 0))(
  ( (array!20958 (arr!10195 (Array (_ BitVec 32) (_ BitVec 8))) (size!9103 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14368 0))(
  ( (BitStream!14369 (buf!8245 array!20957) (currentByte!15277 (_ BitVec 32)) (currentBit!15272 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14368)

(assert (=> b!325083 (= res!266795 (bvsge (currentBit!15272 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325084 () Bool)

(declare-fun e!234327 () Bool)

(declare-fun array_inv!8655 (array!20957) Bool)

(assert (=> b!325084 (= e!234327 (array_inv!8655 (buf!8245 thiss!877)))))

(declare-fun res!266797 () Bool)

(assert (=> start!73070 (=> (not res!266797) (not e!234329))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73070 (= res!266797 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))) ((_ sign_extend 32) (currentByte!15277 thiss!877)) ((_ sign_extend 32) (currentBit!15272 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73070 e!234329))

(declare-fun inv!12 (BitStream!14368) Bool)

(assert (=> start!73070 (and (inv!12 thiss!877) e!234327)))

(declare-fun b!325085 () Bool)

(declare-fun e!234330 () Bool)

(assert (=> b!325085 (= e!234329 e!234330)))

(declare-fun res!266794 () Bool)

(assert (=> b!325085 (=> (not res!266794) (not e!234330))))

(declare-fun lt!447500 () (_ BitVec 64))

(assert (=> b!325085 (= res!266794 (and (bvsle ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447500 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge lt!447500 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325085 (= lt!447500 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15277 thiss!877))))))

(declare-fun b!325086 () Bool)

(declare-fun res!266796 () Bool)

(assert (=> b!325086 (=> (not res!266796) (not e!234329))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325086 (= res!266796 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9103 (buf!8245 thiss!877)) (currentByte!15277 thiss!877) (currentBit!15272 thiss!877))) (bitIndex!0 (size!9103 (buf!8245 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15277 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun b!325087 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325087 (= e!234330 (not (invariant!0 #b00000000000000000000000000000000 ((_ extract 31 0) lt!447500) ((_ extract 31 0) ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877)))))))))

(assert (= (and start!73070 res!266797) b!325083))

(assert (= (and b!325083 res!266795) b!325086))

(assert (= (and b!325086 res!266796) b!325085))

(assert (= (and b!325085 res!266794) b!325087))

(assert (= start!73070 b!325084))

(declare-fun m!463087 () Bool)

(assert (=> b!325084 m!463087))

(declare-fun m!463089 () Bool)

(assert (=> start!73070 m!463089))

(declare-fun m!463091 () Bool)

(assert (=> start!73070 m!463091))

(declare-fun m!463093 () Bool)

(assert (=> b!325086 m!463093))

(declare-fun m!463095 () Bool)

(assert (=> b!325086 m!463095))

(declare-fun m!463097 () Bool)

(assert (=> b!325087 m!463097))

(push 1)

(assert (not b!325086))

(assert (not b!325087))

(assert (not start!73070))

(assert (not b!325084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106996 () Bool)

(declare-fun e!234361 () Bool)

(assert (=> d!106996 e!234361))

(declare-fun res!266834 () Bool)

(assert (=> d!106996 (=> (not res!266834) (not e!234361))))

(declare-fun lt!447546 () (_ BitVec 64))

(declare-fun lt!447547 () (_ BitVec 64))

(declare-fun lt!447544 () (_ BitVec 64))

(assert (=> d!106996 (= res!266834 (= lt!447546 (bvsub lt!447547 lt!447544)))))

(assert (=> d!106996 (or (= (bvand lt!447547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447544 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447547 lt!447544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106996 (= lt!447544 (remainingBits!0 ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))) ((_ sign_extend 32) (currentByte!15277 thiss!877)) ((_ sign_extend 32) (currentBit!15272 thiss!877))))))

(declare-fun lt!447548 () (_ BitVec 64))

(declare-fun lt!447543 () (_ BitVec 64))

(assert (=> d!106996 (= lt!447547 (bvmul lt!447548 lt!447543))))

(assert (=> d!106996 (or (= lt!447548 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447543 (bvsdiv (bvmul lt!447548 lt!447543) lt!447548)))))

(assert (=> d!106996 (= lt!447543 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106996 (= lt!447548 ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))))))

(assert (=> d!106996 (= lt!447546 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15277 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15272 thiss!877))))))

(assert (=> d!106996 (invariant!0 (currentBit!15272 thiss!877) (currentByte!15277 thiss!877) (size!9103 (buf!8245 thiss!877)))))

(assert (=> d!106996 (= (bitIndex!0 (size!9103 (buf!8245 thiss!877)) (currentByte!15277 thiss!877) (currentBit!15272 thiss!877)) lt!447546)))

(declare-fun b!325130 () Bool)

(declare-fun res!266835 () Bool)

(assert (=> b!325130 (=> (not res!266835) (not e!234361))))

(assert (=> b!325130 (= res!266835 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447546))))

(declare-fun b!325131 () Bool)

(declare-fun lt!447545 () (_ BitVec 64))

(assert (=> b!325131 (= e!234361 (bvsle lt!447546 (bvmul lt!447545 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325131 (or (= lt!447545 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447545 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447545)))))

(assert (=> b!325131 (= lt!447545 ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))))))

(assert (= (and d!106996 res!266834) b!325130))

(assert (= (and b!325130 res!266835) b!325131))

(assert (=> d!106996 m!463089))

(declare-fun m!463131 () Bool)

(assert (=> d!106996 m!463131))

(assert (=> b!325086 d!106996))

(declare-fun d!107016 () Bool)

(declare-fun e!234362 () Bool)

(assert (=> d!107016 e!234362))

(declare-fun res!266836 () Bool)

(assert (=> d!107016 (=> (not res!266836) (not e!234362))))

(declare-fun lt!447550 () (_ BitVec 64))

(declare-fun lt!447552 () (_ BitVec 64))

(declare-fun lt!447553 () (_ BitVec 64))

(assert (=> d!107016 (= res!266836 (= lt!447552 (bvsub lt!447553 lt!447550)))))

(assert (=> d!107016 (or (= (bvand lt!447553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447550 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447553 lt!447550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107016 (= lt!447550 (remainingBits!0 ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15277 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447554 () (_ BitVec 64))

(declare-fun lt!447549 () (_ BitVec 64))

(assert (=> d!107016 (= lt!447553 (bvmul lt!447554 lt!447549))))

(assert (=> d!107016 (or (= lt!447554 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447549 (bvsdiv (bvmul lt!447554 lt!447549) lt!447554)))))

(assert (=> d!107016 (= lt!447549 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107016 (= lt!447554 ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))))))

(assert (=> d!107016 (= lt!447552 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15277 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!107016 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15277 thiss!877)) (size!9103 (buf!8245 thiss!877)))))

(assert (=> d!107016 (= (bitIndex!0 (size!9103 (buf!8245 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15277 thiss!877)) #b00000000000000000000000000000000) lt!447552)))

(declare-fun b!325132 () Bool)

(declare-fun res!266837 () Bool)

(assert (=> b!325132 (=> (not res!266837) (not e!234362))))

(assert (=> b!325132 (= res!266837 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447552))))

(declare-fun b!325133 () Bool)

(declare-fun lt!447551 () (_ BitVec 64))

(assert (=> b!325133 (= e!234362 (bvsle lt!447552 (bvmul lt!447551 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325133 (or (= lt!447551 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447551 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447551)))))

(assert (=> b!325133 (= lt!447551 ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))))))

(assert (= (and d!107016 res!266836) b!325132))

(assert (= (and b!325132 res!266837) b!325133))

(declare-fun m!463133 () Bool)

(assert (=> d!107016 m!463133))

(declare-fun m!463135 () Bool)

(assert (=> d!107016 m!463135))

(assert (=> b!325086 d!107016))

(declare-fun d!107018 () Bool)

(assert (=> d!107018 (= (invariant!0 #b00000000000000000000000000000000 ((_ extract 31 0) lt!447500) ((_ extract 31 0) ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) lt!447500) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) lt!447500) ((_ extract 31 0) ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= ((_ extract 31 0) lt!447500) ((_ extract 31 0) ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877)))))))))))

(assert (=> b!325087 d!107018))

(declare-fun d!107020 () Bool)

(assert (=> d!107020 (= (remainingBits!0 ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))) ((_ sign_extend 32) (currentByte!15277 thiss!877)) ((_ sign_extend 32) (currentBit!15272 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9103 (buf!8245 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15277 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15272 thiss!877)))))))

(assert (=> start!73070 d!107020))

(declare-fun d!107022 () Bool)

(assert (=> d!107022 (= (inv!12 thiss!877) (invariant!0 (currentBit!15272 thiss!877) (currentByte!15277 thiss!877) (size!9103 (buf!8245 thiss!877))))))

(declare-fun bs!28168 () Bool)

(assert (= bs!28168 d!107022))

(assert (=> bs!28168 m!463131))

(assert (=> start!73070 d!107022))

(declare-fun d!107024 () Bool)

(assert (=> d!107024 (= (array_inv!8655 (buf!8245 thiss!877)) (bvsge (size!9103 (buf!8245 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325084 d!107024))

(push 1)

(assert (not d!107022))

(assert (not d!107016))

(assert (not d!106996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

