; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56240 () Bool)

(assert start!56240)

(declare-fun res!218092 () Bool)

(declare-fun e!181007 () Bool)

(assert (=> start!56240 (=> (not res!218092) (not e!181007))))

(declare-datatypes ((array!14320 0))(
  ( (array!14321 (arr!7251 (Array (_ BitVec 32) (_ BitVec 8))) (size!6264 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11450 0))(
  ( (BitStream!11451 (buf!6786 array!14320) (currentByte!12480 (_ BitVec 32)) (currentBit!12475 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11450)

(assert (=> start!56240 (= res!218092 (and (bvsle ((_ sign_extend 32) (size!6264 (buf!6786 thiss!914))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12480 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12475 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6264 (buf!6786 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12480 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12475 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56240 e!181007))

(declare-fun e!181008 () Bool)

(declare-fun inv!12 (BitStream!11450) Bool)

(assert (=> start!56240 (and (inv!12 thiss!914) e!181008)))

(declare-fun b!260529 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260529 (= e!181007 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12475 thiss!914))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12480 thiss!914))) ((_ extract 31 0) ((_ sign_extend 32) (size!6264 (buf!6786 thiss!914)))))))))

(declare-fun b!260530 () Bool)

(declare-fun array_inv!6005 (array!14320) Bool)

(assert (=> b!260530 (= e!181008 (array_inv!6005 (buf!6786 thiss!914)))))

(assert (= (and start!56240 res!218092) b!260529))

(assert (= start!56240 b!260530))

(declare-fun m!389841 () Bool)

(assert (=> start!56240 m!389841))

(declare-fun m!389843 () Bool)

(assert (=> b!260529 m!389843))

(declare-fun m!389845 () Bool)

(assert (=> b!260530 m!389845))

(push 1)

(assert (not b!260530))

(assert (not start!56240))

(assert (not b!260529))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

