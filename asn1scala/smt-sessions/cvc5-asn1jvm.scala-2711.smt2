; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66424 () Bool)

(assert start!66424)

(declare-fun res!245643 () Bool)

(declare-fun e!213105 () Bool)

(assert (=> start!66424 (=> (not res!245643) (not e!213105))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17822 0))(
  ( (array!17823 (arr!8803 (Array (_ BitVec 32) (_ BitVec 8))) (size!7723 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17822)

(assert (=> start!66424 (= res!245643 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7723 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66424 e!213105))

(declare-datatypes ((BitStream!13450 0))(
  ( (BitStream!13451 (buf!7786 array!17822) (currentByte!14334 (_ BitVec 32)) (currentBit!14329 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13450)

(declare-fun e!213106 () Bool)

(declare-fun inv!12 (BitStream!13450) Bool)

(assert (=> start!66424 (and (inv!12 thiss!1728) e!213106)))

(assert (=> start!66424 true))

(declare-fun array_inv!7335 (array!17822) Bool)

(assert (=> start!66424 (array_inv!7335 arr!273)))

(declare-fun b!297639 () Bool)

(assert (=> b!297639 (= e!213106 (array_inv!7335 (buf!7786 thiss!1728)))))

(declare-fun lt!433883 () (_ BitVec 64))

(declare-fun lt!433882 () (_ BitVec 64))

(declare-fun b!297638 () Bool)

(assert (=> b!297638 (= e!213105 (not (or (= lt!433882 (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!433882 (bvand (bvsub lt!433883 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!297638 (= lt!433882 (bvand lt!433883 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297638 (= lt!433883 (bvadd (bitIndex!0 (size!7723 (buf!7786 thiss!1728)) (currentByte!14334 thiss!1728) (currentBit!14329 thiss!1728)) to!474))))

(declare-fun arrayBitRangesEq!0 (array!17822 array!17822 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297638 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433880 () (_ BitVec 64))

(declare-datatypes ((Unit!20767 0))(
  ( (Unit!20768) )
))
(declare-fun lt!433884 () Unit!20767)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17822 array!17822 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20767)

(assert (=> b!297638 (= lt!433884 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433880 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297638 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433880)))

(assert (=> b!297638 (= lt!433880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7723 arr!273))))))

(declare-fun lt!433881 () Unit!20767)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17822) Unit!20767)

(assert (=> b!297638 (= lt!433881 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297637 () Bool)

(declare-fun res!245644 () Bool)

(assert (=> b!297637 (=> (not res!245644) (not e!213105))))

(assert (=> b!297637 (= res!245644 (bvsge from!505 to!474))))

(declare-fun b!297636 () Bool)

(declare-fun res!245645 () Bool)

(assert (=> b!297636 (=> (not res!245645) (not e!213105))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297636 (= res!245645 (validate_offset_bits!1 ((_ sign_extend 32) (size!7723 (buf!7786 thiss!1728))) ((_ sign_extend 32) (currentByte!14334 thiss!1728)) ((_ sign_extend 32) (currentBit!14329 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!66424 res!245643) b!297636))

(assert (= (and b!297636 res!245645) b!297637))

(assert (= (and b!297637 res!245644) b!297638))

(assert (= start!66424 b!297639))

(declare-fun m!436465 () Bool)

(assert (=> start!66424 m!436465))

(declare-fun m!436467 () Bool)

(assert (=> start!66424 m!436467))

(declare-fun m!436469 () Bool)

(assert (=> b!297639 m!436469))

(declare-fun m!436471 () Bool)

(assert (=> b!297638 m!436471))

(declare-fun m!436473 () Bool)

(assert (=> b!297638 m!436473))

(declare-fun m!436475 () Bool)

(assert (=> b!297638 m!436475))

(declare-fun m!436477 () Bool)

(assert (=> b!297638 m!436477))

(declare-fun m!436479 () Bool)

(assert (=> b!297638 m!436479))

(declare-fun m!436481 () Bool)

(assert (=> b!297636 m!436481))

(push 1)

(assert (not b!297638))

(assert (not b!297636))

(assert (not b!297639))

(assert (not start!66424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!297715 () Bool)

(declare-fun e!213175 () Bool)

(declare-datatypes ((tuple4!926 0))(
  ( (tuple4!927 (_1!13112 (_ BitVec 32)) (_2!13112 (_ BitVec 32)) (_3!1420 (_ BitVec 32)) (_4!463 (_ BitVec 32))) )
))
(declare-fun lt!433960 () tuple4!926)

(declare-fun lt!433962 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297715 (= e!213175 (byteRangesEq!0 (select (arr!8803 arr!273) (_4!463 lt!433960)) (select (arr!8803 arr!273) (_4!463 lt!433960)) #b00000000000000000000000000000000 lt!433962))))

(declare-fun b!297716 () Bool)

(declare-fun e!213178 () Bool)

(declare-fun call!5262 () Bool)

(assert (=> b!297716 (= e!213178 call!5262)))

(declare-fun b!297717 () Bool)

(declare-fun e!213179 () Bool)

(declare-fun arrayRangesEq!1521 (array!17822 array!17822 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297717 (= e!213179 (arrayRangesEq!1521 arr!273 arr!273 (_1!13112 lt!433960) (_2!13112 lt!433960)))))

(declare-fun b!297718 () Bool)

(declare-fun e!213180 () Bool)

(assert (=> b!297718 (= e!213178 e!213180)))

(declare-fun res!245704 () Bool)

(assert (=> b!297718 (= res!245704 call!5262)))

(assert (=> b!297718 (=> (not res!245704) (not e!213180))))

(declare-fun d!100242 () Bool)

(declare-fun res!245706 () Bool)

(declare-fun e!213177 () Bool)

(assert (=> d!100242 (=> res!245706 e!213177)))

(assert (=> d!100242 (= res!245706 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!433880))))

(assert (=> d!100242 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433880) e!213177)))

(declare-fun b!297719 () Bool)

(declare-fun res!245707 () Bool)

(assert (=> b!297719 (= res!245707 (= lt!433962 #b00000000000000000000000000000000))))

(assert (=> b!297719 (=> res!245707 e!213175)))

(assert (=> b!297719 (= e!213180 e!213175)))

(declare-fun b!297720 () Bool)

(declare-fun e!213176 () Bool)

(assert (=> b!297720 (= e!213176 e!213178)))

(declare-fun c!13624 () Bool)

(assert (=> b!297720 (= c!13624 (= (_3!1420 lt!433960) (_4!463 lt!433960)))))

(declare-fun bm!5259 () Bool)

(declare-fun lt!433961 () (_ BitVec 32))

(assert (=> bm!5259 (= call!5262 (byteRangesEq!0 (select (arr!8803 arr!273) (_3!1420 lt!433960)) (select (arr!8803 arr!273) (_3!1420 lt!433960)) lt!433961 (ite c!13624 lt!433962 #b00000000000000000000000000001000)))))

(declare-fun b!297721 () Bool)

(assert (=> b!297721 (= e!213177 e!213176)))

(declare-fun res!245703 () Bool)

(assert (=> b!297721 (=> (not res!245703) (not e!213176))))

(assert (=> b!297721 (= res!245703 e!213179)))

(declare-fun res!245705 () Bool)

(assert (=> b!297721 (=> res!245705 e!213179)))

(assert (=> b!297721 (= res!245705 (bvsge (_1!13112 lt!433960) (_2!13112 lt!433960)))))

(assert (=> b!297721 (= lt!433962 ((_ extract 31 0) (bvsrem lt!433880 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297721 (= lt!433961 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!926)

(assert (=> b!297721 (= lt!433960 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433880))))

(assert (= (and d!100242 (not res!245706)) b!297721))

(assert (= (and b!297721 (not res!245705)) b!297717))

(assert (= (and b!297721 res!245703) b!297720))

(assert (= (and b!297720 c!13624) b!297716))

(assert (= (and b!297720 (not c!13624)) b!297718))

(assert (= (and b!297718 res!245704) b!297719))

(assert (= (and b!297719 (not res!245707)) b!297715))

(assert (= (or b!297716 b!297718) bm!5259))

(declare-fun m!436553 () Bool)

(assert (=> b!297715 m!436553))

(assert (=> b!297715 m!436553))

(assert (=> b!297715 m!436553))

(assert (=> b!297715 m!436553))

(declare-fun m!436555 () Bool)

(assert (=> b!297715 m!436555))

(declare-fun m!436557 () Bool)

(assert (=> b!297717 m!436557))

(declare-fun m!436559 () Bool)

(assert (=> bm!5259 m!436559))

(assert (=> bm!5259 m!436559))

(assert (=> bm!5259 m!436559))

(assert (=> bm!5259 m!436559))

(declare-fun m!436561 () Bool)

(assert (=> bm!5259 m!436561))

(declare-fun m!436563 () Bool)

(assert (=> b!297721 m!436563))

(assert (=> b!297638 d!100242))

(declare-fun d!100254 () Bool)

(declare-fun e!213183 () Bool)

(assert (=> d!100254 e!213183))

(declare-fun res!245710 () Bool)

(assert (=> d!100254 (=> (not res!245710) (not e!213183))))

(declare-fun lt!433968 () (_ BitVec 64))

(assert (=> d!100254 (= res!245710 (or (= lt!433968 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433968 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433968))))))

(assert (=> d!100254 (= lt!433968 ((_ sign_extend 32) (size!7723 arr!273)))))

(declare-fun lt!433967 () Unit!20767)

(declare-fun choose!59 (array!17822) Unit!20767)

(assert (=> d!100254 (= lt!433967 (choose!59 arr!273))))

(assert (=> d!100254 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!433967)))

(declare-fun b!297724 () Bool)

(assert (=> b!297724 (= e!213183 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7723 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100254 res!245710) b!297724))

(declare-fun m!436565 () Bool)

(assert (=> d!100254 m!436565))

(declare-fun m!436567 () Bool)

(assert (=> b!297724 m!436567))

(assert (=> b!297638 d!100254))

(declare-fun d!100258 () Bool)

(declare-fun e!213189 () Bool)

(assert (=> d!100258 e!213189))

(declare-fun res!245718 () Bool)

(assert (=> d!100258 (=> (not res!245718) (not e!213189))))

(declare-fun lt!433990 () (_ BitVec 64))

(declare-fun lt!433991 () (_ BitVec 64))

(declare-fun lt!433995 () (_ BitVec 64))

(assert (=> d!100258 (= res!245718 (= lt!433991 (bvsub lt!433990 lt!433995)))))

(assert (=> d!100258 (or (= (bvand lt!433990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433995 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433990 lt!433995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100258 (= lt!433995 (remainingBits!0 ((_ sign_extend 32) (size!7723 (buf!7786 thiss!1728))) ((_ sign_extend 32) (currentByte!14334 thiss!1728)) ((_ sign_extend 32) (currentBit!14329 thiss!1728))))))

(declare-fun lt!433994 () (_ BitVec 64))

(declare-fun lt!433993 () (_ BitVec 64))

(assert (=> d!100258 (= lt!433990 (bvmul lt!433994 lt!433993))))

(assert (=> d!100258 (or (= lt!433994 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433993 (bvsdiv (bvmul lt!433994 lt!433993) lt!433994)))))

(assert (=> d!100258 (= lt!433993 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100258 (= lt!433994 ((_ sign_extend 32) (size!7723 (buf!7786 thiss!1728))))))

(assert (=> d!100258 (= lt!433991 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14334 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14329 thiss!1728))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!100258 (invariant!0 (currentBit!14329 thiss!1728) (currentByte!14334 thiss!1728) (size!7723 (buf!7786 thiss!1728)))))

(assert (=> d!100258 (= (bitIndex!0 (size!7723 (buf!7786 thiss!1728)) (currentByte!14334 thiss!1728) (currentBit!14329 thiss!1728)) lt!433991)))

(declare-fun b!297732 () Bool)

(declare-fun res!245719 () Bool)

(assert (=> b!297732 (=> (not res!245719) (not e!213189))))

(assert (=> b!297732 (= res!245719 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433991))))

(declare-fun b!297733 () Bool)

(declare-fun lt!433992 () (_ BitVec 64))

(assert (=> b!297733 (= e!213189 (bvsle lt!433991 (bvmul lt!433992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297733 (or (= lt!433992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433992)))))

(assert (=> b!297733 (= lt!433992 ((_ sign_extend 32) (size!7723 (buf!7786 thiss!1728))))))

(assert (= (and d!100258 res!245718) b!297732))

(assert (= (and b!297732 res!245719) b!297733))

(declare-fun m!436575 () Bool)

(assert (=> d!100258 m!436575))

(declare-fun m!436577 () Bool)

(assert (=> d!100258 m!436577))

(assert (=> b!297638 d!100258))

(declare-fun lt!433998 () (_ BitVec 32))

(declare-fun b!297734 () Bool)

(declare-fun lt!433996 () tuple4!926)

(declare-fun e!213190 () Bool)

(assert (=> b!297734 (= e!213190 (byteRangesEq!0 (select (arr!8803 arr!273) (_4!463 lt!433996)) (select (arr!8803 arr!273) (_4!463 lt!433996)) #b00000000000000000000000000000000 lt!433998))))

(declare-fun b!297735 () Bool)

(declare-fun e!213193 () Bool)

(declare-fun call!5263 () Bool)

(assert (=> b!297735 (= e!213193 call!5263)))

(declare-fun b!297736 () Bool)

(declare-fun e!213194 () Bool)

(assert (=> b!297736 (= e!213194 (arrayRangesEq!1521 arr!273 arr!273 (_1!13112 lt!433996) (_2!13112 lt!433996)))))

(declare-fun b!297737 () Bool)

(declare-fun e!213195 () Bool)

(assert (=> b!297737 (= e!213193 e!213195)))

(declare-fun res!245721 () Bool)

(assert (=> b!297737 (= res!245721 call!5263)))

(assert (=> b!297737 (=> (not res!245721) (not e!213195))))

(declare-fun d!100266 () Bool)

(declare-fun res!245723 () Bool)

(declare-fun e!213192 () Bool)

(assert (=> d!100266 (=> res!245723 e!213192)))

(assert (=> d!100266 (= res!245723 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100266 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213192)))

(declare-fun b!297738 () Bool)

(declare-fun res!245724 () Bool)

(assert (=> b!297738 (= res!245724 (= lt!433998 #b00000000000000000000000000000000))))

(assert (=> b!297738 (=> res!245724 e!213190)))

(assert (=> b!297738 (= e!213195 e!213190)))

(declare-fun b!297739 () Bool)

(declare-fun e!213191 () Bool)

(assert (=> b!297739 (= e!213191 e!213193)))

(declare-fun c!13625 () Bool)

(assert (=> b!297739 (= c!13625 (= (_3!1420 lt!433996) (_4!463 lt!433996)))))

(declare-fun bm!5260 () Bool)

(declare-fun lt!433997 () (_ BitVec 32))

(assert (=> bm!5260 (= call!5263 (byteRangesEq!0 (select (arr!8803 arr!273) (_3!1420 lt!433996)) (select (arr!8803 arr!273) (_3!1420 lt!433996)) lt!433997 (ite c!13625 lt!433998 #b00000000000000000000000000001000)))))

(declare-fun b!297740 () Bool)

(assert (=> b!297740 (= e!213192 e!213191)))

(declare-fun res!245720 () Bool)

(assert (=> b!297740 (=> (not res!245720) (not e!213191))))

(assert (=> b!297740 (= res!245720 e!213194)))

(declare-fun res!245722 () Bool)

(assert (=> b!297740 (=> res!245722 e!213194)))

(assert (=> b!297740 (= res!245722 (bvsge (_1!13112 lt!433996) (_2!13112 lt!433996)))))

(assert (=> b!297740 (= lt!433998 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297740 (= lt!433997 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297740 (= lt!433996 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!100266 (not res!245723)) b!297740))

(assert (= (and b!297740 (not res!245722)) b!297736))

(assert (= (and b!297740 res!245720) b!297739))

(assert (= (and b!297739 c!13625) b!297735))

(assert (= (and b!297739 (not c!13625)) b!297737))

(assert (= (and b!297737 res!245721) b!297738))

(assert (= (and b!297738 (not res!245724)) b!297734))

(assert (= (or b!297735 b!297737) bm!5260))

(declare-fun m!436579 () Bool)

(assert (=> b!297734 m!436579))

(assert (=> b!297734 m!436579))

(assert (=> b!297734 m!436579))

(assert (=> b!297734 m!436579))

(declare-fun m!436581 () Bool)

(assert (=> b!297734 m!436581))

(declare-fun m!436583 () Bool)

(assert (=> b!297736 m!436583))

(declare-fun m!436585 () Bool)

(assert (=> bm!5260 m!436585))

(assert (=> bm!5260 m!436585))

(assert (=> bm!5260 m!436585))

(assert (=> bm!5260 m!436585))

(declare-fun m!436587 () Bool)

(assert (=> bm!5260 m!436587))

(declare-fun m!436589 () Bool)

(assert (=> b!297740 m!436589))

(assert (=> b!297638 d!100266))

(declare-fun d!100268 () Bool)

(assert (=> d!100268 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434001 () Unit!20767)

(declare-fun choose!4 (array!17822 array!17822 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20767)

(assert (=> d!100268 (= lt!434001 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433880 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100268 (bvsle (size!7723 arr!273) (size!7723 arr!273))))

(assert (=> d!100268 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433880 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!434001)))

(declare-fun bs!25651 () Bool)

(assert (= bs!25651 d!100268))

(assert (=> bs!25651 m!436477))

(declare-fun m!436591 () Bool)

(assert (=> bs!25651 m!436591))

(assert (=> b!297638 d!100268))

(declare-fun d!100270 () Bool)

(assert (=> d!100270 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7723 (buf!7786 thiss!1728))) ((_ sign_extend 32) (currentByte!14334 thiss!1728)) ((_ sign_extend 32) (currentBit!14329 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7723 (buf!7786 thiss!1728))) ((_ sign_extend 32) (currentByte!14334 thiss!1728)) ((_ sign_extend 32) (currentBit!14329 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25652 () Bool)

(assert (= bs!25652 d!100270))

(assert (=> bs!25652 m!436575))

(assert (=> b!297636 d!100270))

(declare-fun d!100272 () Bool)

(assert (=> d!100272 (= (array_inv!7335 (buf!7786 thiss!1728)) (bvsge (size!7723 (buf!7786 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!297639 d!100272))

(declare-fun d!100274 () Bool)

(assert (=> d!100274 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14329 thiss!1728) (currentByte!14334 thiss!1728) (size!7723 (buf!7786 thiss!1728))))))

(declare-fun bs!25653 () Bool)

(assert (= bs!25653 d!100274))

(assert (=> bs!25653 m!436577))

(assert (=> start!66424 d!100274))

(declare-fun d!100276 () Bool)

(assert (=> d!100276 (= (array_inv!7335 arr!273) (bvsge (size!7723 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66424 d!100276))

(push 1)

(assert (not d!100268))

(assert (not b!297740))

(assert (not b!297724))

(assert (not b!297721))

(assert (not d!100254))

(assert (not b!297734))

(assert (not b!297717))

(assert (not d!100270))

(assert (not b!297736))

(assert (not bm!5260))

(assert (not b!297715))

(assert (not bm!5259))

(assert (not d!100258))

(assert (not d!100274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

