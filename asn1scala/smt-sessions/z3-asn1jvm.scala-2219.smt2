; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56238 () Bool)

(assert start!56238)

(declare-fun res!218089 () Bool)

(declare-fun e!180998 () Bool)

(assert (=> start!56238 (=> (not res!218089) (not e!180998))))

(declare-datatypes ((array!14318 0))(
  ( (array!14319 (arr!7250 (Array (_ BitVec 32) (_ BitVec 8))) (size!6263 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11448 0))(
  ( (BitStream!11449 (buf!6785 array!14318) (currentByte!12479 (_ BitVec 32)) (currentBit!12474 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11448)

(assert (=> start!56238 (= res!218089 (and (bvsle ((_ sign_extend 32) (size!6263 (buf!6785 thiss!914))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12479 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12474 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6263 (buf!6785 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12479 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12474 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56238 e!180998))

(declare-fun e!180999 () Bool)

(declare-fun inv!12 (BitStream!11448) Bool)

(assert (=> start!56238 (and (inv!12 thiss!914) e!180999)))

(declare-fun b!260523 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260523 (= e!180998 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12474 thiss!914))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12479 thiss!914))) ((_ extract 31 0) ((_ sign_extend 32) (size!6263 (buf!6785 thiss!914)))))))))

(declare-fun b!260524 () Bool)

(declare-fun array_inv!6004 (array!14318) Bool)

(assert (=> b!260524 (= e!180999 (array_inv!6004 (buf!6785 thiss!914)))))

(assert (= (and start!56238 res!218089) b!260523))

(assert (= start!56238 b!260524))

(declare-fun m!389835 () Bool)

(assert (=> start!56238 m!389835))

(declare-fun m!389837 () Bool)

(assert (=> b!260523 m!389837))

(declare-fun m!389839 () Bool)

(assert (=> b!260524 m!389839))

(check-sat (not b!260523) (not b!260524) (not start!56238))
(check-sat)
(get-model)

(declare-fun d!87462 () Bool)

(assert (=> d!87462 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12474 thiss!914))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12479 thiss!914))) ((_ extract 31 0) ((_ sign_extend 32) (size!6263 (buf!6785 thiss!914))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12474 thiss!914))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12474 thiss!914))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12479 thiss!914))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12479 thiss!914))) ((_ extract 31 0) ((_ sign_extend 32) (size!6263 (buf!6785 thiss!914))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12474 thiss!914))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12479 thiss!914))) ((_ extract 31 0) ((_ sign_extend 32) (size!6263 (buf!6785 thiss!914)))))))))))

(assert (=> b!260523 d!87462))

(declare-fun d!87464 () Bool)

(assert (=> d!87464 (= (array_inv!6004 (buf!6785 thiss!914)) (bvsge (size!6263 (buf!6785 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260524 d!87464))

(declare-fun d!87466 () Bool)

(assert (=> d!87466 (= (inv!12 thiss!914) (invariant!0 (currentBit!12474 thiss!914) (currentByte!12479 thiss!914) (size!6263 (buf!6785 thiss!914))))))

(declare-fun bs!22172 () Bool)

(assert (= bs!22172 d!87466))

(declare-fun m!389847 () Bool)

(assert (=> bs!22172 m!389847))

(assert (=> start!56238 d!87466))

(check-sat (not d!87466))
(check-sat)
