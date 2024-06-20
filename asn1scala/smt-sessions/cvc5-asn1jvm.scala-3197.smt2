; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73450 () Bool)

(assert start!73450)

(declare-fun res!267223 () Bool)

(declare-fun e!234831 () Bool)

(assert (=> start!73450 (=> (not res!267223) (not e!234831))))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73450 (= res!267223 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73450 e!234831))

(assert (=> start!73450 true))

(declare-fun b!325627 () Bool)

(declare-fun lt!448159 () (_ BitVec 64))

(declare-fun lt!448160 () (_ BitVec 64))

(assert (=> b!325627 (= e!234831 (and (or (not (= lt!448160 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448160 (bvand (bvadd lt!448159 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)) ((_ sign_extend 32) bufLength!19))))))))

(assert (=> b!325627 (= lt!448160 (bvand lt!448159 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325627 (= lt!448159 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73450 res!267223) b!325627))

(declare-fun m!463609 () Bool)

(assert (=> start!73450 m!463609))

(push 1)

(assert (not start!73450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

