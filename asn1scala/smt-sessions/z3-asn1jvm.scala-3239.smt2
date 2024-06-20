; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73812 () Bool)

(assert start!73812)

(declare-fun res!268061 () Bool)

(declare-fun e!235764 () Bool)

(assert (=> start!73812 (=> (not res!268061) (not e!235764))))

(declare-datatypes ((array!21234 0))(
  ( (array!21235 (arr!10310 (Array (_ BitVec 32) (_ BitVec 8))) (size!9218 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21234)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21234)

(assert (=> start!73812 (= res!268061 (and (bvsle (size!9218 a1!688) (size!9218 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9218 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73812 e!235764))

(declare-fun array_inv!8770 (array!21234) Bool)

(assert (=> start!73812 (array_inv!8770 a1!688)))

(assert (=> start!73812 (array_inv!8770 a2!688)))

(assert (=> start!73812 true))

(declare-fun b!326488 () Bool)

(declare-fun e!235763 () Bool)

(assert (=> b!326488 (= e!235764 e!235763)))

(declare-fun res!268062 () Bool)

(assert (=> b!326488 (=> (not res!268062) (not e!235763))))

(declare-fun e!235762 () Bool)

(assert (=> b!326488 (= res!268062 e!235762)))

(declare-fun res!268060 () Bool)

(assert (=> b!326488 (=> res!268060 e!235762)))

(declare-datatypes ((tuple4!1388 0))(
  ( (tuple4!1389 (_1!13535 (_ BitVec 32)) (_2!13535 (_ BitVec 32)) (_3!1651 (_ BitVec 32)) (_4!694 (_ BitVec 32))) )
))
(declare-fun lt!448583 () tuple4!1388)

(assert (=> b!326488 (= res!268060 (bvsge (_1!13535 lt!448583) (_2!13535 lt!448583)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1388)

(assert (=> b!326488 (= lt!448583 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326489 () Bool)

(declare-fun arrayRangesEq!1842 (array!21234 array!21234 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326489 (= e!235762 (arrayRangesEq!1842 a1!688 a2!688 (_1!13535 lt!448583) (_2!13535 lt!448583)))))

(declare-fun b!326490 () Bool)

(assert (=> b!326490 (= e!235763 (and (= (_3!1651 lt!448583) (_4!694 lt!448583)) (or (bvslt (_3!1651 lt!448583) #b00000000000000000000000000000000) (bvsge (_3!1651 lt!448583) (size!9218 a2!688)))))))

(assert (= (and start!73812 res!268061) b!326488))

(assert (= (and b!326488 (not res!268060)) b!326489))

(assert (= (and b!326488 res!268062) b!326490))

(declare-fun m!464323 () Bool)

(assert (=> start!73812 m!464323))

(declare-fun m!464325 () Bool)

(assert (=> start!73812 m!464325))

(declare-fun m!464327 () Bool)

(assert (=> b!326488 m!464327))

(declare-fun m!464329 () Bool)

(assert (=> b!326489 m!464329))

(check-sat (not b!326488) (not b!326489) (not start!73812))
(check-sat)
(get-model)

(declare-fun d!107656 () Bool)

(assert (=> d!107656 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1389 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326488 d!107656))

(declare-fun d!107658 () Bool)

(declare-fun res!268076 () Bool)

(declare-fun e!235786 () Bool)

(assert (=> d!107658 (=> res!268076 e!235786)))

(assert (=> d!107658 (= res!268076 (= (_1!13535 lt!448583) (_2!13535 lt!448583)))))

(assert (=> d!107658 (= (arrayRangesEq!1842 a1!688 a2!688 (_1!13535 lt!448583) (_2!13535 lt!448583)) e!235786)))

(declare-fun b!326504 () Bool)

(declare-fun e!235787 () Bool)

(assert (=> b!326504 (= e!235786 e!235787)))

(declare-fun res!268077 () Bool)

(assert (=> b!326504 (=> (not res!268077) (not e!235787))))

(assert (=> b!326504 (= res!268077 (= (select (arr!10310 a1!688) (_1!13535 lt!448583)) (select (arr!10310 a2!688) (_1!13535 lt!448583))))))

(declare-fun b!326505 () Bool)

(assert (=> b!326505 (= e!235787 (arrayRangesEq!1842 a1!688 a2!688 (bvadd (_1!13535 lt!448583) #b00000000000000000000000000000001) (_2!13535 lt!448583)))))

(assert (= (and d!107658 (not res!268076)) b!326504))

(assert (= (and b!326504 res!268077) b!326505))

(declare-fun m!464339 () Bool)

(assert (=> b!326504 m!464339))

(declare-fun m!464341 () Bool)

(assert (=> b!326504 m!464341))

(declare-fun m!464343 () Bool)

(assert (=> b!326505 m!464343))

(assert (=> b!326489 d!107658))

(declare-fun d!107660 () Bool)

(assert (=> d!107660 (= (array_inv!8770 a1!688) (bvsge (size!9218 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73812 d!107660))

(declare-fun d!107662 () Bool)

(assert (=> d!107662 (= (array_inv!8770 a2!688) (bvsge (size!9218 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73812 d!107662))

(check-sat (not b!326505))
(check-sat)
