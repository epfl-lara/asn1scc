; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72370 () Bool)

(assert start!72370)

(declare-fun res!265969 () Bool)

(declare-fun e!233461 () Bool)

(assert (=> start!72370 (=> (not res!265969) (not e!233461))))

(declare-datatypes ((array!20740 0))(
  ( (array!20741 (arr!10117 (Array (_ BitVec 32) (_ BitVec 8))) (size!9025 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14212 0))(
  ( (BitStream!14213 (buf!8167 array!20740) (currentByte!15063 (_ BitVec 32)) (currentBit!15058 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14212)

(assert (=> start!72370 (= res!265969 (and (bvsle ((_ sign_extend 32) (size!9025 (buf!8167 thiss!1702))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15063 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15058 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9025 (buf!8167 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15063 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15058 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!72370 e!233461))

(declare-fun e!233462 () Bool)

(declare-fun inv!12 (BitStream!14212) Bool)

(assert (=> start!72370 (and (inv!12 thiss!1702) e!233462)))

(declare-fun b!324024 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324024 (= e!233461 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15058 thiss!1702))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15063 thiss!1702))) ((_ extract 31 0) ((_ sign_extend 32) (size!9025 (buf!8167 thiss!1702)))))))))

(declare-fun b!324025 () Bool)

(declare-fun array_inv!8577 (array!20740) Bool)

(assert (=> b!324025 (= e!233462 (array_inv!8577 (buf!8167 thiss!1702)))))

(assert (= (and start!72370 res!265969) b!324024))

(assert (= start!72370 b!324025))

(declare-fun m!462097 () Bool)

(assert (=> start!72370 m!462097))

(declare-fun m!462099 () Bool)

(assert (=> b!324024 m!462099))

(declare-fun m!462101 () Bool)

(assert (=> b!324025 m!462101))

(push 1)

(assert (not b!324025))

(assert (not start!72370))

(assert (not b!324024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

