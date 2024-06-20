; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61840 () Bool)

(assert start!61840)

(declare-fun res!230203 () Bool)

(declare-fun e!197146 () Bool)

(assert (=> start!61840 (=> (not res!230203) (not e!197146))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15901 0))(
  ( (array!15902 (arr!7876 (Array (_ BitVec 32) (_ BitVec 8))) (size!6880 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15901)

(declare-fun a2!699 () array!15901)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!61840 (= res!230203 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6880 a1!699) (size!6880 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6880 a1!699))))))))

(assert (=> start!61840 e!197146))

(assert (=> start!61840 true))

(declare-fun array_inv!6604 (array!15901) Bool)

(assert (=> start!61840 (array_inv!6604 a1!699)))

(assert (=> start!61840 (array_inv!6604 a2!699)))

(declare-fun b!277174 () Bool)

(declare-fun res!230201 () Bool)

(assert (=> b!277174 (=> (not res!230201) (not e!197146))))

(declare-fun arrayBitRangesEq!0 (array!15901 array!15901 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277174 (= res!230201 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277175 () Bool)

(declare-fun res!230202 () Bool)

(assert (=> b!277175 (=> (not res!230202) (not e!197146))))

(assert (=> b!277175 (= res!230202 (bvslt from!822 to!789))))

(declare-fun b!277176 () Bool)

(declare-datatypes ((tuple4!546 0))(
  ( (tuple4!547 (_1!12348 (_ BitVec 32)) (_2!12348 (_ BitVec 32)) (_3!1053 (_ BitVec 32)) (_4!273 (_ BitVec 32))) )
))
(declare-fun lt!415323 () tuple4!546)

(assert (=> b!277176 (= e!197146 (and (bvslt (_1!12348 lt!415323) (_2!12348 lt!415323)) (or (bvsgt #b00000000000000000000000000000000 (_1!12348 lt!415323)) (bvsgt (_1!12348 lt!415323) (_2!12348 lt!415323)))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!546)

(assert (=> b!277176 (= lt!415323 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!61840 res!230203) b!277174))

(assert (= (and b!277174 res!230201) b!277175))

(assert (= (and b!277175 res!230202) b!277176))

(declare-fun m!410387 () Bool)

(assert (=> start!61840 m!410387))

(declare-fun m!410389 () Bool)

(assert (=> start!61840 m!410389))

(declare-fun m!410391 () Bool)

(assert (=> b!277174 m!410391))

(declare-fun m!410393 () Bool)

(assert (=> b!277176 m!410393))

(push 1)

(assert (not b!277176))

(assert (not start!61840))

(assert (not b!277174))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95662 () Bool)

(assert (=> d!95662 (= (arrayBitIndices!0 from!822 to!789) (tuple4!547 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277176 d!95662))

(declare-fun d!95664 () Bool)

(assert (=> d!95664 (= (array_inv!6604 a1!699) (bvsge (size!6880 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61840 d!95664))

(declare-fun d!95666 () Bool)

(assert (=> d!95666 (= (array_inv!6604 a2!699) (bvsge (size!6880 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61840 d!95666))

(declare-fun b!277209 () Bool)

(declare-fun e!197181 () Bool)

(declare-fun call!4475 () Bool)

(assert (=> b!277209 (= e!197181 call!4475)))

(declare-fun b!277210 () Bool)

(declare-fun e!197183 () Bool)

(assert (=> b!277210 (= e!197183 e!197181)))

(declare-fun c!12660 () Bool)

(declare-fun lt!415336 () tuple4!546)

(assert (=> b!277210 (= c!12660 (= (_3!1053 lt!415336) (_4!273 lt!415336)))))

(declare-fun b!277211 () Bool)

(declare-fun e!197178 () Bool)

(assert (=> b!277211 (= e!197178 e!197183)))

(declare-fun res!230236 () Bool)

(assert (=> b!277211 (=> (not res!230236) (not e!197183))))

(declare-fun e!197179 () Bool)

(assert (=> b!277211 (= res!230236 e!197179)))

(declare-fun res!230233 () Bool)

(assert (=> b!277211 (=> res!230233 e!197179)))

(assert (=> b!277211 (= res!230233 (bvsge (_1!12348 lt!415336) (_2!12348 lt!415336)))))

(declare-fun lt!415337 () (_ BitVec 32))

(assert (=> b!277211 (= lt!415337 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415338 () (_ BitVec 32))

(assert (=> b!277211 (= lt!415338 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277211 (= lt!415336 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277212 () Bool)

(declare-fun res!230235 () Bool)

(assert (=> b!277212 (= res!230235 (= lt!415337 #b00000000000000000000000000000000))))

(declare-fun e!197182 () Bool)

(assert (=> b!277212 (=> res!230235 e!197182)))

(declare-fun e!197180 () Bool)

(assert (=> b!277212 (= e!197180 e!197182)))

(declare-fun b!277213 () Bool)

(declare-fun arrayRangesEq!1166 (array!15901 array!15901 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277213 (= e!197179 (arrayRangesEq!1166 a1!699 a2!699 (_1!12348 lt!415336) (_2!12348 lt!415336)))))

(declare-fun b!277214 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277214 (= e!197182 (byteRangesEq!0 (select (arr!7876 a1!699) (_4!273 lt!415336)) (select (arr!7876 a2!699) (_4!273 lt!415336)) #b00000000000000000000000000000000 lt!415337))))

(declare-fun b!277215 () Bool)

(assert (=> b!277215 (= e!197181 e!197180)))

(declare-fun res!230232 () Bool)

(assert (=> b!277215 (= res!230232 call!4475)))

(assert (=> b!277215 (=> (not res!230232) (not e!197180))))

(declare-fun bm!4472 () Bool)

(assert (=> bm!4472 (= call!4475 (byteRangesEq!0 (select (arr!7876 a1!699) (_3!1053 lt!415336)) (select (arr!7876 a2!699) (_3!1053 lt!415336)) lt!415338 (ite c!12660 lt!415337 #b00000000000000000000000000001000)))))

(declare-fun d!95668 () Bool)

(declare-fun res!230234 () Bool)

(assert (=> d!95668 (=> res!230234 e!197178)))

(assert (=> d!95668 (= res!230234 (bvsge from!822 to!789))))

(assert (=> d!95668 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197178)))

(assert (= (and d!95668 (not res!230234)) b!277211))

(assert (= (and b!277211 (not res!230233)) b!277213))

(assert (= (and b!277211 res!230236) b!277210))

(assert (= (and b!277210 c!12660) b!277209))

(assert (= (and b!277210 (not c!12660)) b!277215))

(assert (= (and b!277215 res!230232) b!277212))

(assert (= (and b!277212 (not res!230235)) b!277214))

(assert (= (or b!277209 b!277215) bm!4472))

(assert (=> b!277211 m!410393))

(declare-fun m!410411 () Bool)

(assert (=> b!277213 m!410411))

(declare-fun m!410413 () Bool)

(assert (=> b!277214 m!410413))

(declare-fun m!410415 () Bool)

(assert (=> b!277214 m!410415))

(assert (=> b!277214 m!410413))

(assert (=> b!277214 m!410415))

(declare-fun m!410417 () Bool)

(assert (=> b!277214 m!410417))

(declare-fun m!410419 () Bool)

(assert (=> bm!4472 m!410419))

(declare-fun m!410421 () Bool)

(assert (=> bm!4472 m!410421))

(assert (=> bm!4472 m!410419))

(assert (=> bm!4472 m!410421))

(declare-fun m!410423 () Bool)

(assert (=> bm!4472 m!410423))

(assert (=> b!277174 d!95668))

(push 1)

(assert (not bm!4472))

(assert (not b!277213))

(assert (not b!277214))

(assert (not b!277211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

