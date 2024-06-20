; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65894 () Bool)

(assert start!65894)

(declare-fun b!295552 () Bool)

(declare-fun e!211387 () Bool)

(declare-fun lt!429942 () Bool)

(declare-datatypes ((array!17700 0))(
  ( (array!17701 (arr!8718 (Array (_ BitVec 32) (_ BitVec 8))) (size!7671 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13346 0))(
  ( (BitStream!13347 (buf!7734 array!17700) (currentByte!14243 (_ BitVec 32)) (currentBit!14238 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23252 0))(
  ( (tuple2!23253 (_1!12999 Bool) (_2!12999 BitStream!13346)) )
))
(declare-fun lt!429946 () tuple2!23252)

(assert (=> b!295552 (= e!211387 (= lt!429942 (_1!12999 lt!429946)))))

(declare-fun res!244019 () Bool)

(declare-fun e!211391 () Bool)

(assert (=> start!65894 (=> (not res!244019) (not e!211391))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17700)

(assert (=> start!65894 (= res!244019 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7671 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65894 e!211391))

(declare-fun thiss!1728 () BitStream!13346)

(declare-fun e!211388 () Bool)

(declare-fun inv!12 (BitStream!13346) Bool)

(assert (=> start!65894 (and (inv!12 thiss!1728) e!211388)))

(assert (=> start!65894 true))

(declare-fun array_inv!7283 (array!17700) Bool)

(assert (=> start!65894 (array_inv!7283 arr!273)))

(declare-fun lt!429953 () (_ BitVec 64))

(declare-fun b!295553 () Bool)

(declare-fun lt!429945 () (_ BitVec 64))

(assert (=> b!295553 (= e!211391 (not (or (not (= lt!429953 (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!429953 (bvand lt!429945 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!429952 () (_ BitVec 64))

(assert (=> b!295553 (= lt!429953 (bvand lt!429952 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295553 e!211387))

(declare-fun res!244021 () Bool)

(assert (=> b!295553 (=> (not res!244021) (not e!211387))))

(declare-fun lt!429954 () array!17700)

(declare-fun bitAt!0 (array!17700 (_ BitVec 64)) Bool)

(assert (=> b!295553 (= res!244021 (= (bitAt!0 lt!429954 from!505) lt!429942))))

(declare-datatypes ((Unit!20603 0))(
  ( (Unit!20604) )
))
(declare-datatypes ((tuple3!1858 0))(
  ( (tuple3!1859 (_1!13000 Unit!20603) (_2!13000 BitStream!13346) (_3!1373 array!17700)) )
))
(declare-fun lt!429947 () tuple3!1858)

(assert (=> b!295553 (= lt!429942 (bitAt!0 (_3!1373 lt!429947) from!505))))

(declare-fun lt!429943 () Unit!20603)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17700 array!17700 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20603)

(assert (=> b!295553 (= lt!429943 (arrayBitRangesEqImpliesEq!0 lt!429954 (_3!1373 lt!429947) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17700 array!17700 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295553 (arrayBitRangesEq!0 arr!273 (_3!1373 lt!429947) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429951 () Unit!20603)

(declare-fun arrayBitRangesEqTransitive!0 (array!17700 array!17700 array!17700 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20603)

(assert (=> b!295553 (= lt!429951 (arrayBitRangesEqTransitive!0 arr!273 lt!429954 (_3!1373 lt!429947) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295553 (arrayBitRangesEq!0 arr!273 lt!429954 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429948 () Unit!20603)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17700 (_ BitVec 64) Bool) Unit!20603)

(assert (=> b!295553 (= lt!429948 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12999 lt!429946)))))

(declare-fun e!211392 () Bool)

(assert (=> b!295553 e!211392))

(declare-fun res!244020 () Bool)

(assert (=> b!295553 (=> (not res!244020) (not e!211392))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295553 (= res!244020 (= (bvsub lt!429945 from!505) (bitIndex!0 (size!7671 (buf!7734 (_2!13000 lt!429947))) (currentByte!14243 (_2!13000 lt!429947)) (currentBit!14238 (_2!13000 lt!429947)))))))

(assert (=> b!295553 (= lt!429945 (bvadd lt!429952 to!474))))

(assert (=> b!295553 (= lt!429952 (bitIndex!0 (size!7671 (buf!7734 thiss!1728)) (currentByte!14243 thiss!1728) (currentBit!14238 thiss!1728)))))

(declare-fun readBitsLoop!0 (BitStream!13346 (_ BitVec 64) array!17700 (_ BitVec 64) (_ BitVec 64)) tuple3!1858)

(assert (=> b!295553 (= lt!429947 (readBitsLoop!0 (_2!12999 lt!429946) nBits!523 lt!429954 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295553 (validate_offset_bits!1 ((_ sign_extend 32) (size!7671 (buf!7734 (_2!12999 lt!429946)))) ((_ sign_extend 32) (currentByte!14243 (_2!12999 lt!429946))) ((_ sign_extend 32) (currentBit!14238 (_2!12999 lt!429946))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429944 () Unit!20603)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13346 BitStream!13346 (_ BitVec 64) (_ BitVec 64)) Unit!20603)

(assert (=> b!295553 (= lt!429944 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12999 lt!429946) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429949 () (_ BitVec 32))

(declare-fun lt!429950 () (_ BitVec 32))

(assert (=> b!295553 (= lt!429954 (array!17701 (store (arr!8718 arr!273) lt!429950 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8718 arr!273) lt!429950)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429949)))) ((_ sign_extend 24) (ite (_1!12999 lt!429946) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429949) #b00000000))))) (size!7671 arr!273)))))

(assert (=> b!295553 (= lt!429949 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295553 (= lt!429950 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13346) tuple2!23252)

(assert (=> b!295553 (= lt!429946 (readBit!0 thiss!1728))))

(declare-fun b!295554 () Bool)

(declare-fun res!244018 () Bool)

(assert (=> b!295554 (=> (not res!244018) (not e!211391))))

(assert (=> b!295554 (= res!244018 (validate_offset_bits!1 ((_ sign_extend 32) (size!7671 (buf!7734 thiss!1728))) ((_ sign_extend 32) (currentByte!14243 thiss!1728)) ((_ sign_extend 32) (currentBit!14238 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!295555 () Bool)

(assert (=> b!295555 (= e!211392 (and (= (buf!7734 thiss!1728) (buf!7734 (_2!13000 lt!429947))) (= (size!7671 arr!273) (size!7671 (_3!1373 lt!429947)))))))

(declare-fun b!295556 () Bool)

(assert (=> b!295556 (= e!211388 (array_inv!7283 (buf!7734 thiss!1728)))))

(declare-fun b!295557 () Bool)

(declare-fun res!244022 () Bool)

(assert (=> b!295557 (=> (not res!244022) (not e!211391))))

(assert (=> b!295557 (= res!244022 (bvslt from!505 to!474))))

(assert (= (and start!65894 res!244019) b!295554))

(assert (= (and b!295554 res!244018) b!295557))

(assert (= (and b!295557 res!244022) b!295553))

(assert (= (and b!295553 res!244020) b!295555))

(assert (= (and b!295553 res!244021) b!295552))

(assert (= start!65894 b!295556))

(declare-fun m!432921 () Bool)

(assert (=> start!65894 m!432921))

(declare-fun m!432923 () Bool)

(assert (=> start!65894 m!432923))

(declare-fun m!432925 () Bool)

(assert (=> b!295553 m!432925))

(declare-fun m!432927 () Bool)

(assert (=> b!295553 m!432927))

(declare-fun m!432929 () Bool)

(assert (=> b!295553 m!432929))

(declare-fun m!432931 () Bool)

(assert (=> b!295553 m!432931))

(declare-fun m!432933 () Bool)

(assert (=> b!295553 m!432933))

(declare-fun m!432935 () Bool)

(assert (=> b!295553 m!432935))

(declare-fun m!432937 () Bool)

(assert (=> b!295553 m!432937))

(declare-fun m!432939 () Bool)

(assert (=> b!295553 m!432939))

(declare-fun m!432941 () Bool)

(assert (=> b!295553 m!432941))

(declare-fun m!432943 () Bool)

(assert (=> b!295553 m!432943))

(declare-fun m!432945 () Bool)

(assert (=> b!295553 m!432945))

(declare-fun m!432947 () Bool)

(assert (=> b!295553 m!432947))

(declare-fun m!432949 () Bool)

(assert (=> b!295553 m!432949))

(declare-fun m!432951 () Bool)

(assert (=> b!295553 m!432951))

(declare-fun m!432953 () Bool)

(assert (=> b!295553 m!432953))

(declare-fun m!432955 () Bool)

(assert (=> b!295553 m!432955))

(declare-fun m!432957 () Bool)

(assert (=> b!295554 m!432957))

(declare-fun m!432959 () Bool)

(assert (=> b!295556 m!432959))

(push 1)

(assert (not start!65894))

(assert (not b!295553))

(assert (not b!295554))

(assert (not b!295556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99652 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99652 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14238 thiss!1728) (currentByte!14243 thiss!1728) (size!7671 (buf!7734 thiss!1728))))))

(declare-fun bs!25484 () Bool)

(assert (= bs!25484 d!99652))

(declare-fun m!433061 () Bool)

(assert (=> bs!25484 m!433061))

(assert (=> start!65894 d!99652))

(declare-fun d!99654 () Bool)

(assert (=> d!99654 (= (array_inv!7283 arr!273) (bvsge (size!7671 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65894 d!99654))

(declare-fun d!99656 () Bool)

(assert (=> d!99656 (= (bitAt!0 lt!429954 from!505) (bitAt!0 (_3!1373 lt!429947) from!505))))

(declare-fun lt!430047 () Unit!20603)

(declare-fun choose!31 (array!17700 array!17700 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20603)

(assert (=> d!99656 (= lt!430047 (choose!31 lt!429954 (_3!1373 lt!429947) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99656 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99656 (= (arrayBitRangesEqImpliesEq!0 lt!429954 (_3!1373 lt!429947) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430047)))

(declare-fun bs!25485 () Bool)

(assert (= bs!25485 d!99656))

(assert (=> bs!25485 m!432955))

(assert (=> bs!25485 m!432941))

(declare-fun m!433063 () Bool)

(assert (=> bs!25485 m!433063))

(assert (=> b!295553 d!99656))

(declare-fun d!99658 () Bool)

(assert (=> d!99658 (= (bitAt!0 (_3!1373 lt!429947) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8718 (_3!1373 lt!429947)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25486 () Bool)

(assert (= bs!25486 d!99658))

(declare-fun m!433065 () Bool)

(assert (=> bs!25486 m!433065))

(declare-fun m!433067 () Bool)

(assert (=> bs!25486 m!433067))

(assert (=> b!295553 d!99658))

(declare-fun d!99660 () Bool)

(declare-fun e!211456 () Bool)

(assert (=> d!99660 e!211456))

(declare-fun res!244078 () Bool)

(assert (=> d!99660 (=> (not res!244078) (not e!211456))))

(assert (=> d!99660 (= res!244078 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!430050 () Unit!20603)

(declare-fun choose!27 (BitStream!13346 BitStream!13346 (_ BitVec 64) (_ BitVec 64)) Unit!20603)

(assert (=> d!99660 (= lt!430050 (choose!27 thiss!1728 (_2!12999 lt!429946) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99660 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99660 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12999 lt!429946) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!430050)))

(declare-fun b!295629 () Bool)

(assert (=> b!295629 (= e!211456 (validate_offset_bits!1 ((_ sign_extend 32) (size!7671 (buf!7734 (_2!12999 lt!429946)))) ((_ sign_extend 32) (currentByte!14243 (_2!12999 lt!429946))) ((_ sign_extend 32) (currentBit!14238 (_2!12999 lt!429946))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99660 res!244078) b!295629))

(declare-fun m!433069 () Bool)

(assert (=> d!99660 m!433069))

(assert (=> b!295629 m!432949))

(assert (=> b!295553 d!99660))

(declare-fun d!99662 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99662 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7671 (buf!7734 (_2!12999 lt!429946)))) ((_ sign_extend 32) (currentByte!14243 (_2!12999 lt!429946))) ((_ sign_extend 32) (currentBit!14238 (_2!12999 lt!429946))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7671 (buf!7734 (_2!12999 lt!429946)))) ((_ sign_extend 32) (currentByte!14243 (_2!12999 lt!429946))) ((_ sign_extend 32) (currentBit!14238 (_2!12999 lt!429946)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25487 () Bool)

(assert (= bs!25487 d!99662))

(declare-fun m!433071 () Bool)

(assert (=> bs!25487 m!433071))

(assert (=> b!295553 d!99662))

(declare-fun d!99664 () Bool)

(declare-fun e!211463 () Bool)

(assert (=> d!99664 e!211463))

(declare-fun res!244081 () Bool)

(assert (=> d!99664 (=> (not res!244081) (not e!211463))))

(declare-datatypes ((tuple2!23262 0))(
  ( (tuple2!23263 (_1!13007 Unit!20603) (_2!13007 BitStream!13346)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13346) tuple2!23262)

(assert (=> d!99664 (= res!244081 (= (buf!7734 (_2!13007 (increaseBitIndex!0 thiss!1728))) (buf!7734 thiss!1728)))))

(declare-fun lt!430065 () Bool)

(assert (=> d!99664 (= lt!430065 (not (= (bvand ((_ sign_extend 24) (select (arr!8718 (buf!7734 thiss!1728)) (currentByte!14243 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14238 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430066 () tuple2!23252)

(assert (=> d!99664 (= lt!430066 (tuple2!23253 (not (= (bvand ((_ sign_extend 24) (select (arr!8718 (buf!7734 thiss!1728)) (currentByte!14243 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14238 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13007 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99664 (validate_offset_bit!0 ((_ sign_extend 32) (size!7671 (buf!7734 thiss!1728))) ((_ sign_extend 32) (currentByte!14243 thiss!1728)) ((_ sign_extend 32) (currentBit!14238 thiss!1728)))))

(assert (=> d!99664 (= (readBit!0 thiss!1728) lt!430066)))

(declare-fun lt!430070 () (_ BitVec 64))

(declare-fun b!295632 () Bool)

(declare-fun lt!430069 () (_ BitVec 64))

(assert (=> b!295632 (= e!211463 (= (bitIndex!0 (size!7671 (buf!7734 (_2!13007 (increaseBitIndex!0 thiss!1728)))) (currentByte!14243 (_2!13007 (increaseBitIndex!0 thiss!1728))) (currentBit!14238 (_2!13007 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!430069 lt!430070)))))

(assert (=> b!295632 (or (not (= (bvand lt!430069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430070 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!430069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!430069 lt!430070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295632 (= lt!430070 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295632 (= lt!430069 (bitIndex!0 (size!7671 (buf!7734 thiss!1728)) (currentByte!14243 thiss!1728) (currentBit!14238 thiss!1728)))))

(declare-fun lt!430068 () Bool)

(assert (=> b!295632 (= lt!430068 (not (= (bvand ((_ sign_extend 24) (select (arr!8718 (buf!7734 thiss!1728)) (currentByte!14243 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14238 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430071 () Bool)

(assert (=> b!295632 (= lt!430071 (not (= (bvand ((_ sign_extend 24) (select (arr!8718 (buf!7734 thiss!1728)) (currentByte!14243 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14238 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430067 () Bool)

(assert (=> b!295632 (= lt!430067 (not (= (bvand ((_ sign_extend 24) (select (arr!8718 (buf!7734 thiss!1728)) (currentByte!14243 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14238 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99664 res!244081) b!295632))

(declare-fun m!433073 () Bool)

(assert (=> d!99664 m!433073))

(declare-fun m!433075 () Bool)

(assert (=> d!99664 m!433075))

(declare-fun m!433077 () Bool)

(assert (=> d!99664 m!433077))

(declare-fun m!433079 () Bool)

(assert (=> d!99664 m!433079))

(assert (=> b!295632 m!433075))

(declare-fun m!433081 () Bool)

(assert (=> b!295632 m!433081))

(assert (=> b!295632 m!433077))

(assert (=> b!295632 m!433073))

(assert (=> b!295632 m!432945))

(assert (=> b!295553 d!99664))

(declare-fun lt!430150 () (_ BitVec 32))

(declare-datatypes ((tuple4!892 0))(
  ( (tuple4!893 (_1!13008 (_ BitVec 32)) (_2!13008 (_ BitVec 32)) (_3!1376 (_ BitVec 32)) (_4!446 (_ BitVec 32))) )
))
(declare-fun lt!430152 () tuple4!892)

(declare-fun c!13485 () Bool)

(declare-fun lt!430151 () (_ BitVec 32))

(declare-fun bm!5104 () Bool)

(declare-fun call!5107 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5104 (= call!5107 (byteRangesEq!0 (select (arr!8718 arr!273) (_3!1376 lt!430152)) (select (arr!8718 lt!429954) (_3!1376 lt!430152)) lt!430151 (ite c!13485 lt!430150 #b00000000000000000000000000001000)))))

(declare-fun b!295665 () Bool)

(declare-fun e!211487 () Bool)

(declare-fun e!211485 () Bool)

(assert (=> b!295665 (= e!211487 e!211485)))

(assert (=> b!295665 (= c!13485 (= (_3!1376 lt!430152) (_4!446 lt!430152)))))

(declare-fun d!99666 () Bool)

(declare-fun res!244109 () Bool)

(declare-fun e!211488 () Bool)

(assert (=> d!99666 (=> res!244109 e!211488)))

(assert (=> d!99666 (= res!244109 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99666 (= (arrayBitRangesEq!0 arr!273 lt!429954 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211488)))

(declare-fun e!211486 () Bool)

(declare-fun b!295666 () Bool)

(assert (=> b!295666 (= e!211486 (byteRangesEq!0 (select (arr!8718 arr!273) (_4!446 lt!430152)) (select (arr!8718 lt!429954) (_4!446 lt!430152)) #b00000000000000000000000000000000 lt!430150))))

(declare-fun b!295667 () Bool)

(assert (=> b!295667 (= e!211485 call!5107)))

(declare-fun b!295668 () Bool)

(declare-fun e!211484 () Bool)

(assert (=> b!295668 (= e!211485 e!211484)))

(declare-fun res!244106 () Bool)

(assert (=> b!295668 (= res!244106 call!5107)))

(assert (=> b!295668 (=> (not res!244106) (not e!211484))))

(declare-fun b!295669 () Bool)

(declare-fun e!211489 () Bool)

(declare-fun arrayRangesEq!1504 (array!17700 array!17700 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295669 (= e!211489 (arrayRangesEq!1504 arr!273 lt!429954 (_1!13008 lt!430152) (_2!13008 lt!430152)))))

(declare-fun b!295670 () Bool)

(assert (=> b!295670 (= e!211488 e!211487)))

(declare-fun res!244107 () Bool)

(assert (=> b!295670 (=> (not res!244107) (not e!211487))))

(assert (=> b!295670 (= res!244107 e!211489)))

(declare-fun res!244108 () Bool)

(assert (=> b!295670 (=> res!244108 e!211489)))

(assert (=> b!295670 (= res!244108 (bvsge (_1!13008 lt!430152) (_2!13008 lt!430152)))))

(assert (=> b!295670 (= lt!430150 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295670 (= lt!430151 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!892)

(assert (=> b!295670 (= lt!430152 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295671 () Bool)

(declare-fun res!244110 () Bool)

(assert (=> b!295671 (= res!244110 (= lt!430150 #b00000000000000000000000000000000))))

(assert (=> b!295671 (=> res!244110 e!211486)))

(assert (=> b!295671 (= e!211484 e!211486)))

(assert (= (and d!99666 (not res!244109)) b!295670))

(assert (= (and b!295670 (not res!244108)) b!295669))

(assert (= (and b!295670 res!244107) b!295665))

(assert (= (and b!295665 c!13485) b!295667))

(assert (= (and b!295665 (not c!13485)) b!295668))

(assert (= (and b!295668 res!244106) b!295671))

(assert (= (and b!295671 (not res!244110)) b!295666))

(assert (= (or b!295667 b!295668) bm!5104))

(declare-fun m!433083 () Bool)

(assert (=> bm!5104 m!433083))

(declare-fun m!433085 () Bool)

(assert (=> bm!5104 m!433085))

(assert (=> bm!5104 m!433083))

(assert (=> bm!5104 m!433085))

(declare-fun m!433087 () Bool)

(assert (=> bm!5104 m!433087))

(declare-fun m!433089 () Bool)

(assert (=> b!295666 m!433089))

(declare-fun m!433091 () Bool)

(assert (=> b!295666 m!433091))

(assert (=> b!295666 m!433089))

(assert (=> b!295666 m!433091))

(declare-fun m!433093 () Bool)

(assert (=> b!295666 m!433093))

(declare-fun m!433095 () Bool)

(assert (=> b!295669 m!433095))

(declare-fun m!433097 () Bool)

(assert (=> b!295670 m!433097))

(assert (=> b!295553 d!99666))

(declare-fun lt!430154 () (_ BitVec 32))

(declare-fun lt!430155 () tuple4!892)

(declare-fun bm!5105 () Bool)

(declare-fun call!5108 () Bool)

(declare-fun lt!430153 () (_ BitVec 32))

(declare-fun c!13486 () Bool)

(assert (=> bm!5105 (= call!5108 (byteRangesEq!0 (select (arr!8718 arr!273) (_3!1376 lt!430155)) (select (arr!8718 (_3!1373 lt!429947)) (_3!1376 lt!430155)) lt!430154 (ite c!13486 lt!430153 #b00000000000000000000000000001000)))))

(declare-fun b!295672 () Bool)

(declare-fun e!211493 () Bool)

(declare-fun e!211491 () Bool)

(assert (=> b!295672 (= e!211493 e!211491)))

(assert (=> b!295672 (= c!13486 (= (_3!1376 lt!430155) (_4!446 lt!430155)))))

(declare-fun d!99668 () Bool)

(declare-fun res!244114 () Bool)

(declare-fun e!211494 () Bool)

(assert (=> d!99668 (=> res!244114 e!211494)))

(assert (=> d!99668 (= res!244114 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99668 (= (arrayBitRangesEq!0 arr!273 (_3!1373 lt!429947) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211494)))

(declare-fun b!295673 () Bool)

(declare-fun e!211492 () Bool)

(assert (=> b!295673 (= e!211492 (byteRangesEq!0 (select (arr!8718 arr!273) (_4!446 lt!430155)) (select (arr!8718 (_3!1373 lt!429947)) (_4!446 lt!430155)) #b00000000000000000000000000000000 lt!430153))))

(declare-fun b!295674 () Bool)

(assert (=> b!295674 (= e!211491 call!5108)))

(declare-fun b!295675 () Bool)

(declare-fun e!211490 () Bool)

(assert (=> b!295675 (= e!211491 e!211490)))

(declare-fun res!244111 () Bool)

(assert (=> b!295675 (= res!244111 call!5108)))

(assert (=> b!295675 (=> (not res!244111) (not e!211490))))

(declare-fun b!295676 () Bool)

(declare-fun e!211495 () Bool)

(assert (=> b!295676 (= e!211495 (arrayRangesEq!1504 arr!273 (_3!1373 lt!429947) (_1!13008 lt!430155) (_2!13008 lt!430155)))))

(declare-fun b!295677 () Bool)

(assert (=> b!295677 (= e!211494 e!211493)))

(declare-fun res!244112 () Bool)

(assert (=> b!295677 (=> (not res!244112) (not e!211493))))

(assert (=> b!295677 (= res!244112 e!211495)))

(declare-fun res!244113 () Bool)

(assert (=> b!295677 (=> res!244113 e!211495)))

(assert (=> b!295677 (= res!244113 (bvsge (_1!13008 lt!430155) (_2!13008 lt!430155)))))

(assert (=> b!295677 (= lt!430153 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295677 (= lt!430154 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295677 (= lt!430155 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295678 () Bool)

(declare-fun res!244115 () Bool)

(assert (=> b!295678 (= res!244115 (= lt!430153 #b00000000000000000000000000000000))))

(assert (=> b!295678 (=> res!244115 e!211492)))

(assert (=> b!295678 (= e!211490 e!211492)))

(assert (= (and d!99668 (not res!244114)) b!295677))

(assert (= (and b!295677 (not res!244113)) b!295676))

(assert (= (and b!295677 res!244112) b!295672))

(assert (= (and b!295672 c!13486) b!295674))

(assert (= (and b!295672 (not c!13486)) b!295675))

(assert (= (and b!295675 res!244111) b!295678))

(assert (= (and b!295678 (not res!244115)) b!295673))

(assert (= (or b!295674 b!295675) bm!5105))

(declare-fun m!433099 () Bool)

(assert (=> bm!5105 m!433099))

(declare-fun m!433101 () Bool)

(assert (=> bm!5105 m!433101))

(assert (=> bm!5105 m!433099))

(assert (=> bm!5105 m!433101))

(declare-fun m!433103 () Bool)

(assert (=> bm!5105 m!433103))

(declare-fun m!433105 () Bool)

(assert (=> b!295673 m!433105))

(declare-fun m!433107 () Bool)

(assert (=> b!295673 m!433107))

(assert (=> b!295673 m!433105))

(assert (=> b!295673 m!433107))

(declare-fun m!433109 () Bool)

(assert (=> b!295673 m!433109))

(declare-fun m!433111 () Bool)

(assert (=> b!295676 m!433111))

(assert (=> b!295677 m!433097))

(assert (=> b!295553 d!99668))

(declare-fun d!99670 () Bool)

(declare-fun e!211502 () Bool)

(assert (=> d!99670 e!211502))

(declare-fun res!244127 () Bool)

(assert (=> d!99670 (=> (not res!244127) (not e!211502))))

(declare-fun lt!430205 () (_ BitVec 64))

(declare-fun lt!430204 () (_ BitVec 64))

(declare-fun lt!430206 () (_ BitVec 64))

(assert (=> d!99670 (= res!244127 (= lt!430204 (bvsub lt!430205 lt!430206)))))

(assert (=> d!99670 (or (= (bvand lt!430205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430206 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430205 lt!430206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99670 (= lt!430206 (remainingBits!0 ((_ sign_extend 32) (size!7671 (buf!7734 thiss!1728))) ((_ sign_extend 32) (currentByte!14243 thiss!1728)) ((_ sign_extend 32) (currentBit!14238 thiss!1728))))))

(declare-fun lt!430208 () (_ BitVec 64))

(declare-fun lt!430207 () (_ BitVec 64))

(assert (=> d!99670 (= lt!430205 (bvmul lt!430208 lt!430207))))

(assert (=> d!99670 (or (= lt!430208 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430207 (bvsdiv (bvmul lt!430208 lt!430207) lt!430208)))))

(assert (=> d!99670 (= lt!430207 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99670 (= lt!430208 ((_ sign_extend 32) (size!7671 (buf!7734 thiss!1728))))))

(assert (=> d!99670 (= lt!430204 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14243 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14238 thiss!1728))))))

(assert (=> d!99670 (invariant!0 (currentBit!14238 thiss!1728) (currentByte!14243 thiss!1728) (size!7671 (buf!7734 thiss!1728)))))

(assert (=> d!99670 (= (bitIndex!0 (size!7671 (buf!7734 thiss!1728)) (currentByte!14243 thiss!1728) (currentBit!14238 thiss!1728)) lt!430204)))

(declare-fun b!295692 () Bool)

(declare-fun res!244128 () Bool)

(assert (=> b!295692 (=> (not res!244128) (not e!211502))))

(assert (=> b!295692 (= res!244128 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430204))))

(declare-fun b!295693 () Bool)

(declare-fun lt!430209 () (_ BitVec 64))

(assert (=> b!295693 (= e!211502 (bvsle lt!430204 (bvmul lt!430209 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295693 (or (= lt!430209 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430209 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430209)))))

(assert (=> b!295693 (= lt!430209 ((_ sign_extend 32) (size!7671 (buf!7734 thiss!1728))))))

(assert (= (and d!99670 res!244127) b!295692))

(assert (= (and b!295692 res!244128) b!295693))

(declare-fun m!433171 () Bool)

(assert (=> d!99670 m!433171))

(assert (=> d!99670 m!433061))

(assert (=> b!295553 d!99670))

(declare-fun d!99674 () Bool)

(declare-fun e!211514 () Bool)

(assert (=> d!99674 e!211514))

(declare-fun res!244142 () Bool)

(assert (=> d!99674 (=> (not res!244142) (not e!211514))))

(declare-fun lt!430241 () (_ BitVec 32))

(assert (=> d!99674 (= res!244142 (and (bvsge lt!430241 #b00000000000000000000000000000000) (bvslt lt!430241 (size!7671 arr!273))))))

(declare-fun lt!430239 () (_ BitVec 32))

(declare-fun lt!430242 () Unit!20603)

(declare-fun lt!430240 () (_ BitVec 8))

(declare-fun choose!53 (array!17700 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20603)

(assert (=> d!99674 (= lt!430242 (choose!53 arr!273 from!505 (_1!12999 lt!429946) lt!430241 lt!430239 lt!430240))))

(assert (=> d!99674 (= lt!430240 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8718 arr!273) lt!430241)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430239)))) ((_ sign_extend 24) (ite (_1!12999 lt!429946) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430239) #b00000000)))))))

(assert (=> d!99674 (= lt!430239 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99674 (= lt!430241 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99674 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12999 lt!429946)) lt!430242)))

(declare-fun b!295710 () Bool)

(assert (=> b!295710 (= e!211514 (arrayBitRangesEq!0 arr!273 (array!17701 (store (arr!8718 arr!273) lt!430241 lt!430240) (size!7671 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99674 res!244142) b!295710))

(declare-fun m!433191 () Bool)

(assert (=> d!99674 m!433191))

(declare-fun m!433193 () Bool)

(assert (=> d!99674 m!433193))

(declare-fun m!433195 () Bool)

(assert (=> d!99674 m!433195))

(declare-fun m!433197 () Bool)

(assert (=> b!295710 m!433197))

(declare-fun m!433199 () Bool)

(assert (=> b!295710 m!433199))

(assert (=> b!295553 d!99674))

(declare-fun d!99680 () Bool)

(assert (=> d!99680 (arrayBitRangesEq!0 arr!273 (_3!1373 lt!429947) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430245 () Unit!20603)

(declare-fun choose!49 (array!17700 array!17700 array!17700 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20603)

(assert (=> d!99680 (= lt!430245 (choose!49 arr!273 lt!429954 (_3!1373 lt!429947) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99680 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99680 (= (arrayBitRangesEqTransitive!0 arr!273 lt!429954 (_3!1373 lt!429947) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430245)))

(declare-fun bs!25488 () Bool)

(assert (= bs!25488 d!99680))

(assert (=> bs!25488 m!432937))

(declare-fun m!433201 () Bool)

(assert (=> bs!25488 m!433201))

(assert (=> b!295553 d!99680))

(declare-fun d!99682 () Bool)

(assert (=> d!99682 (= (bitAt!0 lt!429954 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8718 lt!429954) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25489 () Bool)

(assert (= bs!25489 d!99682))

(declare-fun m!433203 () Bool)

(assert (=> bs!25489 m!433203))

(assert (=> bs!25489 m!433067))

(assert (=> b!295553 d!99682))

(declare-fun b!295766 () Bool)

(declare-fun res!244189 () Bool)

(declare-fun e!211549 () Bool)

(assert (=> b!295766 (=> (not res!244189) (not e!211549))))

(declare-fun lt!430488 () tuple3!1858)

(assert (=> b!295766 (= res!244189 (arrayBitRangesEq!0 lt!429954 (_3!1373 lt!430488) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!430503 () tuple3!1858)

(declare-fun e!211550 () Bool)

(declare-fun b!295767 () Bool)

(assert (=> b!295767 (= e!211550 (and (= (buf!7734 (_2!12999 lt!429946)) (buf!7734 (_2!13000 lt!430503))) (= (size!7671 lt!429954) (size!7671 (_3!1373 lt!430503)))))))

(declare-fun b!295768 () Bool)

(declare-fun e!211548 () tuple3!1858)

(declare-fun lt!430487 () Unit!20603)

(assert (=> b!295768 (= e!211548 (tuple3!1859 lt!430487 (_2!13000 lt!430503) (_3!1373 lt!430503)))))

(declare-fun lt!430493 () tuple2!23252)

(assert (=> b!295768 (= lt!430493 (readBit!0 (_2!12999 lt!429946)))))

(declare-fun lt!430501 () (_ BitVec 32))

(assert (=> b!295768 (= lt!430501 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430481 () (_ BitVec 32))

(assert (=> b!295768 (= lt!430481 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430499 () array!17700)

(assert (=> b!295768 (= lt!430499 (array!17701 (store (arr!8718 lt!429954) lt!430501 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8718 lt!429954) lt!430501)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430481)))) ((_ sign_extend 24) (ite (_1!12999 lt!430493) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430481) #b00000000))))) (size!7671 lt!429954)))))

(declare-fun lt!430497 () (_ BitVec 64))

(assert (=> b!295768 (= lt!430497 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!430476 () (_ BitVec 64))

(assert (=> b!295768 (= lt!430476 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!430484 () Unit!20603)

(assert (=> b!295768 (= lt!430484 (validateOffsetBitsIneqLemma!0 (_2!12999 lt!429946) (_2!12999 lt!430493) lt!430497 lt!430476))))

(assert (=> b!295768 (validate_offset_bits!1 ((_ sign_extend 32) (size!7671 (buf!7734 (_2!12999 lt!430493)))) ((_ sign_extend 32) (currentByte!14243 (_2!12999 lt!430493))) ((_ sign_extend 32) (currentBit!14238 (_2!12999 lt!430493))) (bvsub lt!430497 lt!430476))))

(declare-fun lt!430495 () Unit!20603)

(assert (=> b!295768 (= lt!430495 lt!430484)))

(assert (=> b!295768 (= lt!430503 (readBitsLoop!0 (_2!12999 lt!430493) nBits!523 lt!430499 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!244192 () Bool)

(assert (=> b!295768 (= res!244192 (= (bvsub (bvadd (bitIndex!0 (size!7671 (buf!7734 (_2!12999 lt!429946))) (currentByte!14243 (_2!12999 lt!429946)) (currentBit!14238 (_2!12999 lt!429946))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7671 (buf!7734 (_2!13000 lt!430503))) (currentByte!14243 (_2!13000 lt!430503)) (currentBit!14238 (_2!13000 lt!430503)))))))

(assert (=> b!295768 (=> (not res!244192) (not e!211550))))

(assert (=> b!295768 e!211550))

(declare-fun lt!430502 () Unit!20603)

(declare-fun Unit!20613 () Unit!20603)

(assert (=> b!295768 (= lt!430502 Unit!20613)))

(declare-fun lt!430504 () (_ BitVec 32))

(assert (=> b!295768 (= lt!430504 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430496 () (_ BitVec 32))

(assert (=> b!295768 (= lt!430496 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430480 () Unit!20603)

(assert (=> b!295768 (= lt!430480 (arrayBitRangesUpdatedAtLemma!0 lt!429954 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12999 lt!430493)))))

(assert (=> b!295768 (arrayBitRangesEq!0 lt!429954 (array!17701 (store (arr!8718 lt!429954) lt!430504 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8718 lt!429954) lt!430504)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430496)))) ((_ sign_extend 24) (ite (_1!12999 lt!430493) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430496) #b00000000))))) (size!7671 lt!429954)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!430478 () Unit!20603)

(assert (=> b!295768 (= lt!430478 lt!430480)))

(declare-fun lt!430482 () (_ BitVec 64))

(assert (=> b!295768 (= lt!430482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430486 () Unit!20603)

(assert (=> b!295768 (= lt!430486 (arrayBitRangesEqTransitive!0 lt!429954 lt!430499 (_3!1373 lt!430503) lt!430482 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!5123 () Bool)

(assert (=> b!295768 call!5123))

(declare-fun lt!430489 () Unit!20603)

(assert (=> b!295768 (= lt!430489 lt!430486)))

(declare-fun call!5122 () Bool)

(assert (=> b!295768 call!5122))

(declare-fun lt!430498 () Unit!20603)

(declare-fun Unit!20614 () Unit!20603)

(assert (=> b!295768 (= lt!430498 Unit!20614)))

(declare-fun lt!430474 () Unit!20603)

(assert (=> b!295768 (= lt!430474 (arrayBitRangesEqImpliesEq!0 lt!430499 (_3!1373 lt!430503) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295768 (= (bitAt!0 lt!430499 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1373 lt!430503) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!430471 () Unit!20603)

(assert (=> b!295768 (= lt!430471 lt!430474)))

(declare-fun lt!430491 () Unit!20603)

(declare-fun Unit!20615 () Unit!20603)

(assert (=> b!295768 (= lt!430491 Unit!20615)))

(declare-fun lt!430506 () Bool)

(assert (=> b!295768 (= lt!430506 (= (bitAt!0 (_3!1373 lt!430503) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12999 lt!430493)))))

(declare-fun Unit!20616 () Unit!20603)

(assert (=> b!295768 (= lt!430487 Unit!20616)))

(assert (=> b!295768 lt!430506))

(declare-fun b!295769 () Bool)

(declare-fun res!244188 () Bool)

(assert (=> b!295769 (=> (not res!244188) (not e!211549))))

(assert (=> b!295769 (= res!244188 (and (= (buf!7734 (_2!12999 lt!429946)) (buf!7734 (_2!13000 lt!430488))) (= (size!7671 lt!429954) (size!7671 (_3!1373 lt!430488)))))))

(declare-fun lt!430475 () Unit!20603)

(declare-fun b!295770 () Bool)

(assert (=> b!295770 (= e!211548 (tuple3!1859 lt!430475 (_2!12999 lt!429946) lt!429954))))

(declare-fun lt!430492 () Unit!20603)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17700) Unit!20603)

(assert (=> b!295770 (= lt!430492 (arrayBitRangesEqReflexiveLemma!0 lt!429954))))

(assert (=> b!295770 call!5122))

(declare-fun lt!430505 () Unit!20603)

(assert (=> b!295770 (= lt!430505 lt!430492)))

(declare-fun lt!430473 () array!17700)

(assert (=> b!295770 (= lt!430473 lt!429954)))

(declare-fun lt!430483 () array!17700)

(assert (=> b!295770 (= lt!430483 lt!429954)))

(declare-fun lt!430500 () (_ BitVec 64))

(assert (=> b!295770 (= lt!430500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430485 () (_ BitVec 64))

(assert (=> b!295770 (= lt!430485 ((_ sign_extend 32) (size!7671 lt!429954)))))

(declare-fun lt!430479 () (_ BitVec 64))

(assert (=> b!295770 (= lt!430479 (bvmul lt!430485 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!430494 () (_ BitVec 64))

(assert (=> b!295770 (= lt!430494 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430490 () (_ BitVec 64))

(assert (=> b!295770 (= lt!430490 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17700 array!17700 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20603)

(assert (=> b!295770 (= lt!430475 (arrayBitRangesEqSlicedLemma!0 lt!430473 lt!430483 lt!430500 lt!430479 lt!430494 lt!430490))))

(assert (=> b!295770 call!5123))

(declare-fun b!295771 () Bool)

(declare-fun res!244190 () Bool)

(assert (=> b!295771 (=> (not res!244190) (not e!211549))))

(declare-fun e!211547 () Bool)

(assert (=> b!295771 (= res!244190 e!211547)))

(declare-fun res!244193 () Bool)

(assert (=> b!295771 (=> res!244193 e!211547)))

(assert (=> b!295771 (= res!244193 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!295772 () Bool)

(declare-datatypes ((tuple2!23264 0))(
  ( (tuple2!23265 (_1!13009 BitStream!13346) (_2!13009 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13346) tuple2!23264)

(assert (=> b!295772 (= e!211547 (= (bitAt!0 (_3!1373 lt!430488) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13009 (readBitPure!0 (_2!12999 lt!429946)))))))

(declare-fun d!99684 () Bool)

(assert (=> d!99684 e!211549))

(declare-fun res!244194 () Bool)

(assert (=> d!99684 (=> (not res!244194) (not e!211549))))

(declare-fun lt!430477 () (_ BitVec 64))

(assert (=> d!99684 (= res!244194 (= (bvsub lt!430477 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7671 (buf!7734 (_2!13000 lt!430488))) (currentByte!14243 (_2!13000 lt!430488)) (currentBit!14238 (_2!13000 lt!430488)))))))

(assert (=> d!99684 (or (= (bvand lt!430477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430477 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!430472 () (_ BitVec 64))

(assert (=> d!99684 (= lt!430477 (bvadd lt!430472 to!474))))

(assert (=> d!99684 (or (not (= (bvand lt!430472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!430472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!430472 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99684 (= lt!430472 (bitIndex!0 (size!7671 (buf!7734 (_2!12999 lt!429946))) (currentByte!14243 (_2!12999 lt!429946)) (currentBit!14238 (_2!12999 lt!429946))))))

(assert (=> d!99684 (= lt!430488 e!211548)))

(declare-fun c!13494 () Bool)

(assert (=> d!99684 (= c!13494 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99684 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99684 (= (readBitsLoop!0 (_2!12999 lt!429946) nBits!523 lt!429954 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!430488)))

(declare-fun b!295773 () Bool)

(declare-fun res!244191 () Bool)

(assert (=> b!295773 (=> (not res!244191) (not e!211549))))

(assert (=> b!295773 (= res!244191 (invariant!0 (currentBit!14238 (_2!13000 lt!430488)) (currentByte!14243 (_2!13000 lt!430488)) (size!7671 (buf!7734 (_2!13000 lt!430488)))))))

(declare-fun b!295774 () Bool)

(declare-datatypes ((List!986 0))(
  ( (Nil!983) (Cons!982 (h!1101 Bool) (t!1871 List!986)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13346 array!17700 (_ BitVec 64) (_ BitVec 64)) List!986)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13346 BitStream!13346 (_ BitVec 64)) List!986)

(assert (=> b!295774 (= e!211549 (= (byteArrayBitContentToList!0 (_2!13000 lt!430488) (_3!1373 lt!430488) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13000 lt!430488) (_2!12999 lt!429946) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!295774 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295774 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!5119 () Bool)

(assert (=> bm!5119 (= call!5122 (arrayBitRangesEq!0 lt!429954 (ite c!13494 (_3!1373 lt!430503) lt!429954) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13494 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7671 lt!429954)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun bm!5120 () Bool)

(assert (=> bm!5120 (= call!5123 (arrayBitRangesEq!0 (ite c!13494 lt!429954 lt!430473) (ite c!13494 (_3!1373 lt!430503) lt!430483) (ite c!13494 lt!430482 lt!430494) (ite c!13494 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!430490)))))

(assert (= (and d!99684 c!13494) b!295768))

(assert (= (and d!99684 (not c!13494)) b!295770))

(assert (= (and b!295768 res!244192) b!295767))

(assert (= (or b!295768 b!295770) bm!5120))

(assert (= (or b!295768 b!295770) bm!5119))

(assert (= (and d!99684 res!244194) b!295769))

(assert (= (and b!295769 res!244188) b!295766))

(assert (= (and b!295766 res!244189) b!295771))

(assert (= (and b!295771 (not res!244193)) b!295772))

(assert (= (and b!295771 res!244190) b!295773))

(assert (= (and b!295773 res!244191) b!295774))

(declare-fun m!433289 () Bool)

(assert (=> b!295774 m!433289))

(declare-fun m!433291 () Bool)

(assert (=> b!295774 m!433291))

(declare-fun m!433293 () Bool)

(assert (=> b!295766 m!433293))

(declare-fun m!433295 () Bool)

(assert (=> b!295772 m!433295))

(declare-fun m!433297 () Bool)

(assert (=> b!295772 m!433297))

(declare-fun m!433299 () Bool)

(assert (=> b!295770 m!433299))

(declare-fun m!433301 () Bool)

(assert (=> b!295770 m!433301))

(declare-fun m!433303 () Bool)

(assert (=> b!295768 m!433303))

(declare-fun m!433305 () Bool)

(assert (=> b!295768 m!433305))

(declare-fun m!433307 () Bool)

(assert (=> b!295768 m!433307))

(declare-fun m!433309 () Bool)

(assert (=> b!295768 m!433309))

(declare-fun m!433311 () Bool)

(assert (=> b!295768 m!433311))

(declare-fun m!433313 () Bool)

(assert (=> b!295768 m!433313))

(declare-fun m!433315 () Bool)

(assert (=> b!295768 m!433315))

(declare-fun m!433317 () Bool)

(assert (=> b!295768 m!433317))

(declare-fun m!433319 () Bool)

(assert (=> b!295768 m!433319))

(declare-fun m!433321 () Bool)

(assert (=> b!295768 m!433321))

(declare-fun m!433323 () Bool)

(assert (=> b!295768 m!433323))

(declare-fun m!433325 () Bool)

(assert (=> b!295768 m!433325))

(declare-fun m!433327 () Bool)

(assert (=> b!295768 m!433327))

(declare-fun m!433329 () Bool)

(assert (=> b!295768 m!433329))

(declare-fun m!433331 () Bool)

(assert (=> b!295768 m!433331))

(declare-fun m!433333 () Bool)

(assert (=> b!295768 m!433333))

(declare-fun m!433335 () Bool)

(assert (=> b!295768 m!433335))

(declare-fun m!433337 () Bool)

(assert (=> b!295768 m!433337))

(declare-fun m!433339 () Bool)

(assert (=> b!295773 m!433339))

(declare-fun m!433341 () Bool)

(assert (=> bm!5120 m!433341))

(declare-fun m!433343 () Bool)

(assert (=> bm!5119 m!433343))

(declare-fun m!433345 () Bool)

(assert (=> d!99684 m!433345))

(assert (=> d!99684 m!433311))

(assert (=> b!295553 d!99684))

(declare-fun d!99708 () Bool)

(declare-fun e!211551 () Bool)

(assert (=> d!99708 e!211551))

(declare-fun res!244195 () Bool)

(assert (=> d!99708 (=> (not res!244195) (not e!211551))))

(declare-fun lt!430508 () (_ BitVec 64))

(declare-fun lt!430507 () (_ BitVec 64))

(declare-fun lt!430509 () (_ BitVec 64))

(assert (=> d!99708 (= res!244195 (= lt!430507 (bvsub lt!430508 lt!430509)))))

(assert (=> d!99708 (or (= (bvand lt!430508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430509 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430508 lt!430509) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99708 (= lt!430509 (remainingBits!0 ((_ sign_extend 32) (size!7671 (buf!7734 (_2!13000 lt!429947)))) ((_ sign_extend 32) (currentByte!14243 (_2!13000 lt!429947))) ((_ sign_extend 32) (currentBit!14238 (_2!13000 lt!429947)))))))

(declare-fun lt!430511 () (_ BitVec 64))

(declare-fun lt!430510 () (_ BitVec 64))

(assert (=> d!99708 (= lt!430508 (bvmul lt!430511 lt!430510))))

(assert (=> d!99708 (or (= lt!430511 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430510 (bvsdiv (bvmul lt!430511 lt!430510) lt!430511)))))

(assert (=> d!99708 (= lt!430510 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99708 (= lt!430511 ((_ sign_extend 32) (size!7671 (buf!7734 (_2!13000 lt!429947)))))))

(assert (=> d!99708 (= lt!430507 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14243 (_2!13000 lt!429947))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14238 (_2!13000 lt!429947)))))))

(assert (=> d!99708 (invariant!0 (currentBit!14238 (_2!13000 lt!429947)) (currentByte!14243 (_2!13000 lt!429947)) (size!7671 (buf!7734 (_2!13000 lt!429947))))))

(assert (=> d!99708 (= (bitIndex!0 (size!7671 (buf!7734 (_2!13000 lt!429947))) (currentByte!14243 (_2!13000 lt!429947)) (currentBit!14238 (_2!13000 lt!429947))) lt!430507)))

(declare-fun b!295775 () Bool)

(declare-fun res!244196 () Bool)

(assert (=> b!295775 (=> (not res!244196) (not e!211551))))

(assert (=> b!295775 (= res!244196 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430507))))

(declare-fun b!295776 () Bool)

(declare-fun lt!430512 () (_ BitVec 64))

(assert (=> b!295776 (= e!211551 (bvsle lt!430507 (bvmul lt!430512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295776 (or (= lt!430512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430512)))))

(assert (=> b!295776 (= lt!430512 ((_ sign_extend 32) (size!7671 (buf!7734 (_2!13000 lt!429947)))))))

(assert (= (and d!99708 res!244195) b!295775))

(assert (= (and b!295775 res!244196) b!295776))

(declare-fun m!433347 () Bool)

(assert (=> d!99708 m!433347))

(declare-fun m!433349 () Bool)

(assert (=> d!99708 m!433349))

(assert (=> b!295553 d!99708))

(declare-fun d!99710 () Bool)

(assert (=> d!99710 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7671 (buf!7734 thiss!1728))) ((_ sign_extend 32) (currentByte!14243 thiss!1728)) ((_ sign_extend 32) (currentBit!14238 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7671 (buf!7734 thiss!1728))) ((_ sign_extend 32) (currentByte!14243 thiss!1728)) ((_ sign_extend 32) (currentBit!14238 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25496 () Bool)

(assert (= bs!25496 d!99710))

(assert (=> bs!25496 m!433171))

(assert (=> b!295554 d!99710))

(declare-fun d!99712 () Bool)

(assert (=> d!99712 (= (array_inv!7283 (buf!7734 thiss!1728)) (bvsge (size!7671 (buf!7734 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!295556 d!99712))

(push 1)

(assert (not d!99656))

(assert (not b!295666))

(assert (not b!295768))

(assert (not b!295772))

(assert (not bm!5104))

(assert (not b!295676))

(assert (not d!99710))

(assert (not bm!5120))

(assert (not d!99674))

(assert (not d!99680))

(assert (not bm!5119))

(assert (not d!99670))

(assert (not d!99660))

(assert (not b!295669))

(assert (not b!295770))

(assert (not bm!5105))

(assert (not b!295629))

(assert (not b!295773))

(assert (not b!295766))

(assert (not d!99652))

(assert (not d!99664))

(assert (not d!99708))

(assert (not b!295632))

(assert (not b!295774))

(assert (not b!295673))

(assert (not b!295670))

(assert (not b!295677))

(assert (not b!295710))

(assert (not d!99684))

(assert (not d!99662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

