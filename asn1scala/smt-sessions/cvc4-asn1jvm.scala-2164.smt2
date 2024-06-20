; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54920 () Bool)

(assert start!54920)

(declare-fun b!256832 () Bool)

(declare-fun res!215254 () Bool)

(declare-fun e!178039 () Bool)

(assert (=> b!256832 (=> (not res!215254) (not e!178039))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!256832 (= res!215254 (= from!526 nBits!535))))

(declare-fun b!256831 () Bool)

(declare-fun res!215252 () Bool)

(assert (=> b!256831 (=> (not res!215252) (not e!178039))))

(declare-datatypes ((array!13909 0))(
  ( (array!13910 (arr!7089 (Array (_ BitVec 32) (_ BitVec 8))) (size!6102 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11126 0))(
  ( (BitStream!11127 (buf!6624 array!13909) (currentByte!12124 (_ BitVec 32)) (currentBit!12119 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11126)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256831 (= res!215252 (validate_offset_bits!1 ((_ sign_extend 32) (size!6102 (buf!6624 thiss!1754))) ((_ sign_extend 32) (currentByte!12124 thiss!1754)) ((_ sign_extend 32) (currentBit!12119 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256834 () Bool)

(declare-fun e!178037 () Bool)

(declare-fun array_inv!5843 (array!13909) Bool)

(assert (=> b!256834 (= e!178037 (array_inv!5843 (buf!6624 thiss!1754)))))

(declare-fun b!256833 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256833 (= e!178039 (not (invariant!0 (currentBit!12119 thiss!1754) (currentByte!12124 thiss!1754) (size!6102 (buf!6624 thiss!1754)))))))

(declare-fun lt!398159 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256833 (= lt!398159 (bitIndex!0 (size!6102 (buf!6624 thiss!1754)) (currentByte!12124 thiss!1754) (currentBit!12119 thiss!1754)))))

(declare-fun res!215253 () Bool)

(assert (=> start!54920 (=> (not res!215253) (not e!178039))))

(assert (=> start!54920 (= res!215253 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54920 e!178039))

(assert (=> start!54920 true))

(declare-fun inv!12 (BitStream!11126) Bool)

(assert (=> start!54920 (and (inv!12 thiss!1754) e!178037)))

(assert (= (and start!54920 res!215253) b!256831))

(assert (= (and b!256831 res!215252) b!256832))

(assert (= (and b!256832 res!215254) b!256833))

(assert (= start!54920 b!256834))

(declare-fun m!386419 () Bool)

(assert (=> b!256831 m!386419))

(declare-fun m!386421 () Bool)

(assert (=> b!256834 m!386421))

(declare-fun m!386423 () Bool)

(assert (=> b!256833 m!386423))

(declare-fun m!386425 () Bool)

(assert (=> b!256833 m!386425))

(declare-fun m!386427 () Bool)

(assert (=> start!54920 m!386427))

(push 1)

(assert (not b!256833))

(assert (not start!54920))

(assert (not b!256834))

(assert (not b!256831))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86162 () Bool)

(assert (=> d!86162 (= (invariant!0 (currentBit!12119 thiss!1754) (currentByte!12124 thiss!1754) (size!6102 (buf!6624 thiss!1754))) (and (bvsge (currentBit!12119 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12119 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12124 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12124 thiss!1754) (size!6102 (buf!6624 thiss!1754))) (and (= (currentBit!12119 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12124 thiss!1754) (size!6102 (buf!6624 thiss!1754)))))))))

(assert (=> b!256833 d!86162))

(declare-fun d!86168 () Bool)

(declare-fun e!178044 () Bool)

(assert (=> d!86168 e!178044))

(declare-fun res!215264 () Bool)

(assert (=> d!86168 (=> (not res!215264) (not e!178044))))

(declare-fun lt!398184 () (_ BitVec 64))

(declare-fun lt!398187 () (_ BitVec 64))

(declare-fun lt!398185 () (_ BitVec 64))

(assert (=> d!86168 (= res!215264 (= lt!398184 (bvsub lt!398187 lt!398185)))))

(assert (=> d!86168 (or (= (bvand lt!398187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398185 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398187 lt!398185) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86168 (= lt!398185 (remainingBits!0 ((_ sign_extend 32) (size!6102 (buf!6624 thiss!1754))) ((_ sign_extend 32) (currentByte!12124 thiss!1754)) ((_ sign_extend 32) (currentBit!12119 thiss!1754))))))

(declare-fun lt!398186 () (_ BitVec 64))

(declare-fun lt!398189 () (_ BitVec 64))

(assert (=> d!86168 (= lt!398187 (bvmul lt!398186 lt!398189))))

(assert (=> d!86168 (or (= lt!398186 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398189 (bvsdiv (bvmul lt!398186 lt!398189) lt!398186)))))

(assert (=> d!86168 (= lt!398189 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86168 (= lt!398186 ((_ sign_extend 32) (size!6102 (buf!6624 thiss!1754))))))

(assert (=> d!86168 (= lt!398184 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12124 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12119 thiss!1754))))))

(assert (=> d!86168 (invariant!0 (currentBit!12119 thiss!1754) (currentByte!12124 thiss!1754) (size!6102 (buf!6624 thiss!1754)))))

(assert (=> d!86168 (= (bitIndex!0 (size!6102 (buf!6624 thiss!1754)) (currentByte!12124 thiss!1754) (currentBit!12119 thiss!1754)) lt!398184)))

(declare-fun b!256843 () Bool)

(declare-fun res!215263 () Bool)

(assert (=> b!256843 (=> (not res!215263) (not e!178044))))

(assert (=> b!256843 (= res!215263 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398184))))

(declare-fun b!256844 () Bool)

(declare-fun lt!398188 () (_ BitVec 64))

(assert (=> b!256844 (= e!178044 (bvsle lt!398184 (bvmul lt!398188 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256844 (or (= lt!398188 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398188 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398188)))))

(assert (=> b!256844 (= lt!398188 ((_ sign_extend 32) (size!6102 (buf!6624 thiss!1754))))))

(assert (= (and d!86168 res!215264) b!256843))

(assert (= (and b!256843 res!215263) b!256844))

(declare-fun m!386433 () Bool)

(assert (=> d!86168 m!386433))

(assert (=> d!86168 m!386423))

(assert (=> b!256833 d!86168))

(declare-fun d!86178 () Bool)

(assert (=> d!86178 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12119 thiss!1754) (currentByte!12124 thiss!1754) (size!6102 (buf!6624 thiss!1754))))))

(declare-fun bs!21785 () Bool)

(assert (= bs!21785 d!86178))

(assert (=> bs!21785 m!386423))

(assert (=> start!54920 d!86178))

(declare-fun d!86182 () Bool)

(assert (=> d!86182 (= (array_inv!5843 (buf!6624 thiss!1754)) (bvsge (size!6102 (buf!6624 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256834 d!86182))

(declare-fun d!86186 () Bool)

(assert (=> d!86186 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6102 (buf!6624 thiss!1754))) ((_ sign_extend 32) (currentByte!12124 thiss!1754)) ((_ sign_extend 32) (currentBit!12119 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6102 (buf!6624 thiss!1754))) ((_ sign_extend 32) (currentByte!12124 thiss!1754)) ((_ sign_extend 32) (currentBit!12119 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21787 () Bool)

(assert (= bs!21787 d!86186))

(assert (=> bs!21787 m!386433))

(assert (=> b!256831 d!86186))

(push 1)

