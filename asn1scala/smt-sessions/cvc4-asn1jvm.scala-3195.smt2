; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73442 () Bool)

(assert start!73442)

(declare-fun res!267211 () Bool)

(declare-fun e!234819 () Bool)

(assert (=> start!73442 (=> (not res!267211) (not e!234819))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73442 (= res!267211 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73442 e!234819))

(assert (=> start!73442 true))

(declare-fun b!325615 () Bool)

(assert (=> b!325615 (= e!234819 (and (not (= ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)) ((_ sign_extend 32) currentByte!43))))))))

(assert (= (and start!73442 res!267211) b!325615))

(declare-fun m!463601 () Bool)

(assert (=> start!73442 m!463601))

(push 1)

(assert (not start!73442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

