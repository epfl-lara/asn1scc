; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73882 () Bool)

(assert start!73882)

(declare-fun res!268194 () Bool)

(declare-fun e!235937 () Bool)

(assert (=> start!73882 (=> (not res!268194) (not e!235937))))

(declare-datatypes ((array!21259 0))(
  ( (array!21260 (arr!10318 (Array (_ BitVec 32) (_ BitVec 8))) (size!9226 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21259)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21259)

(assert (=> start!73882 (= res!268194 (and (bvsle (size!9226 a1!688) (size!9226 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9226 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73882 e!235937))

(declare-fun array_inv!8778 (array!21259) Bool)

(assert (=> start!73882 (array_inv!8778 a1!688)))

(assert (=> start!73882 (array_inv!8778 a2!688)))

(assert (=> start!73882 true))

(declare-datatypes ((tuple4!1404 0))(
  ( (tuple4!1405 (_1!13543 (_ BitVec 32)) (_2!13543 (_ BitVec 32)) (_3!1659 (_ BitVec 32)) (_4!702 (_ BitVec 32))) )
))
(declare-fun lt!448607 () tuple4!1404)

(declare-fun e!235936 () Bool)

(declare-fun b!326618 () Bool)

(declare-fun arrayRangesEq!1850 (array!21259 array!21259 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326618 (= e!235936 (arrayRangesEq!1850 a1!688 a2!688 (_1!13543 lt!448607) (_2!13543 lt!448607)))))

(declare-fun b!326619 () Bool)

(declare-fun res!268191 () Bool)

(declare-fun e!235939 () Bool)

(assert (=> b!326619 (=> (not res!268191) (not e!235939))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326619 (= res!268191 (byteRangesEq!0 (select (arr!10318 a1!688) (_3!1659 lt!448607)) (select (arr!10318 a2!688) (_3!1659 lt!448607)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(declare-fun b!326620 () Bool)

(assert (=> b!326620 (= e!235937 e!235939)))

(declare-fun res!268190 () Bool)

(assert (=> b!326620 (=> (not res!268190) (not e!235939))))

(assert (=> b!326620 (= res!268190 e!235936)))

(declare-fun res!268193 () Bool)

(assert (=> b!326620 (=> res!268193 e!235936)))

(assert (=> b!326620 (= res!268193 (bvsge (_1!13543 lt!448607) (_2!13543 lt!448607)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1404)

(assert (=> b!326620 (= lt!448607 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326621 () Bool)

(declare-fun res!268192 () Bool)

(assert (=> b!326621 (=> (not res!268192) (not e!235939))))

(assert (=> b!326621 (= res!268192 (not (= (_3!1659 lt!448607) (_4!702 lt!448607))))))

(declare-fun b!326622 () Bool)

(assert (=> b!326622 (= e!235939 (and (not (= ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!702 lt!448607) #b00000000000000000000000000000000) (bvsge (_4!702 lt!448607) (size!9226 a1!688)))))))

(assert (= (and start!73882 res!268194) b!326620))

(assert (= (and b!326620 (not res!268193)) b!326618))

(assert (= (and b!326620 res!268190) b!326621))

(assert (= (and b!326621 res!268192) b!326619))

(assert (= (and b!326619 res!268191) b!326622))

(declare-fun m!464441 () Bool)

(assert (=> start!73882 m!464441))

(declare-fun m!464443 () Bool)

(assert (=> start!73882 m!464443))

(declare-fun m!464445 () Bool)

(assert (=> b!326618 m!464445))

(declare-fun m!464447 () Bool)

(assert (=> b!326619 m!464447))

(declare-fun m!464449 () Bool)

(assert (=> b!326619 m!464449))

(assert (=> b!326619 m!464447))

(assert (=> b!326619 m!464449))

(declare-fun m!464451 () Bool)

(assert (=> b!326619 m!464451))

(declare-fun m!464453 () Bool)

(assert (=> b!326620 m!464453))

(push 1)

(assert (not start!73882))

(assert (not b!326618))

(assert (not b!326619))

(assert (not b!326620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107744 () Bool)

(assert (=> d!107744 (= (array_inv!8778 a1!688) (bvsge (size!9226 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73882 d!107744))

(declare-fun d!107746 () Bool)

