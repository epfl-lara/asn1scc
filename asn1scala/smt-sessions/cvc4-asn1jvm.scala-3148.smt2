; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72300 () Bool)

(assert start!72300)

(declare-datatypes ((array!20705 0))(
  ( (array!20706 (arr!10104 (Array (_ BitVec 32) (_ BitVec 8))) (size!9012 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14186 0))(
  ( (BitStream!14187 (buf!8154 array!20705) (currentByte!15046 (_ BitVec 32)) (currentBit!15041 (_ BitVec 32))) )
))
(declare-fun thiss!1711 () BitStream!14186)

(assert (=> start!72300 (or (bvsgt ((_ sign_extend 32) (size!9012 (buf!8154 thiss!1711))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15046 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15041 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!233372 () Bool)

(declare-fun inv!12 (BitStream!14186) Bool)

(assert (=> start!72300 (and (inv!12 thiss!1711) e!233372)))

(declare-fun b!323974 () Bool)

(declare-fun array_inv!8564 (array!20705) Bool)

(assert (=> b!323974 (= e!233372 (array_inv!8564 (buf!8154 thiss!1711)))))

(assert (= start!72300 b!323974))

(declare-fun m!462023 () Bool)

(assert (=> start!72300 m!462023))

(declare-fun m!462025 () Bool)

(assert (=> b!323974 m!462025))

(push 1)

(assert (not start!72300))

(assert (not b!323974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

