; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73478 () Bool)

(assert start!73478)

(declare-fun res!267272 () Bool)

(declare-fun e!234882 () Bool)

(assert (=> start!73478 (=> (not res!267272) (not e!234882))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73478 (= res!267272 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73478 e!234882))

(assert (=> start!73478 true))

(declare-fun b!325676 () Bool)

(declare-fun e!234881 () Bool)

(assert (=> b!325676 (= e!234882 e!234881)))

(declare-fun res!267273 () Bool)

(assert (=> b!325676 (=> (not res!267273) (not e!234881))))

(declare-fun lt!448251 () (_ BitVec 64))

(declare-fun lt!448252 () (_ BitVec 64))

(assert (=> b!325676 (= res!267273 (or (not (= lt!448252 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448252 (bvand (bvadd lt!448251 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325676 (= lt!448252 (bvand lt!448251 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325676 (= lt!448251 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun b!325677 () Bool)

(declare-fun e!234880 () Bool)

(assert (=> b!325677 (= e!234881 e!234880)))

(declare-fun res!267274 () Bool)

(assert (=> b!325677 (=> (not res!267274) (not e!234880))))

(declare-fun lt!448253 () (_ BitVec 64))

(declare-fun lt!448250 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!325677 (= res!267274 (= lt!448253 (bvsub lt!448250 (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)))))))

(assert (=> b!325677 (= lt!448250 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)))))

(assert (=> b!325677 (= lt!448253 (bvadd lt!448251 ((_ sign_extend 32) currentBit!38)))))

(declare-fun b!325678 () Bool)

(assert (=> b!325678 (= e!234880 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448253) (not (= ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!448250 ((_ sign_extend 32) bufLength!19))))))))

(assert (= (and start!73478 res!267272) b!325676))

(assert (= (and b!325676 res!267273) b!325677))

(assert (= (and b!325677 res!267274) b!325678))

(declare-fun m!463635 () Bool)

(assert (=> start!73478 m!463635))

(declare-fun m!463637 () Bool)

(assert (=> b!325677 m!463637))

(push 1)

(assert (not b!325677))

(assert (not start!73478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

