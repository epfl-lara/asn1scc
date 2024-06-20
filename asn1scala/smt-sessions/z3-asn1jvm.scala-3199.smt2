; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73476 () Bool)

(assert start!73476)

(declare-fun res!267265 () Bool)

(declare-fun e!234873 () Bool)

(assert (=> start!73476 (=> (not res!267265) (not e!234873))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73476 (= res!267265 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73476 e!234873))

(assert (=> start!73476 true))

(declare-fun b!325667 () Bool)

(declare-fun e!234871 () Bool)

(assert (=> b!325667 (= e!234873 e!234871)))

(declare-fun res!267263 () Bool)

(assert (=> b!325667 (=> (not res!267263) (not e!234871))))

(declare-fun lt!448239 () (_ BitVec 64))

(declare-fun lt!448238 () (_ BitVec 64))

(assert (=> b!325667 (= res!267263 (or (not (= lt!448239 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448239 (bvand (bvadd lt!448238 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325667 (= lt!448239 (bvand lt!448238 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325667 (= lt!448238 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun b!325668 () Bool)

(declare-fun e!234872 () Bool)

(assert (=> b!325668 (= e!234871 e!234872)))

(declare-fun res!267264 () Bool)

(assert (=> b!325668 (=> (not res!267264) (not e!234872))))

(declare-fun lt!448240 () (_ BitVec 64))

(declare-fun lt!448241 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!325668 (= res!267264 (= lt!448240 (bvsub lt!448241 (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)))))))

(assert (=> b!325668 (= lt!448241 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)))))

(assert (=> b!325668 (= lt!448240 (bvadd lt!448238 ((_ sign_extend 32) currentBit!38)))))

(declare-fun b!325669 () Bool)

(assert (=> b!325669 (= e!234872 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448240) (not (= ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!448241 ((_ sign_extend 32) bufLength!19))))))))

(assert (= (and start!73476 res!267265) b!325667))

(assert (= (and b!325667 res!267263) b!325668))

(assert (= (and b!325668 res!267264) b!325669))

(declare-fun m!463631 () Bool)

(assert (=> start!73476 m!463631))

(declare-fun m!463633 () Bool)

(assert (=> b!325668 m!463633))

(check-sat (not b!325668) (not start!73476))
(check-sat)
