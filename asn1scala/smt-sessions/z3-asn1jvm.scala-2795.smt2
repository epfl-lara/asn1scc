; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67352 () Bool)

(assert start!67352)

(declare-fun res!248928 () Bool)

(declare-fun e!217425 () Bool)

(assert (=> start!67352 (=> (not res!248928) (not e!217425))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18352 0))(
  ( (array!18353 (arr!9053 (Array (_ BitVec 32) (_ BitVec 8))) (size!7970 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18352)

(declare-fun a2!948 () array!18352)

(assert (=> start!67352 (= res!248928 (and (bvsle (size!7970 a1!948) (size!7970 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67352 e!217425))

(assert (=> start!67352 true))

(declare-fun array_inv!7582 (array!18352) Bool)

(assert (=> start!67352 (array_inv!7582 a1!948)))

(assert (=> start!67352 (array_inv!7582 a2!948)))

(declare-fun b!302468 () Bool)

(declare-fun e!217423 () Bool)

(assert (=> b!302468 (= e!217425 e!217423)))

(declare-fun res!248926 () Bool)

(assert (=> b!302468 (=> (not res!248926) (not e!217423))))

(declare-fun lt!437271 () (_ BitVec 64))

(assert (=> b!302468 (= res!248926 (and (bvsle toBit!258 lt!437271) (bvsle fromBit!258 lt!437271)))))

(assert (=> b!302468 (= lt!437271 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7970 a1!948))))))

(declare-fun b!302469 () Bool)

(declare-fun res!248927 () Bool)

(assert (=> b!302469 (=> (not res!248927) (not e!217423))))

(declare-fun arrayBitRangesEq!0 (array!18352 array!18352 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302469 (= res!248927 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302470 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302470 (= e!217423 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437271) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67352 res!248928) b!302468))

(assert (= (and b!302468 res!248926) b!302469))

(assert (= (and b!302469 res!248927) b!302470))

(declare-fun m!441315 () Bool)

(assert (=> start!67352 m!441315))

(declare-fun m!441317 () Bool)

(assert (=> start!67352 m!441317))

(declare-fun m!441319 () Bool)

(assert (=> b!302469 m!441319))

(check-sat (not start!67352) (not b!302469))
(check-sat)
