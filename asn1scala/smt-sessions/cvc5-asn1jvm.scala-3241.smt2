; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73858 () Bool)

(assert start!73858)

(declare-fun res!268143 () Bool)

(declare-fun e!235874 () Bool)

(assert (=> start!73858 (=> (not res!268143) (not e!235874))))

(declare-datatypes ((array!21250 0))(
  ( (array!21251 (arr!10315 (Array (_ BitVec 32) (_ BitVec 8))) (size!9223 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21250)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21250)

(assert (=> start!73858 (= res!268143 (and (bvsle (size!9223 a1!688) (size!9223 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9223 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73858 e!235874))

(declare-fun array_inv!8775 (array!21250) Bool)

(assert (=> start!73858 (array_inv!8775 a1!688)))

(assert (=> start!73858 (array_inv!8775 a2!688)))

(assert (=> start!73858 true))

(declare-fun b!326569 () Bool)

(declare-fun e!235876 () Bool)

(assert (=> b!326569 (= e!235874 e!235876)))

(declare-fun res!268141 () Bool)

(assert (=> b!326569 (=> (not res!268141) (not e!235876))))

(declare-fun e!235873 () Bool)

(assert (=> b!326569 (= res!268141 e!235873)))

(declare-fun res!268142 () Bool)

(assert (=> b!326569 (=> res!268142 e!235873)))

(declare-datatypes ((tuple4!1398 0))(
  ( (tuple4!1399 (_1!13540 (_ BitVec 32)) (_2!13540 (_ BitVec 32)) (_3!1656 (_ BitVec 32)) (_4!699 (_ BitVec 32))) )
))
(declare-fun lt!448598 () tuple4!1398)

(assert (=> b!326569 (= res!268142 (bvsge (_1!13540 lt!448598) (_2!13540 lt!448598)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1398)

(assert (=> b!326569 (= lt!448598 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326570 () Bool)

(declare-fun arrayRangesEq!1847 (array!21250 array!21250 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326570 (= e!235873 (arrayRangesEq!1847 a1!688 a2!688 (_1!13540 lt!448598) (_2!13540 lt!448598)))))

(declare-fun b!326571 () Bool)

(assert (=> b!326571 (= e!235876 (and (not (= (_3!1656 lt!448598) (_4!699 lt!448598))) (or (bvslt (_3!1656 lt!448598) #b00000000000000000000000000000000) (bvsge (_3!1656 lt!448598) (size!9223 a2!688)))))))

(assert (= (and start!73858 res!268143) b!326569))

(assert (= (and b!326569 (not res!268142)) b!326570))

(assert (= (and b!326569 res!268141) b!326571))

(declare-fun m!464399 () Bool)

(assert (=> start!73858 m!464399))

(declare-fun m!464401 () Bool)

(assert (=> start!73858 m!464401))

(declare-fun m!464403 () Bool)

(assert (=> b!326569 m!464403))

(declare-fun m!464405 () Bool)

(assert (=> b!326570 m!464405))

(push 1)

(assert (not b!326570))

(assert (not start!73858))

(assert (not b!326569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107716 () Bool)

(declare-fun res!268172 () Bool)

(declare-fun e!235918 () Bool)

(assert (=> d!107716 (=> res!268172 e!235918)))

(assert (=> d!107716 (= res!268172 (= (_1!13540 lt!448598) (_2!13540 lt!448598)))))

(assert (=> d!107716 (= (arrayRangesEq!1847 a1!688 a2!688 (_1!13540 lt!448598) (_2!13540 lt!448598)) e!235918)))

(declare-fun b!326600 () Bool)

(declare-fun e!235919 () Bool)

(assert (=> b!326600 (= e!235918 e!235919)))

(declare-fun res!268173 () Bool)

(assert (=> b!326600 (=> (not res!268173) (not e!235919))))

(assert (=> b!326600 (= res!268173 (= (select (arr!10315 a1!688) (_1!13540 lt!448598)) (select (arr!10315 a2!688) (_1!13540 lt!448598))))))

(declare-fun b!326601 () Bool)

(assert (=> b!326601 (= e!235919 (arrayRangesEq!1847 a1!688 a2!688 (bvadd (_1!13540 lt!448598) #b00000000000000000000000000000001) (_2!13540 lt!448598)))))

(assert (= (and d!107716 (not res!268172)) b!326600))

(assert (= (and b!326600 res!268173) b!326601))

(declare-fun m!464429 () Bool)

(assert (=> b!326600 m!464429))

(declare-fun m!464431 () Bool)

(assert (=> b!326600 m!464431))

(declare-fun m!464433 () Bool)

(assert (=> b!326601 m!464433))

(assert (=> b!326570 d!107716))

(declare-fun d!107718 () Bool)

(assert (=> d!107718 (= (array_inv!8775 a1!688) (bvsge (size!9223 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73858 d!107718))

(declare-fun d!107720 () Bool)

(assert (=> d!107720 (= (array_inv!8775 a2!688) (bvsge (size!9223 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73858 d!107720))

(declare-fun d!107722 () Bool)

(assert (=> d!107722 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1399 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326569 d!107722))

(push 1)

(assert (not b!326601))

(check-sat)

