; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59722 () Bool)

(assert start!59722)

(declare-fun res!227068 () Bool)

(declare-fun e!192611 () Bool)

(assert (=> start!59722 (=> (not res!227068) (not e!192611))))

(declare-datatypes ((array!15238 0))(
  ( (array!15239 (arr!7613 (Array (_ BitVec 32) (_ BitVec 8))) (size!6626 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12066 0))(
  ( (BitStream!12067 (buf!7094 array!15238) (currentByte!13098 (_ BitVec 32)) (currentBit!13093 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12066)

(assert (=> start!59722 (= res!227068 (not (= (size!6626 (buf!7094 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59722 e!192611))

(declare-fun e!192612 () Bool)

(declare-fun inv!12 (BitStream!12066) Bool)

(assert (=> start!59722 (and (inv!12 bs!71) e!192612)))

(declare-fun b!272734 () Bool)

(assert (=> b!272734 (= e!192611 (not true))))

(declare-fun lt!410566 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272734 (= lt!410566 (bitIndex!0 (size!6626 (buf!7094 bs!71)) (currentByte!13098 bs!71) (currentBit!13093 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15238 array!15238 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272734 (arrayBitRangesEq!0 (buf!7094 bs!71) (buf!7094 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6626 (buf!7094 bs!71)))))))

(declare-datatypes ((Unit!19231 0))(
  ( (Unit!19232) )
))
(declare-fun lt!410567 () Unit!19231)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15238) Unit!19231)

(assert (=> b!272734 (= lt!410567 (arrayBitEqImpliesRangesEqLemma!0 (buf!7094 bs!71)))))

(declare-fun b!272735 () Bool)

(declare-fun array_inv!6350 (array!15238) Bool)

(assert (=> b!272735 (= e!192612 (array_inv!6350 (buf!7094 bs!71)))))

(assert (= (and start!59722 res!227068) b!272734))

(assert (= start!59722 b!272735))

(declare-fun m!405613 () Bool)

(assert (=> start!59722 m!405613))

(declare-fun m!405615 () Bool)

(assert (=> b!272734 m!405615))

(declare-fun m!405617 () Bool)

(assert (=> b!272734 m!405617))

(declare-fun m!405619 () Bool)

(assert (=> b!272734 m!405619))

(declare-fun m!405621 () Bool)

(assert (=> b!272735 m!405621))

(check-sat (not start!59722) (not b!272734) (not b!272735))
