; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73044 () Bool)

(assert start!73044)

(declare-fun b!325047 () Bool)

(declare-fun e!234304 () Bool)

(declare-datatypes ((array!20952 0))(
  ( (array!20953 (arr!10194 (Array (_ BitVec 32) (_ BitVec 8))) (size!9102 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14366 0))(
  ( (BitStream!14367 (buf!8244 array!20952) (currentByte!15270 (_ BitVec 32)) (currentBit!15265 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14366)

(declare-fun lt!447425 () (_ BitVec 64))

(assert (=> b!325047 (= e!234304 (and (bvsle ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447425 #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt lt!447425 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325047 (= lt!447425 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15270 thiss!877))))))

(declare-fun res!266760 () Bool)

(assert (=> start!73044 (=> (not res!266760) (not e!234304))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73044 (= res!266760 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))) ((_ sign_extend 32) (currentByte!15270 thiss!877)) ((_ sign_extend 32) (currentBit!15265 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73044 e!234304))

(declare-fun e!234306 () Bool)

(declare-fun inv!12 (BitStream!14366) Bool)

(assert (=> start!73044 (and (inv!12 thiss!877) e!234306)))

(declare-fun b!325045 () Bool)

(declare-fun res!266759 () Bool)

(assert (=> b!325045 (=> (not res!266759) (not e!234304))))

(assert (=> b!325045 (= res!266759 (bvsge (currentBit!15265 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325048 () Bool)

(declare-fun array_inv!8654 (array!20952) Bool)

(assert (=> b!325048 (= e!234306 (array_inv!8654 (buf!8244 thiss!877)))))

(declare-fun b!325046 () Bool)

(declare-fun res!266761 () Bool)

(assert (=> b!325046 (=> (not res!266761) (not e!234304))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325046 (= res!266761 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9102 (buf!8244 thiss!877)) (currentByte!15270 thiss!877) (currentBit!15265 thiss!877))) (bitIndex!0 (size!9102 (buf!8244 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15270 thiss!877)) #b00000000000000000000000000000000)))))

(assert (= (and start!73044 res!266760) b!325045))

(assert (= (and b!325045 res!266759) b!325046))

(assert (= (and b!325046 res!266761) b!325047))

(assert (= start!73044 b!325048))

(declare-fun m!463059 () Bool)

(assert (=> start!73044 m!463059))

(declare-fun m!463061 () Bool)

(assert (=> start!73044 m!463061))

(declare-fun m!463063 () Bool)

(assert (=> b!325048 m!463063))

(declare-fun m!463065 () Bool)

(assert (=> b!325046 m!463065))

(declare-fun m!463067 () Bool)

(assert (=> b!325046 m!463067))

(push 1)

(assert (not start!73044))

(assert (not b!325046))

(assert (not b!325048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106980 () Bool)

(assert (=> d!106980 (= (remainingBits!0 ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))) ((_ sign_extend 32) (currentByte!15270 thiss!877)) ((_ sign_extend 32) (currentBit!15265 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15270 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15265 thiss!877)))))))

(assert (=> start!73044 d!106980))

(declare-fun d!106982 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106982 (= (inv!12 thiss!877) (invariant!0 (currentBit!15265 thiss!877) (currentByte!15270 thiss!877) (size!9102 (buf!8244 thiss!877))))))

(declare-fun bs!28162 () Bool)

(assert (= bs!28162 d!106982))

(declare-fun m!463077 () Bool)

(assert (=> bs!28162 m!463077))

(assert (=> start!73044 d!106982))

(declare-fun d!106984 () Bool)

(declare-fun e!234317 () Bool)

(assert (=> d!106984 e!234317))

(declare-fun res!266782 () Bool)

(assert (=> d!106984 (=> (not res!266782) (not e!234317))))

(declare-fun lt!447487 () (_ BitVec 64))

(declare-fun lt!447489 () (_ BitVec 64))

(declare-fun lt!447486 () (_ BitVec 64))

(assert (=> d!106984 (= res!266782 (= lt!447487 (bvsub lt!447489 lt!447486)))))

(assert (=> d!106984 (or (= (bvand lt!447489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447486 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447489 lt!447486) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106984 (= lt!447486 (remainingBits!0 ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))) ((_ sign_extend 32) (currentByte!15270 thiss!877)) ((_ sign_extend 32) (currentBit!15265 thiss!877))))))

(declare-fun lt!447488 () (_ BitVec 64))

(declare-fun lt!447490 () (_ BitVec 64))

(assert (=> d!106984 (= lt!447489 (bvmul lt!447488 lt!447490))))

(assert (=> d!106984 (or (= lt!447488 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447490 (bvsdiv (bvmul lt!447488 lt!447490) lt!447488)))))

(assert (=> d!106984 (= lt!447490 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106984 (= lt!447488 ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))))))

(assert (=> d!106984 (= lt!447487 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15270 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15265 thiss!877))))))

(assert (=> d!106984 (invariant!0 (currentBit!15265 thiss!877) (currentByte!15270 thiss!877) (size!9102 (buf!8244 thiss!877)))))

(assert (=> d!106984 (= (bitIndex!0 (size!9102 (buf!8244 thiss!877)) (currentByte!15270 thiss!877) (currentBit!15265 thiss!877)) lt!447487)))

(declare-fun b!325069 () Bool)

(declare-fun res!266783 () Bool)

(assert (=> b!325069 (=> (not res!266783) (not e!234317))))

(assert (=> b!325069 (= res!266783 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447487))))

(declare-fun b!325070 () Bool)

(declare-fun lt!447491 () (_ BitVec 64))

(assert (=> b!325070 (= e!234317 (bvsle lt!447487 (bvmul lt!447491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325070 (or (= lt!447491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447491)))))

(assert (=> b!325070 (= lt!447491 ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))))))

(assert (= (and d!106984 res!266782) b!325069))

(assert (= (and b!325069 res!266783) b!325070))

(assert (=> d!106984 m!463059))

(assert (=> d!106984 m!463077))

(assert (=> b!325046 d!106984))

(declare-fun d!106988 () Bool)

(declare-fun e!234318 () Bool)

(assert (=> d!106988 e!234318))

(declare-fun res!266784 () Bool)

(assert (=> d!106988 (=> (not res!266784) (not e!234318))))

(declare-fun lt!447492 () (_ BitVec 64))

(declare-fun lt!447493 () (_ BitVec 64))

(declare-fun lt!447495 () (_ BitVec 64))

(assert (=> d!106988 (= res!266784 (= lt!447493 (bvsub lt!447495 lt!447492)))))

(assert (=> d!106988 (or (= (bvand lt!447495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447495 lt!447492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106988 (= lt!447492 (remainingBits!0 ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15270 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447494 () (_ BitVec 64))

(declare-fun lt!447496 () (_ BitVec 64))

(assert (=> d!106988 (= lt!447495 (bvmul lt!447494 lt!447496))))

(assert (=> d!106988 (or (= lt!447494 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447496 (bvsdiv (bvmul lt!447494 lt!447496) lt!447494)))))

(assert (=> d!106988 (= lt!447496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106988 (= lt!447494 ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))))))

(assert (=> d!106988 (= lt!447493 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15270 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!106988 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15270 thiss!877)) (size!9102 (buf!8244 thiss!877)))))

(assert (=> d!106988 (= (bitIndex!0 (size!9102 (buf!8244 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15270 thiss!877)) #b00000000000000000000000000000000) lt!447493)))

(declare-fun b!325071 () Bool)

(declare-fun res!266785 () Bool)

(assert (=> b!325071 (=> (not res!266785) (not e!234318))))

(assert (=> b!325071 (= res!266785 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447493))))

(declare-fun b!325072 () Bool)

(declare-fun lt!447497 () (_ BitVec 64))

(assert (=> b!325072 (= e!234318 (bvsle lt!447493 (bvmul lt!447497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325072 (or (= lt!447497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447497)))))

(assert (=> b!325072 (= lt!447497 ((_ sign_extend 32) (size!9102 (buf!8244 thiss!877))))))

(assert (= (and d!106988 res!266784) b!325071))

(assert (= (and b!325071 res!266785) b!325072))

(declare-fun m!463083 () Bool)

(assert (=> d!106988 m!463083))

(declare-fun m!463085 () Bool)

(assert (=> d!106988 m!463085))

(assert (=> b!325046 d!106988))

(declare-fun d!106990 () Bool)

(assert (=> d!106990 (= (array_inv!8654 (buf!8244 thiss!877)) (bvsge (size!9102 (buf!8244 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325048 d!106990))

(push 1)

(assert (not d!106988))

(assert (not d!106984))

(assert (not d!106982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

