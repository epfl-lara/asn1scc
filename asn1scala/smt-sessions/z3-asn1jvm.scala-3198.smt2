; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73458 () Bool)

(assert start!73458)

(declare-fun res!267240 () Bool)

(declare-fun e!234848 () Bool)

(assert (=> start!73458 (=> (not res!267240) (not e!234848))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73458 (= res!267240 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73458 e!234848))

(assert (=> start!73458 true))

(declare-fun b!325644 () Bool)

(declare-fun e!234849 () Bool)

(assert (=> b!325644 (= e!234848 e!234849)))

(declare-fun res!267241 () Bool)

(assert (=> b!325644 (=> (not res!267241) (not e!234849))))

(declare-fun lt!448200 () (_ BitVec 64))

(declare-fun lt!448202 () (_ BitVec 64))

(assert (=> b!325644 (= res!267241 (or (not (= lt!448200 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448200 (bvand (bvadd lt!448202 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325644 (= lt!448200 (bvand lt!448202 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325644 (= lt!448202 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun lt!448199 () (_ BitVec 64))

(declare-fun lt!448201 () (_ BitVec 64))

(declare-fun lt!448198 () (_ BitVec 64))

(declare-fun b!325645 () Bool)

(assert (=> b!325645 (= e!234849 (and (not (= lt!448198 (bvand lt!448201 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!448198 (bvand (bvsub lt!448199 lt!448201) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325645 (= lt!448198 (bvand lt!448199 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!325645 (= lt!448201 (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)))))

(assert (=> b!325645 (= lt!448199 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)))))

(assert (= (and start!73458 res!267240) b!325644))

(assert (= (and b!325644 res!267241) b!325645))

(declare-fun m!463619 () Bool)

(assert (=> start!73458 m!463619))

(declare-fun m!463621 () Bool)

(assert (=> b!325645 m!463621))

(check-sat (not start!73458) (not b!325645))
(check-sat)
(get-model)

(declare-fun d!107404 () Bool)

(assert (=> d!107404 (= (invariant!0 currentBit!38 currentByte!43 bufLength!19) (and (bvsge currentBit!38 #b00000000000000000000000000000000) (bvslt currentBit!38 #b00000000000000000000000000001000) (bvsge currentByte!43 #b00000000000000000000000000000000) (or (bvslt currentByte!43 bufLength!19) (and (= currentBit!38 #b00000000000000000000000000000000) (= currentByte!43 bufLength!19)))))))

(assert (=> start!73458 d!107404))

(declare-fun d!107406 () Bool)

(assert (=> d!107406 (= (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)) (bvsub (bvmul ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) currentBit!38))))))

(assert (=> b!325645 d!107406))

(check-sat)
