; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61868 () Bool)

(assert start!61868)

(declare-fun res!230292 () Bool)

(declare-fun e!197244 () Bool)

(assert (=> start!61868 (=> (not res!230292) (not e!197244))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15914 0))(
  ( (array!15915 (arr!7881 (Array (_ BitVec 32) (_ BitVec 8))) (size!6885 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15914)

(declare-fun a2!699 () array!15914)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!61868 (= res!230292 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6885 a1!699) (size!6885 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6885 a1!699))))))))

(assert (=> start!61868 e!197244))

(assert (=> start!61868 true))

(declare-fun array_inv!6609 (array!15914) Bool)

(assert (=> start!61868 (array_inv!6609 a1!699)))

(assert (=> start!61868 (array_inv!6609 a2!699)))

(declare-fun b!277282 () Bool)

(declare-fun res!230293 () Bool)

(assert (=> b!277282 (=> (not res!230293) (not e!197244))))

(declare-fun arrayBitRangesEq!0 (array!15914 array!15914 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277282 (= res!230293 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277283 () Bool)

(declare-fun res!230291 () Bool)

(assert (=> b!277283 (=> (not res!230291) (not e!197244))))

(assert (=> b!277283 (= res!230291 (bvslt from!822 to!789))))

(declare-fun b!277284 () Bool)

(declare-datatypes ((tuple4!556 0))(
  ( (tuple4!557 (_1!12353 (_ BitVec 32)) (_2!12353 (_ BitVec 32)) (_3!1058 (_ BitVec 32)) (_4!278 (_ BitVec 32))) )
))
(declare-fun lt!415365 () tuple4!556)

(assert (=> b!277284 (= e!197244 (and (bvslt (_1!12353 lt!415365) (_2!12353 lt!415365)) (bvsle #b00000000000000000000000000000000 (_1!12353 lt!415365)) (bvsle (_1!12353 lt!415365) (_2!12353 lt!415365)) (bvsgt (_2!12353 lt!415365) (size!6885 a1!699))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!556)

(assert (=> b!277284 (= lt!415365 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!61868 res!230292) b!277282))

(assert (= (and b!277282 res!230293) b!277283))

(assert (= (and b!277283 res!230291) b!277284))

(declare-fun m!410469 () Bool)

(assert (=> start!61868 m!410469))

(declare-fun m!410471 () Bool)

(assert (=> start!61868 m!410471))

(declare-fun m!410473 () Bool)

(assert (=> b!277282 m!410473))

(declare-fun m!410475 () Bool)

(assert (=> b!277284 m!410475))

(push 1)

(assert (not start!61868))

(assert (not b!277282))

(assert (not b!277284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95696 () Bool)

(assert (=> d!95696 (= (array_inv!6609 a1!699) (bvsge (size!6885 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61868 d!95696))

(declare-fun d!95698 () Bool)

(assert (=> d!95698 (= (array_inv!6609 a2!699) (bvsge (size!6885 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61868 d!95698))

(declare-fun b!277326 () Bool)

(declare-fun res!230329 () Bool)

(declare-fun lt!415389 () (_ BitVec 32))

(assert (=> b!277326 (= res!230329 (= lt!415389 #b00000000000000000000000000000000))))

(declare-fun e!197284 () Bool)

(assert (=> b!277326 (=> res!230329 e!197284)))

(declare-fun e!197286 () Bool)

(assert (=> b!277326 (= e!197286 e!197284)))

(declare-fun b!277327 () Bool)

(declare-fun e!197285 () Bool)

(assert (=> b!277327 (= e!197285 e!197286)))

(declare-fun res!230326 () Bool)

(declare-fun call!4487 () Bool)

(assert (=> b!277327 (= res!230326 call!4487)))

(assert (=> b!277327 (=> (not res!230326) (not e!197286))))

(declare-fun b!277328 () Bool)

(declare-fun e!197288 () Bool)

(declare-fun e!197283 () Bool)

(assert (=> b!277328 (= e!197288 e!197283)))

(declare-fun res!230328 () Bool)

(assert (=> b!277328 (=> (not res!230328) (not e!197283))))

(declare-fun e!197287 () Bool)

(assert (=> b!277328 (= res!230328 e!197287)))

(declare-fun res!230325 () Bool)

(assert (=> b!277328 (=> res!230325 e!197287)))

(declare-fun lt!415387 () tuple4!556)

(assert (=> b!277328 (= res!230325 (bvsge (_1!12353 lt!415387) (_2!12353 lt!415387)))))

(assert (=> b!277328 (= lt!415389 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415388 () (_ BitVec 32))

(assert (=> b!277328 (= lt!415388 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277328 (= lt!415387 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277329 () Bool)

(declare-fun arrayRangesEq!1170 (array!15914 array!15914 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277329 (= e!197287 (arrayRangesEq!1170 a1!699 a2!699 (_1!12353 lt!415387) (_2!12353 lt!415387)))))

(declare-fun b!277330 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277330 (= e!197284 (byteRangesEq!0 (select (arr!7881 a1!699) (_4!278 lt!415387)) (select (arr!7881 a2!699) (_4!278 lt!415387)) #b00000000000000000000000000000000 lt!415389))))

(declare-fun b!277331 () Bool)

(assert (=> b!277331 (= e!197285 call!4487)))

(declare-fun c!12672 () Bool)

(declare-fun bm!4484 () Bool)

(assert (=> bm!4484 (= call!4487 (byteRangesEq!0 (select (arr!7881 a1!699) (_3!1058 lt!415387)) (select (arr!7881 a2!699) (_3!1058 lt!415387)) lt!415388 (ite c!12672 lt!415389 #b00000000000000000000000000001000)))))

(declare-fun b!277332 () Bool)

(assert (=> b!277332 (= e!197283 e!197285)))

(assert (=> b!277332 (= c!12672 (= (_3!1058 lt!415387) (_4!278 lt!415387)))))

(declare-fun d!95700 () Bool)

(declare-fun res!230327 () Bool)

(assert (=> d!95700 (=> res!230327 e!197288)))

(assert (=> d!95700 (= res!230327 (bvsge from!822 to!789))))

(assert (=> d!95700 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197288)))

(assert (= (and d!95700 (not res!230327)) b!277328))

(assert (= (and b!277328 (not res!230325)) b!277329))

(assert (= (and b!277328 res!230328) b!277332))

(assert (= (and b!277332 c!12672) b!277331))

(assert (= (and b!277332 (not c!12672)) b!277327))

(assert (= (and b!277327 res!230326) b!277326))

(assert (= (and b!277326 (not res!230329)) b!277330))

(assert (= (or b!277331 b!277327) bm!4484))

(assert (=> b!277328 m!410475))

(declare-fun m!410491 () Bool)

(assert (=> b!277329 m!410491))

(declare-fun m!410493 () Bool)

(assert (=> b!277330 m!410493))

(declare-fun m!410495 () Bool)

(assert (=> b!277330 m!410495))

(assert (=> b!277330 m!410493))

(assert (=> b!277330 m!410495))

(declare-fun m!410497 () Bool)

(assert (=> b!277330 m!410497))

(declare-fun m!410499 () Bool)

(assert (=> bm!4484 m!410499))

(declare-fun m!410501 () Bool)

(assert (=> bm!4484 m!410501))

(assert (=> bm!4484 m!410499))

(assert (=> bm!4484 m!410501))

(declare-fun m!410503 () Bool)

(assert (=> bm!4484 m!410503))

(assert (=> b!277282 d!95700))

(declare-fun d!95704 () Bool)

(assert (=> d!95704 (= (arrayBitIndices!0 from!822 to!789) (tuple4!557 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277284 d!95704))

(push 1)

(assert (not b!277328))

(assert (not b!277329))

(assert (not b!277330))

(assert (not bm!4484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

