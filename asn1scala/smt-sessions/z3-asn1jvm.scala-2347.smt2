; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59866 () Bool)

(assert start!59866)

(declare-fun res!227398 () Bool)

(declare-fun e!193061 () Bool)

(assert (=> start!59866 (=> (not res!227398) (not e!193061))))

(declare-datatypes ((array!15289 0))(
  ( (array!15290 (arr!7634 (Array (_ BitVec 32) (_ BitVec 8))) (size!6647 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12108 0))(
  ( (BitStream!12109 (buf!7115 array!15289) (currentByte!13128 (_ BitVec 32)) (currentBit!13123 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12108)

(assert (=> start!59866 (= res!227398 (= (size!6647 (buf!7115 bs!71)) #b00000000000000000000000000000000))))

(assert (=> start!59866 e!193061))

(declare-fun e!193062 () Bool)

(declare-fun inv!12 (BitStream!12108) Bool)

(assert (=> start!59866 (and (inv!12 bs!71) e!193062)))

(declare-fun b!273187 () Bool)

(declare-fun isPrefixOf!0 (BitStream!12108 BitStream!12108) Bool)

(assert (=> b!273187 (= e!193061 (not (isPrefixOf!0 bs!71 bs!71)))))

(declare-fun b!273188 () Bool)

(declare-fun array_inv!6371 (array!15289) Bool)

(assert (=> b!273188 (= e!193062 (array_inv!6371 (buf!7115 bs!71)))))

(assert (= (and start!59866 res!227398) b!273187))

(assert (= start!59866 b!273188))

(declare-fun m!406065 () Bool)

(assert (=> start!59866 m!406065))

(declare-fun m!406067 () Bool)

(assert (=> b!273187 m!406067))

(declare-fun m!406069 () Bool)

(assert (=> b!273188 m!406069))

(check-sat (not b!273188) (not b!273187) (not start!59866))
(check-sat)
(get-model)

(declare-fun d!93423 () Bool)

(assert (=> d!93423 (= (array_inv!6371 (buf!7115 bs!71)) (bvsge (size!6647 (buf!7115 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!273188 d!93423))

(declare-fun d!93428 () Bool)

(declare-fun res!227428 () Bool)

(declare-fun e!193089 () Bool)

(assert (=> d!93428 (=> (not res!227428) (not e!193089))))

(assert (=> d!93428 (= res!227428 (= (size!6647 (buf!7115 bs!71)) (size!6647 (buf!7115 bs!71))))))

(assert (=> d!93428 (= (isPrefixOf!0 bs!71 bs!71) e!193089)))

(declare-fun b!273219 () Bool)

(declare-fun res!227427 () Bool)

(assert (=> b!273219 (=> (not res!227427) (not e!193089))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273219 (= res!227427 (bvsle (bitIndex!0 (size!6647 (buf!7115 bs!71)) (currentByte!13128 bs!71) (currentBit!13123 bs!71)) (bitIndex!0 (size!6647 (buf!7115 bs!71)) (currentByte!13128 bs!71) (currentBit!13123 bs!71))))))

(declare-fun b!273220 () Bool)

(declare-fun e!193090 () Bool)

(assert (=> b!273220 (= e!193089 e!193090)))

(declare-fun res!227426 () Bool)

(assert (=> b!273220 (=> res!227426 e!193090)))

(assert (=> b!273220 (= res!227426 (= (size!6647 (buf!7115 bs!71)) #b00000000000000000000000000000000))))

(declare-fun b!273221 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15289 array!15289 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!273221 (= e!193090 (arrayBitRangesEq!0 (buf!7115 bs!71) (buf!7115 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6647 (buf!7115 bs!71)) (currentByte!13128 bs!71) (currentBit!13123 bs!71))))))

(assert (= (and d!93428 res!227428) b!273219))

(assert (= (and b!273219 res!227427) b!273220))

(assert (= (and b!273220 (not res!227426)) b!273221))

(declare-fun m!406084 () Bool)

(assert (=> b!273219 m!406084))

(assert (=> b!273219 m!406084))

(assert (=> b!273221 m!406084))

(assert (=> b!273221 m!406084))

(declare-fun m!406089 () Bool)

(assert (=> b!273221 m!406089))

(assert (=> b!273187 d!93428))

(declare-fun d!93436 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93436 (= (inv!12 bs!71) (invariant!0 (currentBit!13123 bs!71) (currentByte!13128 bs!71) (size!6647 (buf!7115 bs!71))))))

(declare-fun bs!23565 () Bool)

(assert (= bs!23565 d!93436))

(declare-fun m!406093 () Bool)

(assert (=> bs!23565 m!406093))

(assert (=> start!59866 d!93436))

(check-sat (not d!93436) (not b!273221) (not b!273219))
(check-sat)
