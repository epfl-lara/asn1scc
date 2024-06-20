; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59714 () Bool)

(assert start!59714)

(declare-fun res!227056 () Bool)

(declare-fun e!192577 () Bool)

(assert (=> start!59714 (=> (not res!227056) (not e!192577))))

(declare-datatypes ((array!15230 0))(
  ( (array!15231 (arr!7609 (Array (_ BitVec 32) (_ BitVec 8))) (size!6622 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12058 0))(
  ( (BitStream!12059 (buf!7090 array!15230) (currentByte!13094 (_ BitVec 32)) (currentBit!13089 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12058)

(assert (=> start!59714 (= res!227056 (not (= (size!6622 (buf!7090 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59714 e!192577))

(declare-fun e!192575 () Bool)

(declare-fun inv!12 (BitStream!12058) Bool)

(assert (=> start!59714 (and (inv!12 bs!71) e!192575)))

(declare-fun b!272710 () Bool)

(declare-fun lt!410543 () (_ BitVec 64))

(assert (=> b!272710 (= e!192577 (not (or (= ((_ sign_extend 32) (size!6622 (buf!7090 bs!71))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!410543 ((_ sign_extend 32) (size!6622 (buf!7090 bs!71))))))))))

(declare-fun arrayBitRangesEq!0 (array!15230 array!15230 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272710 (arrayBitRangesEq!0 (buf!7090 bs!71) (buf!7090 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410543)))

(assert (=> b!272710 (= lt!410543 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6622 (buf!7090 bs!71)))))))

(declare-datatypes ((Unit!19223 0))(
  ( (Unit!19224) )
))
(declare-fun lt!410542 () Unit!19223)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15230) Unit!19223)

(assert (=> b!272710 (= lt!410542 (arrayBitEqImpliesRangesEqLemma!0 (buf!7090 bs!71)))))

(declare-fun b!272711 () Bool)

(declare-fun array_inv!6346 (array!15230) Bool)

(assert (=> b!272711 (= e!192575 (array_inv!6346 (buf!7090 bs!71)))))

(assert (= (and start!59714 res!227056) b!272710))

(assert (= start!59714 b!272711))

(declare-fun m!405579 () Bool)

(assert (=> start!59714 m!405579))

(declare-fun m!405581 () Bool)

(assert (=> b!272710 m!405581))

(declare-fun m!405583 () Bool)

(assert (=> b!272710 m!405583))

(declare-fun m!405585 () Bool)

(assert (=> b!272711 m!405585))

(push 1)

(assert (not start!59714))

(assert (not b!272710))

(assert (not b!272711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

