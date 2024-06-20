; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66248 () Bool)

(assert start!66248)

(declare-fun res!245155 () Bool)

(declare-fun e!212529 () Bool)

(assert (=> start!66248 (=> (not res!245155) (not e!212529))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17766 0))(
  ( (array!17767 (arr!8769 (Array (_ BitVec 32) (_ BitVec 8))) (size!7698 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17766)

(assert (=> start!66248 (= res!245155 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7698 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66248 e!212529))

(declare-datatypes ((BitStream!13400 0))(
  ( (BitStream!13401 (buf!7761 array!17766) (currentByte!14297 (_ BitVec 32)) (currentBit!14292 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13400)

(declare-fun e!212527 () Bool)

(declare-fun inv!12 (BitStream!13400) Bool)

(assert (=> start!66248 (and (inv!12 thiss!1728) e!212527)))

(assert (=> start!66248 true))

(declare-fun array_inv!7310 (array!17766) Bool)

(assert (=> start!66248 (array_inv!7310 arr!273)))

(declare-fun b!296950 () Bool)

(declare-fun res!245158 () Bool)

(assert (=> b!296950 (=> (not res!245158) (not e!212529))))

(assert (=> b!296950 (= res!245158 (bvslt from!505 to!474))))

(declare-fun b!296951 () Bool)

(declare-datatypes ((Unit!20705 0))(
  ( (Unit!20706) )
))
(declare-datatypes ((tuple3!1912 0))(
  ( (tuple3!1913 (_1!13094 Unit!20705) (_2!13094 BitStream!13400) (_3!1412 array!17766)) )
))
(declare-fun lt!433027 () tuple3!1912)

(declare-datatypes ((List!998 0))(
  ( (Nil!995) (Cons!994 (h!1113 Bool) (t!1883 List!998)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13400 array!17766 (_ BitVec 64) (_ BitVec 64)) List!998)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13400 BitStream!13400 (_ BitVec 64)) List!998)

(assert (=> b!296951 (= e!212529 (not (= (byteArrayBitContentToList!0 (_2!13094 lt!433027) (_3!1412 lt!433027) from!505 (bvsub to!474 from!505)) (bitStreamReadBitsIntoList!0 (_2!13094 lt!433027) thiss!1728 (bvsub to!474 from!505)))))))

(declare-fun e!212531 () Bool)

(assert (=> b!296951 e!212531))

(declare-fun res!245159 () Bool)

(assert (=> b!296951 (=> (not res!245159) (not e!212531))))

(declare-fun lt!433029 () Bool)

(declare-fun lt!433023 () array!17766)

(declare-fun bitAt!0 (array!17766 (_ BitVec 64)) Bool)

(assert (=> b!296951 (= res!245159 (= (bitAt!0 lt!433023 from!505) lt!433029))))

(assert (=> b!296951 (= lt!433029 (bitAt!0 (_3!1412 lt!433027) from!505))))

(declare-fun lt!433024 () Unit!20705)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17766 array!17766 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20705)

(assert (=> b!296951 (= lt!433024 (arrayBitRangesEqImpliesEq!0 lt!433023 (_3!1412 lt!433027) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17766 array!17766 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296951 (arrayBitRangesEq!0 arr!273 (_3!1412 lt!433027) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433025 () Unit!20705)

(declare-fun arrayBitRangesEqTransitive!0 (array!17766 array!17766 array!17766 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20705)

(assert (=> b!296951 (= lt!433025 (arrayBitRangesEqTransitive!0 arr!273 lt!433023 (_3!1412 lt!433027) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296951 (arrayBitRangesEq!0 arr!273 lt!433023 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23364 0))(
  ( (tuple2!23365 (_1!13095 Bool) (_2!13095 BitStream!13400)) )
))
(declare-fun lt!433028 () tuple2!23364)

(declare-fun lt!433032 () Unit!20705)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17766 (_ BitVec 64) Bool) Unit!20705)

(assert (=> b!296951 (= lt!433032 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13095 lt!433028)))))

(declare-fun e!212528 () Bool)

(assert (=> b!296951 e!212528))

(declare-fun res!245156 () Bool)

(assert (=> b!296951 (=> (not res!245156) (not e!212528))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296951 (= res!245156 (= (bvsub (bvadd (bitIndex!0 (size!7698 (buf!7761 thiss!1728)) (currentByte!14297 thiss!1728) (currentBit!14292 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7698 (buf!7761 (_2!13094 lt!433027))) (currentByte!14297 (_2!13094 lt!433027)) (currentBit!14292 (_2!13094 lt!433027)))))))

(declare-fun readBitsLoop!0 (BitStream!13400 (_ BitVec 64) array!17766 (_ BitVec 64) (_ BitVec 64)) tuple3!1912)

(assert (=> b!296951 (= lt!433027 (readBitsLoop!0 (_2!13095 lt!433028) nBits!523 lt!433023 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296951 (validate_offset_bits!1 ((_ sign_extend 32) (size!7698 (buf!7761 (_2!13095 lt!433028)))) ((_ sign_extend 32) (currentByte!14297 (_2!13095 lt!433028))) ((_ sign_extend 32) (currentBit!14292 (_2!13095 lt!433028))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!433026 () Unit!20705)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13400 BitStream!13400 (_ BitVec 64) (_ BitVec 64)) Unit!20705)

(assert (=> b!296951 (= lt!433026 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13095 lt!433028) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!433030 () (_ BitVec 32))

(declare-fun lt!433031 () (_ BitVec 32))

(assert (=> b!296951 (= lt!433023 (array!17767 (store (arr!8769 arr!273) lt!433031 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8769 arr!273) lt!433031)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433030)))) ((_ sign_extend 24) (ite (_1!13095 lt!433028) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433030) #b00000000))))) (size!7698 arr!273)))))

(assert (=> b!296951 (= lt!433030 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296951 (= lt!433031 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13400) tuple2!23364)

(assert (=> b!296951 (= lt!433028 (readBit!0 thiss!1728))))

(declare-fun b!296952 () Bool)

(assert (=> b!296952 (= e!212527 (array_inv!7310 (buf!7761 thiss!1728)))))

(declare-fun b!296953 () Bool)

(assert (=> b!296953 (= e!212531 (= lt!433029 (_1!13095 lt!433028)))))

(declare-fun b!296954 () Bool)

(declare-fun res!245157 () Bool)

(assert (=> b!296954 (=> (not res!245157) (not e!212529))))

(assert (=> b!296954 (= res!245157 (validate_offset_bits!1 ((_ sign_extend 32) (size!7698 (buf!7761 thiss!1728))) ((_ sign_extend 32) (currentByte!14297 thiss!1728)) ((_ sign_extend 32) (currentBit!14292 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296955 () Bool)

(assert (=> b!296955 (= e!212528 (and (= (buf!7761 thiss!1728) (buf!7761 (_2!13094 lt!433027))) (= (size!7698 arr!273) (size!7698 (_3!1412 lt!433027)))))))

(assert (= (and start!66248 res!245155) b!296954))

(assert (= (and b!296954 res!245157) b!296950))

(assert (= (and b!296950 res!245158) b!296951))

(assert (= (and b!296951 res!245156) b!296955))

(assert (= (and b!296951 res!245159) b!296953))

(assert (= start!66248 b!296952))

(declare-fun m!435599 () Bool)

(assert (=> start!66248 m!435599))

(declare-fun m!435601 () Bool)

(assert (=> start!66248 m!435601))

(declare-fun m!435603 () Bool)

(assert (=> b!296951 m!435603))

(declare-fun m!435605 () Bool)

(assert (=> b!296951 m!435605))

(declare-fun m!435607 () Bool)

(assert (=> b!296951 m!435607))

(declare-fun m!435609 () Bool)

(assert (=> b!296951 m!435609))

(declare-fun m!435611 () Bool)

(assert (=> b!296951 m!435611))

(declare-fun m!435613 () Bool)

(assert (=> b!296951 m!435613))

(declare-fun m!435615 () Bool)

(assert (=> b!296951 m!435615))

(declare-fun m!435617 () Bool)

(assert (=> b!296951 m!435617))

(declare-fun m!435619 () Bool)

(assert (=> b!296951 m!435619))

(declare-fun m!435621 () Bool)

(assert (=> b!296951 m!435621))

(declare-fun m!435623 () Bool)

(assert (=> b!296951 m!435623))

(declare-fun m!435625 () Bool)

(assert (=> b!296951 m!435625))

(declare-fun m!435627 () Bool)

(assert (=> b!296951 m!435627))

(declare-fun m!435629 () Bool)

(assert (=> b!296951 m!435629))

(declare-fun m!435631 () Bool)

(assert (=> b!296951 m!435631))

(declare-fun m!435633 () Bool)

(assert (=> b!296951 m!435633))

(declare-fun m!435635 () Bool)

(assert (=> b!296951 m!435635))

(declare-fun m!435637 () Bool)

(assert (=> b!296951 m!435637))

(declare-fun m!435639 () Bool)

(assert (=> b!296952 m!435639))

(declare-fun m!435641 () Bool)

(assert (=> b!296954 m!435641))

(push 1)

(assert (not b!296951))

(assert (not b!296952))

(assert (not b!296954))

(assert (not start!66248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!433381 () (_ BitVec 64))

(declare-fun bm!5234 () Bool)

(declare-fun lt!433405 () (_ BitVec 32))

(declare-fun lt!433394 () (_ BitVec 32))

(declare-fun call!5238 () Bool)

(declare-fun lt!433407 () (_ BitVec 64))

(declare-fun c!13579 () Bool)

(declare-fun lt!433396 () array!17766)

(declare-fun lt!433409 () array!17766)

(declare-fun lt!433399 () tuple2!23364)

(assert (=> bm!5234 (= call!5238 (arrayBitRangesEq!0 (ite c!13579 lt!433023 lt!433409) (ite c!13579 (array!17767 (store (arr!8769 lt!433023) lt!433394 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8769 lt!433023) lt!433394)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433405)))) ((_ sign_extend 24) (ite (_1!13095 lt!433399) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433405) #b00000000))))) (size!7698 lt!433023)) lt!433396) (ite c!13579 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433381) (ite c!13579 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!433407)))))

(declare-fun b!297096 () Bool)

(declare-fun lt!433404 () Unit!20705)

(declare-fun e!212625 () tuple3!1912)

(assert (=> b!297096 (= e!212625 (tuple3!1913 lt!433404 (_2!13095 lt!433028) lt!433023))))

(declare-fun lt!433387 () Unit!20705)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17766) Unit!20705)

(assert (=> b!297096 (= lt!433387 (arrayBitRangesEqReflexiveLemma!0 lt!433023))))

(declare-fun call!5237 () Bool)

(assert (=> b!297096 call!5237))

(declare-fun lt!433378 () Unit!20705)

(assert (=> b!297096 (= lt!433378 lt!433387)))

(assert (=> b!297096 (= lt!433409 lt!433023)))

(assert (=> b!297096 (= lt!433396 lt!433023)))

(declare-fun lt!433397 () (_ BitVec 64))

(assert (=> b!297096 (= lt!433397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433379 () (_ BitVec 64))

(assert (=> b!297096 (= lt!433379 ((_ sign_extend 32) (size!7698 lt!433023)))))

(declare-fun lt!433392 () (_ BitVec 64))

(assert (=> b!297096 (= lt!433392 (bvmul lt!433379 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!297096 (= lt!433381 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!297096 (= lt!433407 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17766 array!17766 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20705)

(assert (=> b!297096 (= lt!433404 (arrayBitRangesEqSlicedLemma!0 lt!433409 lt!433396 lt!433397 lt!433392 lt!433381 lt!433407))))

(assert (=> b!297096 call!5238))

(declare-fun b!297097 () Bool)

(declare-fun res!245263 () Bool)

(declare-fun e!212624 () Bool)

(assert (=> b!297097 (=> (not res!245263) (not e!212624))))

(declare-fun lt!433401 () tuple3!1912)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297097 (= res!245263 (invariant!0 (currentBit!14292 (_2!13094 lt!433401)) (currentByte!14297 (_2!13094 lt!433401)) (size!7698 (buf!7761 (_2!13094 lt!433401)))))))

(declare-fun b!297098 () Bool)

(declare-fun res!245258 () Bool)

(assert (=> b!297098 (=> (not res!245258) (not e!212624))))

(assert (=> b!297098 (= res!245258 (arrayBitRangesEq!0 lt!433023 (_3!1412 lt!433401) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!297099 () Bool)

(assert (=> b!297099 (= e!212624 (= (byteArrayBitContentToList!0 (_2!13094 lt!433401) (_3!1412 lt!433401) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13094 lt!433401) (_2!13095 lt!433028) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!297099 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!297099 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100076 () Bool)

(assert (=> d!100076 e!212624))

(declare-fun res!245260 () Bool)

(assert (=> d!100076 (=> (not res!245260) (not e!212624))))

(declare-fun lt!433382 () (_ BitVec 64))

(assert (=> d!100076 (= res!245260 (= (bvsub lt!433382 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7698 (buf!7761 (_2!13094 lt!433401))) (currentByte!14297 (_2!13094 lt!433401)) (currentBit!14292 (_2!13094 lt!433401)))))))

(assert (=> d!100076 (or (= (bvand lt!433382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433382 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433380 () (_ BitVec 64))

(assert (=> d!100076 (= lt!433382 (bvadd lt!433380 to!474))))

(assert (=> d!100076 (or (not (= (bvand lt!433380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!433380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!433380 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!100076 (= lt!433380 (bitIndex!0 (size!7698 (buf!7761 (_2!13095 lt!433028))) (currentByte!14297 (_2!13095 lt!433028)) (currentBit!14292 (_2!13095 lt!433028))))))

(assert (=> d!100076 (= lt!433401 e!212625)))

(assert (=> d!100076 (= c!13579 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!100076 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!100076 (= (readBitsLoop!0 (_2!13095 lt!433028) nBits!523 lt!433023 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!433401)))

(declare-fun b!297100 () Bool)

(declare-fun res!245261 () Bool)

(assert (=> b!297100 (=> (not res!245261) (not e!212624))))

(declare-fun e!212626 () Bool)

(assert (=> b!297100 (= res!245261 e!212626)))

(declare-fun res!245257 () Bool)

(assert (=> b!297100 (=> res!245257 e!212626)))

(assert (=> b!297100 (= res!245257 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!297101 () Bool)

(declare-fun res!245259 () Bool)

(assert (=> b!297101 (=> (not res!245259) (not e!212624))))

(assert (=> b!297101 (= res!245259 (and (= (buf!7761 (_2!13095 lt!433028)) (buf!7761 (_2!13094 lt!433401))) (= (size!7698 lt!433023) (size!7698 (_3!1412 lt!433401)))))))

(declare-fun b!297102 () Bool)

(declare-datatypes ((tuple2!23374 0))(
  ( (tuple2!23375 (_1!13102 BitStream!13400) (_2!13102 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13400) tuple2!23374)

(assert (=> b!297102 (= e!212626 (= (bitAt!0 (_3!1412 lt!433401) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13102 (readBitPure!0 (_2!13095 lt!433028)))))))

(declare-fun b!297103 () Bool)

(declare-fun lt!433395 () Unit!20705)

(declare-fun lt!433393 () tuple3!1912)

(assert (=> b!297103 (= e!212625 (tuple3!1913 lt!433395 (_2!13094 lt!433393) (_3!1412 lt!433393)))))

(assert (=> b!297103 (= lt!433399 (readBit!0 (_2!13095 lt!433028)))))

(declare-fun lt!433410 () (_ BitVec 32))

(assert (=> b!297103 (= lt!433410 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433391 () (_ BitVec 32))

(assert (=> b!297103 (= lt!433391 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433406 () array!17766)

(assert (=> b!297103 (= lt!433406 (array!17767 (store (arr!8769 lt!433023) lt!433410 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8769 lt!433023) lt!433410)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433391)))) ((_ sign_extend 24) (ite (_1!13095 lt!433399) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433391) #b00000000))))) (size!7698 lt!433023)))))

(declare-fun lt!433408 () (_ BitVec 64))

(assert (=> b!297103 (= lt!433408 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!433375 () (_ BitVec 64))

(assert (=> b!297103 (= lt!433375 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!433376 () Unit!20705)

(assert (=> b!297103 (= lt!433376 (validateOffsetBitsIneqLemma!0 (_2!13095 lt!433028) (_2!13095 lt!433399) lt!433408 lt!433375))))

(assert (=> b!297103 (validate_offset_bits!1 ((_ sign_extend 32) (size!7698 (buf!7761 (_2!13095 lt!433399)))) ((_ sign_extend 32) (currentByte!14297 (_2!13095 lt!433399))) ((_ sign_extend 32) (currentBit!14292 (_2!13095 lt!433399))) (bvsub lt!433408 lt!433375))))

(declare-fun lt!433377 () Unit!20705)

(assert (=> b!297103 (= lt!433377 lt!433376)))

(assert (=> b!297103 (= lt!433393 (readBitsLoop!0 (_2!13095 lt!433399) nBits!523 lt!433406 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!245262 () Bool)

(assert (=> b!297103 (= res!245262 (= (bvsub (bvadd (bitIndex!0 (size!7698 (buf!7761 (_2!13095 lt!433028))) (currentByte!14297 (_2!13095 lt!433028)) (currentBit!14292 (_2!13095 lt!433028))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7698 (buf!7761 (_2!13094 lt!433393))) (currentByte!14297 (_2!13094 lt!433393)) (currentBit!14292 (_2!13094 lt!433393)))))))

(declare-fun e!212623 () Bool)

(assert (=> b!297103 (=> (not res!245262) (not e!212623))))

(assert (=> b!297103 e!212623))

(declare-fun lt!433400 () Unit!20705)

(declare-fun Unit!20715 () Unit!20705)

(assert (=> b!297103 (= lt!433400 Unit!20715)))

(assert (=> b!297103 (= lt!433394 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297103 (= lt!433405 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433390 () Unit!20705)

(assert (=> b!297103 (= lt!433390 (arrayBitRangesUpdatedAtLemma!0 lt!433023 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!13095 lt!433399)))))

(assert (=> b!297103 call!5238))

(declare-fun lt!433386 () Unit!20705)

(assert (=> b!297103 (= lt!433386 lt!433390)))

(declare-fun lt!433383 () (_ BitVec 64))

(assert (=> b!297103 (= lt!433383 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433403 () Unit!20705)

(assert (=> b!297103 (= lt!433403 (arrayBitRangesEqTransitive!0 lt!433023 lt!433406 (_3!1412 lt!433393) lt!433383 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!297103 call!5237))

(declare-fun lt!433384 () Unit!20705)

(assert (=> b!297103 (= lt!433384 lt!433403)))

(assert (=> b!297103 (arrayBitRangesEq!0 lt!433023 (_3!1412 lt!433393) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!433402 () Unit!20705)

(declare-fun Unit!20716 () Unit!20705)

(assert (=> b!297103 (= lt!433402 Unit!20716)))

(declare-fun lt!433388 () Unit!20705)

(assert (=> b!297103 (= lt!433388 (arrayBitRangesEqImpliesEq!0 lt!433406 (_3!1412 lt!433393) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!297103 (= (bitAt!0 lt!433406 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1412 lt!433393) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!433398 () Unit!20705)

(assert (=> b!297103 (= lt!433398 lt!433388)))

(declare-fun lt!433385 () Unit!20705)

(declare-fun Unit!20717 () Unit!20705)

(assert (=> b!297103 (= lt!433385 Unit!20717)))

(declare-fun lt!433389 () Bool)

(assert (=> b!297103 (= lt!433389 (= (bitAt!0 (_3!1412 lt!433393) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!13095 lt!433399)))))

(declare-fun Unit!20718 () Unit!20705)

(assert (=> b!297103 (= lt!433395 Unit!20718)))

(assert (=> b!297103 lt!433389))

(declare-fun b!297104 () Bool)

(assert (=> b!297104 (= e!212623 (and (= (buf!7761 (_2!13095 lt!433028)) (buf!7761 (_2!13094 lt!433393))) (= (size!7698 lt!433023) (size!7698 (_3!1412 lt!433393)))))))

(declare-fun bm!5235 () Bool)

(assert (=> bm!5235 (= call!5237 (arrayBitRangesEq!0 lt!433023 (ite c!13579 (_3!1412 lt!433393) lt!433023) (ite c!13579 lt!433383 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!13579 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7698 lt!433023)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and d!100076 c!13579) b!297103))

(assert (= (and d!100076 (not c!13579)) b!297096))

(assert (= (and b!297103 res!245262) b!297104))

(assert (= (or b!297103 b!297096) bm!5235))

(assert (= (or b!297103 b!297096) bm!5234))

(assert (= (and d!100076 res!245260) b!297101))

(assert (= (and b!297101 res!245259) b!297098))

(assert (= (and b!297098 res!245258) b!297100))

(assert (= (and b!297100 (not res!245257)) b!297102))

(assert (= (and b!297100 res!245261) b!297097))

(assert (= (and b!297097 res!245263) b!297099))

(declare-fun m!435845 () Bool)

(assert (=> bm!5234 m!435845))

(declare-fun m!435847 () Bool)

(assert (=> bm!5234 m!435847))

(declare-fun m!435849 () Bool)

(assert (=> bm!5234 m!435849))

(declare-fun m!435851 () Bool)

(assert (=> bm!5234 m!435851))

(declare-fun m!435853 () Bool)

(assert (=> b!297096 m!435853))

(declare-fun m!435855 () Bool)

(assert (=> b!297096 m!435855))

(declare-fun m!435857 () Bool)

(assert (=> bm!5235 m!435857))

(declare-fun m!435859 () Bool)

(assert (=> b!297098 m!435859))

(declare-fun m!435861 () Bool)

(assert (=> b!297097 m!435861))

(declare-fun m!435863 () Bool)

(assert (=> d!100076 m!435863))

(declare-fun m!435865 () Bool)

(assert (=> d!100076 m!435865))

(declare-fun m!435867 () Bool)

(assert (=> b!297102 m!435867))

(declare-fun m!435869 () Bool)

(assert (=> b!297102 m!435869))

(declare-fun m!435871 () Bool)

(assert (=> b!297099 m!435871))

(declare-fun m!435873 () Bool)

(assert (=> b!297099 m!435873))

(declare-fun m!435875 () Bool)

(assert (=> b!297103 m!435875))

(declare-fun m!435877 () Bool)

(assert (=> b!297103 m!435877))

(declare-fun m!435879 () Bool)

(assert (=> b!297103 m!435879))

(declare-fun m!435881 () Bool)

(assert (=> b!297103 m!435881))

(declare-fun m!435883 () Bool)

(assert (=> b!297103 m!435883))

(assert (=> b!297103 m!435865))

(declare-fun m!435885 () Bool)

(assert (=> b!297103 m!435885))

(declare-fun m!435887 () Bool)

(assert (=> b!297103 m!435887))

(declare-fun m!435889 () Bool)

(assert (=> b!297103 m!435889))

(declare-fun m!435891 () Bool)

(assert (=> b!297103 m!435891))

(declare-fun m!435893 () Bool)

(assert (=> b!297103 m!435893))

(declare-fun m!435895 () Bool)

(assert (=> b!297103 m!435895))

(declare-fun m!435897 () Bool)

(assert (=> b!297103 m!435897))

(declare-fun m!435899 () Bool)

(assert (=> b!297103 m!435899))

(declare-fun m!435901 () Bool)

(assert (=> b!297103 m!435901))

(assert (=> b!296951 d!100076))

(declare-fun d!100092 () Bool)

(declare-fun e!212638 () Bool)

(assert (=> d!100092 e!212638))

(declare-fun res!245277 () Bool)

(assert (=> d!100092 (=> (not res!245277) (not e!212638))))

(declare-fun lt!433465 () (_ BitVec 64))

(declare-fun lt!433463 () (_ BitVec 64))

(declare-fun lt!433462 () (_ BitVec 64))

(assert (=> d!100092 (= res!245277 (= lt!433465 (bvsub lt!433463 lt!433462)))))

(assert (=> d!100092 (or (= (bvand lt!433463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433462 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433463 lt!433462) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100092 (= lt!433462 (remainingBits!0 ((_ sign_extend 32) (size!7698 (buf!7761 (_2!13094 lt!433027)))) ((_ sign_extend 32) (currentByte!14297 (_2!13094 lt!433027))) ((_ sign_extend 32) (currentBit!14292 (_2!13094 lt!433027)))))))

(declare-fun lt!433464 () (_ BitVec 64))

(declare-fun lt!433466 () (_ BitVec 64))

(assert (=> d!100092 (= lt!433463 (bvmul lt!433464 lt!433466))))

(assert (=> d!100092 (or (= lt!433464 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433466 (bvsdiv (bvmul lt!433464 lt!433466) lt!433464)))))

(assert (=> d!100092 (= lt!433466 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100092 (= lt!433464 ((_ sign_extend 32) (size!7698 (buf!7761 (_2!13094 lt!433027)))))))

(assert (=> d!100092 (= lt!433465 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14297 (_2!13094 lt!433027))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14292 (_2!13094 lt!433027)))))))

(assert (=> d!100092 (invariant!0 (currentBit!14292 (_2!13094 lt!433027)) (currentByte!14297 (_2!13094 lt!433027)) (size!7698 (buf!7761 (_2!13094 lt!433027))))))

(assert (=> d!100092 (= (bitIndex!0 (size!7698 (buf!7761 (_2!13094 lt!433027))) (currentByte!14297 (_2!13094 lt!433027)) (currentBit!14292 (_2!13094 lt!433027))) lt!433465)))

(declare-fun b!297124 () Bool)

(declare-fun res!245278 () Bool)

(assert (=> b!297124 (=> (not res!245278) (not e!212638))))

(assert (=> b!297124 (= res!245278 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433465))))

(declare-fun b!297125 () Bool)

(declare-fun lt!433467 () (_ BitVec 64))

(assert (=> b!297125 (= e!212638 (bvsle lt!433465 (bvmul lt!433467 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297125 (or (= lt!433467 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433467 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433467)))))

(assert (=> b!297125 (= lt!433467 ((_ sign_extend 32) (size!7698 (buf!7761 (_2!13094 lt!433027)))))))

(assert (= (and d!100092 res!245277) b!297124))

(assert (= (and b!297124 res!245278) b!297125))

(declare-fun m!435919 () Bool)

(assert (=> d!100092 m!435919))

(declare-fun m!435921 () Bool)

(assert (=> d!100092 m!435921))

(assert (=> b!296951 d!100092))

(declare-fun d!100100 () Bool)

(declare-fun c!13585 () Bool)

(assert (=> d!100100 (= c!13585 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!212646 () List!998)

(assert (=> d!100100 (= (byteArrayBitContentToList!0 (_2!13094 lt!433027) (_3!1412 lt!433027) from!505 (bvsub to!474 from!505)) e!212646)))

(declare-fun b!297139 () Bool)

(assert (=> b!297139 (= e!212646 Nil!995)))

(declare-fun b!297140 () Bool)

(assert (=> b!297140 (= e!212646 (Cons!994 (not (= (bvand ((_ sign_extend 24) (select (arr!8769 (_3!1412 lt!433027)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!13094 lt!433027) (_3!1412 lt!433027) (bvadd from!505 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!100100 c!13585) b!297139))

(assert (= (and d!100100 (not c!13585)) b!297140))

(declare-fun m!435927 () Bool)

(assert (=> b!297140 m!435927))

(declare-fun m!435929 () Bool)

(assert (=> b!297140 m!435929))

(declare-fun m!435931 () Bool)

(assert (=> b!297140 m!435931))

(assert (=> b!296951 d!100100))

(declare-fun b!297176 () Bool)

(declare-fun res!245314 () Bool)

(declare-fun lt!433527 () (_ BitVec 32))

(assert (=> b!297176 (= res!245314 (= lt!433527 #b00000000000000000000000000000000))))

(declare-fun e!212675 () Bool)

(assert (=> b!297176 (=> res!245314 e!212675)))

(declare-fun e!212676 () Bool)

(assert (=> b!297176 (= e!212676 e!212675)))

(declare-fun b!297177 () Bool)

(declare-fun call!5242 () Bool)

(assert (=> b!297177 (= e!212675 call!5242)))

(declare-fun d!100104 () Bool)

(declare-fun res!245313 () Bool)

(declare-fun e!212679 () Bool)

(assert (=> d!100104 (=> res!245313 e!212679)))

(assert (=> d!100104 (= res!245313 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100104 (= (arrayBitRangesEq!0 arr!273 (_3!1412 lt!433027) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212679)))

(declare-fun b!297178 () Bool)

(declare-fun e!212678 () Bool)

(assert (=> b!297178 (= e!212678 call!5242)))

(declare-fun b!297179 () Bool)

(declare-fun e!212674 () Bool)

(assert (=> b!297179 (= e!212679 e!212674)))

(declare-fun res!245312 () Bool)

(assert (=> b!297179 (=> (not res!245312) (not e!212674))))

(declare-fun e!212677 () Bool)

(assert (=> b!297179 (= res!245312 e!212677)))

(declare-fun res!245310 () Bool)

(assert (=> b!297179 (=> res!245310 e!212677)))

(declare-datatypes ((tuple4!916 0))(
  ( (tuple4!917 (_1!13105 (_ BitVec 32)) (_2!13105 (_ BitVec 32)) (_3!1415 (_ BitVec 32)) (_4!458 (_ BitVec 32))) )
))
(declare-fun lt!433526 () tuple4!916)

(assert (=> b!297179 (= res!245310 (bvsge (_1!13105 lt!433526) (_2!13105 lt!433526)))))

(assert (=> b!297179 (= lt!433527 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433525 () (_ BitVec 32))

(assert (=> b!297179 (= lt!433525 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!916)

(assert (=> b!297179 (= lt!433526 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!297180 () Bool)

(assert (=> b!297180 (= e!212678 e!212676)))

(declare-fun res!245311 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297180 (= res!245311 (byteRangesEq!0 (select (arr!8769 arr!273) (_3!1415 lt!433526)) (select (arr!8769 (_3!1412 lt!433027)) (_3!1415 lt!433526)) lt!433525 #b00000000000000000000000000001000))))

(assert (=> b!297180 (=> (not res!245311) (not e!212676))))

(declare-fun bm!5239 () Bool)

(declare-fun c!13592 () Bool)

(assert (=> bm!5239 (= call!5242 (byteRangesEq!0 (ite c!13592 (select (arr!8769 arr!273) (_3!1415 lt!433526)) (select (arr!8769 arr!273) (_4!458 lt!433526))) (ite c!13592 (select (arr!8769 (_3!1412 lt!433027)) (_3!1415 lt!433526)) (select (arr!8769 (_3!1412 lt!433027)) (_4!458 lt!433526))) (ite c!13592 lt!433525 #b00000000000000000000000000000000) lt!433527))))

(declare-fun b!297181 () Bool)

(declare-fun arrayRangesEq!1516 (array!17766 array!17766 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297181 (= e!212677 (arrayRangesEq!1516 arr!273 (_3!1412 lt!433027) (_1!13105 lt!433526) (_2!13105 lt!433526)))))

(declare-fun b!297182 () Bool)

(assert (=> b!297182 (= e!212674 e!212678)))

(assert (=> b!297182 (= c!13592 (= (_3!1415 lt!433526) (_4!458 lt!433526)))))

(assert (= (and d!100104 (not res!245313)) b!297179))

(assert (= (and b!297179 (not res!245310)) b!297181))

(assert (= (and b!297179 res!245312) b!297182))

(assert (= (and b!297182 c!13592) b!297178))

(assert (= (and b!297182 (not c!13592)) b!297180))

(assert (= (and b!297180 res!245311) b!297176))

(assert (= (and b!297176 (not res!245314)) b!297177))

(assert (= (or b!297178 b!297177) bm!5239))

(declare-fun m!435971 () Bool)

(assert (=> b!297179 m!435971))

(declare-fun m!435973 () Bool)

(assert (=> b!297180 m!435973))

(declare-fun m!435975 () Bool)

(assert (=> b!297180 m!435975))

(assert (=> b!297180 m!435973))

(assert (=> b!297180 m!435975))

(declare-fun m!435977 () Bool)

(assert (=> b!297180 m!435977))

(declare-fun m!435979 () Bool)

(assert (=> bm!5239 m!435979))

(assert (=> bm!5239 m!435975))

(assert (=> bm!5239 m!435973))

(declare-fun m!435981 () Bool)

(assert (=> bm!5239 m!435981))

(declare-fun m!435983 () Bool)

(assert (=> bm!5239 m!435983))

(declare-fun m!435985 () Bool)

(assert (=> b!297181 m!435985))

(assert (=> b!296951 d!100104))

(declare-fun d!100124 () Bool)

(declare-fun e!212690 () Bool)

(assert (=> d!100124 e!212690))

(declare-fun c!13603 () Bool)

(assert (=> d!100124 (= c!13603 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!433543 () List!998)

(declare-datatypes ((tuple2!23380 0))(
  ( (tuple2!23381 (_1!13106 List!998) (_2!13106 BitStream!13400)) )
))
(declare-fun e!212691 () tuple2!23380)

(assert (=> d!100124 (= lt!433543 (_1!13106 e!212691))))

(declare-fun c!13604 () Bool)

(assert (=> d!100124 (= c!13604 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!100124 (bvsge (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!100124 (= (bitStreamReadBitsIntoList!0 (_2!13094 lt!433027) thiss!1728 (bvsub to!474 from!505)) lt!433543)))

(declare-fun b!297206 () Bool)

(declare-fun length!495 (List!998) Int)

(assert (=> b!297206 (= e!212690 (> (length!495 lt!433543) 0))))

(declare-fun b!297204 () Bool)

(declare-fun lt!433545 () (_ BitVec 64))

(declare-fun lt!433544 () tuple2!23364)

(assert (=> b!297204 (= e!212691 (tuple2!23381 (Cons!994 (_1!13095 lt!433544) (bitStreamReadBitsIntoList!0 (_2!13094 lt!433027) (_2!13095 lt!433544) (bvsub (bvsub to!474 from!505) lt!433545))) (_2!13095 lt!433544)))))

(assert (=> b!297204 (= lt!433544 (readBit!0 thiss!1728))))

(assert (=> b!297204 (= lt!433545 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!297205 () Bool)

(declare-fun isEmpty!270 (List!998) Bool)

(assert (=> b!297205 (= e!212690 (isEmpty!270 lt!433543))))

(declare-fun b!297203 () Bool)

(assert (=> b!297203 (= e!212691 (tuple2!23381 Nil!995 thiss!1728))))

(assert (= (and d!100124 c!13604) b!297203))

(assert (= (and d!100124 (not c!13604)) b!297204))

(assert (= (and d!100124 c!13603) b!297205))

(assert (= (and d!100124 (not c!13603)) b!297206))

(declare-fun m!435993 () Bool)

(assert (=> b!297206 m!435993))

(declare-fun m!435995 () Bool)

(assert (=> b!297204 m!435995))

(assert (=> b!297204 m!435629))

(declare-fun m!435997 () Bool)

(assert (=> b!297205 m!435997))

(assert (=> b!296951 d!100124))

(declare-fun d!100128 () Bool)

(declare-fun e!212692 () Bool)

(assert (=> d!100128 e!212692))

(declare-fun res!245315 () Bool)

(assert (=> d!100128 (=> (not res!245315) (not e!212692))))

(declare-fun lt!433549 () (_ BitVec 64))

(declare-fun lt!433547 () (_ BitVec 64))

(declare-fun lt!433546 () (_ BitVec 64))

(assert (=> d!100128 (= res!245315 (= lt!433549 (bvsub lt!433547 lt!433546)))))

(assert (=> d!100128 (or (= (bvand lt!433547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433547 lt!433546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!100128 (= lt!433546 (remainingBits!0 ((_ sign_extend 32) (size!7698 (buf!7761 thiss!1728))) ((_ sign_extend 32) (currentByte!14297 thiss!1728)) ((_ sign_extend 32) (currentBit!14292 thiss!1728))))))

(declare-fun lt!433548 () (_ BitVec 64))

(declare-fun lt!433550 () (_ BitVec 64))

(assert (=> d!100128 (= lt!433547 (bvmul lt!433548 lt!433550))))

(assert (=> d!100128 (or (= lt!433548 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433550 (bvsdiv (bvmul lt!433548 lt!433550) lt!433548)))))

(assert (=> d!100128 (= lt!433550 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100128 (= lt!433548 ((_ sign_extend 32) (size!7698 (buf!7761 thiss!1728))))))

(assert (=> d!100128 (= lt!433549 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14297 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14292 thiss!1728))))))

(assert (=> d!100128 (invariant!0 (currentBit!14292 thiss!1728) (currentByte!14297 thiss!1728) (size!7698 (buf!7761 thiss!1728)))))

(assert (=> d!100128 (= (bitIndex!0 (size!7698 (buf!7761 thiss!1728)) (currentByte!14297 thiss!1728) (currentBit!14292 thiss!1728)) lt!433549)))

(declare-fun b!297207 () Bool)

(declare-fun res!245316 () Bool)

(assert (=> b!297207 (=> (not res!245316) (not e!212692))))

(assert (=> b!297207 (= res!245316 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433549))))

(declare-fun b!297208 () Bool)

(declare-fun lt!433551 () (_ BitVec 64))

(assert (=> b!297208 (= e!212692 (bvsle lt!433549 (bvmul lt!433551 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297208 (or (= lt!433551 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433551 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433551)))))

(assert (=> b!297208 (= lt!433551 ((_ sign_extend 32) (size!7698 (buf!7761 thiss!1728))))))

(assert (= (and d!100128 res!245315) b!297207))

(assert (= (and b!297207 res!245316) b!297208))

(declare-fun m!435999 () Bool)

(assert (=> d!100128 m!435999))

(declare-fun m!436001 () Bool)

(assert (=> d!100128 m!436001))

(assert (=> b!296951 d!100128))

(declare-fun d!100130 () Bool)

(assert (=> d!100130 (arrayBitRangesEq!0 arr!273 (_3!1412 lt!433027) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433554 () Unit!20705)

(declare-fun choose!49 (array!17766 array!17766 array!17766 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20705)

(assert (=> d!100130 (= lt!433554 (choose!49 arr!273 lt!433023 (_3!1412 lt!433027) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100130 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100130 (= (arrayBitRangesEqTransitive!0 arr!273 lt!433023 (_3!1412 lt!433027) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!433554)))

(declare-fun bs!25602 () Bool)

(assert (= bs!25602 d!100130))

(assert (=> bs!25602 m!435631))

(declare-fun m!436003 () Bool)

(assert (=> bs!25602 m!436003))

(assert (=> b!296951 d!100130))

(declare-fun d!100132 () Bool)

(declare-fun e!212701 () Bool)

(assert (=> d!100132 e!212701))

(declare-fun res!245321 () Bool)

(assert (=> d!100132 (=> (not res!245321) (not e!212701))))

(declare-fun lt!433577 () (_ BitVec 32))

(assert (=> d!100132 (= res!245321 (and (bvsge lt!433577 #b00000000000000000000000000000000) (bvslt lt!433577 (size!7698 arr!273))))))

(declare-fun lt!433580 () (_ BitVec 8))

(declare-fun lt!433579 () (_ BitVec 32))

(declare-fun lt!433578 () Unit!20705)

(declare-fun choose!53 (array!17766 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20705)

(assert (=> d!100132 (= lt!433578 (choose!53 arr!273 from!505 (_1!13095 lt!433028) lt!433577 lt!433579 lt!433580))))

(assert (=> d!100132 (= lt!433580 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8769 arr!273) lt!433577)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433579)))) ((_ sign_extend 24) (ite (_1!13095 lt!433028) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433579) #b00000000)))))))

(assert (=> d!100132 (= lt!433579 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!100132 (= lt!433577 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!100132 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13095 lt!433028)) lt!433578)))

(declare-fun b!297214 () Bool)

(assert (=> b!297214 (= e!212701 (arrayBitRangesEq!0 arr!273 (array!17767 (store (arr!8769 arr!273) lt!433577 lt!433580) (size!7698 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!100132 res!245321) b!297214))

(declare-fun m!436005 () Bool)

(assert (=> d!100132 m!436005))

(declare-fun m!436007 () Bool)

(assert (=> d!100132 m!436007))

(declare-fun m!436009 () Bool)

(assert (=> d!100132 m!436009))

(declare-fun m!436011 () Bool)

(assert (=> b!297214 m!436011))

(declare-fun m!436013 () Bool)

(assert (=> b!297214 m!436013))

(assert (=> b!296951 d!100132))

(declare-fun d!100134 () Bool)

(assert (=> d!100134 (= (bitAt!0 lt!433023 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8769 lt!433023) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25603 () Bool)

(assert (= bs!25603 d!100134))

(declare-fun m!436025 () Bool)

(assert (=> bs!25603 m!436025))

(assert (=> bs!25603 m!435929))

(assert (=> b!296951 d!100134))

(declare-fun b!297216 () Bool)

(declare-fun res!245327 () Bool)

(declare-fun lt!433590 () (_ BitVec 32))

(assert (=> b!297216 (= res!245327 (= lt!433590 #b00000000000000000000000000000000))))

(declare-fun e!212704 () Bool)

(assert (=> b!297216 (=> res!245327 e!212704)))

(declare-fun e!212705 () Bool)

(assert (=> b!297216 (= e!212705 e!212704)))

(declare-fun b!297217 () Bool)

(declare-fun call!5243 () Bool)

(assert (=> b!297217 (= e!212704 call!5243)))

(declare-fun d!100138 () Bool)

(declare-fun res!245326 () Bool)

(declare-fun e!212708 () Bool)

(assert (=> d!100138 (=> res!245326 e!212708)))

(assert (=> d!100138 (= res!245326 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100138 (= (arrayBitRangesEq!0 arr!273 lt!433023 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212708)))

(declare-fun b!297218 () Bool)

(declare-fun e!212707 () Bool)

(assert (=> b!297218 (= e!212707 call!5243)))

(declare-fun b!297219 () Bool)

(declare-fun e!212703 () Bool)

(assert (=> b!297219 (= e!212708 e!212703)))

(declare-fun res!245325 () Bool)

(assert (=> b!297219 (=> (not res!245325) (not e!212703))))

(declare-fun e!212706 () Bool)

(assert (=> b!297219 (= res!245325 e!212706)))

(declare-fun res!245323 () Bool)

(assert (=> b!297219 (=> res!245323 e!212706)))

(declare-fun lt!433589 () tuple4!916)

(assert (=> b!297219 (= res!245323 (bvsge (_1!13105 lt!433589) (_2!13105 lt!433589)))))

(assert (=> b!297219 (= lt!433590 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433588 () (_ BitVec 32))

(assert (=> b!297219 (= lt!433588 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297219 (= lt!433589 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!297220 () Bool)

(assert (=> b!297220 (= e!212707 e!212705)))

(declare-fun res!245324 () Bool)

(assert (=> b!297220 (= res!245324 (byteRangesEq!0 (select (arr!8769 arr!273) (_3!1415 lt!433589)) (select (arr!8769 lt!433023) (_3!1415 lt!433589)) lt!433588 #b00000000000000000000000000001000))))

(assert (=> b!297220 (=> (not res!245324) (not e!212705))))

(declare-fun bm!5240 () Bool)

(declare-fun c!13605 () Bool)

(assert (=> bm!5240 (= call!5243 (byteRangesEq!0 (ite c!13605 (select (arr!8769 arr!273) (_3!1415 lt!433589)) (select (arr!8769 arr!273) (_4!458 lt!433589))) (ite c!13605 (select (arr!8769 lt!433023) (_3!1415 lt!433589)) (select (arr!8769 lt!433023) (_4!458 lt!433589))) (ite c!13605 lt!433588 #b00000000000000000000000000000000) lt!433590))))

(declare-fun b!297221 () Bool)

(assert (=> b!297221 (= e!212706 (arrayRangesEq!1516 arr!273 lt!433023 (_1!13105 lt!433589) (_2!13105 lt!433589)))))

(declare-fun b!297222 () Bool)

(assert (=> b!297222 (= e!212703 e!212707)))

(assert (=> b!297222 (= c!13605 (= (_3!1415 lt!433589) (_4!458 lt!433589)))))

(assert (= (and d!100138 (not res!245326)) b!297219))

(assert (= (and b!297219 (not res!245323)) b!297221))

(assert (= (and b!297219 res!245325) b!297222))

(assert (= (and b!297222 c!13605) b!297218))

(assert (= (and b!297222 (not c!13605)) b!297220))

(assert (= (and b!297220 res!245324) b!297216))

(assert (= (and b!297216 (not res!245327)) b!297217))

(assert (= (or b!297218 b!297217) bm!5240))

(assert (=> b!297219 m!435971))

(declare-fun m!436027 () Bool)

(assert (=> b!297220 m!436027))

(declare-fun m!436029 () Bool)

(assert (=> b!297220 m!436029))

(assert (=> b!297220 m!436027))

(assert (=> b!297220 m!436029))

(declare-fun m!436031 () Bool)

(assert (=> b!297220 m!436031))

(declare-fun m!436033 () Bool)

(assert (=> bm!5240 m!436033))

(assert (=> bm!5240 m!436029))

(assert (=> bm!5240 m!436027))

(declare-fun m!436035 () Bool)

(assert (=> bm!5240 m!436035))

(declare-fun m!436037 () Bool)

(assert (=> bm!5240 m!436037))

(declare-fun m!436039 () Bool)

(assert (=> b!297221 m!436039))

(assert (=> b!296951 d!100138))

(declare-fun d!100144 () Bool)

(declare-fun e!212711 () Bool)

(assert (=> d!100144 e!212711))

(declare-fun res!245330 () Bool)

(assert (=> d!100144 (=> (not res!245330) (not e!212711))))

(assert (=> d!100144 (= res!245330 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!433593 () Unit!20705)

(declare-fun choose!27 (BitStream!13400 BitStream!13400 (_ BitVec 64) (_ BitVec 64)) Unit!20705)

(assert (=> d!100144 (= lt!433593 (choose!27 thiss!1728 (_2!13095 lt!433028) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!100144 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!100144 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13095 lt!433028) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!433593)))

(declare-fun b!297225 () Bool)

(assert (=> b!297225 (= e!212711 (validate_offset_bits!1 ((_ sign_extend 32) (size!7698 (buf!7761 (_2!13095 lt!433028)))) ((_ sign_extend 32) (currentByte!14297 (_2!13095 lt!433028))) ((_ sign_extend 32) (currentBit!14292 (_2!13095 lt!433028))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!100144 res!245330) b!297225))

(declare-fun m!436041 () Bool)

(assert (=> d!100144 m!436041))

(assert (=> b!297225 m!435615))

(assert (=> b!296951 d!100144))

(declare-fun d!100148 () Bool)

(assert (=> d!100148 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7698 (buf!7761 (_2!13095 lt!433028)))) ((_ sign_extend 32) (currentByte!14297 (_2!13095 lt!433028))) ((_ sign_extend 32) (currentBit!14292 (_2!13095 lt!433028))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7698 (buf!7761 (_2!13095 lt!433028)))) ((_ sign_extend 32) (currentByte!14297 (_2!13095 lt!433028))) ((_ sign_extend 32) (currentBit!14292 (_2!13095 lt!433028)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25606 () Bool)

(assert (= bs!25606 d!100148))

(declare-fun m!436043 () Bool)

(assert (=> bs!25606 m!436043))

(assert (=> b!296951 d!100148))

(declare-fun d!100150 () Bool)

(assert (=> d!100150 (= (bitAt!0 (_3!1412 lt!433027) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8769 (_3!1412 lt!433027)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25607 () Bool)

(assert (= bs!25607 d!100150))

(assert (=> bs!25607 m!435927))

(assert (=> bs!25607 m!435929))

(assert (=> b!296951 d!100150))

(declare-fun d!100152 () Bool)

(assert (=> d!100152 (= (bitAt!0 lt!433023 from!505) (bitAt!0 (_3!1412 lt!433027) from!505))))

(declare-fun lt!433596 () Unit!20705)

(declare-fun choose!31 (array!17766 array!17766 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20705)

(assert (=> d!100152 (= lt!433596 (choose!31 lt!433023 (_3!1412 lt!433027) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100152 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100152 (= (arrayBitRangesEqImpliesEq!0 lt!433023 (_3!1412 lt!433027) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!433596)))

(declare-fun bs!25608 () Bool)

(assert (= bs!25608 d!100152))

(assert (=> bs!25608 m!435623))

(assert (=> bs!25608 m!435617))

(declare-fun m!436045 () Bool)

(assert (=> bs!25608 m!436045))

(assert (=> b!296951 d!100152))

(declare-fun d!100154 () Bool)

(declare-fun e!212718 () Bool)

(assert (=> d!100154 e!212718))

(declare-fun res!245333 () Bool)

(assert (=> d!100154 (=> (not res!245333) (not e!212718))))

(declare-datatypes ((tuple2!23382 0))(
  ( (tuple2!23383 (_1!13107 Unit!20705) (_2!13107 BitStream!13400)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13400) tuple2!23382)

(assert (=> d!100154 (= res!245333 (= (buf!7761 (_2!13107 (increaseBitIndex!0 thiss!1728))) (buf!7761 thiss!1728)))))

(declare-fun lt!433615 () Bool)

(assert (=> d!100154 (= lt!433615 (not (= (bvand ((_ sign_extend 24) (select (arr!8769 (buf!7761 thiss!1728)) (currentByte!14297 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14292 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!433612 () tuple2!23364)

(assert (=> d!100154 (= lt!433612 (tuple2!23365 (not (= (bvand ((_ sign_extend 24) (select (arr!8769 (buf!7761 thiss!1728)) (currentByte!14297 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14292 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13107 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!100154 (validate_offset_bit!0 ((_ sign_extend 32) (size!7698 (buf!7761 thiss!1728))) ((_ sign_extend 32) (currentByte!14297 thiss!1728)) ((_ sign_extend 32) (currentBit!14292 thiss!1728)))))

(assert (=> d!100154 (= (readBit!0 thiss!1728) lt!433612)))

(declare-fun lt!433616 () (_ BitVec 64))

(declare-fun lt!433613 () (_ BitVec 64))

(declare-fun b!297228 () Bool)

(assert (=> b!297228 (= e!212718 (= (bitIndex!0 (size!7698 (buf!7761 (_2!13107 (increaseBitIndex!0 thiss!1728)))) (currentByte!14297 (_2!13107 (increaseBitIndex!0 thiss!1728))) (currentBit!14292 (_2!13107 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!433616 lt!433613)))))

(assert (=> b!297228 (or (not (= (bvand lt!433616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433613 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!433616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!433616 lt!433613) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!297228 (= lt!433613 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!297228 (= lt!433616 (bitIndex!0 (size!7698 (buf!7761 thiss!1728)) (currentByte!14297 thiss!1728) (currentBit!14292 thiss!1728)))))

(declare-fun lt!433611 () Bool)

(assert (=> b!297228 (= lt!433611 (not (= (bvand ((_ sign_extend 24) (select (arr!8769 (buf!7761 thiss!1728)) (currentByte!14297 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14292 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!433617 () Bool)

(assert (=> b!297228 (= lt!433617 (not (= (bvand ((_ sign_extend 24) (select (arr!8769 (buf!7761 thiss!1728)) (currentByte!14297 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14292 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!433614 () Bool)

(assert (=> b!297228 (= lt!433614 (not (= (bvand ((_ sign_extend 24) (select (arr!8769 (buf!7761 thiss!1728)) (currentByte!14297 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14292 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!100154 res!245333) b!297228))

(declare-fun m!436047 () Bool)

(assert (=> d!100154 m!436047))

(declare-fun m!436049 () Bool)

(assert (=> d!100154 m!436049))

(declare-fun m!436051 () Bool)

(assert (=> d!100154 m!436051))

(declare-fun m!436053 () Bool)

(assert (=> d!100154 m!436053))

(assert (=> b!297228 m!436051))

(declare-fun m!436055 () Bool)

(assert (=> b!297228 m!436055))

(assert (=> b!297228 m!436047))

(assert (=> b!297228 m!435609))

(assert (=> b!297228 m!436049))

(assert (=> b!296951 d!100154))

(declare-fun d!100156 () Bool)

(assert (=> d!100156 (= (array_inv!7310 (buf!7761 thiss!1728)) (bvsge (size!7698 (buf!7761 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!296952 d!100156))

(declare-fun d!100158 () Bool)

(assert (=> d!100158 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7698 (buf!7761 thiss!1728))) ((_ sign_extend 32) (currentByte!14297 thiss!1728)) ((_ sign_extend 32) (currentBit!14292 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7698 (buf!7761 thiss!1728))) ((_ sign_extend 32) (currentByte!14297 thiss!1728)) ((_ sign_extend 32) (currentBit!14292 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25609 () Bool)

(assert (= bs!25609 d!100158))

(assert (=> bs!25609 m!435999))

(assert (=> b!296954 d!100158))

(declare-fun d!100160 () Bool)

(assert (=> d!100160 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14292 thiss!1728) (currentByte!14297 thiss!1728) (size!7698 (buf!7761 thiss!1728))))))

(declare-fun bs!25610 () Bool)

(assert (= bs!25610 d!100160))

(assert (=> bs!25610 m!436001))

(assert (=> start!66248 d!100160))

(declare-fun d!100162 () Bool)

(assert (=> d!100162 (= (array_inv!7310 arr!273) (bvsge (size!7698 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66248 d!100162))

(push 1)

(assert (not b!297097))

(assert (not b!297221))

(assert (not d!100154))

(assert (not b!297206))

(assert (not d!100160))

(assert (not b!297205))

(assert (not b!297099))

(assert (not bm!5235))

(assert (not bm!5234))

(assert (not d!100152))

(assert (not d!100144))

(assert (not d!100076))

(assert (not d!100158))

(assert (not d!100128))

(assert (not b!297214))

(assert (not b!297179))

(assert (not b!297228))

(assert (not b!297181))

(assert (not d!100130))

(assert (not b!297140))

(assert (not b!297098))

(assert (not d!100092))

(assert (not b!297103))

(assert (not d!100132))

(assert (not b!297204))

(assert (not b!297220))

(assert (not b!297219))

(assert (not d!100148))

(assert (not b!297225))

(assert (not bm!5239))

(assert (not b!297096))

(assert (not b!297180))

(assert (not b!297102))

(assert (not bm!5240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

