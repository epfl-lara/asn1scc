; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72322 () Bool)

(assert start!72322)

(declare-fun res!265960 () Bool)

(declare-fun e!233398 () Bool)

(assert (=> start!72322 (=> (not res!265960) (not e!233398))))

(declare-datatypes ((array!20716 0))(
  ( (array!20717 (arr!10108 (Array (_ BitVec 32) (_ BitVec 8))) (size!9016 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14194 0))(
  ( (BitStream!14195 (buf!8158 array!20716) (currentByte!15051 (_ BitVec 32)) (currentBit!15046 (_ BitVec 32))) )
))
(declare-fun thiss!1711 () BitStream!14194)

(assert (=> start!72322 (= res!265960 (and (bvsle ((_ sign_extend 32) (size!9016 (buf!8158 thiss!1711))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15051 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15046 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9016 (buf!8158 thiss!1711))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15051 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15046 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!72322 e!233398))

(declare-fun e!233399 () Bool)

(declare-fun inv!12 (BitStream!14194) Bool)

(assert (=> start!72322 (and (inv!12 thiss!1711) e!233399)))

(declare-fun b!323988 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!323988 (= e!233398 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15046 thiss!1711))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15051 thiss!1711))) ((_ extract 31 0) ((_ sign_extend 32) (size!9016 (buf!8158 thiss!1711)))))))))

(declare-fun b!323989 () Bool)

(declare-fun array_inv!8568 (array!20716) Bool)

(assert (=> b!323989 (= e!233399 (array_inv!8568 (buf!8158 thiss!1711)))))

(assert (= (and start!72322 res!265960) b!323988))

(assert (= start!72322 b!323989))

(declare-fun m!462045 () Bool)

(assert (=> start!72322 m!462045))

(declare-fun m!462047 () Bool)

(assert (=> b!323988 m!462047))

(declare-fun m!462049 () Bool)

(assert (=> b!323989 m!462049))

(push 1)

(assert (not b!323989))

(assert (not start!72322))

(assert (not b!323988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

