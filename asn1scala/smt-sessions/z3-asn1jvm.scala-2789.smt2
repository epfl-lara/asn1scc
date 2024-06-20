; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67304 () Bool)

(assert start!67304)

(declare-fun res!248697 () Bool)

(declare-fun e!217138 () Bool)

(assert (=> start!67304 (=> (not res!248697) (not e!217138))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18313 0))(
  ( (array!18314 (arr!9035 (Array (_ BitVec 32) (_ BitVec 8))) (size!7952 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18313)

(declare-fun a2!948 () array!18313)

(assert (=> start!67304 (= res!248697 (and (bvsle (size!7952 a1!948) (size!7952 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67304 e!217138))

(assert (=> start!67304 true))

(declare-fun array_inv!7564 (array!18313) Bool)

(assert (=> start!67304 (array_inv!7564 a1!948)))

(assert (=> start!67304 (array_inv!7564 a2!948)))

(declare-fun b!302213 () Bool)

(declare-fun e!217137 () Bool)

(assert (=> b!302213 (= e!217138 e!217137)))

(declare-fun res!248696 () Bool)

(assert (=> b!302213 (=> (not res!248696) (not e!217137))))

(declare-fun lt!437181 () (_ BitVec 64))

(assert (=> b!302213 (= res!248696 (and (bvsle toBit!258 lt!437181) (bvsle fromBit!258 lt!437181)))))

(assert (=> b!302213 (= lt!437181 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7952 a1!948))))))

(declare-fun b!302214 () Bool)

(declare-fun res!248695 () Bool)

(assert (=> b!302214 (=> (not res!248695) (not e!217137))))

(declare-fun arrayBitRangesEq!0 (array!18313 array!18313 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302214 (= res!248695 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302215 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302215 (= e!217137 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (not (= ((_ sign_extend 32) (size!7952 a1!948)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!437181 ((_ sign_extend 32) (size!7952 a1!948)))))))))

(assert (= (and start!67304 res!248697) b!302213))

(assert (= (and b!302213 res!248696) b!302214))

(assert (= (and b!302214 res!248695) b!302215))

(declare-fun m!441105 () Bool)

(assert (=> start!67304 m!441105))

(declare-fun m!441107 () Bool)

(assert (=> start!67304 m!441107))

(declare-fun m!441109 () Bool)

(assert (=> b!302214 m!441109))

(check-sat (not start!67304) (not b!302214))
(check-sat)
