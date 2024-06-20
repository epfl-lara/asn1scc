; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73444 () Bool)

(assert start!73444)

(declare-fun res!267214 () Bool)

(declare-fun e!234822 () Bool)

(assert (=> start!73444 (=> (not res!267214) (not e!234822))))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73444 (= res!267214 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73444 e!234822))

(assert (=> start!73444 true))

(declare-fun lt!448142 () (_ BitVec 64))

(declare-fun lt!448141 () (_ BitVec 64))

(declare-fun b!325618 () Bool)

(assert (=> b!325618 (= e!234822 (and (= lt!448142 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!448142 (bvand (bvadd lt!448141 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325618 (= lt!448142 (bvand lt!448141 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325618 (= lt!448141 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73444 res!267214) b!325618))

(declare-fun m!463603 () Bool)

(assert (=> start!73444 m!463603))

(push 1)

(assert (not start!73444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

