; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66164 () Bool)

(assert start!66164)

(declare-fun b!296677 () Bool)

(declare-fun res!244937 () Bool)

(declare-fun e!212317 () Bool)

(assert (=> b!296677 (=> (not res!244937) (not e!212317))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!296677 (= res!244937 (bvslt from!505 to!474))))

(declare-fun b!296678 () Bool)

(declare-fun res!244939 () Bool)

(assert (=> b!296678 (=> (not res!244939) (not e!212317))))

(declare-datatypes ((array!17757 0))(
  ( (array!17758 (arr!8760 (Array (_ BitVec 32) (_ BitVec 8))) (size!7695 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13394 0))(
  ( (BitStream!13395 (buf!7758 array!17757) (currentByte!14285 (_ BitVec 32)) (currentBit!14280 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13394)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296678 (= res!244939 (validate_offset_bits!1 ((_ sign_extend 32) (size!7695 (buf!7758 thiss!1728))) ((_ sign_extend 32) (currentByte!14285 thiss!1728)) ((_ sign_extend 32) (currentBit!14280 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296679 () Bool)

(declare-fun e!212319 () Bool)

(declare-fun lt!432378 () Bool)

(declare-datatypes ((tuple2!23348 0))(
  ( (tuple2!23349 (_1!13080 Bool) (_2!13080 BitStream!13394)) )
))
(declare-fun lt!432379 () tuple2!23348)

(assert (=> b!296679 (= e!212319 (= lt!432378 (_1!13080 lt!432379)))))

(declare-fun e!212315 () Bool)

(declare-fun b!296680 () Bool)

(declare-fun arr!273 () array!17757)

(declare-datatypes ((Unit!20687 0))(
  ( (Unit!20688) )
))
(declare-datatypes ((tuple3!1906 0))(
  ( (tuple3!1907 (_1!13081 Unit!20687) (_2!13081 BitStream!13394) (_3!1406 array!17757)) )
))
(declare-fun lt!432384 () tuple3!1906)

(assert (=> b!296680 (= e!212315 (and (= (buf!7758 thiss!1728) (buf!7758 (_2!13081 lt!432384))) (= (size!7695 arr!273) (size!7695 (_3!1406 lt!432384)))))))

(declare-fun b!296681 () Bool)

(declare-fun e!212316 () Bool)

(declare-fun array_inv!7307 (array!17757) Bool)

(assert (=> b!296681 (= e!212316 (array_inv!7307 (buf!7758 thiss!1728)))))

(declare-fun b!296682 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296682 (= e!212317 (not (invariant!0 (currentBit!14280 (_2!13081 lt!432384)) (currentByte!14285 (_2!13081 lt!432384)) (size!7695 (buf!7758 (_2!13081 lt!432384))))))))

(assert (=> b!296682 e!212319))

(declare-fun res!244938 () Bool)

(assert (=> b!296682 (=> (not res!244938) (not e!212319))))

(declare-fun lt!432380 () array!17757)

(declare-fun bitAt!0 (array!17757 (_ BitVec 64)) Bool)

(assert (=> b!296682 (= res!244938 (= (bitAt!0 lt!432380 from!505) lt!432378))))

(assert (=> b!296682 (= lt!432378 (bitAt!0 (_3!1406 lt!432384) from!505))))

(declare-fun lt!432375 () Unit!20687)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17757 array!17757 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20687)

(assert (=> b!296682 (= lt!432375 (arrayBitRangesEqImpliesEq!0 lt!432380 (_3!1406 lt!432384) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17757 array!17757 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296682 (arrayBitRangesEq!0 arr!273 (_3!1406 lt!432384) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432381 () Unit!20687)

(declare-fun arrayBitRangesEqTransitive!0 (array!17757 array!17757 array!17757 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20687)

(assert (=> b!296682 (= lt!432381 (arrayBitRangesEqTransitive!0 arr!273 lt!432380 (_3!1406 lt!432384) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296682 (arrayBitRangesEq!0 arr!273 lt!432380 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432377 () Unit!20687)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17757 (_ BitVec 64) Bool) Unit!20687)

(assert (=> b!296682 (= lt!432377 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13080 lt!432379)))))

(assert (=> b!296682 e!212315))

(declare-fun res!244936 () Bool)

(assert (=> b!296682 (=> (not res!244936) (not e!212315))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296682 (= res!244936 (= (bvsub (bvadd (bitIndex!0 (size!7695 (buf!7758 thiss!1728)) (currentByte!14285 thiss!1728) (currentBit!14280 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7695 (buf!7758 (_2!13081 lt!432384))) (currentByte!14285 (_2!13081 lt!432384)) (currentBit!14280 (_2!13081 lt!432384)))))))

(declare-fun readBitsLoop!0 (BitStream!13394 (_ BitVec 64) array!17757 (_ BitVec 64) (_ BitVec 64)) tuple3!1906)

(assert (=> b!296682 (= lt!432384 (readBitsLoop!0 (_2!13080 lt!432379) nBits!523 lt!432380 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296682 (validate_offset_bits!1 ((_ sign_extend 32) (size!7695 (buf!7758 (_2!13080 lt!432379)))) ((_ sign_extend 32) (currentByte!14285 (_2!13080 lt!432379))) ((_ sign_extend 32) (currentBit!14280 (_2!13080 lt!432379))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!432376 () Unit!20687)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13394 BitStream!13394 (_ BitVec 64) (_ BitVec 64)) Unit!20687)

(assert (=> b!296682 (= lt!432376 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13080 lt!432379) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!432382 () (_ BitVec 32))

(declare-fun lt!432383 () (_ BitVec 32))

(assert (=> b!296682 (= lt!432380 (array!17758 (store (arr!8760 arr!273) lt!432382 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8760 arr!273) lt!432382)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432383)))) ((_ sign_extend 24) (ite (_1!13080 lt!432379) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432383) #b00000000))))) (size!7695 arr!273)))))

(assert (=> b!296682 (= lt!432383 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296682 (= lt!432382 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13394) tuple2!23348)

(assert (=> b!296682 (= lt!432379 (readBit!0 thiss!1728))))

(declare-fun res!244940 () Bool)

(assert (=> start!66164 (=> (not res!244940) (not e!212317))))

(assert (=> start!66164 (= res!244940 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7695 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66164 e!212317))

(declare-fun inv!12 (BitStream!13394) Bool)

(assert (=> start!66164 (and (inv!12 thiss!1728) e!212316)))

(assert (=> start!66164 true))

(assert (=> start!66164 (array_inv!7307 arr!273)))

(assert (= (and start!66164 res!244940) b!296678))

(assert (= (and b!296678 res!244939) b!296677))

(assert (= (and b!296677 res!244937) b!296682))

(assert (= (and b!296682 res!244936) b!296680))

(assert (= (and b!296682 res!244938) b!296679))

(assert (= start!66164 b!296681))

(declare-fun m!435085 () Bool)

(assert (=> b!296678 m!435085))

(declare-fun m!435087 () Bool)

(assert (=> b!296681 m!435087))

(declare-fun m!435089 () Bool)

(assert (=> b!296682 m!435089))

(declare-fun m!435091 () Bool)

(assert (=> b!296682 m!435091))

(declare-fun m!435093 () Bool)

(assert (=> b!296682 m!435093))

(declare-fun m!435095 () Bool)

(assert (=> b!296682 m!435095))

(declare-fun m!435097 () Bool)

(assert (=> b!296682 m!435097))

(declare-fun m!435099 () Bool)

(assert (=> b!296682 m!435099))

(declare-fun m!435101 () Bool)

(assert (=> b!296682 m!435101))

(declare-fun m!435103 () Bool)

(assert (=> b!296682 m!435103))

(declare-fun m!435105 () Bool)

(assert (=> b!296682 m!435105))

(declare-fun m!435107 () Bool)

(assert (=> b!296682 m!435107))

(declare-fun m!435109 () Bool)

(assert (=> b!296682 m!435109))

(declare-fun m!435111 () Bool)

(assert (=> b!296682 m!435111))

(declare-fun m!435113 () Bool)

(assert (=> b!296682 m!435113))

(declare-fun m!435115 () Bool)

(assert (=> b!296682 m!435115))

(declare-fun m!435117 () Bool)

(assert (=> b!296682 m!435117))

(declare-fun m!435119 () Bool)

(assert (=> b!296682 m!435119))

(declare-fun m!435121 () Bool)

(assert (=> b!296682 m!435121))

(declare-fun m!435123 () Bool)

(assert (=> start!66164 m!435123))

(declare-fun m!435125 () Bool)

(assert (=> start!66164 m!435125))

(push 1)

(assert (not b!296681))

(assert (not start!66164))

(assert (not b!296678))

(assert (not b!296682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99952 () Bool)

(assert (=> d!99952 (= (array_inv!7307 (buf!7758 thiss!1728)) (bvsge (size!7695 (buf!7758 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!296681 d!99952))

(declare-fun d!99954 () Bool)

(assert (=> d!99954 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14280 thiss!1728) (currentByte!14285 thiss!1728) (size!7695 (buf!7758 thiss!1728))))))

(declare-fun bs!25567 () Bool)

(assert (= bs!25567 d!99954))

(declare-fun m!435159 () Bool)

(assert (=> bs!25567 m!435159))

(assert (=> start!66164 d!99954))

(declare-fun d!99956 () Bool)

(assert (=> d!99956 (= (array_inv!7307 arr!273) (bvsge (size!7695 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66164 d!99956))

(declare-fun d!99958 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99958 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7695 (buf!7758 thiss!1728))) ((_ sign_extend 32) (currentByte!14285 thiss!1728)) ((_ sign_extend 32) (currentBit!14280 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7695 (buf!7758 thiss!1728))) ((_ sign_extend 32) (currentByte!14285 thiss!1728)) ((_ sign_extend 32) (currentBit!14280 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25568 () Bool)

(assert (= bs!25568 d!99958))

(declare-fun m!435161 () Bool)

(assert (=> bs!25568 m!435161))

(assert (=> b!296678 d!99958))

(declare-fun d!99960 () Bool)

(declare-fun e!212346 () Bool)

(assert (=> d!99960 e!212346))

(declare-fun res!244965 () Bool)

(assert (=> d!99960 (=> (not res!244965) (not e!212346))))

(declare-fun lt!432409 () (_ BitVec 64))

(declare-fun lt!432412 () (_ BitVec 64))

(declare-fun lt!432410 () (_ BitVec 64))

(assert (=> d!99960 (= res!244965 (= lt!432409 (bvsub lt!432410 lt!432412)))))

(assert (=> d!99960 (or (= (bvand lt!432410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!432412 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432410 lt!432412) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99960 (= lt!432412 (remainingBits!0 ((_ sign_extend 32) (size!7695 (buf!7758 (_2!13081 lt!432384)))) ((_ sign_extend 32) (currentByte!14285 (_2!13081 lt!432384))) ((_ sign_extend 32) (currentBit!14280 (_2!13081 lt!432384)))))))

(declare-fun lt!432414 () (_ BitVec 64))

(declare-fun lt!432413 () (_ BitVec 64))

(assert (=> d!99960 (= lt!432410 (bvmul lt!432414 lt!432413))))

(assert (=> d!99960 (or (= lt!432414 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!432413 (bvsdiv (bvmul lt!432414 lt!432413) lt!432414)))))

(assert (=> d!99960 (= lt!432413 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99960 (= lt!432414 ((_ sign_extend 32) (size!7695 (buf!7758 (_2!13081 lt!432384)))))))

(assert (=> d!99960 (= lt!432409 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14285 (_2!13081 lt!432384))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14280 (_2!13081 lt!432384)))))))

(assert (=> d!99960 (invariant!0 (currentBit!14280 (_2!13081 lt!432384)) (currentByte!14285 (_2!13081 lt!432384)) (size!7695 (buf!7758 (_2!13081 lt!432384))))))

(assert (=> d!99960 (= (bitIndex!0 (size!7695 (buf!7758 (_2!13081 lt!432384))) (currentByte!14285 (_2!13081 lt!432384)) (currentBit!14280 (_2!13081 lt!432384))) lt!432409)))

(declare-fun b!296715 () Bool)

(declare-fun res!244966 () Bool)

(assert (=> b!296715 (=> (not res!244966) (not e!212346))))

(assert (=> b!296715 (= res!244966 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!432409))))

(declare-fun b!296716 () Bool)

(declare-fun lt!432411 () (_ BitVec 64))

(assert (=> b!296716 (= e!212346 (bvsle lt!432409 (bvmul lt!432411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296716 (or (= lt!432411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!432411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!432411)))))

(assert (=> b!296716 (= lt!432411 ((_ sign_extend 32) (size!7695 (buf!7758 (_2!13081 lt!432384)))))))

(assert (= (and d!99960 res!244965) b!296715))

(assert (= (and b!296715 res!244966) b!296716))

(declare-fun m!435163 () Bool)

(assert (=> d!99960 m!435163))

(assert (=> d!99960 m!435111))

(assert (=> b!296682 d!99960))

(declare-fun d!99962 () Bool)

(assert (=> d!99962 (= (bitAt!0 lt!432380 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8760 lt!432380) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25569 () Bool)

(assert (= bs!25569 d!99962))

(declare-fun m!435165 () Bool)

(assert (=> bs!25569 m!435165))

(declare-fun m!435167 () Bool)

(assert (=> bs!25569 m!435167))

(assert (=> b!296682 d!99962))

(declare-fun b!296731 () Bool)

(declare-fun e!212364 () Bool)

(declare-fun e!212359 () Bool)

(assert (=> b!296731 (= e!212364 e!212359)))

(declare-fun c!13543 () Bool)

(declare-datatypes ((tuple4!910 0))(
  ( (tuple4!911 (_1!13087 (_ BitVec 32)) (_2!13087 (_ BitVec 32)) (_3!1409 (_ BitVec 32)) (_4!455 (_ BitVec 32))) )
))
(declare-fun lt!432421 () tuple4!910)

(assert (=> b!296731 (= c!13543 (= (_3!1409 lt!432421) (_4!455 lt!432421)))))

(declare-fun b!296732 () Bool)

(declare-fun res!244978 () Bool)

(declare-fun lt!432422 () (_ BitVec 32))

(assert (=> b!296732 (= res!244978 (= lt!432422 #b00000000000000000000000000000000))))

(declare-fun e!212362 () Bool)

(assert (=> b!296732 (=> res!244978 e!212362)))

(declare-fun e!212363 () Bool)

(assert (=> b!296732 (= e!212363 e!212362)))

(declare-fun b!296733 () Bool)

(declare-fun e!212361 () Bool)

(declare-fun arrayRangesEq!1513 (array!17757 array!17757 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296733 (= e!212361 (arrayRangesEq!1513 arr!273 (_3!1406 lt!432384) (_1!13087 lt!432421) (_2!13087 lt!432421)))))

(declare-fun b!296734 () Bool)

(assert (=> b!296734 (= e!212359 e!212363)))

(declare-fun res!244981 () Bool)

(declare-fun lt!432423 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296734 (= res!244981 (byteRangesEq!0 (select (arr!8760 arr!273) (_3!1409 lt!432421)) (select (arr!8760 (_3!1406 lt!432384)) (_3!1409 lt!432421)) lt!432423 #b00000000000000000000000000001000))))

(assert (=> b!296734 (=> (not res!244981) (not e!212363))))

(declare-fun b!296735 () Bool)

(declare-fun call!5190 () Bool)

(assert (=> b!296735 (= e!212362 call!5190)))

(declare-fun bm!5187 () Bool)

(assert (=> bm!5187 (= call!5190 (byteRangesEq!0 (ite c!13543 (select (arr!8760 arr!273) (_3!1409 lt!432421)) (select (arr!8760 arr!273) (_4!455 lt!432421))) (ite c!13543 (select (arr!8760 (_3!1406 lt!432384)) (_3!1409 lt!432421)) (select (arr!8760 (_3!1406 lt!432384)) (_4!455 lt!432421))) (ite c!13543 lt!432423 #b00000000000000000000000000000000) lt!432422))))

(declare-fun b!296737 () Bool)

(assert (=> b!296737 (= e!212359 call!5190)))

(declare-fun b!296736 () Bool)

(declare-fun e!212360 () Bool)

(assert (=> b!296736 (= e!212360 e!212364)))

(declare-fun res!244977 () Bool)

(assert (=> b!296736 (=> (not res!244977) (not e!212364))))

(assert (=> b!296736 (= res!244977 e!212361)))

(declare-fun res!244980 () Bool)

(assert (=> b!296736 (=> res!244980 e!212361)))

(assert (=> b!296736 (= res!244980 (bvsge (_1!13087 lt!432421) (_2!13087 lt!432421)))))

(assert (=> b!296736 (= lt!432422 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296736 (= lt!432423 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!910)

(assert (=> b!296736 (= lt!432421 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!99964 () Bool)

(declare-fun res!244979 () Bool)

(assert (=> d!99964 (=> res!244979 e!212360)))

(assert (=> d!99964 (= res!244979 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99964 (= (arrayBitRangesEq!0 arr!273 (_3!1406 lt!432384) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212360)))

(assert (= (and d!99964 (not res!244979)) b!296736))

(assert (= (and b!296736 (not res!244980)) b!296733))

(assert (= (and b!296736 res!244977) b!296731))

(assert (= (and b!296731 c!13543) b!296737))

(assert (= (and b!296731 (not c!13543)) b!296734))

(assert (= (and b!296734 res!244981) b!296732))

(assert (= (and b!296732 (not res!244978)) b!296735))

(assert (= (or b!296737 b!296735) bm!5187))

(declare-fun m!435169 () Bool)

(assert (=> b!296733 m!435169))

(declare-fun m!435171 () Bool)

(assert (=> b!296734 m!435171))

(declare-fun m!435173 () Bool)

(assert (=> b!296734 m!435173))

(assert (=> b!296734 m!435171))

(assert (=> b!296734 m!435173))

(declare-fun m!435175 () Bool)

(assert (=> b!296734 m!435175))

(assert (=> bm!5187 m!435173))

(declare-fun m!435177 () Bool)

(assert (=> bm!5187 m!435177))

(declare-fun m!435179 () Bool)

(assert (=> bm!5187 m!435179))

(declare-fun m!435181 () Bool)

(assert (=> bm!5187 m!435181))

(assert (=> bm!5187 m!435171))

(declare-fun m!435183 () Bool)

(assert (=> b!296736 m!435183))

(assert (=> b!296682 d!99964))

(declare-fun b!296873 () Bool)

(declare-fun res!245097 () Bool)

(declare-fun e!212454 () Bool)

(assert (=> b!296873 (=> (not res!245097) (not e!212454))))

(declare-fun lt!432883 () tuple3!1906)

(assert (=> b!296873 (= res!245097 (arrayBitRangesEq!0 lt!432380 (_3!1406 lt!432883) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!296874 () Bool)

(declare-datatypes ((List!995 0))(
  ( (Nil!992) (Cons!991 (h!1110 Bool) (t!1880 List!995)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13394 array!17757 (_ BitVec 64) (_ BitVec 64)) List!995)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13394 BitStream!13394 (_ BitVec 64)) List!995)

(assert (=> b!296874 (= e!212454 (= (byteArrayBitContentToList!0 (_2!13081 lt!432883) (_3!1406 lt!432883) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13081 lt!432883) (_2!13080 lt!432379) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!296874 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!296874 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296875 () Bool)

(declare-fun res!245091 () Bool)

(assert (=> b!296875 (=> (not res!245091) (not e!212454))))

(assert (=> b!296875 (= res!245091 (invariant!0 (currentBit!14280 (_2!13081 lt!432883)) (currentByte!14285 (_2!13081 lt!432883)) (size!7695 (buf!7758 (_2!13081 lt!432883)))))))

(declare-fun b!296876 () Bool)

(declare-fun res!245092 () Bool)

(assert (=> b!296876 (=> (not res!245092) (not e!212454))))

(declare-fun e!212457 () Bool)

(assert (=> b!296876 (= res!245092 e!212457)))

(declare-fun res!245095 () Bool)

(assert (=> b!296876 (=> res!245095 e!212457)))

(assert (=> b!296876 (= res!245095 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun d!99966 () Bool)

(assert (=> d!99966 e!212454))

(declare-fun res!245096 () Bool)

(assert (=> d!99966 (=> (not res!245096) (not e!212454))))

(declare-fun lt!432874 () (_ BitVec 64))

(assert (=> d!99966 (= res!245096 (= (bvsub lt!432874 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7695 (buf!7758 (_2!13081 lt!432883))) (currentByte!14285 (_2!13081 lt!432883)) (currentBit!14280 (_2!13081 lt!432883)))))))

(assert (=> d!99966 (or (= (bvand lt!432874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432874 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432867 () (_ BitVec 64))

(assert (=> d!99966 (= lt!432874 (bvadd lt!432867 to!474))))

(assert (=> d!99966 (or (not (= (bvand lt!432867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!432867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!432867 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99966 (= lt!432867 (bitIndex!0 (size!7695 (buf!7758 (_2!13080 lt!432379))) (currentByte!14285 (_2!13080 lt!432379)) (currentBit!14280 (_2!13080 lt!432379))))))

(declare-fun e!212455 () tuple3!1906)

(assert (=> d!99966 (= lt!432883 e!212455)))

(declare-fun c!13556 () Bool)

(assert (=> d!99966 (= c!13556 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99966 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99966 (= (readBitsLoop!0 (_2!13080 lt!432379) nBits!523 lt!432380 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!432883)))

(declare-fun lt!432876 () (_ BitVec 64))

(declare-fun lt!432877 () (_ BitVec 64))

(declare-fun bm!5208 () Bool)

(declare-fun lt!432873 () (_ BitVec 64))

(declare-fun lt!432851 () array!17757)

(declare-fun lt!432871 () array!17757)

(declare-fun lt!432856 () tuple3!1906)

(declare-fun call!5211 () Bool)

(assert (=> bm!5208 (= call!5211 (arrayBitRangesEq!0 (ite c!13556 lt!432380 lt!432871) (ite c!13556 (_3!1406 lt!432856) lt!432851) (ite c!13556 lt!432873 lt!432877) (ite c!13556 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!432876)))))

(declare-fun b!296877 () Bool)

(declare-datatypes ((tuple2!23358 0))(
  ( (tuple2!23359 (_1!13089 BitStream!13394) (_2!13089 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13394) tuple2!23358)

(assert (=> b!296877 (= e!212457 (= (bitAt!0 (_3!1406 lt!432883) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13089 (readBitPure!0 (_2!13080 lt!432379)))))))

(declare-fun e!212456 () Bool)

(declare-fun b!296878 () Bool)

(assert (=> b!296878 (= e!212456 (and (= (buf!7758 (_2!13080 lt!432379)) (buf!7758 (_2!13081 lt!432856))) (= (size!7695 lt!432380) (size!7695 (_3!1406 lt!432856)))))))

(declare-fun b!296879 () Bool)

(declare-fun lt!432869 () Unit!20687)

(assert (=> b!296879 (= e!212455 (tuple3!1907 lt!432869 (_2!13081 lt!432856) (_3!1406 lt!432856)))))

(declare-fun lt!432853 () tuple2!23348)

(assert (=> b!296879 (= lt!432853 (readBit!0 (_2!13080 lt!432379)))))

(declare-fun lt!432862 () (_ BitVec 32))

(assert (=> b!296879 (= lt!432862 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432864 () (_ BitVec 32))

(assert (=> b!296879 (= lt!432864 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432870 () array!17757)

(assert (=> b!296879 (= lt!432870 (array!17758 (store (arr!8760 lt!432380) lt!432862 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8760 lt!432380) lt!432862)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432864)))) ((_ sign_extend 24) (ite (_1!13080 lt!432853) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432864) #b00000000))))) (size!7695 lt!432380)))))

(declare-fun lt!432860 () (_ BitVec 64))

(assert (=> b!296879 (= lt!432860 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!432878 () (_ BitVec 64))

(assert (=> b!296879 (= lt!432878 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!432858 () Unit!20687)

(assert (=> b!296879 (= lt!432858 (validateOffsetBitsIneqLemma!0 (_2!13080 lt!432379) (_2!13080 lt!432853) lt!432860 lt!432878))))

(assert (=> b!296879 (validate_offset_bits!1 ((_ sign_extend 32) (size!7695 (buf!7758 (_2!13080 lt!432853)))) ((_ sign_extend 32) (currentByte!14285 (_2!13080 lt!432853))) ((_ sign_extend 32) (currentBit!14280 (_2!13080 lt!432853))) (bvsub lt!432860 lt!432878))))

(declare-fun lt!432875 () Unit!20687)

(assert (=> b!296879 (= lt!432875 lt!432858)))

(assert (=> b!296879 (= lt!432856 (readBitsLoop!0 (_2!13080 lt!432853) nBits!523 lt!432870 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!245094 () Bool)

(assert (=> b!296879 (= res!245094 (= (bvsub (bvadd (bitIndex!0 (size!7695 (buf!7758 (_2!13080 lt!432379))) (currentByte!14285 (_2!13080 lt!432379)) (currentBit!14280 (_2!13080 lt!432379))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7695 (buf!7758 (_2!13081 lt!432856))) (currentByte!14285 (_2!13081 lt!432856)) (currentBit!14280 (_2!13081 lt!432856)))))))

(assert (=> b!296879 (=> (not res!245094) (not e!212456))))

(assert (=> b!296879 e!212456))

(declare-fun lt!432868 () Unit!20687)

(declare-fun Unit!20697 () Unit!20687)

(assert (=> b!296879 (= lt!432868 Unit!20697)))

(declare-fun lt!432850 () (_ BitVec 32))

(assert (=> b!296879 (= lt!432850 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432882 () (_ BitVec 32))

(assert (=> b!296879 (= lt!432882 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432854 () Unit!20687)

(assert (=> b!296879 (= lt!432854 (arrayBitRangesUpdatedAtLemma!0 lt!432380 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!13080 lt!432853)))))

(declare-fun call!5212 () Bool)

(assert (=> b!296879 call!5212))

(declare-fun lt!432879 () Unit!20687)

(assert (=> b!296879 (= lt!432879 lt!432854)))

(assert (=> b!296879 (= lt!432873 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432859 () Unit!20687)

(assert (=> b!296879 (= lt!432859 (arrayBitRangesEqTransitive!0 lt!432380 lt!432870 (_3!1406 lt!432856) lt!432873 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!296879 call!5211))

(declare-fun lt!432872 () Unit!20687)

(assert (=> b!296879 (= lt!432872 lt!432859)))

(assert (=> b!296879 (arrayBitRangesEq!0 lt!432380 (_3!1406 lt!432856) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!432884 () Unit!20687)

(declare-fun Unit!20698 () Unit!20687)

(assert (=> b!296879 (= lt!432884 Unit!20698)))

(declare-fun lt!432857 () Unit!20687)

(assert (=> b!296879 (= lt!432857 (arrayBitRangesEqImpliesEq!0 lt!432870 (_3!1406 lt!432856) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!296879 (= (bitAt!0 lt!432870 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1406 lt!432856) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!432849 () Unit!20687)

(assert (=> b!296879 (= lt!432849 lt!432857)))

(declare-fun lt!432863 () Unit!20687)

(declare-fun Unit!20699 () Unit!20687)

(assert (=> b!296879 (= lt!432863 Unit!20699)))

(declare-fun lt!432865 () Bool)

(assert (=> b!296879 (= lt!432865 (= (bitAt!0 (_3!1406 lt!432856) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!13080 lt!432853)))))

(declare-fun Unit!20700 () Unit!20687)

(assert (=> b!296879 (= lt!432869 Unit!20700)))

(assert (=> b!296879 lt!432865))

(declare-fun b!296880 () Bool)

(declare-fun res!245093 () Bool)

(assert (=> b!296880 (=> (not res!245093) (not e!212454))))

(assert (=> b!296880 (= res!245093 (and (= (buf!7758 (_2!13080 lt!432379)) (buf!7758 (_2!13081 lt!432883))) (= (size!7695 lt!432380) (size!7695 (_3!1406 lt!432883)))))))

(declare-fun bm!5209 () Bool)

(assert (=> bm!5209 (= call!5212 (arrayBitRangesEq!0 lt!432380 (ite c!13556 (array!17758 (store (arr!8760 lt!432380) lt!432850 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8760 lt!432380) lt!432850)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432882)))) ((_ sign_extend 24) (ite (_1!13080 lt!432853) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432882) #b00000000))))) (size!7695 lt!432380)) lt!432380) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13556 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7695 lt!432380)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!432881 () Unit!20687)

(declare-fun b!296881 () Bool)

(assert (=> b!296881 (= e!212455 (tuple3!1907 lt!432881 (_2!13080 lt!432379) lt!432380))))

(declare-fun lt!432880 () Unit!20687)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17757) Unit!20687)

(assert (=> b!296881 (= lt!432880 (arrayBitRangesEqReflexiveLemma!0 lt!432380))))

(assert (=> b!296881 call!5212))

(declare-fun lt!432861 () Unit!20687)

(assert (=> b!296881 (= lt!432861 lt!432880)))

(assert (=> b!296881 (= lt!432871 lt!432380)))

(assert (=> b!296881 (= lt!432851 lt!432380)))

(declare-fun lt!432852 () (_ BitVec 64))

(assert (=> b!296881 (= lt!432852 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432855 () (_ BitVec 64))

(assert (=> b!296881 (= lt!432855 ((_ sign_extend 32) (size!7695 lt!432380)))))

(declare-fun lt!432866 () (_ BitVec 64))

(assert (=> b!296881 (= lt!432866 (bvmul lt!432855 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!296881 (= lt!432877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!296881 (= lt!432876 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17757 array!17757 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20687)

(assert (=> b!296881 (= lt!432881 (arrayBitRangesEqSlicedLemma!0 lt!432871 lt!432851 lt!432852 lt!432866 lt!432877 lt!432876))))

(assert (=> b!296881 call!5211))

(assert (= (and d!99966 c!13556) b!296879))

(assert (= (and d!99966 (not c!13556)) b!296881))

(assert (= (and b!296879 res!245094) b!296878))

(assert (= (or b!296879 b!296881) bm!5208))

(assert (= (or b!296879 b!296881) bm!5209))

(assert (= (and d!99966 res!245096) b!296880))

(assert (= (and b!296880 res!245093) b!296873))

(assert (= (and b!296873 res!245097) b!296876))

(assert (= (and b!296876 (not res!245095)) b!296877))

(assert (= (and b!296876 res!245092) b!296875))

(assert (= (and b!296875 res!245091) b!296874))

(declare-fun m!435407 () Bool)

(assert (=> bm!5209 m!435407))

(declare-fun m!435409 () Bool)

(assert (=> bm!5209 m!435409))

(declare-fun m!435411 () Bool)

(assert (=> bm!5209 m!435411))

(declare-fun m!435413 () Bool)

(assert (=> bm!5209 m!435413))

(declare-fun m!435415 () Bool)

(assert (=> b!296881 m!435415))

(declare-fun m!435417 () Bool)

(assert (=> b!296881 m!435417))

(declare-fun m!435419 () Bool)

(assert (=> b!296879 m!435419))

(declare-fun m!435423 () Bool)

(assert (=> b!296879 m!435423))

(declare-fun m!435425 () Bool)

(assert (=> b!296879 m!435425))

(declare-fun m!435427 () Bool)

(assert (=> b!296879 m!435427))

(declare-fun m!435429 () Bool)

(assert (=> b!296879 m!435429))

(declare-fun m!435431 () Bool)

(assert (=> b!296879 m!435431))

(declare-fun m!435433 () Bool)

(assert (=> b!296879 m!435433))

(declare-fun m!435435 () Bool)

(assert (=> b!296879 m!435435))

(declare-fun m!435437 () Bool)

(assert (=> b!296879 m!435437))

(declare-fun m!435439 () Bool)

(assert (=> b!296879 m!435439))

(declare-fun m!435441 () Bool)

(assert (=> b!296879 m!435441))

(declare-fun m!435443 () Bool)

(assert (=> b!296879 m!435443))

(declare-fun m!435445 () Bool)

(assert (=> b!296879 m!435445))

(declare-fun m!435447 () Bool)

(assert (=> b!296879 m!435447))

(declare-fun m!435449 () Bool)

(assert (=> b!296879 m!435449))

(declare-fun m!435451 () Bool)

(assert (=> b!296874 m!435451))

(declare-fun m!435453 () Bool)

(assert (=> b!296874 m!435453))

(declare-fun m!435455 () Bool)

(assert (=> b!296873 m!435455))

(declare-fun m!435457 () Bool)

(assert (=> bm!5208 m!435457))

(declare-fun m!435459 () Bool)

(assert (=> b!296875 m!435459))

(declare-fun m!435461 () Bool)

(assert (=> b!296877 m!435461))

(declare-fun m!435463 () Bool)

(assert (=> b!296877 m!435463))

(declare-fun m!435465 () Bool)

(assert (=> d!99966 m!435465))

(assert (=> d!99966 m!435445))

(assert (=> b!296682 d!99966))

(declare-fun b!296883 () Bool)

(declare-fun e!212464 () Bool)

(declare-fun e!212459 () Bool)

(assert (=> b!296883 (= e!212464 e!212459)))

(declare-fun c!13557 () Bool)

(declare-fun lt!432892 () tuple4!910)

(assert (=> b!296883 (= c!13557 (= (_3!1409 lt!432892) (_4!455 lt!432892)))))

(declare-fun b!296884 () Bool)

(declare-fun res!245100 () Bool)

(declare-fun lt!432893 () (_ BitVec 32))

(assert (=> b!296884 (= res!245100 (= lt!432893 #b00000000000000000000000000000000))))

(declare-fun e!212462 () Bool)

(assert (=> b!296884 (=> res!245100 e!212462)))

(declare-fun e!212463 () Bool)

(assert (=> b!296884 (= e!212463 e!212462)))

(declare-fun b!296885 () Bool)

(declare-fun e!212461 () Bool)

(assert (=> b!296885 (= e!212461 (arrayRangesEq!1513 arr!273 lt!432380 (_1!13087 lt!432892) (_2!13087 lt!432892)))))

(declare-fun b!296886 () Bool)

(assert (=> b!296886 (= e!212459 e!212463)))

(declare-fun res!245103 () Bool)

(declare-fun lt!432894 () (_ BitVec 32))

(assert (=> b!296886 (= res!245103 (byteRangesEq!0 (select (arr!8760 arr!273) (_3!1409 lt!432892)) (select (arr!8760 lt!432380) (_3!1409 lt!432892)) lt!432894 #b00000000000000000000000000001000))))

(assert (=> b!296886 (=> (not res!245103) (not e!212463))))

(declare-fun b!296887 () Bool)

(declare-fun call!5213 () Bool)

(assert (=> b!296887 (= e!212462 call!5213)))

(declare-fun bm!5210 () Bool)

(assert (=> bm!5210 (= call!5213 (byteRangesEq!0 (ite c!13557 (select (arr!8760 arr!273) (_3!1409 lt!432892)) (select (arr!8760 arr!273) (_4!455 lt!432892))) (ite c!13557 (select (arr!8760 lt!432380) (_3!1409 lt!432892)) (select (arr!8760 lt!432380) (_4!455 lt!432892))) (ite c!13557 lt!432894 #b00000000000000000000000000000000) lt!432893))))

(declare-fun b!296889 () Bool)

(assert (=> b!296889 (= e!212459 call!5213)))

(declare-fun b!296888 () Bool)

(declare-fun e!212460 () Bool)

(assert (=> b!296888 (= e!212460 e!212464)))

(declare-fun res!245099 () Bool)

(assert (=> b!296888 (=> (not res!245099) (not e!212464))))

(assert (=> b!296888 (= res!245099 e!212461)))

(declare-fun res!245102 () Bool)

(assert (=> b!296888 (=> res!245102 e!212461)))

(assert (=> b!296888 (= res!245102 (bvsge (_1!13087 lt!432892) (_2!13087 lt!432892)))))

(assert (=> b!296888 (= lt!432893 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296888 (= lt!432894 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296888 (= lt!432892 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!100026 () Bool)

(declare-fun res!245101 () Bool)

(assert (=> d!100026 (=> res!245101 e!212460)))

(assert (=> d!100026 (= res!245101 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100026 (= (arrayBitRangesEq!0 arr!273 lt!432380 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212460)))

(assert (= (and d!100026 (not res!245101)) b!296888))

(assert (= (and b!296888 (not res!245102)) b!296885))

(assert (= (and b!296888 res!245099) b!296883))

(assert (= (and b!296883 c!13557) b!296889))

(assert (= (and b!296883 (not c!13557)) b!296886))

(assert (= (and b!296886 res!245103) b!296884))

(assert (= (and b!296884 (not res!245100)) b!296887))

(assert (= (or b!296889 b!296887) bm!5210))

(declare-fun m!435467 () Bool)

(assert (=> b!296885 m!435467))

(declare-fun m!435469 () Bool)

(assert (=> b!296886 m!435469))

(declare-fun m!435471 () Bool)

(assert (=> b!296886 m!435471))

(assert (=> b!296886 m!435469))

(assert (=> b!296886 m!435471))

(declare-fun m!435473 () Bool)

(assert (=> b!296886 m!435473))

