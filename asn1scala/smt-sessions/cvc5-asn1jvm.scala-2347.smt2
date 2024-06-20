; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59864 () Bool)

(assert start!59864)

(declare-fun res!227395 () Bool)

(declare-fun e!193052 () Bool)

(assert (=> start!59864 (=> (not res!227395) (not e!193052))))

(declare-datatypes ((array!15287 0))(
  ( (array!15288 (arr!7633 (Array (_ BitVec 32) (_ BitVec 8))) (size!6646 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12106 0))(
  ( (BitStream!12107 (buf!7114 array!15287) (currentByte!13127 (_ BitVec 32)) (currentBit!13122 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12106)

(assert (=> start!59864 (= res!227395 (= (size!6646 (buf!7114 bs!71)) #b00000000000000000000000000000000))))

(assert (=> start!59864 e!193052))

(declare-fun e!193053 () Bool)

(declare-fun inv!12 (BitStream!12106) Bool)

(assert (=> start!59864 (and (inv!12 bs!71) e!193053)))

(declare-fun b!273181 () Bool)

(declare-fun isPrefixOf!0 (BitStream!12106 BitStream!12106) Bool)

(assert (=> b!273181 (= e!193052 (not (isPrefixOf!0 bs!71 bs!71)))))

(declare-fun b!273182 () Bool)

(declare-fun array_inv!6370 (array!15287) Bool)

(assert (=> b!273182 (= e!193053 (array_inv!6370 (buf!7114 bs!71)))))

(assert (= (and start!59864 res!227395) b!273181))

(assert (= start!59864 b!273182))

(declare-fun m!406059 () Bool)

(assert (=> start!59864 m!406059))

(declare-fun m!406061 () Bool)

(assert (=> b!273181 m!406061))

(declare-fun m!406063 () Bool)

(assert (=> b!273182 m!406063))

(push 1)

(assert (not b!273181))

(assert (not start!59864))

(assert (not b!273182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93420 () Bool)

(declare-fun res!227409 () Bool)

(declare-fun e!193077 () Bool)

(assert (=> d!93420 (=> (not res!227409) (not e!193077))))

(assert (=> d!93420 (= res!227409 (= (size!6646 (buf!7114 bs!71)) (size!6646 (buf!7114 bs!71))))))

(assert (=> d!93420 (= (isPrefixOf!0 bs!71 bs!71) e!193077)))

(declare-fun b!273201 () Bool)

(declare-fun res!227410 () Bool)

(assert (=> b!273201 (=> (not res!227410) (not e!193077))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273201 (= res!227410 (bvsle (bitIndex!0 (size!6646 (buf!7114 bs!71)) (currentByte!13127 bs!71) (currentBit!13122 bs!71)) (bitIndex!0 (size!6646 (buf!7114 bs!71)) (currentByte!13127 bs!71) (currentBit!13122 bs!71))))))

(declare-fun b!273202 () Bool)

(declare-fun e!193078 () Bool)

(assert (=> b!273202 (= e!193077 e!193078)))

(declare-fun res!227408 () Bool)

(assert (=> b!273202 (=> res!227408 e!193078)))

(assert (=> b!273202 (= res!227408 (= (size!6646 (buf!7114 bs!71)) #b00000000000000000000000000000000))))

(declare-fun b!273203 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15287 array!15287 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!273203 (= e!193078 (arrayBitRangesEq!0 (buf!7114 bs!71) (buf!7114 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6646 (buf!7114 bs!71)) (currentByte!13127 bs!71) (currentBit!13122 bs!71))))))

(assert (= (and d!93420 res!227409) b!273201))

(assert (= (and b!273201 res!227410) b!273202))

(assert (= (and b!273202 (not res!227408)) b!273203))

(declare-fun m!406077 () Bool)

(assert (=> b!273201 m!406077))

(assert (=> b!273201 m!406077))

(assert (=> b!273203 m!406077))

(assert (=> b!273203 m!406077))

(declare-fun m!406079 () Bool)

(assert (=> b!273203 m!406079))

(assert (=> b!273181 d!93420))

(declare-fun d!93430 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93430 (= (inv!12 bs!71) (invariant!0 (currentBit!13122 bs!71) (currentByte!13127 bs!71) (size!6646 (buf!7114 bs!71))))))

(declare-fun bs!23563 () Bool)

(assert (= bs!23563 d!93430))

(declare-fun m!406081 () Bool)

(assert (=> bs!23563 m!406081))

(assert (=> start!59864 d!93430))

(declare-fun d!93432 () Bool)

(assert (=> d!93432 (= (array_inv!6370 (buf!7114 bs!71)) (bvsge (size!6646 (buf!7114 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!273182 d!93432))

(push 1)

(assert (not b!273203))

(assert (not b!273201))

(assert (not d!93430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

