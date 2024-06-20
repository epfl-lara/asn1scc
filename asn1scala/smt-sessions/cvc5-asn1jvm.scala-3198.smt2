; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73456 () Bool)

(assert start!73456)

(declare-fun res!267235 () Bool)

(declare-fun e!234843 () Bool)

(assert (=> start!73456 (=> (not res!267235) (not e!234843))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73456 (= res!267235 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73456 e!234843))

(assert (=> start!73456 true))

(declare-fun b!325638 () Bool)

(declare-fun e!234842 () Bool)

(assert (=> b!325638 (= e!234843 e!234842)))

(declare-fun res!267234 () Bool)

(assert (=> b!325638 (=> (not res!267234) (not e!234842))))

(declare-fun lt!448187 () (_ BitVec 64))

(declare-fun lt!448186 () (_ BitVec 64))

(assert (=> b!325638 (= res!267234 (or (not (= lt!448186 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448186 (bvand (bvadd lt!448187 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325638 (= lt!448186 (bvand lt!448187 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325638 (= lt!448187 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun lt!448185 () (_ BitVec 64))

(declare-fun lt!448184 () (_ BitVec 64))

(declare-fun b!325639 () Bool)

(declare-fun lt!448183 () (_ BitVec 64))

(assert (=> b!325639 (= e!234842 (and (not (= lt!448185 (bvand lt!448183 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!448185 (bvand (bvsub lt!448184 lt!448183) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325639 (= lt!448185 (bvand lt!448184 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!325639 (= lt!448183 (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)))))

(assert (=> b!325639 (= lt!448184 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)))))

(assert (= (and start!73456 res!267235) b!325638))

(assert (= (and b!325638 res!267234) b!325639))

(declare-fun m!463615 () Bool)

(assert (=> start!73456 m!463615))

(declare-fun m!463617 () Bool)

(assert (=> b!325639 m!463617))

(push 1)

(assert (not b!325639))

(assert (not start!73456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107400 () Bool)

(assert (=> d!107400 (= (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)) (bvsub (bvmul ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) currentBit!38))))))

(assert (=> b!325639 d!107400))

(declare-fun d!107402 () Bool)

(assert (=> d!107402 (= (invariant!0 currentBit!38 currentByte!43 bufLength!19) (and (bvsge currentBit!38 #b00000000000000000000000000000000) (bvslt currentBit!38 #b00000000000000000000000000001000) (bvsge currentByte!43 #b00000000000000000000000000000000) (or (bvslt currentByte!43 bufLength!19) (and (= currentBit!38 #b00000000000000000000000000000000) (= currentByte!43 bufLength!19)))))))

(assert (=> start!73456 d!107402))

(push 1)

(check-sat)

(pop 1)

