; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59716 () Bool)

(assert start!59716)

(declare-fun res!227059 () Bool)

(declare-fun e!192586 () Bool)

(assert (=> start!59716 (=> (not res!227059) (not e!192586))))

(declare-datatypes ((array!15232 0))(
  ( (array!15233 (arr!7610 (Array (_ BitVec 32) (_ BitVec 8))) (size!6623 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12060 0))(
  ( (BitStream!12061 (buf!7091 array!15232) (currentByte!13095 (_ BitVec 32)) (currentBit!13090 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12060)

(assert (=> start!59716 (= res!227059 (not (= (size!6623 (buf!7091 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59716 e!192586))

(declare-fun e!192584 () Bool)

(declare-fun inv!12 (BitStream!12060) Bool)

(assert (=> start!59716 (and (inv!12 bs!71) e!192584)))

(declare-fun b!272716 () Bool)

(declare-fun lt!410548 () (_ BitVec 64))

(assert (=> b!272716 (= e!192586 (not (or (= ((_ sign_extend 32) (size!6623 (buf!7091 bs!71))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!410548 ((_ sign_extend 32) (size!6623 (buf!7091 bs!71))))))))))

(declare-fun arrayBitRangesEq!0 (array!15232 array!15232 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272716 (arrayBitRangesEq!0 (buf!7091 bs!71) (buf!7091 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410548)))

(assert (=> b!272716 (= lt!410548 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6623 (buf!7091 bs!71)))))))

(declare-datatypes ((Unit!19225 0))(
  ( (Unit!19226) )
))
(declare-fun lt!410549 () Unit!19225)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15232) Unit!19225)

(assert (=> b!272716 (= lt!410549 (arrayBitEqImpliesRangesEqLemma!0 (buf!7091 bs!71)))))

(declare-fun b!272717 () Bool)

(declare-fun array_inv!6347 (array!15232) Bool)

(assert (=> b!272717 (= e!192584 (array_inv!6347 (buf!7091 bs!71)))))

(assert (= (and start!59716 res!227059) b!272716))

(assert (= start!59716 b!272717))

(declare-fun m!405587 () Bool)

(assert (=> start!59716 m!405587))

(declare-fun m!405589 () Bool)

(assert (=> b!272716 m!405589))

(declare-fun m!405591 () Bool)

(assert (=> b!272716 m!405591))

(declare-fun m!405593 () Bool)

(assert (=> b!272717 m!405593))

(check-sat (not b!272716) (not b!272717) (not start!59716))
(check-sat)
