; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59718 () Bool)

(assert start!59718)

(declare-fun res!227062 () Bool)

(declare-fun e!192595 () Bool)

(assert (=> start!59718 (=> (not res!227062) (not e!192595))))

(declare-datatypes ((array!15234 0))(
  ( (array!15235 (arr!7611 (Array (_ BitVec 32) (_ BitVec 8))) (size!6624 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12062 0))(
  ( (BitStream!12063 (buf!7092 array!15234) (currentByte!13096 (_ BitVec 32)) (currentBit!13091 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12062)

(assert (=> start!59718 (= res!227062 (not (= (size!6624 (buf!7092 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59718 e!192595))

(declare-fun e!192594 () Bool)

(declare-fun inv!12 (BitStream!12062) Bool)

(assert (=> start!59718 (and (inv!12 bs!71) e!192594)))

(declare-fun b!272722 () Bool)

(declare-fun lt!410555 () (_ BitVec 64))

(assert (=> b!272722 (= e!192595 (not (or (= ((_ sign_extend 32) (size!6624 (buf!7092 bs!71))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!410555 ((_ sign_extend 32) (size!6624 (buf!7092 bs!71))))))))))

(declare-fun arrayBitRangesEq!0 (array!15234 array!15234 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272722 (arrayBitRangesEq!0 (buf!7092 bs!71) (buf!7092 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410555)))

(assert (=> b!272722 (= lt!410555 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6624 (buf!7092 bs!71)))))))

(declare-datatypes ((Unit!19227 0))(
  ( (Unit!19228) )
))
(declare-fun lt!410554 () Unit!19227)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15234) Unit!19227)

(assert (=> b!272722 (= lt!410554 (arrayBitEqImpliesRangesEqLemma!0 (buf!7092 bs!71)))))

(declare-fun b!272723 () Bool)

(declare-fun array_inv!6348 (array!15234) Bool)

(assert (=> b!272723 (= e!192594 (array_inv!6348 (buf!7092 bs!71)))))

(assert (= (and start!59718 res!227062) b!272722))

(assert (= start!59718 b!272723))

(declare-fun m!405595 () Bool)

(assert (=> start!59718 m!405595))

(declare-fun m!405597 () Bool)

(assert (=> b!272722 m!405597))

(declare-fun m!405599 () Bool)

(assert (=> b!272722 m!405599))

(declare-fun m!405601 () Bool)

(assert (=> b!272723 m!405601))

(push 1)

(assert (not start!59718))

(assert (not b!272722))

(assert (not b!272723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

