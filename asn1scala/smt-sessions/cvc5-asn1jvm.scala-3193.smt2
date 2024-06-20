; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73422 () Bool)

(assert start!73422)

(declare-fun res!267178 () Bool)

(declare-fun e!234786 () Bool)

(assert (=> start!73422 (=> (not res!267178) (not e!234786))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73422 (= res!267178 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73422 e!234786))

(assert (=> start!73422 true))

(declare-fun lt!448106 () (_ BitVec 64))

(declare-fun lt!448105 () (_ BitVec 64))

(declare-fun b!325582 () Bool)

(assert (=> b!325582 (= e!234786 (and (or (not (= lt!448106 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448106 (bvand (bvadd lt!448105 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (bvsle ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325582 (= lt!448106 (bvand lt!448105 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325582 (= lt!448105 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73422 res!267178) b!325582))

(declare-fun m!463579 () Bool)

(assert (=> start!73422 m!463579))

(push 1)

(assert (not start!73422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107388 () Bool)

(assert (=> d!107388 (= (invariant!0 currentBit!38 currentByte!43 bufLength!19) (and (bvsge currentBit!38 #b00000000000000000000000000000000) (bvslt currentBit!38 #b00000000000000000000000000001000) (bvsge currentByte!43 #b00000000000000000000000000000000) (or (bvslt currentByte!43 bufLength!19) (and (= currentBit!38 #b00000000000000000000000000000000) (= currentByte!43 bufLength!19)))))))

(assert (=> start!73422 d!107388))

(push 1)

(check-sat)

