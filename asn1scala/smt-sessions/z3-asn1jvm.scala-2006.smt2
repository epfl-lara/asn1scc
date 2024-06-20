; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51302 () Bool)

(assert start!51302)

(declare-datatypes ((array!12840 0))(
  ( (array!12841 (arr!6626 (Array (_ BitVec 32) (_ BitVec 8))) (size!5639 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10200 0))(
  ( (BitStream!10201 (buf!6093 array!12840) (currentByte!11296 (_ BitVec 32)) (currentBit!11291 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10200)

(assert (=> start!51302 (and (bvsle ((_ sign_extend 32) (size!5639 (buf!6093 thiss!1854))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11296 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11291 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5639 (buf!6093 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11296 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11291 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!165376 () Bool)

(declare-fun inv!12 (BitStream!10200) Bool)

(assert (=> start!51302 (and (inv!12 thiss!1854) e!165376)))

(declare-fun b!239162 () Bool)

(declare-fun array_inv!5380 (array!12840) Bool)

(assert (=> b!239162 (= e!165376 (array_inv!5380 (buf!6093 thiss!1854)))))

(assert (= start!51302 b!239162))

(declare-fun m!361219 () Bool)

(assert (=> start!51302 m!361219))

(declare-fun m!361221 () Bool)

(assert (=> b!239162 m!361221))

(check-sat (not b!239162) (not start!51302))
(check-sat)
(get-model)

(declare-fun d!80472 () Bool)

(assert (=> d!80472 (= (array_inv!5380 (buf!6093 thiss!1854)) (bvsge (size!5639 (buf!6093 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239162 d!80472))

(declare-fun d!80474 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80474 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11291 thiss!1854) (currentByte!11296 thiss!1854) (size!5639 (buf!6093 thiss!1854))))))

(declare-fun bs!20228 () Bool)

(assert (= bs!20228 d!80474))

(declare-fun m!361227 () Bool)

(assert (=> bs!20228 m!361227))

(assert (=> start!51302 d!80474))

(check-sat (not d!80474))
(check-sat)
(get-model)

(declare-fun d!80478 () Bool)

(assert (=> d!80478 (= (invariant!0 (currentBit!11291 thiss!1854) (currentByte!11296 thiss!1854) (size!5639 (buf!6093 thiss!1854))) (and (bvsge (currentBit!11291 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11291 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11296 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11296 thiss!1854) (size!5639 (buf!6093 thiss!1854))) (and (= (currentBit!11291 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11296 thiss!1854) (size!5639 (buf!6093 thiss!1854)))))))))

(assert (=> d!80474 d!80478))

(check-sat)
