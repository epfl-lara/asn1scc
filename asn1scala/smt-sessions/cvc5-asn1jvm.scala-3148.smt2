; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72296 () Bool)

(assert start!72296)

(declare-datatypes ((array!20701 0))(
  ( (array!20702 (arr!10102 (Array (_ BitVec 32) (_ BitVec 8))) (size!9010 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14182 0))(
  ( (BitStream!14183 (buf!8152 array!20701) (currentByte!15044 (_ BitVec 32)) (currentBit!15039 (_ BitVec 32))) )
))
(declare-fun thiss!1711 () BitStream!14182)

(assert (=> start!72296 (or (bvsgt ((_ sign_extend 32) (size!9010 (buf!8152 thiss!1711))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15044 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15039 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!233360 () Bool)

(declare-fun inv!12 (BitStream!14182) Bool)

(assert (=> start!72296 (and (inv!12 thiss!1711) e!233360)))

(declare-fun b!323968 () Bool)

(declare-fun array_inv!8562 (array!20701) Bool)

(assert (=> b!323968 (= e!233360 (array_inv!8562 (buf!8152 thiss!1711)))))

(assert (= start!72296 b!323968))

(declare-fun m!462015 () Bool)

(assert (=> start!72296 m!462015))

(declare-fun m!462017 () Bool)

(assert (=> b!323968 m!462017))

(push 1)

(assert (not b!323968))

(assert (not start!72296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

