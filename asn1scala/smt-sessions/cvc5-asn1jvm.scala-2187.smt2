; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55486 () Bool)

(assert start!55486)

(declare-fun res!216584 () Bool)

(declare-fun e!179333 () Bool)

(assert (=> start!55486 (=> (not res!216584) (not e!179333))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55486 (= res!216584 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55486 e!179333))

(assert (=> start!55486 true))

(declare-datatypes ((array!14067 0))(
  ( (array!14068 (arr!7153 (Array (_ BitVec 32) (_ BitVec 8))) (size!6166 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11254 0))(
  ( (BitStream!11255 (buf!6688 array!14067) (currentByte!12281 (_ BitVec 32)) (currentBit!12276 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11254)

(declare-fun e!179335 () Bool)

(declare-fun inv!12 (BitStream!11254) Bool)

(assert (=> start!55486 (and (inv!12 thiss!1754) e!179335)))

(declare-fun b!258550 () Bool)

(declare-fun array_inv!5907 (array!14067) Bool)

(assert (=> b!258550 (= e!179335 (array_inv!5907 (buf!6688 thiss!1754)))))

(declare-fun b!258547 () Bool)

(declare-fun res!216585 () Bool)

(assert (=> b!258547 (=> (not res!216585) (not e!179333))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258547 (= res!216585 (validate_offset_bits!1 ((_ sign_extend 32) (size!6166 (buf!6688 thiss!1754))) ((_ sign_extend 32) (currentByte!12281 thiss!1754)) ((_ sign_extend 32) (currentBit!12276 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258548 () Bool)

(declare-fun res!216586 () Bool)

(assert (=> b!258548 (=> (not res!216586) (not e!179333))))

(assert (=> b!258548 (= res!216586 (= from!526 nBits!535))))

(declare-fun lt!400228 () (_ BitVec 64))

(declare-fun lt!400229 () (_ BitVec 64))

(declare-fun b!258549 () Bool)

(assert (=> b!258549 (= e!179333 (and (= lt!400228 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!400228 (bvand (bvadd lt!400229 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258549 (= lt!400228 (bvand lt!400229 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258549 (= lt!400229 (bitIndex!0 (size!6166 (buf!6688 thiss!1754)) (currentByte!12281 thiss!1754) (currentBit!12276 thiss!1754)))))

(assert (= (and start!55486 res!216584) b!258547))

(assert (= (and b!258547 res!216585) b!258548))

(assert (= (and b!258548 res!216586) b!258549))

(assert (= start!55486 b!258550))

(declare-fun m!387995 () Bool)

(assert (=> start!55486 m!387995))

(declare-fun m!387997 () Bool)

(assert (=> b!258550 m!387997))

(declare-fun m!387999 () Bool)

(assert (=> b!258547 m!387999))

(declare-fun m!388001 () Bool)

(assert (=> b!258549 m!388001))

(push 1)

(assert (not start!55486))

(assert (not b!258547))

(assert (not b!258550))

(assert (not b!258549))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86756 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86756 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12276 thiss!1754) (currentByte!12281 thiss!1754) (size!6166 (buf!6688 thiss!1754))))))

(declare-fun bs!21948 () Bool)

(assert (= bs!21948 d!86756))

(declare-fun m!388019 () Bool)

(assert (=> bs!21948 m!388019))

(assert (=> start!55486 d!86756))

(declare-fun d!86758 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86758 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6166 (buf!6688 thiss!1754))) ((_ sign_extend 32) (currentByte!12281 thiss!1754)) ((_ sign_extend 32) (currentBit!12276 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6166 (buf!6688 thiss!1754))) ((_ sign_extend 32) (currentByte!12281 thiss!1754)) ((_ sign_extend 32) (currentBit!12276 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21949 () Bool)

(assert (= bs!21949 d!86758))

(declare-fun m!388021 () Bool)

(assert (=> bs!21949 m!388021))

(assert (=> b!258547 d!86758))

(declare-fun d!86760 () Bool)

(assert (=> d!86760 (= (array_inv!5907 (buf!6688 thiss!1754)) (bvsge (size!6166 (buf!6688 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258550 d!86760))

(declare-fun d!86762 () Bool)

(declare-fun e!179359 () Bool)

(assert (=> d!86762 e!179359))

(declare-fun res!216616 () Bool)

(assert (=> d!86762 (=> (not res!216616) (not e!179359))))

(declare-fun lt!400273 () (_ BitVec 64))

(declare-fun lt!400274 () (_ BitVec 64))

(declare-fun lt!400275 () (_ BitVec 64))

(assert (=> d!86762 (= res!216616 (= lt!400273 (bvsub lt!400274 lt!400275)))))

(assert (=> d!86762 (or (= (bvand lt!400274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400275 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400274 lt!400275) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86762 (= lt!400275 (remainingBits!0 ((_ sign_extend 32) (size!6166 (buf!6688 thiss!1754))) ((_ sign_extend 32) (currentByte!12281 thiss!1754)) ((_ sign_extend 32) (currentBit!12276 thiss!1754))))))

(declare-fun lt!400276 () (_ BitVec 64))

(declare-fun lt!400277 () (_ BitVec 64))

(assert (=> d!86762 (= lt!400274 (bvmul lt!400276 lt!400277))))

(assert (=> d!86762 (or (= lt!400276 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400277 (bvsdiv (bvmul lt!400276 lt!400277) lt!400276)))))

(assert (=> d!86762 (= lt!400277 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86762 (= lt!400276 ((_ sign_extend 32) (size!6166 (buf!6688 thiss!1754))))))

(assert (=> d!86762 (= lt!400273 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12281 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12276 thiss!1754))))))

(assert (=> d!86762 (invariant!0 (currentBit!12276 thiss!1754) (currentByte!12281 thiss!1754) (size!6166 (buf!6688 thiss!1754)))))

(assert (=> d!86762 (= (bitIndex!0 (size!6166 (buf!6688 thiss!1754)) (currentByte!12281 thiss!1754) (currentBit!12276 thiss!1754)) lt!400273)))

(declare-fun b!258585 () Bool)

(declare-fun res!216615 () Bool)

(assert (=> b!258585 (=> (not res!216615) (not e!179359))))

(assert (=> b!258585 (= res!216615 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400273))))

(declare-fun b!258586 () Bool)

(declare-fun lt!400272 () (_ BitVec 64))

(assert (=> b!258586 (= e!179359 (bvsle lt!400273 (bvmul lt!400272 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258586 (or (= lt!400272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400272 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400272)))))

(assert (=> b!258586 (= lt!400272 ((_ sign_extend 32) (size!6166 (buf!6688 thiss!1754))))))

(assert (= (and d!86762 res!216616) b!258585))

(assert (= (and b!258585 res!216615) b!258586))

(assert (=> d!86762 m!388021))

(assert (=> d!86762 m!388019))

(assert (=> b!258549 d!86762))

(push 1)

(assert (not d!86756))

(assert (not d!86762))

(assert (not d!86758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

