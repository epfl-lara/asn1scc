; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73728 () Bool)

(assert start!73728)

(declare-fun res!267904 () Bool)

(declare-fun e!235465 () Bool)

(assert (=> start!73728 (=> (not res!267904) (not e!235465))))

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-datatypes ((array!21175 0))(
  ( (array!21176 (arr!10283 (Array (_ BitVec 32) (_ BitVec 8))) (size!9191 (_ BitVec 32))) )
))
(declare-fun a2!688 () array!21175)

(declare-fun a1!688 () array!21175)

(assert (=> start!73728 (= res!267904 (and (bvsle (size!9191 a1!688) (size!9191 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9191 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73728 e!235465))

(declare-fun array_inv!8743 (array!21175) Bool)

(assert (=> start!73728 (array_inv!8743 a1!688)))

(assert (=> start!73728 (array_inv!8743 a2!688)))

(assert (=> start!73728 true))

(declare-fun b!326332 () Bool)

(declare-fun e!235462 () Bool)

(assert (=> b!326332 (= e!235465 e!235462)))

(declare-fun res!267905 () Bool)

(assert (=> b!326332 (=> (not res!267905) (not e!235462))))

(declare-fun e!235464 () Bool)

(assert (=> b!326332 (= res!267905 e!235464)))

(declare-fun res!267906 () Bool)

(assert (=> b!326332 (=> res!267906 e!235464)))

(declare-datatypes ((tuple4!1364 0))(
  ( (tuple4!1365 (_1!13523 (_ BitVec 32)) (_2!13523 (_ BitVec 32)) (_3!1639 (_ BitVec 32)) (_4!682 (_ BitVec 32))) )
))
(declare-fun lt!448522 () tuple4!1364)

(assert (=> b!326332 (= res!267906 (bvsge (_1!13523 lt!448522) (_2!13523 lt!448522)))))

(declare-fun lt!448523 () (_ BitVec 32))

(assert (=> b!326332 (= lt!448523 ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!448521 () (_ BitVec 32))

(assert (=> b!326332 (= lt!448521 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1364)

(assert (=> b!326332 (= lt!448522 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326333 () Bool)

(declare-fun arrayRangesEq!1830 (array!21175 array!21175 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326333 (= e!235464 (arrayRangesEq!1830 a1!688 a2!688 (_1!13523 lt!448522) (_2!13523 lt!448522)))))

(declare-fun b!326334 () Bool)

(assert (=> b!326334 (= e!235462 (and (= (_3!1639 lt!448522) (_4!682 lt!448522)) (or (bvsgt #b00000000000000000000000000000000 lt!448521) (bvsgt lt!448521 lt!448523) (bvsgt lt!448523 #b00000000000000000000000000001000))))))

(assert (= (and start!73728 res!267904) b!326332))

(assert (= (and b!326332 (not res!267906)) b!326333))

(assert (= (and b!326332 res!267905) b!326334))

(declare-fun m!464119 () Bool)

(assert (=> start!73728 m!464119))

(declare-fun m!464121 () Bool)

(assert (=> start!73728 m!464121))

(declare-fun m!464123 () Bool)

(assert (=> b!326332 m!464123))

(declare-fun m!464125 () Bool)

(assert (=> b!326333 m!464125))

(check-sat (not start!73728) (not b!326332) (not b!326333))
(check-sat)
(get-model)

(declare-fun d!107598 () Bool)

(assert (=> d!107598 (= (array_inv!8743 a1!688) (bvsge (size!9191 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73728 d!107598))

(declare-fun d!107600 () Bool)

(assert (=> d!107600 (= (array_inv!8743 a2!688) (bvsge (size!9191 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73728 d!107600))

(declare-fun d!107602 () Bool)

(assert (=> d!107602 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1365 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326332 d!107602))

(declare-fun d!107604 () Bool)

(declare-fun res!267920 () Bool)

(declare-fun e!235486 () Bool)

(assert (=> d!107604 (=> res!267920 e!235486)))

(assert (=> d!107604 (= res!267920 (= (_1!13523 lt!448522) (_2!13523 lt!448522)))))

(assert (=> d!107604 (= (arrayRangesEq!1830 a1!688 a2!688 (_1!13523 lt!448522) (_2!13523 lt!448522)) e!235486)))

(declare-fun b!326348 () Bool)

(declare-fun e!235487 () Bool)

(assert (=> b!326348 (= e!235486 e!235487)))

(declare-fun res!267921 () Bool)

(assert (=> b!326348 (=> (not res!267921) (not e!235487))))

(assert (=> b!326348 (= res!267921 (= (select (arr!10283 a1!688) (_1!13523 lt!448522)) (select (arr!10283 a2!688) (_1!13523 lt!448522))))))

(declare-fun b!326349 () Bool)

(assert (=> b!326349 (= e!235487 (arrayRangesEq!1830 a1!688 a2!688 (bvadd (_1!13523 lt!448522) #b00000000000000000000000000000001) (_2!13523 lt!448522)))))

(assert (= (and d!107604 (not res!267920)) b!326348))

(assert (= (and b!326348 res!267921) b!326349))

(declare-fun m!464135 () Bool)

(assert (=> b!326348 m!464135))

(declare-fun m!464137 () Bool)

(assert (=> b!326348 m!464137))

(declare-fun m!464139 () Bool)

(assert (=> b!326349 m!464139))

(assert (=> b!326333 d!107604))

(check-sat (not b!326349))
(check-sat)
