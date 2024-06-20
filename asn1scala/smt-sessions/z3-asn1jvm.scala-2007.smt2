; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51318 () Bool)

(assert start!51318)

(declare-fun res!199842 () Bool)

(declare-fun e!165399 () Bool)

(assert (=> start!51318 (=> (not res!199842) (not e!165399))))

(declare-datatypes ((array!12848 0))(
  ( (array!12849 (arr!6629 (Array (_ BitVec 32) (_ BitVec 8))) (size!5642 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10206 0))(
  ( (BitStream!10207 (buf!6096 array!12848) (currentByte!11300 (_ BitVec 32)) (currentBit!11295 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10206)

(assert (=> start!51318 (= res!199842 (and (bvsle ((_ sign_extend 32) (size!5642 (buf!6096 thiss!1854))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11300 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11295 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5642 (buf!6096 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11300 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11295 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51318 e!165399))

(declare-fun e!165400 () Bool)

(declare-fun inv!12 (BitStream!10206) Bool)

(assert (=> start!51318 (and (inv!12 thiss!1854) e!165400)))

(declare-fun b!239176 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239176 (= e!165399 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11295 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11300 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5642 (buf!6096 thiss!1854)))))))))

(declare-fun b!239177 () Bool)

(declare-fun array_inv!5383 (array!12848) Bool)

(assert (=> b!239177 (= e!165400 (array_inv!5383 (buf!6096 thiss!1854)))))

(assert (= (and start!51318 res!199842) b!239176))

(assert (= start!51318 b!239177))

(declare-fun m!361237 () Bool)

(assert (=> start!51318 m!361237))

(declare-fun m!361239 () Bool)

(assert (=> b!239176 m!361239))

(declare-fun m!361241 () Bool)

(assert (=> b!239177 m!361241))

(check-sat (not b!239177) (not b!239176) (not start!51318))
(check-sat)
(get-model)

(declare-fun d!80484 () Bool)

(assert (=> d!80484 (= (array_inv!5383 (buf!6096 thiss!1854)) (bvsge (size!5642 (buf!6096 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239177 d!80484))

(declare-fun d!80488 () Bool)

(assert (=> d!80488 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11295 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11300 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5642 (buf!6096 thiss!1854))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11295 thiss!1854))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11295 thiss!1854))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11300 thiss!1854))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11300 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5642 (buf!6096 thiss!1854))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11295 thiss!1854))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11300 thiss!1854))) ((_ extract 31 0) ((_ sign_extend 32) (size!5642 (buf!6096 thiss!1854)))))))))))

(assert (=> b!239176 d!80488))

(declare-fun d!80500 () Bool)

(assert (=> d!80500 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11295 thiss!1854) (currentByte!11300 thiss!1854) (size!5642 (buf!6096 thiss!1854))))))

(declare-fun bs!20235 () Bool)

(assert (= bs!20235 d!80500))

(declare-fun m!361253 () Bool)

(assert (=> bs!20235 m!361253))

(assert (=> start!51318 d!80500))

(check-sat (not d!80500))
