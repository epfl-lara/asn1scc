; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63542 () Bool)

(assert start!63542)

(declare-fun res!235196 () Bool)

(declare-fun e!202822 () Bool)

(assert (=> start!63542 (=> (not res!235196) (not e!202822))))

(declare-datatypes ((array!16552 0))(
  ( (array!16553 (arr!8143 (Array (_ BitVec 32) (_ BitVec 8))) (size!7147 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12664 0))(
  ( (BitStream!12665 (buf!7393 array!16552) (currentByte!13696 (_ BitVec 32)) (currentBit!13691 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12664)

(assert (=> start!63542 (= res!235196 (and (bvsle ((_ sign_extend 32) (size!7147 (buf!7393 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13696 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13691 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7147 (buf!7393 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13696 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13691 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63542 e!202822))

(declare-fun e!202823 () Bool)

(declare-fun inv!12 (BitStream!12664) Bool)

(assert (=> start!63542 (and (inv!12 thiss!1929) e!202823)))

(declare-fun b!283853 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283853 (= e!202822 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13691 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13696 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (size!7147 (buf!7393 thiss!1929)))))))))

(declare-fun b!283854 () Bool)

(declare-fun array_inv!6840 (array!16552) Bool)

(assert (=> b!283854 (= e!202823 (array_inv!6840 (buf!7393 thiss!1929)))))

(assert (= (and start!63542 res!235196) b!283853))

(assert (= start!63542 b!283854))

(declare-fun m!416977 () Bool)

(assert (=> start!63542 m!416977))

(declare-fun m!416979 () Bool)

(assert (=> b!283853 m!416979))

(declare-fun m!416981 () Bool)

(assert (=> b!283854 m!416981))

(push 1)

(assert (not b!283854))

(assert (not b!283853))

(assert (not start!63542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

