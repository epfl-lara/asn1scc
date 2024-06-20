; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73908 () Bool)

(assert start!73908)

(declare-fun b!326705 () Bool)

(declare-fun toBit!81 () (_ BitVec 64))

(declare-datatypes ((tuple4!1414 0))(
  ( (tuple4!1415 (_1!13548 (_ BitVec 32)) (_2!13548 (_ BitVec 32)) (_3!1664 (_ BitVec 32)) (_4!707 (_ BitVec 32))) )
))
(declare-fun lt!448622 () tuple4!1414)

(declare-datatypes ((array!21271 0))(
  ( (array!21272 (arr!10323 (Array (_ BitVec 32) (_ BitVec 8))) (size!9231 (_ BitVec 32))) )
))
(declare-fun a2!688 () array!21271)

(declare-fun e!236027 () Bool)

(assert (=> b!326705 (= e!236027 (and (not (= ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!707 lt!448622) #b00000000000000000000000000000000) (bvsge (_4!707 lt!448622) (size!9231 a2!688)))))))

(declare-fun b!326706 () Bool)

(declare-fun e!236026 () Bool)

(assert (=> b!326706 (= e!236026 e!236027)))

(declare-fun res!268279 () Bool)

(assert (=> b!326706 (=> (not res!268279) (not e!236027))))

(declare-fun e!236024 () Bool)

(assert (=> b!326706 (= res!268279 e!236024)))

(declare-fun res!268277 () Bool)

(assert (=> b!326706 (=> res!268277 e!236024)))

(assert (=> b!326706 (= res!268277 (bvsge (_1!13548 lt!448622) (_2!13548 lt!448622)))))

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1414)

(assert (=> b!326706 (= lt!448622 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326707 () Bool)

(declare-fun res!268280 () Bool)

(assert (=> b!326707 (=> (not res!268280) (not e!236027))))

(assert (=> b!326707 (= res!268280 (not (= (_3!1664 lt!448622) (_4!707 lt!448622))))))

(declare-fun a1!688 () array!21271)

(declare-fun b!326708 () Bool)

(declare-fun arrayRangesEq!1855 (array!21271 array!21271 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326708 (= e!236024 (arrayRangesEq!1855 a1!688 a2!688 (_1!13548 lt!448622) (_2!13548 lt!448622)))))

(declare-fun res!268281 () Bool)

(assert (=> start!73908 (=> (not res!268281) (not e!236026))))

(assert (=> start!73908 (= res!268281 (and (bvsle (size!9231 a1!688) (size!9231 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9231 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73908 e!236026))

(declare-fun array_inv!8783 (array!21271) Bool)

(assert (=> start!73908 (array_inv!8783 a1!688)))

(assert (=> start!73908 (array_inv!8783 a2!688)))

(assert (=> start!73908 true))

(declare-fun b!326709 () Bool)

(declare-fun res!268278 () Bool)

(assert (=> b!326709 (=> (not res!268278) (not e!236027))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326709 (= res!268278 (byteRangesEq!0 (select (arr!10323 a1!688) (_3!1664 lt!448622)) (select (arr!10323 a2!688) (_3!1664 lt!448622)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (= (and start!73908 res!268281) b!326706))

(assert (= (and b!326706 (not res!268277)) b!326708))

(assert (= (and b!326706 res!268279) b!326707))

(assert (= (and b!326707 res!268280) b!326709))

(assert (= (and b!326709 res!268278) b!326705))

(declare-fun m!464531 () Bool)

(assert (=> b!326706 m!464531))

(declare-fun m!464533 () Bool)

(assert (=> b!326708 m!464533))

(declare-fun m!464535 () Bool)

(assert (=> start!73908 m!464535))

(declare-fun m!464537 () Bool)

(assert (=> start!73908 m!464537))

(declare-fun m!464539 () Bool)

(assert (=> b!326709 m!464539))

(declare-fun m!464541 () Bool)

(assert (=> b!326709 m!464541))

(assert (=> b!326709 m!464539))

(assert (=> b!326709 m!464541))

(declare-fun m!464543 () Bool)

(assert (=> b!326709 m!464543))

(push 1)

(assert (not b!326706))

(assert (not b!326709))

(assert (not start!73908))

(assert (not b!326708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

