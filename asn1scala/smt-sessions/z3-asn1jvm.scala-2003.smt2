; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51242 () Bool)

(assert start!51242)

(declare-fun res!199824 () Bool)

(declare-fun e!165309 () Bool)

(assert (=> start!51242 (=> (not res!199824) (not e!165309))))

(declare-datatypes ((array!12816 0))(
  ( (array!12817 (arr!6617 (Array (_ BitVec 32) (_ BitVec 8))) (size!5630 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10182 0))(
  ( (BitStream!10183 (buf!6084 array!12816) (currentByte!11278 (_ BitVec 32)) (currentBit!11273 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10182)

(assert (=> start!51242 (= res!199824 (and (bvsle ((_ sign_extend 32) (size!5630 (buf!6084 thiss!1857))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11278 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11273 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5630 (buf!6084 thiss!1857))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11278 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11273 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51242 e!165309))

(declare-fun e!165310 () Bool)

(declare-fun inv!12 (BitStream!10182) Bool)

(assert (=> start!51242 (and (inv!12 thiss!1857) e!165310)))

(declare-fun b!239122 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239122 (= e!165309 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11273 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11278 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5630 (buf!6084 thiss!1857)))))))))

(declare-fun b!239123 () Bool)

(declare-fun array_inv!5371 (array!12816) Bool)

(assert (=> b!239123 (= e!165310 (array_inv!5371 (buf!6084 thiss!1857)))))

(assert (= (and start!51242 res!199824) b!239122))

(assert (= start!51242 b!239123))

(declare-fun m!361149 () Bool)

(assert (=> start!51242 m!361149))

(declare-fun m!361151 () Bool)

(assert (=> b!239122 m!361151))

(declare-fun m!361153 () Bool)

(assert (=> b!239123 m!361153))

(check-sat (not b!239122) (not start!51242) (not b!239123))
(check-sat)
(get-model)

(declare-fun d!80424 () Bool)

(assert (=> d!80424 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11273 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11278 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5630 (buf!6084 thiss!1857))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11273 thiss!1857))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11273 thiss!1857))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11278 thiss!1857))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11278 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5630 (buf!6084 thiss!1857))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11273 thiss!1857))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11278 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5630 (buf!6084 thiss!1857)))))))))))

(assert (=> b!239122 d!80424))

(declare-fun d!80436 () Bool)

(assert (=> d!80436 (= (inv!12 thiss!1857) (invariant!0 (currentBit!11273 thiss!1857) (currentByte!11278 thiss!1857) (size!5630 (buf!6084 thiss!1857))))))

(declare-fun bs!20208 () Bool)

(assert (= bs!20208 d!80436))

(declare-fun m!361163 () Bool)

(assert (=> bs!20208 m!361163))

(assert (=> start!51242 d!80436))

(declare-fun d!80440 () Bool)

(assert (=> d!80440 (= (array_inv!5371 (buf!6084 thiss!1857)) (bvsge (size!5630 (buf!6084 thiss!1857)) #b00000000000000000000000000000000))))

(assert (=> b!239123 d!80440))

(check-sat (not d!80436))
