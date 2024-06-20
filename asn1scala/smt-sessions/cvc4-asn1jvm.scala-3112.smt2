; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71566 () Bool)

(assert start!71566)

(declare-fun res!264040 () Bool)

(declare-fun e!231796 () Bool)

(assert (=> start!71566 (=> (not res!264040) (not e!231796))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20472 0))(
  ( (array!20473 (arr!10005 (Array (_ BitVec 32) (_ BitVec 8))) (size!8913 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13988 0))(
  ( (BitStream!13989 (buf!8055 array!20472) (currentByte!14853 (_ BitVec 32)) (currentBit!14848 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13988)

(assert (=> start!71566 (= res!264040 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8913 (buf!8055 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14853 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14848 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8913 (buf!8055 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14853 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14848 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71566 e!231796))

(assert (=> start!71566 true))

(declare-fun e!231797 () Bool)

(declare-fun inv!12 (BitStream!13988) Bool)

(assert (=> start!71566 (and (inv!12 thiss!1793) e!231797)))

(declare-fun b!321657 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321657 (= e!231796 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14848 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14853 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (size!8913 (buf!8055 thiss!1793)))))))))

(declare-fun b!321658 () Bool)

(declare-fun array_inv!8465 (array!20472) Bool)

(assert (=> b!321658 (= e!231797 (array_inv!8465 (buf!8055 thiss!1793)))))

(assert (= (and start!71566 res!264040) b!321657))

(assert (= start!71566 b!321658))

(declare-fun m!460015 () Bool)

(assert (=> start!71566 m!460015))

(declare-fun m!460017 () Bool)

(assert (=> b!321657 m!460017))

(declare-fun m!460019 () Bool)

(assert (=> b!321658 m!460019))

(push 1)

(assert (not b!321657))

(assert (not start!71566))

(assert (not b!321658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

