; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73426 () Bool)

(assert start!73426)

(declare-fun res!267184 () Bool)

(declare-fun e!234792 () Bool)

(assert (=> start!73426 (=> (not res!267184) (not e!234792))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73426 (= res!267184 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73426 e!234792))

(assert (=> start!73426 true))

(declare-fun b!325588 () Bool)

(declare-fun lt!448117 () (_ BitVec 64))

(declare-fun lt!448118 () (_ BitVec 64))

(assert (=> b!325588 (= e!234792 (and (or (not (= lt!448118 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448118 (bvand (bvadd lt!448117 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (bvsle ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325588 (= lt!448118 (bvand lt!448117 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325588 (= lt!448117 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73426 res!267184) b!325588))

(declare-fun m!463583 () Bool)

(assert (=> start!73426 m!463583))

(push 1)

(assert (not start!73426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

