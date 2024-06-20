; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20368 () Bool)

(assert start!20368)

(declare-fun b!102608 () Bool)

(declare-fun res!84392 () Bool)

(declare-fun e!67165 () Bool)

(assert (=> b!102608 (=> (not res!84392) (not e!67165))))

(declare-datatypes ((array!4812 0))(
  ( (array!4813 (arr!2790 (Array (_ BitVec 32) (_ BitVec 8))) (size!2197 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3868 0))(
  ( (BitStream!3869 (buf!2557 array!4812) (currentByte!5030 (_ BitVec 32)) (currentBit!5025 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3868)

(declare-datatypes ((Unit!6290 0))(
  ( (Unit!6291) )
))
(declare-datatypes ((tuple2!8398 0))(
  ( (tuple2!8399 (_1!4454 Unit!6290) (_2!4454 BitStream!3868)) )
))
(declare-fun lt!149256 () tuple2!8398)

(declare-fun isPrefixOf!0 (BitStream!3868 BitStream!3868) Bool)

(assert (=> b!102608 (= res!84392 (isPrefixOf!0 thiss!1305 (_2!4454 lt!149256)))))

(declare-datatypes ((tuple2!8400 0))(
  ( (tuple2!8401 (_1!4455 BitStream!3868) (_2!4455 BitStream!3868)) )
))
(declare-fun lt!149255 () tuple2!8400)

(declare-fun b!102609 () Bool)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun e!67166 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102609 (= e!67166 (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4455 lt!149255)))) ((_ sign_extend 32) (currentByte!5030 (_1!4455 lt!149255))) ((_ sign_extend 32) (currentBit!5025 (_1!4455 lt!149255))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!102610 () Bool)

(declare-fun e!67161 () Bool)

(declare-datatypes ((tuple2!8402 0))(
  ( (tuple2!8403 (_1!4456 BitStream!3868) (_2!4456 Bool)) )
))
(declare-fun lt!149257 () tuple2!8402)

(declare-fun lt!149244 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102610 (= e!67161 (= (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!149257))) (currentByte!5030 (_1!4456 lt!149257)) (currentBit!5025 (_1!4456 lt!149257))) lt!149244))))

(declare-fun b!102611 () Bool)

(declare-fun res!84393 () Bool)

(declare-fun e!67159 () Bool)

(assert (=> b!102611 (=> (not res!84393) (not e!67159))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102611 (= res!84393 (invariant!0 (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305) (size!2197 (buf!2557 (_2!4454 lt!149256)))))))

(declare-fun b!102612 () Bool)

(declare-fun e!67162 () Bool)

(declare-fun lt!149249 () tuple2!8402)

(declare-fun lt!149253 () tuple2!8402)

(assert (=> b!102612 (= e!67162 (= (_2!4456 lt!149249) (_2!4456 lt!149253)))))

(declare-fun b!102613 () Bool)

(declare-fun res!84398 () Bool)

(declare-fun e!67158 () Bool)

(assert (=> b!102613 (=> (not res!84398) (not e!67158))))

(assert (=> b!102613 (= res!84398 (bvslt i!615 nBits!396))))

(declare-fun b!102614 () Bool)

(declare-fun lt!149243 () tuple2!8398)

(assert (=> b!102614 (= e!67159 (invariant!0 (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305) (size!2197 (buf!2557 (_2!4454 lt!149243)))))))

(declare-fun b!102615 () Bool)

(declare-fun e!67164 () Bool)

(assert (=> b!102615 (= e!67164 e!67165)))

(declare-fun res!84394 () Bool)

(assert (=> b!102615 (=> (not res!84394) (not e!67165))))

(declare-fun lt!149251 () (_ BitVec 64))

(assert (=> b!102615 (= res!84394 (= lt!149244 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!149251)))))

(assert (=> b!102615 (= lt!149244 (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149256))) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256))))))

(assert (=> b!102615 (= lt!149251 (bitIndex!0 (size!2197 (buf!2557 thiss!1305)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305)))))

(declare-fun b!102616 () Bool)

(declare-fun e!67167 () Bool)

(assert (=> b!102616 (= e!67167 e!67158)))

(declare-fun res!84396 () Bool)

(assert (=> b!102616 (=> (not res!84396) (not e!67158))))

(declare-fun lt!149247 () (_ BitVec 64))

(assert (=> b!102616 (= res!84396 (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 thiss!1305))) ((_ sign_extend 32) (currentByte!5030 thiss!1305)) ((_ sign_extend 32) (currentBit!5025 thiss!1305)) lt!149247))))

(assert (=> b!102616 (= lt!149247 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102617 () Bool)

(assert (=> b!102617 (= e!67165 e!67161)))

(declare-fun res!84391 () Bool)

(assert (=> b!102617 (=> (not res!84391) (not e!67161))))

(declare-fun lt!149246 () Bool)

(assert (=> b!102617 (= res!84391 (and (= (_2!4456 lt!149257) lt!149246) (= (_1!4456 lt!149257) (_2!4454 lt!149256))))))

(declare-fun readBitPure!0 (BitStream!3868) tuple2!8402)

(declare-fun readerFrom!0 (BitStream!3868 (_ BitVec 32) (_ BitVec 32)) BitStream!3868)

(assert (=> b!102617 (= lt!149257 (readBitPure!0 (readerFrom!0 (_2!4454 lt!149256) (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305))))))

(declare-fun b!102618 () Bool)

(assert (=> b!102618 (= e!67158 (not e!67166))))

(declare-fun res!84388 () Bool)

(assert (=> b!102618 (=> res!84388 e!67166)))

(assert (=> b!102618 (= res!84388 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun lt!149248 () (_ BitVec 64))

(assert (=> b!102618 (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149243)))) ((_ sign_extend 32) (currentByte!5030 (_2!4454 lt!149256))) ((_ sign_extend 32) (currentBit!5025 (_2!4454 lt!149256))) lt!149248)))

(declare-fun lt!149250 () Unit!6290)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3868 array!4812 (_ BitVec 64)) Unit!6290)

(assert (=> b!102618 (= lt!149250 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4454 lt!149256) (buf!2557 (_2!4454 lt!149243)) lt!149248))))

(assert (=> b!102618 (= lt!149248 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!8404 0))(
  ( (tuple2!8405 (_1!4457 BitStream!3868) (_2!4457 (_ BitVec 64))) )
))
(declare-fun lt!149252 () tuple2!8404)

(declare-fun lt!149258 () tuple2!8400)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8404)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102618 (= lt!149252 (readNLeastSignificantBitsLoopPure!0 (_1!4455 lt!149258) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!102618 (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149243)))) ((_ sign_extend 32) (currentByte!5030 thiss!1305)) ((_ sign_extend 32) (currentBit!5025 thiss!1305)) lt!149247)))

(declare-fun lt!149245 () Unit!6290)

(assert (=> b!102618 (= lt!149245 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2557 (_2!4454 lt!149243)) lt!149247))))

(assert (=> b!102618 (= (_2!4456 (readBitPure!0 (_1!4455 lt!149258))) lt!149246)))

(declare-fun reader!0 (BitStream!3868 BitStream!3868) tuple2!8400)

(assert (=> b!102618 (= lt!149255 (reader!0 (_2!4454 lt!149256) (_2!4454 lt!149243)))))

(assert (=> b!102618 (= lt!149258 (reader!0 thiss!1305 (_2!4454 lt!149243)))))

(assert (=> b!102618 e!67162))

(declare-fun res!84397 () Bool)

(assert (=> b!102618 (=> (not res!84397) (not e!67162))))

(assert (=> b!102618 (= res!84397 (= (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!149249))) (currentByte!5030 (_1!4456 lt!149249)) (currentBit!5025 (_1!4456 lt!149249))) (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!149253))) (currentByte!5030 (_1!4456 lt!149253)) (currentBit!5025 (_1!4456 lt!149253)))))))

(declare-fun lt!149259 () Unit!6290)

(declare-fun lt!149260 () BitStream!3868)

(declare-fun readBitPrefixLemma!0 (BitStream!3868 BitStream!3868) Unit!6290)

(assert (=> b!102618 (= lt!149259 (readBitPrefixLemma!0 lt!149260 (_2!4454 lt!149243)))))

(assert (=> b!102618 (= lt!149253 (readBitPure!0 (BitStream!3869 (buf!2557 (_2!4454 lt!149243)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305))))))

(assert (=> b!102618 (= lt!149249 (readBitPure!0 lt!149260))))

(assert (=> b!102618 (= lt!149260 (BitStream!3869 (buf!2557 (_2!4454 lt!149256)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305)))))

(assert (=> b!102618 e!67159))

(declare-fun res!84390 () Bool)

(assert (=> b!102618 (=> (not res!84390) (not e!67159))))

(assert (=> b!102618 (= res!84390 (isPrefixOf!0 thiss!1305 (_2!4454 lt!149243)))))

(declare-fun lt!149254 () Unit!6290)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3868 BitStream!3868 BitStream!3868) Unit!6290)

(assert (=> b!102618 (= lt!149254 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4454 lt!149256) (_2!4454 lt!149243)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3868 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8398)

(assert (=> b!102618 (= lt!149243 (appendNLeastSignificantBitsLoop!0 (_2!4454 lt!149256) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!102618 e!67164))

(declare-fun res!84387 () Bool)

(assert (=> b!102618 (=> (not res!84387) (not e!67164))))

(assert (=> b!102618 (= res!84387 (= (size!2197 (buf!2557 thiss!1305)) (size!2197 (buf!2557 (_2!4454 lt!149256)))))))

(declare-fun appendBit!0 (BitStream!3868 Bool) tuple2!8398)

(assert (=> b!102618 (= lt!149256 (appendBit!0 thiss!1305 lt!149246))))

(assert (=> b!102618 (= lt!149246 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!84389 () Bool)

(assert (=> start!20368 (=> (not res!84389) (not e!67167))))

(assert (=> start!20368 (= res!84389 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20368 e!67167))

(assert (=> start!20368 true))

(declare-fun e!67163 () Bool)

(declare-fun inv!12 (BitStream!3868) Bool)

(assert (=> start!20368 (and (inv!12 thiss!1305) e!67163)))

(declare-fun b!102619 () Bool)

(declare-fun array_inv!1999 (array!4812) Bool)

(assert (=> b!102619 (= e!67163 (array_inv!1999 (buf!2557 thiss!1305)))))

(declare-fun b!102620 () Bool)

(declare-fun res!84395 () Bool)

(assert (=> b!102620 (=> (not res!84395) (not e!67158))))

(assert (=> b!102620 (= res!84395 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!20368 res!84389) b!102616))

(assert (= (and b!102616 res!84396) b!102620))

(assert (= (and b!102620 res!84395) b!102613))

(assert (= (and b!102613 res!84398) b!102618))

(assert (= (and b!102618 res!84387) b!102615))

(assert (= (and b!102615 res!84394) b!102608))

(assert (= (and b!102608 res!84392) b!102617))

(assert (= (and b!102617 res!84391) b!102610))

(assert (= (and b!102618 res!84390) b!102611))

(assert (= (and b!102611 res!84393) b!102614))

(assert (= (and b!102618 res!84397) b!102612))

(assert (= (and b!102618 (not res!84388)) b!102609))

(assert (= start!20368 b!102619))

(declare-fun m!149455 () Bool)

(assert (=> b!102610 m!149455))

(declare-fun m!149457 () Bool)

(assert (=> b!102608 m!149457))

(declare-fun m!149459 () Bool)

(assert (=> b!102609 m!149459))

(declare-fun m!149461 () Bool)

(assert (=> b!102620 m!149461))

(declare-fun m!149463 () Bool)

(assert (=> b!102617 m!149463))

(assert (=> b!102617 m!149463))

(declare-fun m!149465 () Bool)

(assert (=> b!102617 m!149465))

(declare-fun m!149467 () Bool)

(assert (=> b!102619 m!149467))

(declare-fun m!149469 () Bool)

(assert (=> b!102618 m!149469))

(declare-fun m!149471 () Bool)

(assert (=> b!102618 m!149471))

(declare-fun m!149473 () Bool)

(assert (=> b!102618 m!149473))

(declare-fun m!149475 () Bool)

(assert (=> b!102618 m!149475))

(declare-fun m!149477 () Bool)

(assert (=> b!102618 m!149477))

(declare-fun m!149479 () Bool)

(assert (=> b!102618 m!149479))

(declare-fun m!149481 () Bool)

(assert (=> b!102618 m!149481))

(declare-fun m!149483 () Bool)

(assert (=> b!102618 m!149483))

(declare-fun m!149485 () Bool)

(assert (=> b!102618 m!149485))

(declare-fun m!149487 () Bool)

(assert (=> b!102618 m!149487))

(declare-fun m!149489 () Bool)

(assert (=> b!102618 m!149489))

(declare-fun m!149491 () Bool)

(assert (=> b!102618 m!149491))

(declare-fun m!149493 () Bool)

(assert (=> b!102618 m!149493))

(declare-fun m!149495 () Bool)

(assert (=> b!102618 m!149495))

(declare-fun m!149497 () Bool)

(assert (=> b!102618 m!149497))

(declare-fun m!149499 () Bool)

(assert (=> b!102618 m!149499))

(declare-fun m!149501 () Bool)

(assert (=> b!102618 m!149501))

(declare-fun m!149503 () Bool)

(assert (=> b!102618 m!149503))

(declare-fun m!149505 () Bool)

(assert (=> start!20368 m!149505))

(declare-fun m!149507 () Bool)

(assert (=> b!102615 m!149507))

(declare-fun m!149509 () Bool)

(assert (=> b!102615 m!149509))

(declare-fun m!149511 () Bool)

(assert (=> b!102616 m!149511))

(declare-fun m!149513 () Bool)

(assert (=> b!102614 m!149513))

(declare-fun m!149515 () Bool)

(assert (=> b!102611 m!149515))

(push 1)

(assert (not b!102617))

(assert (not start!20368))

(assert (not b!102619))

(assert (not b!102615))

(assert (not b!102608))

(assert (not b!102609))

(assert (not b!102616))

(assert (not b!102614))

(assert (not b!102610))

(assert (not b!102618))

(assert (not b!102620))

(assert (not b!102611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31874 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31874 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 thiss!1305))) ((_ sign_extend 32) (currentByte!5030 thiss!1305)) ((_ sign_extend 32) (currentBit!5025 thiss!1305)) lt!149247) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2197 (buf!2557 thiss!1305))) ((_ sign_extend 32) (currentByte!5030 thiss!1305)) ((_ sign_extend 32) (currentBit!5025 thiss!1305))) lt!149247))))

(declare-fun bs!7821 () Bool)

(assert (= bs!7821 d!31874))

(declare-fun m!149687 () Bool)

(assert (=> bs!7821 m!149687))

(assert (=> b!102616 d!31874))

(declare-fun d!31876 () Bool)

(declare-fun e!67239 () Bool)

(assert (=> d!31876 e!67239))

(declare-fun res!84491 () Bool)

(assert (=> d!31876 (=> (not res!84491) (not e!67239))))

(declare-fun lt!149470 () (_ BitVec 64))

(declare-fun lt!149471 () (_ BitVec 64))

(declare-fun lt!149472 () (_ BitVec 64))

(assert (=> d!31876 (= res!84491 (= lt!149472 (bvsub lt!149470 lt!149471)))))

(assert (=> d!31876 (or (= (bvand lt!149470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149471 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149470 lt!149471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31876 (= lt!149471 (remainingBits!0 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149256)))) ((_ sign_extend 32) (currentByte!5030 (_2!4454 lt!149256))) ((_ sign_extend 32) (currentBit!5025 (_2!4454 lt!149256)))))))

(declare-fun lt!149468 () (_ BitVec 64))

(declare-fun lt!149469 () (_ BitVec 64))

(assert (=> d!31876 (= lt!149470 (bvmul lt!149468 lt!149469))))

(assert (=> d!31876 (or (= lt!149468 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!149469 (bvsdiv (bvmul lt!149468 lt!149469) lt!149468)))))

(assert (=> d!31876 (= lt!149469 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31876 (= lt!149468 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149256)))))))

(assert (=> d!31876 (= lt!149472 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5030 (_2!4454 lt!149256))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5025 (_2!4454 lt!149256)))))))

(assert (=> d!31876 (invariant!0 (currentBit!5025 (_2!4454 lt!149256)) (currentByte!5030 (_2!4454 lt!149256)) (size!2197 (buf!2557 (_2!4454 lt!149256))))))

(assert (=> d!31876 (= (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149256))) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256))) lt!149472)))

(declare-fun b!102724 () Bool)

(declare-fun res!84490 () Bool)

(assert (=> b!102724 (=> (not res!84490) (not e!67239))))

(assert (=> b!102724 (= res!84490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!149472))))

(declare-fun b!102725 () Bool)

(declare-fun lt!149473 () (_ BitVec 64))

(assert (=> b!102725 (= e!67239 (bvsle lt!149472 (bvmul lt!149473 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102725 (or (= lt!149473 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!149473 #b0000000000000000000000000000000000000000000000000000000000001000) lt!149473)))))

(assert (=> b!102725 (= lt!149473 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149256)))))))

(assert (= (and d!31876 res!84491) b!102724))

(assert (= (and b!102724 res!84490) b!102725))

(declare-fun m!149691 () Bool)

(assert (=> d!31876 m!149691))

(declare-fun m!149693 () Bool)

(assert (=> d!31876 m!149693))

(assert (=> b!102615 d!31876))

(declare-fun d!31880 () Bool)

(declare-fun e!67240 () Bool)

(assert (=> d!31880 e!67240))

(declare-fun res!84493 () Bool)

(assert (=> d!31880 (=> (not res!84493) (not e!67240))))

(declare-fun lt!149476 () (_ BitVec 64))

(declare-fun lt!149478 () (_ BitVec 64))

(declare-fun lt!149477 () (_ BitVec 64))

(assert (=> d!31880 (= res!84493 (= lt!149478 (bvsub lt!149476 lt!149477)))))

(assert (=> d!31880 (or (= (bvand lt!149476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149477 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149476 lt!149477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31880 (= lt!149477 (remainingBits!0 ((_ sign_extend 32) (size!2197 (buf!2557 thiss!1305))) ((_ sign_extend 32) (currentByte!5030 thiss!1305)) ((_ sign_extend 32) (currentBit!5025 thiss!1305))))))

(declare-fun lt!149474 () (_ BitVec 64))

(declare-fun lt!149475 () (_ BitVec 64))

(assert (=> d!31880 (= lt!149476 (bvmul lt!149474 lt!149475))))

(assert (=> d!31880 (or (= lt!149474 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!149475 (bvsdiv (bvmul lt!149474 lt!149475) lt!149474)))))

(assert (=> d!31880 (= lt!149475 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31880 (= lt!149474 ((_ sign_extend 32) (size!2197 (buf!2557 thiss!1305))))))

(assert (=> d!31880 (= lt!149478 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5030 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5025 thiss!1305))))))

(assert (=> d!31880 (invariant!0 (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305) (size!2197 (buf!2557 thiss!1305)))))

(assert (=> d!31880 (= (bitIndex!0 (size!2197 (buf!2557 thiss!1305)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305)) lt!149478)))

(declare-fun b!102726 () Bool)

(declare-fun res!84492 () Bool)

(assert (=> b!102726 (=> (not res!84492) (not e!67240))))

(assert (=> b!102726 (= res!84492 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!149478))))

(declare-fun b!102727 () Bool)

(declare-fun lt!149479 () (_ BitVec 64))

(assert (=> b!102727 (= e!67240 (bvsle lt!149478 (bvmul lt!149479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102727 (or (= lt!149479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!149479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!149479)))))

(assert (=> b!102727 (= lt!149479 ((_ sign_extend 32) (size!2197 (buf!2557 thiss!1305))))))

(assert (= (and d!31880 res!84493) b!102726))

(assert (= (and b!102726 res!84492) b!102727))

(assert (=> d!31880 m!149687))

(declare-fun m!149695 () Bool)

(assert (=> d!31880 m!149695))

(assert (=> b!102615 d!31880))

(declare-fun d!31882 () Bool)

(declare-datatypes ((tuple2!8422 0))(
  ( (tuple2!8423 (_1!4466 Bool) (_2!4466 BitStream!3868)) )
))
(declare-fun lt!149482 () tuple2!8422)

(declare-fun readBit!0 (BitStream!3868) tuple2!8422)

(assert (=> d!31882 (= lt!149482 (readBit!0 (readerFrom!0 (_2!4454 lt!149256) (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305))))))

(assert (=> d!31882 (= (readBitPure!0 (readerFrom!0 (_2!4454 lt!149256) (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305))) (tuple2!8403 (_2!4466 lt!149482) (_1!4466 lt!149482)))))

(declare-fun bs!7823 () Bool)

(assert (= bs!7823 d!31882))

(assert (=> bs!7823 m!149463))

(declare-fun m!149697 () Bool)

(assert (=> bs!7823 m!149697))

(assert (=> b!102617 d!31882))

(declare-fun d!31884 () Bool)

(declare-fun e!67243 () Bool)

(assert (=> d!31884 e!67243))

(declare-fun res!84497 () Bool)

(assert (=> d!31884 (=> (not res!84497) (not e!67243))))

(assert (=> d!31884 (= res!84497 (invariant!0 (currentBit!5025 (_2!4454 lt!149256)) (currentByte!5030 (_2!4454 lt!149256)) (size!2197 (buf!2557 (_2!4454 lt!149256)))))))

(assert (=> d!31884 (= (readerFrom!0 (_2!4454 lt!149256) (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305)) (BitStream!3869 (buf!2557 (_2!4454 lt!149256)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305)))))

(declare-fun b!102730 () Bool)

(assert (=> b!102730 (= e!67243 (invariant!0 (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305) (size!2197 (buf!2557 (_2!4454 lt!149256)))))))

(assert (= (and d!31884 res!84497) b!102730))

(assert (=> d!31884 m!149693))

(assert (=> b!102730 m!149515))

(assert (=> b!102617 d!31884))

(declare-fun d!31886 () Bool)

(assert (=> d!31886 (= (invariant!0 (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305) (size!2197 (buf!2557 (_2!4454 lt!149243)))) (and (bvsge (currentBit!5025 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5025 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5030 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5030 thiss!1305) (size!2197 (buf!2557 (_2!4454 lt!149243)))) (and (= (currentBit!5025 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5030 thiss!1305) (size!2197 (buf!2557 (_2!4454 lt!149243))))))))))

(assert (=> b!102614 d!31886))

(declare-fun d!31888 () Bool)

(declare-fun e!67244 () Bool)

(assert (=> d!31888 e!67244))

(declare-fun res!84499 () Bool)

(assert (=> d!31888 (=> (not res!84499) (not e!67244))))

(declare-fun lt!149486 () (_ BitVec 64))

(declare-fun lt!149487 () (_ BitVec 64))

(declare-fun lt!149485 () (_ BitVec 64))

(assert (=> d!31888 (= res!84499 (= lt!149487 (bvsub lt!149485 lt!149486)))))

(assert (=> d!31888 (or (= (bvand lt!149485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149486 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149485 lt!149486) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31888 (= lt!149486 (remainingBits!0 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4456 lt!149257)))) ((_ sign_extend 32) (currentByte!5030 (_1!4456 lt!149257))) ((_ sign_extend 32) (currentBit!5025 (_1!4456 lt!149257)))))))

(declare-fun lt!149483 () (_ BitVec 64))

(declare-fun lt!149484 () (_ BitVec 64))

(assert (=> d!31888 (= lt!149485 (bvmul lt!149483 lt!149484))))

(assert (=> d!31888 (or (= lt!149483 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!149484 (bvsdiv (bvmul lt!149483 lt!149484) lt!149483)))))

(assert (=> d!31888 (= lt!149484 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31888 (= lt!149483 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4456 lt!149257)))))))

(assert (=> d!31888 (= lt!149487 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5030 (_1!4456 lt!149257))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5025 (_1!4456 lt!149257)))))))

(assert (=> d!31888 (invariant!0 (currentBit!5025 (_1!4456 lt!149257)) (currentByte!5030 (_1!4456 lt!149257)) (size!2197 (buf!2557 (_1!4456 lt!149257))))))

(assert (=> d!31888 (= (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!149257))) (currentByte!5030 (_1!4456 lt!149257)) (currentBit!5025 (_1!4456 lt!149257))) lt!149487)))

(declare-fun b!102731 () Bool)

(declare-fun res!84498 () Bool)

(assert (=> b!102731 (=> (not res!84498) (not e!67244))))

(assert (=> b!102731 (= res!84498 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!149487))))

(declare-fun b!102732 () Bool)

(declare-fun lt!149488 () (_ BitVec 64))

(assert (=> b!102732 (= e!67244 (bvsle lt!149487 (bvmul lt!149488 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102732 (or (= lt!149488 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!149488 #b0000000000000000000000000000000000000000000000000000000000001000) lt!149488)))))

(assert (=> b!102732 (= lt!149488 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4456 lt!149257)))))))

(assert (= (and d!31888 res!84499) b!102731))

(assert (= (and b!102731 res!84498) b!102732))

(declare-fun m!149699 () Bool)

(assert (=> d!31888 m!149699))

(declare-fun m!149701 () Bool)

(assert (=> d!31888 m!149701))

(assert (=> b!102610 d!31888))

(declare-fun d!31890 () Bool)

(assert (=> d!31890 (= (invariant!0 (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305) (size!2197 (buf!2557 (_2!4454 lt!149256)))) (and (bvsge (currentBit!5025 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5025 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5030 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5030 thiss!1305) (size!2197 (buf!2557 (_2!4454 lt!149256)))) (and (= (currentBit!5025 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5030 thiss!1305) (size!2197 (buf!2557 (_2!4454 lt!149256))))))))))

(assert (=> b!102611 d!31890))

(declare-fun d!31892 () Bool)

(declare-fun res!84507 () Bool)

(declare-fun e!67250 () Bool)

(assert (=> d!31892 (=> (not res!84507) (not e!67250))))

(assert (=> d!31892 (= res!84507 (= (size!2197 (buf!2557 thiss!1305)) (size!2197 (buf!2557 (_2!4454 lt!149256)))))))

(assert (=> d!31892 (= (isPrefixOf!0 thiss!1305 (_2!4454 lt!149256)) e!67250)))

(declare-fun b!102739 () Bool)

(declare-fun res!84508 () Bool)

(assert (=> b!102739 (=> (not res!84508) (not e!67250))))

(assert (=> b!102739 (= res!84508 (bvsle (bitIndex!0 (size!2197 (buf!2557 thiss!1305)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305)) (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149256))) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256)))))))

(declare-fun b!102740 () Bool)

(declare-fun e!67249 () Bool)

(assert (=> b!102740 (= e!67250 e!67249)))

(declare-fun res!84506 () Bool)

(assert (=> b!102740 (=> res!84506 e!67249)))

(assert (=> b!102740 (= res!84506 (= (size!2197 (buf!2557 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!102741 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4812 array!4812 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102741 (= e!67249 (arrayBitRangesEq!0 (buf!2557 thiss!1305) (buf!2557 (_2!4454 lt!149256)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2197 (buf!2557 thiss!1305)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305))))))

(assert (= (and d!31892 res!84507) b!102739))

(assert (= (and b!102739 res!84508) b!102740))

(assert (= (and b!102740 (not res!84506)) b!102741))

(assert (=> b!102739 m!149509))

(assert (=> b!102739 m!149507))

(assert (=> b!102741 m!149509))

(assert (=> b!102741 m!149509))

(declare-fun m!149703 () Bool)

(assert (=> b!102741 m!149703))

(assert (=> b!102608 d!31892))

(declare-fun d!31894 () Bool)

(assert (=> d!31894 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!102618 d!31894))

(declare-fun d!31896 () Bool)

(declare-fun lt!149489 () tuple2!8422)

(assert (=> d!31896 (= lt!149489 (readBit!0 (_1!4455 lt!149258)))))

(assert (=> d!31896 (= (readBitPure!0 (_1!4455 lt!149258)) (tuple2!8403 (_2!4466 lt!149489) (_1!4466 lt!149489)))))

(declare-fun bs!7824 () Bool)

(assert (= bs!7824 d!31896))

(declare-fun m!149705 () Bool)

(assert (=> bs!7824 m!149705))

(assert (=> b!102618 d!31896))

(declare-fun d!31898 () Bool)

(declare-fun e!67251 () Bool)

(assert (=> d!31898 e!67251))

(declare-fun res!84510 () Bool)

(assert (=> d!31898 (=> (not res!84510) (not e!67251))))

(declare-fun lt!149494 () (_ BitVec 64))

(declare-fun lt!149492 () (_ BitVec 64))

(declare-fun lt!149493 () (_ BitVec 64))

(assert (=> d!31898 (= res!84510 (= lt!149494 (bvsub lt!149492 lt!149493)))))

(assert (=> d!31898 (or (= (bvand lt!149492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149492 lt!149493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31898 (= lt!149493 (remainingBits!0 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4456 lt!149253)))) ((_ sign_extend 32) (currentByte!5030 (_1!4456 lt!149253))) ((_ sign_extend 32) (currentBit!5025 (_1!4456 lt!149253)))))))

(declare-fun lt!149490 () (_ BitVec 64))

(declare-fun lt!149491 () (_ BitVec 64))

(assert (=> d!31898 (= lt!149492 (bvmul lt!149490 lt!149491))))

(assert (=> d!31898 (or (= lt!149490 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!149491 (bvsdiv (bvmul lt!149490 lt!149491) lt!149490)))))

(assert (=> d!31898 (= lt!149491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31898 (= lt!149490 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4456 lt!149253)))))))

(assert (=> d!31898 (= lt!149494 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5030 (_1!4456 lt!149253))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5025 (_1!4456 lt!149253)))))))

(assert (=> d!31898 (invariant!0 (currentBit!5025 (_1!4456 lt!149253)) (currentByte!5030 (_1!4456 lt!149253)) (size!2197 (buf!2557 (_1!4456 lt!149253))))))

(assert (=> d!31898 (= (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!149253))) (currentByte!5030 (_1!4456 lt!149253)) (currentBit!5025 (_1!4456 lt!149253))) lt!149494)))

(declare-fun b!102742 () Bool)

(declare-fun res!84509 () Bool)

(assert (=> b!102742 (=> (not res!84509) (not e!67251))))

(assert (=> b!102742 (= res!84509 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!149494))))

(declare-fun b!102743 () Bool)

(declare-fun lt!149495 () (_ BitVec 64))

(assert (=> b!102743 (= e!67251 (bvsle lt!149494 (bvmul lt!149495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102743 (or (= lt!149495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!149495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!149495)))))

(assert (=> b!102743 (= lt!149495 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4456 lt!149253)))))))

(assert (= (and d!31898 res!84510) b!102742))

(assert (= (and b!102742 res!84509) b!102743))

(declare-fun m!149707 () Bool)

(assert (=> d!31898 m!149707))

(declare-fun m!149709 () Bool)

(assert (=> d!31898 m!149709))

(assert (=> b!102618 d!31898))

(declare-fun d!31900 () Bool)

(assert (=> d!31900 (isPrefixOf!0 thiss!1305 (_2!4454 lt!149243))))

(declare-fun lt!149498 () Unit!6290)

(declare-fun choose!30 (BitStream!3868 BitStream!3868 BitStream!3868) Unit!6290)

(assert (=> d!31900 (= lt!149498 (choose!30 thiss!1305 (_2!4454 lt!149256) (_2!4454 lt!149243)))))

(assert (=> d!31900 (isPrefixOf!0 thiss!1305 (_2!4454 lt!149256))))

(assert (=> d!31900 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4454 lt!149256) (_2!4454 lt!149243)) lt!149498)))

(declare-fun bs!7825 () Bool)

(assert (= bs!7825 d!31900))

(assert (=> bs!7825 m!149485))

(declare-fun m!149711 () Bool)

(assert (=> bs!7825 m!149711))

(assert (=> bs!7825 m!149457))

(assert (=> b!102618 d!31900))

(declare-fun d!31902 () Bool)

(declare-datatypes ((tuple2!8424 0))(
  ( (tuple2!8425 (_1!4467 (_ BitVec 64)) (_2!4467 BitStream!3868)) )
))
(declare-fun lt!149501 () tuple2!8424)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8424)

(assert (=> d!31902 (= lt!149501 (readNLeastSignificantBitsLoop!0 (_1!4455 lt!149258) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!31902 (= (readNLeastSignificantBitsLoopPure!0 (_1!4455 lt!149258) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!8405 (_2!4467 lt!149501) (_1!4467 lt!149501)))))

(declare-fun bs!7826 () Bool)

(assert (= bs!7826 d!31902))

(declare-fun m!149713 () Bool)

(assert (=> bs!7826 m!149713))

(assert (=> b!102618 d!31902))

(declare-fun d!31904 () Bool)

(declare-fun e!67256 () Bool)

(assert (=> d!31904 e!67256))

(declare-fun res!84517 () Bool)

(assert (=> d!31904 (=> (not res!84517) (not e!67256))))

(declare-fun lt!149558 () tuple2!8400)

(assert (=> d!31904 (= res!84517 (isPrefixOf!0 (_1!4455 lt!149558) (_2!4455 lt!149558)))))

(declare-fun lt!149561 () BitStream!3868)

(assert (=> d!31904 (= lt!149558 (tuple2!8401 lt!149561 (_2!4454 lt!149243)))))

(declare-fun lt!149543 () Unit!6290)

(declare-fun lt!149551 () Unit!6290)

(assert (=> d!31904 (= lt!149543 lt!149551)))

(assert (=> d!31904 (isPrefixOf!0 lt!149561 (_2!4454 lt!149243))))

(assert (=> d!31904 (= lt!149551 (lemmaIsPrefixTransitive!0 lt!149561 (_2!4454 lt!149243) (_2!4454 lt!149243)))))

(declare-fun lt!149559 () Unit!6290)

(declare-fun lt!149552 () Unit!6290)

(assert (=> d!31904 (= lt!149559 lt!149552)))

(assert (=> d!31904 (isPrefixOf!0 lt!149561 (_2!4454 lt!149243))))

(assert (=> d!31904 (= lt!149552 (lemmaIsPrefixTransitive!0 lt!149561 thiss!1305 (_2!4454 lt!149243)))))

(declare-fun lt!149542 () Unit!6290)

(declare-fun e!67257 () Unit!6290)

(assert (=> d!31904 (= lt!149542 e!67257)))

(declare-fun c!6362 () Bool)

(assert (=> d!31904 (= c!6362 (not (= (size!2197 (buf!2557 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!149546 () Unit!6290)

(declare-fun lt!149555 () Unit!6290)

(assert (=> d!31904 (= lt!149546 lt!149555)))

(assert (=> d!31904 (isPrefixOf!0 (_2!4454 lt!149243) (_2!4454 lt!149243))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3868) Unit!6290)

(assert (=> d!31904 (= lt!149555 (lemmaIsPrefixRefl!0 (_2!4454 lt!149243)))))

(declare-fun lt!149550 () Unit!6290)

(declare-fun lt!149549 () Unit!6290)

(assert (=> d!31904 (= lt!149550 lt!149549)))

(assert (=> d!31904 (= lt!149549 (lemmaIsPrefixRefl!0 (_2!4454 lt!149243)))))

(declare-fun lt!149560 () Unit!6290)

(declare-fun lt!149553 () Unit!6290)

(assert (=> d!31904 (= lt!149560 lt!149553)))

(assert (=> d!31904 (isPrefixOf!0 lt!149561 lt!149561)))

(assert (=> d!31904 (= lt!149553 (lemmaIsPrefixRefl!0 lt!149561))))

(declare-fun lt!149544 () Unit!6290)

(declare-fun lt!149557 () Unit!6290)

(assert (=> d!31904 (= lt!149544 lt!149557)))

(assert (=> d!31904 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31904 (= lt!149557 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31904 (= lt!149561 (BitStream!3869 (buf!2557 (_2!4454 lt!149243)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305)))))

(assert (=> d!31904 (isPrefixOf!0 thiss!1305 (_2!4454 lt!149243))))

(assert (=> d!31904 (= (reader!0 thiss!1305 (_2!4454 lt!149243)) lt!149558)))

(declare-fun b!102754 () Bool)

(declare-fun res!84519 () Bool)

(assert (=> b!102754 (=> (not res!84519) (not e!67256))))

(assert (=> b!102754 (= res!84519 (isPrefixOf!0 (_2!4455 lt!149558) (_2!4454 lt!149243)))))

(declare-fun b!102755 () Bool)

(declare-fun Unit!6296 () Unit!6290)

(assert (=> b!102755 (= e!67257 Unit!6296)))

(declare-fun b!102756 () Bool)

(declare-fun res!84518 () Bool)

(assert (=> b!102756 (=> (not res!84518) (not e!67256))))

(assert (=> b!102756 (= res!84518 (isPrefixOf!0 (_1!4455 lt!149558) thiss!1305))))

(declare-fun b!102757 () Bool)

(declare-fun lt!149556 () Unit!6290)

(assert (=> b!102757 (= e!67257 lt!149556)))

(declare-fun lt!149554 () (_ BitVec 64))

(assert (=> b!102757 (= lt!149554 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!149547 () (_ BitVec 64))

(assert (=> b!102757 (= lt!149547 (bitIndex!0 (size!2197 (buf!2557 thiss!1305)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4812 array!4812 (_ BitVec 64) (_ BitVec 64)) Unit!6290)

(assert (=> b!102757 (= lt!149556 (arrayBitRangesEqSymmetric!0 (buf!2557 thiss!1305) (buf!2557 (_2!4454 lt!149243)) lt!149554 lt!149547))))

(assert (=> b!102757 (arrayBitRangesEq!0 (buf!2557 (_2!4454 lt!149243)) (buf!2557 thiss!1305) lt!149554 lt!149547)))

(declare-fun lt!149548 () (_ BitVec 64))

(declare-fun b!102758 () Bool)

(declare-fun lt!149545 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3868 (_ BitVec 64)) BitStream!3868)

(assert (=> b!102758 (= e!67256 (= (_1!4455 lt!149558) (withMovedBitIndex!0 (_2!4455 lt!149558) (bvsub lt!149545 lt!149548))))))

(assert (=> b!102758 (or (= (bvand lt!149545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149548 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149545 lt!149548) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102758 (= lt!149548 (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149243))) (currentByte!5030 (_2!4454 lt!149243)) (currentBit!5025 (_2!4454 lt!149243))))))

(assert (=> b!102758 (= lt!149545 (bitIndex!0 (size!2197 (buf!2557 thiss!1305)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305)))))

(assert (= (and d!31904 c!6362) b!102757))

(assert (= (and d!31904 (not c!6362)) b!102755))

(assert (= (and d!31904 res!84517) b!102756))

(assert (= (and b!102756 res!84518) b!102754))

(assert (= (and b!102754 res!84519) b!102758))

(declare-fun m!149715 () Bool)

(assert (=> d!31904 m!149715))

(declare-fun m!149717 () Bool)

(assert (=> d!31904 m!149717))

(declare-fun m!149719 () Bool)

(assert (=> d!31904 m!149719))

(declare-fun m!149721 () Bool)

(assert (=> d!31904 m!149721))

(declare-fun m!149723 () Bool)

(assert (=> d!31904 m!149723))

(declare-fun m!149725 () Bool)

(assert (=> d!31904 m!149725))

(declare-fun m!149727 () Bool)

(assert (=> d!31904 m!149727))

(declare-fun m!149729 () Bool)

(assert (=> d!31904 m!149729))

(declare-fun m!149731 () Bool)

(assert (=> d!31904 m!149731))

(assert (=> d!31904 m!149485))

(declare-fun m!149733 () Bool)

(assert (=> d!31904 m!149733))

(declare-fun m!149735 () Bool)

(assert (=> b!102754 m!149735))

(assert (=> b!102757 m!149509))

(declare-fun m!149737 () Bool)

(assert (=> b!102757 m!149737))

(declare-fun m!149739 () Bool)

(assert (=> b!102757 m!149739))

(declare-fun m!149741 () Bool)

(assert (=> b!102756 m!149741))

(declare-fun m!149743 () Bool)

(assert (=> b!102758 m!149743))

(declare-fun m!149745 () Bool)

(assert (=> b!102758 m!149745))

(assert (=> b!102758 m!149509))

(assert (=> b!102618 d!31904))

(declare-fun d!31906 () Bool)

(declare-fun e!67258 () Bool)

(assert (=> d!31906 e!67258))

(declare-fun res!84521 () Bool)

(assert (=> d!31906 (=> (not res!84521) (not e!67258))))

(declare-fun lt!149564 () (_ BitVec 64))

(declare-fun lt!149565 () (_ BitVec 64))

(declare-fun lt!149566 () (_ BitVec 64))

(assert (=> d!31906 (= res!84521 (= lt!149566 (bvsub lt!149564 lt!149565)))))

(assert (=> d!31906 (or (= (bvand lt!149564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149565 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149564 lt!149565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31906 (= lt!149565 (remainingBits!0 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4456 lt!149249)))) ((_ sign_extend 32) (currentByte!5030 (_1!4456 lt!149249))) ((_ sign_extend 32) (currentBit!5025 (_1!4456 lt!149249)))))))

(declare-fun lt!149562 () (_ BitVec 64))

(declare-fun lt!149563 () (_ BitVec 64))

(assert (=> d!31906 (= lt!149564 (bvmul lt!149562 lt!149563))))

(assert (=> d!31906 (or (= lt!149562 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!149563 (bvsdiv (bvmul lt!149562 lt!149563) lt!149562)))))

(assert (=> d!31906 (= lt!149563 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31906 (= lt!149562 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4456 lt!149249)))))))

(assert (=> d!31906 (= lt!149566 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5030 (_1!4456 lt!149249))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5025 (_1!4456 lt!149249)))))))

(assert (=> d!31906 (invariant!0 (currentBit!5025 (_1!4456 lt!149249)) (currentByte!5030 (_1!4456 lt!149249)) (size!2197 (buf!2557 (_1!4456 lt!149249))))))

(assert (=> d!31906 (= (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!149249))) (currentByte!5030 (_1!4456 lt!149249)) (currentBit!5025 (_1!4456 lt!149249))) lt!149566)))

(declare-fun b!102759 () Bool)

(declare-fun res!84520 () Bool)

(assert (=> b!102759 (=> (not res!84520) (not e!67258))))

(assert (=> b!102759 (= res!84520 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!149566))))

(declare-fun b!102760 () Bool)

(declare-fun lt!149567 () (_ BitVec 64))

(assert (=> b!102760 (= e!67258 (bvsle lt!149566 (bvmul lt!149567 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102760 (or (= lt!149567 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!149567 #b0000000000000000000000000000000000000000000000000000000000001000) lt!149567)))))

(assert (=> b!102760 (= lt!149567 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4456 lt!149249)))))))

(assert (= (and d!31906 res!84521) b!102759))

(assert (= (and b!102759 res!84520) b!102760))

(declare-fun m!149747 () Bool)

(assert (=> d!31906 m!149747))

(declare-fun m!149749 () Bool)

(assert (=> d!31906 m!149749))

(assert (=> b!102618 d!31906))

(declare-fun d!31908 () Bool)

(declare-fun lt!149568 () tuple2!8422)

(assert (=> d!31908 (= lt!149568 (readBit!0 (BitStream!3869 (buf!2557 (_2!4454 lt!149243)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305))))))

(assert (=> d!31908 (= (readBitPure!0 (BitStream!3869 (buf!2557 (_2!4454 lt!149243)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305))) (tuple2!8403 (_2!4466 lt!149568) (_1!4466 lt!149568)))))

(declare-fun bs!7827 () Bool)

(assert (= bs!7827 d!31908))

(declare-fun m!149751 () Bool)

(assert (=> bs!7827 m!149751))

(assert (=> b!102618 d!31908))

(declare-fun d!31910 () Bool)

(assert (=> d!31910 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149243)))) ((_ sign_extend 32) (currentByte!5030 thiss!1305)) ((_ sign_extend 32) (currentBit!5025 thiss!1305)) lt!149247) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149243)))) ((_ sign_extend 32) (currentByte!5030 thiss!1305)) ((_ sign_extend 32) (currentBit!5025 thiss!1305))) lt!149247))))

(declare-fun bs!7828 () Bool)

(assert (= bs!7828 d!31910))

(declare-fun m!149753 () Bool)

(assert (=> bs!7828 m!149753))

(assert (=> b!102618 d!31910))

(declare-fun b!102843 () Bool)

(declare-fun e!67308 () (_ BitVec 64))

(assert (=> b!102843 (= e!67308 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!102844 () Bool)

(declare-fun res!84591 () Bool)

(declare-fun e!67307 () Bool)

(assert (=> b!102844 (=> (not res!84591) (not e!67307))))

(declare-fun lt!149807 () (_ BitVec 64))

(declare-fun lt!149802 () tuple2!8398)

(declare-fun lt!149841 () (_ BitVec 64))

(assert (=> b!102844 (= res!84591 (= (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149802))) (currentByte!5030 (_2!4454 lt!149802)) (currentBit!5025 (_2!4454 lt!149802))) (bvadd lt!149841 lt!149807)))))

(assert (=> b!102844 (or (not (= (bvand lt!149841 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149807 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!149841 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!149841 lt!149807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102844 (= lt!149807 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!102844 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!102844 (= lt!149841 (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149256))) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256))))))

(declare-fun b!102845 () Bool)

(declare-fun lt!149830 () tuple2!8402)

(declare-fun lt!149820 () tuple2!8398)

(assert (=> b!102845 (= lt!149830 (readBitPure!0 (readerFrom!0 (_2!4454 lt!149820) (currentBit!5025 (_2!4454 lt!149256)) (currentByte!5030 (_2!4454 lt!149256)))))))

(declare-fun res!84595 () Bool)

(declare-fun lt!149803 () Bool)

(assert (=> b!102845 (= res!84595 (and (= (_2!4456 lt!149830) lt!149803) (= (_1!4456 lt!149830) (_2!4454 lt!149820))))))

(declare-fun e!67310 () Bool)

(assert (=> b!102845 (=> (not res!84595) (not e!67310))))

(declare-fun e!67311 () Bool)

(assert (=> b!102845 (= e!67311 e!67310)))

(declare-fun b!102846 () Bool)

(declare-fun e!67309 () tuple2!8398)

(declare-fun lt!149832 () tuple2!8398)

(declare-fun Unit!6297 () Unit!6290)

(assert (=> b!102846 (= e!67309 (tuple2!8399 Unit!6297 (_2!4454 lt!149832)))))

(assert (=> b!102846 (= lt!149803 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102846 (= lt!149820 (appendBit!0 (_2!4454 lt!149256) lt!149803))))

(declare-fun res!84589 () Bool)

(assert (=> b!102846 (= res!84589 (= (size!2197 (buf!2557 (_2!4454 lt!149256))) (size!2197 (buf!2557 (_2!4454 lt!149820)))))))

(assert (=> b!102846 (=> (not res!84589) (not e!67311))))

(assert (=> b!102846 e!67311))

(declare-fun lt!149835 () tuple2!8398)

(assert (=> b!102846 (= lt!149835 lt!149820)))

(assert (=> b!102846 (= lt!149832 (appendNLeastSignificantBitsLoop!0 (_2!4454 lt!149835) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!149800 () Unit!6290)

(assert (=> b!102846 (= lt!149800 (lemmaIsPrefixTransitive!0 (_2!4454 lt!149256) (_2!4454 lt!149835) (_2!4454 lt!149832)))))

(assert (=> b!102846 (isPrefixOf!0 (_2!4454 lt!149256) (_2!4454 lt!149832))))

(declare-fun lt!149809 () Unit!6290)

(assert (=> b!102846 (= lt!149809 lt!149800)))

(assert (=> b!102846 (invariant!0 (currentBit!5025 (_2!4454 lt!149256)) (currentByte!5030 (_2!4454 lt!149256)) (size!2197 (buf!2557 (_2!4454 lt!149835))))))

(declare-fun lt!149844 () BitStream!3868)

(assert (=> b!102846 (= lt!149844 (BitStream!3869 (buf!2557 (_2!4454 lt!149835)) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256))))))

(assert (=> b!102846 (invariant!0 (currentBit!5025 lt!149844) (currentByte!5030 lt!149844) (size!2197 (buf!2557 (_2!4454 lt!149832))))))

(declare-fun lt!149808 () BitStream!3868)

(assert (=> b!102846 (= lt!149808 (BitStream!3869 (buf!2557 (_2!4454 lt!149832)) (currentByte!5030 lt!149844) (currentBit!5025 lt!149844)))))

(declare-fun lt!149813 () tuple2!8402)

(assert (=> b!102846 (= lt!149813 (readBitPure!0 lt!149844))))

(declare-fun lt!149829 () tuple2!8402)

(assert (=> b!102846 (= lt!149829 (readBitPure!0 lt!149808))))

(declare-fun lt!149817 () Unit!6290)

(assert (=> b!102846 (= lt!149817 (readBitPrefixLemma!0 lt!149844 (_2!4454 lt!149832)))))

(declare-fun res!84593 () Bool)

(assert (=> b!102846 (= res!84593 (= (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!149813))) (currentByte!5030 (_1!4456 lt!149813)) (currentBit!5025 (_1!4456 lt!149813))) (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!149829))) (currentByte!5030 (_1!4456 lt!149829)) (currentBit!5025 (_1!4456 lt!149829)))))))

(declare-fun e!67312 () Bool)

(assert (=> b!102846 (=> (not res!84593) (not e!67312))))

(assert (=> b!102846 e!67312))

(declare-fun lt!149822 () Unit!6290)

(assert (=> b!102846 (= lt!149822 lt!149817)))

(declare-fun lt!149834 () tuple2!8400)

(assert (=> b!102846 (= lt!149834 (reader!0 (_2!4454 lt!149256) (_2!4454 lt!149832)))))

(declare-fun lt!149814 () tuple2!8400)

(assert (=> b!102846 (= lt!149814 (reader!0 (_2!4454 lt!149835) (_2!4454 lt!149832)))))

(declare-fun lt!149818 () tuple2!8402)

(assert (=> b!102846 (= lt!149818 (readBitPure!0 (_1!4455 lt!149834)))))

(assert (=> b!102846 (= (_2!4456 lt!149818) lt!149803)))

(declare-fun lt!149838 () Unit!6290)

(declare-fun Unit!6299 () Unit!6290)

(assert (=> b!102846 (= lt!149838 Unit!6299)))

(declare-fun lt!149823 () (_ BitVec 64))

(assert (=> b!102846 (= lt!149823 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!149828 () (_ BitVec 64))

(assert (=> b!102846 (= lt!149828 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!149821 () Unit!6290)

(assert (=> b!102846 (= lt!149821 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4454 lt!149256) (buf!2557 (_2!4454 lt!149832)) lt!149828))))

(assert (=> b!102846 (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149832)))) ((_ sign_extend 32) (currentByte!5030 (_2!4454 lt!149256))) ((_ sign_extend 32) (currentBit!5025 (_2!4454 lt!149256))) lt!149828)))

(declare-fun lt!149826 () Unit!6290)

(assert (=> b!102846 (= lt!149826 lt!149821)))

(declare-fun lt!149825 () tuple2!8404)

(assert (=> b!102846 (= lt!149825 (readNLeastSignificantBitsLoopPure!0 (_1!4455 lt!149834) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!149823))))

(declare-fun lt!149843 () (_ BitVec 64))

(assert (=> b!102846 (= lt!149843 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!149836 () Unit!6290)

(assert (=> b!102846 (= lt!149836 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4454 lt!149835) (buf!2557 (_2!4454 lt!149832)) lt!149843))))

(assert (=> b!102846 (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149832)))) ((_ sign_extend 32) (currentByte!5030 (_2!4454 lt!149835))) ((_ sign_extend 32) (currentBit!5025 (_2!4454 lt!149835))) lt!149843)))

(declare-fun lt!149840 () Unit!6290)

(assert (=> b!102846 (= lt!149840 lt!149836)))

(declare-fun lt!149837 () tuple2!8404)

(assert (=> b!102846 (= lt!149837 (readNLeastSignificantBitsLoopPure!0 (_1!4455 lt!149814) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!149823 (ite (_2!4456 lt!149818) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!149833 () tuple2!8404)

(assert (=> b!102846 (= lt!149833 (readNLeastSignificantBitsLoopPure!0 (_1!4455 lt!149834) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!149823))))

(declare-fun c!6371 () Bool)

(assert (=> b!102846 (= c!6371 (_2!4456 (readBitPure!0 (_1!4455 lt!149834))))))

(declare-fun lt!149806 () tuple2!8404)

(assert (=> b!102846 (= lt!149806 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4455 lt!149834) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!149823 e!67308)))))

(declare-fun lt!149801 () Unit!6290)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6290)

(assert (=> b!102846 (= lt!149801 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4455 lt!149834) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!149823))))

(assert (=> b!102846 (and (= (_2!4457 lt!149833) (_2!4457 lt!149806)) (= (_1!4457 lt!149833) (_1!4457 lt!149806)))))

(declare-fun lt!149839 () Unit!6290)

(assert (=> b!102846 (= lt!149839 lt!149801)))

(assert (=> b!102846 (= (_1!4455 lt!149834) (withMovedBitIndex!0 (_2!4455 lt!149834) (bvsub (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149256))) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256))) (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149832))) (currentByte!5030 (_2!4454 lt!149832)) (currentBit!5025 (_2!4454 lt!149832))))))))

(declare-fun lt!149815 () Unit!6290)

(declare-fun Unit!6300 () Unit!6290)

(assert (=> b!102846 (= lt!149815 Unit!6300)))

(assert (=> b!102846 (= (_1!4455 lt!149814) (withMovedBitIndex!0 (_2!4455 lt!149814) (bvsub (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149835))) (currentByte!5030 (_2!4454 lt!149835)) (currentBit!5025 (_2!4454 lt!149835))) (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149832))) (currentByte!5030 (_2!4454 lt!149832)) (currentBit!5025 (_2!4454 lt!149832))))))))

(declare-fun lt!149819 () Unit!6290)

(declare-fun Unit!6301 () Unit!6290)

(assert (=> b!102846 (= lt!149819 Unit!6301)))

(assert (=> b!102846 (= (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149256))) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256))) (bvsub (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149835))) (currentByte!5030 (_2!4454 lt!149835)) (currentBit!5025 (_2!4454 lt!149835))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!149805 () Unit!6290)

(declare-fun Unit!6302 () Unit!6290)

(assert (=> b!102846 (= lt!149805 Unit!6302)))

(assert (=> b!102846 (= (_2!4457 lt!149825) (_2!4457 lt!149837))))

(declare-fun lt!149827 () Unit!6290)

(declare-fun Unit!6303 () Unit!6290)

(assert (=> b!102846 (= lt!149827 Unit!6303)))

(assert (=> b!102846 (= (_1!4457 lt!149825) (_2!4455 lt!149834))))

(declare-fun lt!149810 () tuple2!8400)

(declare-fun b!102847 () Bool)

(declare-fun lt!149824 () tuple2!8404)

(assert (=> b!102847 (= e!67307 (and (= (_2!4457 lt!149824) v!199) (= (_1!4457 lt!149824) (_2!4455 lt!149810))))))

(declare-fun lt!149816 () (_ BitVec 64))

(assert (=> b!102847 (= lt!149824 (readNLeastSignificantBitsLoopPure!0 (_1!4455 lt!149810) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!149816))))

(declare-fun lt!149831 () Unit!6290)

(declare-fun lt!149812 () Unit!6290)

(assert (=> b!102847 (= lt!149831 lt!149812)))

(declare-fun lt!149804 () (_ BitVec 64))

(assert (=> b!102847 (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149802)))) ((_ sign_extend 32) (currentByte!5030 (_2!4454 lt!149256))) ((_ sign_extend 32) (currentBit!5025 (_2!4454 lt!149256))) lt!149804)))

(assert (=> b!102847 (= lt!149812 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4454 lt!149256) (buf!2557 (_2!4454 lt!149802)) lt!149804))))

(declare-fun e!67313 () Bool)

(assert (=> b!102847 e!67313))

(declare-fun res!84590 () Bool)

(assert (=> b!102847 (=> (not res!84590) (not e!67313))))

(assert (=> b!102847 (= res!84590 (and (= (size!2197 (buf!2557 (_2!4454 lt!149256))) (size!2197 (buf!2557 (_2!4454 lt!149802)))) (bvsge lt!149804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102847 (= lt!149804 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!102847 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!102847 (= lt!149816 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!102847 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!102847 (= lt!149810 (reader!0 (_2!4454 lt!149256) (_2!4454 lt!149802)))))

(declare-fun b!102848 () Bool)

(declare-fun res!84594 () Bool)

(assert (=> b!102848 (= res!84594 (= (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149820))) (currentByte!5030 (_2!4454 lt!149820)) (currentBit!5025 (_2!4454 lt!149820))) (bvadd (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149256))) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!102848 (=> (not res!84594) (not e!67311))))

(declare-fun d!31912 () Bool)

(assert (=> d!31912 e!67307))

(declare-fun res!84596 () Bool)

(assert (=> d!31912 (=> (not res!84596) (not e!67307))))

(assert (=> d!31912 (= res!84596 (= (size!2197 (buf!2557 (_2!4454 lt!149256))) (size!2197 (buf!2557 (_2!4454 lt!149802)))))))

(assert (=> d!31912 (= lt!149802 e!67309)))

(declare-fun c!6372 () Bool)

(assert (=> d!31912 (= c!6372 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31912 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31912 (= (appendNLeastSignificantBitsLoop!0 (_2!4454 lt!149256) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!149802)))

(declare-fun b!102849 () Bool)

(declare-fun res!84597 () Bool)

(assert (=> b!102849 (=> (not res!84597) (not e!67307))))

(assert (=> b!102849 (= res!84597 (isPrefixOf!0 (_2!4454 lt!149256) (_2!4454 lt!149802)))))

(declare-fun b!102850 () Bool)

(assert (=> b!102850 (= e!67313 (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149256)))) ((_ sign_extend 32) (currentByte!5030 (_2!4454 lt!149256))) ((_ sign_extend 32) (currentBit!5025 (_2!4454 lt!149256))) lt!149804))))

(declare-fun b!102851 () Bool)

(assert (=> b!102851 (= e!67312 (= (_2!4456 lt!149813) (_2!4456 lt!149829)))))

(declare-fun b!102852 () Bool)

(declare-fun res!84592 () Bool)

(declare-fun call!1278 () Bool)

(assert (=> b!102852 (= res!84592 call!1278)))

(assert (=> b!102852 (=> (not res!84592) (not e!67311))))

(declare-fun b!102853 () Bool)

(assert (=> b!102853 (= e!67308 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!102854 () Bool)

(assert (=> b!102854 (= e!67310 (= (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!149830))) (currentByte!5030 (_1!4456 lt!149830)) (currentBit!5025 (_1!4456 lt!149830))) (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149820))) (currentByte!5030 (_2!4454 lt!149820)) (currentBit!5025 (_2!4454 lt!149820)))))))

(declare-fun lt!149842 () BitStream!3868)

(declare-fun bm!1275 () Bool)

(assert (=> bm!1275 (= call!1278 (isPrefixOf!0 (ite c!6372 (_2!4454 lt!149256) lt!149842) (ite c!6372 (_2!4454 lt!149820) lt!149842)))))

(declare-fun b!102855 () Bool)

(declare-fun lt!149811 () Unit!6290)

(assert (=> b!102855 (= e!67309 (tuple2!8399 lt!149811 (_2!4454 lt!149256)))))

(assert (=> b!102855 (= lt!149842 (_2!4454 lt!149256))))

(assert (=> b!102855 (= lt!149811 (lemmaIsPrefixRefl!0 lt!149842))))

(assert (=> b!102855 call!1278))

(assert (= (and d!31912 c!6372) b!102846))

(assert (= (and d!31912 (not c!6372)) b!102855))

(assert (= (and b!102846 res!84589) b!102848))

(assert (= (and b!102848 res!84594) b!102852))

(assert (= (and b!102852 res!84592) b!102845))

(assert (= (and b!102845 res!84595) b!102854))

(assert (= (and b!102846 res!84593) b!102851))

(assert (= (and b!102846 c!6371) b!102853))

(assert (= (and b!102846 (not c!6371)) b!102843))

(assert (= (or b!102852 b!102855) bm!1275))

(assert (= (and d!31912 res!84596) b!102844))

(assert (= (and b!102844 res!84591) b!102849))

(assert (= (and b!102849 res!84597) b!102847))

(assert (= (and b!102847 res!84590) b!102850))

(declare-fun m!149791 () Bool)

(assert (=> b!102844 m!149791))

(assert (=> b!102844 m!149507))

(declare-fun m!149793 () Bool)

(assert (=> b!102845 m!149793))

(assert (=> b!102845 m!149793))

(declare-fun m!149795 () Bool)

(assert (=> b!102845 m!149795))

(declare-fun m!149797 () Bool)

(assert (=> bm!1275 m!149797))

(declare-fun m!149799 () Bool)

(assert (=> b!102854 m!149799))

(declare-fun m!149801 () Bool)

(assert (=> b!102854 m!149801))

(declare-fun m!149803 () Bool)

(assert (=> b!102850 m!149803))

(declare-fun m!149805 () Bool)

(assert (=> b!102855 m!149805))

(declare-fun m!149807 () Bool)

(assert (=> b!102847 m!149807))

(declare-fun m!149809 () Bool)

(assert (=> b!102847 m!149809))

(declare-fun m!149811 () Bool)

(assert (=> b!102847 m!149811))

(declare-fun m!149813 () Bool)

(assert (=> b!102847 m!149813))

(declare-fun m!149815 () Bool)

(assert (=> b!102847 m!149815))

(assert (=> b!102848 m!149801))

(assert (=> b!102848 m!149507))

(declare-fun m!149817 () Bool)

(assert (=> b!102846 m!149817))

(declare-fun m!149819 () Bool)

(assert (=> b!102846 m!149819))

(declare-fun m!149821 () Bool)

(assert (=> b!102846 m!149821))

(declare-fun m!149823 () Bool)

(assert (=> b!102846 m!149823))

(declare-fun m!149825 () Bool)

(assert (=> b!102846 m!149825))

(declare-fun m!149827 () Bool)

(assert (=> b!102846 m!149827))

(declare-fun m!149829 () Bool)

(assert (=> b!102846 m!149829))

(declare-fun m!149831 () Bool)

(assert (=> b!102846 m!149831))

(declare-fun m!149833 () Bool)

(assert (=> b!102846 m!149833))

(declare-fun m!149835 () Bool)

(assert (=> b!102846 m!149835))

(assert (=> b!102846 m!149507))

(declare-fun m!149837 () Bool)

(assert (=> b!102846 m!149837))

(declare-fun m!149839 () Bool)

(assert (=> b!102846 m!149839))

(declare-fun m!149841 () Bool)

(assert (=> b!102846 m!149841))

(declare-fun m!149843 () Bool)

(assert (=> b!102846 m!149843))

(assert (=> b!102846 m!149837))

(declare-fun m!149845 () Bool)

(assert (=> b!102846 m!149845))

(declare-fun m!149847 () Bool)

(assert (=> b!102846 m!149847))

(declare-fun m!149849 () Bool)

(assert (=> b!102846 m!149849))

(declare-fun m!149851 () Bool)

(assert (=> b!102846 m!149851))

(declare-fun m!149853 () Bool)

(assert (=> b!102846 m!149853))

(assert (=> b!102846 m!149811))

(declare-fun m!149855 () Bool)

(assert (=> b!102846 m!149855))

(declare-fun m!149857 () Bool)

(assert (=> b!102846 m!149857))

(declare-fun m!149859 () Bool)

(assert (=> b!102846 m!149859))

(declare-fun m!149861 () Bool)

(assert (=> b!102846 m!149861))

(declare-fun m!149863 () Bool)

(assert (=> b!102846 m!149863))

(declare-fun m!149865 () Bool)

(assert (=> b!102846 m!149865))

(declare-fun m!149867 () Bool)

(assert (=> b!102846 m!149867))

(declare-fun m!149869 () Bool)

(assert (=> b!102846 m!149869))

(declare-fun m!149871 () Bool)

(assert (=> b!102849 m!149871))

(assert (=> b!102618 d!31912))

(declare-fun d!31950 () Bool)

(declare-fun lt!149845 () tuple2!8422)

(assert (=> d!31950 (= lt!149845 (readBit!0 lt!149260))))

(assert (=> d!31950 (= (readBitPure!0 lt!149260) (tuple2!8403 (_2!4466 lt!149845) (_1!4466 lt!149845)))))

(declare-fun bs!7833 () Bool)

(assert (= bs!7833 d!31950))

(declare-fun m!149873 () Bool)

(assert (=> bs!7833 m!149873))

(assert (=> b!102618 d!31950))

(declare-fun d!31952 () Bool)

(declare-fun e!67331 () Bool)

(assert (=> d!31952 e!67331))

(declare-fun res!84626 () Bool)

(assert (=> d!31952 (=> (not res!84626) (not e!67331))))

(declare-fun lt!149929 () tuple2!8398)

(assert (=> d!31952 (= res!84626 (= (size!2197 (buf!2557 thiss!1305)) (size!2197 (buf!2557 (_2!4454 lt!149929)))))))

(declare-fun choose!16 (BitStream!3868 Bool) tuple2!8398)

(assert (=> d!31952 (= lt!149929 (choose!16 thiss!1305 lt!149246))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31952 (validate_offset_bit!0 ((_ sign_extend 32) (size!2197 (buf!2557 thiss!1305))) ((_ sign_extend 32) (currentByte!5030 thiss!1305)) ((_ sign_extend 32) (currentBit!5025 thiss!1305)))))

(assert (=> d!31952 (= (appendBit!0 thiss!1305 lt!149246) lt!149929)))

(declare-fun b!102890 () Bool)

(declare-fun res!84624 () Bool)

(assert (=> b!102890 (=> (not res!84624) (not e!67331))))

(declare-fun lt!149928 () (_ BitVec 64))

(declare-fun lt!149930 () (_ BitVec 64))

(assert (=> b!102890 (= res!84624 (= (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149929))) (currentByte!5030 (_2!4454 lt!149929)) (currentBit!5025 (_2!4454 lt!149929))) (bvadd lt!149930 lt!149928)))))

(assert (=> b!102890 (or (not (= (bvand lt!149930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149928 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!149930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!149930 lt!149928) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102890 (= lt!149928 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!102890 (= lt!149930 (bitIndex!0 (size!2197 (buf!2557 thiss!1305)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305)))))

(declare-fun b!102892 () Bool)

(declare-fun e!67332 () Bool)

(assert (=> b!102892 (= e!67331 e!67332)))

(declare-fun res!84625 () Bool)

(assert (=> b!102892 (=> (not res!84625) (not e!67332))))

(declare-fun lt!149925 () tuple2!8402)

(assert (=> b!102892 (= res!84625 (and (= (_2!4456 lt!149925) lt!149246) (= (_1!4456 lt!149925) (_2!4454 lt!149929))))))

(assert (=> b!102892 (= lt!149925 (readBitPure!0 (readerFrom!0 (_2!4454 lt!149929) (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305))))))

(declare-fun b!102891 () Bool)

(declare-fun res!84623 () Bool)

(assert (=> b!102891 (=> (not res!84623) (not e!67331))))

(assert (=> b!102891 (= res!84623 (isPrefixOf!0 thiss!1305 (_2!4454 lt!149929)))))

(declare-fun b!102893 () Bool)

(assert (=> b!102893 (= e!67332 (= (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!149925))) (currentByte!5030 (_1!4456 lt!149925)) (currentBit!5025 (_1!4456 lt!149925))) (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149929))) (currentByte!5030 (_2!4454 lt!149929)) (currentBit!5025 (_2!4454 lt!149929)))))))

(assert (= (and d!31952 res!84626) b!102890))

(assert (= (and b!102890 res!84624) b!102891))

(assert (= (and b!102891 res!84623) b!102892))

(assert (= (and b!102892 res!84625) b!102893))

(declare-fun m!149957 () Bool)

(assert (=> b!102890 m!149957))

(assert (=> b!102890 m!149509))

(declare-fun m!149959 () Bool)

(assert (=> d!31952 m!149959))

(declare-fun m!149961 () Bool)

(assert (=> d!31952 m!149961))

(declare-fun m!149963 () Bool)

(assert (=> b!102893 m!149963))

(assert (=> b!102893 m!149957))

(declare-fun m!149965 () Bool)

(assert (=> b!102891 m!149965))

(declare-fun m!149967 () Bool)

(assert (=> b!102892 m!149967))

(assert (=> b!102892 m!149967))

(declare-fun m!149969 () Bool)

(assert (=> b!102892 m!149969))

(assert (=> b!102618 d!31952))

(declare-fun d!31956 () Bool)

(declare-fun e!67335 () Bool)

(assert (=> d!31956 e!67335))

(declare-fun res!84629 () Bool)

(assert (=> d!31956 (=> (not res!84629) (not e!67335))))

(declare-fun lt!149953 () tuple2!8400)

(assert (=> d!31956 (= res!84629 (isPrefixOf!0 (_1!4455 lt!149953) (_2!4455 lt!149953)))))

(declare-fun lt!149956 () BitStream!3868)

(assert (=> d!31956 (= lt!149953 (tuple2!8401 lt!149956 (_2!4454 lt!149243)))))

(declare-fun lt!149938 () Unit!6290)

(declare-fun lt!149946 () Unit!6290)

(assert (=> d!31956 (= lt!149938 lt!149946)))

(assert (=> d!31956 (isPrefixOf!0 lt!149956 (_2!4454 lt!149243))))

(assert (=> d!31956 (= lt!149946 (lemmaIsPrefixTransitive!0 lt!149956 (_2!4454 lt!149243) (_2!4454 lt!149243)))))

(declare-fun lt!149954 () Unit!6290)

(declare-fun lt!149947 () Unit!6290)

(assert (=> d!31956 (= lt!149954 lt!149947)))

(assert (=> d!31956 (isPrefixOf!0 lt!149956 (_2!4454 lt!149243))))

(assert (=> d!31956 (= lt!149947 (lemmaIsPrefixTransitive!0 lt!149956 (_2!4454 lt!149256) (_2!4454 lt!149243)))))

(declare-fun lt!149937 () Unit!6290)

(declare-fun e!67336 () Unit!6290)

(assert (=> d!31956 (= lt!149937 e!67336)))

(declare-fun c!6377 () Bool)

(assert (=> d!31956 (= c!6377 (not (= (size!2197 (buf!2557 (_2!4454 lt!149256))) #b00000000000000000000000000000000)))))

(declare-fun lt!149941 () Unit!6290)

(declare-fun lt!149950 () Unit!6290)

(assert (=> d!31956 (= lt!149941 lt!149950)))

(assert (=> d!31956 (isPrefixOf!0 (_2!4454 lt!149243) (_2!4454 lt!149243))))

(assert (=> d!31956 (= lt!149950 (lemmaIsPrefixRefl!0 (_2!4454 lt!149243)))))

(declare-fun lt!149945 () Unit!6290)

(declare-fun lt!149944 () Unit!6290)

(assert (=> d!31956 (= lt!149945 lt!149944)))

(assert (=> d!31956 (= lt!149944 (lemmaIsPrefixRefl!0 (_2!4454 lt!149243)))))

(declare-fun lt!149955 () Unit!6290)

(declare-fun lt!149948 () Unit!6290)

(assert (=> d!31956 (= lt!149955 lt!149948)))

(assert (=> d!31956 (isPrefixOf!0 lt!149956 lt!149956)))

(assert (=> d!31956 (= lt!149948 (lemmaIsPrefixRefl!0 lt!149956))))

(declare-fun lt!149939 () Unit!6290)

(declare-fun lt!149952 () Unit!6290)

(assert (=> d!31956 (= lt!149939 lt!149952)))

(assert (=> d!31956 (isPrefixOf!0 (_2!4454 lt!149256) (_2!4454 lt!149256))))

(assert (=> d!31956 (= lt!149952 (lemmaIsPrefixRefl!0 (_2!4454 lt!149256)))))

(assert (=> d!31956 (= lt!149956 (BitStream!3869 (buf!2557 (_2!4454 lt!149243)) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256))))))

(assert (=> d!31956 (isPrefixOf!0 (_2!4454 lt!149256) (_2!4454 lt!149243))))

(assert (=> d!31956 (= (reader!0 (_2!4454 lt!149256) (_2!4454 lt!149243)) lt!149953)))

(declare-fun b!102896 () Bool)

(declare-fun res!84631 () Bool)

(assert (=> b!102896 (=> (not res!84631) (not e!67335))))

(assert (=> b!102896 (= res!84631 (isPrefixOf!0 (_2!4455 lt!149953) (_2!4454 lt!149243)))))

(declare-fun b!102897 () Bool)

(declare-fun Unit!6310 () Unit!6290)

(assert (=> b!102897 (= e!67336 Unit!6310)))

(declare-fun b!102898 () Bool)

(declare-fun res!84630 () Bool)

(assert (=> b!102898 (=> (not res!84630) (not e!67335))))

(assert (=> b!102898 (= res!84630 (isPrefixOf!0 (_1!4455 lt!149953) (_2!4454 lt!149256)))))

(declare-fun b!102899 () Bool)

(declare-fun lt!149951 () Unit!6290)

(assert (=> b!102899 (= e!67336 lt!149951)))

(declare-fun lt!149949 () (_ BitVec 64))

(assert (=> b!102899 (= lt!149949 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!149942 () (_ BitVec 64))

(assert (=> b!102899 (= lt!149942 (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149256))) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256))))))

(assert (=> b!102899 (= lt!149951 (arrayBitRangesEqSymmetric!0 (buf!2557 (_2!4454 lt!149256)) (buf!2557 (_2!4454 lt!149243)) lt!149949 lt!149942))))

(assert (=> b!102899 (arrayBitRangesEq!0 (buf!2557 (_2!4454 lt!149243)) (buf!2557 (_2!4454 lt!149256)) lt!149949 lt!149942)))

(declare-fun lt!149943 () (_ BitVec 64))

(declare-fun b!102900 () Bool)

(declare-fun lt!149940 () (_ BitVec 64))

(assert (=> b!102900 (= e!67335 (= (_1!4455 lt!149953) (withMovedBitIndex!0 (_2!4455 lt!149953) (bvsub lt!149940 lt!149943))))))

(assert (=> b!102900 (or (= (bvand lt!149940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149943 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149940 lt!149943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102900 (= lt!149943 (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149243))) (currentByte!5030 (_2!4454 lt!149243)) (currentBit!5025 (_2!4454 lt!149243))))))

(assert (=> b!102900 (= lt!149940 (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149256))) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256))))))

(assert (= (and d!31956 c!6377) b!102899))

(assert (= (and d!31956 (not c!6377)) b!102897))

(assert (= (and d!31956 res!84629) b!102898))

(assert (= (and b!102898 res!84630) b!102896))

(assert (= (and b!102896 res!84631) b!102900))

(declare-fun m!149971 () Bool)

(assert (=> d!31956 m!149971))

(declare-fun m!149973 () Bool)

(assert (=> d!31956 m!149973))

(declare-fun m!149975 () Bool)

(assert (=> d!31956 m!149975))

(declare-fun m!149977 () Bool)

(assert (=> d!31956 m!149977))

(declare-fun m!149979 () Bool)

(assert (=> d!31956 m!149979))

(declare-fun m!149981 () Bool)

(assert (=> d!31956 m!149981))

(declare-fun m!149983 () Bool)

(assert (=> d!31956 m!149983))

(declare-fun m!149985 () Bool)

(assert (=> d!31956 m!149985))

(assert (=> d!31956 m!149731))

(declare-fun m!149987 () Bool)

(assert (=> d!31956 m!149987))

(assert (=> d!31956 m!149733))

(declare-fun m!149989 () Bool)

(assert (=> b!102896 m!149989))

(assert (=> b!102899 m!149507))

(declare-fun m!149991 () Bool)

(assert (=> b!102899 m!149991))

(declare-fun m!149993 () Bool)

(assert (=> b!102899 m!149993))

(declare-fun m!149995 () Bool)

(assert (=> b!102898 m!149995))

(declare-fun m!149997 () Bool)

(assert (=> b!102900 m!149997))

(assert (=> b!102900 m!149745))

(assert (=> b!102900 m!149507))

(assert (=> b!102618 d!31956))

(declare-fun d!31958 () Bool)

(declare-fun e!67345 () Bool)

(assert (=> d!31958 e!67345))

(declare-fun res!84642 () Bool)

(assert (=> d!31958 (=> (not res!84642) (not e!67345))))

(declare-fun lt!150024 () tuple2!8402)

(declare-fun lt!150023 () tuple2!8402)

(assert (=> d!31958 (= res!84642 (= (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!150024))) (currentByte!5030 (_1!4456 lt!150024)) (currentBit!5025 (_1!4456 lt!150024))) (bitIndex!0 (size!2197 (buf!2557 (_1!4456 lt!150023))) (currentByte!5030 (_1!4456 lt!150023)) (currentBit!5025 (_1!4456 lt!150023)))))))

(declare-fun lt!150021 () Unit!6290)

(declare-fun lt!150022 () BitStream!3868)

(declare-fun choose!50 (BitStream!3868 BitStream!3868 BitStream!3868 tuple2!8402 tuple2!8402 BitStream!3868 Bool tuple2!8402 tuple2!8402 BitStream!3868 Bool) Unit!6290)

(assert (=> d!31958 (= lt!150021 (choose!50 lt!149260 (_2!4454 lt!149243) lt!150022 lt!150024 (tuple2!8403 (_1!4456 lt!150024) (_2!4456 lt!150024)) (_1!4456 lt!150024) (_2!4456 lt!150024) lt!150023 (tuple2!8403 (_1!4456 lt!150023) (_2!4456 lt!150023)) (_1!4456 lt!150023) (_2!4456 lt!150023)))))

(assert (=> d!31958 (= lt!150023 (readBitPure!0 lt!150022))))

(assert (=> d!31958 (= lt!150024 (readBitPure!0 lt!149260))))

(assert (=> d!31958 (= lt!150022 (BitStream!3869 (buf!2557 (_2!4454 lt!149243)) (currentByte!5030 lt!149260) (currentBit!5025 lt!149260)))))

(assert (=> d!31958 (invariant!0 (currentBit!5025 lt!149260) (currentByte!5030 lt!149260) (size!2197 (buf!2557 (_2!4454 lt!149243))))))

(assert (=> d!31958 (= (readBitPrefixLemma!0 lt!149260 (_2!4454 lt!149243)) lt!150021)))

(declare-fun b!102915 () Bool)

(assert (=> b!102915 (= e!67345 (= (_2!4456 lt!150024) (_2!4456 lt!150023)))))

(assert (= (and d!31958 res!84642) b!102915))

(declare-fun m!149999 () Bool)

(assert (=> d!31958 m!149999))

(declare-fun m!150001 () Bool)

(assert (=> d!31958 m!150001))

(declare-fun m!150003 () Bool)

(assert (=> d!31958 m!150003))

(declare-fun m!150005 () Bool)

(assert (=> d!31958 m!150005))

(assert (=> d!31958 m!149501))

(declare-fun m!150007 () Bool)

(assert (=> d!31958 m!150007))

(assert (=> b!102618 d!31958))

(declare-fun d!31960 () Bool)

(assert (=> d!31960 (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149243)))) ((_ sign_extend 32) (currentByte!5030 (_2!4454 lt!149256))) ((_ sign_extend 32) (currentBit!5025 (_2!4454 lt!149256))) lt!149248)))

(declare-fun lt!150033 () Unit!6290)

(declare-fun choose!9 (BitStream!3868 array!4812 (_ BitVec 64) BitStream!3868) Unit!6290)

(assert (=> d!31960 (= lt!150033 (choose!9 (_2!4454 lt!149256) (buf!2557 (_2!4454 lt!149243)) lt!149248 (BitStream!3869 (buf!2557 (_2!4454 lt!149243)) (currentByte!5030 (_2!4454 lt!149256)) (currentBit!5025 (_2!4454 lt!149256)))))))

(assert (=> d!31960 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4454 lt!149256) (buf!2557 (_2!4454 lt!149243)) lt!149248) lt!150033)))

(declare-fun bs!7834 () Bool)

(assert (= bs!7834 d!31960))

(assert (=> bs!7834 m!149497))

(declare-fun m!150009 () Bool)

(assert (=> bs!7834 m!150009))

(assert (=> b!102618 d!31960))

(declare-fun d!31962 () Bool)

(declare-fun res!84652 () Bool)

(declare-fun e!67351 () Bool)

(assert (=> d!31962 (=> (not res!84652) (not e!67351))))

(assert (=> d!31962 (= res!84652 (= (size!2197 (buf!2557 thiss!1305)) (size!2197 (buf!2557 (_2!4454 lt!149243)))))))

(assert (=> d!31962 (= (isPrefixOf!0 thiss!1305 (_2!4454 lt!149243)) e!67351)))

(declare-fun b!102925 () Bool)

(declare-fun res!84653 () Bool)

(assert (=> b!102925 (=> (not res!84653) (not e!67351))))

(assert (=> b!102925 (= res!84653 (bvsle (bitIndex!0 (size!2197 (buf!2557 thiss!1305)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305)) (bitIndex!0 (size!2197 (buf!2557 (_2!4454 lt!149243))) (currentByte!5030 (_2!4454 lt!149243)) (currentBit!5025 (_2!4454 lt!149243)))))))

(declare-fun b!102926 () Bool)

(declare-fun e!67350 () Bool)

(assert (=> b!102926 (= e!67351 e!67350)))

(declare-fun res!84651 () Bool)

(assert (=> b!102926 (=> res!84651 e!67350)))

(assert (=> b!102926 (= res!84651 (= (size!2197 (buf!2557 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!102927 () Bool)

(assert (=> b!102927 (= e!67350 (arrayBitRangesEq!0 (buf!2557 thiss!1305) (buf!2557 (_2!4454 lt!149243)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2197 (buf!2557 thiss!1305)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305))))))

(assert (= (and d!31962 res!84652) b!102925))

(assert (= (and b!102925 res!84653) b!102926))

(assert (= (and b!102926 (not res!84651)) b!102927))

(assert (=> b!102925 m!149509))

(assert (=> b!102925 m!149745))

(assert (=> b!102927 m!149509))

(assert (=> b!102927 m!149509))

(declare-fun m!150011 () Bool)

(assert (=> b!102927 m!150011))

(assert (=> b!102618 d!31962))

(declare-fun d!31964 () Bool)

(assert (=> d!31964 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149243)))) ((_ sign_extend 32) (currentByte!5030 (_2!4454 lt!149256))) ((_ sign_extend 32) (currentBit!5025 (_2!4454 lt!149256))) lt!149248) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149243)))) ((_ sign_extend 32) (currentByte!5030 (_2!4454 lt!149256))) ((_ sign_extend 32) (currentBit!5025 (_2!4454 lt!149256)))) lt!149248))))

(declare-fun bs!7835 () Bool)

(assert (= bs!7835 d!31964))

(declare-fun m!150013 () Bool)

(assert (=> bs!7835 m!150013))

(assert (=> b!102618 d!31964))

(declare-fun d!31966 () Bool)

(assert (=> d!31966 (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_2!4454 lt!149243)))) ((_ sign_extend 32) (currentByte!5030 thiss!1305)) ((_ sign_extend 32) (currentBit!5025 thiss!1305)) lt!149247)))

(declare-fun lt!150036 () Unit!6290)

(assert (=> d!31966 (= lt!150036 (choose!9 thiss!1305 (buf!2557 (_2!4454 lt!149243)) lt!149247 (BitStream!3869 (buf!2557 (_2!4454 lt!149243)) (currentByte!5030 thiss!1305) (currentBit!5025 thiss!1305))))))

(assert (=> d!31966 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2557 (_2!4454 lt!149243)) lt!149247) lt!150036)))

(declare-fun bs!7836 () Bool)

(assert (= bs!7836 d!31966))

(assert (=> bs!7836 m!149503))

(declare-fun m!150015 () Bool)

(assert (=> bs!7836 m!150015))

(assert (=> b!102618 d!31966))

(declare-fun d!31968 () Bool)

(assert (=> d!31968 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5025 thiss!1305) (currentByte!5030 thiss!1305) (size!2197 (buf!2557 thiss!1305))))))

(declare-fun bs!7837 () Bool)

(assert (= bs!7837 d!31968))

(assert (=> bs!7837 m!149695))

(assert (=> start!20368 d!31968))

(declare-fun d!31970 () Bool)

(assert (=> d!31970 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!102620 d!31970))

(declare-fun d!31972 () Bool)

(assert (=> d!31972 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4455 lt!149255)))) ((_ sign_extend 32) (currentByte!5030 (_1!4455 lt!149255))) ((_ sign_extend 32) (currentBit!5025 (_1!4455 lt!149255))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2197 (buf!2557 (_1!4455 lt!149255)))) ((_ sign_extend 32) (currentByte!5030 (_1!4455 lt!149255))) ((_ sign_extend 32) (currentBit!5025 (_1!4455 lt!149255)))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bs!7838 () Bool)

(assert (= bs!7838 d!31972))

(declare-fun m!150017 () Bool)

(assert (=> bs!7838 m!150017))

(assert (=> b!102609 d!31972))

(declare-fun d!31974 () Bool)

(assert (=> d!31974 (= (array_inv!1999 (buf!2557 thiss!1305)) (bvsge (size!2197 (buf!2557 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!102619 d!31974))

(push 1)

(assert (not bm!1275))

(assert (not b!102891))

(assert (not d!31950))

(assert (not d!31964))

(assert (not d!31906))

(assert (not d!31888))

(assert (not b!102896))

(assert (not d!31902))

(assert (not d!31904))

(assert (not b!102855))

(assert (not d!31876))

(assert (not b!102730))

(assert (not b!102893))

(assert (not b!102925))

(assert (not b!102900))

(assert (not d!31968))

(assert (not d!31880))

(assert (not d!31896))

(assert (not d!31874))

(assert (not b!102844))

(assert (not d!31898))

(assert (not b!102849))

(assert (not b!102850))

(assert (not b!102927))

(assert (not b!102757))

(assert (not b!102758))

(assert (not b!102756))

(assert (not b!102741))

(assert (not d!31908))

(assert (not d!31972))

(assert (not b!102854))

(assert (not d!31966))

(assert (not b!102898))

(assert (not d!31952))

(assert (not b!102848))

(assert (not b!102754))

(assert (not d!31884))

(assert (not b!102847))

(assert (not b!102845))

(assert (not d!31958))

(assert (not d!31956))

(assert (not d!31910))

(assert (not b!102892))

(assert (not d!31882))

(assert (not b!102890))

(assert (not d!31900))

(assert (not b!102846))

(assert (not b!102739))

(assert (not b!102899))

(assert (not d!31960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

