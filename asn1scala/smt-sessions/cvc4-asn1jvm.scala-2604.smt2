; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64460 () Bool)

(assert start!64460)

(declare-fun b!289335 () Bool)

(declare-fun res!239060 () Bool)

(declare-fun e!205860 () Bool)

(assert (=> b!289335 (=> (not res!239060) (not e!205860))))

(declare-datatypes ((array!17127 0))(
  ( (array!17128 (arr!8406 (Array (_ BitVec 32) (_ BitVec 8))) (size!7410 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12830 0))(
  ( (BitStream!12831 (buf!7476 array!17127) (currentByte!13871 (_ BitVec 32)) (currentBit!13866 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12830)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289335 (= res!239060 (validate_offset_bits!1 ((_ sign_extend 32) (size!7410 (buf!7476 thiss!1728))) ((_ sign_extend 32) (currentByte!13871 thiss!1728)) ((_ sign_extend 32) (currentBit!13866 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289337 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!289337 (= e!205860 (not (invariant!0 (currentBit!13866 thiss!1728) (currentByte!13871 thiss!1728) (size!7410 (buf!7476 thiss!1728)))))))

(declare-datatypes ((tuple2!22678 0))(
  ( (tuple2!22679 (_1!12535 Bool) (_2!12535 BitStream!12830)) )
))
(declare-fun lt!419126 () tuple2!22678)

(declare-fun lt!419123 () (_ BitVec 32))

(declare-fun lt!419124 () (_ BitVec 32))

(declare-fun to!474 () (_ BitVec 64))

(declare-datatypes ((Unit!20047 0))(
  ( (Unit!20048) )
))
(declare-datatypes ((tuple3!1564 0))(
  ( (tuple3!1565 (_1!12536 Unit!20047) (_2!12536 BitStream!12830) (_3!1196 array!17127)) )
))
(declare-fun lt!419127 () tuple3!1564)

(declare-fun arr!273 () array!17127)

(declare-fun readBitsLoop!0 (BitStream!12830 (_ BitVec 64) array!17127 (_ BitVec 64) (_ BitVec 64)) tuple3!1564)

(assert (=> b!289337 (= lt!419127 (readBitsLoop!0 (_2!12535 lt!419126) nBits!523 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289337 (validate_offset_bits!1 ((_ sign_extend 32) (size!7410 (buf!7476 (_2!12535 lt!419126)))) ((_ sign_extend 32) (currentByte!13871 (_2!12535 lt!419126))) ((_ sign_extend 32) (currentBit!13866 (_2!12535 lt!419126))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!419125 () Unit!20047)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12830 BitStream!12830 (_ BitVec 64) (_ BitVec 64)) Unit!20047)

(assert (=> b!289337 (= lt!419125 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12535 lt!419126) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!289337 (= lt!419123 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289337 (= lt!419124 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12830) tuple2!22678)

(assert (=> b!289337 (= lt!419126 (readBit!0 thiss!1728))))

(declare-fun b!289338 () Bool)

(declare-fun e!205858 () Bool)

(declare-fun array_inv!7022 (array!17127) Bool)

(assert (=> b!289338 (= e!205858 (array_inv!7022 (buf!7476 thiss!1728)))))

(declare-fun b!289336 () Bool)

(declare-fun res!239059 () Bool)

(assert (=> b!289336 (=> (not res!239059) (not e!205860))))

(assert (=> b!289336 (= res!239059 (bvslt from!505 to!474))))

(declare-fun res!239058 () Bool)

(assert (=> start!64460 (=> (not res!239058) (not e!205860))))

(assert (=> start!64460 (= res!239058 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7410 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64460 e!205860))

(declare-fun inv!12 (BitStream!12830) Bool)

(assert (=> start!64460 (and (inv!12 thiss!1728) e!205858)))

(assert (=> start!64460 true))

(assert (=> start!64460 (array_inv!7022 arr!273)))

(assert (= (and start!64460 res!239058) b!289335))

(assert (= (and b!289335 res!239060) b!289336))

(assert (= (and b!289336 res!239059) b!289337))

(assert (= start!64460 b!289338))

(declare-fun m!422095 () Bool)

(assert (=> b!289335 m!422095))

(declare-fun m!422097 () Bool)

(assert (=> b!289337 m!422097))

(declare-fun m!422099 () Bool)

(assert (=> b!289337 m!422099))

(declare-fun m!422101 () Bool)

(assert (=> b!289337 m!422101))

(declare-fun m!422103 () Bool)

(assert (=> b!289337 m!422103))

(declare-fun m!422105 () Bool)

(assert (=> b!289337 m!422105))

(declare-fun m!422107 () Bool)

(assert (=> b!289337 m!422107))

(declare-fun m!422109 () Bool)

(assert (=> b!289337 m!422109))

(declare-fun m!422111 () Bool)

(assert (=> b!289337 m!422111))

(declare-fun m!422113 () Bool)

(assert (=> b!289338 m!422113))

(declare-fun m!422115 () Bool)

(assert (=> start!64460 m!422115))

(declare-fun m!422117 () Bool)

(assert (=> start!64460 m!422117))

(push 1)

(assert (not b!289335))

(assert (not b!289337))

(assert (not b!289338))

(assert (not start!64460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98214 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98214 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7410 (buf!7476 thiss!1728))) ((_ sign_extend 32) (currentByte!13871 thiss!1728)) ((_ sign_extend 32) (currentBit!13866 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7410 (buf!7476 thiss!1728))) ((_ sign_extend 32) (currentByte!13871 thiss!1728)) ((_ sign_extend 32) (currentBit!13866 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!24986 () Bool)

(assert (= bs!24986 d!98214))

(declare-fun m!422123 () Bool)

(assert (=> bs!24986 m!422123))

(assert (=> b!289335 d!98214))

(declare-fun lt!419467 () (_ BitVec 32))

(declare-fun lt!419458 () tuple2!22678)

(declare-fun lt!419453 () (_ BitVec 32))

(declare-fun c!13251 () Bool)

(declare-fun bm!4768 () Bool)

(declare-fun call!4772 () Bool)

(declare-fun arrayBitRangesEq!0 (array!17127 array!17127 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> bm!4768 (= call!4772 (arrayBitRangesEq!0 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273)) (ite c!13251 (array!17128 (store (arr!8406 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273))) lt!419453 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273))) lt!419453)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419467)))) ((_ sign_extend 24) (ite (_1!12535 lt!419458) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419467) #b00000000))))) (size!7410 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273)))) (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13251 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7410 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273)))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!419452 () (_ BitVec 64))

(declare-fun lt!419454 () array!17127)

(declare-fun lt!419443 () tuple3!1564)

(declare-fun bm!4769 () Bool)

(declare-fun lt!419462 () (_ BitVec 64))

(declare-fun lt!419451 () array!17127)

(declare-fun call!4771 () Bool)

(assert (=> bm!4769 (= call!4771 (arrayBitRangesEq!0 (ite c!13251 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273)) lt!419454) (ite c!13251 (_3!1196 lt!419443) lt!419451) (ite c!13251 #b0000000000000000000000000000000000000000000000000000000000000000 lt!419452) (ite c!13251 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!419462)))))

(declare-fun b!289417 () Bool)

(declare-fun e!205903 () Bool)

(declare-fun lt!419445 () tuple3!1564)

(declare-fun bitAt!0 (array!17127 (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!22686 0))(
  ( (tuple2!22687 (_1!12540 BitStream!12830) (_2!12540 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12830) tuple2!22686)

(assert (=> b!289417 (= e!205903 (= (bitAt!0 (_3!1196 lt!419445) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12540 (readBitPure!0 (_2!12535 lt!419126)))))))

(declare-fun b!289418 () Bool)

(declare-fun lt!419444 () Unit!20047)

(declare-fun e!205905 () tuple3!1564)

(assert (=> b!289418 (= e!205905 (tuple3!1565 lt!419444 (_2!12535 lt!419126) (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273))))))

(declare-fun lt!419440 () Unit!20047)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17127) Unit!20047)

(assert (=> b!289418 (= lt!419440 (arrayBitRangesEqReflexiveLemma!0 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273))))))

(assert (=> b!289418 call!4772))

(declare-fun lt!419448 () Unit!20047)

(assert (=> b!289418 (= lt!419448 lt!419440)))

(assert (=> b!289418 (= lt!419454 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273)))))

(assert (=> b!289418 (= lt!419451 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273)))))

(declare-fun lt!419456 () (_ BitVec 64))

(assert (=> b!289418 (= lt!419456 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419472 () (_ BitVec 64))

(assert (=> b!289418 (= lt!419472 ((_ sign_extend 32) (size!7410 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273)))))))

(declare-fun lt!419457 () (_ BitVec 64))

(assert (=> b!289418 (= lt!419457 (bvmul lt!419472 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!289418 (= lt!419452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!289418 (= lt!419462 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17127 array!17127 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20047)

(assert (=> b!289418 (= lt!419444 (arrayBitRangesEqSlicedLemma!0 lt!419454 lt!419451 lt!419456 lt!419457 lt!419452 lt!419462))))

(assert (=> b!289418 call!4771))

(declare-fun b!289419 () Bool)

(declare-fun e!205904 () Bool)

(declare-datatypes ((List!951 0))(
  ( (Nil!948) (Cons!947 (h!1066 Bool) (t!1836 List!951)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!12830 array!17127 (_ BitVec 64) (_ BitVec 64)) List!951)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!12830 BitStream!12830 (_ BitVec 64)) List!951)

(assert (=> b!289419 (= e!205904 (= (byteArrayBitContentToList!0 (_2!12536 lt!419445) (_3!1196 lt!419445) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12536 lt!419445) (_2!12535 lt!419126) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!289419 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!289419 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!289420 () Bool)

(declare-fun lt!419447 () Unit!20047)

(assert (=> b!289420 (= e!205905 (tuple3!1565 lt!419447 (_2!12536 lt!419443) (_3!1196 lt!419443)))))

(assert (=> b!289420 (= lt!419458 (readBit!0 (_2!12535 lt!419126)))))

(declare-fun lt!419463 () (_ BitVec 32))

(assert (=> b!289420 (= lt!419463 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!419460 () (_ BitVec 32))

(assert (=> b!289420 (= lt!419460 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!419459 () array!17127)

(assert (=> b!289420 (= lt!419459 (array!17128 (store (arr!8406 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273))) lt!419463 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273))) lt!419463)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419460)))) ((_ sign_extend 24) (ite (_1!12535 lt!419458) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419460) #b00000000))))) (size!7410 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273)))))))

(declare-fun lt!419450 () (_ BitVec 64))

(assert (=> b!289420 (= lt!419450 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!419474 () (_ BitVec 64))

(assert (=> b!289420 (= lt!419474 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!419466 () Unit!20047)

(assert (=> b!289420 (= lt!419466 (validateOffsetBitsIneqLemma!0 (_2!12535 lt!419126) (_2!12535 lt!419458) lt!419450 lt!419474))))

(assert (=> b!289420 (validate_offset_bits!1 ((_ sign_extend 32) (size!7410 (buf!7476 (_2!12535 lt!419458)))) ((_ sign_extend 32) (currentByte!13871 (_2!12535 lt!419458))) ((_ sign_extend 32) (currentBit!13866 (_2!12535 lt!419458))) (bvsub lt!419450 lt!419474))))

(declare-fun lt!419442 () Unit!20047)

(assert (=> b!289420 (= lt!419442 lt!419466)))

(assert (=> b!289420 (= lt!419443 (readBitsLoop!0 (_2!12535 lt!419458) nBits!523 lt!419459 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!239129 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289420 (= res!239129 (= (bvsub (bvadd (bitIndex!0 (size!7410 (buf!7476 (_2!12535 lt!419126))) (currentByte!13871 (_2!12535 lt!419126)) (currentBit!13866 (_2!12535 lt!419126))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7410 (buf!7476 (_2!12536 lt!419443))) (currentByte!13871 (_2!12536 lt!419443)) (currentBit!13866 (_2!12536 lt!419443)))))))

(declare-fun e!205906 () Bool)

(assert (=> b!289420 (=> (not res!239129) (not e!205906))))

(assert (=> b!289420 e!205906))

(declare-fun lt!419464 () Unit!20047)

(declare-fun Unit!20057 () Unit!20047)

(assert (=> b!289420 (= lt!419464 Unit!20057)))

(assert (=> b!289420 (= lt!419453 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289420 (= lt!419467 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!419468 () Unit!20047)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17127 (_ BitVec 64) Bool) Unit!20047)

(assert (=> b!289420 (= lt!419468 (arrayBitRangesUpdatedAtLemma!0 (array!17128 (store (arr!8406 arr!273) lt!419124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8406 arr!273) lt!419124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123)))) ((_ sign_extend 24) (ite (_1!12535 lt!419126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419123) #b00000000))))) (size!7410 arr!273)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12535 lt!419458)))))

