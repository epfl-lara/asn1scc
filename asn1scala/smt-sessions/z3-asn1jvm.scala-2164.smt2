; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54918 () Bool)

(assert start!54918)

(declare-fun b!256820 () Bool)

(declare-fun res!215245 () Bool)

(declare-fun e!178030 () Bool)

(assert (=> b!256820 (=> (not res!215245) (not e!178030))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!256820 (= res!215245 (= from!526 nBits!535))))

(declare-fun b!256822 () Bool)

(declare-fun e!178029 () Bool)

(declare-datatypes ((array!13907 0))(
  ( (array!13908 (arr!7088 (Array (_ BitVec 32) (_ BitVec 8))) (size!6101 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11124 0))(
  ( (BitStream!11125 (buf!6623 array!13907) (currentByte!12123 (_ BitVec 32)) (currentBit!12118 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11124)

(declare-fun array_inv!5842 (array!13907) Bool)

(assert (=> b!256822 (= e!178029 (array_inv!5842 (buf!6623 thiss!1754)))))

(declare-fun b!256819 () Bool)

(declare-fun res!215243 () Bool)

(assert (=> b!256819 (=> (not res!215243) (not e!178030))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256819 (= res!215243 (validate_offset_bits!1 ((_ sign_extend 32) (size!6101 (buf!6623 thiss!1754))) ((_ sign_extend 32) (currentByte!12123 thiss!1754)) ((_ sign_extend 32) (currentBit!12118 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!215244 () Bool)

(assert (=> start!54918 (=> (not res!215244) (not e!178030))))

(assert (=> start!54918 (= res!215244 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54918 e!178030))

(assert (=> start!54918 true))

(declare-fun inv!12 (BitStream!11124) Bool)

(assert (=> start!54918 (and (inv!12 thiss!1754) e!178029)))

(declare-fun b!256821 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256821 (= e!178030 (not (invariant!0 (currentBit!12118 thiss!1754) (currentByte!12123 thiss!1754) (size!6101 (buf!6623 thiss!1754)))))))

(declare-fun lt!398156 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256821 (= lt!398156 (bitIndex!0 (size!6101 (buf!6623 thiss!1754)) (currentByte!12123 thiss!1754) (currentBit!12118 thiss!1754)))))

(assert (= (and start!54918 res!215244) b!256819))

(assert (= (and b!256819 res!215243) b!256820))

(assert (= (and b!256820 res!215245) b!256821))

(assert (= start!54918 b!256822))

(declare-fun m!386409 () Bool)

(assert (=> b!256822 m!386409))

(declare-fun m!386411 () Bool)

(assert (=> b!256819 m!386411))

(declare-fun m!386413 () Bool)

(assert (=> start!54918 m!386413))

(declare-fun m!386415 () Bool)

(assert (=> b!256821 m!386415))

(declare-fun m!386417 () Bool)

(assert (=> b!256821 m!386417))

(check-sat (not b!256822) (not b!256819) (not b!256821) (not start!54918))
(check-sat)
(get-model)

(declare-fun d!86170 () Bool)

(assert (=> d!86170 (= (array_inv!5842 (buf!6623 thiss!1754)) (bvsge (size!6101 (buf!6623 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256822 d!86170))

(declare-fun d!86172 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86172 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6101 (buf!6623 thiss!1754))) ((_ sign_extend 32) (currentByte!12123 thiss!1754)) ((_ sign_extend 32) (currentBit!12118 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6101 (buf!6623 thiss!1754))) ((_ sign_extend 32) (currentByte!12123 thiss!1754)) ((_ sign_extend 32) (currentBit!12118 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21784 () Bool)

(assert (= bs!21784 d!86172))

(declare-fun m!386431 () Bool)

(assert (=> bs!21784 m!386431))

(assert (=> b!256819 d!86172))

(declare-fun d!86174 () Bool)

(assert (=> d!86174 (= (invariant!0 (currentBit!12118 thiss!1754) (currentByte!12123 thiss!1754) (size!6101 (buf!6623 thiss!1754))) (and (bvsge (currentBit!12118 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12118 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12123 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12123 thiss!1754) (size!6101 (buf!6623 thiss!1754))) (and (= (currentBit!12118 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12123 thiss!1754) (size!6101 (buf!6623 thiss!1754)))))))))

(assert (=> b!256821 d!86174))

(declare-fun d!86176 () Bool)

(declare-fun e!178048 () Bool)

(assert (=> d!86176 e!178048))

(declare-fun res!215271 () Bool)

(assert (=> d!86176 (=> (not res!215271) (not e!178048))))

(declare-fun lt!398208 () (_ BitVec 64))

(declare-fun lt!398212 () (_ BitVec 64))

(declare-fun lt!398211 () (_ BitVec 64))

(assert (=> d!86176 (= res!215271 (= lt!398211 (bvsub lt!398208 lt!398212)))))

(assert (=> d!86176 (or (= (bvand lt!398208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398212 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398208 lt!398212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86176 (= lt!398212 (remainingBits!0 ((_ sign_extend 32) (size!6101 (buf!6623 thiss!1754))) ((_ sign_extend 32) (currentByte!12123 thiss!1754)) ((_ sign_extend 32) (currentBit!12118 thiss!1754))))))

(declare-fun lt!398209 () (_ BitVec 64))

(declare-fun lt!398213 () (_ BitVec 64))

(assert (=> d!86176 (= lt!398208 (bvmul lt!398209 lt!398213))))

(assert (=> d!86176 (or (= lt!398209 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398213 (bvsdiv (bvmul lt!398209 lt!398213) lt!398209)))))

(assert (=> d!86176 (= lt!398213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86176 (= lt!398209 ((_ sign_extend 32) (size!6101 (buf!6623 thiss!1754))))))

(assert (=> d!86176 (= lt!398211 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12123 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12118 thiss!1754))))))

(assert (=> d!86176 (invariant!0 (currentBit!12118 thiss!1754) (currentByte!12123 thiss!1754) (size!6101 (buf!6623 thiss!1754)))))

(assert (=> d!86176 (= (bitIndex!0 (size!6101 (buf!6623 thiss!1754)) (currentByte!12123 thiss!1754) (currentBit!12118 thiss!1754)) lt!398211)))

(declare-fun b!256851 () Bool)

(declare-fun res!215272 () Bool)

(assert (=> b!256851 (=> (not res!215272) (not e!178048))))

(assert (=> b!256851 (= res!215272 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398211))))

(declare-fun b!256852 () Bool)

(declare-fun lt!398210 () (_ BitVec 64))

(assert (=> b!256852 (= e!178048 (bvsle lt!398211 (bvmul lt!398210 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256852 (or (= lt!398210 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398210 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398210)))))

(assert (=> b!256852 (= lt!398210 ((_ sign_extend 32) (size!6101 (buf!6623 thiss!1754))))))

(assert (= (and d!86176 res!215271) b!256851))

(assert (= (and b!256851 res!215272) b!256852))

(assert (=> d!86176 m!386431))

(assert (=> d!86176 m!386415))

(assert (=> b!256821 d!86176))

(declare-fun d!86188 () Bool)

(assert (=> d!86188 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12118 thiss!1754) (currentByte!12123 thiss!1754) (size!6101 (buf!6623 thiss!1754))))))

(declare-fun bs!21788 () Bool)

(assert (= bs!21788 d!86188))

(assert (=> bs!21788 m!386415))

(assert (=> start!54918 d!86188))

(check-sat (not d!86176) (not d!86188) (not d!86172))
