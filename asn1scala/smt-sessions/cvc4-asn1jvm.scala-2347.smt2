; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59868 () Bool)

(assert start!59868)

(declare-fun res!227401 () Bool)

(declare-fun e!193070 () Bool)

(assert (=> start!59868 (=> (not res!227401) (not e!193070))))

(declare-datatypes ((array!15291 0))(
  ( (array!15292 (arr!7635 (Array (_ BitVec 32) (_ BitVec 8))) (size!6648 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12110 0))(
  ( (BitStream!12111 (buf!7116 array!15291) (currentByte!13129 (_ BitVec 32)) (currentBit!13124 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12110)

(assert (=> start!59868 (= res!227401 (= (size!6648 (buf!7116 bs!71)) #b00000000000000000000000000000000))))

(assert (=> start!59868 e!193070))

(declare-fun e!193071 () Bool)

(declare-fun inv!12 (BitStream!12110) Bool)

(assert (=> start!59868 (and (inv!12 bs!71) e!193071)))

(declare-fun b!273193 () Bool)

(declare-fun isPrefixOf!0 (BitStream!12110 BitStream!12110) Bool)

(assert (=> b!273193 (= e!193070 (not (isPrefixOf!0 bs!71 bs!71)))))

(declare-fun b!273194 () Bool)

(declare-fun array_inv!6372 (array!15291) Bool)

(assert (=> b!273194 (= e!193071 (array_inv!6372 (buf!7116 bs!71)))))

(assert (= (and start!59868 res!227401) b!273193))

(assert (= start!59868 b!273194))

(declare-fun m!406071 () Bool)

(assert (=> start!59868 m!406071))

(declare-fun m!406073 () Bool)

(assert (=> b!273193 m!406073))

(declare-fun m!406075 () Bool)

(assert (=> b!273194 m!406075))

(push 1)

(assert (not b!273194))

(assert (not b!273193))

(assert (not start!59868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93424 () Bool)

(assert (=> d!93424 (= (array_inv!6372 (buf!7116 bs!71)) (bvsge (size!6648 (buf!7116 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!273194 d!93424))

(declare-fun d!93427 () Bool)

(declare-fun res!227425 () Bool)

(declare-fun e!193088 () Bool)

(assert (=> d!93427 (=> (not res!227425) (not e!193088))))

(assert (=> d!93427 (= res!227425 (= (size!6648 (buf!7116 bs!71)) (size!6648 (buf!7116 bs!71))))))

(assert (=> d!93427 (= (isPrefixOf!0 bs!71 bs!71) e!193088)))

(declare-fun b!273216 () Bool)

(declare-fun res!227423 () Bool)

(assert (=> b!273216 (=> (not res!227423) (not e!193088))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273216 (= res!227423 (bvsle (bitIndex!0 (size!6648 (buf!7116 bs!71)) (currentByte!13129 bs!71) (currentBit!13124 bs!71)) (bitIndex!0 (size!6648 (buf!7116 bs!71)) (currentByte!13129 bs!71) (currentBit!13124 bs!71))))))

(declare-fun b!273217 () Bool)

(declare-fun e!193087 () Bool)

(assert (=> b!273217 (= e!193088 e!193087)))

(declare-fun res!227424 () Bool)

(assert (=> b!273217 (=> res!227424 e!193087)))

(assert (=> b!273217 (= res!227424 (= (size!6648 (buf!7116 bs!71)) #b00000000000000000000000000000000))))

(declare-fun b!273218 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15291 array!15291 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!273218 (= e!193087 (arrayBitRangesEq!0 (buf!7116 bs!71) (buf!7116 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6648 (buf!7116 bs!71)) (currentByte!13129 bs!71) (currentBit!13124 bs!71))))))

(assert (= (and d!93427 res!227425) b!273216))

(assert (= (and b!273216 res!227423) b!273217))

(assert (= (and b!273217 (not res!227424)) b!273218))

(declare-fun m!406085 () Bool)

(assert (=> b!273216 m!406085))

(assert (=> b!273216 m!406085))

(assert (=> b!273218 m!406085))

(assert (=> b!273218 m!406085))

(declare-fun m!406087 () Bool)

