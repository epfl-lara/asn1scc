; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51320 () Bool)

(assert start!51320)

(declare-fun res!199845 () Bool)

(declare-fun e!165408 () Bool)

(assert (=> start!51320 (=> (not res!199845) (not e!165408))))

(declare-datatypes ((array!12850 0))(
  ( (array!12851 (arr!6630 (Array (_ BitVec 32) (_ BitVec 8))) (size!5643 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10208 0))(
  ( (BitStream!10209 (buf!6097 array!12850) (currentByte!11301 (_ BitVec 32)) (currentBit!11296 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10208)

(assert (=> start!51320 (= res!199845 (and (bvsle ((_ sign_extend 32) (size!5643 (buf!6097 thiss!1854))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11301 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11296 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5643 (buf!6097 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11301 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11296 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51320 e!165408))

(declare-fun e!165409 () Bool)

(declare-fun inv!12 (BitStream!10208) Bool)

(assert (=> start!51320 (and (inv!12 thiss!1854) e!165409)))

(declare-fun b!239182 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239182 (= e!165408 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11296 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11301 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5643 (buf!6097 thiss!1854)))))))))

(declare-fun b!239183 () Bool)

(declare-fun array_inv!5384 (array!12850) Bool)

(assert (=> b!239183 (= e!165409 (array_inv!5384 (buf!6097 thiss!1854)))))

(assert (= (and start!51320 res!199845) b!239182))

(assert (= start!51320 b!239183))

(declare-fun m!361243 () Bool)

(assert (=> start!51320 m!361243))

(declare-fun m!361245 () Bool)

(assert (=> b!239182 m!361245))

(declare-fun m!361247 () Bool)

(assert (=> b!239183 m!361247))

(push 1)

(assert (not b!239183))

(assert (not b!239182))

(assert (not start!51320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80490 () Bool)

(assert (=> d!80490 (= (array_inv!5384 (buf!6097 thiss!1854)) (bvsge (size!5643 (buf!6097 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239183 d!80490))

(declare-fun d!80492 () Bool)

(assert (=> d!80492 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11296 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11301 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5643 (buf!6097 thiss!1854))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11296 thiss!1854))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11296 thiss!1854))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11301 thiss!1854))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11301 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5643 (buf!6097 thiss!1854))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11296 thiss!1854))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11301 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5643 (buf!6097 thiss!1854)))))))))))

(assert (=> b!239182 d!80492))

(declare-fun d!80498 () Bool)

(assert (=> d!80498 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11296 thiss!1854) (currentByte!11301 thiss!1854) (size!5643 (buf!6097 thiss!1854))))))

(declare-fun bs!20234 () Bool)

(assert (= bs!20234 d!80498))

(declare-fun m!361251 () Bool)

(assert (=> bs!20234 m!361251))

(assert (=> start!51320 d!80498))

