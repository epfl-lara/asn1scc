; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73432 () Bool)

(assert start!73432)

(declare-fun res!267189 () Bool)

(declare-fun e!234798 () Bool)

(assert (=> start!73432 (=> (not res!267189) (not e!234798))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73432 (= res!267189 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73432 e!234798))

(assert (=> start!73432 true))

(declare-fun b!325593 () Bool)

(declare-fun e!234797 () Bool)

(assert (=> b!325593 (= e!234798 e!234797)))

(declare-fun res!267190 () Bool)

(assert (=> b!325593 (=> (not res!267190) (not e!234797))))

(declare-fun lt!448123 () (_ BitVec 64))

(declare-fun lt!448124 () (_ BitVec 64))

(assert (=> b!325593 (= res!267190 (and (or (not (= lt!448124 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448124 (bvand (bvadd lt!448123 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (bvsle ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325593 (= lt!448124 (bvand lt!448123 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325593 (= lt!448123 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun b!325594 () Bool)

(assert (=> b!325594 (= e!234797 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) currentBit!38)) ((_ extract 31 0) ((_ sign_extend 32) currentByte!43)) ((_ extract 31 0) ((_ sign_extend 32) bufLength!19)))))))

(assert (= (and start!73432 res!267189) b!325593))

(assert (= (and b!325593 res!267190) b!325594))

(declare-fun m!463585 () Bool)

(assert (=> start!73432 m!463585))

(declare-fun m!463587 () Bool)

(assert (=> b!325594 m!463587))

(push 1)

(assert (not start!73432))

(assert (not b!325594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

