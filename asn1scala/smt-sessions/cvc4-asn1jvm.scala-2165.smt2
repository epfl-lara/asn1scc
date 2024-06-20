; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54956 () Bool)

(assert start!54956)

(declare-fun b!256887 () Bool)

(declare-fun e!178075 () Bool)

(declare-datatypes ((array!13918 0))(
  ( (array!13919 (arr!7092 (Array (_ BitVec 32) (_ BitVec 8))) (size!6105 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11132 0))(
  ( (BitStream!11133 (buf!6627 array!13918) (currentByte!12136 (_ BitVec 32)) (currentBit!12131 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11132)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256887 (= e!178075 (not (invariant!0 (currentBit!12131 thiss!1754) (currentByte!12136 thiss!1754) (size!6105 (buf!6627 thiss!1754)))))))

(declare-fun lt!398222 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256887 (= lt!398222 (bitIndex!0 (size!6105 (buf!6627 thiss!1754)) (currentByte!12136 thiss!1754) (currentBit!12131 thiss!1754)))))

(declare-fun b!256888 () Bool)

(declare-fun e!178073 () Bool)

(declare-fun array_inv!5846 (array!13918) Bool)

(assert (=> b!256888 (= e!178073 (array_inv!5846 (buf!6627 thiss!1754)))))

(declare-fun b!256886 () Bool)

(declare-fun res!215299 () Bool)

(assert (=> b!256886 (=> (not res!215299) (not e!178075))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!256886 (= res!215299 (= from!526 nBits!535))))

(declare-fun res!215297 () Bool)

(assert (=> start!54956 (=> (not res!215297) (not e!178075))))

(assert (=> start!54956 (= res!215297 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54956 e!178075))

(assert (=> start!54956 true))

(declare-fun inv!12 (BitStream!11132) Bool)

(assert (=> start!54956 (and (inv!12 thiss!1754) e!178073)))

(declare-fun b!256885 () Bool)

(declare-fun res!215298 () Bool)

(assert (=> b!256885 (=> (not res!215298) (not e!178075))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256885 (= res!215298 (validate_offset_bits!1 ((_ sign_extend 32) (size!6105 (buf!6627 thiss!1754))) ((_ sign_extend 32) (currentByte!12136 thiss!1754)) ((_ sign_extend 32) (currentBit!12131 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!54956 res!215297) b!256885))

(assert (= (and b!256885 res!215298) b!256886))

(assert (= (and b!256886 res!215299) b!256887))

(assert (= start!54956 b!256888))

(declare-fun m!386455 () Bool)

(assert (=> b!256887 m!386455))

(declare-fun m!386457 () Bool)

(assert (=> b!256887 m!386457))

(declare-fun m!386459 () Bool)

(assert (=> b!256888 m!386459))

(declare-fun m!386461 () Bool)

(assert (=> start!54956 m!386461))

(declare-fun m!386463 () Bool)

(assert (=> b!256885 m!386463))

(push 1)

(assert (not b!256888))

(assert (not b!256885))

(assert (not start!54956))

(assert (not b!256887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86194 () Bool)

(assert (=> d!86194 (= (array_inv!5846 (buf!6627 thiss!1754)) (bvsge (size!6105 (buf!6627 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256888 d!86194))

(declare-fun d!86196 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86196 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6105 (buf!6627 thiss!1754))) ((_ sign_extend 32) (currentByte!12136 thiss!1754)) ((_ sign_extend 32) (currentBit!12131 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6105 (buf!6627 thiss!1754))) ((_ sign_extend 32) (currentByte!12136 thiss!1754)) ((_ sign_extend 32) (currentBit!12131 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21792 () Bool)

(assert (= bs!21792 d!86196))

(declare-fun m!386465 () Bool)

(assert (=> bs!21792 m!386465))

(assert (=> b!256885 d!86196))

(declare-fun d!86202 () Bool)

(assert (=> d!86202 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12131 thiss!1754) (currentByte!12136 thiss!1754) (size!6105 (buf!6627 thiss!1754))))))

(declare-fun bs!21793 () Bool)

(assert (= bs!21793 d!86202))

(assert (=> bs!21793 m!386455))

(assert (=> start!54956 d!86202))

(declare-fun d!86204 () Bool)

(assert (=> d!86204 (= (invariant!0 (currentBit!12131 thiss!1754) (currentByte!12136 thiss!1754) (size!6105 (buf!6627 thiss!1754))) (and (bvsge (currentBit!12131 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12131 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12136 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12136 thiss!1754) (size!6105 (buf!6627 thiss!1754))) (and (= (currentBit!12131 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12136 thiss!1754) (size!6105 (buf!6627 thiss!1754)))))))))

(assert (=> b!256887 d!86204))

(declare-fun d!86208 () Bool)

(declare-fun e!178078 () Bool)

(assert (=> d!86208 e!178078))

(declare-fun res!215305 () Bool)

(assert (=> d!86208 (=> (not res!215305) (not e!178078))))

(declare-fun lt!398237 () (_ BitVec 64))

(declare-fun lt!398236 () (_ BitVec 64))

(declare-fun lt!398235 () (_ BitVec 64))

(assert (=> d!86208 (= res!215305 (= lt!398235 (bvsub lt!398236 lt!398237)))))

(assert (=> d!86208 (or (= (bvand lt!398236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398237 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398236 lt!398237) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86208 (= lt!398237 (remainingBits!0 ((_ sign_extend 32) (size!6105 (buf!6627 thiss!1754))) ((_ sign_extend 32) (currentByte!12136 thiss!1754)) ((_ sign_extend 32) (currentBit!12131 thiss!1754))))))

(declare-fun lt!398239 () (_ BitVec 64))

(declare-fun lt!398240 () (_ BitVec 64))

(assert (=> d!86208 (= lt!398236 (bvmul lt!398239 lt!398240))))

(assert (=> d!86208 (or (= lt!398239 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398240 (bvsdiv (bvmul lt!398239 lt!398240) lt!398239)))))

(assert (=> d!86208 (= lt!398240 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86208 (= lt!398239 ((_ sign_extend 32) (size!6105 (buf!6627 thiss!1754))))))

(assert (=> d!86208 (= lt!398235 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12136 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12131 thiss!1754))))))

(assert (=> d!86208 (invariant!0 (currentBit!12131 thiss!1754) (currentByte!12136 thiss!1754) (size!6105 (buf!6627 thiss!1754)))))

(assert (=> d!86208 (= (bitIndex!0 (size!6105 (buf!6627 thiss!1754)) (currentByte!12136 thiss!1754) (currentBit!12131 thiss!1754)) lt!398235)))

(declare-fun b!256893 () Bool)

(declare-fun res!215304 () Bool)

(assert (=> b!256893 (=> (not res!215304) (not e!178078))))

(assert (=> b!256893 (= res!215304 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398235))))

(declare-fun b!256894 () Bool)

(declare-fun lt!398238 () (_ BitVec 64))

(assert (=> b!256894 (= e!178078 (bvsle lt!398235 (bvmul lt!398238 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256894 (or (= lt!398238 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398238 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398238)))))

(assert (=> b!256894 (= lt!398238 ((_ sign_extend 32) (size!6105 (buf!6627 thiss!1754))))))

(assert (= (and d!86208 res!215305) b!256893))

(assert (= (and b!256893 res!215304) b!256894))

(assert (=> d!86208 m!386465))

(assert (=> d!86208 m!386455))

(assert (=> b!256887 d!86208))

(push 1)

(assert (not d!86202))

(assert (not d!86196))

(assert (not d!86208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

