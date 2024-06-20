; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73448 () Bool)

(assert start!73448)

(declare-fun res!267220 () Bool)

(declare-fun e!234828 () Bool)

(assert (=> start!73448 (=> (not res!267220) (not e!234828))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73448 (= res!267220 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73448 e!234828))

(assert (=> start!73448 true))

(declare-fun lt!448154 () (_ BitVec 64))

(declare-fun b!325624 () Bool)

(declare-fun lt!448153 () (_ BitVec 64))

(assert (=> b!325624 (= e!234828 (and (= lt!448154 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!448154 (bvand (bvadd lt!448153 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325624 (= lt!448154 (bvand lt!448153 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325624 (= lt!448153 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73448 res!267220) b!325624))

(declare-fun m!463607 () Bool)

(assert (=> start!73448 m!463607))

(push 1)

(assert (not start!73448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

