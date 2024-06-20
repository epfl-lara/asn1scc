; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73746 () Bool)

(assert start!73746)

(declare-fun res!267943 () Bool)

(declare-fun e!235523 () Bool)

(assert (=> start!73746 (=> (not res!267943) (not e!235523))))

(declare-datatypes ((array!21183 0))(
  ( (array!21184 (arr!10286 (Array (_ BitVec 32) (_ BitVec 8))) (size!9194 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21183)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21183)

(assert (=> start!73746 (= res!267943 (and (bvsle (size!9194 a1!688) (size!9194 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9194 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73746 e!235523))

(declare-fun array_inv!8746 (array!21183) Bool)

(assert (=> start!73746 (array_inv!8746 a1!688)))

(assert (=> start!73746 (array_inv!8746 a2!688)))

(assert (=> start!73746 true))

(declare-fun b!326371 () Bool)

(declare-fun e!235520 () Bool)

(assert (=> b!326371 (= e!235523 e!235520)))

(declare-fun res!267945 () Bool)

(assert (=> b!326371 (=> (not res!267945) (not e!235520))))

(declare-fun e!235521 () Bool)

(assert (=> b!326371 (= res!267945 e!235521)))

(declare-fun res!267944 () Bool)

(assert (=> b!326371 (=> res!267944 e!235521)))

(declare-datatypes ((tuple4!1370 0))(
  ( (tuple4!1371 (_1!13526 (_ BitVec 32)) (_2!13526 (_ BitVec 32)) (_3!1642 (_ BitVec 32)) (_4!685 (_ BitVec 32))) )
))
(declare-fun lt!448544 () tuple4!1370)

(assert (=> b!326371 (= res!267944 (bvsge (_1!13526 lt!448544) (_2!13526 lt!448544)))))

(declare-fun lt!448543 () (_ BitVec 32))

(assert (=> b!326371 (= lt!448543 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1370)

(assert (=> b!326371 (= lt!448544 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326372 () Bool)

(declare-fun arrayRangesEq!1833 (array!21183 array!21183 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326372 (= e!235521 (arrayRangesEq!1833 a1!688 a2!688 (_1!13526 lt!448544) (_2!13526 lt!448544)))))

(declare-fun b!326373 () Bool)

(assert (=> b!326373 (= e!235520 (and (not (= (_3!1642 lt!448544) (_4!685 lt!448544))) (or (bvsgt #b00000000000000000000000000000000 lt!448543) (bvsgt lt!448543 #b00000000000000000000000000001000))))))

(assert (= (and start!73746 res!267943) b!326371))

(assert (= (and b!326371 (not res!267944)) b!326372))

(assert (= (and b!326371 res!267945) b!326373))

(declare-fun m!464155 () Bool)

(assert (=> start!73746 m!464155))

(declare-fun m!464157 () Bool)

(assert (=> start!73746 m!464157))

(declare-fun m!464159 () Bool)

(assert (=> b!326371 m!464159))

(declare-fun m!464161 () Bool)

(assert (=> b!326372 m!464161))

(check-sat (not b!326372) (not start!73746) (not b!326371))
(check-sat)
