; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56218 () Bool)

(assert start!56218)

(declare-datatypes ((array!14309 0))(
  ( (array!14310 (arr!7247 (Array (_ BitVec 32) (_ BitVec 8))) (size!6260 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11442 0))(
  ( (BitStream!11443 (buf!6782 array!14309) (currentByte!12475 (_ BitVec 32)) (currentBit!12470 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11442)

(assert (=> start!56218 (and (bvsle ((_ sign_extend 32) (size!6260 (buf!6782 thiss!914))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12475 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12470 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6260 (buf!6782 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12475 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12470 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!180975 () Bool)

(declare-fun inv!12 (BitStream!11442) Bool)

(assert (=> start!56218 (and (inv!12 thiss!914) e!180975)))

(declare-fun b!260509 () Bool)

(declare-fun array_inv!6001 (array!14309) Bool)

(assert (=> b!260509 (= e!180975 (array_inv!6001 (buf!6782 thiss!914)))))

(assert (= start!56218 b!260509))

(declare-fun m!389815 () Bool)

(assert (=> start!56218 m!389815))

(declare-fun m!389817 () Bool)

(assert (=> b!260509 m!389817))

(check-sat (not b!260509) (not start!56218))
(check-sat)
(get-model)

(declare-fun d!87446 () Bool)

(assert (=> d!87446 (= (array_inv!6001 (buf!6782 thiss!914)) (bvsge (size!6260 (buf!6782 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260509 d!87446))

(declare-fun d!87448 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87448 (= (inv!12 thiss!914) (invariant!0 (currentBit!12470 thiss!914) (currentByte!12475 thiss!914) (size!6260 (buf!6782 thiss!914))))))

(declare-fun bs!22166 () Bool)

(assert (= bs!22166 d!87448))

(declare-fun m!389823 () Bool)

(assert (=> bs!22166 m!389823))

(assert (=> start!56218 d!87448))

(check-sat (not d!87448))
(check-sat)
(get-model)

(declare-fun d!87454 () Bool)

(assert (=> d!87454 (= (invariant!0 (currentBit!12470 thiss!914) (currentByte!12475 thiss!914) (size!6260 (buf!6782 thiss!914))) (and (bvsge (currentBit!12470 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12470 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12475 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12475 thiss!914) (size!6260 (buf!6782 thiss!914))) (and (= (currentBit!12470 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12475 thiss!914) (size!6260 (buf!6782 thiss!914)))))))))

(assert (=> d!87448 d!87454))

(check-sat)
