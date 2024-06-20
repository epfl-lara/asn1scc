; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73862 () Bool)

(assert start!73862)

(declare-fun res!268160 () Bool)

(declare-fun e!235903 () Bool)

(assert (=> start!73862 (=> (not res!268160) (not e!235903))))

(declare-datatypes ((array!21254 0))(
  ( (array!21255 (arr!10317 (Array (_ BitVec 32) (_ BitVec 8))) (size!9225 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21254)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21254)

(declare-fun toBit!81 () (_ BitVec 64))

(assert (=> start!73862 (= res!268160 (and (bvsle (size!9225 a1!688) (size!9225 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9225 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73862 e!235903))

(declare-fun array_inv!8777 (array!21254) Bool)

(assert (=> start!73862 (array_inv!8777 a1!688)))

(assert (=> start!73862 (array_inv!8777 a2!688)))

(assert (=> start!73862 true))

(declare-fun b!326587 () Bool)

(declare-fun e!235906 () Bool)

(assert (=> b!326587 (= e!235903 e!235906)))

(declare-fun res!268161 () Bool)

(assert (=> b!326587 (=> (not res!268161) (not e!235906))))

(declare-fun e!235904 () Bool)

(assert (=> b!326587 (= res!268161 e!235904)))

(declare-fun res!268159 () Bool)

(assert (=> b!326587 (=> res!268159 e!235904)))

(declare-datatypes ((tuple4!1402 0))(
  ( (tuple4!1403 (_1!13542 (_ BitVec 32)) (_2!13542 (_ BitVec 32)) (_3!1658 (_ BitVec 32)) (_4!701 (_ BitVec 32))) )
))
(declare-fun lt!448604 () tuple4!1402)

(assert (=> b!326587 (= res!268159 (bvsge (_1!13542 lt!448604) (_2!13542 lt!448604)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1402)

(assert (=> b!326587 (= lt!448604 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326588 () Bool)

(declare-fun arrayRangesEq!1849 (array!21254 array!21254 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326588 (= e!235904 (arrayRangesEq!1849 a1!688 a2!688 (_1!13542 lt!448604) (_2!13542 lt!448604)))))

(declare-fun b!326589 () Bool)

(assert (=> b!326589 (= e!235906 (and (not (= (_3!1658 lt!448604) (_4!701 lt!448604))) (or (bvslt (_3!1658 lt!448604) #b00000000000000000000000000000000) (bvsge (_3!1658 lt!448604) (size!9225 a2!688)))))))

(assert (= (and start!73862 res!268160) b!326587))

(assert (= (and b!326587 (not res!268159)) b!326588))

(assert (= (and b!326587 res!268161) b!326589))

(declare-fun m!464415 () Bool)

(assert (=> start!73862 m!464415))

(declare-fun m!464417 () Bool)

(assert (=> start!73862 m!464417))

(declare-fun m!464419 () Bool)

(assert (=> b!326587 m!464419))

(declare-fun m!464421 () Bool)

(assert (=> b!326588 m!464421))

(push 1)

(assert (not start!73862))

(assert (not b!326587))

(assert (not b!326588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107724 () Bool)

(assert (=> d!107724 (= (array_inv!8777 a1!688) (bvsge (size!9225 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73862 d!107724))

(declare-fun d!107726 () Bool)

(assert (=> d!107726 (= (array_inv!8777 a2!688) (bvsge (size!9225 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73862 d!107726))

(declare-fun d!107728 () Bool)

(assert (=> d!107728 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1403 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326587 d!107728))

(declare-fun d!107730 () Bool)

(declare-fun res!268178 () Bool)

(declare-fun e!235924 () Bool)

(assert (=> d!107730 (=> res!268178 e!235924)))

(assert (=> d!107730 (= res!268178 (= (_1!13542 lt!448604) (_2!13542 lt!448604)))))

(assert (=> d!107730 (= (arrayRangesEq!1849 a1!688 a2!688 (_1!13542 lt!448604) (_2!13542 lt!448604)) e!235924)))

(declare-fun b!326606 () Bool)

(declare-fun e!235925 () Bool)

(assert (=> b!326606 (= e!235924 e!235925)))

(declare-fun res!268179 () Bool)

(assert (=> b!326606 (=> (not res!268179) (not e!235925))))

(assert (=> b!326606 (= res!268179 (= (select (arr!10317 a1!688) (_1!13542 lt!448604)) (select (arr!10317 a2!688) (_1!13542 lt!448604))))))

(declare-fun b!326607 () Bool)

(assert (=> b!326607 (= e!235925 (arrayRangesEq!1849 a1!688 a2!688 (bvadd (_1!13542 lt!448604) #b00000000000000000000000000000001) (_2!13542 lt!448604)))))

(assert (= (and d!107730 (not res!268178)) b!326606))

(assert (= (and b!326606 res!268179) b!326607))

(declare-fun m!464435 () Bool)

(assert (=> b!326606 m!464435))

(declare-fun m!464437 () Bool)

(assert (=> b!326606 m!464437))

(declare-fun m!464439 () Bool)

(assert (=> b!326607 m!464439))

(assert (=> b!326588 d!107730))

(push 1)

(assert (not b!326607))

(check-sat)

