; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70814 () Bool)

(assert start!70814)

(declare-fun b!320375 () Bool)

(declare-fun e!230518 () Bool)

(declare-datatypes ((array!20131 0))(
  ( (array!20132 (arr!9866 (Array (_ BitVec 32) (_ BitVec 8))) (size!8774 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20131)

(declare-fun lt!443936 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!20131 array!20131 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320375 (= e!230518 (not (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443936)))))

(declare-datatypes ((Unit!21961 0))(
  ( (Unit!21962) )
))
(declare-fun lt!443935 () Unit!21961)

(declare-fun i!979 () (_ BitVec 64))

(declare-fun rec!17 (array!20131 (_ BitVec 64)) Unit!21961)

(assert (=> b!320375 (= lt!443935 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!320373 () Bool)

(declare-fun res!263254 () Bool)

(assert (=> b!320373 (=> (not res!263254) (not e!230518))))

(assert (=> b!320373 (= res!263254 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443936))))

(declare-fun b!320372 () Bool)

(declare-fun e!230519 () Bool)

(assert (=> b!320372 (= e!230519 e!230518)))

(declare-fun res!263257 () Bool)

(assert (=> b!320372 (=> (not res!263257) (not e!230518))))

(assert (=> b!320372 (= res!263257 (bvsle i!979 lt!443936))))

(assert (=> b!320372 (= lt!443936 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8774 a!425))))))

(declare-fun res!263255 () Bool)

(assert (=> start!70814 (=> (not res!263255) (not e!230519))))

(assert (=> start!70814 (= res!263255 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70814 e!230519))

(assert (=> start!70814 true))

(declare-fun array_inv!8326 (array!20131) Bool)

(assert (=> start!70814 (array_inv!8326 a!425)))

(declare-fun b!320374 () Bool)

(declare-fun res!263256 () Bool)

(assert (=> b!320374 (=> (not res!263256) (not e!230518))))

(assert (=> b!320374 (= res!263256 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!70814 res!263255) b!320372))

(assert (= (and b!320372 res!263257) b!320373))

(assert (= (and b!320373 res!263254) b!320374))

(assert (= (and b!320374 res!263256) b!320375))

(declare-fun m!458713 () Bool)

(assert (=> b!320375 m!458713))

(declare-fun m!458715 () Bool)

(assert (=> b!320375 m!458715))

(declare-fun m!458717 () Bool)

(assert (=> b!320373 m!458717))

(declare-fun m!458719 () Bool)

(assert (=> start!70814 m!458719))

(check-sat (not start!70814) (not b!320373) (not b!320375))
(check-sat)
(get-model)

(declare-fun d!104920 () Bool)

(assert (=> d!104920 (= (array_inv!8326 a!425) (bvsge (size!8774 a!425) #b00000000000000000000000000000000))))

(assert (=> start!70814 d!104920))

(declare-fun b!320430 () Bool)

(declare-fun e!230566 () Bool)

(declare-fun e!230569 () Bool)

(assert (=> b!320430 (= e!230566 e!230569)))

(declare-fun res!263301 () Bool)

(declare-fun lt!443963 () (_ BitVec 32))

(declare-datatypes ((tuple4!1332 0))(
  ( (tuple4!1333 (_1!13345 (_ BitVec 32)) (_2!13345 (_ BitVec 32)) (_3!1623 (_ BitVec 32)) (_4!666 (_ BitVec 32))) )
))
(declare-fun lt!443962 () tuple4!1332)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320430 (= res!263301 (byteRangesEq!0 (select (arr!9866 a!425) (_3!1623 lt!443962)) (select (arr!9866 a!425) (_3!1623 lt!443962)) lt!443963 #b00000000000000000000000000001000))))

(assert (=> b!320430 (=> (not res!263301) (not e!230569))))

(declare-fun b!320431 () Bool)

(declare-fun e!230570 () Bool)

(assert (=> b!320431 (= e!230570 e!230566)))

(declare-fun c!15350 () Bool)

(assert (=> b!320431 (= c!15350 (= (_3!1623 lt!443962) (_4!666 lt!443962)))))

(declare-fun lt!443961 () (_ BitVec 32))

(declare-fun call!6051 () Bool)

(declare-fun bm!6048 () Bool)

(assert (=> bm!6048 (= call!6051 (byteRangesEq!0 (ite c!15350 (select (arr!9866 a!425) (_3!1623 lt!443962)) (select (arr!9866 a!425) (_4!666 lt!443962))) (ite c!15350 (select (arr!9866 a!425) (_3!1623 lt!443962)) (select (arr!9866 a!425) (_4!666 lt!443962))) (ite c!15350 lt!443963 #b00000000000000000000000000000000) lt!443961))))

(declare-fun b!320432 () Bool)

(declare-fun e!230571 () Bool)

(assert (=> b!320432 (= e!230571 e!230570)))

(declare-fun res!263302 () Bool)

(assert (=> b!320432 (=> (not res!263302) (not e!230570))))

(declare-fun e!230567 () Bool)

(assert (=> b!320432 (= res!263302 e!230567)))

(declare-fun res!263304 () Bool)

(assert (=> b!320432 (=> res!263304 e!230567)))

(assert (=> b!320432 (= res!263304 (bvsge (_1!13345 lt!443962) (_2!13345 lt!443962)))))

(assert (=> b!320432 (= lt!443961 ((_ extract 31 0) (bvsrem lt!443936 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320432 (= lt!443963 ((_ extract 31 0) (bvsrem i!979 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1332)

(assert (=> b!320432 (= lt!443962 (arrayBitIndices!0 i!979 lt!443936))))

(declare-fun b!320433 () Bool)

(declare-fun e!230568 () Bool)

(assert (=> b!320433 (= e!230568 call!6051)))

(declare-fun b!320434 () Bool)

(assert (=> b!320434 (= e!230566 call!6051)))

(declare-fun b!320435 () Bool)

(declare-fun res!263300 () Bool)

(assert (=> b!320435 (= res!263300 (= lt!443961 #b00000000000000000000000000000000))))

(assert (=> b!320435 (=> res!263300 e!230568)))

(assert (=> b!320435 (= e!230569 e!230568)))

(declare-fun d!104922 () Bool)

(declare-fun res!263303 () Bool)

(assert (=> d!104922 (=> res!263303 e!230571)))

(assert (=> d!104922 (= res!263303 (bvsge i!979 lt!443936))))

(assert (=> d!104922 (= (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443936) e!230571)))

(declare-fun b!320436 () Bool)

(declare-fun arrayRangesEq!1822 (array!20131 array!20131 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320436 (= e!230567 (arrayRangesEq!1822 a!425 a!425 (_1!13345 lt!443962) (_2!13345 lt!443962)))))

(assert (= (and d!104922 (not res!263303)) b!320432))

(assert (= (and b!320432 (not res!263304)) b!320436))

(assert (= (and b!320432 res!263302) b!320431))

(assert (= (and b!320431 c!15350) b!320434))

(assert (= (and b!320431 (not c!15350)) b!320430))

(assert (= (and b!320430 res!263301) b!320435))

(assert (= (and b!320435 (not res!263300)) b!320433))

(assert (= (or b!320434 b!320433) bm!6048))

(declare-fun m!458729 () Bool)

(assert (=> b!320430 m!458729))

(assert (=> b!320430 m!458729))

(assert (=> b!320430 m!458729))

(assert (=> b!320430 m!458729))

(declare-fun m!458731 () Bool)

(assert (=> b!320430 m!458731))

(declare-fun m!458733 () Bool)

(assert (=> bm!6048 m!458733))

(assert (=> bm!6048 m!458729))

(assert (=> bm!6048 m!458733))

(assert (=> bm!6048 m!458729))

(declare-fun m!458735 () Bool)

(assert (=> bm!6048 m!458735))

(declare-fun m!458737 () Bool)

(assert (=> b!320432 m!458737))

(declare-fun m!458739 () Bool)

(assert (=> b!320436 m!458739))

(assert (=> b!320373 d!104922))

(declare-fun b!320444 () Bool)

(declare-fun e!230578 () Bool)

(declare-fun e!230581 () Bool)

(assert (=> b!320444 (= e!230578 e!230581)))

(declare-fun lt!443968 () tuple4!1332)

(declare-fun lt!443969 () (_ BitVec 32))

(declare-fun res!263311 () Bool)

(assert (=> b!320444 (= res!263311 (byteRangesEq!0 (select (arr!9866 a!425) (_3!1623 lt!443968)) (select (arr!9866 a!425) (_3!1623 lt!443968)) lt!443969 #b00000000000000000000000000001000))))

(assert (=> b!320444 (=> (not res!263311) (not e!230581))))

(declare-fun b!320445 () Bool)

(declare-fun e!230582 () Bool)

(assert (=> b!320445 (= e!230582 e!230578)))

(declare-fun c!15352 () Bool)

(assert (=> b!320445 (= c!15352 (= (_3!1623 lt!443968) (_4!666 lt!443968)))))

(declare-fun bm!6050 () Bool)

(declare-fun lt!443967 () (_ BitVec 32))

(declare-fun call!6053 () Bool)

(assert (=> bm!6050 (= call!6053 (byteRangesEq!0 (ite c!15352 (select (arr!9866 a!425) (_3!1623 lt!443968)) (select (arr!9866 a!425) (_4!666 lt!443968))) (ite c!15352 (select (arr!9866 a!425) (_3!1623 lt!443968)) (select (arr!9866 a!425) (_4!666 lt!443968))) (ite c!15352 lt!443969 #b00000000000000000000000000000000) lt!443967))))

(declare-fun b!320446 () Bool)

(declare-fun e!230583 () Bool)

(assert (=> b!320446 (= e!230583 e!230582)))

(declare-fun res!263312 () Bool)

(assert (=> b!320446 (=> (not res!263312) (not e!230582))))

(declare-fun e!230579 () Bool)

(assert (=> b!320446 (= res!263312 e!230579)))

(declare-fun res!263314 () Bool)

(assert (=> b!320446 (=> res!263314 e!230579)))

(assert (=> b!320446 (= res!263314 (bvsge (_1!13345 lt!443968) (_2!13345 lt!443968)))))

(assert (=> b!320446 (= lt!443967 ((_ extract 31 0) (bvsrem lt!443936 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320446 (= lt!443969 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320446 (= lt!443968 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443936))))

(declare-fun b!320447 () Bool)

(declare-fun e!230580 () Bool)

(assert (=> b!320447 (= e!230580 call!6053)))

(declare-fun b!320448 () Bool)

(assert (=> b!320448 (= e!230578 call!6053)))

(declare-fun b!320449 () Bool)

(declare-fun res!263310 () Bool)

(assert (=> b!320449 (= res!263310 (= lt!443967 #b00000000000000000000000000000000))))

(assert (=> b!320449 (=> res!263310 e!230580)))

(assert (=> b!320449 (= e!230581 e!230580)))

(declare-fun d!104928 () Bool)

(declare-fun res!263313 () Bool)

(assert (=> d!104928 (=> res!263313 e!230583)))

(assert (=> d!104928 (= res!263313 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!443936))))

(assert (=> d!104928 (= (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443936) e!230583)))

(declare-fun b!320450 () Bool)

(assert (=> b!320450 (= e!230579 (arrayRangesEq!1822 a!425 a!425 (_1!13345 lt!443968) (_2!13345 lt!443968)))))

(assert (= (and d!104928 (not res!263313)) b!320446))

(assert (= (and b!320446 (not res!263314)) b!320450))

(assert (= (and b!320446 res!263312) b!320445))

(assert (= (and b!320445 c!15352) b!320448))

(assert (= (and b!320445 (not c!15352)) b!320444))

(assert (= (and b!320444 res!263311) b!320449))

(assert (= (and b!320449 (not res!263310)) b!320447))

(assert (= (or b!320448 b!320447) bm!6050))

(declare-fun m!458753 () Bool)

(assert (=> b!320444 m!458753))

(assert (=> b!320444 m!458753))

(assert (=> b!320444 m!458753))

(assert (=> b!320444 m!458753))

(declare-fun m!458755 () Bool)

(assert (=> b!320444 m!458755))

(declare-fun m!458757 () Bool)

(assert (=> bm!6050 m!458757))

(assert (=> bm!6050 m!458753))

(assert (=> bm!6050 m!458757))

(assert (=> bm!6050 m!458753))

(declare-fun m!458761 () Bool)

(assert (=> bm!6050 m!458761))

(declare-fun m!458765 () Bool)

(assert (=> b!320446 m!458765))

(declare-fun m!458767 () Bool)

(assert (=> b!320450 m!458767))

(assert (=> b!320375 d!104928))

(declare-fun d!104932 () Bool)

(declare-fun e!230604 () Bool)

(assert (=> d!104932 e!230604))

(declare-fun res!263327 () Bool)

(assert (=> d!104932 (=> (not res!263327) (not e!230604))))

(declare-fun lt!443987 () (_ BitVec 64))

(assert (=> d!104932 (= res!263327 (or (= lt!443987 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!443987 #b0000000000000000000000000000000000000000000000000000000000001000) lt!443987))))))

(assert (=> d!104932 (= lt!443987 ((_ sign_extend 32) (size!8774 a!425)))))

(declare-fun lt!443988 () Unit!21961)

(declare-fun e!230605 () Unit!21961)

(assert (=> d!104932 (= lt!443988 e!230605)))

(declare-fun c!15361 () Bool)

(assert (=> d!104932 (= c!15361 (= (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104932 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) (bvmul ((_ sign_extend 32) (size!8774 a!425)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!104932 (= (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!443988)))

(declare-fun b!320479 () Bool)

(declare-fun Unit!21966 () Unit!21961)

(assert (=> b!320479 (= e!230605 Unit!21966)))

(declare-fun b!320480 () Bool)

(assert (=> b!320480 (= e!230605 (rec!17 a!425 (bvsub (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!320481 () Bool)

(assert (=> b!320481 (= e!230604 (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!8774 a!425)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!104932 c!15361) b!320479))

(assert (= (and d!104932 (not c!15361)) b!320480))

(assert (= (and d!104932 res!263327) b!320481))

(declare-fun m!458781 () Bool)

(assert (=> b!320480 m!458781))

(declare-fun m!458783 () Bool)

(assert (=> b!320481 m!458783))

(assert (=> b!320375 d!104932))

(check-sat (not bm!6050) (not b!320432) (not b!320444) (not b!320430) (not bm!6048) (not b!320450) (not b!320436) (not b!320481) (not b!320480) (not b!320446))
