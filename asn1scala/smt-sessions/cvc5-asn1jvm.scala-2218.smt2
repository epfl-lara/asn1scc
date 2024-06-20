; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56216 () Bool)

(assert start!56216)

(declare-datatypes ((array!14307 0))(
  ( (array!14308 (arr!7246 (Array (_ BitVec 32) (_ BitVec 8))) (size!6259 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11440 0))(
  ( (BitStream!11441 (buf!6781 array!14307) (currentByte!12474 (_ BitVec 32)) (currentBit!12469 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11440)

(assert (=> start!56216 (and (bvsle ((_ sign_extend 32) (size!6259 (buf!6781 thiss!914))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12474 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12469 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6259 (buf!6781 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12474 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12469 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!180969 () Bool)

(declare-fun inv!12 (BitStream!11440) Bool)

(assert (=> start!56216 (and (inv!12 thiss!914) e!180969)))

(declare-fun b!260506 () Bool)

(declare-fun array_inv!6000 (array!14307) Bool)

(assert (=> b!260506 (= e!180969 (array_inv!6000 (buf!6781 thiss!914)))))

(assert (= start!56216 b!260506))

(declare-fun m!389811 () Bool)

(assert (=> start!56216 m!389811))

(declare-fun m!389813 () Bool)

(assert (=> b!260506 m!389813))

(push 1)

(assert (not b!260506))

(assert (not start!56216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87450 () Bool)

(assert (=> d!87450 (= (array_inv!6000 (buf!6781 thiss!914)) (bvsge (size!6259 (buf!6781 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260506 d!87450))

(declare-fun d!87452 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87452 (= (inv!12 thiss!914) (invariant!0 (currentBit!12469 thiss!914) (currentByte!12474 thiss!914) (size!6259 (buf!6781 thiss!914))))))

(declare-fun bs!22167 () Bool)

(assert (= bs!22167 d!87452))

(declare-fun m!389825 () Bool)

(assert (=> bs!22167 m!389825))

(assert (=> start!56216 d!87452))

(push 1)

(assert (not d!87452))

(check-sat)

