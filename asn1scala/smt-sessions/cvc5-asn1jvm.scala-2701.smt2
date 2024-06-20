; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66160 () Bool)

(assert start!66160)

(declare-fun b!296641 () Bool)

(declare-fun e!212281 () Bool)

(declare-datatypes ((array!17753 0))(
  ( (array!17754 (arr!8758 (Array (_ BitVec 32) (_ BitVec 8))) (size!7693 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13390 0))(
  ( (BitStream!13391 (buf!7756 array!17753) (currentByte!14283 (_ BitVec 32)) (currentBit!14278 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13390)

(declare-fun array_inv!7305 (array!17753) Bool)

(assert (=> b!296641 (= e!212281 (array_inv!7305 (buf!7756 thiss!1728)))))

(declare-fun e!212283 () Bool)

(declare-datatypes ((Unit!20683 0))(
  ( (Unit!20684) )
))
(declare-datatypes ((tuple3!1902 0))(
  ( (tuple3!1903 (_1!13076 Unit!20683) (_2!13076 BitStream!13390) (_3!1404 array!17753)) )
))
(declare-fun lt!432322 () tuple3!1902)

(declare-fun b!296642 () Bool)

(declare-fun arr!273 () array!17753)

(assert (=> b!296642 (= e!212283 (and (= (buf!7756 thiss!1728) (buf!7756 (_2!13076 lt!432322))) (= (size!7693 arr!273) (size!7693 (_3!1404 lt!432322)))))))

(declare-fun b!296643 () Bool)

(declare-fun res!244906 () Bool)

(declare-fun e!212278 () Bool)

(assert (=> b!296643 (=> (not res!244906) (not e!212278))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296643 (= res!244906 (validate_offset_bits!1 ((_ sign_extend 32) (size!7693 (buf!7756 thiss!1728))) ((_ sign_extend 32) (currentByte!14283 thiss!1728)) ((_ sign_extend 32) (currentBit!14278 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296644 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296644 (= e!212278 (not (invariant!0 (currentBit!14278 (_2!13076 lt!432322)) (currentByte!14283 (_2!13076 lt!432322)) (size!7693 (buf!7756 (_2!13076 lt!432322))))))))

(declare-fun e!212279 () Bool)

(assert (=> b!296644 e!212279))

(declare-fun res!244908 () Bool)

(assert (=> b!296644 (=> (not res!244908) (not e!212279))))

(declare-fun lt!432316 () Bool)

(declare-fun lt!432320 () array!17753)

(declare-fun bitAt!0 (array!17753 (_ BitVec 64)) Bool)

(assert (=> b!296644 (= res!244908 (= (bitAt!0 lt!432320 from!505) lt!432316))))

(assert (=> b!296644 (= lt!432316 (bitAt!0 (_3!1404 lt!432322) from!505))))

(declare-fun lt!432317 () Unit!20683)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17753 array!17753 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20683)

(assert (=> b!296644 (= lt!432317 (arrayBitRangesEqImpliesEq!0 lt!432320 (_3!1404 lt!432322) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17753 array!17753 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296644 (arrayBitRangesEq!0 arr!273 (_3!1404 lt!432322) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432318 () Unit!20683)

(declare-fun arrayBitRangesEqTransitive!0 (array!17753 array!17753 array!17753 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20683)

(assert (=> b!296644 (= lt!432318 (arrayBitRangesEqTransitive!0 arr!273 lt!432320 (_3!1404 lt!432322) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296644 (arrayBitRangesEq!0 arr!273 lt!432320 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23344 0))(
  ( (tuple2!23345 (_1!13077 Bool) (_2!13077 BitStream!13390)) )
))
(declare-fun lt!432315 () tuple2!23344)

(declare-fun lt!432319 () Unit!20683)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17753 (_ BitVec 64) Bool) Unit!20683)

(assert (=> b!296644 (= lt!432319 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13077 lt!432315)))))

(assert (=> b!296644 e!212283))

(declare-fun res!244909 () Bool)

(assert (=> b!296644 (=> (not res!244909) (not e!212283))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296644 (= res!244909 (= (bvsub (bvadd (bitIndex!0 (size!7693 (buf!7756 thiss!1728)) (currentByte!14283 thiss!1728) (currentBit!14278 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7693 (buf!7756 (_2!13076 lt!432322))) (currentByte!14283 (_2!13076 lt!432322)) (currentBit!14278 (_2!13076 lt!432322)))))))

(declare-fun readBitsLoop!0 (BitStream!13390 (_ BitVec 64) array!17753 (_ BitVec 64) (_ BitVec 64)) tuple3!1902)

(assert (=> b!296644 (= lt!432322 (readBitsLoop!0 (_2!13077 lt!432315) nBits!523 lt!432320 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296644 (validate_offset_bits!1 ((_ sign_extend 32) (size!7693 (buf!7756 (_2!13077 lt!432315)))) ((_ sign_extend 32) (currentByte!14283 (_2!13077 lt!432315))) ((_ sign_extend 32) (currentBit!14278 (_2!13077 lt!432315))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!432324 () Unit!20683)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13390 BitStream!13390 (_ BitVec 64) (_ BitVec 64)) Unit!20683)

(assert (=> b!296644 (= lt!432324 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13077 lt!432315) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!432321 () (_ BitVec 32))

(declare-fun lt!432323 () (_ BitVec 32))

(assert (=> b!296644 (= lt!432320 (array!17754 (store (arr!8758 arr!273) lt!432323 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8758 arr!273) lt!432323)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432321)))) ((_ sign_extend 24) (ite (_1!13077 lt!432315) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432321) #b00000000))))) (size!7693 arr!273)))))

(assert (=> b!296644 (= lt!432321 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296644 (= lt!432323 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13390) tuple2!23344)

(assert (=> b!296644 (= lt!432315 (readBit!0 thiss!1728))))

(declare-fun b!296645 () Bool)

(assert (=> b!296645 (= e!212279 (= lt!432316 (_1!13077 lt!432315)))))

(declare-fun b!296646 () Bool)

(declare-fun res!244907 () Bool)

(assert (=> b!296646 (=> (not res!244907) (not e!212278))))

(assert (=> b!296646 (= res!244907 (bvslt from!505 to!474))))

(declare-fun res!244910 () Bool)

(assert (=> start!66160 (=> (not res!244910) (not e!212278))))

(assert (=> start!66160 (= res!244910 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7693 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66160 e!212278))

(declare-fun inv!12 (BitStream!13390) Bool)

(assert (=> start!66160 (and (inv!12 thiss!1728) e!212281)))

(assert (=> start!66160 true))

(assert (=> start!66160 (array_inv!7305 arr!273)))

(assert (= (and start!66160 res!244910) b!296643))

(assert (= (and b!296643 res!244906) b!296646))

(assert (= (and b!296646 res!244907) b!296644))

(assert (= (and b!296644 res!244909) b!296642))

(assert (= (and b!296644 res!244908) b!296645))

(assert (= start!66160 b!296641))

(declare-fun m!435001 () Bool)

(assert (=> b!296641 m!435001))

(declare-fun m!435003 () Bool)

(assert (=> b!296643 m!435003))

(declare-fun m!435005 () Bool)

(assert (=> b!296644 m!435005))

(declare-fun m!435007 () Bool)

(assert (=> b!296644 m!435007))

(declare-fun m!435009 () Bool)

(assert (=> b!296644 m!435009))

(declare-fun m!435011 () Bool)

(assert (=> b!296644 m!435011))

(declare-fun m!435013 () Bool)

(assert (=> b!296644 m!435013))

(declare-fun m!435015 () Bool)

(assert (=> b!296644 m!435015))

(declare-fun m!435017 () Bool)

(assert (=> b!296644 m!435017))

(declare-fun m!435019 () Bool)

(assert (=> b!296644 m!435019))

(declare-fun m!435021 () Bool)

(assert (=> b!296644 m!435021))

(declare-fun m!435023 () Bool)

(assert (=> b!296644 m!435023))

(declare-fun m!435025 () Bool)

(assert (=> b!296644 m!435025))

(declare-fun m!435027 () Bool)

(assert (=> b!296644 m!435027))

(declare-fun m!435029 () Bool)

(assert (=> b!296644 m!435029))

(declare-fun m!435031 () Bool)

(assert (=> b!296644 m!435031))

(declare-fun m!435033 () Bool)

(assert (=> b!296644 m!435033))

(declare-fun m!435035 () Bool)

(assert (=> b!296644 m!435035))

(declare-fun m!435037 () Bool)

(assert (=> b!296644 m!435037))

(declare-fun m!435039 () Bool)

(assert (=> start!66160 m!435039))

(declare-fun m!435041 () Bool)

(assert (=> start!66160 m!435041))

(push 1)

(assert (not b!296644))

(assert (not b!296643))

(assert (not b!296641))

(assert (not start!66160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99944 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99944 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7693 (buf!7756 (_2!13077 lt!432315)))) ((_ sign_extend 32) (currentByte!14283 (_2!13077 lt!432315))) ((_ sign_extend 32) (currentBit!14278 (_2!13077 lt!432315))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7693 (buf!7756 (_2!13077 lt!432315)))) ((_ sign_extend 32) (currentByte!14283 (_2!13077 lt!432315))) ((_ sign_extend 32) (currentBit!14278 (_2!13077 lt!432315)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25566 () Bool)

(assert (= bs!25566 d!99944))

(declare-fun m!435127 () Bool)

(assert (=> bs!25566 m!435127))

(assert (=> b!296644 d!99944))

(declare-fun b!296697 () Bool)

(declare-fun e!212336 () Bool)

(declare-fun e!212335 () Bool)

(assert (=> b!296697 (= e!212336 e!212335)))

(declare-fun res!244955 () Bool)

(assert (=> b!296697 (=> (not res!244955) (not e!212335))))

(declare-fun e!212333 () Bool)

(assert (=> b!296697 (= res!244955 e!212333)))

(declare-fun res!244951 () Bool)

(assert (=> b!296697 (=> res!244951 e!212333)))

(declare-datatypes ((tuple4!906 0))(
  ( (tuple4!907 (_1!13083 (_ BitVec 32)) (_2!13083 (_ BitVec 32)) (_3!1407 (_ BitVec 32)) (_4!453 (_ BitVec 32))) )
))
(declare-fun lt!432392 () tuple4!906)

(assert (=> b!296697 (= res!244951 (bvsge (_1!13083 lt!432392) (_2!13083 lt!432392)))))

(declare-fun lt!432391 () (_ BitVec 32))

(assert (=> b!296697 (= lt!432391 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432393 () (_ BitVec 32))

(assert (=> b!296697 (= lt!432393 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!906)

(assert (=> b!296697 (= lt!432392 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!296698 () Bool)

(declare-fun e!212337 () Bool)

(declare-fun call!5186 () Bool)

(assert (=> b!296698 (= e!212337 call!5186)))

(declare-fun e!212334 () Bool)

(declare-fun b!296699 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296699 (= e!212334 (byteRangesEq!0 (select (arr!8758 arr!273) (_4!453 lt!432392)) (select (arr!8758 (_3!1404 lt!432322)) (_4!453 lt!432392)) #b00000000000000000000000000000000 lt!432391))))

(declare-fun d!99946 () Bool)

(declare-fun res!244953 () Bool)

(assert (=> d!99946 (=> res!244953 e!212336)))

(assert (=> d!99946 (= res!244953 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99946 (= (arrayBitRangesEq!0 arr!273 (_3!1404 lt!432322) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212336)))

(declare-fun b!296700 () Bool)

(declare-fun e!212332 () Bool)

(assert (=> b!296700 (= e!212337 e!212332)))

(declare-fun res!244954 () Bool)

(assert (=> b!296700 (= res!244954 call!5186)))

(assert (=> b!296700 (=> (not res!244954) (not e!212332))))

(declare-fun b!296701 () Bool)

(declare-fun arrayRangesEq!1511 (array!17753 array!17753 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296701 (= e!212333 (arrayRangesEq!1511 arr!273 (_3!1404 lt!432322) (_1!13083 lt!432392) (_2!13083 lt!432392)))))

(declare-fun b!296702 () Bool)

(assert (=> b!296702 (= e!212335 e!212337)))

(declare-fun c!13539 () Bool)

(assert (=> b!296702 (= c!13539 (= (_3!1407 lt!432392) (_4!453 lt!432392)))))

(declare-fun b!296703 () Bool)

(declare-fun res!244952 () Bool)

(assert (=> b!296703 (= res!244952 (= lt!432391 #b00000000000000000000000000000000))))

(assert (=> b!296703 (=> res!244952 e!212334)))

(assert (=> b!296703 (= e!212332 e!212334)))

(declare-fun bm!5183 () Bool)

(assert (=> bm!5183 (= call!5186 (byteRangesEq!0 (select (arr!8758 arr!273) (_3!1407 lt!432392)) (select (arr!8758 (_3!1404 lt!432322)) (_3!1407 lt!432392)) lt!432393 (ite c!13539 lt!432391 #b00000000000000000000000000001000)))))

(assert (= (and d!99946 (not res!244953)) b!296697))

(assert (= (and b!296697 (not res!244951)) b!296701))

(assert (= (and b!296697 res!244955) b!296702))

(assert (= (and b!296702 c!13539) b!296698))

(assert (= (and b!296702 (not c!13539)) b!296700))

(assert (= (and b!296700 res!244954) b!296703))

(assert (= (and b!296703 (not res!244952)) b!296699))

(assert (= (or b!296698 b!296700) bm!5183))

(declare-fun m!435129 () Bool)

(assert (=> b!296697 m!435129))

(declare-fun m!435131 () Bool)

(assert (=> b!296699 m!435131))

(declare-fun m!435133 () Bool)

(assert (=> b!296699 m!435133))

(assert (=> b!296699 m!435131))

(assert (=> b!296699 m!435133))

(declare-fun m!435135 () Bool)

(assert (=> b!296699 m!435135))

(declare-fun m!435137 () Bool)

(assert (=> b!296701 m!435137))

(declare-fun m!435139 () Bool)

(assert (=> bm!5183 m!435139))

(declare-fun m!435141 () Bool)

(assert (=> bm!5183 m!435141))

(assert (=> bm!5183 m!435139))

(assert (=> bm!5183 m!435141))

(declare-fun m!435143 () Bool)

(assert (=> bm!5183 m!435143))

(assert (=> b!296644 d!99946))

(declare-fun b!296704 () Bool)

(declare-fun e!212342 () Bool)

(declare-fun e!212341 () Bool)

(assert (=> b!296704 (= e!212342 e!212341)))

(declare-fun res!244960 () Bool)

(assert (=> b!296704 (=> (not res!244960) (not e!212341))))

(declare-fun e!212339 () Bool)

(assert (=> b!296704 (= res!244960 e!212339)))

(declare-fun res!244956 () Bool)

(assert (=> b!296704 (=> res!244956 e!212339)))

(declare-fun lt!432395 () tuple4!906)

(assert (=> b!296704 (= res!244956 (bvsge (_1!13083 lt!432395) (_2!13083 lt!432395)))))

(declare-fun lt!432394 () (_ BitVec 32))

(assert (=> b!296704 (= lt!432394 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432396 () (_ BitVec 32))

(assert (=> b!296704 (= lt!432396 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296704 (= lt!432395 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!296705 () Bool)

(declare-fun e!212343 () Bool)

(declare-fun call!5187 () Bool)

(assert (=> b!296705 (= e!212343 call!5187)))

(declare-fun e!212340 () Bool)

(declare-fun b!296706 () Bool)

(assert (=> b!296706 (= e!212340 (byteRangesEq!0 (select (arr!8758 arr!273) (_4!453 lt!432395)) (select (arr!8758 lt!432320) (_4!453 lt!432395)) #b00000000000000000000000000000000 lt!432394))))

(declare-fun d!99948 () Bool)

(declare-fun res!244958 () Bool)

(assert (=> d!99948 (=> res!244958 e!212342)))

(assert (=> d!99948 (= res!244958 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99948 (= (arrayBitRangesEq!0 arr!273 lt!432320 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212342)))

(declare-fun b!296707 () Bool)

(declare-fun e!212338 () Bool)

(assert (=> b!296707 (= e!212343 e!212338)))

(declare-fun res!244959 () Bool)

(assert (=> b!296707 (= res!244959 call!5187)))

(assert (=> b!296707 (=> (not res!244959) (not e!212338))))

(declare-fun b!296708 () Bool)

(assert (=> b!296708 (= e!212339 (arrayRangesEq!1511 arr!273 lt!432320 (_1!13083 lt!432395) (_2!13083 lt!432395)))))

(declare-fun b!296709 () Bool)

(assert (=> b!296709 (= e!212341 e!212343)))

(declare-fun c!13540 () Bool)

(assert (=> b!296709 (= c!13540 (= (_3!1407 lt!432395) (_4!453 lt!432395)))))

(declare-fun b!296710 () Bool)

(declare-fun res!244957 () Bool)

(assert (=> b!296710 (= res!244957 (= lt!432394 #b00000000000000000000000000000000))))

(assert (=> b!296710 (=> res!244957 e!212340)))

(assert (=> b!296710 (= e!212338 e!212340)))

(declare-fun bm!5184 () Bool)

(assert (=> bm!5184 (= call!5187 (byteRangesEq!0 (select (arr!8758 arr!273) (_3!1407 lt!432395)) (select (arr!8758 lt!432320) (_3!1407 lt!432395)) lt!432396 (ite c!13540 lt!432394 #b00000000000000000000000000001000)))))

(assert (= (and d!99948 (not res!244958)) b!296704))

(assert (= (and b!296704 (not res!244956)) b!296708))

(assert (= (and b!296704 res!244960) b!296709))

(assert (= (and b!296709 c!13540) b!296705))

(assert (= (and b!296709 (not c!13540)) b!296707))

(assert (= (and b!296707 res!244959) b!296710))

(assert (= (and b!296710 (not res!244957)) b!296706))

(assert (= (or b!296705 b!296707) bm!5184))

(assert (=> b!296704 m!435129))

(declare-fun m!435145 () Bool)

(assert (=> b!296706 m!435145))

(declare-fun m!435147 () Bool)

(assert (=> b!296706 m!435147))

(assert (=> b!296706 m!435145))

(assert (=> b!296706 m!435147))

(declare-fun m!435149 () Bool)

(assert (=> b!296706 m!435149))

(declare-fun m!435151 () Bool)

(assert (=> b!296708 m!435151))

(declare-fun m!435153 () Bool)

(assert (=> bm!5184 m!435153))

(declare-fun m!435155 () Bool)

(assert (=> bm!5184 m!435155))

(assert (=> bm!5184 m!435153))

(assert (=> bm!5184 m!435155))

(declare-fun m!435157 () Bool)

(assert (=> bm!5184 m!435157))

(assert (=> b!296644 d!99948))

(declare-fun b!296819 () Bool)

(declare-fun res!245048 () Bool)

(declare-fun e!212417 () Bool)

(assert (=> b!296819 (=> (not res!245048) (not e!212417))))

(declare-fun e!212419 () Bool)

(assert (=> b!296819 (= res!245048 e!212419)))

(declare-fun res!245051 () Bool)

(assert (=> b!296819 (=> res!245051 e!212419)))

(assert (=> b!296819 (= res!245051 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun e!212420 () Bool)

(declare-fun lt!432690 () tuple3!1902)

(declare-fun b!296820 () Bool)

(assert (=> b!296820 (= e!212420 (and (= (buf!7756 (_2!13077 lt!432315)) (buf!7756 (_2!13076 lt!432690))) (= (size!7693 lt!432320) (size!7693 (_3!1404 lt!432690)))))))

(declare-fun d!99950 () Bool)

(assert (=> d!99950 e!212417))

(declare-fun res!245046 () Bool)

(assert (=> d!99950 (=> (not res!245046) (not e!212417))))

(declare-fun lt!432698 () tuple3!1902)

(declare-fun lt!432678 () (_ BitVec 64))

(assert (=> d!99950 (= res!245046 (= (bvsub lt!432678 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7693 (buf!7756 (_2!13076 lt!432698))) (currentByte!14283 (_2!13076 lt!432698)) (currentBit!14278 (_2!13076 lt!432698)))))))

(assert (=> d!99950 (or (= (bvand lt!432678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432678 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432676 () (_ BitVec 64))

(assert (=> d!99950 (= lt!432678 (bvadd lt!432676 to!474))))

(assert (=> d!99950 (or (not (= (bvand lt!432676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!432676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!432676 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99950 (= lt!432676 (bitIndex!0 (size!7693 (buf!7756 (_2!13077 lt!432315))) (currentByte!14283 (_2!13077 lt!432315)) (currentBit!14278 (_2!13077 lt!432315))))))

(declare-fun e!212418 () tuple3!1902)

(assert (=> d!99950 (= lt!432698 e!212418)))

(declare-fun c!13552 () Bool)

(assert (=> d!99950 (= c!13552 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99950 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99950 (= (readBitsLoop!0 (_2!13077 lt!432315) nBits!523 lt!432320 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!432698)))

(declare-fun bm!5201 () Bool)

(declare-fun lt!432688 () (_ BitVec 32))

(declare-fun call!5205 () Bool)

(declare-fun lt!432706 () (_ BitVec 32))

(declare-fun lt!432703 () tuple2!23344)

(assert (=> bm!5201 (= call!5205 (arrayBitRangesEq!0 lt!432320 (ite c!13552 (array!17754 (store (arr!8758 lt!432320) lt!432688 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8758 lt!432320) lt!432688)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432706)))) ((_ sign_extend 24) (ite (_1!13077 lt!432703) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432706) #b00000000))))) (size!7693 lt!432320)) lt!432320) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13552 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7693 lt!432320)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!296821 () Bool)

(declare-datatypes ((List!994 0))(
  ( (Nil!991) (Cons!990 (h!1109 Bool) (t!1879 List!994)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13390 array!17753 (_ BitVec 64) (_ BitVec 64)) List!994)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13390 BitStream!13390 (_ BitVec 64)) List!994)

(assert (=> b!296821 (= e!212417 (= (byteArrayBitContentToList!0 (_2!13076 lt!432698) (_3!1404 lt!432698) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13076 lt!432698) (_2!13077 lt!432315) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!296821 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!296821 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432699 () (_ BitVec 64))

(declare-fun call!5204 () Bool)

(declare-fun lt!432686 () array!17753)

(declare-fun lt!432701 () (_ BitVec 64))

(declare-fun lt!432709 () array!17753)

(declare-fun lt!432680 () (_ BitVec 64))

(declare-fun bm!5202 () Bool)

(assert (=> bm!5202 (= call!5204 (arrayBitRangesEq!0 (ite c!13552 lt!432320 lt!432686) (ite c!13552 (_3!1404 lt!432690) lt!432709) (ite c!13552 lt!432701 lt!432699) (ite c!13552 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!432680)))))

(declare-fun b!296822 () Bool)

(declare-fun res!245052 () Bool)

(assert (=> b!296822 (=> (not res!245052) (not e!212417))))

(assert (=> b!296822 (= res!245052 (arrayBitRangesEq!0 lt!432320 (_3!1404 lt!432698) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!296823 () Bool)

(declare-fun res!245050 () Bool)

(assert (=> b!296823 (=> (not res!245050) (not e!212417))))

(assert (=> b!296823 (= res!245050 (and (= (buf!7756 (_2!13077 lt!432315)) (buf!7756 (_2!13076 lt!432698))) (= (size!7693 lt!432320) (size!7693 (_3!1404 lt!432698)))))))

(declare-fun b!296824 () Bool)

(declare-fun lt!432687 () Unit!20683)

(assert (=> b!296824 (= e!212418 (tuple3!1903 lt!432687 (_2!13077 lt!432315) lt!432320))))

(declare-fun lt!432677 () Unit!20683)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17753) Unit!20683)

(assert (=> b!296824 (= lt!432677 (arrayBitRangesEqReflexiveLemma!0 lt!432320))))

(assert (=> b!296824 call!5205))

(declare-fun lt!432704 () Unit!20683)

(assert (=> b!296824 (= lt!432704 lt!432677)))

(assert (=> b!296824 (= lt!432686 lt!432320)))

(assert (=> b!296824 (= lt!432709 lt!432320)))

(declare-fun lt!432693 () (_ BitVec 64))

(assert (=> b!296824 (= lt!432693 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432702 () (_ BitVec 64))

(assert (=> b!296824 (= lt!432702 ((_ sign_extend 32) (size!7693 lt!432320)))))

(declare-fun lt!432708 () (_ BitVec 64))

(assert (=> b!296824 (= lt!432708 (bvmul lt!432702 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!296824 (= lt!432699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!296824 (= lt!432680 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17753 array!17753 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20683)

(assert (=> b!296824 (= lt!432687 (arrayBitRangesEqSlicedLemma!0 lt!432686 lt!432709 lt!432693 lt!432708 lt!432699 lt!432680))))

(assert (=> b!296824 call!5204))

(declare-fun b!296825 () Bool)

(declare-datatypes ((tuple2!23354 0))(
  ( (tuple2!23355 (_1!13086 BitStream!13390) (_2!13086 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13390) tuple2!23354)

(assert (=> b!296825 (= e!212419 (= (bitAt!0 (_3!1404 lt!432698) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13086 (readBitPure!0 (_2!13077 lt!432315)))))))

(declare-fun b!296826 () Bool)

(declare-fun res!245049 () Bool)

(assert (=> b!296826 (=> (not res!245049) (not e!212417))))

(assert (=> b!296826 (= res!245049 (invariant!0 (currentBit!14278 (_2!13076 lt!432698)) (currentByte!14283 (_2!13076 lt!432698)) (size!7693 (buf!7756 (_2!13076 lt!432698)))))))

(declare-fun b!296827 () Bool)

(declare-fun lt!432689 () Unit!20683)

(assert (=> b!296827 (= e!212418 (tuple3!1903 lt!432689 (_2!13076 lt!432690) (_3!1404 lt!432690)))))

(assert (=> b!296827 (= lt!432703 (readBit!0 (_2!13077 lt!432315)))))

(declare-fun lt!432710 () (_ BitVec 32))

(assert (=> b!296827 (= lt!432710 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432697 () (_ BitVec 32))

(assert (=> b!296827 (= lt!432697 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432692 () array!17753)

(assert (=> b!296827 (= lt!432692 (array!17754 (store (arr!8758 lt!432320) lt!432710 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8758 lt!432320) lt!432710)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432697)))) ((_ sign_extend 24) (ite (_1!13077 lt!432703) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432697) #b00000000))))) (size!7693 lt!432320)))))

(declare-fun lt!432696 () (_ BitVec 64))

(assert (=> b!296827 (= lt!432696 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!432682 () (_ BitVec 64))

(assert (=> b!296827 (= lt!432682 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!432694 () Unit!20683)

(assert (=> b!296827 (= lt!432694 (validateOffsetBitsIneqLemma!0 (_2!13077 lt!432315) (_2!13077 lt!432703) lt!432696 lt!432682))))

(assert (=> b!296827 (validate_offset_bits!1 ((_ sign_extend 32) (size!7693 (buf!7756 (_2!13077 lt!432703)))) ((_ sign_extend 32) (currentByte!14283 (_2!13077 lt!432703))) ((_ sign_extend 32) (currentBit!14278 (_2!13077 lt!432703))) (bvsub lt!432696 lt!432682))))

(declare-fun lt!432681 () Unit!20683)

(assert (=> b!296827 (= lt!432681 lt!432694)))

(assert (=> b!296827 (= lt!432690 (readBitsLoop!0 (_2!13077 lt!432703) nBits!523 lt!432692 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!245047 () Bool)

(assert (=> b!296827 (= res!245047 (= (bvsub (bvadd (bitIndex!0 (size!7693 (buf!7756 (_2!13077 lt!432315))) (currentByte!14283 (_2!13077 lt!432315)) (currentBit!14278 (_2!13077 lt!432315))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7693 (buf!7756 (_2!13076 lt!432690))) (currentByte!14283 (_2!13076 lt!432690)) (currentBit!14278 (_2!13076 lt!432690)))))))

(assert (=> b!296827 (=> (not res!245047) (not e!212420))))

(assert (=> b!296827 e!212420))

(declare-fun lt!432691 () Unit!20683)

(declare-fun Unit!20693 () Unit!20683)

(assert (=> b!296827 (= lt!432691 Unit!20693)))

(assert (=> b!296827 (= lt!432688 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296827 (= lt!432706 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432679 () Unit!20683)

(assert (=> b!296827 (= lt!432679 (arrayBitRangesUpdatedAtLemma!0 lt!432320 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!13077 lt!432703)))))

(assert (=> b!296827 call!5205))

(declare-fun lt!432711 () Unit!20683)

(assert (=> b!296827 (= lt!432711 lt!432679)))

(assert (=> b!296827 (= lt!432701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432695 () Unit!20683)

(assert (=> b!296827 (= lt!432695 (arrayBitRangesEqTransitive!0 lt!432320 lt!432692 (_3!1404 lt!432690) lt!432701 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!296827 call!5204))

(declare-fun lt!432707 () Unit!20683)

(assert (=> b!296827 (= lt!432707 lt!432695)))

(assert (=> b!296827 (arrayBitRangesEq!0 lt!432320 (_3!1404 lt!432690) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!432700 () Unit!20683)

(declare-fun Unit!20694 () Unit!20683)

(assert (=> b!296827 (= lt!432700 Unit!20694)))

(declare-fun lt!432705 () Unit!20683)

(assert (=> b!296827 (= lt!432705 (arrayBitRangesEqImpliesEq!0 lt!432692 (_3!1404 lt!432690) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!296827 (= (bitAt!0 lt!432692 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1404 lt!432690) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!432684 () Unit!20683)

(assert (=> b!296827 (= lt!432684 lt!432705)))

(declare-fun lt!432683 () Unit!20683)

(declare-fun Unit!20695 () Unit!20683)

(assert (=> b!296827 (= lt!432683 Unit!20695)))

(declare-fun lt!432685 () Bool)

(assert (=> b!296827 (= lt!432685 (= (bitAt!0 (_3!1404 lt!432690) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!13077 lt!432703)))))

(declare-fun Unit!20696 () Unit!20683)

(assert (=> b!296827 (= lt!432689 Unit!20696)))

(assert (=> b!296827 lt!432685))

(assert (= (and d!99950 c!13552) b!296827))

(assert (= (and d!99950 (not c!13552)) b!296824))

(assert (= (and b!296827 res!245047) b!296820))

(assert (= (or b!296827 b!296824) bm!5202))

(assert (= (or b!296827 b!296824) bm!5201))

(assert (= (and d!99950 res!245046) b!296823))

(assert (= (and b!296823 res!245050) b!296822))

(assert (= (and b!296822 res!245052) b!296819))

(assert (= (and b!296819 (not res!245051)) b!296825))

(assert (= (and b!296819 res!245048) b!296826))

(assert (= (and b!296826 res!245049) b!296821))

(declare-fun m!435291 () Bool)

(assert (=> bm!5202 m!435291))

(declare-fun m!435293 () Bool)

(assert (=> b!296821 m!435293))

(declare-fun m!435295 () Bool)

(assert (=> b!296821 m!435295))

(declare-fun m!435297 () Bool)

(assert (=> d!99950 m!435297))

(declare-fun m!435299 () Bool)

(assert (=> d!99950 m!435299))

(declare-fun m!435301 () Bool)

(assert (=> b!296822 m!435301))

(declare-fun m!435303 () Bool)

(assert (=> b!296824 m!435303))

(declare-fun m!435305 () Bool)

(assert (=> b!296824 m!435305))

(declare-fun m!435307 () Bool)

(assert (=> bm!5201 m!435307))

(declare-fun m!435309 () Bool)

(assert (=> bm!5201 m!435309))

(declare-fun m!435311 () Bool)

(assert (=> bm!5201 m!435311))

(declare-fun m!435313 () Bool)

(assert (=> bm!5201 m!435313))

(declare-fun m!435315 () Bool)

(assert (=> b!296827 m!435315))

(declare-fun m!435317 () Bool)

(assert (=> b!296827 m!435317))

(declare-fun m!435319 () Bool)

(assert (=> b!296827 m!435319))

(declare-fun m!435321 () Bool)

(assert (=> b!296827 m!435321))

(declare-fun m!435323 () Bool)

(assert (=> b!296827 m!435323))

(declare-fun m!435325 () Bool)

(assert (=> b!296827 m!435325))

(declare-fun m!435327 () Bool)

(assert (=> b!296827 m!435327))

(declare-fun m!435329 () Bool)

(assert (=> b!296827 m!435329))

(declare-fun m!435331 () Bool)

(assert (=> b!296827 m!435331))

(declare-fun m!435333 () Bool)

(assert (=> b!296827 m!435333))

(declare-fun m!435335 () Bool)

(assert (=> b!296827 m!435335))

(declare-fun m!435337 () Bool)

(assert (=> b!296827 m!435337))

(assert (=> b!296827 m!435299))

(declare-fun m!435339 () Bool)

(assert (=> b!296827 m!435339))

(declare-fun m!435341 () Bool)

(assert (=> b!296827 m!435341))

(declare-fun m!435343 () Bool)

(assert (=> b!296826 m!435343))

(declare-fun m!435345 () Bool)

(assert (=> b!296825 m!435345))

(declare-fun m!435347 () Bool)

(assert (=> b!296825 m!435347))

(assert (=> b!296644 d!99950))

(declare-fun d!99988 () Bool)

(declare-fun e!212423 () Bool)

(assert (=> d!99988 e!212423))

(declare-fun res!245058 () Bool)

(assert (=> d!99988 (=> (not res!245058) (not e!212423))))

(declare-fun lt!432724 () (_ BitVec 64))

(declare-fun lt!432725 () (_ BitVec 64))

(declare-fun lt!432729 () (_ BitVec 64))

(assert (=> d!99988 (= res!245058 (= lt!432724 (bvsub lt!432725 lt!432729)))))

(assert (=> d!99988 (or (= (bvand lt!432725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!432729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432725 lt!432729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99988 (= lt!432729 (remainingBits!0 ((_ sign_extend 32) (size!7693 (buf!7756 (_2!13076 lt!432322)))) ((_ sign_extend 32) (currentByte!14283 (_2!13076 lt!432322))) ((_ sign_extend 32) (currentBit!14278 (_2!13076 lt!432322)))))))

(declare-fun lt!432727 () (_ BitVec 64))

(declare-fun lt!432726 () (_ BitVec 64))

(assert (=> d!99988 (= lt!432725 (bvmul lt!432727 lt!432726))))

(assert (=> d!99988 (or (= lt!432727 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!432726 (bvsdiv (bvmul lt!432727 lt!432726) lt!432727)))))

(assert (=> d!99988 (= lt!432726 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99988 (= lt!432727 ((_ sign_extend 32) (size!7693 (buf!7756 (_2!13076 lt!432322)))))))

(assert (=> d!99988 (= lt!432724 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14283 (_2!13076 lt!432322))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14278 (_2!13076 lt!432322)))))))

(assert (=> d!99988 (invariant!0 (currentBit!14278 (_2!13076 lt!432322)) (currentByte!14283 (_2!13076 lt!432322)) (size!7693 (buf!7756 (_2!13076 lt!432322))))))

(assert (=> d!99988 (= (bitIndex!0 (size!7693 (buf!7756 (_2!13076 lt!432322))) (currentByte!14283 (_2!13076 lt!432322)) (currentBit!14278 (_2!13076 lt!432322))) lt!432724)))

(declare-fun b!296832 () Bool)

(declare-fun res!245057 () Bool)

(assert (=> b!296832 (=> (not res!245057) (not e!212423))))

(assert (=> b!296832 (= res!245057 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!432724))))

(declare-fun b!296833 () Bool)

(declare-fun lt!432728 () (_ BitVec 64))

(assert (=> b!296833 (= e!212423 (bvsle lt!432724 (bvmul lt!432728 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296833 (or (= lt!432728 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!432728 #b0000000000000000000000000000000000000000000000000000000000001000) lt!432728)))))

(assert (=> b!296833 (= lt!432728 ((_ sign_extend 32) (size!7693 (buf!7756 (_2!13076 lt!432322)))))))

(assert (= (and d!99988 res!245058) b!296832))

(assert (= (and b!296832 res!245057) b!296833))

(declare-fun m!435353 () Bool)

(assert (=> d!99988 m!435353))

(assert (=> d!99988 m!435035))

(assert (=> b!296644 d!99988))

(declare-fun d!99992 () Bool)

(declare-fun e!212435 () Bool)

(assert (=> d!99992 e!212435))

(declare-fun res!245069 () Bool)

(assert (=> d!99992 (=> (not res!245069) (not e!212435))))

(declare-fun lt!432744 () (_ BitVec 32))

(assert (=> d!99992 (= res!245069 (and (bvsge lt!432744 #b00000000000000000000000000000000) (bvslt lt!432744 (size!7693 arr!273))))))

(declare-fun lt!432747 () (_ BitVec 32))

(declare-fun lt!432745 () (_ BitVec 8))

(declare-fun lt!432746 () Unit!20683)

(declare-fun choose!53 (array!17753 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20683)

(assert (=> d!99992 (= lt!432746 (choose!53 arr!273 from!505 (_1!13077 lt!432315) lt!432744 lt!432747 lt!432745))))

(assert (=> d!99992 (= lt!432745 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8758 arr!273) lt!432744)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432747)))) ((_ sign_extend 24) (ite (_1!13077 lt!432315) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432747) #b00000000)))))))

(assert (=> d!99992 (= lt!432747 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99992 (= lt!432744 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99992 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13077 lt!432315)) lt!432746)))

(declare-fun b!296847 () Bool)

(assert (=> b!296847 (= e!212435 (arrayBitRangesEq!0 arr!273 (array!17754 (store (arr!8758 arr!273) lt!432744 lt!432745) (size!7693 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99992 res!245069) b!296847))

(declare-fun m!435373 () Bool)

(assert (=> d!99992 m!435373))

(declare-fun m!435375 () Bool)

(assert (=> d!99992 m!435375))

(declare-fun m!435377 () Bool)

(assert (=> d!99992 m!435377))

(declare-fun m!435379 () Bool)

(assert (=> b!296847 m!435379))

(declare-fun m!435381 () Bool)

(assert (=> b!296847 m!435381))

(assert (=> b!296644 d!99992))

(declare-fun d!100004 () Bool)

(declare-fun e!212436 () Bool)

(assert (=> d!100004 e!212436))

(declare-fun res!245071 () Bool)

(assert (=> d!100004 (=> (not res!245071) (not e!212436))))

(declare-fun lt!432749 () (_ BitVec 64))

(declare-fun lt!432748 () (_ BitVec 64))

(declare-fun lt!432753 () (_ BitVec 64))

(assert (=> d!100004 (= res!245071 (= lt!432748 (bvsub lt!432749 lt!432753)))))

(assert (=> d!100004 (or (= (bvand lt!432749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!432753 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432749 lt!432753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!100004 (= lt!432753 (remainingBits!0 ((_ sign_extend 32) (size!7693 (buf!7756 thiss!1728))) ((_ sign_extend 32) (currentByte!14283 thiss!1728)) ((_ sign_extend 32) (currentBit!14278 thiss!1728))))))

(declare-fun lt!432751 () (_ BitVec 64))

(declare-fun lt!432750 () (_ BitVec 64))

(assert (=> d!100004 (= lt!432749 (bvmul lt!432751 lt!432750))))

(assert (=> d!100004 (or (= lt!432751 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!432750 (bvsdiv (bvmul lt!432751 lt!432750) lt!432751)))))

(assert (=> d!100004 (= lt!432750 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100004 (= lt!432751 ((_ sign_extend 32) (size!7693 (buf!7756 thiss!1728))))))

(assert (=> d!100004 (= lt!432748 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14283 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14278 thiss!1728))))))

(assert (=> d!100004 (invariant!0 (currentBit!14278 thiss!1728) (currentByte!14283 thiss!1728) (size!7693 (buf!7756 thiss!1728)))))

(assert (=> d!100004 (= (bitIndex!0 (size!7693 (buf!7756 thiss!1728)) (currentByte!14283 thiss!1728) (currentBit!14278 thiss!1728)) lt!432748)))

(declare-fun b!296848 () Bool)

(declare-fun res!245070 () Bool)

(assert (=> b!296848 (=> (not res!245070) (not e!212436))))

(assert (=> b!296848 (= res!245070 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!432748))))

(declare-fun b!296849 () Bool)

(declare-fun lt!432752 () (_ BitVec 64))

(assert (=> b!296849 (= e!212436 (bvsle lt!432748 (bvmul lt!432752 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296849 (or (= lt!432752 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!432752 #b0000000000000000000000000000000000000000000000000000000000001000) lt!432752)))))

(assert (=> b!296849 (= lt!432752 ((_ sign_extend 32) (size!7693 (buf!7756 thiss!1728))))))

(assert (= (and d!100004 res!245071) b!296848))

(assert (= (and b!296848 res!245070) b!296849))

(declare-fun m!435383 () Bool)

(assert (=> d!100004 m!435383))

(declare-fun m!435385 () Bool)

(assert (=> d!100004 m!435385))

(assert (=> b!296644 d!100004))

(declare-fun d!100006 () Bool)

(assert (=> d!100006 (= (bitAt!0 lt!432320 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8758 lt!432320) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25577 () Bool)

(assert (= bs!25577 d!100006))

(declare-fun m!435387 () Bool)

(assert (=> bs!25577 m!435387))

(declare-fun m!435389 () Bool)

(assert (=> bs!25577 m!435389))

(assert (=> b!296644 d!100006))

(declare-fun d!100008 () Bool)

(declare-fun e!212439 () Bool)

(assert (=> d!100008 e!212439))

(declare-fun res!245074 () Bool)

(assert (=> d!100008 (=> (not res!245074) (not e!212439))))

(assert (=> d!100008 (= res!245074 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!432756 () Unit!20683)

(declare-fun choose!27 (BitStream!13390 BitStream!13390 (_ BitVec 64) (_ BitVec 64)) Unit!20683)

(assert (=> d!100008 (= lt!432756 (choose!27 thiss!1728 (_2!13077 lt!432315) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!100008 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!100008 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13077 lt!432315) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!432756)))

(declare-fun b!296852 () Bool)

(assert (=> b!296852 (= e!212439 (validate_offset_bits!1 ((_ sign_extend 32) (size!7693 (buf!7756 (_2!13077 lt!432315)))) ((_ sign_extend 32) (currentByte!14283 (_2!13077 lt!432315))) ((_ sign_extend 32) (currentBit!14278 (_2!13077 lt!432315))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!100008 res!245074) b!296852))

(declare-fun m!435391 () Bool)

(assert (=> d!100008 m!435391))

(assert (=> b!296852 m!435033))

(assert (=> b!296644 d!100008))

(declare-fun d!100010 () Bool)

(assert (=> d!100010 (arrayBitRangesEq!0 arr!273 (_3!1404 lt!432322) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432759 () Unit!20683)

(declare-fun choose!49 (array!17753 array!17753 array!17753 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20683)

(assert (=> d!100010 (= lt!432759 (choose!49 arr!273 lt!432320 (_3!1404 lt!432322) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100010 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100010 (= (arrayBitRangesEqTransitive!0 arr!273 lt!432320 (_3!1404 lt!432322) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!432759)))

(declare-fun bs!25578 () Bool)

(assert (= bs!25578 d!100010))

(assert (=> bs!25578 m!435015))

(declare-fun m!435393 () Bool)

(assert (=> bs!25578 m!435393))

(assert (=> b!296644 d!100010))

(declare-fun d!100012 () Bool)

(assert (=> d!100012 (= (bitAt!0 lt!432320 from!505) (bitAt!0 (_3!1404 lt!432322) from!505))))

(declare-fun lt!432762 () Unit!20683)

(declare-fun choose!31 (array!17753 array!17753 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20683)

(assert (=> d!100012 (= lt!432762 (choose!31 lt!432320 (_3!1404 lt!432322) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100012 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100012 (= (arrayBitRangesEqImpliesEq!0 lt!432320 (_3!1404 lt!432322) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!432762)))

(declare-fun bs!25579 () Bool)

(assert (= bs!25579 d!100012))

(assert (=> bs!25579 m!435031))

(assert (=> bs!25579 m!435017))

(declare-fun m!435395 () Bool)

(assert (=> bs!25579 m!435395))

(assert (=> b!296644 d!100012))

(declare-fun d!100014 () Bool)

(declare-fun e!212458 () Bool)

(assert (=> d!100014 e!212458))

(declare-fun res!245098 () Bool)

(assert (=> d!100014 (=> (not res!245098) (not e!212458))))

(declare-datatypes ((tuple2!23356 0))(
  ( (tuple2!23357 (_1!13088 Unit!20683) (_2!13088 BitStream!13390)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13390) tuple2!23356)

(assert (=> d!100014 (= res!245098 (= (buf!7756 (_2!13088 (increaseBitIndex!0 thiss!1728))) (buf!7756 thiss!1728)))))

(declare-fun lt!432889 () Bool)

(assert (=> d!100014 (= lt!432889 (not (= (bvand ((_ sign_extend 24) (select (arr!8758 (buf!7756 thiss!1728)) (currentByte!14283 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14278 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!432887 () tuple2!23344)

(assert (=> d!100014 (= lt!432887 (tuple2!23345 (not (= (bvand ((_ sign_extend 24) (select (arr!8758 (buf!7756 thiss!1728)) (currentByte!14283 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14278 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13088 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!100014 (validate_offset_bit!0 ((_ sign_extend 32) (size!7693 (buf!7756 thiss!1728))) ((_ sign_extend 32) (currentByte!14283 thiss!1728)) ((_ sign_extend 32) (currentBit!14278 thiss!1728)))))

(assert (=> d!100014 (= (readBit!0 thiss!1728) lt!432887)))

(declare-fun lt!432890 () (_ BitVec 64))

(declare-fun b!296882 () Bool)

(declare-fun lt!432885 () (_ BitVec 64))

(assert (=> b!296882 (= e!212458 (= (bitIndex!0 (size!7693 (buf!7756 (_2!13088 (increaseBitIndex!0 thiss!1728)))) (currentByte!14283 (_2!13088 (increaseBitIndex!0 thiss!1728))) (currentBit!14278 (_2!13088 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!432890 lt!432885)))))

(assert (=> b!296882 (or (not (= (bvand lt!432890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!432885 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!432890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!432890 lt!432885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!296882 (= lt!432885 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!296882 (= lt!432890 (bitIndex!0 (size!7693 (buf!7756 thiss!1728)) (currentByte!14283 thiss!1728) (currentBit!14278 thiss!1728)))))

(declare-fun lt!432888 () Bool)

(assert (=> b!296882 (= lt!432888 (not (= (bvand ((_ sign_extend 24) (select (arr!8758 (buf!7756 thiss!1728)) (currentByte!14283 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14278 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!432891 () Bool)

(assert (=> b!296882 (= lt!432891 (not (= (bvand ((_ sign_extend 24) (select (arr!8758 (buf!7756 thiss!1728)) (currentByte!14283 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14278 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!432886 () Bool)

(assert (=> b!296882 (= lt!432886 (not (= (bvand ((_ sign_extend 24) (select (arr!8758 (buf!7756 thiss!1728)) (currentByte!14283 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14278 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!100014 res!245098) b!296882))

(declare-fun m!435397 () Bool)

(assert (=> d!100014 m!435397))

(declare-fun m!435399 () Bool)

(assert (=> d!100014 m!435399))

(declare-fun m!435401 () Bool)

(assert (=> d!100014 m!435401))

(declare-fun m!435403 () Bool)

(assert (=> d!100014 m!435403))

(assert (=> b!296882 m!435011))

(assert (=> b!296882 m!435401))

(assert (=> b!296882 m!435399))

(declare-fun m!435405 () Bool)

(assert (=> b!296882 m!435405))

(assert (=> b!296882 m!435397))

(assert (=> b!296644 d!100014))

(declare-fun d!100016 () Bool)

(assert (=> d!100016 (= (invariant!0 (currentBit!14278 (_2!13076 lt!432322)) (currentByte!14283 (_2!13076 lt!432322)) (size!7693 (buf!7756 (_2!13076 lt!432322)))) (and (bvsge (currentBit!14278 (_2!13076 lt!432322)) #b00000000000000000000000000000000) (bvslt (currentBit!14278 (_2!13076 lt!432322)) #b00000000000000000000000000001000) (bvsge (currentByte!14283 (_2!13076 lt!432322)) #b00000000000000000000000000000000) (or (bvslt (currentByte!14283 (_2!13076 lt!432322)) (size!7693 (buf!7756 (_2!13076 lt!432322)))) (and (= (currentBit!14278 (_2!13076 lt!432322)) #b00000000000000000000000000000000) (= (currentByte!14283 (_2!13076 lt!432322)) (size!7693 (buf!7756 (_2!13076 lt!432322))))))))))

(assert (=> b!296644 d!100016))

(declare-fun d!100018 () Bool)

(assert (=> d!100018 (= (bitAt!0 (_3!1404 lt!432322) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8758 (_3!1404 lt!432322)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25580 () Bool)

(assert (= bs!25580 d!100018))

(declare-fun m!435421 () Bool)

(assert (=> bs!25580 m!435421))

(assert (=> bs!25580 m!435389))

(assert (=> b!296644 d!100018))

(declare-fun d!100020 () Bool)

(assert (=> d!100020 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7693 (buf!7756 thiss!1728))) ((_ sign_extend 32) (currentByte!14283 thiss!1728)) ((_ sign_extend 32) (currentBit!14278 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7693 (buf!7756 thiss!1728))) ((_ sign_extend 32) (currentByte!14283 thiss!1728)) ((_ sign_extend 32) (currentBit!14278 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25581 () Bool)

(assert (= bs!25581 d!100020))

(assert (=> bs!25581 m!435383))

(assert (=> b!296643 d!100020))

(declare-fun d!100022 () Bool)

(assert (=> d!100022 (= (array_inv!7305 (buf!7756 thiss!1728)) (bvsge (size!7693 (buf!7756 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!296641 d!100022))

(declare-fun d!100024 () Bool)

(assert (=> d!100024 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14278 thiss!1728) (currentByte!14283 thiss!1728) (size!7693 (buf!7756 thiss!1728))))))

(declare-fun bs!25582 () Bool)

(assert (= bs!25582 d!100024))

(assert (=> bs!25582 m!435385))

(assert (=> start!66160 d!100024))

(declare-fun d!100028 () Bool)

(assert (=> d!100028 (= (array_inv!7305 arr!273) (bvsge (size!7693 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66160 d!100028))

(push 1)

(assert (not bm!5183))

(assert (not b!296827))

(assert (not d!99988))

(assert (not d!100008))

(assert (not b!296821))

(assert (not b!296852))

(assert (not b!296701))

(assert (not bm!5201))

(assert (not d!100010))

(assert (not b!296826))

(assert (not d!100004))

(assert (not b!296708))

(assert (not b!296704))

(assert (not d!100024))

(assert (not d!99950))

(assert (not d!99992))

(assert (not b!296847))

(assert (not d!99944))

(assert (not b!296706))

(assert (not b!296697))

(assert (not d!100012))

(assert (not bm!5202))

(assert (not d!100014))

(assert (not bm!5184))

(assert (not b!296882))

(assert (not b!296699))

(assert (not b!296824))

(assert (not b!296825))

(assert (not b!296822))

(assert (not d!100020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

