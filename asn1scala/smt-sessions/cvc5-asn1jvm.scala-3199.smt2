; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73474 () Bool)

(assert start!73474)

(declare-fun res!267255 () Bool)

(declare-fun e!234863 () Bool)

(assert (=> start!73474 (=> (not res!267255) (not e!234863))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73474 (= res!267255 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73474 e!234863))

(assert (=> start!73474 true))

(declare-fun b!325658 () Bool)

(declare-fun e!234864 () Bool)

(assert (=> b!325658 (= e!234863 e!234864)))

(declare-fun res!267254 () Bool)

(assert (=> b!325658 (=> (not res!267254) (not e!234864))))

(declare-fun lt!448227 () (_ BitVec 64))

(declare-fun lt!448228 () (_ BitVec 64))

(assert (=> b!325658 (= res!267254 (or (not (= lt!448228 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448228 (bvand (bvadd lt!448227 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325658 (= lt!448228 (bvand lt!448227 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325658 (= lt!448227 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun b!325659 () Bool)

(declare-fun e!234862 () Bool)

(assert (=> b!325659 (= e!234864 e!234862)))

(declare-fun res!267256 () Bool)

(assert (=> b!325659 (=> (not res!267256) (not e!234862))))

(declare-fun lt!448229 () (_ BitVec 64))

(declare-fun lt!448226 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!325659 (= res!267256 (= lt!448226 (bvsub lt!448229 (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)))))))

(assert (=> b!325659 (= lt!448229 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)))))

(assert (=> b!325659 (= lt!448226 (bvadd lt!448227 ((_ sign_extend 32) currentBit!38)))))

(declare-fun b!325660 () Bool)

(assert (=> b!325660 (= e!234862 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448226) (not (= ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!448229 ((_ sign_extend 32) bufLength!19))))))))

(assert (= (and start!73474 res!267255) b!325658))

(assert (= (and b!325658 res!267254) b!325659))

(assert (= (and b!325659 res!267256) b!325660))

(declare-fun m!463627 () Bool)

(assert (=> start!73474 m!463627))

(declare-fun m!463629 () Bool)

(assert (=> b!325659 m!463629))

(push 1)

(assert (not start!73474))

(assert (not b!325659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

