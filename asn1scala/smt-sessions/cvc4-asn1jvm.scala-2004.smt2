; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51268 () Bool)

(assert start!51268)

(declare-fun res!199836 () Bool)

(declare-fun e!165345 () Bool)

(assert (=> start!51268 (=> (not res!199836) (not e!165345))))

(declare-datatypes ((array!12827 0))(
  ( (array!12828 (arr!6621 (Array (_ BitVec 32) (_ BitVec 8))) (size!5634 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10190 0))(
  ( (BitStream!10191 (buf!6088 array!12827) (currentByte!11285 (_ BitVec 32)) (currentBit!11280 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10190)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51268 (= res!199836 (validate_offset_byte!0 ((_ sign_extend 32) (size!5634 (buf!6088 thiss!1857))) ((_ sign_extend 32) (currentByte!11285 thiss!1857)) ((_ sign_extend 32) (currentBit!11280 thiss!1857))))))

(assert (=> start!51268 e!165345))

(declare-fun e!165346 () Bool)

(declare-fun inv!12 (BitStream!10190) Bool)

(assert (=> start!51268 (and (inv!12 thiss!1857) e!165346)))

(declare-fun b!239146 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!239146 (= e!165345 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5634 (buf!6088 thiss!1857))) ((_ sign_extend 32) (currentByte!11285 thiss!1857)) ((_ sign_extend 32) (currentBit!11280 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!239147 () Bool)

(declare-fun array_inv!5375 (array!12827) Bool)

(assert (=> b!239147 (= e!165346 (array_inv!5375 (buf!6088 thiss!1857)))))

(assert (= (and start!51268 res!199836) b!239146))

(assert (= start!51268 b!239147))

(declare-fun m!361183 () Bool)

(assert (=> start!51268 m!361183))

(declare-fun m!361185 () Bool)

(assert (=> start!51268 m!361185))

(declare-fun m!361187 () Bool)

(assert (=> b!239146 m!361187))

(declare-fun m!361189 () Bool)

(assert (=> b!239147 m!361189))

(push 1)

(assert (not b!239146))

(assert (not b!239147))

(assert (not start!51268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80446 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80446 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5634 (buf!6088 thiss!1857))) ((_ sign_extend 32) (currentByte!11285 thiss!1857)) ((_ sign_extend 32) (currentBit!11280 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5634 (buf!6088 thiss!1857))) ((_ sign_extend 32) (currentByte!11285 thiss!1857)) ((_ sign_extend 32) (currentBit!11280 thiss!1857))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20214 () Bool)

(assert (= bs!20214 d!80446))

(declare-fun m!361193 () Bool)

(assert (=> bs!20214 m!361193))

(assert (=> b!239146 d!80446))

(declare-fun d!80450 () Bool)

(assert (=> d!80450 (= (array_inv!5375 (buf!6088 thiss!1857)) (bvsge (size!5634 (buf!6088 thiss!1857)) #b00000000000000000000000000000000))))

(assert (=> b!239147 d!80450))

(declare-fun d!80454 () Bool)

(assert (=> d!80454 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!5634 (buf!6088 thiss!1857))) ((_ sign_extend 32) (currentByte!11285 thiss!1857)) ((_ sign_extend 32) (currentBit!11280 thiss!1857))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5634 (buf!6088 thiss!1857))) ((_ sign_extend 32) (currentByte!11285 thiss!1857)) ((_ sign_extend 32) (currentBit!11280 thiss!1857))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20216 () Bool)

(assert (= bs!20216 d!80454))

(assert (=> bs!20216 m!361193))

(assert (=> start!51268 d!80454))

(declare-fun d!80458 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80458 (= (inv!12 thiss!1857) (invariant!0 (currentBit!11280 thiss!1857) (currentByte!11285 thiss!1857) (size!5634 (buf!6088 thiss!1857))))))

(declare-fun bs!20218 () Bool)

(assert (= bs!20218 d!80458))

(declare-fun m!361197 () Bool)

(assert (=> bs!20218 m!361197))

(assert (=> start!51268 d!80458))

(push 1)

