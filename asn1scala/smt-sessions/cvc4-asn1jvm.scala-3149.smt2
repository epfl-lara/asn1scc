; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72306 () Bool)

(assert start!72306)

(declare-datatypes ((array!20711 0))(
  ( (array!20712 (arr!10107 (Array (_ BitVec 32) (_ BitVec 8))) (size!9015 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14192 0))(
  ( (BitStream!14193 (buf!8157 array!20711) (currentByte!15049 (_ BitVec 32)) (currentBit!15044 (_ BitVec 32))) )
))
(declare-fun thiss!1711 () BitStream!14192)

(assert (=> start!72306 (and (bvsle ((_ sign_extend 32) (size!9015 (buf!8157 thiss!1711))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15049 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15044 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9015 (buf!8157 thiss!1711))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15049 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15044 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!233390 () Bool)

(declare-fun inv!12 (BitStream!14192) Bool)

(assert (=> start!72306 (and (inv!12 thiss!1711) e!233390)))

(declare-fun b!323983 () Bool)

(declare-fun array_inv!8567 (array!20711) Bool)

(assert (=> b!323983 (= e!233390 (array_inv!8567 (buf!8157 thiss!1711)))))

(assert (= start!72306 b!323983))

(declare-fun m!462035 () Bool)

(assert (=> start!72306 m!462035))

(declare-fun m!462037 () Bool)

(assert (=> b!323983 m!462037))

(push 1)

(assert (not start!72306))

(assert (not b!323983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

