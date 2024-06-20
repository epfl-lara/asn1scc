; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56236 () Bool)

(assert start!56236)

(declare-fun res!218086 () Bool)

(declare-fun e!180989 () Bool)

(assert (=> start!56236 (=> (not res!218086) (not e!180989))))

(declare-datatypes ((array!14316 0))(
  ( (array!14317 (arr!7249 (Array (_ BitVec 32) (_ BitVec 8))) (size!6262 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11446 0))(
  ( (BitStream!11447 (buf!6784 array!14316) (currentByte!12478 (_ BitVec 32)) (currentBit!12473 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11446)

(assert (=> start!56236 (= res!218086 (and (bvsle ((_ sign_extend 32) (size!6262 (buf!6784 thiss!914))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12478 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12473 thiss!914)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6262 (buf!6784 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12478 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12473 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56236 e!180989))

(declare-fun e!180990 () Bool)

(declare-fun inv!12 (BitStream!11446) Bool)

(assert (=> start!56236 (and (inv!12 thiss!914) e!180990)))

(declare-fun b!260517 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260517 (= e!180989 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12473 thiss!914))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12478 thiss!914))) ((_ extract 31 0) ((_ sign_extend 32) (size!6262 (buf!6784 thiss!914)))))))))

(declare-fun b!260518 () Bool)

(declare-fun array_inv!6003 (array!14316) Bool)

(assert (=> b!260518 (= e!180990 (array_inv!6003 (buf!6784 thiss!914)))))

(assert (= (and start!56236 res!218086) b!260517))

(assert (= start!56236 b!260518))

(declare-fun m!389829 () Bool)

(assert (=> start!56236 m!389829))

(declare-fun m!389831 () Bool)

(assert (=> b!260517 m!389831))

(declare-fun m!389833 () Bool)

(assert (=> b!260518 m!389833))

(push 1)

(assert (not start!56236))

(assert (not b!260517))

(assert (not b!260518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

