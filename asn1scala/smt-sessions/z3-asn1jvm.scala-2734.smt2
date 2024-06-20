; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66696 () Bool)

(assert start!66696)

(declare-fun res!246152 () Bool)

(declare-fun e!213842 () Bool)

(assert (=> start!66696 (=> (not res!246152) (not e!213842))))

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17959 0))(
  ( (array!17960 (arr!8870 (Array (_ BitVec 32) (_ BitVec 8))) (size!7787 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17959)

(assert (=> start!66696 (= res!246152 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7787 a!429))))))))

(assert (=> start!66696 e!213842))

(assert (=> start!66696 true))

(declare-fun array_inv!7399 (array!17959) Bool)

(assert (=> start!66696 (array_inv!7399 a!429)))

(declare-fun b!298349 () Bool)

(declare-fun e!213843 () Bool)

(assert (=> b!298349 (= e!213842 e!213843)))

(declare-fun res!246151 () Bool)

(assert (=> b!298349 (=> (not res!246151) (not e!213843))))

(declare-fun lt!434451 () array!17959)

(declare-fun arrayBitRangesEq!0 (array!17959 array!17959 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298349 (= res!246151 (arrayBitRangesEq!0 a!429 lt!434451 at!281 at!281))))

(declare-fun b!315 () Bool)

(declare-fun lt!434449 () (_ BitVec 32))

(declare-fun lt!434448 () (_ BitVec 32))

(assert (=> b!298349 (= lt!434451 (array!17960 (store (arr!8870 a!429) lt!434448 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8870 a!429) lt!434448)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434449)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434449) #b00000000))))) (size!7787 a!429)))))

(assert (=> b!298349 (= lt!434449 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298349 (= lt!434448 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298350 () Bool)

(assert (=> b!298350 (= e!213843 (not true))))

(assert (=> b!298350 (arrayBitRangesEq!0 a!429 lt!434451 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20823 0))(
  ( (Unit!20824) )
))
(declare-fun lt!434450 () Unit!20823)

(declare-fun rec!19 (array!17959 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20823)

(assert (=> b!298350 (= lt!434450 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66696 res!246152) b!298349))

(assert (= (and b!298349 res!246151) b!298350))

(declare-fun m!437379 () Bool)

(assert (=> start!66696 m!437379))

(declare-fun m!437381 () Bool)

(assert (=> b!298349 m!437381))

(declare-fun m!437383 () Bool)

(assert (=> b!298349 m!437383))

(declare-fun m!437385 () Bool)

(assert (=> b!298349 m!437385))

(declare-fun m!437387 () Bool)

(assert (=> b!298349 m!437387))

(declare-fun m!437389 () Bool)

(assert (=> b!298350 m!437389))

(declare-fun m!437391 () Bool)

(assert (=> b!298350 m!437391))

(check-sat (not b!298350) (not start!66696) (not b!298349))
