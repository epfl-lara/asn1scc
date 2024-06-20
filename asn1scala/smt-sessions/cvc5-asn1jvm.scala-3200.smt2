; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73480 () Bool)

(assert start!73480)

(declare-fun res!267282 () Bool)

(declare-fun e!234890 () Bool)

(assert (=> start!73480 (=> (not res!267282) (not e!234890))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73480 (= res!267282 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73480 e!234890))

(assert (=> start!73480 true))

(declare-fun b!325685 () Bool)

(declare-fun e!234891 () Bool)

(assert (=> b!325685 (= e!234890 e!234891)))

(declare-fun res!267283 () Bool)

(assert (=> b!325685 (=> (not res!267283) (not e!234891))))

(declare-fun lt!448262 () (_ BitVec 64))

(declare-fun lt!448265 () (_ BitVec 64))

(assert (=> b!325685 (= res!267283 (or (not (= lt!448265 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448265 (bvand (bvadd lt!448262 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325685 (= lt!448265 (bvand lt!448262 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325685 (= lt!448262 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun b!325686 () Bool)

(declare-fun e!234889 () Bool)

(assert (=> b!325686 (= e!234891 e!234889)))

(declare-fun res!267281 () Bool)

(assert (=> b!325686 (=> res!267281 e!234889)))

(declare-fun lt!448263 () (_ BitVec 64))

(declare-fun lt!448264 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!325686 (= res!267281 (not (= lt!448264 (bvsub lt!448263 (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38))))))))

(assert (=> b!325686 (= lt!448263 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)))))

(assert (=> b!325686 (= lt!448264 (bvadd lt!448262 ((_ sign_extend 32) currentBit!38)))))

(declare-fun b!325687 () Bool)

(assert (=> b!325687 (= e!234889 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!448264) (bvsgt lt!448264 lt!448263)))))

(assert (= (and start!73480 res!267282) b!325685))

(assert (= (and b!325685 res!267283) b!325686))

(assert (= (and b!325686 (not res!267281)) b!325687))

(declare-fun m!463639 () Bool)

(assert (=> start!73480 m!463639))

(declare-fun m!463641 () Bool)

(assert (=> b!325686 m!463641))

(push 1)

(assert (not start!73480))

(assert (not b!325686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107420 () Bool)

(assert (=> d!107420 (= (invariant!0 currentBit!38 currentByte!43 bufLength!19) (and (bvsge currentBit!38 #b00000000000000000000000000000000) (bvslt currentBit!38 #b00000000000000000000000000001000) (bvsge currentByte!43 #b00000000000000000000000000000000) (or (bvslt currentByte!43 bufLength!19) (and (= currentBit!38 #b00000000000000000000000000000000) (= currentByte!43 bufLength!19)))))))

(assert (=> start!73480 d!107420))

(declare-fun d!107422 () Bool)

(assert (=> d!107422 (= (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)) (bvsub (bvmul ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) currentBit!38))))))

(assert (=> b!325686 d!107422))

(push 1)

(check-sat)

