; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73886 () Bool)

(assert start!73886)

(declare-fun b!326648 () Bool)

(declare-fun res!268223 () Bool)

(declare-fun e!235966 () Bool)

(assert (=> b!326648 (=> (not res!268223) (not e!235966))))

(declare-datatypes ((array!21263 0))(
  ( (array!21264 (arr!10320 (Array (_ BitVec 32) (_ BitVec 8))) (size!9228 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21263)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21263)

(declare-datatypes ((tuple4!1408 0))(
  ( (tuple4!1409 (_1!13545 (_ BitVec 32)) (_2!13545 (_ BitVec 32)) (_3!1661 (_ BitVec 32)) (_4!704 (_ BitVec 32))) )
))
(declare-fun lt!448613 () tuple4!1408)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326648 (= res!268223 (byteRangesEq!0 (select (arr!10320 a1!688) (_3!1661 lt!448613)) (select (arr!10320 a2!688) (_3!1661 lt!448613)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(declare-fun res!268222 () Bool)

(declare-fun e!235969 () Bool)

(assert (=> start!73886 (=> (not res!268222) (not e!235969))))

(declare-fun toBit!81 () (_ BitVec 64))

(assert (=> start!73886 (= res!268222 (and (bvsle (size!9228 a1!688) (size!9228 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9228 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73886 e!235969))

(declare-fun array_inv!8780 (array!21263) Bool)

(assert (=> start!73886 (array_inv!8780 a1!688)))

(assert (=> start!73886 (array_inv!8780 a2!688)))

(assert (=> start!73886 true))

(declare-fun b!326649 () Bool)

(declare-fun e!235968 () Bool)

(declare-fun arrayRangesEq!1852 (array!21263 array!21263 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326649 (= e!235968 (arrayRangesEq!1852 a1!688 a2!688 (_1!13545 lt!448613) (_2!13545 lt!448613)))))

(declare-fun b!326650 () Bool)

(assert (=> b!326650 (= e!235969 e!235966)))

(declare-fun res!268224 () Bool)

(assert (=> b!326650 (=> (not res!268224) (not e!235966))))

(assert (=> b!326650 (= res!268224 e!235968)))

(declare-fun res!268220 () Bool)

(assert (=> b!326650 (=> res!268220 e!235968)))

(assert (=> b!326650 (= res!268220 (bvsge (_1!13545 lt!448613) (_2!13545 lt!448613)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1408)

(assert (=> b!326650 (= lt!448613 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326651 () Bool)

(assert (=> b!326651 (= e!235966 (and (not (= ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!704 lt!448613) #b00000000000000000000000000000000) (bvsge (_4!704 lt!448613) (size!9228 a1!688)))))))

(declare-fun b!326652 () Bool)

(declare-fun res!268221 () Bool)

(assert (=> b!326652 (=> (not res!268221) (not e!235966))))

(assert (=> b!326652 (= res!268221 (not (= (_3!1661 lt!448613) (_4!704 lt!448613))))))

(assert (= (and start!73886 res!268222) b!326650))

(assert (= (and b!326650 (not res!268220)) b!326649))

(assert (= (and b!326650 res!268224) b!326652))

(assert (= (and b!326652 res!268221) b!326648))

(assert (= (and b!326648 res!268223) b!326651))

(declare-fun m!464469 () Bool)

(assert (=> b!326648 m!464469))

(declare-fun m!464471 () Bool)

(assert (=> b!326648 m!464471))

(assert (=> b!326648 m!464469))

(assert (=> b!326648 m!464471))

(declare-fun m!464473 () Bool)

(assert (=> b!326648 m!464473))

(declare-fun m!464475 () Bool)

(assert (=> start!73886 m!464475))

(declare-fun m!464477 () Bool)

(assert (=> start!73886 m!464477))

(declare-fun m!464479 () Bool)

(assert (=> b!326649 m!464479))

(declare-fun m!464481 () Bool)

(assert (=> b!326650 m!464481))

(push 1)

(assert (not b!326649))

(assert (not b!326650))

(assert (not start!73886))

(assert (not b!326648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

