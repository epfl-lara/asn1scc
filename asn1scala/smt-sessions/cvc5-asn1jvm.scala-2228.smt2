; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56644 () Bool)

(assert start!56644)

(declare-fun res!218711 () Bool)

(declare-fun e!181589 () Bool)

(assert (=> start!56644 (=> (not res!218711) (not e!181589))))

(declare-datatypes ((array!14397 0))(
  ( (array!14398 (arr!7276 (Array (_ BitVec 32) (_ BitVec 8))) (size!6289 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11500 0))(
  ( (BitStream!11501 (buf!6811 array!14397) (currentByte!12564 (_ BitVec 32)) (currentBit!12559 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11500)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56644 (= res!218711 (validate_offset_bit!0 ((_ sign_extend 32) (size!6289 (buf!6811 thiss!914))) ((_ sign_extend 32) (currentByte!12564 thiss!914)) ((_ sign_extend 32) (currentBit!12559 thiss!914))))))

(assert (=> start!56644 e!181589))

(declare-fun e!181590 () Bool)

(declare-fun inv!12 (BitStream!11500) Bool)

(assert (=> start!56644 (and (inv!12 thiss!914) e!181590)))

(assert (=> start!56644 true))

(declare-fun b!261220 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261220 (= e!181589 (and b!187 (or (bvslt (currentBit!12559 thiss!914) #b00000000000000000000000000000000) (bvsge (currentBit!12559 thiss!914) #b00000000000000000000000000001000))))))

(declare-fun b!261221 () Bool)

(declare-fun array_inv!6030 (array!14397) Bool)

(assert (=> b!261221 (= e!181590 (array_inv!6030 (buf!6811 thiss!914)))))

(assert (= (and start!56644 res!218711) b!261220))

(assert (= start!56644 b!261221))

(declare-fun m!390859 () Bool)

(assert (=> start!56644 m!390859))

(declare-fun m!390861 () Bool)

(assert (=> start!56644 m!390861))

(declare-fun m!390863 () Bool)

(assert (=> b!261221 m!390863))

(push 1)

(assert (not b!261221))

(assert (not start!56644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87882 () Bool)

(assert (=> d!87882 (= (array_inv!6030 (buf!6811 thiss!914)) (bvsge (size!6289 (buf!6811 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261221 d!87882))

(declare-fun d!87884 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87884 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6289 (buf!6811 thiss!914))) ((_ sign_extend 32) (currentByte!12564 thiss!914)) ((_ sign_extend 32) (currentBit!12559 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6289 (buf!6811 thiss!914))) ((_ sign_extend 32) (currentByte!12564 thiss!914)) ((_ sign_extend 32) (currentBit!12559 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22256 () Bool)

(assert (= bs!22256 d!87884))

(declare-fun m!390881 () Bool)

(assert (=> bs!22256 m!390881))

(assert (=> start!56644 d!87884))

(declare-fun d!87888 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87888 (= (inv!12 thiss!914) (invariant!0 (currentBit!12559 thiss!914) (currentByte!12564 thiss!914) (size!6289 (buf!6811 thiss!914))))))

(declare-fun bs!22257 () Bool)

(assert (= bs!22257 d!87888))

(declare-fun m!390883 () Bool)

(assert (=> bs!22257 m!390883))

(assert (=> start!56644 d!87888))

(push 1)

(assert (not d!87884))

(assert (not d!87888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87898 () Bool)

(assert (=> d!87898 (= (remainingBits!0 ((_ sign_extend 32) (size!6289 (buf!6811 thiss!914))) ((_ sign_extend 32) (currentByte!12564 thiss!914)) ((_ sign_extend 32) (currentBit!12559 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6289 (buf!6811 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12564 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12559 thiss!914)))))))

(assert (=> d!87884 d!87898))

(declare-fun d!87900 () Bool)

(assert (=> d!87900 (= (invariant!0 (currentBit!12559 thiss!914) (currentByte!12564 thiss!914) (size!6289 (buf!6811 thiss!914))) (and (bvsge (currentBit!12559 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12559 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12564 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12564 thiss!914) (size!6289 (buf!6811 thiss!914))) (and (= (currentBit!12559 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12564 thiss!914) (size!6289 (buf!6811 thiss!914)))))))))

(assert (=> d!87888 d!87900))

(push 1)

(check-sat)

(pop 1)

