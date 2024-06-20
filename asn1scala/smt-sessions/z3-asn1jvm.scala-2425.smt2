; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61842 () Bool)

(assert start!61842)

(declare-fun res!230210 () Bool)

(declare-fun e!197155 () Bool)

(assert (=> start!61842 (=> (not res!230210) (not e!197155))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15903 0))(
  ( (array!15904 (arr!7877 (Array (_ BitVec 32) (_ BitVec 8))) (size!6881 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15903)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun a2!699 () array!15903)

(assert (=> start!61842 (= res!230210 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6881 a1!699) (size!6881 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6881 a1!699))))))))

(assert (=> start!61842 e!197155))

(assert (=> start!61842 true))

(declare-fun array_inv!6605 (array!15903) Bool)

(assert (=> start!61842 (array_inv!6605 a1!699)))

(assert (=> start!61842 (array_inv!6605 a2!699)))

(declare-fun b!277183 () Bool)

(declare-fun res!230211 () Bool)

(assert (=> b!277183 (=> (not res!230211) (not e!197155))))

(declare-fun arrayBitRangesEq!0 (array!15903 array!15903 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277183 (= res!230211 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277184 () Bool)

(declare-fun res!230212 () Bool)

(assert (=> b!277184 (=> (not res!230212) (not e!197155))))

(assert (=> b!277184 (= res!230212 (bvslt from!822 to!789))))

(declare-fun b!277185 () Bool)

(declare-datatypes ((tuple4!548 0))(
  ( (tuple4!549 (_1!12349 (_ BitVec 32)) (_2!12349 (_ BitVec 32)) (_3!1054 (_ BitVec 32)) (_4!274 (_ BitVec 32))) )
))
(declare-fun lt!415326 () tuple4!548)

(assert (=> b!277185 (= e!197155 (and (bvslt (_1!12349 lt!415326) (_2!12349 lt!415326)) (or (bvsgt #b00000000000000000000000000000000 (_1!12349 lt!415326)) (bvsgt (_1!12349 lt!415326) (_2!12349 lt!415326)))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!548)

(assert (=> b!277185 (= lt!415326 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!61842 res!230210) b!277183))

(assert (= (and b!277183 res!230211) b!277184))

(assert (= (and b!277184 res!230212) b!277185))

(declare-fun m!410395 () Bool)

(assert (=> start!61842 m!410395))

(declare-fun m!410397 () Bool)

(assert (=> start!61842 m!410397))

(declare-fun m!410399 () Bool)

(assert (=> b!277183 m!410399))

(declare-fun m!410401 () Bool)

(assert (=> b!277185 m!410401))

(check-sat (not start!61842) (not b!277183) (not b!277185))
(check-sat)
(get-model)

(declare-fun d!95672 () Bool)

(assert (=> d!95672 (= (array_inv!6605 a1!699) (bvsge (size!6881 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61842 d!95672))

(declare-fun d!95674 () Bool)

(assert (=> d!95674 (= (array_inv!6605 a2!699) (bvsge (size!6881 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61842 d!95674))

(declare-fun b!277252 () Bool)

(declare-fun e!197218 () Bool)

(declare-fun e!197217 () Bool)

(assert (=> b!277252 (= e!197218 e!197217)))

(declare-fun c!12666 () Bool)

(declare-fun lt!415355 () tuple4!548)

(assert (=> b!277252 (= c!12666 (= (_3!1054 lt!415355) (_4!274 lt!415355)))))

(declare-fun b!277253 () Bool)

(declare-fun call!4481 () Bool)

(assert (=> b!277253 (= e!197217 call!4481)))

(declare-fun b!277254 () Bool)

(declare-fun e!197216 () Bool)

(assert (=> b!277254 (= e!197216 call!4481)))

(declare-fun b!277255 () Bool)

(declare-fun res!230264 () Bool)

(declare-fun lt!415356 () (_ BitVec 32))

(assert (=> b!277255 (= res!230264 (= lt!415356 #b00000000000000000000000000000000))))

(assert (=> b!277255 (=> res!230264 e!197216)))

(declare-fun e!197215 () Bool)

(assert (=> b!277255 (= e!197215 e!197216)))

(declare-fun d!95676 () Bool)

(declare-fun res!230266 () Bool)

(declare-fun e!197219 () Bool)

(assert (=> d!95676 (=> res!230266 e!197219)))

(assert (=> d!95676 (= res!230266 (bvsge from!822 to!789))))

(assert (=> d!95676 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197219)))

(declare-fun b!277251 () Bool)

(assert (=> b!277251 (= e!197217 e!197215)))

(declare-fun res!230263 () Bool)

(declare-fun lt!415354 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277251 (= res!230263 (byteRangesEq!0 (select (arr!7877 a1!699) (_3!1054 lt!415355)) (select (arr!7877 a2!699) (_3!1054 lt!415355)) lt!415354 #b00000000000000000000000000001000))))

(assert (=> b!277251 (=> (not res!230263) (not e!197215))))

(declare-fun b!277256 () Bool)

(assert (=> b!277256 (= e!197219 e!197218)))

(declare-fun res!230265 () Bool)

(assert (=> b!277256 (=> (not res!230265) (not e!197218))))

(declare-fun e!197214 () Bool)

(assert (=> b!277256 (= res!230265 e!197214)))

(declare-fun res!230262 () Bool)

(assert (=> b!277256 (=> res!230262 e!197214)))

(assert (=> b!277256 (= res!230262 (bvsge (_1!12349 lt!415355) (_2!12349 lt!415355)))))

(assert (=> b!277256 (= lt!415356 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277256 (= lt!415354 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277256 (= lt!415355 (arrayBitIndices!0 from!822 to!789))))

(declare-fun bm!4478 () Bool)

(assert (=> bm!4478 (= call!4481 (byteRangesEq!0 (ite c!12666 (select (arr!7877 a1!699) (_3!1054 lt!415355)) (select (arr!7877 a1!699) (_4!274 lt!415355))) (ite c!12666 (select (arr!7877 a2!699) (_3!1054 lt!415355)) (select (arr!7877 a2!699) (_4!274 lt!415355))) (ite c!12666 lt!415354 #b00000000000000000000000000000000) lt!415356))))

(declare-fun b!277257 () Bool)

(declare-fun arrayRangesEq!1168 (array!15903 array!15903 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277257 (= e!197214 (arrayRangesEq!1168 a1!699 a2!699 (_1!12349 lt!415355) (_2!12349 lt!415355)))))

(assert (= (and d!95676 (not res!230266)) b!277256))

(assert (= (and b!277256 (not res!230262)) b!277257))

(assert (= (and b!277256 res!230265) b!277252))

(assert (= (and b!277252 c!12666) b!277253))

(assert (= (and b!277252 (not c!12666)) b!277251))

(assert (= (and b!277251 res!230263) b!277255))

(assert (= (and b!277255 (not res!230264)) b!277254))

(assert (= (or b!277253 b!277254) bm!4478))

(declare-fun m!410439 () Bool)

(assert (=> b!277251 m!410439))

(declare-fun m!410441 () Bool)

(assert (=> b!277251 m!410441))

(assert (=> b!277251 m!410439))

(assert (=> b!277251 m!410441))

(declare-fun m!410443 () Bool)

(assert (=> b!277251 m!410443))

(assert (=> b!277256 m!410401))

(declare-fun m!410445 () Bool)

(assert (=> bm!4478 m!410445))

(assert (=> bm!4478 m!410441))

(declare-fun m!410447 () Bool)

(assert (=> bm!4478 m!410447))

(declare-fun m!410449 () Bool)

(assert (=> bm!4478 m!410449))

(assert (=> bm!4478 m!410439))

(declare-fun m!410451 () Bool)

(assert (=> b!277257 m!410451))

(assert (=> b!277183 d!95676))

(declare-fun d!95684 () Bool)

(assert (=> d!95684 (= (arrayBitIndices!0 from!822 to!789) (tuple4!549 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277185 d!95684))

(check-sat (not b!277256) (not b!277251) (not bm!4478) (not b!277257))
(check-sat)
