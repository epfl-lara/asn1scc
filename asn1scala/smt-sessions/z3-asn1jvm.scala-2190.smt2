; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55578 () Bool)

(assert start!55578)

(declare-fun b!258724 () Bool)

(declare-fun e!179451 () Bool)

(declare-datatypes ((array!14096 0))(
  ( (array!14097 (arr!7163 (Array (_ BitVec 32) (_ BitVec 8))) (size!6176 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11274 0))(
  ( (BitStream!11275 (buf!6698 array!14096) (currentByte!12309 (_ BitVec 32)) (currentBit!12304 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11274)

(declare-fun array_inv!5917 (array!14096) Bool)

(assert (=> b!258724 (= e!179451 (array_inv!5917 (buf!6698 thiss!1754)))))

(declare-fun b!258721 () Bool)

(declare-fun res!216730 () Bool)

(declare-fun e!179450 () Bool)

(assert (=> b!258721 (=> (not res!216730) (not e!179450))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258721 (= res!216730 (validate_offset_bits!1 ((_ sign_extend 32) (size!6176 (buf!6698 thiss!1754))) ((_ sign_extend 32) (currentByte!12309 thiss!1754)) ((_ sign_extend 32) (currentBit!12304 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258722 () Bool)

(declare-fun res!216729 () Bool)

(assert (=> b!258722 (=> (not res!216729) (not e!179450))))

(assert (=> b!258722 (= res!216729 (= from!526 nBits!535))))

(declare-fun b!258723 () Bool)

(declare-fun lt!400451 () (_ BitVec 64))

(declare-fun lt!400450 () (_ BitVec 64))

(assert (=> b!258723 (= e!179450 (and (not (= lt!400451 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!400451 (bvand (bvsub lt!400450 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258723 (= lt!400451 (bvand lt!400450 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258723 (= lt!400450 (bvadd (bitIndex!0 (size!6176 (buf!6698 thiss!1754)) (currentByte!12309 thiss!1754) (currentBit!12304 thiss!1754)) nBits!535))))

(declare-fun res!216728 () Bool)

(assert (=> start!55578 (=> (not res!216728) (not e!179450))))

(assert (=> start!55578 (= res!216728 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55578 e!179450))

(assert (=> start!55578 true))

(declare-fun inv!12 (BitStream!11274) Bool)

(assert (=> start!55578 (and (inv!12 thiss!1754) e!179451)))

(assert (= (and start!55578 res!216728) b!258721))

(assert (= (and b!258721 res!216730) b!258722))

(assert (= (and b!258722 res!216729) b!258723))

(assert (= start!55578 b!258724))

(declare-fun m!388111 () Bool)

(assert (=> b!258724 m!388111))

(declare-fun m!388113 () Bool)

(assert (=> b!258721 m!388113))

(declare-fun m!388115 () Bool)

(assert (=> b!258723 m!388115))

(declare-fun m!388117 () Bool)

(assert (=> start!55578 m!388117))

(check-sat (not b!258721) (not b!258724) (not b!258723) (not start!55578))
(check-sat)
(get-model)

(declare-fun d!86830 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86830 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6176 (buf!6698 thiss!1754))) ((_ sign_extend 32) (currentByte!12309 thiss!1754)) ((_ sign_extend 32) (currentBit!12304 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6176 (buf!6698 thiss!1754))) ((_ sign_extend 32) (currentByte!12309 thiss!1754)) ((_ sign_extend 32) (currentBit!12304 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21975 () Bool)

(assert (= bs!21975 d!86830))

(declare-fun m!388127 () Bool)

(assert (=> bs!21975 m!388127))

(assert (=> b!258721 d!86830))

(declare-fun d!86834 () Bool)

(assert (=> d!86834 (= (array_inv!5917 (buf!6698 thiss!1754)) (bvsge (size!6176 (buf!6698 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258724 d!86834))

(declare-fun d!86836 () Bool)

(declare-fun e!179466 () Bool)

(assert (=> d!86836 e!179466))

(declare-fun res!216749 () Bool)

(assert (=> d!86836 (=> (not res!216749) (not e!179466))))

(declare-fun lt!400483 () (_ BitVec 64))

(declare-fun lt!400492 () (_ BitVec 64))

(declare-fun lt!400486 () (_ BitVec 64))

(assert (=> d!86836 (= res!216749 (= lt!400483 (bvsub lt!400486 lt!400492)))))

(assert (=> d!86836 (or (= (bvand lt!400486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400486 lt!400492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86836 (= lt!400492 (remainingBits!0 ((_ sign_extend 32) (size!6176 (buf!6698 thiss!1754))) ((_ sign_extend 32) (currentByte!12309 thiss!1754)) ((_ sign_extend 32) (currentBit!12304 thiss!1754))))))

(declare-fun lt!400488 () (_ BitVec 64))

(declare-fun lt!400485 () (_ BitVec 64))

(assert (=> d!86836 (= lt!400486 (bvmul lt!400488 lt!400485))))

(assert (=> d!86836 (or (= lt!400488 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400485 (bvsdiv (bvmul lt!400488 lt!400485) lt!400488)))))

(assert (=> d!86836 (= lt!400485 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86836 (= lt!400488 ((_ sign_extend 32) (size!6176 (buf!6698 thiss!1754))))))

(assert (=> d!86836 (= lt!400483 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12309 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12304 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86836 (invariant!0 (currentBit!12304 thiss!1754) (currentByte!12309 thiss!1754) (size!6176 (buf!6698 thiss!1754)))))

(assert (=> d!86836 (= (bitIndex!0 (size!6176 (buf!6698 thiss!1754)) (currentByte!12309 thiss!1754) (currentBit!12304 thiss!1754)) lt!400483)))

(declare-fun b!258745 () Bool)

(declare-fun res!216750 () Bool)

(assert (=> b!258745 (=> (not res!216750) (not e!179466))))

(assert (=> b!258745 (= res!216750 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400483))))

(declare-fun b!258747 () Bool)

(declare-fun lt!400490 () (_ BitVec 64))

(assert (=> b!258747 (= e!179466 (bvsle lt!400483 (bvmul lt!400490 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258747 (or (= lt!400490 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400490 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400490)))))

(assert (=> b!258747 (= lt!400490 ((_ sign_extend 32) (size!6176 (buf!6698 thiss!1754))))))

(assert (= (and d!86836 res!216749) b!258745))

(assert (= (and b!258745 res!216750) b!258747))

(assert (=> d!86836 m!388127))

(declare-fun m!388131 () Bool)

(assert (=> d!86836 m!388131))

(assert (=> b!258723 d!86836))

(declare-fun d!86844 () Bool)

(assert (=> d!86844 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12304 thiss!1754) (currentByte!12309 thiss!1754) (size!6176 (buf!6698 thiss!1754))))))

(declare-fun bs!21977 () Bool)

(assert (= bs!21977 d!86844))

(assert (=> bs!21977 m!388131))

(assert (=> start!55578 d!86844))

(check-sat (not d!86844) (not d!86836) (not d!86830))
