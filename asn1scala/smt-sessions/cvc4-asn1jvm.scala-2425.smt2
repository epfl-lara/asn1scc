; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61844 () Bool)

(assert start!61844)

(declare-fun res!230219 () Bool)

(declare-fun e!197165 () Bool)

(assert (=> start!61844 (=> (not res!230219) (not e!197165))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15905 0))(
  ( (array!15906 (arr!7878 (Array (_ BitVec 32) (_ BitVec 8))) (size!6882 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15905)

(declare-fun a2!699 () array!15905)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!61844 (= res!230219 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6882 a1!699) (size!6882 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6882 a1!699))))))))

(assert (=> start!61844 e!197165))

(assert (=> start!61844 true))

(declare-fun array_inv!6606 (array!15905) Bool)

(assert (=> start!61844 (array_inv!6606 a1!699)))

(assert (=> start!61844 (array_inv!6606 a2!699)))

(declare-fun b!277192 () Bool)

(declare-fun res!230221 () Bool)

(assert (=> b!277192 (=> (not res!230221) (not e!197165))))

(declare-fun arrayBitRangesEq!0 (array!15905 array!15905 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277192 (= res!230221 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277193 () Bool)

(declare-fun res!230220 () Bool)

(assert (=> b!277193 (=> (not res!230220) (not e!197165))))

(assert (=> b!277193 (= res!230220 (bvslt from!822 to!789))))

(declare-fun b!277194 () Bool)

(declare-datatypes ((tuple4!550 0))(
  ( (tuple4!551 (_1!12350 (_ BitVec 32)) (_2!12350 (_ BitVec 32)) (_3!1055 (_ BitVec 32)) (_4!275 (_ BitVec 32))) )
))
(declare-fun lt!415329 () tuple4!550)

(assert (=> b!277194 (= e!197165 (and (bvslt (_1!12350 lt!415329) (_2!12350 lt!415329)) (or (bvsgt #b00000000000000000000000000000000 (_1!12350 lt!415329)) (bvsgt (_1!12350 lt!415329) (_2!12350 lt!415329)))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!550)

(assert (=> b!277194 (= lt!415329 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!61844 res!230219) b!277192))

(assert (= (and b!277192 res!230221) b!277193))

(assert (= (and b!277193 res!230220) b!277194))

(declare-fun m!410403 () Bool)

(assert (=> start!61844 m!410403))

(declare-fun m!410405 () Bool)

(assert (=> start!61844 m!410405))

(declare-fun m!410407 () Bool)

(assert (=> b!277192 m!410407))

(declare-fun m!410409 () Bool)

(assert (=> b!277194 m!410409))

(push 1)

(assert (not b!277194))

(assert (not start!61844))

(assert (not b!277192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95670 () Bool)

(assert (=> d!95670 (= (arrayBitIndices!0 from!822 to!789) (tuple4!551 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277194 d!95670))

(declare-fun d!95678 () Bool)

(assert (=> d!95678 (= (array_inv!6606 a1!699) (bvsge (size!6882 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61844 d!95678))

(declare-fun d!95680 () Bool)

(assert (=> d!95680 (= (array_inv!6606 a2!699) (bvsge (size!6882 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61844 d!95680))

(declare-fun bm!4475 () Bool)

(declare-fun lt!415347 () (_ BitVec 32))

(declare-fun call!4478 () Bool)

(declare-fun c!12663 () Bool)

(declare-fun lt!415346 () (_ BitVec 32))

(declare-fun lt!415345 () tuple4!550)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4475 (= call!4478 (byteRangesEq!0 (select (arr!7878 a1!699) (_3!1055 lt!415345)) (select (arr!7878 a2!699) (_3!1055 lt!415345)) lt!415347 (ite c!12663 lt!415346 #b00000000000000000000000000001000)))))

(declare-fun b!277230 () Bool)

(declare-fun e!197200 () Bool)

(declare-fun e!197201 () Bool)

(assert (=> b!277230 (= e!197200 e!197201)))

(declare-fun res!230249 () Bool)

(assert (=> b!277230 (=> (not res!230249) (not e!197201))))

(declare-fun e!197197 () Bool)

(assert (=> b!277230 (= res!230249 e!197197)))

(declare-fun res!230247 () Bool)

(assert (=> b!277230 (=> res!230247 e!197197)))

(assert (=> b!277230 (= res!230247 (bvsge (_1!12350 lt!415345) (_2!12350 lt!415345)))))

(assert (=> b!277230 (= lt!415346 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277230 (= lt!415347 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277230 (= lt!415345 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277231 () Bool)

(declare-fun e!197196 () Bool)

(assert (=> b!277231 (= e!197196 call!4478)))

(declare-fun b!277232 () Bool)

(declare-fun arrayRangesEq!1167 (array!15905 array!15905 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277232 (= e!197197 (arrayRangesEq!1167 a1!699 a2!699 (_1!12350 lt!415345) (_2!12350 lt!415345)))))

(declare-fun b!277233 () Bool)

(declare-fun res!230248 () Bool)

(assert (=> b!277233 (= res!230248 (= lt!415346 #b00000000000000000000000000000000))))

(declare-fun e!197199 () Bool)

(assert (=> b!277233 (=> res!230248 e!197199)))

(declare-fun e!197198 () Bool)

(assert (=> b!277233 (= e!197198 e!197199)))

(declare-fun b!277235 () Bool)

(assert (=> b!277235 (= e!197201 e!197196)))

(assert (=> b!277235 (= c!12663 (= (_3!1055 lt!415345) (_4!275 lt!415345)))))

(declare-fun b!277236 () Bool)

(assert (=> b!277236 (= e!197199 (byteRangesEq!0 (select (arr!7878 a1!699) (_4!275 lt!415345)) (select (arr!7878 a2!699) (_4!275 lt!415345)) #b00000000000000000000000000000000 lt!415346))))

(declare-fun b!277234 () Bool)

(assert (=> b!277234 (= e!197196 e!197198)))

(declare-fun res!230251 () Bool)

(assert (=> b!277234 (= res!230251 call!4478)))

(assert (=> b!277234 (=> (not res!230251) (not e!197198))))

(declare-fun d!95682 () Bool)

(declare-fun res!230250 () Bool)

(assert (=> d!95682 (=> res!230250 e!197200)))

(assert (=> d!95682 (= res!230250 (bvsge from!822 to!789))))

(assert (=> d!95682 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197200)))

(assert (= (and d!95682 (not res!230250)) b!277230))

(assert (= (and b!277230 (not res!230247)) b!277232))

(assert (= (and b!277230 res!230249) b!277235))

(assert (= (and b!277235 c!12663) b!277231))

(assert (= (and b!277235 (not c!12663)) b!277234))

(assert (= (and b!277234 res!230251) b!277233))

(assert (= (and b!277233 (not res!230248)) b!277236))

(assert (= (or b!277231 b!277234) bm!4475))

(declare-fun m!410425 () Bool)

(assert (=> bm!4475 m!410425))

(declare-fun m!410427 () Bool)

(assert (=> bm!4475 m!410427))

(assert (=> bm!4475 m!410425))

(assert (=> bm!4475 m!410427))

(declare-fun m!410429 () Bool)

(assert (=> bm!4475 m!410429))

(assert (=> b!277230 m!410409))

(declare-fun m!410431 () Bool)

(assert (=> b!277232 m!410431))

(declare-fun m!410433 () Bool)

(assert (=> b!277236 m!410433))

(declare-fun m!410435 () Bool)

(assert (=> b!277236 m!410435))

(assert (=> b!277236 m!410433))

(assert (=> b!277236 m!410435))

(declare-fun m!410437 () Bool)

(assert (=> b!277236 m!410437))

(assert (=> b!277192 d!95682))

(push 1)

(assert (not b!277236))

(assert (not b!277232))

(assert (not bm!4475))

(assert (not b!277230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

