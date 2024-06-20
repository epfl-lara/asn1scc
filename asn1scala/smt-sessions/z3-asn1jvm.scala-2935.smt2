; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69774 () Bool)

(assert start!69774)

(declare-fun res!257353 () Bool)

(declare-fun e!226145 () Bool)

(assert (=> start!69774 (=> (not res!257353) (not e!226145))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19338 0))(
  ( (array!19339 (arr!9473 (Array (_ BitVec 32) (_ BitVec 8))) (size!8393 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19338)

(declare-fun a3!79 () array!19338)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19338)

(assert (=> start!69774 (= res!257353 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8393 a1!825) (size!8393 a2!825)) (= (size!8393 a2!825) (size!8393 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8393 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8393 a2!825))))))))

(assert (=> start!69774 e!226145))

(assert (=> start!69774 true))

(declare-fun array_inv!7945 (array!19338) Bool)

(assert (=> start!69774 (array_inv!7945 a1!825)))

(assert (=> start!69774 (array_inv!7945 a3!79)))

(assert (=> start!69774 (array_inv!7945 a2!825)))

(declare-fun b!314207 () Bool)

(declare-fun res!257356 () Bool)

(assert (=> b!314207 (=> (not res!257356) (not e!226145))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!314207 (= res!257356 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314208 () Bool)

(declare-fun res!257357 () Bool)

(assert (=> b!314208 (=> (not res!257357) (not e!226145))))

(declare-fun arrayBitRangesEq!0 (array!19338 array!19338 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314208 (= res!257357 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314209 () Bool)

(declare-fun res!257359 () Bool)

(assert (=> b!314209 (=> (not res!257359) (not e!226145))))

(assert (=> b!314209 (= res!257359 (not (= i!1020 mid!82)))))

(declare-fun b!314210 () Bool)

(declare-fun res!257358 () Bool)

(assert (=> b!314210 (=> (not res!257358) (not e!226145))))

(assert (=> b!314210 (= res!257358 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314211 () Bool)

(declare-fun res!257355 () Bool)

(assert (=> b!314211 (=> (not res!257355) (not e!226145))))

(assert (=> b!314211 (= res!257355 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314212 () Bool)

(assert (=> b!314212 (= e!226145 (not true))))

(assert (=> b!314212 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21577 0))(
  ( (Unit!21578) )
))
(declare-fun lt!442388 () Unit!21577)

(declare-fun arrayBitRangesEqDrop1!0 (array!19338 array!19338 (_ BitVec 64) (_ BitVec 64)) Unit!21577)

(assert (=> b!314212 (= lt!442388 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314212 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442387 () Unit!21577)

(declare-fun arrayBitRangesEqAppend!0 (array!19338 array!19338 (_ BitVec 64) (_ BitVec 64)) Unit!21577)

(assert (=> b!314212 (= lt!442387 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314213 () Bool)

(declare-fun res!257354 () Bool)

(assert (=> b!314213 (=> (not res!257354) (not e!226145))))

(assert (=> b!314213 (= res!257354 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314214 () Bool)

(declare-fun res!257360 () Bool)

(assert (=> b!314214 (=> (not res!257360) (not e!226145))))

(assert (=> b!314214 (= res!257360 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(assert (= (and start!69774 res!257353) b!314213))

(assert (= (and b!314213 res!257354) b!314208))

(assert (= (and b!314208 res!257357) b!314207))

(assert (= (and b!314207 res!257356) b!314211))

(assert (= (and b!314211 res!257355) b!314214))

(assert (= (and b!314214 res!257360) b!314210))

(assert (= (and b!314210 res!257358) b!314209))

(assert (= (and b!314209 res!257359) b!314212))

(declare-fun m!451757 () Bool)

(assert (=> b!314212 m!451757))

(declare-fun m!451759 () Bool)

(assert (=> b!314212 m!451759))

(declare-fun m!451761 () Bool)

(assert (=> b!314212 m!451761))

(declare-fun m!451763 () Bool)

(assert (=> b!314212 m!451763))

(declare-fun m!451765 () Bool)

(assert (=> b!314211 m!451765))

(declare-fun m!451767 () Bool)

(assert (=> b!314213 m!451767))

(declare-fun m!451769 () Bool)

(assert (=> start!69774 m!451769))

(declare-fun m!451771 () Bool)

(assert (=> start!69774 m!451771))

(declare-fun m!451773 () Bool)

(assert (=> start!69774 m!451773))

(declare-fun m!451775 () Bool)

(assert (=> b!314214 m!451775))

(declare-fun m!451777 () Bool)

(assert (=> b!314208 m!451777))

(declare-fun m!451779 () Bool)

(assert (=> b!314210 m!451779))

(check-sat (not b!314211) (not b!314210) (not b!314212) (not b!314214) (not b!314213) (not b!314208) (not start!69774))
