; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66244 () Bool)

(assert start!66244)

(declare-fun b!296914 () Bool)

(declare-fun e!212493 () Bool)

(declare-datatypes ((array!17762 0))(
  ( (array!17763 (arr!8767 (Array (_ BitVec 32) (_ BitVec 8))) (size!7696 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13396 0))(
  ( (BitStream!13397 (buf!7759 array!17762) (currentByte!14295 (_ BitVec 32)) (currentBit!14290 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13396)

(declare-fun array_inv!7308 (array!17762) Bool)

(assert (=> b!296914 (= e!212493 (array_inv!7308 (buf!7759 thiss!1728)))))

(declare-fun b!296915 () Bool)

(declare-fun e!212496 () Bool)

(declare-fun lt!432972 () Bool)

(declare-datatypes ((tuple2!23360 0))(
  ( (tuple2!23361 (_1!13090 Bool) (_2!13090 BitStream!13396)) )
))
(declare-fun lt!432963 () tuple2!23360)

(assert (=> b!296915 (= e!212496 (= lt!432972 (_1!13090 lt!432963)))))

(declare-fun b!296916 () Bool)

(declare-fun res!245126 () Bool)

(declare-fun e!212494 () Bool)

(assert (=> b!296916 (=> (not res!245126) (not e!212494))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296916 (= res!245126 (validate_offset_bits!1 ((_ sign_extend 32) (size!7696 (buf!7759 thiss!1728))) ((_ sign_extend 32) (currentByte!14295 thiss!1728)) ((_ sign_extend 32) (currentBit!14290 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296917 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(declare-datatypes ((Unit!20701 0))(
  ( (Unit!20702) )
))
(declare-datatypes ((tuple3!1908 0))(
  ( (tuple3!1909 (_1!13091 Unit!20701) (_2!13091 BitStream!13396) (_3!1410 array!17762)) )
))
(declare-fun lt!432965 () tuple3!1908)

(declare-datatypes ((List!996 0))(
  ( (Nil!993) (Cons!992 (h!1111 Bool) (t!1881 List!996)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13396 array!17762 (_ BitVec 64) (_ BitVec 64)) List!996)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13396 BitStream!13396 (_ BitVec 64)) List!996)

(assert (=> b!296917 (= e!212494 (not (= (byteArrayBitContentToList!0 (_2!13091 lt!432965) (_3!1410 lt!432965) from!505 (bvsub to!474 from!505)) (bitStreamReadBitsIntoList!0 (_2!13091 lt!432965) thiss!1728 (bvsub to!474 from!505)))))))

(assert (=> b!296917 e!212496))

(declare-fun res!245125 () Bool)

(assert (=> b!296917 (=> (not res!245125) (not e!212496))))

(declare-fun lt!432971 () array!17762)

(declare-fun bitAt!0 (array!17762 (_ BitVec 64)) Bool)

(assert (=> b!296917 (= res!245125 (= (bitAt!0 lt!432971 from!505) lt!432972))))

(assert (=> b!296917 (= lt!432972 (bitAt!0 (_3!1410 lt!432965) from!505))))

(declare-fun lt!432970 () Unit!20701)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17762 array!17762 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20701)

(assert (=> b!296917 (= lt!432970 (arrayBitRangesEqImpliesEq!0 lt!432971 (_3!1410 lt!432965) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17762)

(declare-fun arrayBitRangesEq!0 (array!17762 array!17762 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296917 (arrayBitRangesEq!0 arr!273 (_3!1410 lt!432965) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432968 () Unit!20701)

(declare-fun arrayBitRangesEqTransitive!0 (array!17762 array!17762 array!17762 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20701)

(assert (=> b!296917 (= lt!432968 (arrayBitRangesEqTransitive!0 arr!273 lt!432971 (_3!1410 lt!432965) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296917 (arrayBitRangesEq!0 arr!273 lt!432971 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432964 () Unit!20701)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17762 (_ BitVec 64) Bool) Unit!20701)

(assert (=> b!296917 (= lt!432964 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13090 lt!432963)))))

(declare-fun e!212495 () Bool)

(assert (=> b!296917 e!212495))

(declare-fun res!245127 () Bool)

(assert (=> b!296917 (=> (not res!245127) (not e!212495))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296917 (= res!245127 (= (bvsub (bvadd (bitIndex!0 (size!7696 (buf!7759 thiss!1728)) (currentByte!14295 thiss!1728) (currentBit!14290 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7696 (buf!7759 (_2!13091 lt!432965))) (currentByte!14295 (_2!13091 lt!432965)) (currentBit!14290 (_2!13091 lt!432965)))))))

(declare-fun readBitsLoop!0 (BitStream!13396 (_ BitVec 64) array!17762 (_ BitVec 64) (_ BitVec 64)) tuple3!1908)

(assert (=> b!296917 (= lt!432965 (readBitsLoop!0 (_2!13090 lt!432963) nBits!523 lt!432971 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296917 (validate_offset_bits!1 ((_ sign_extend 32) (size!7696 (buf!7759 (_2!13090 lt!432963)))) ((_ sign_extend 32) (currentByte!14295 (_2!13090 lt!432963))) ((_ sign_extend 32) (currentBit!14290 (_2!13090 lt!432963))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!432966 () Unit!20701)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13396 BitStream!13396 (_ BitVec 64) (_ BitVec 64)) Unit!20701)

(assert (=> b!296917 (= lt!432966 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13090 lt!432963) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!432967 () (_ BitVec 32))

(declare-fun lt!432969 () (_ BitVec 32))

(assert (=> b!296917 (= lt!432971 (array!17763 (store (arr!8767 arr!273) lt!432969 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8767 arr!273) lt!432969)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432967)))) ((_ sign_extend 24) (ite (_1!13090 lt!432963) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432967) #b00000000))))) (size!7696 arr!273)))))

(assert (=> b!296917 (= lt!432967 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296917 (= lt!432969 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13396) tuple2!23360)

(assert (=> b!296917 (= lt!432963 (readBit!0 thiss!1728))))

(declare-fun res!245129 () Bool)

(assert (=> start!66244 (=> (not res!245129) (not e!212494))))

(assert (=> start!66244 (= res!245129 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7696 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66244 e!212494))

(declare-fun inv!12 (BitStream!13396) Bool)

(assert (=> start!66244 (and (inv!12 thiss!1728) e!212493)))

(assert (=> start!66244 true))

(assert (=> start!66244 (array_inv!7308 arr!273)))

(declare-fun b!296918 () Bool)

(assert (=> b!296918 (= e!212495 (and (= (buf!7759 thiss!1728) (buf!7759 (_2!13091 lt!432965))) (= (size!7696 arr!273) (size!7696 (_3!1410 lt!432965)))))))

(declare-fun b!296919 () Bool)

(declare-fun res!245128 () Bool)

(assert (=> b!296919 (=> (not res!245128) (not e!212494))))

(assert (=> b!296919 (= res!245128 (bvslt from!505 to!474))))

(assert (= (and start!66244 res!245129) b!296916))

(assert (= (and b!296916 res!245126) b!296919))

(assert (= (and b!296919 res!245128) b!296917))

(assert (= (and b!296917 res!245127) b!296918))

(assert (= (and b!296917 res!245125) b!296915))

(assert (= start!66244 b!296914))

(declare-fun m!435511 () Bool)

(assert (=> b!296914 m!435511))

(declare-fun m!435513 () Bool)

(assert (=> b!296916 m!435513))

(declare-fun m!435515 () Bool)

(assert (=> b!296917 m!435515))

(declare-fun m!435517 () Bool)

(assert (=> b!296917 m!435517))

(declare-fun m!435519 () Bool)

(assert (=> b!296917 m!435519))

(declare-fun m!435521 () Bool)

(assert (=> b!296917 m!435521))

(declare-fun m!435523 () Bool)

(assert (=> b!296917 m!435523))

(declare-fun m!435525 () Bool)

(assert (=> b!296917 m!435525))

(declare-fun m!435527 () Bool)

(assert (=> b!296917 m!435527))

(declare-fun m!435529 () Bool)

(assert (=> b!296917 m!435529))

(declare-fun m!435531 () Bool)

(assert (=> b!296917 m!435531))

(declare-fun m!435533 () Bool)

(assert (=> b!296917 m!435533))

(declare-fun m!435535 () Bool)

(assert (=> b!296917 m!435535))

(declare-fun m!435537 () Bool)

(assert (=> b!296917 m!435537))

(declare-fun m!435539 () Bool)

(assert (=> b!296917 m!435539))

(declare-fun m!435541 () Bool)

(assert (=> b!296917 m!435541))

(declare-fun m!435543 () Bool)

(assert (=> b!296917 m!435543))

(declare-fun m!435545 () Bool)

(assert (=> b!296917 m!435545))

(declare-fun m!435547 () Bool)

(assert (=> b!296917 m!435547))

(declare-fun m!435549 () Bool)

(assert (=> b!296917 m!435549))

(declare-fun m!435551 () Bool)

(assert (=> start!66244 m!435551))

(declare-fun m!435553 () Bool)

(assert (=> start!66244 m!435553))

(push 1)

(assert (not b!296917))

(assert (not start!66244))

(assert (not b!296916))

(assert (not b!296914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100060 () Bool)

(declare-fun e!212559 () Bool)

(assert (=> d!100060 e!212559))

(declare-fun res!245177 () Bool)

(assert (=> d!100060 (=> (not res!245177) (not e!212559))))

(assert (=> d!100060 (= res!245177 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!433056 () Unit!20701)

(declare-fun choose!27 (BitStream!13396 BitStream!13396 (_ BitVec 64) (_ BitVec 64)) Unit!20701)

(assert (=> d!100060 (= lt!433056 (choose!27 thiss!1728 (_2!13090 lt!432963) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!100060 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!100060 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13090 lt!432963) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!433056)))

(declare-fun b!296991 () Bool)

(assert (=> b!296991 (= e!212559 (validate_offset_bits!1 ((_ sign_extend 32) (size!7696 (buf!7759 (_2!13090 lt!432963)))) ((_ sign_extend 32) (currentByte!14295 (_2!13090 lt!432963))) ((_ sign_extend 32) (currentBit!14290 (_2!13090 lt!432963))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!100060 res!245177) b!296991))

(declare-fun m!435671 () Bool)

(assert (=> d!100060 m!435671))

(assert (=> b!296991 m!435537))

(assert (=> b!296917 d!100060))

(declare-fun d!100066 () Bool)

(assert (=> d!100066 (= (bitAt!0 lt!432971 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8767 lt!432971) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25593 () Bool)

(assert (= bs!25593 d!100066))

(declare-fun m!435673 () Bool)

(assert (=> bs!25593 m!435673))

(declare-fun m!435675 () Bool)

(assert (=> bs!25593 m!435675))

(assert (=> b!296917 d!100066))

(declare-fun d!100068 () Bool)

(assert (=> d!100068 (arrayBitRangesEq!0 arr!273 (_3!1410 lt!432965) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433071 () Unit!20701)

(declare-fun choose!49 (array!17762 array!17762 array!17762 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20701)

(assert (=> d!100068 (= lt!433071 (choose!49 arr!273 lt!432971 (_3!1410 lt!432965) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100068 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100068 (= (arrayBitRangesEqTransitive!0 arr!273 lt!432971 (_3!1410 lt!432965) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!433071)))

(declare-fun bs!25594 () Bool)

(assert (= bs!25594 d!100068))

(assert (=> bs!25594 m!435527))

(declare-fun m!435677 () Bool)

(assert (=> bs!25594 m!435677))

(assert (=> b!296917 d!100068))

(declare-fun d!100070 () Bool)

(assert (=> d!100070 (= (bitAt!0 (_3!1410 lt!432965) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8767 (_3!1410 lt!432965)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25595 () Bool)

(assert (= bs!25595 d!100070))

(declare-fun m!435687 () Bool)

(assert (=> bs!25595 m!435687))

(assert (=> bs!25595 m!435675))

(assert (=> b!296917 d!100070))

(declare-fun e!212585 () Bool)

(declare-fun b!297033 () Bool)

(declare-fun lt!433222 () tuple3!1908)

(declare-datatypes ((tuple2!23370 0))(
  ( (tuple2!23371 (_1!13099 BitStream!13396) (_2!13099 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13396) tuple2!23370)

(assert (=> b!297033 (= e!212585 (= (bitAt!0 (_3!1410 lt!433222) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13099 (readBitPure!0 (_2!13090 lt!432963)))))))

(declare-fun b!297035 () Bool)

(declare-fun res!245212 () Bool)

(declare-fun e!212586 () Bool)

(assert (=> b!297035 (=> (not res!245212) (not e!212586))))

(assert (=> b!297035 (= res!245212 (and (= (buf!7759 (_2!13090 lt!432963)) (buf!7759 (_2!13091 lt!433222))) (= (size!7696 lt!432971) (size!7696 (_3!1410 lt!433222)))))))

(declare-fun lt!433254 () (_ BitVec 64))

(declare-fun call!5225 () Bool)

(declare-fun lt!433216 () array!17762)

(declare-fun lt!433239 () tuple3!1908)

(declare-fun lt!433242 () (_ BitVec 64))

(declare-fun lt!433284 () array!17762)

(declare-fun c!13571 () Bool)

(declare-fun bm!5222 () Bool)

(assert (=> bm!5222 (= call!5225 (arrayBitRangesEq!0 (ite c!13571 lt!432971 lt!433284) (ite c!13571 (_3!1410 lt!433239) lt!433216) (ite c!13571 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433242) (ite c!13571 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!433254)))))

(declare-fun e!212580 () Bool)

(declare-fun b!297038 () Bool)

(assert (=> b!297038 (= e!212580 (and (= (buf!7759 (_2!13090 lt!432963)) (buf!7759 (_2!13091 lt!433239))) (= (size!7696 lt!432971) (size!7696 (_3!1410 lt!433239)))))))

(declare-fun d!100074 () Bool)

(assert (=> d!100074 e!212586))

(declare-fun res!245215 () Bool)

(assert (=> d!100074 (=> (not res!245215) (not e!212586))))

(declare-fun lt!433287 () (_ BitVec 64))

(assert (=> d!100074 (= res!245215 (= (bvsub lt!433287 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7696 (buf!7759 (_2!13091 lt!433222))) (currentByte!14295 (_2!13091 lt!433222)) (currentBit!14290 (_2!13091 lt!433222)))))))

(assert (=> d!100074 (or (= (bvand lt!433287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433287 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433256 () (_ BitVec 64))

(assert (=> d!100074 (= lt!433287 (bvadd lt!433256 to!474))))

(assert (=> d!100074 (or (not (= (bvand lt!433256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!433256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!433256 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!100074 (= lt!433256 (bitIndex!0 (size!7696 (buf!7759 (_2!13090 lt!432963))) (currentByte!14295 (_2!13090 lt!432963)) (currentBit!14290 (_2!13090 lt!432963))))))

(declare-fun e!212583 () tuple3!1908)

(assert (=> d!100074 (= lt!433222 e!212583)))

(assert (=> d!100074 (= c!13571 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!100074 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!100074 (= (readBitsLoop!0 (_2!13090 lt!432963) nBits!523 lt!432971 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!433222)))

(declare-fun bm!5224 () Bool)

(declare-fun lt!433286 () (_ BitVec 32))

(declare-fun lt!433253 () (_ BitVec 32))

(declare-fun call!5227 () Bool)

(declare-fun lt!433269 () tuple2!23360)

(assert (=> bm!5224 (= call!5227 (arrayBitRangesEq!0 lt!432971 (ite c!13571 (array!17763 (store (arr!8767 lt!432971) lt!433253 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8767 lt!432971) lt!433253)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433286)))) ((_ sign_extend 24) (ite (_1!13090 lt!433269) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433286) #b00000000))))) (size!7696 lt!432971)) lt!432971) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13571 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7696 lt!432971)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!297040 () Bool)

(declare-fun res!245219 () Bool)

(assert (=> b!297040 (=> (not res!245219) (not e!212586))))

(assert (=> b!297040 (= res!245219 (arrayBitRangesEq!0 lt!432971 (_3!1410 lt!433222) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!297042 () Bool)

(declare-fun lt!433264 () Unit!20701)

(assert (=> b!297042 (= e!212583 (tuple3!1909 lt!433264 (_2!13091 lt!433239) (_3!1410 lt!433239)))))

(assert (=> b!297042 (= lt!433269 (readBit!0 (_2!13090 lt!432963)))))

(declare-fun lt!433281 () (_ BitVec 32))

(assert (=> b!297042 (= lt!433281 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433278 () (_ BitVec 32))

(assert (=> b!297042 (= lt!433278 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433250 () array!17762)

(assert (=> b!297042 (= lt!433250 (array!17763 (store (arr!8767 lt!432971) lt!433281 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8767 lt!432971) lt!433281)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433278)))) ((_ sign_extend 24) (ite (_1!13090 lt!433269) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433278) #b00000000))))) (size!7696 lt!432971)))))

(declare-fun lt!433270 () (_ BitVec 64))

(assert (=> b!297042 (= lt!433270 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!433226 () (_ BitVec 64))

(assert (=> b!297042 (= lt!433226 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!433237 () Unit!20701)

(assert (=> b!297042 (= lt!433237 (validateOffsetBitsIneqLemma!0 (_2!13090 lt!432963) (_2!13090 lt!433269) lt!433270 lt!433226))))

(assert (=> b!297042 (validate_offset_bits!1 ((_ sign_extend 32) (size!7696 (buf!7759 (_2!13090 lt!433269)))) ((_ sign_extend 32) (currentByte!14295 (_2!13090 lt!433269))) ((_ sign_extend 32) (currentBit!14290 (_2!13090 lt!433269))) (bvsub lt!433270 lt!433226))))

(declare-fun lt!433235 () Unit!20701)

(assert (=> b!297042 (= lt!433235 lt!433237)))

(assert (=> b!297042 (= lt!433239 (readBitsLoop!0 (_2!13090 lt!433269) nBits!523 lt!433250 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!245213 () Bool)

(assert (=> b!297042 (= res!245213 (= (bvsub (bvadd (bitIndex!0 (size!7696 (buf!7759 (_2!13090 lt!432963))) (currentByte!14295 (_2!13090 lt!432963)) (currentBit!14290 (_2!13090 lt!432963))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7696 (buf!7759 (_2!13091 lt!433239))) (currentByte!14295 (_2!13091 lt!433239)) (currentBit!14290 (_2!13091 lt!433239)))))))

(assert (=> b!297042 (=> (not res!245213) (not e!212580))))

(assert (=> b!297042 e!212580))

(declare-fun lt!433220 () Unit!20701)

(declare-fun Unit!20711 () Unit!20701)

(assert (=> b!297042 (= lt!433220 Unit!20711)))

(assert (=> b!297042 (= lt!433253 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297042 (= lt!433286 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433230 () Unit!20701)

(assert (=> b!297042 (= lt!433230 (arrayBitRangesUpdatedAtLemma!0 lt!432971 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!13090 lt!433269)))))

(assert (=> b!297042 call!5227))

(declare-fun lt!433273 () Unit!20701)

(assert (=> b!297042 (= lt!433273 lt!433230)))

(declare-fun lt!433272 () (_ BitVec 64))

(assert (=> b!297042 (= lt!433272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433276 () Unit!20701)

(assert (=> b!297042 (= lt!433276 (arrayBitRangesEqTransitive!0 lt!432971 lt!433250 (_3!1410 lt!433239) lt!433272 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!297042 (arrayBitRangesEq!0 lt!432971 (_3!1410 lt!433239) lt!433272 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!433234 () Unit!20701)

(assert (=> b!297042 (= lt!433234 lt!433276)))

(assert (=> b!297042 call!5225))

(declare-fun lt!433285 () Unit!20701)

(declare-fun Unit!20712 () Unit!20701)

(assert (=> b!297042 (= lt!433285 Unit!20712)))

(declare-fun lt!433218 () Unit!20701)

(assert (=> b!297042 (= lt!433218 (arrayBitRangesEqImpliesEq!0 lt!433250 (_3!1410 lt!433239) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!297042 (= (bitAt!0 lt!433250 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1410 lt!433239) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!433274 () Unit!20701)

(assert (=> b!297042 (= lt!433274 lt!433218)))

(declare-fun lt!433260 () Unit!20701)

(declare-fun Unit!20713 () Unit!20701)

(assert (=> b!297042 (= lt!433260 Unit!20713)))

(declare-fun lt!433247 () Bool)

(assert (=> b!297042 (= lt!433247 (= (bitAt!0 (_3!1410 lt!433239) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!13090 lt!433269)))))

(declare-fun Unit!20714 () Unit!20701)

(assert (=> b!297042 (= lt!433264 Unit!20714)))

(assert (=> b!297042 lt!433247))

(declare-fun b!297044 () Bool)

(declare-fun res!245211 () Bool)

(assert (=> b!297044 (=> (not res!245211) (not e!212586))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297044 (= res!245211 (invariant!0 (currentBit!14290 (_2!13091 lt!433222)) (currentByte!14295 (_2!13091 lt!433222)) (size!7696 (buf!7759 (_2!13091 lt!433222)))))))

(declare-fun b!297046 () Bool)

(declare-fun res!245222 () Bool)

(assert (=> b!297046 (=> (not res!245222) (not e!212586))))

(assert (=> b!297046 (= res!245222 e!212585)))

(declare-fun res!245214 () Bool)

(assert (=> b!297046 (=> res!245214 e!212585)))

(assert (=> b!297046 (= res!245214 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!297047 () Bool)

(assert (=> b!297047 (= e!212586 (= (byteArrayBitContentToList!0 (_2!13091 lt!433222) (_3!1410 lt!433222) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13091 lt!433222) (_2!13090 lt!432963) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!297047 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!297047 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433245 () Unit!20701)

(declare-fun b!297049 () Bool)

(assert (=> b!297049 (= e!212583 (tuple3!1909 lt!433245 (_2!13090 lt!432963) lt!432971))))

(declare-fun lt!433258 () Unit!20701)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17762) Unit!20701)

(assert (=> b!297049 (= lt!433258 (arrayBitRangesEqReflexiveLemma!0 lt!432971))))

(assert (=> b!297049 call!5227))

(declare-fun lt!433232 () Unit!20701)

(assert (=> b!297049 (= lt!433232 lt!433258)))

(assert (=> b!297049 (= lt!433284 lt!432971)))

(assert (=> b!297049 (= lt!433216 lt!432971)))

(declare-fun lt!433224 () (_ BitVec 64))

(assert (=> b!297049 (= lt!433224 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433267 () (_ BitVec 64))

(assert (=> b!297049 (= lt!433267 ((_ sign_extend 32) (size!7696 lt!432971)))))

(declare-fun lt!433266 () (_ BitVec 64))

(assert (=> b!297049 (= lt!433266 (bvmul lt!433267 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!297049 (= lt!433242 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!297049 (= lt!433254 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17762 array!17762 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20701)

(assert (=> b!297049 (= lt!433245 (arrayBitRangesEqSlicedLemma!0 lt!433284 lt!433216 lt!433224 lt!433266 lt!433242 lt!433254))))

(assert (=> b!297049 call!5225))

(assert (= (and d!100074 c!13571) b!297042))

(assert (= (and d!100074 (not c!13571)) b!297049))

(assert (= (and b!297042 res!245213) b!297038))

(assert (= (or b!297042 b!297049) bm!5222))

(assert (= (or b!297042 b!297049) bm!5224))

(assert (= (and d!100074 res!245215) b!297035))

(assert (= (and b!297035 res!245212) b!297040))

(assert (= (and b!297040 res!245219) b!297046))

(assert (= (and b!297046 (not res!245214)) b!297033))

(assert (= (and b!297046 res!245222) b!297044))

(assert (= (and b!297044 res!245211) b!297047))

(declare-fun m!435693 () Bool)

(assert (=> bm!5222 m!435693))

(declare-fun m!435695 () Bool)

(assert (=> bm!5224 m!435695))

(declare-fun m!435699 () Bool)

(assert (=> bm!5224 m!435699))

(declare-fun m!435709 () Bool)

(assert (=> bm!5224 m!435709))

(declare-fun m!435723 () Bool)

(assert (=> bm!5224 m!435723))

(declare-fun m!435725 () Bool)

(assert (=> b!297042 m!435725))

(declare-fun m!435731 () Bool)

(assert (=> b!297042 m!435731))

(declare-fun m!435735 () Bool)

(assert (=> b!297042 m!435735))

(declare-fun m!435739 () Bool)

(assert (=> b!297042 m!435739))

(declare-fun m!435743 () Bool)

(assert (=> b!297042 m!435743))

(declare-fun m!435749 () Bool)

(assert (=> b!297042 m!435749))

(declare-fun m!435751 () Bool)

(assert (=> b!297042 m!435751))

(declare-fun m!435755 () Bool)

(assert (=> b!297042 m!435755))

(declare-fun m!435759 () Bool)

(assert (=> b!297042 m!435759))

(declare-fun m!435767 () Bool)

(assert (=> b!297042 m!435767))

(declare-fun m!435771 () Bool)

(assert (=> b!297042 m!435771))

(declare-fun m!435773 () Bool)

(assert (=> b!297042 m!435773))

(declare-fun m!435777 () Bool)

(assert (=> b!297042 m!435777))

(declare-fun m!435781 () Bool)

(assert (=> b!297042 m!435781))

(declare-fun m!435783 () Bool)

(assert (=> b!297042 m!435783))

(declare-fun m!435785 () Bool)

(assert (=> b!297040 m!435785))

(declare-fun m!435789 () Bool)

(assert (=> b!297044 m!435789))

(declare-fun m!435791 () Bool)

(assert (=> b!297047 m!435791))

(declare-fun m!435793 () Bool)

(assert (=> b!297047 m!435793))

(declare-fun m!435795 () Bool)

(assert (=> b!297049 m!435795))

(declare-fun m!435797 () Bool)

(assert (=> b!297049 m!435797))

(declare-fun m!435799 () Bool)

(assert (=> b!297033 m!435799))

(declare-fun m!435801 () Bool)

(assert (=> b!297033 m!435801))

(declare-fun m!435803 () Bool)

(assert (=> d!100074 m!435803))

(assert (=> d!100074 m!435735))

(assert (=> b!296917 d!100074))

(declare-fun b!297089 () Bool)

(declare-fun e!212613 () Bool)

(declare-fun call!5236 () Bool)

(assert (=> b!297089 (= e!212613 call!5236)))

(declare-fun e!212616 () Bool)

(declare-fun b!297090 () Bool)

(declare-fun lt!433372 () (_ BitVec 32))

(declare-datatypes ((tuple4!914 0))(
  ( (tuple4!915 (_1!13101 (_ BitVec 32)) (_2!13101 (_ BitVec 32)) (_3!1414 (_ BitVec 32)) (_4!457 (_ BitVec 32))) )
))
(declare-fun lt!433374 () tuple4!914)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297090 (= e!212616 (byteRangesEq!0 (select (arr!8767 arr!273) (_4!457 lt!433374)) (select (arr!8767 (_3!1410 lt!432965)) (_4!457 lt!433374)) #b00000000000000000000000000000000 lt!433372))))

(declare-fun b!297091 () Bool)

(declare-fun e!212619 () Bool)

(assert (=> b!297091 (= e!212613 e!212619)))

(declare-fun res!245256 () Bool)

(assert (=> b!297091 (= res!245256 call!5236)))

(assert (=> b!297091 (=> (not res!245256) (not e!212619))))

(declare-fun b!297092 () Bool)

(declare-fun res!245252 () Bool)

(assert (=> b!297092 (= res!245252 (= lt!433372 #b00000000000000000000000000000000))))

(assert (=> b!297092 (=> res!245252 e!212616)))

(assert (=> b!297092 (= e!212619 e!212616)))

(declare-fun c!13578 () Bool)

(declare-fun lt!433373 () (_ BitVec 32))

(declare-fun bm!5233 () Bool)

(assert (=> bm!5233 (= call!5236 (byteRangesEq!0 (select (arr!8767 arr!273) (_3!1414 lt!433374)) (select (arr!8767 (_3!1410 lt!432965)) (_3!1414 lt!433374)) lt!433373 (ite c!13578 lt!433372 #b00000000000000000000000000001000)))))

(declare-fun b!297094 () Bool)

(declare-fun e!212615 () Bool)

(declare-fun arrayRangesEq!1515 (array!17762 array!17762 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297094 (= e!212615 (arrayRangesEq!1515 arr!273 (_3!1410 lt!432965) (_1!13101 lt!433374) (_2!13101 lt!433374)))))

(declare-fun b!297095 () Bool)

(declare-fun e!212618 () Bool)

(assert (=> b!297095 (= e!212618 e!212613)))

(assert (=> b!297095 (= c!13578 (= (_3!1414 lt!433374) (_4!457 lt!433374)))))

(declare-fun b!297093 () Bool)

(declare-fun e!212617 () Bool)

(assert (=> b!297093 (= e!212617 e!212618)))

(declare-fun res!245255 () Bool)

(assert (=> b!297093 (=> (not res!245255) (not e!212618))))

(assert (=> b!297093 (= res!245255 e!212615)))

(declare-fun res!245254 () Bool)

(assert (=> b!297093 (=> res!245254 e!212615)))

(assert (=> b!297093 (= res!245254 (bvsge (_1!13101 lt!433374) (_2!13101 lt!433374)))))

(assert (=> b!297093 (= lt!433372 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297093 (= lt!433373 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!914)

(assert (=> b!297093 (= lt!433374 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!100078 () Bool)

(declare-fun res!245253 () Bool)

(assert (=> d!100078 (=> res!245253 e!212617)))

(assert (=> d!100078 (= res!245253 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100078 (= (arrayBitRangesEq!0 arr!273 (_3!1410 lt!432965) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212617)))

(assert (= (and d!100078 (not res!245253)) b!297093))

(assert (= (and b!297093 (not res!245254)) b!297094))

(assert (= (and b!297093 res!245255) b!297095))

(assert (= (and b!297095 c!13578) b!297089))

(assert (= (and b!297095 (not c!13578)) b!297091))

(assert (= (and b!297091 res!245256) b!297092))

(assert (= (and b!297092 (not res!245252)) b!297090))

(assert (= (or b!297089 b!297091) bm!5233))

(declare-fun m!435829 () Bool)

(assert (=> b!297090 m!435829))

(declare-fun m!435831 () Bool)

(assert (=> b!297090 m!435831))

(assert (=> b!297090 m!435829))

(assert (=> b!297090 m!435831))

(declare-fun m!435833 () Bool)

(assert (=> b!297090 m!435833))

(declare-fun m!435835 () Bool)

(assert (=> bm!5233 m!435835))

(declare-fun m!435837 () Bool)

(assert (=> bm!5233 m!435837))

(assert (=> bm!5233 m!435835))

(assert (=> bm!5233 m!435837))

(declare-fun m!435839 () Bool)

(assert (=> bm!5233 m!435839))

(declare-fun m!435841 () Bool)

(assert (=> b!297094 m!435841))

(declare-fun m!435843 () Bool)

(assert (=> b!297093 m!435843))

(assert (=> b!296917 d!100078))

(declare-fun d!100090 () Bool)

(declare-fun e!212632 () Bool)

(assert (=> d!100090 e!212632))

(declare-fun res!245271 () Bool)

(assert (=> d!100090 (=> (not res!245271) (not e!212632))))

(declare-fun lt!433448 () (_ BitVec 64))

(declare-fun lt!433445 () (_ BitVec 64))

(declare-fun lt!433446 () (_ BitVec 64))

(assert (=> d!100090 (= res!245271 (= lt!433446 (bvsub lt!433448 lt!433445)))))

(assert (=> d!100090 (or (= (bvand lt!433448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433445 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433448 lt!433445) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100090 (= lt!433445 (remainingBits!0 ((_ sign_extend 32) (size!7696 (buf!7759 (_2!13091 lt!432965)))) ((_ sign_extend 32) (currentByte!14295 (_2!13091 lt!432965))) ((_ sign_extend 32) (currentBit!14290 (_2!13091 lt!432965)))))))

(declare-fun lt!433449 () (_ BitVec 64))

(declare-fun lt!433447 () (_ BitVec 64))

(assert (=> d!100090 (= lt!433448 (bvmul lt!433449 lt!433447))))

(assert (=> d!100090 (or (= lt!433449 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433447 (bvsdiv (bvmul lt!433449 lt!433447) lt!433449)))))

(assert (=> d!100090 (= lt!433447 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100090 (= lt!433449 ((_ sign_extend 32) (size!7696 (buf!7759 (_2!13091 lt!432965)))))))

(assert (=> d!100090 (= lt!433446 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14295 (_2!13091 lt!432965))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14290 (_2!13091 lt!432965)))))))

(assert (=> d!100090 (invariant!0 (currentBit!14290 (_2!13091 lt!432965)) (currentByte!14295 (_2!13091 lt!432965)) (size!7696 (buf!7759 (_2!13091 lt!432965))))))

(assert (=> d!100090 (= (bitIndex!0 (size!7696 (buf!7759 (_2!13091 lt!432965))) (currentByte!14295 (_2!13091 lt!432965)) (currentBit!14290 (_2!13091 lt!432965))) lt!433446)))

(declare-fun b!297112 () Bool)

(declare-fun res!245272 () Bool)

(assert (=> b!297112 (=> (not res!245272) (not e!212632))))

(assert (=> b!297112 (= res!245272 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433446))))

(declare-fun b!297113 () Bool)

(declare-fun lt!433444 () (_ BitVec 64))

(assert (=> b!297113 (= e!212632 (bvsle lt!433446 (bvmul lt!433444 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297113 (or (= lt!433444 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433444 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433444)))))

(assert (=> b!297113 (= lt!433444 ((_ sign_extend 32) (size!7696 (buf!7759 (_2!13091 lt!432965)))))))

(assert (= (and d!100090 res!245271) b!297112))

(assert (= (and b!297112 res!245272) b!297113))

(declare-fun m!435907 () Bool)

(assert (=> d!100090 m!435907))

(declare-fun m!435909 () Bool)

(assert (=> d!100090 m!435909))

(assert (=> b!296917 d!100090))

(declare-fun d!100094 () Bool)

(declare-fun c!13582 () Bool)

(assert (=> d!100094 (= c!13582 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!212635 () List!996)

(assert (=> d!100094 (= (byteArrayBitContentToList!0 (_2!13091 lt!432965) (_3!1410 lt!432965) from!505 (bvsub to!474 from!505)) e!212635)))

(declare-fun b!297118 () Bool)

(assert (=> b!297118 (= e!212635 Nil!993)))

(declare-fun b!297119 () Bool)

(assert (=> b!297119 (= e!212635 (Cons!992 (not (= (bvand ((_ sign_extend 24) (select (arr!8767 (_3!1410 lt!432965)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!13091 lt!432965) (_3!1410 lt!432965) (bvadd from!505 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!100094 c!13582) b!297118))

(assert (= (and d!100094 (not c!13582)) b!297119))

(assert (=> b!297119 m!435687))

(assert (=> b!297119 m!435675))

(declare-fun m!435917 () Bool)

(assert (=> b!297119 m!435917))

(assert (=> b!296917 d!100094))

(declare-fun d!100098 () Bool)

(declare-fun e!212647 () Bool)

(assert (=> d!100098 e!212647))

(declare-fun res!245287 () Bool)

(assert (=> d!100098 (=> (not res!245287) (not e!212647))))

(declare-fun lt!433496 () (_ BitVec 32))

(assert (=> d!100098 (= res!245287 (and (bvsge lt!433496 #b00000000000000000000000000000000) (bvslt lt!433496 (size!7696 arr!273))))))

(declare-fun lt!433494 () (_ BitVec 32))

(declare-fun lt!433497 () (_ BitVec 8))

(declare-fun lt!433495 () Unit!20701)

(declare-fun choose!53 (array!17762 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20701)

(assert (=> d!100098 (= lt!433495 (choose!53 arr!273 from!505 (_1!13090 lt!432963) lt!433496 lt!433494 lt!433497))))

(assert (=> d!100098 (= lt!433497 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8767 arr!273) lt!433496)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433494)))) ((_ sign_extend 24) (ite (_1!13090 lt!432963) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433494) #b00000000)))))))

(assert (=> d!100098 (= lt!433494 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!100098 (= lt!433496 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!100098 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13090 lt!432963)) lt!433495)))

(declare-fun b!297141 () Bool)

(assert (=> b!297141 (= e!212647 (arrayBitRangesEq!0 arr!273 (array!17763 (store (arr!8767 arr!273) lt!433496 lt!433497) (size!7696 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!100098 res!245287) b!297141))

(declare-fun m!435933 () Bool)

(assert (=> d!100098 m!435933))

(declare-fun m!435935 () Bool)

(assert (=> d!100098 m!435935))

(declare-fun m!435937 () Bool)

(assert (=> d!100098 m!435937))

(declare-fun m!435939 () Bool)

(assert (=> b!297141 m!435939))

(declare-fun m!435941 () Bool)

(assert (=> b!297141 m!435941))

(assert (=> b!296917 d!100098))

(declare-fun d!100106 () Bool)

(assert (=> d!100106 (= (bitAt!0 lt!432971 from!505) (bitAt!0 (_3!1410 lt!432965) from!505))))

(declare-fun lt!433500 () Unit!20701)

(declare-fun choose!31 (array!17762 array!17762 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20701)

(assert (=> d!100106 (= lt!433500 (choose!31 lt!432971 (_3!1410 lt!432965) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100106 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100106 (= (arrayBitRangesEqImpliesEq!0 lt!432971 (_3!1410 lt!432965) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!433500)))

(declare-fun bs!25599 () Bool)

(assert (= bs!25599 d!100106))

(assert (=> bs!25599 m!435517))

(assert (=> bs!25599 m!435533))

(declare-fun m!435945 () Bool)

(assert (=> bs!25599 m!435945))

(assert (=> b!296917 d!100106))

(declare-fun d!100110 () Bool)

(declare-fun e!212652 () Bool)

(assert (=> d!100110 e!212652))

(declare-fun res!245290 () Bool)

(assert (=> d!100110 (=> (not res!245290) (not e!212652))))

(declare-fun lt!433511 () (_ BitVec 64))

(declare-fun lt!433508 () (_ BitVec 64))

(declare-fun lt!433509 () (_ BitVec 64))

(assert (=> d!100110 (= res!245290 (= lt!433509 (bvsub lt!433511 lt!433508)))))

(assert (=> d!100110 (or (= (bvand lt!433511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433508 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433511 lt!433508) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!100110 (= lt!433508 (remainingBits!0 ((_ sign_extend 32) (size!7696 (buf!7759 thiss!1728))) ((_ sign_extend 32) (currentByte!14295 thiss!1728)) ((_ sign_extend 32) (currentBit!14290 thiss!1728))))))

(declare-fun lt!433512 () (_ BitVec 64))

(declare-fun lt!433510 () (_ BitVec 64))

(assert (=> d!100110 (= lt!433511 (bvmul lt!433512 lt!433510))))

(assert (=> d!100110 (or (= lt!433512 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433510 (bvsdiv (bvmul lt!433512 lt!433510) lt!433512)))))

(assert (=> d!100110 (= lt!433510 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100110 (= lt!433512 ((_ sign_extend 32) (size!7696 (buf!7759 thiss!1728))))))

(assert (=> d!100110 (= lt!433509 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14295 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14290 thiss!1728))))))

(assert (=> d!100110 (invariant!0 (currentBit!14290 thiss!1728) (currentByte!14295 thiss!1728) (size!7696 (buf!7759 thiss!1728)))))

(assert (=> d!100110 (= (bitIndex!0 (size!7696 (buf!7759 thiss!1728)) (currentByte!14295 thiss!1728) (currentBit!14290 thiss!1728)) lt!433509)))

(declare-fun b!297150 () Bool)

(declare-fun res!245291 () Bool)

(assert (=> b!297150 (=> (not res!245291) (not e!212652))))

(assert (=> b!297150 (= res!245291 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433509))))

(declare-fun b!297151 () Bool)

(declare-fun lt!433507 () (_ BitVec 64))

(assert (=> b!297151 (= e!212652 (bvsle lt!433509 (bvmul lt!433507 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297151 (or (= lt!433507 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433507 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433507)))))

(assert (=> b!297151 (= lt!433507 ((_ sign_extend 32) (size!7696 (buf!7759 thiss!1728))))))

(assert (= (and d!100110 res!245290) b!297150))

(assert (= (and b!297150 res!245291) b!297151))

(declare-fun m!435949 () Bool)

(assert (=> d!100110 m!435949))

(declare-fun m!435951 () Bool)

(assert (=> d!100110 m!435951))

(assert (=> b!296917 d!100110))

(declare-fun b!297152 () Bool)

(declare-fun e!212653 () Bool)

(declare-fun call!5239 () Bool)

(assert (=> b!297152 (= e!212653 call!5239)))

(declare-fun lt!433513 () (_ BitVec 32))

(declare-fun lt!433515 () tuple4!914)

(declare-fun b!297153 () Bool)

(declare-fun e!212655 () Bool)

(assert (=> b!297153 (= e!212655 (byteRangesEq!0 (select (arr!8767 arr!273) (_4!457 lt!433515)) (select (arr!8767 lt!432971) (_4!457 lt!433515)) #b00000000000000000000000000000000 lt!433513))))

(declare-fun b!297154 () Bool)

(declare-fun e!212658 () Bool)

(assert (=> b!297154 (= e!212653 e!212658)))

(declare-fun res!245296 () Bool)

(assert (=> b!297154 (= res!245296 call!5239)))

(assert (=> b!297154 (=> (not res!245296) (not e!212658))))

(declare-fun b!297155 () Bool)

(declare-fun res!245292 () Bool)

(assert (=> b!297155 (= res!245292 (= lt!433513 #b00000000000000000000000000000000))))

(assert (=> b!297155 (=> res!245292 e!212655)))

(assert (=> b!297155 (= e!212658 e!212655)))

(declare-fun c!13589 () Bool)

(declare-fun bm!5236 () Bool)

(declare-fun lt!433514 () (_ BitVec 32))

(assert (=> bm!5236 (= call!5239 (byteRangesEq!0 (select (arr!8767 arr!273) (_3!1414 lt!433515)) (select (arr!8767 lt!432971) (_3!1414 lt!433515)) lt!433514 (ite c!13589 lt!433513 #b00000000000000000000000000001000)))))

(declare-fun b!297157 () Bool)

(declare-fun e!212654 () Bool)

(assert (=> b!297157 (= e!212654 (arrayRangesEq!1515 arr!273 lt!432971 (_1!13101 lt!433515) (_2!13101 lt!433515)))))

(declare-fun b!297158 () Bool)

(declare-fun e!212657 () Bool)

(assert (=> b!297158 (= e!212657 e!212653)))

(assert (=> b!297158 (= c!13589 (= (_3!1414 lt!433515) (_4!457 lt!433515)))))

(declare-fun b!297156 () Bool)

(declare-fun e!212656 () Bool)

(assert (=> b!297156 (= e!212656 e!212657)))

(declare-fun res!245295 () Bool)

(assert (=> b!297156 (=> (not res!245295) (not e!212657))))

(assert (=> b!297156 (= res!245295 e!212654)))

(declare-fun res!245294 () Bool)

(assert (=> b!297156 (=> res!245294 e!212654)))

(assert (=> b!297156 (= res!245294 (bvsge (_1!13101 lt!433515) (_2!13101 lt!433515)))))

(assert (=> b!297156 (= lt!433513 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297156 (= lt!433514 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297156 (= lt!433515 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!100114 () Bool)

(declare-fun res!245293 () Bool)

(assert (=> d!100114 (=> res!245293 e!212656)))

(assert (=> d!100114 (= res!245293 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100114 (= (arrayBitRangesEq!0 arr!273 lt!432971 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212656)))

(assert (= (and d!100114 (not res!245293)) b!297156))

(assert (= (and b!297156 (not res!245294)) b!297157))

(assert (= (and b!297156 res!245295) b!297158))

(assert (= (and b!297158 c!13589) b!297152))

(assert (= (and b!297158 (not c!13589)) b!297154))

(assert (= (and b!297154 res!245296) b!297155))

(assert (= (and b!297155 (not res!245292)) b!297153))

(assert (= (or b!297152 b!297154) bm!5236))

(declare-fun m!435953 () Bool)

(assert (=> b!297153 m!435953))

(declare-fun m!435955 () Bool)

(assert (=> b!297153 m!435955))

(assert (=> b!297153 m!435953))

(assert (=> b!297153 m!435955))

(declare-fun m!435957 () Bool)

(assert (=> b!297153 m!435957))

(declare-fun m!435959 () Bool)

(assert (=> bm!5236 m!435959))

(declare-fun m!435961 () Bool)

(assert (=> bm!5236 m!435961))

(assert (=> bm!5236 m!435959))

(assert (=> bm!5236 m!435961))

(declare-fun m!435963 () Bool)

(assert (=> bm!5236 m!435963))

(declare-fun m!435965 () Bool)

(assert (=> b!297157 m!435965))

(assert (=> b!297156 m!435843))

(assert (=> b!296917 d!100114))

(declare-fun d!100116 () Bool)

(assert (=> d!100116 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7696 (buf!7759 (_2!13090 lt!432963)))) ((_ sign_extend 32) (currentByte!14295 (_2!13090 lt!432963))) ((_ sign_extend 32) (currentBit!14290 (_2!13090 lt!432963))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7696 (buf!7759 (_2!13090 lt!432963)))) ((_ sign_extend 32) (currentByte!14295 (_2!13090 lt!432963))) ((_ sign_extend 32) (currentBit!14290 (_2!13090 lt!432963)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25600 () Bool)

(assert (= bs!25600 d!100116))

(declare-fun m!435967 () Bool)

(assert (=> bs!25600 m!435967))

(assert (=> b!296917 d!100116))

(declare-fun b!297194 () Bool)

(declare-fun e!212684 () Bool)

(declare-fun lt!433536 () List!996)

(declare-fun length!494 (List!996) Int)

(assert (=> b!297194 (= e!212684 (> (length!494 lt!433536) 0))))

(declare-fun b!297191 () Bool)

(declare-datatypes ((tuple2!23376 0))(
  ( (tuple2!23377 (_1!13103 List!996) (_2!13103 BitStream!13396)) )
))
(declare-fun e!212685 () tuple2!23376)

(assert (=> b!297191 (= e!212685 (tuple2!23377 Nil!993 thiss!1728))))

(declare-fun lt!433535 () (_ BitVec 64))

(declare-fun b!297192 () Bool)

(declare-fun lt!433534 () tuple2!23360)

(assert (=> b!297192 (= e!212685 (tuple2!23377 (Cons!992 (_1!13090 lt!433534) (bitStreamReadBitsIntoList!0 (_2!13091 lt!432965) (_2!13090 lt!433534) (bvsub (bvsub to!474 from!505) lt!433535))) (_2!13090 lt!433534)))))

(assert (=> b!297192 (= lt!433534 (readBit!0 thiss!1728))))

(assert (=> b!297192 (= lt!433535 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!100118 () Bool)

(assert (=> d!100118 e!212684))

(declare-fun c!13598 () Bool)

(assert (=> d!100118 (= c!13598 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!100118 (= lt!433536 (_1!13103 e!212685))))

(declare-fun c!13597 () Bool)

(assert (=> d!100118 (= c!13597 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!100118 (bvsge (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!100118 (= (bitStreamReadBitsIntoList!0 (_2!13091 lt!432965) thiss!1728 (bvsub to!474 from!505)) lt!433536)))

(declare-fun b!297193 () Bool)

(declare-fun isEmpty!269 (List!996) Bool)

(assert (=> b!297193 (= e!212684 (isEmpty!269 lt!433536))))

(assert (= (and d!100118 c!13597) b!297191))

(assert (= (and d!100118 (not c!13597)) b!297192))

(assert (= (and d!100118 c!13598) b!297193))

(assert (= (and d!100118 (not c!13598)) b!297194))

(declare-fun m!435987 () Bool)

(assert (=> b!297194 m!435987))

(declare-fun m!435989 () Bool)

(assert (=> b!297192 m!435989))

(assert (=> b!297192 m!435535))

(declare-fun m!435991 () Bool)

(assert (=> b!297193 m!435991))

(assert (=> b!296917 d!100118))

(declare-fun d!100126 () Bool)

(declare-fun e!212702 () Bool)

(assert (=> d!100126 e!212702))

(declare-fun res!245322 () Bool)

(assert (=> d!100126 (=> (not res!245322) (not e!212702))))

(declare-datatypes ((tuple2!23378 0))(
  ( (tuple2!23379 (_1!13104 Unit!20701) (_2!13104 BitStream!13396)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13396) tuple2!23378)

(assert (=> d!100126 (= res!245322 (= (buf!7759 (_2!13104 (increaseBitIndex!0 thiss!1728))) (buf!7759 thiss!1728)))))

(declare-fun lt!433586 () Bool)

(assert (=> d!100126 (= lt!433586 (not (= (bvand ((_ sign_extend 24) (select (arr!8767 (buf!7759 thiss!1728)) (currentByte!14295 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14290 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!433583 () tuple2!23360)

(assert (=> d!100126 (= lt!433583 (tuple2!23361 (not (= (bvand ((_ sign_extend 24) (select (arr!8767 (buf!7759 thiss!1728)) (currentByte!14295 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14290 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13104 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!100126 (validate_offset_bit!0 ((_ sign_extend 32) (size!7696 (buf!7759 thiss!1728))) ((_ sign_extend 32) (currentByte!14295 thiss!1728)) ((_ sign_extend 32) (currentBit!14290 thiss!1728)))))

(assert (=> d!100126 (= (readBit!0 thiss!1728) lt!433583)))

(declare-fun lt!433584 () (_ BitVec 64))

(declare-fun lt!433585 () (_ BitVec 64))

(declare-fun b!297215 () Bool)

(assert (=> b!297215 (= e!212702 (= (bitIndex!0 (size!7696 (buf!7759 (_2!13104 (increaseBitIndex!0 thiss!1728)))) (currentByte!14295 (_2!13104 (increaseBitIndex!0 thiss!1728))) (currentBit!14290 (_2!13104 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!433585 lt!433584)))))

(assert (=> b!297215 (or (not (= (bvand lt!433585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433584 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!433585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!433585 lt!433584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!297215 (= lt!433584 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!297215 (= lt!433585 (bitIndex!0 (size!7696 (buf!7759 thiss!1728)) (currentByte!14295 thiss!1728) (currentBit!14290 thiss!1728)))))

(declare-fun lt!433587 () Bool)

(assert (=> b!297215 (= lt!433587 (not (= (bvand ((_ sign_extend 24) (select (arr!8767 (buf!7759 thiss!1728)) (currentByte!14295 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14290 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!433581 () Bool)

(assert (=> b!297215 (= lt!433581 (not (= (bvand ((_ sign_extend 24) (select (arr!8767 (buf!7759 thiss!1728)) (currentByte!14295 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14290 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!433582 () Bool)

(assert (=> b!297215 (= lt!433582 (not (= (bvand ((_ sign_extend 24) (select (arr!8767 (buf!7759 thiss!1728)) (currentByte!14295 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14290 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!100126 res!245322) b!297215))

(declare-fun m!436015 () Bool)

(assert (=> d!100126 m!436015))

(declare-fun m!436017 () Bool)

(assert (=> d!100126 m!436017))

(declare-fun m!436019 () Bool)

(assert (=> d!100126 m!436019))

(declare-fun m!436021 () Bool)

(assert (=> d!100126 m!436021))

(assert (=> b!297215 m!436015))

(assert (=> b!297215 m!436019))

(declare-fun m!436023 () Bool)

(assert (=> b!297215 m!436023))

(assert (=> b!297215 m!435523))

(assert (=> b!297215 m!436017))

(assert (=> b!296917 d!100126))

(declare-fun d!100136 () Bool)

(assert (=> d!100136 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14290 thiss!1728) (currentByte!14295 thiss!1728) (size!7696 (buf!7759 thiss!1728))))))

(declare-fun bs!25604 () Bool)

(assert (= bs!25604 d!100136))

(assert (=> bs!25604 m!435951))

(assert (=> start!66244 d!100136))

(declare-fun d!100140 () Bool)

(assert (=> d!100140 (= (array_inv!7308 arr!273) (bvsge (size!7696 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66244 d!100140))

(declare-fun d!100142 () Bool)

(assert (=> d!100142 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7696 (buf!7759 thiss!1728))) ((_ sign_extend 32) (currentByte!14295 thiss!1728)) ((_ sign_extend 32) (currentBit!14290 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7696 (buf!7759 thiss!1728))) ((_ sign_extend 32) (currentByte!14295 thiss!1728)) ((_ sign_extend 32) (currentBit!14290 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25605 () Bool)

(assert (= bs!25605 d!100142))

(assert (=> bs!25605 m!435949))

(assert (=> b!296916 d!100142))

(declare-fun d!100146 () Bool)

(assert (=> d!100146 (= (array_inv!7308 (buf!7759 thiss!1728)) (bvsge (size!7696 (buf!7759 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!296914 d!100146))

(push 1)

(assert (not d!100090))

(assert (not d!100110))

(assert (not b!297153))

(assert (not d!100142))

(assert (not bm!5224))

(assert (not b!297215))

(assert (not b!297049))

(assert (not d!100136))

(assert (not bm!5222))

(assert (not d!100074))

(assert (not d!100060))

(assert (not d!100116))

(assert (not b!297047))

(assert (not d!100106))

(assert (not b!297040))

(assert (not b!297192))

(assert (not d!100126))

(assert (not b!297193))

(assert (not b!297094))

(assert (not b!297141))

(assert (not b!297042))

(assert (not d!100068))

(assert (not b!297119))

(assert (not bm!5233))

(assert (not b!297090))

(assert (not b!297157))

(assert (not b!296991))

(assert (not b!297194))

(assert (not bm!5236))

(assert (not b!297156))

(assert (not b!297093))

(assert (not b!297033))

(assert (not d!100098))

(assert (not b!297044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

