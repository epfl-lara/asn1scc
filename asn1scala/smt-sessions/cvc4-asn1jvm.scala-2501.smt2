; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63304 () Bool)

(assert start!63304)

(declare-fun res!235046 () Bool)

(declare-fun e!202475 () Bool)

(assert (=> start!63304 (=> (not res!235046) (not e!202475))))

(declare-datatypes ((array!16460 0))(
  ( (array!16461 (arr!8106 (Array (_ BitVec 32) (_ BitVec 8))) (size!7110 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12590 0))(
  ( (BitStream!12591 (buf!7356 array!16460) (currentByte!13625 (_ BitVec 32)) (currentBit!13620 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12590)

(assert (=> start!63304 (= res!235046 (and (bvsle ((_ sign_extend 32) (size!7110 (buf!7356 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13625 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13620 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7110 (buf!7356 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13625 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13620 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63304 e!202475))

(declare-fun e!202474 () Bool)

(declare-fun inv!12 (BitStream!12590) Bool)

(assert (=> start!63304 (and (inv!12 thiss!1939) e!202474)))

(declare-fun b!283591 () Bool)

(declare-fun res!235045 () Bool)

(assert (=> b!283591 (=> (not res!235045) (not e!202475))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283591 (= res!235045 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13620 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13625 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (size!7110 (buf!7356 thiss!1939))))))))

(declare-fun b!283592 () Bool)

(assert (=> b!283592 (= e!202475 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13625 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13620 thiss!1939))) #b00000000000000000000000000001111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283593 () Bool)

(declare-fun array_inv!6803 (array!16460) Bool)

(assert (=> b!283593 (= e!202474 (array_inv!6803 (buf!7356 thiss!1939)))))

(assert (= (and start!63304 res!235046) b!283591))

(assert (= (and b!283591 res!235045) b!283592))

(assert (= start!63304 b!283593))

(declare-fun m!416617 () Bool)

(assert (=> start!63304 m!416617))

(declare-fun m!416619 () Bool)

(assert (=> b!283591 m!416619))

(declare-fun m!416621 () Bool)

(assert (=> b!283593 m!416621))

(push 1)

(assert (not start!63304))

(assert (not b!283591))

(assert (not b!283593))

(check-sat)

