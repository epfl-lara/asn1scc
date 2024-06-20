; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51300 () Bool)

(assert start!51300)

(declare-datatypes ((array!12838 0))(
  ( (array!12839 (arr!6625 (Array (_ BitVec 32) (_ BitVec 8))) (size!5638 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10198 0))(
  ( (BitStream!10199 (buf!6092 array!12838) (currentByte!11295 (_ BitVec 32)) (currentBit!11290 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10198)

(assert (=> start!51300 (and (bvsle ((_ sign_extend 32) (size!5638 (buf!6092 thiss!1854))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11295 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11290 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5638 (buf!6092 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11295 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11290 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!165370 () Bool)

(declare-fun inv!12 (BitStream!10198) Bool)

(assert (=> start!51300 (and (inv!12 thiss!1854) e!165370)))

(declare-fun b!239159 () Bool)

(declare-fun array_inv!5379 (array!12838) Bool)

(assert (=> b!239159 (= e!165370 (array_inv!5379 (buf!6092 thiss!1854)))))

(assert (= start!51300 b!239159))

(declare-fun m!361215 () Bool)

(assert (=> start!51300 m!361215))

(declare-fun m!361217 () Bool)

(assert (=> b!239159 m!361217))

(push 1)

(assert (not start!51300))

(assert (not b!239159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80476 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80476 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11290 thiss!1854) (currentByte!11295 thiss!1854) (size!5638 (buf!6092 thiss!1854))))))

(declare-fun bs!20229 () Bool)

(assert (= bs!20229 d!80476))

(declare-fun m!361229 () Bool)

(assert (=> bs!20229 m!361229))

(assert (=> start!51300 d!80476))

(declare-fun d!80480 () Bool)

(assert (=> d!80480 (= (array_inv!5379 (buf!6092 thiss!1854)) (bvsge (size!5638 (buf!6092 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239159 d!80480))

(push 1)

(assert (not d!80476))

(check-sat)

