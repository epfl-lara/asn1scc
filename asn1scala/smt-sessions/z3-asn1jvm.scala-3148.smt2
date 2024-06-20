; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72298 () Bool)

(assert start!72298)

(declare-datatypes ((array!20703 0))(
  ( (array!20704 (arr!10103 (Array (_ BitVec 32) (_ BitVec 8))) (size!9011 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14184 0))(
  ( (BitStream!14185 (buf!8153 array!20703) (currentByte!15045 (_ BitVec 32)) (currentBit!15040 (_ BitVec 32))) )
))
(declare-fun thiss!1711 () BitStream!14184)

(assert (=> start!72298 (or (bvsgt ((_ sign_extend 32) (size!9011 (buf!8153 thiss!1711))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15045 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15040 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!233366 () Bool)

(declare-fun inv!12 (BitStream!14184) Bool)

(assert (=> start!72298 (and (inv!12 thiss!1711) e!233366)))

(declare-fun b!323971 () Bool)

(declare-fun array_inv!8563 (array!20703) Bool)

(assert (=> b!323971 (= e!233366 (array_inv!8563 (buf!8153 thiss!1711)))))

(assert (= start!72298 b!323971))

(declare-fun m!462019 () Bool)

(assert (=> start!72298 m!462019))

(declare-fun m!462021 () Bool)

(assert (=> b!323971 m!462021))

(check-sat (not start!72298) (not b!323971))
(check-sat)
