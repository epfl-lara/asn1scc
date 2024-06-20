; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51316 () Bool)

(assert start!51316)

(declare-fun res!199839 () Bool)

(declare-fun e!165390 () Bool)

(assert (=> start!51316 (=> (not res!199839) (not e!165390))))

(declare-datatypes ((array!12846 0))(
  ( (array!12847 (arr!6628 (Array (_ BitVec 32) (_ BitVec 8))) (size!5641 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10204 0))(
  ( (BitStream!10205 (buf!6095 array!12846) (currentByte!11299 (_ BitVec 32)) (currentBit!11294 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10204)

(assert (=> start!51316 (= res!199839 (and (bvsle ((_ sign_extend 32) (size!5641 (buf!6095 thiss!1854))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11299 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11294 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5641 (buf!6095 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11299 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11294 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51316 e!165390))

(declare-fun e!165391 () Bool)

(declare-fun inv!12 (BitStream!10204) Bool)

(assert (=> start!51316 (and (inv!12 thiss!1854) e!165391)))

(declare-fun b!239170 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239170 (= e!165390 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11294 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11299 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5641 (buf!6095 thiss!1854)))))))))

(declare-fun b!239171 () Bool)

(declare-fun array_inv!5382 (array!12846) Bool)

(assert (=> b!239171 (= e!165391 (array_inv!5382 (buf!6095 thiss!1854)))))

(assert (= (and start!51316 res!199839) b!239170))

(assert (= start!51316 b!239171))

(declare-fun m!361231 () Bool)

(assert (=> start!51316 m!361231))

(declare-fun m!361233 () Bool)

(assert (=> b!239170 m!361233))

(declare-fun m!361235 () Bool)

(assert (=> b!239171 m!361235))

(push 1)

(assert (not b!239170))

(assert (not start!51316))

(assert (not b!239171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80486 () Bool)

(assert (=> d!80486 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11294 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11299 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5641 (buf!6095 thiss!1854))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11294 thiss!1854))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11294 thiss!1854))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11299 thiss!1854))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11299 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5641 (buf!6095 thiss!1854))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11294 thiss!1854))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11299 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5641 (buf!6095 thiss!1854)))))))))))

(assert (=> b!239170 d!80486))

(declare-fun d!80494 () Bool)

(assert (=> d!80494 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11294 thiss!1854) (currentByte!11299 thiss!1854) (size!5641 (buf!6095 thiss!1854))))))

(declare-fun bs!20233 () Bool)

(assert (= bs!20233 d!80494))

(declare-fun m!361249 () Bool)

(assert (=> bs!20233 m!361249))

(assert (=> start!51316 d!80494))

(declare-fun d!80496 () Bool)

(assert (=> d!80496 (= (array_inv!5382 (buf!6095 thiss!1854)) (bvsge (size!5641 (buf!6095 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239171 d!80496))

(push 1)

(assert (not d!80494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

