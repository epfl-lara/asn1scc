; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70812 () Bool)

(assert start!70812)

(declare-fun b!320362 () Bool)

(declare-fun res!263242 () Bool)

(declare-fun e!230510 () Bool)

(assert (=> b!320362 (=> (not res!263242) (not e!230510))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> b!320362 (= res!263242 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!263245 () Bool)

(declare-fun e!230509 () Bool)

(assert (=> start!70812 (=> (not res!263245) (not e!230509))))

(assert (=> start!70812 (= res!263245 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70812 e!230509))

(assert (=> start!70812 true))

(declare-datatypes ((array!20129 0))(
  ( (array!20130 (arr!9865 (Array (_ BitVec 32) (_ BitVec 8))) (size!8773 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20129)

(declare-fun array_inv!8325 (array!20129) Bool)

(assert (=> start!70812 (array_inv!8325 a!425)))

(declare-fun b!320363 () Bool)

(declare-fun lt!443929 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!20129 array!20129 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320363 (= e!230510 (not (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443929)))))

(declare-datatypes ((Unit!21959 0))(
  ( (Unit!21960) )
))
(declare-fun lt!443930 () Unit!21959)

(declare-fun rec!17 (array!20129 (_ BitVec 64)) Unit!21959)

(assert (=> b!320363 (= lt!443930 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!320361 () Bool)

(declare-fun res!263243 () Bool)

(assert (=> b!320361 (=> (not res!263243) (not e!230510))))

(assert (=> b!320361 (= res!263243 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443929))))

(declare-fun b!320360 () Bool)

(assert (=> b!320360 (= e!230509 e!230510)))

(declare-fun res!263244 () Bool)

(assert (=> b!320360 (=> (not res!263244) (not e!230510))))

(assert (=> b!320360 (= res!263244 (bvsle i!979 lt!443929))))

(assert (=> b!320360 (= lt!443929 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8773 a!425))))))

(assert (= (and start!70812 res!263245) b!320360))

(assert (= (and b!320360 res!263244) b!320361))

(assert (= (and b!320361 res!263243) b!320362))

(assert (= (and b!320362 res!263242) b!320363))

(declare-fun m!458705 () Bool)

(assert (=> start!70812 m!458705))

(declare-fun m!458707 () Bool)

(assert (=> b!320363 m!458707))

(declare-fun m!458709 () Bool)

(assert (=> b!320363 m!458709))

(declare-fun m!458711 () Bool)

(assert (=> b!320361 m!458711))

(push 1)

(assert (not b!320363))

(assert (not start!70812))

(assert (not b!320361))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!320437 () Bool)

(declare-fun e!230574 () Bool)

(declare-fun call!6052 () Bool)

(assert (=> b!320437 (= e!230574 call!6052)))

(declare-fun b!320438 () Bool)

(declare-fun res!263309 () Bool)

(declare-fun lt!443965 () (_ BitVec 32))

(assert (=> b!320438 (= res!263309 (= lt!443965 #b00000000000000000000000000000000))))

(declare-fun e!230576 () Bool)

(assert (=> b!320438 (=> res!263309 e!230576)))

(declare-fun e!230573 () Bool)

(assert (=> b!320438 (= e!230573 e!230576)))

(declare-fun lt!443964 () (_ BitVec 32))

(declare-fun bm!6049 () Bool)

(declare-fun c!15351 () Bool)

(declare-datatypes ((tuple4!1336 0))(
  ( (tuple4!1337 (_1!13347 (_ BitVec 32)) (_2!13347 (_ BitVec 32)) (_3!1625 (_ BitVec 32)) (_4!668 (_ BitVec 32))) )
))
(declare-fun lt!443966 () tuple4!1336)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6049 (= call!6052 (byteRangesEq!0 (select (arr!9865 a!425) (_3!1625 lt!443966)) (select (arr!9865 a!425) (_3!1625 lt!443966)) lt!443964 (ite c!15351 lt!443965 #b00000000000000000000000000001000)))))

(declare-fun b!320439 () Bool)

(declare-fun e!230572 () Bool)

(declare-fun arrayRangesEq!1821 (array!20129 array!20129 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320439 (= e!230572 (arrayRangesEq!1821 a!425 a!425 (_1!13347 lt!443966) (_2!13347 lt!443966)))))

(declare-fun b!320440 () Bool)

(assert (=> b!320440 (= e!230576 (byteRangesEq!0 (select (arr!9865 a!425) (_4!668 lt!443966)) (select (arr!9865 a!425) (_4!668 lt!443966)) #b00000000000000000000000000000000 lt!443965))))

(declare-fun b!320441 () Bool)

(declare-fun e!230577 () Bool)

(assert (=> b!320441 (= e!230577 e!230574)))

(assert (=> b!320441 (= c!15351 (= (_3!1625 lt!443966) (_4!668 lt!443966)))))

(declare-fun d!104924 () Bool)

(declare-fun res!263307 () Bool)

(declare-fun e!230575 () Bool)

(assert (=> d!104924 (=> res!263307 e!230575)))

(assert (=> d!104924 (= res!263307 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!443929))))

(assert (=> d!104924 (= (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443929) e!230575)))

(declare-fun b!320442 () Bool)

(assert (=> b!320442 (= e!230575 e!230577)))

(declare-fun res!263308 () Bool)

(assert (=> b!320442 (=> (not res!263308) (not e!230577))))

(assert (=> b!320442 (= res!263308 e!230572)))

(declare-fun res!263305 () Bool)

(assert (=> b!320442 (=> res!263305 e!230572)))

(assert (=> b!320442 (= res!263305 (bvsge (_1!13347 lt!443966) (_2!13347 lt!443966)))))

(assert (=> b!320442 (= lt!443965 ((_ extract 31 0) (bvsrem lt!443929 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320442 (= lt!443964 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1336)

(assert (=> b!320442 (= lt!443966 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443929))))

(declare-fun b!320443 () Bool)

(assert (=> b!320443 (= e!230574 e!230573)))

(declare-fun res!263306 () Bool)

(assert (=> b!320443 (= res!263306 call!6052)))

(assert (=> b!320443 (=> (not res!263306) (not e!230573))))

(assert (= (and d!104924 (not res!263307)) b!320442))

(assert (= (and b!320442 (not res!263305)) b!320439))

(assert (= (and b!320442 res!263308) b!320441))

(assert (= (and b!320441 c!15351) b!320437))

(assert (= (and b!320441 (not c!15351)) b!320443))

(assert (= (and b!320443 res!263306) b!320438))

(assert (= (and b!320438 (not res!263309)) b!320440))

(assert (= (or b!320437 b!320443) bm!6049))

(declare-fun m!458741 () Bool)

(assert (=> bm!6049 m!458741))

(assert (=> bm!6049 m!458741))

(assert (=> bm!6049 m!458741))

(assert (=> bm!6049 m!458741))

(declare-fun m!458743 () Bool)

(assert (=> bm!6049 m!458743))

(declare-fun m!458745 () Bool)

(assert (=> b!320439 m!458745))

(declare-fun m!458747 () Bool)

(assert (=> b!320440 m!458747))

(assert (=> b!320440 m!458747))

(assert (=> b!320440 m!458747))

(assert (=> b!320440 m!458747))

(declare-fun m!458749 () Bool)

(assert (=> b!320440 m!458749))

(declare-fun m!458751 () Bool)

(assert (=> b!320442 m!458751))

(assert (=> b!320363 d!104924))

(declare-fun d!104930 () Bool)

(declare-fun e!230603 () Bool)

(assert (=> d!104930 e!230603))

(declare-fun res!263326 () Bool)

(assert (=> d!104930 (=> (not res!263326) (not e!230603))))

(declare-fun lt!443985 () (_ BitVec 64))

(assert (=> d!104930 (= res!263326 (or (= lt!443985 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!443985 #b0000000000000000000000000000000000000000000000000000000000001000) lt!443985))))))

(assert (=> d!104930 (= lt!443985 ((_ sign_extend 32) (size!8773 a!425)))))

(declare-fun lt!443986 () Unit!21959)

(declare-fun e!230602 () Unit!21959)

(assert (=> d!104930 (= lt!443986 e!230602)))

(declare-fun c!15360 () Bool)

(assert (=> d!104930 (= c!15360 (= (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104930 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) (bvmul ((_ sign_extend 32) (size!8773 a!425)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!104930 (= (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!443986)))

(declare-fun b!320476 () Bool)

(declare-fun Unit!21965 () Unit!21959)

(assert (=> b!320476 (= e!230602 Unit!21965)))

(declare-fun b!320477 () Bool)

(assert (=> b!320477 (= e!230602 (rec!17 a!425 (bvsub (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!320478 () Bool)

(assert (=> b!320478 (= e!230603 (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!8773 a!425)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!104930 c!15360) b!320476))

(assert (= (and d!104930 (not c!15360)) b!320477))

(assert (= (and d!104930 res!263326) b!320478))

(declare-fun m!458777 () Bool)

(assert (=> b!320477 m!458777))

(declare-fun m!458779 () Bool)

(assert (=> b!320478 m!458779))

(assert (=> b!320363 d!104930))

(declare-fun d!104936 () Bool)

(assert (=> d!104936 (= (array_inv!8325 a!425) (bvsge (size!8773 a!425) #b00000000000000000000000000000000))))

(assert (=> start!70812 d!104936))

(declare-fun b!320485 () Bool)

(declare-fun e!230610 () Bool)

(declare-fun call!6055 () Bool)

(assert (=> b!320485 (= e!230610 call!6055)))

(declare-fun b!320486 () Bool)

(declare-fun res!263333 () Bool)

(declare-fun lt!443992 () (_ BitVec 32))

(assert (=> b!320486 (= res!263333 (= lt!443992 #b00000000000000000000000000000000))))

(declare-fun e!230612 () Bool)

(assert (=> b!320486 (=> res!263333 e!230612)))

(declare-fun e!230609 () Bool)

(assert (=> b!320486 (= e!230609 e!230612)))

(declare-fun lt!443991 () (_ BitVec 32))

(declare-fun c!15363 () Bool)

(declare-fun lt!443993 () tuple4!1336)

(declare-fun bm!6052 () Bool)

(assert (=> bm!6052 (= call!6055 (byteRangesEq!0 (select (arr!9865 a!425) (_3!1625 lt!443993)) (select (arr!9865 a!425) (_3!1625 lt!443993)) lt!443991 (ite c!15363 lt!443992 #b00000000000000000000000000001000)))))

(declare-fun b!320487 () Bool)

(declare-fun e!230608 () Bool)

(assert (=> b!320487 (= e!230608 (arrayRangesEq!1821 a!425 a!425 (_1!13347 lt!443993) (_2!13347 lt!443993)))))

(declare-fun b!320488 () Bool)

(assert (=> b!320488 (= e!230612 (byteRangesEq!0 (select (arr!9865 a!425) (_4!668 lt!443993)) (select (arr!9865 a!425) (_4!668 lt!443993)) #b00000000000000000000000000000000 lt!443992))))

(declare-fun b!320489 () Bool)

(declare-fun e!230613 () Bool)

(assert (=> b!320489 (= e!230613 e!230610)))

(assert (=> b!320489 (= c!15363 (= (_3!1625 lt!443993) (_4!668 lt!443993)))))

(declare-fun d!104938 () Bool)

(declare-fun res!263331 () Bool)

(declare-fun e!230611 () Bool)

(assert (=> d!104938 (=> res!263331 e!230611)))

(assert (=> d!104938 (= res!263331 (bvsge i!979 lt!443929))))

(assert (=> d!104938 (= (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443929) e!230611)))

(declare-fun b!320490 () Bool)

(assert (=> b!320490 (= e!230611 e!230613)))

(declare-fun res!263332 () Bool)

(assert (=> b!320490 (=> (not res!263332) (not e!230613))))

(assert (=> b!320490 (= res!263332 e!230608)))

(declare-fun res!263329 () Bool)

(assert (=> b!320490 (=> res!263329 e!230608)))

(assert (=> b!320490 (= res!263329 (bvsge (_1!13347 lt!443993) (_2!13347 lt!443993)))))

(assert (=> b!320490 (= lt!443992 ((_ extract 31 0) (bvsrem lt!443929 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320490 (= lt!443991 ((_ extract 31 0) (bvsrem i!979 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320490 (= lt!443993 (arrayBitIndices!0 i!979 lt!443929))))

(declare-fun b!320491 () Bool)

(assert (=> b!320491 (= e!230610 e!230609)))

(declare-fun res!263330 () Bool)

(assert (=> b!320491 (= res!263330 call!6055)))

(assert (=> b!320491 (=> (not res!263330) (not e!230609))))

(assert (= (and d!104938 (not res!263331)) b!320490))

(assert (= (and b!320490 (not res!263329)) b!320487))

(assert (= (and b!320490 res!263332) b!320489))

(assert (= (and b!320489 c!15363) b!320485))

(assert (= (and b!320489 (not c!15363)) b!320491))

(assert (= (and b!320491 res!263330) b!320486))

(assert (= (and b!320486 (not res!263333)) b!320488))

(assert (= (or b!320485 b!320491) bm!6052))

(declare-fun m!458789 () Bool)

(assert (=> bm!6052 m!458789))

(assert (=> bm!6052 m!458789))

(assert (=> bm!6052 m!458789))

(assert (=> bm!6052 m!458789))

(declare-fun m!458791 () Bool)

(assert (=> bm!6052 m!458791))

(declare-fun m!458793 () Bool)

(assert (=> b!320487 m!458793))

(declare-fun m!458795 () Bool)

(assert (=> b!320488 m!458795))

(assert (=> b!320488 m!458795))

(assert (=> b!320488 m!458795))

(assert (=> b!320488 m!458795))

(declare-fun m!458797 () Bool)

(assert (=> b!320488 m!458797))

(declare-fun m!458799 () Bool)

(assert (=> b!320490 m!458799))

(assert (=> b!320361 d!104938))

(push 1)

(assert (not b!320490))

(assert (not bm!6052))

(assert (not b!320440))

(assert (not b!320477))

(assert (not b!320488))

(assert (not b!320439))

(assert (not b!320478))

(assert (not bm!6049))

(assert (not b!320487))

(assert (not b!320442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

