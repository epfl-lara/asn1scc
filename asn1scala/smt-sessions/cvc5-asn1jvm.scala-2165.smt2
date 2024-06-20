; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54952 () Bool)

(assert start!54952)

(declare-fun b!256861 () Bool)

(declare-fun res!215279 () Bool)

(declare-fun e!178056 () Bool)

(assert (=> b!256861 (=> (not res!215279) (not e!178056))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13914 0))(
  ( (array!13915 (arr!7090 (Array (_ BitVec 32) (_ BitVec 8))) (size!6103 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11128 0))(
  ( (BitStream!11129 (buf!6625 array!13914) (currentByte!12134 (_ BitVec 32)) (currentBit!12129 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11128)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256861 (= res!215279 (validate_offset_bits!1 ((_ sign_extend 32) (size!6103 (buf!6625 thiss!1754))) ((_ sign_extend 32) (currentByte!12134 thiss!1754)) ((_ sign_extend 32) (currentBit!12129 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256864 () Bool)

(declare-fun e!178055 () Bool)

(declare-fun array_inv!5844 (array!13914) Bool)

(assert (=> b!256864 (= e!178055 (array_inv!5844 (buf!6625 thiss!1754)))))

(declare-fun res!215281 () Bool)

(assert (=> start!54952 (=> (not res!215281) (not e!178056))))

(assert (=> start!54952 (= res!215281 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54952 e!178056))

(assert (=> start!54952 true))

(declare-fun inv!12 (BitStream!11128) Bool)

(assert (=> start!54952 (and (inv!12 thiss!1754) e!178055)))

(declare-fun b!256863 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256863 (= e!178056 (not (invariant!0 (currentBit!12129 thiss!1754) (currentByte!12134 thiss!1754) (size!6103 (buf!6625 thiss!1754)))))))

(declare-fun lt!398216 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256863 (= lt!398216 (bitIndex!0 (size!6103 (buf!6625 thiss!1754)) (currentByte!12134 thiss!1754) (currentBit!12129 thiss!1754)))))

(declare-fun b!256862 () Bool)

(declare-fun res!215280 () Bool)

(assert (=> b!256862 (=> (not res!215280) (not e!178056))))

(assert (=> b!256862 (= res!215280 (= from!526 nBits!535))))

(assert (= (and start!54952 res!215281) b!256861))

(assert (= (and b!256861 res!215279) b!256862))

(assert (= (and b!256862 res!215280) b!256863))

(assert (= start!54952 b!256864))

(declare-fun m!386435 () Bool)

(assert (=> b!256861 m!386435))

(declare-fun m!386437 () Bool)

(assert (=> b!256864 m!386437))

(declare-fun m!386439 () Bool)

(assert (=> start!54952 m!386439))

(declare-fun m!386441 () Bool)

(assert (=> b!256863 m!386441))

(declare-fun m!386443 () Bool)

(assert (=> b!256863 m!386443))

(push 1)

(assert (not b!256863))

(assert (not start!54952))

(assert (not b!256864))

(assert (not b!256861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86192 () Bool)

(assert (=> d!86192 (= (invariant!0 (currentBit!12129 thiss!1754) (currentByte!12134 thiss!1754) (size!6103 (buf!6625 thiss!1754))) (and (bvsge (currentBit!12129 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12129 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12134 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12134 thiss!1754) (size!6103 (buf!6625 thiss!1754))) (and (= (currentBit!12129 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12134 thiss!1754) (size!6103 (buf!6625 thiss!1754)))))))))

(assert (=> b!256863 d!86192))

(declare-fun d!86198 () Bool)

(declare-fun e!178081 () Bool)

(assert (=> d!86198 e!178081))

(declare-fun res!215311 () Bool)

(assert (=> d!86198 (=> (not res!215311) (not e!178081))))

(declare-fun lt!398258 () (_ BitVec 64))

(declare-fun lt!398256 () (_ BitVec 64))

(declare-fun lt!398254 () (_ BitVec 64))

(assert (=> d!86198 (= res!215311 (= lt!398254 (bvsub lt!398258 lt!398256)))))

(assert (=> d!86198 (or (= (bvand lt!398258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398258 lt!398256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86198 (= lt!398256 (remainingBits!0 ((_ sign_extend 32) (size!6103 (buf!6625 thiss!1754))) ((_ sign_extend 32) (currentByte!12134 thiss!1754)) ((_ sign_extend 32) (currentBit!12129 thiss!1754))))))

(declare-fun lt!398257 () (_ BitVec 64))

(declare-fun lt!398253 () (_ BitVec 64))

(assert (=> d!86198 (= lt!398258 (bvmul lt!398257 lt!398253))))

(assert (=> d!86198 (or (= lt!398257 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398253 (bvsdiv (bvmul lt!398257 lt!398253) lt!398257)))))

(assert (=> d!86198 (= lt!398253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86198 (= lt!398257 ((_ sign_extend 32) (size!6103 (buf!6625 thiss!1754))))))

(assert (=> d!86198 (= lt!398254 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12134 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12129 thiss!1754))))))

(assert (=> d!86198 (invariant!0 (currentBit!12129 thiss!1754) (currentByte!12134 thiss!1754) (size!6103 (buf!6625 thiss!1754)))))

(assert (=> d!86198 (= (bitIndex!0 (size!6103 (buf!6625 thiss!1754)) (currentByte!12134 thiss!1754) (currentBit!12129 thiss!1754)) lt!398254)))

(declare-fun b!256899 () Bool)

(declare-fun res!215310 () Bool)

(assert (=> b!256899 (=> (not res!215310) (not e!178081))))

(assert (=> b!256899 (= res!215310 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398254))))

(declare-fun b!256900 () Bool)

(declare-fun lt!398255 () (_ BitVec 64))

(assert (=> b!256900 (= e!178081 (bvsle lt!398254 (bvmul lt!398255 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256900 (or (= lt!398255 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398255 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398255)))))

(assert (=> b!256900 (= lt!398255 ((_ sign_extend 32) (size!6103 (buf!6625 thiss!1754))))))

(assert (= (and d!86198 res!215311) b!256899))

(assert (= (and b!256899 res!215310) b!256900))

(declare-fun m!386469 () Bool)

(assert (=> d!86198 m!386469))

(assert (=> d!86198 m!386441))

(assert (=> b!256863 d!86198))

(declare-fun d!86212 () Bool)

(assert (=> d!86212 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12129 thiss!1754) (currentByte!12134 thiss!1754) (size!6103 (buf!6625 thiss!1754))))))

(declare-fun bs!21795 () Bool)

(assert (= bs!21795 d!86212))

(assert (=> bs!21795 m!386441))

(assert (=> start!54952 d!86212))

(declare-fun d!86214 () Bool)

(assert (=> d!86214 (= (array_inv!5844 (buf!6625 thiss!1754)) (bvsge (size!6103 (buf!6625 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256864 d!86214))

(declare-fun d!86216 () Bool)

(assert (=> d!86216 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6103 (buf!6625 thiss!1754))) ((_ sign_extend 32) (currentByte!12134 thiss!1754)) ((_ sign_extend 32) (currentBit!12129 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6103 (buf!6625 thiss!1754))) ((_ sign_extend 32) (currentByte!12134 thiss!1754)) ((_ sign_extend 32) (currentBit!12129 thiss!1754))) (bvsub nBits!535 from!526)))))

