; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66972 () Bool)

(assert start!66972)

(declare-fun b!299515 () Bool)

(declare-fun e!215030 () Bool)

(assert (=> b!299515 (= e!215030 false)))

(declare-datatypes ((Unit!20917 0))(
  ( (Unit!20918) )
))
(declare-fun lt!435328 () Unit!20917)

(declare-fun e!215032 () Unit!20917)

(assert (=> b!299515 (= lt!435328 e!215032)))

(declare-fun c!13761 () Bool)

(declare-datatypes ((tuple4!986 0))(
  ( (tuple4!987 (_1!13148 (_ BitVec 32)) (_2!13148 (_ BitVec 32)) (_3!1450 (_ BitVec 32)) (_4!493 (_ BitVec 32))) )
))
(declare-fun lt!435327 () tuple4!986)

(assert (=> b!299515 (= c!13761 (bvslt (_1!13148 lt!435327) (_2!13148 lt!435327)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!986)

(assert (=> b!299515 (= lt!435327 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435330 () tuple4!986)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!299515 (= lt!435330 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299516 () Bool)

(declare-fun res!247160 () Bool)

(assert (=> b!299516 (=> (not res!247160) (not e!215030))))

(declare-datatypes ((array!18172 0))(
  ( (array!18173 (arr!8972 (Array (_ BitVec 32) (_ BitVec 8))) (size!7889 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18172)

(declare-fun a2!948 () array!18172)

(declare-fun arrayBitRangesEq!0 (array!18172 array!18172 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299516 (= res!247160 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299517 () Bool)

(declare-fun res!247158 () Bool)

(assert (=> b!299517 (=> (not res!247158) (not e!215030))))

(declare-fun lt!435326 () (_ BitVec 64))

(assert (=> b!299517 (= res!247158 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435326) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247159 () Bool)

(declare-fun e!215031 () Bool)

(assert (=> start!66972 (=> (not res!247159) (not e!215031))))

(assert (=> start!66972 (= res!247159 (and (bvsle (size!7889 a1!948) (size!7889 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66972 e!215031))

(assert (=> start!66972 true))

(declare-fun array_inv!7501 (array!18172) Bool)

(assert (=> start!66972 (array_inv!7501 a1!948)))

(assert (=> start!66972 (array_inv!7501 a2!948)))

(declare-fun b!299518 () Bool)

(assert (=> b!299518 (= e!215031 e!215030)))

(declare-fun res!247157 () Bool)

(assert (=> b!299518 (=> (not res!247157) (not e!215030))))

(assert (=> b!299518 (= res!247157 (and (bvsle toBit!258 lt!435326) (bvsle fromBit!258 lt!435326)))))

(assert (=> b!299518 (= lt!435326 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7889 a1!948))))))

(declare-fun b!299519 () Bool)

(declare-fun Unit!20919 () Unit!20917)

(assert (=> b!299519 (= e!215032 Unit!20919)))

(declare-fun b!299520 () Bool)

(declare-fun lt!435329 () Unit!20917)

(assert (=> b!299520 (= e!215032 lt!435329)))

(declare-fun arrayRangesEqSlicedLemma!161 (array!18172 array!18172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20917)

(assert (=> b!299520 (= lt!435329 (arrayRangesEqSlicedLemma!161 a1!948 a2!948 (_1!13148 lt!435330) (_2!13148 lt!435330) (_1!13148 lt!435327) (_2!13148 lt!435327)))))

(declare-fun arrayRangesEq!1551 (array!18172 array!18172 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299520 (arrayRangesEq!1551 a1!948 a2!948 (_1!13148 lt!435327) (_2!13148 lt!435327))))

(assert (= (and start!66972 res!247159) b!299518))

(assert (= (and b!299518 res!247157) b!299516))

(assert (= (and b!299516 res!247160) b!299517))

(assert (= (and b!299517 res!247158) b!299515))

(assert (= (and b!299515 c!13761) b!299520))

(assert (= (and b!299515 (not c!13761)) b!299519))

(declare-fun m!438663 () Bool)

(assert (=> b!299515 m!438663))

(declare-fun m!438665 () Bool)

(assert (=> b!299515 m!438665))

(declare-fun m!438667 () Bool)

(assert (=> b!299516 m!438667))

(declare-fun m!438669 () Bool)

(assert (=> start!66972 m!438669))

(declare-fun m!438671 () Bool)

(assert (=> start!66972 m!438671))

(declare-fun m!438673 () Bool)

(assert (=> b!299520 m!438673))

(declare-fun m!438675 () Bool)

(assert (=> b!299520 m!438675))

(check-sat (not b!299520) (not b!299515) (not start!66972) (not b!299516))
