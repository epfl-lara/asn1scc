; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67344 () Bool)

(assert start!67344)

(declare-fun res!248892 () Bool)

(declare-fun e!217375 () Bool)

(assert (=> start!67344 (=> (not res!248892) (not e!217375))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18344 0))(
  ( (array!18345 (arr!9049 (Array (_ BitVec 32) (_ BitVec 8))) (size!7966 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18344)

(declare-fun a2!948 () array!18344)

(assert (=> start!67344 (= res!248892 (and (bvsle (size!7966 a1!948) (size!7966 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67344 e!217375))

(assert (=> start!67344 true))

(declare-fun array_inv!7578 (array!18344) Bool)

(assert (=> start!67344 (array_inv!7578 a1!948)))

(assert (=> start!67344 (array_inv!7578 a2!948)))

(declare-fun b!302432 () Bool)

(declare-fun e!217378 () Bool)

(assert (=> b!302432 (= e!217375 e!217378)))

(declare-fun res!248890 () Bool)

(assert (=> b!302432 (=> (not res!248890) (not e!217378))))

(declare-fun lt!437259 () (_ BitVec 64))

(assert (=> b!302432 (= res!248890 (and (bvsle toBit!258 lt!437259) (bvsle fromBit!258 lt!437259)))))

(assert (=> b!302432 (= lt!437259 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7966 a1!948))))))

(declare-fun b!302433 () Bool)

(declare-fun res!248891 () Bool)

(assert (=> b!302433 (=> (not res!248891) (not e!217378))))

(declare-fun arrayBitRangesEq!0 (array!18344 array!18344 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302433 (= res!248891 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302434 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302434 (= e!217378 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437259) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67344 res!248892) b!302432))

(assert (= (and b!302432 res!248890) b!302433))

(assert (= (and b!302433 res!248891) b!302434))

(declare-fun m!441291 () Bool)

(assert (=> start!67344 m!441291))

(declare-fun m!441293 () Bool)

(assert (=> start!67344 m!441293))

(declare-fun m!441295 () Bool)

(assert (=> b!302433 m!441295))

(push 1)

(assert (not start!67344))

(assert (not b!302433))

(check-sat)

(pop 1)

(push 1)

(check-sat)

