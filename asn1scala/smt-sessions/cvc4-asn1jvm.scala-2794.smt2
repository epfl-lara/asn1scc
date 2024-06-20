; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67348 () Bool)

(assert start!67348)

(declare-fun res!248910 () Bool)

(declare-fun e!217401 () Bool)

(assert (=> start!67348 (=> (not res!248910) (not e!217401))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18348 0))(
  ( (array!18349 (arr!9051 (Array (_ BitVec 32) (_ BitVec 8))) (size!7968 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18348)

(declare-fun a2!948 () array!18348)

(assert (=> start!67348 (= res!248910 (and (bvsle (size!7968 a1!948) (size!7968 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67348 e!217401))

(assert (=> start!67348 true))

(declare-fun array_inv!7580 (array!18348) Bool)

(assert (=> start!67348 (array_inv!7580 a1!948)))

(assert (=> start!67348 (array_inv!7580 a2!948)))

(declare-fun b!302450 () Bool)

(declare-fun e!217399 () Bool)

(assert (=> b!302450 (= e!217401 e!217399)))

(declare-fun res!248909 () Bool)

(assert (=> b!302450 (=> (not res!248909) (not e!217399))))

(declare-fun lt!437265 () (_ BitVec 64))

(assert (=> b!302450 (= res!248909 (and (bvsle toBit!258 lt!437265) (bvsle fromBit!258 lt!437265)))))

(assert (=> b!302450 (= lt!437265 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7968 a1!948))))))

(declare-fun b!302451 () Bool)

(declare-fun res!248908 () Bool)

(assert (=> b!302451 (=> (not res!248908) (not e!217399))))

(declare-fun arrayBitRangesEq!0 (array!18348 array!18348 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302451 (= res!248908 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302452 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302452 (= e!217399 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437265) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67348 res!248910) b!302450))

(assert (= (and b!302450 res!248909) b!302451))

(assert (= (and b!302451 res!248908) b!302452))

(declare-fun m!441303 () Bool)

(assert (=> start!67348 m!441303))

(declare-fun m!441305 () Bool)

(assert (=> start!67348 m!441305))

(declare-fun m!441307 () Bool)

(assert (=> b!302451 m!441307))

(push 1)

(assert (not b!302451))

(assert (not start!67348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

