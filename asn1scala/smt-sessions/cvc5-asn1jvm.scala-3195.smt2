; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73438 () Bool)

(assert start!73438)

(declare-fun res!267205 () Bool)

(declare-fun e!234813 () Bool)

(assert (=> start!73438 (=> (not res!267205) (not e!234813))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73438 (= res!267205 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73438 e!234813))

(assert (=> start!73438 true))

(declare-fun b!325609 () Bool)

(assert (=> b!325609 (= e!234813 (and (not (= ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)) ((_ sign_extend 32) currentByte!43))))))))

(assert (= (and start!73438 res!267205) b!325609))

(declare-fun m!463597 () Bool)

(assert (=> start!73438 m!463597))

(push 1)

(assert (not start!73438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

