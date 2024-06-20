; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66426 () Bool)

(assert start!66426)

(declare-fun b!297648 () Bool)

(declare-fun res!245654 () Bool)

(declare-fun e!213117 () Bool)

(assert (=> b!297648 (=> (not res!245654) (not e!213117))))

(declare-datatypes ((array!17824 0))(
  ( (array!17825 (arr!8804 (Array (_ BitVec 32) (_ BitVec 8))) (size!7724 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13452 0))(
  ( (BitStream!13453 (buf!7787 array!17824) (currentByte!14335 (_ BitVec 32)) (currentBit!14330 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13452)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297648 (= res!245654 (validate_offset_bits!1 ((_ sign_extend 32) (size!7724 (buf!7787 thiss!1728))) ((_ sign_extend 32) (currentByte!14335 thiss!1728)) ((_ sign_extend 32) (currentBit!14330 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun lt!433896 () (_ BitVec 64))

(declare-fun lt!433899 () (_ BitVec 64))

(declare-fun b!297650 () Bool)

(assert (=> b!297650 (= e!213117 (not (or (= lt!433899 (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!433899 (bvand (bvsub lt!433896 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!297650 (= lt!433899 (bvand lt!433896 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297650 (= lt!433896 (bvadd (bitIndex!0 (size!7724 (buf!7787 thiss!1728)) (currentByte!14335 thiss!1728) (currentBit!14330 thiss!1728)) to!474))))

(declare-fun arr!273 () array!17824)

(declare-fun arrayBitRangesEq!0 (array!17824 array!17824 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297650 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433897 () (_ BitVec 64))

(declare-datatypes ((Unit!20769 0))(
  ( (Unit!20770) )
))
(declare-fun lt!433898 () Unit!20769)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17824 array!17824 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20769)

(assert (=> b!297650 (= lt!433898 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433897 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297650 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433897)))

(assert (=> b!297650 (= lt!433897 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7724 arr!273))))))

(declare-fun lt!433895 () Unit!20769)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17824) Unit!20769)

(assert (=> b!297650 (= lt!433895 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245652 () Bool)

(assert (=> start!66426 (=> (not res!245652) (not e!213117))))

(assert (=> start!66426 (= res!245652 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7724 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66426 e!213117))

(declare-fun e!213118 () Bool)

(declare-fun inv!12 (BitStream!13452) Bool)

(assert (=> start!66426 (and (inv!12 thiss!1728) e!213118)))

(assert (=> start!66426 true))

(declare-fun array_inv!7336 (array!17824) Bool)

(assert (=> start!66426 (array_inv!7336 arr!273)))

(declare-fun b!297651 () Bool)

(assert (=> b!297651 (= e!213118 (array_inv!7336 (buf!7787 thiss!1728)))))

(declare-fun b!297649 () Bool)

(declare-fun res!245653 () Bool)

(assert (=> b!297649 (=> (not res!245653) (not e!213117))))

(assert (=> b!297649 (= res!245653 (bvsge from!505 to!474))))

(assert (= (and start!66426 res!245652) b!297648))

(assert (= (and b!297648 res!245654) b!297649))

(assert (= (and b!297649 res!245653) b!297650))

(assert (= start!66426 b!297651))

(declare-fun m!436483 () Bool)

(assert (=> b!297648 m!436483))

(declare-fun m!436485 () Bool)

(assert (=> b!297650 m!436485))

(declare-fun m!436487 () Bool)

(assert (=> b!297650 m!436487))

(declare-fun m!436489 () Bool)

(assert (=> b!297650 m!436489))

(declare-fun m!436491 () Bool)

(assert (=> b!297650 m!436491))

(declare-fun m!436493 () Bool)

(assert (=> b!297650 m!436493))

(declare-fun m!436495 () Bool)

(assert (=> start!66426 m!436495))

(declare-fun m!436497 () Bool)

(assert (=> start!66426 m!436497))

(declare-fun m!436499 () Bool)

(assert (=> b!297651 m!436499))

(check-sat (not b!297650) (not b!297648) (not b!297651) (not start!66426))
(check-sat)
(get-model)

(declare-fun d!100236 () Bool)

(declare-fun e!213135 () Bool)

(assert (=> d!100236 e!213135))

(declare-fun res!245666 () Bool)

(assert (=> d!100236 (=> (not res!245666) (not e!213135))))

(declare-fun lt!433920 () (_ BitVec 64))

(assert (=> d!100236 (= res!245666 (or (= lt!433920 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433920 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433920))))))

(assert (=> d!100236 (= lt!433920 ((_ sign_extend 32) (size!7724 arr!273)))))

(declare-fun lt!433919 () Unit!20769)

(declare-fun choose!59 (array!17824) Unit!20769)

(assert (=> d!100236 (= lt!433919 (choose!59 arr!273))))

(assert (=> d!100236 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!433919)))

(declare-fun b!297666 () Bool)

(assert (=> b!297666 (= e!213135 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7724 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100236 res!245666) b!297666))

(declare-fun m!436519 () Bool)

(assert (=> d!100236 m!436519))

(declare-fun m!436521 () Bool)

(assert (=> b!297666 m!436521))

(assert (=> b!297650 d!100236))

(declare-fun d!100238 () Bool)

(declare-fun e!213138 () Bool)

(assert (=> d!100238 e!213138))

(declare-fun res!245671 () Bool)

(assert (=> d!100238 (=> (not res!245671) (not e!213138))))

(declare-fun lt!433933 () (_ BitVec 64))

(declare-fun lt!433938 () (_ BitVec 64))

(declare-fun lt!433937 () (_ BitVec 64))

(assert (=> d!100238 (= res!245671 (= lt!433937 (bvsub lt!433938 lt!433933)))))

(assert (=> d!100238 (or (= (bvand lt!433938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433933 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433938 lt!433933) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100238 (= lt!433933 (remainingBits!0 ((_ sign_extend 32) (size!7724 (buf!7787 thiss!1728))) ((_ sign_extend 32) (currentByte!14335 thiss!1728)) ((_ sign_extend 32) (currentBit!14330 thiss!1728))))))

(declare-fun lt!433935 () (_ BitVec 64))

(declare-fun lt!433936 () (_ BitVec 64))

(assert (=> d!100238 (= lt!433938 (bvmul lt!433935 lt!433936))))

(assert (=> d!100238 (or (= lt!433935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433936 (bvsdiv (bvmul lt!433935 lt!433936) lt!433935)))))

(assert (=> d!100238 (= lt!433936 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100238 (= lt!433935 ((_ sign_extend 32) (size!7724 (buf!7787 thiss!1728))))))

(assert (=> d!100238 (= lt!433937 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14335 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14330 thiss!1728))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!100238 (invariant!0 (currentBit!14330 thiss!1728) (currentByte!14335 thiss!1728) (size!7724 (buf!7787 thiss!1728)))))

(assert (=> d!100238 (= (bitIndex!0 (size!7724 (buf!7787 thiss!1728)) (currentByte!14335 thiss!1728) (currentBit!14330 thiss!1728)) lt!433937)))

(declare-fun b!297671 () Bool)

(declare-fun res!245672 () Bool)

(assert (=> b!297671 (=> (not res!245672) (not e!213138))))

(assert (=> b!297671 (= res!245672 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433937))))

(declare-fun b!297672 () Bool)

(declare-fun lt!433934 () (_ BitVec 64))

(assert (=> b!297672 (= e!213138 (bvsle lt!433937 (bvmul lt!433934 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297672 (or (= lt!433934 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433934 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433934)))))

(assert (=> b!297672 (= lt!433934 ((_ sign_extend 32) (size!7724 (buf!7787 thiss!1728))))))

(assert (= (and d!100238 res!245671) b!297671))

(assert (= (and b!297671 res!245672) b!297672))

(declare-fun m!436523 () Bool)

(assert (=> d!100238 m!436523))

(declare-fun m!436525 () Bool)

(assert (=> d!100238 m!436525))

(assert (=> b!297650 d!100238))

(declare-fun b!297687 () Bool)

(declare-fun e!213152 () Bool)

(declare-fun e!213153 () Bool)

(assert (=> b!297687 (= e!213152 e!213153)))

(declare-fun res!245684 () Bool)

(assert (=> b!297687 (=> (not res!245684) (not e!213153))))

(declare-fun e!213156 () Bool)

(assert (=> b!297687 (= res!245684 e!213156)))

(declare-fun res!245687 () Bool)

(assert (=> b!297687 (=> res!245687 e!213156)))

(declare-datatypes ((tuple4!924 0))(
  ( (tuple4!925 (_1!13111 (_ BitVec 32)) (_2!13111 (_ BitVec 32)) (_3!1419 (_ BitVec 32)) (_4!462 (_ BitVec 32))) )
))
(declare-fun lt!433946 () tuple4!924)

(assert (=> b!297687 (= res!245687 (bvsge (_1!13111 lt!433946) (_2!13111 lt!433946)))))

(declare-fun lt!433947 () (_ BitVec 32))

(assert (=> b!297687 (= lt!433947 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433945 () (_ BitVec 32))

(assert (=> b!297687 (= lt!433945 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!924)

(assert (=> b!297687 (= lt!433946 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun c!13620 () Bool)

(declare-fun call!5258 () Bool)

(declare-fun bm!5255 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5255 (= call!5258 (byteRangesEq!0 (ite c!13620 (select (arr!8804 arr!273) (_3!1419 lt!433946)) (select (arr!8804 arr!273) (_4!462 lt!433946))) (ite c!13620 (select (arr!8804 arr!273) (_3!1419 lt!433946)) (select (arr!8804 arr!273) (_4!462 lt!433946))) (ite c!13620 lt!433945 #b00000000000000000000000000000000) lt!433947))))

(declare-fun b!297688 () Bool)

(declare-fun e!213154 () Bool)

(assert (=> b!297688 (= e!213153 e!213154)))

(assert (=> b!297688 (= c!13620 (= (_3!1419 lt!433946) (_4!462 lt!433946)))))

(declare-fun b!297689 () Bool)

(declare-fun e!213155 () Bool)

(assert (=> b!297689 (= e!213154 e!213155)))

(declare-fun res!245683 () Bool)

(assert (=> b!297689 (= res!245683 (byteRangesEq!0 (select (arr!8804 arr!273) (_3!1419 lt!433946)) (select (arr!8804 arr!273) (_3!1419 lt!433946)) lt!433945 #b00000000000000000000000000001000))))

(assert (=> b!297689 (=> (not res!245683) (not e!213155))))

(declare-fun b!297690 () Bool)

(declare-fun e!213151 () Bool)

(assert (=> b!297690 (= e!213151 call!5258)))

(declare-fun b!297691 () Bool)

(assert (=> b!297691 (= e!213154 call!5258)))

(declare-fun b!297692 () Bool)

(declare-fun res!245686 () Bool)

(assert (=> b!297692 (= res!245686 (= lt!433947 #b00000000000000000000000000000000))))

(assert (=> b!297692 (=> res!245686 e!213151)))

(assert (=> b!297692 (= e!213155 e!213151)))

(declare-fun d!100240 () Bool)

(declare-fun res!245685 () Bool)

(assert (=> d!100240 (=> res!245685 e!213152)))

(assert (=> d!100240 (= res!245685 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100240 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213152)))

(declare-fun b!297693 () Bool)

(declare-fun arrayRangesEq!1520 (array!17824 array!17824 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297693 (= e!213156 (arrayRangesEq!1520 arr!273 arr!273 (_1!13111 lt!433946) (_2!13111 lt!433946)))))

(assert (= (and d!100240 (not res!245685)) b!297687))

(assert (= (and b!297687 (not res!245687)) b!297693))

(assert (= (and b!297687 res!245684) b!297688))

(assert (= (and b!297688 c!13620) b!297691))

(assert (= (and b!297688 (not c!13620)) b!297689))

(assert (= (and b!297689 res!245683) b!297692))

(assert (= (and b!297692 (not res!245686)) b!297690))

(assert (= (or b!297691 b!297690) bm!5255))

(declare-fun m!436527 () Bool)

(assert (=> b!297687 m!436527))

(declare-fun m!436529 () Bool)

(assert (=> bm!5255 m!436529))

(declare-fun m!436531 () Bool)

(assert (=> bm!5255 m!436531))

(declare-fun m!436533 () Bool)

(assert (=> bm!5255 m!436533))

(assert (=> bm!5255 m!436531))

(assert (=> bm!5255 m!436529))

(assert (=> b!297689 m!436529))

(assert (=> b!297689 m!436529))

(assert (=> b!297689 m!436529))

(assert (=> b!297689 m!436529))

(declare-fun m!436535 () Bool)

(assert (=> b!297689 m!436535))

(declare-fun m!436537 () Bool)

(assert (=> b!297693 m!436537))

(assert (=> b!297650 d!100240))

(declare-fun d!100244 () Bool)

(assert (=> d!100244 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433956 () Unit!20769)

(declare-fun choose!4 (array!17824 array!17824 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20769)

(assert (=> d!100244 (= lt!433956 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433897 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100244 (bvsle (size!7724 arr!273) (size!7724 arr!273))))

(assert (=> d!100244 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433897 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!433956)))

(declare-fun bs!25647 () Bool)

(assert (= bs!25647 d!100244))

(assert (=> bs!25647 m!436493))

(declare-fun m!436539 () Bool)

(assert (=> bs!25647 m!436539))

(assert (=> b!297650 d!100244))

(declare-fun b!297708 () Bool)

(declare-fun e!213170 () Bool)

(declare-fun e!213171 () Bool)

(assert (=> b!297708 (= e!213170 e!213171)))

(declare-fun res!245699 () Bool)

(assert (=> b!297708 (=> (not res!245699) (not e!213171))))

(declare-fun e!213174 () Bool)

(assert (=> b!297708 (= res!245699 e!213174)))

(declare-fun res!245702 () Bool)

(assert (=> b!297708 (=> res!245702 e!213174)))

(declare-fun lt!433958 () tuple4!924)

(assert (=> b!297708 (= res!245702 (bvsge (_1!13111 lt!433958) (_2!13111 lt!433958)))))

(declare-fun lt!433959 () (_ BitVec 32))

(assert (=> b!297708 (= lt!433959 ((_ extract 31 0) (bvsrem lt!433897 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433957 () (_ BitVec 32))

(assert (=> b!297708 (= lt!433957 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297708 (= lt!433958 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433897))))

(declare-fun call!5261 () Bool)

(declare-fun bm!5258 () Bool)

(declare-fun c!13623 () Bool)

(assert (=> bm!5258 (= call!5261 (byteRangesEq!0 (ite c!13623 (select (arr!8804 arr!273) (_3!1419 lt!433958)) (select (arr!8804 arr!273) (_4!462 lt!433958))) (ite c!13623 (select (arr!8804 arr!273) (_3!1419 lt!433958)) (select (arr!8804 arr!273) (_4!462 lt!433958))) (ite c!13623 lt!433957 #b00000000000000000000000000000000) lt!433959))))

(declare-fun b!297709 () Bool)

(declare-fun e!213172 () Bool)

(assert (=> b!297709 (= e!213171 e!213172)))

(assert (=> b!297709 (= c!13623 (= (_3!1419 lt!433958) (_4!462 lt!433958)))))

(declare-fun b!297710 () Bool)

(declare-fun e!213173 () Bool)

(assert (=> b!297710 (= e!213172 e!213173)))

(declare-fun res!245698 () Bool)

(assert (=> b!297710 (= res!245698 (byteRangesEq!0 (select (arr!8804 arr!273) (_3!1419 lt!433958)) (select (arr!8804 arr!273) (_3!1419 lt!433958)) lt!433957 #b00000000000000000000000000001000))))

(assert (=> b!297710 (=> (not res!245698) (not e!213173))))

(declare-fun b!297711 () Bool)

(declare-fun e!213169 () Bool)

(assert (=> b!297711 (= e!213169 call!5261)))

(declare-fun b!297712 () Bool)

(assert (=> b!297712 (= e!213172 call!5261)))

(declare-fun b!297713 () Bool)

(declare-fun res!245701 () Bool)

(assert (=> b!297713 (= res!245701 (= lt!433959 #b00000000000000000000000000000000))))

(assert (=> b!297713 (=> res!245701 e!213169)))

(assert (=> b!297713 (= e!213173 e!213169)))

(declare-fun d!100246 () Bool)

(declare-fun res!245700 () Bool)

(assert (=> d!100246 (=> res!245700 e!213170)))

(assert (=> d!100246 (= res!245700 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!433897))))

(assert (=> d!100246 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433897) e!213170)))

(declare-fun b!297714 () Bool)

(assert (=> b!297714 (= e!213174 (arrayRangesEq!1520 arr!273 arr!273 (_1!13111 lt!433958) (_2!13111 lt!433958)))))

(assert (= (and d!100246 (not res!245700)) b!297708))

(assert (= (and b!297708 (not res!245702)) b!297714))

(assert (= (and b!297708 res!245699) b!297709))

(assert (= (and b!297709 c!13623) b!297712))

(assert (= (and b!297709 (not c!13623)) b!297710))

(assert (= (and b!297710 res!245698) b!297713))

(assert (= (and b!297713 (not res!245701)) b!297711))

(assert (= (or b!297712 b!297711) bm!5258))

(declare-fun m!436541 () Bool)

(assert (=> b!297708 m!436541))

(declare-fun m!436543 () Bool)

(assert (=> bm!5258 m!436543))

(declare-fun m!436545 () Bool)

(assert (=> bm!5258 m!436545))

(declare-fun m!436547 () Bool)

(assert (=> bm!5258 m!436547))

(assert (=> bm!5258 m!436545))

(assert (=> bm!5258 m!436543))

(assert (=> b!297710 m!436543))

(assert (=> b!297710 m!436543))

(assert (=> b!297710 m!436543))

(assert (=> b!297710 m!436543))

(declare-fun m!436549 () Bool)

(assert (=> b!297710 m!436549))

(declare-fun m!436551 () Bool)

(assert (=> b!297714 m!436551))

(assert (=> b!297650 d!100246))

(declare-fun d!100248 () Bool)

(assert (=> d!100248 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7724 (buf!7787 thiss!1728))) ((_ sign_extend 32) (currentByte!14335 thiss!1728)) ((_ sign_extend 32) (currentBit!14330 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7724 (buf!7787 thiss!1728))) ((_ sign_extend 32) (currentByte!14335 thiss!1728)) ((_ sign_extend 32) (currentBit!14330 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25648 () Bool)

(assert (= bs!25648 d!100248))

(assert (=> bs!25648 m!436523))

(assert (=> b!297648 d!100248))

(declare-fun d!100250 () Bool)

(assert (=> d!100250 (= (array_inv!7336 (buf!7787 thiss!1728)) (bvsge (size!7724 (buf!7787 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!297651 d!100250))

(declare-fun d!100252 () Bool)

(assert (=> d!100252 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14330 thiss!1728) (currentByte!14335 thiss!1728) (size!7724 (buf!7787 thiss!1728))))))

(declare-fun bs!25649 () Bool)

(assert (= bs!25649 d!100252))

(assert (=> bs!25649 m!436525))

(assert (=> start!66426 d!100252))

(declare-fun d!100256 () Bool)

(assert (=> d!100256 (= (array_inv!7336 arr!273) (bvsge (size!7724 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66426 d!100256))

(check-sat (not b!297714) (not bm!5258) (not d!100244) (not b!297687) (not bm!5255) (not b!297666) (not b!297689) (not b!297710) (not d!100248) (not d!100252) (not b!297708) (not d!100238) (not b!297693) (not d!100236))
