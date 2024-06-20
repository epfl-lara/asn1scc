; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65740 () Bool)

(assert start!65740)

(declare-fun b!294913 () Bool)

(declare-fun res!243509 () Bool)

(declare-fun e!210872 () Bool)

(assert (=> b!294913 (=> (not res!243509) (not e!210872))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294913 (= res!243509 (bvslt from!505 to!474))))

(declare-fun e!210875 () Bool)

(declare-datatypes ((array!17672 0))(
  ( (array!17673 (arr!8698 (Array (_ BitVec 32) (_ BitVec 8))) (size!7660 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13324 0))(
  ( (BitStream!13325 (buf!7723 array!17672) (currentByte!14220 (_ BitVec 32)) (currentBit!14215 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20557 0))(
  ( (Unit!20558) )
))
(declare-datatypes ((tuple3!1836 0))(
  ( (tuple3!1837 (_1!12959 Unit!20557) (_2!12959 BitStream!13324) (_3!1356 array!17672)) )
))
(declare-fun lt!428501 () tuple3!1836)

(declare-fun lt!428500 () array!17672)

(declare-fun b!294914 () Bool)

(declare-fun arrayBitRangesEq!0 (array!17672 array!17672 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294914 (= e!210875 (arrayBitRangesEq!0 lt!428500 (_3!1356 lt!428501) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun res!243511 () Bool)

(assert (=> start!65740 (=> (not res!243511) (not e!210872))))

(declare-fun arr!273 () array!17672)

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!65740 (= res!243511 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7660 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65740 e!210872))

(declare-fun thiss!1728 () BitStream!13324)

(declare-fun e!210873 () Bool)

(declare-fun inv!12 (BitStream!13324) Bool)

(assert (=> start!65740 (and (inv!12 thiss!1728) e!210873)))

(assert (=> start!65740 true))

(declare-fun array_inv!7272 (array!17672) Bool)

(assert (=> start!65740 (array_inv!7272 arr!273)))

(declare-fun b!294915 () Bool)

(declare-fun res!243510 () Bool)

(assert (=> b!294915 (=> (not res!243510) (not e!210872))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294915 (= res!243510 (validate_offset_bits!1 ((_ sign_extend 32) (size!7660 (buf!7723 thiss!1728))) ((_ sign_extend 32) (currentByte!14220 thiss!1728)) ((_ sign_extend 32) (currentBit!14215 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294916 () Bool)

(assert (=> b!294916 (= e!210872 (not e!210875))))

(declare-fun res!243512 () Bool)

(assert (=> b!294916 (=> res!243512 e!210875)))

(assert (=> b!294916 (= res!243512 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7660 arr!273)))) (bvsge from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(assert (=> b!294916 (arrayBitRangesEq!0 arr!273 (_3!1356 lt!428501) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428497 () Unit!20557)

(declare-fun arrayBitRangesEqTransitive!0 (array!17672 array!17672 array!17672 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20557)

(assert (=> b!294916 (= lt!428497 (arrayBitRangesEqTransitive!0 arr!273 lt!428500 (_3!1356 lt!428501) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294916 (arrayBitRangesEq!0 arr!273 lt!428500 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23206 0))(
  ( (tuple2!23207 (_1!12960 Bool) (_2!12960 BitStream!13324)) )
))
(declare-fun lt!428496 () tuple2!23206)

(declare-fun lt!428502 () Unit!20557)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17672 (_ BitVec 64) Bool) Unit!20557)

(assert (=> b!294916 (= lt!428502 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12960 lt!428496)))))

(declare-fun e!210871 () Bool)

(assert (=> b!294916 e!210871))

(declare-fun res!243508 () Bool)

(assert (=> b!294916 (=> (not res!243508) (not e!210871))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294916 (= res!243508 (= (bvsub (bvadd (bitIndex!0 (size!7660 (buf!7723 thiss!1728)) (currentByte!14220 thiss!1728) (currentBit!14215 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7660 (buf!7723 (_2!12959 lt!428501))) (currentByte!14220 (_2!12959 lt!428501)) (currentBit!14215 (_2!12959 lt!428501)))))))

(declare-fun readBitsLoop!0 (BitStream!13324 (_ BitVec 64) array!17672 (_ BitVec 64) (_ BitVec 64)) tuple3!1836)

(assert (=> b!294916 (= lt!428501 (readBitsLoop!0 (_2!12960 lt!428496) nBits!523 lt!428500 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294916 (validate_offset_bits!1 ((_ sign_extend 32) (size!7660 (buf!7723 (_2!12960 lt!428496)))) ((_ sign_extend 32) (currentByte!14220 (_2!12960 lt!428496))) ((_ sign_extend 32) (currentBit!14215 (_2!12960 lt!428496))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428495 () Unit!20557)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13324 BitStream!13324 (_ BitVec 64) (_ BitVec 64)) Unit!20557)

(assert (=> b!294916 (= lt!428495 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12960 lt!428496) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428499 () (_ BitVec 32))

(declare-fun lt!428498 () (_ BitVec 32))

(assert (=> b!294916 (= lt!428500 (array!17673 (store (arr!8698 arr!273) lt!428499 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8698 arr!273) lt!428499)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428498)))) ((_ sign_extend 24) (ite (_1!12960 lt!428496) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428498) #b00000000))))) (size!7660 arr!273)))))

(assert (=> b!294916 (= lt!428498 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294916 (= lt!428499 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13324) tuple2!23206)

(assert (=> b!294916 (= lt!428496 (readBit!0 thiss!1728))))

(declare-fun b!294917 () Bool)

(assert (=> b!294917 (= e!210873 (array_inv!7272 (buf!7723 thiss!1728)))))

(declare-fun b!294918 () Bool)

(assert (=> b!294918 (= e!210871 (and (= (buf!7723 thiss!1728) (buf!7723 (_2!12959 lt!428501))) (= (size!7660 arr!273) (size!7660 (_3!1356 lt!428501)))))))

(assert (= (and start!65740 res!243511) b!294915))

(assert (= (and b!294915 res!243510) b!294913))

(assert (= (and b!294913 res!243509) b!294916))

(assert (= (and b!294916 res!243508) b!294918))

(assert (= (and b!294916 (not res!243512)) b!294914))

(assert (= start!65740 b!294917))

(declare-fun m!431689 () Bool)

(assert (=> b!294917 m!431689))

(declare-fun m!431691 () Bool)

(assert (=> b!294916 m!431691))

(declare-fun m!431693 () Bool)

(assert (=> b!294916 m!431693))

(declare-fun m!431695 () Bool)

(assert (=> b!294916 m!431695))

(declare-fun m!431697 () Bool)

(assert (=> b!294916 m!431697))

(declare-fun m!431699 () Bool)

(assert (=> b!294916 m!431699))

(declare-fun m!431701 () Bool)

(assert (=> b!294916 m!431701))

(declare-fun m!431703 () Bool)

(assert (=> b!294916 m!431703))

(declare-fun m!431705 () Bool)

(assert (=> b!294916 m!431705))

(declare-fun m!431707 () Bool)

(assert (=> b!294916 m!431707))

(declare-fun m!431709 () Bool)

(assert (=> b!294916 m!431709))

(declare-fun m!431711 () Bool)

(assert (=> b!294916 m!431711))

(declare-fun m!431713 () Bool)

(assert (=> b!294916 m!431713))

(declare-fun m!431715 () Bool)

(assert (=> b!294916 m!431715))

(declare-fun m!431717 () Bool)

(assert (=> start!65740 m!431717))

(declare-fun m!431719 () Bool)

(assert (=> start!65740 m!431719))

(declare-fun m!431721 () Bool)

(assert (=> b!294914 m!431721))

(declare-fun m!431723 () Bool)

(assert (=> b!294915 m!431723))

(push 1)

(assert (not b!294914))

(assert (not b!294917))

(assert (not b!294915))

(assert (not b!294916))

(assert (not start!65740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99430 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99430 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14215 thiss!1728) (currentByte!14220 thiss!1728) (size!7660 (buf!7723 thiss!1728))))))

(declare-fun bs!25437 () Bool)

(assert (= bs!25437 d!99430))

(declare-fun m!431835 () Bool)

(assert (=> bs!25437 m!431835))

(assert (=> start!65740 d!99430))

(declare-fun d!99432 () Bool)

(assert (=> d!99432 (= (array_inv!7272 arr!273) (bvsge (size!7660 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65740 d!99432))

(declare-fun d!99434 () Bool)

(assert (=> d!99434 (= (array_inv!7272 (buf!7723 thiss!1728)) (bvsge (size!7660 (buf!7723 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!294917 d!99434))

(declare-fun b!295102 () Bool)

(declare-fun res!243662 () Bool)

(declare-fun e!211014 () Bool)

(assert (=> b!295102 (=> (not res!243662) (not e!211014))))

(declare-fun lt!428948 () tuple3!1836)

(assert (=> b!295102 (= res!243662 (invariant!0 (currentBit!14215 (_2!12959 lt!428948)) (currentByte!14220 (_2!12959 lt!428948)) (size!7660 (buf!7723 (_2!12959 lt!428948)))))))

(declare-fun b!295103 () Bool)

(declare-fun res!243663 () Bool)

(assert (=> b!295103 (=> (not res!243663) (not e!211014))))

(assert (=> b!295103 (= res!243663 (and (= (buf!7723 (_2!12960 lt!428496)) (buf!7723 (_2!12959 lt!428948))) (= (size!7660 lt!428500) (size!7660 (_3!1356 lt!428948)))))))

(declare-fun b!295104 () Bool)

(declare-fun res!243664 () Bool)

(assert (=> b!295104 (=> (not res!243664) (not e!211014))))

(declare-fun e!211012 () Bool)

(assert (=> b!295104 (= res!243664 e!211012)))

(declare-fun res!243660 () Bool)

(assert (=> b!295104 (=> res!243660 e!211012)))

(assert (=> b!295104 (= res!243660 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun lt!428931 () Unit!20557)

(declare-fun b!295105 () Bool)

(declare-fun e!211013 () tuple3!1836)

(assert (=> b!295105 (= e!211013 (tuple3!1837 lt!428931 (_2!12960 lt!428496) lt!428500))))

(declare-fun lt!428941 () Unit!20557)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17672) Unit!20557)

(assert (=> b!295105 (= lt!428941 (arrayBitRangesEqReflexiveLemma!0 lt!428500))))

(declare-fun call!5053 () Bool)

(assert (=> b!295105 call!5053))

(declare-fun lt!428932 () Unit!20557)

(assert (=> b!295105 (= lt!428932 lt!428941)))

(declare-fun lt!428933 () array!17672)

(assert (=> b!295105 (= lt!428933 lt!428500)))

(declare-fun lt!428942 () array!17672)

(assert (=> b!295105 (= lt!428942 lt!428500)))

(declare-fun lt!428944 () (_ BitVec 64))

(assert (=> b!295105 (= lt!428944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428951 () (_ BitVec 64))

(assert (=> b!295105 (= lt!428951 ((_ sign_extend 32) (size!7660 lt!428500)))))

(declare-fun lt!428952 () (_ BitVec 64))

(assert (=> b!295105 (= lt!428952 (bvmul lt!428951 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!428928 () (_ BitVec 64))

(assert (=> b!295105 (= lt!428928 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428930 () (_ BitVec 64))

(assert (=> b!295105 (= lt!428930 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17672 array!17672 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20557)

(assert (=> b!295105 (= lt!428931 (arrayBitRangesEqSlicedLemma!0 lt!428933 lt!428942 lt!428944 lt!428952 lt!428928 lt!428930))))

(declare-fun call!5054 () Bool)

(assert (=> b!295105 call!5054))

(declare-fun b!295106 () Bool)

(declare-fun res!243659 () Bool)

(assert (=> b!295106 (=> (not res!243659) (not e!211014))))

(assert (=> b!295106 (= res!243659 (arrayBitRangesEq!0 lt!428500 (_3!1356 lt!428948) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!295107 () Bool)

(declare-fun lt!428938 () Unit!20557)

(declare-fun lt!428924 () tuple3!1836)

(assert (=> b!295107 (= e!211013 (tuple3!1837 lt!428938 (_2!12959 lt!428924) (_3!1356 lt!428924)))))

(declare-fun lt!428943 () tuple2!23206)

(assert (=> b!295107 (= lt!428943 (readBit!0 (_2!12960 lt!428496)))))

(declare-fun lt!428926 () (_ BitVec 32))

(assert (=> b!295107 (= lt!428926 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428923 () (_ BitVec 32))

(assert (=> b!295107 (= lt!428923 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428945 () array!17672)

(assert (=> b!295107 (= lt!428945 (array!17673 (store (arr!8698 lt!428500) lt!428926 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8698 lt!428500) lt!428926)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428923)))) ((_ sign_extend 24) (ite (_1!12960 lt!428943) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428923) #b00000000))))) (size!7660 lt!428500)))))

(declare-fun lt!428956 () (_ BitVec 64))

(assert (=> b!295107 (= lt!428956 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!428936 () (_ BitVec 64))

(assert (=> b!295107 (= lt!428936 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!428953 () Unit!20557)

(assert (=> b!295107 (= lt!428953 (validateOffsetBitsIneqLemma!0 (_2!12960 lt!428496) (_2!12960 lt!428943) lt!428956 lt!428936))))

(assert (=> b!295107 (validate_offset_bits!1 ((_ sign_extend 32) (size!7660 (buf!7723 (_2!12960 lt!428943)))) ((_ sign_extend 32) (currentByte!14220 (_2!12960 lt!428943))) ((_ sign_extend 32) (currentBit!14215 (_2!12960 lt!428943))) (bvsub lt!428956 lt!428936))))

(declare-fun lt!428939 () Unit!20557)

(assert (=> b!295107 (= lt!428939 lt!428953)))

(assert (=> b!295107 (= lt!428924 (readBitsLoop!0 (_2!12960 lt!428943) nBits!523 lt!428945 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!243658 () Bool)

(assert (=> b!295107 (= res!243658 (= (bvsub (bvadd (bitIndex!0 (size!7660 (buf!7723 (_2!12960 lt!428496))) (currentByte!14220 (_2!12960 lt!428496)) (currentBit!14215 (_2!12960 lt!428496))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7660 (buf!7723 (_2!12959 lt!428924))) (currentByte!14220 (_2!12959 lt!428924)) (currentBit!14215 (_2!12959 lt!428924)))))))

(declare-fun e!211015 () Bool)

(assert (=> b!295107 (=> (not res!243658) (not e!211015))))

(assert (=> b!295107 e!211015))

(declare-fun lt!428954 () Unit!20557)

(declare-fun Unit!20569 () Unit!20557)

(assert (=> b!295107 (= lt!428954 Unit!20569)))

(declare-fun lt!428958 () (_ BitVec 32))

(assert (=> b!295107 (= lt!428958 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428946 () (_ BitVec 32))

(assert (=> b!295107 (= lt!428946 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!428947 () Unit!20557)

(assert (=> b!295107 (= lt!428947 (arrayBitRangesUpdatedAtLemma!0 lt!428500 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12960 lt!428943)))))

(assert (=> b!295107 (arrayBitRangesEq!0 lt!428500 (array!17673 (store (arr!8698 lt!428500) lt!428958 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8698 lt!428500) lt!428958)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428946)))) ((_ sign_extend 24) (ite (_1!12960 lt!428943) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428946) #b00000000))))) (size!7660 lt!428500)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!428957 () Unit!20557)

(assert (=> b!295107 (= lt!428957 lt!428947)))

(declare-fun lt!428949 () (_ BitVec 64))

(assert (=> b!295107 (= lt!428949 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428937 () Unit!20557)

(assert (=> b!295107 (= lt!428937 (arrayBitRangesEqTransitive!0 lt!428500 lt!428945 (_3!1356 lt!428924) lt!428949 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295107 call!5054))

(declare-fun lt!428935 () Unit!20557)

(assert (=> b!295107 (= lt!428935 lt!428937)))

(assert (=> b!295107 call!5053))

(declare-fun lt!428927 () Unit!20557)

(declare-fun Unit!20572 () Unit!20557)

(assert (=> b!295107 (= lt!428927 Unit!20572)))

(declare-fun lt!428929 () Unit!20557)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17672 array!17672 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20557)

(assert (=> b!295107 (= lt!428929 (arrayBitRangesEqImpliesEq!0 lt!428945 (_3!1356 lt!428924) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bitAt!0 (array!17672 (_ BitVec 64)) Bool)

(assert (=> b!295107 (= (bitAt!0 lt!428945 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1356 lt!428924) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!428925 () Unit!20557)

(assert (=> b!295107 (= lt!428925 lt!428929)))

(declare-fun lt!428950 () Unit!20557)

(declare-fun Unit!20573 () Unit!20557)

(assert (=> b!295107 (= lt!428950 Unit!20573)))

(declare-fun lt!428955 () Bool)

(assert (=> b!295107 (= lt!428955 (= (bitAt!0 (_3!1356 lt!428924) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12960 lt!428943)))))

(declare-fun Unit!20574 () Unit!20557)

(assert (=> b!295107 (= lt!428938 Unit!20574)))

(assert (=> b!295107 lt!428955))

(declare-fun b!295108 () Bool)

(assert (=> b!295108 (= e!211015 (and (= (buf!7723 (_2!12960 lt!428496)) (buf!7723 (_2!12959 lt!428924))) (= (size!7660 lt!428500) (size!7660 (_3!1356 lt!428924)))))))

(declare-fun b!295109 () Bool)

(declare-datatypes ((List!980 0))(
  ( (Nil!977) (Cons!976 (h!1095 Bool) (t!1865 List!980)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13324 array!17672 (_ BitVec 64) (_ BitVec 64)) List!980)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13324 BitStream!13324 (_ BitVec 64)) List!980)

(assert (=> b!295109 (= e!211014 (= (byteArrayBitContentToList!0 (_2!12959 lt!428948) (_3!1356 lt!428948) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12959 lt!428948) (_2!12960 lt!428496) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!295109 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295109 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295110 () Bool)

(declare-datatypes ((tuple2!23216 0))(
  ( (tuple2!23217 (_1!12969 BitStream!13324) (_2!12969 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13324) tuple2!23216)

(assert (=> b!295110 (= e!211012 (= (bitAt!0 (_3!1356 lt!428948) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12969 (readBitPure!0 (_2!12960 lt!428496)))))))

(declare-fun bm!5051 () Bool)

(declare-fun c!13444 () Bool)

(assert (=> bm!5051 (= call!5053 (arrayBitRangesEq!0 lt!428500 (ite c!13444 (_3!1356 lt!428924) lt!428500) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13444 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7660 lt!428500)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun d!99436 () Bool)

(assert (=> d!99436 e!211014))

(declare-fun res!243661 () Bool)

(assert (=> d!99436 (=> (not res!243661) (not e!211014))))

(declare-fun lt!428940 () (_ BitVec 64))

(assert (=> d!99436 (= res!243661 (= (bvsub lt!428940 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7660 (buf!7723 (_2!12959 lt!428948))) (currentByte!14220 (_2!12959 lt!428948)) (currentBit!14215 (_2!12959 lt!428948)))))))

(assert (=> d!99436 (or (= (bvand lt!428940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!428940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!428940 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!428934 () (_ BitVec 64))

(assert (=> d!99436 (= lt!428940 (bvadd lt!428934 to!474))))

(assert (=> d!99436 (or (not (= (bvand lt!428934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!428934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!428934 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99436 (= lt!428934 (bitIndex!0 (size!7660 (buf!7723 (_2!12960 lt!428496))) (currentByte!14220 (_2!12960 lt!428496)) (currentBit!14215 (_2!12960 lt!428496))))))

(assert (=> d!99436 (= lt!428948 e!211013)))

(assert (=> d!99436 (= c!13444 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99436 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99436 (= (readBitsLoop!0 (_2!12960 lt!428496) nBits!523 lt!428500 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!428948)))

(declare-fun bm!5050 () Bool)

(assert (=> bm!5050 (= call!5054 (arrayBitRangesEq!0 (ite c!13444 lt!428500 lt!428933) (ite c!13444 (_3!1356 lt!428924) lt!428942) (ite c!13444 lt!428949 lt!428928) (ite c!13444 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!428930)))))

(assert (= (and d!99436 c!13444) b!295107))

(assert (= (and d!99436 (not c!13444)) b!295105))

(assert (= (and b!295107 res!243658) b!295108))

(assert (= (or b!295107 b!295105) bm!5050))

(assert (= (or b!295107 b!295105) bm!5051))

(assert (= (and d!99436 res!243661) b!295103))

(assert (= (and b!295103 res!243663) b!295106))

(assert (= (and b!295106 res!243659) b!295104))

(assert (= (and b!295104 (not res!243660)) b!295110))

(assert (= (and b!295104 res!243664) b!295102))

(assert (= (and b!295102 res!243662) b!295109))

(declare-fun m!431969 () Bool)

(assert (=> b!295106 m!431969))

(declare-fun m!431971 () Bool)

(assert (=> b!295105 m!431971))

(declare-fun m!431973 () Bool)

(assert (=> b!295105 m!431973))

(declare-fun m!431975 () Bool)

(assert (=> b!295109 m!431975))

(declare-fun m!431977 () Bool)

(assert (=> b!295109 m!431977))

(declare-fun m!431979 () Bool)

(assert (=> d!99436 m!431979))

(declare-fun m!431981 () Bool)

(assert (=> d!99436 m!431981))

(declare-fun m!431983 () Bool)

(assert (=> b!295102 m!431983))

(declare-fun m!431985 () Bool)

(assert (=> b!295110 m!431985))

(declare-fun m!431987 () Bool)

(assert (=> b!295110 m!431987))

(declare-fun m!431989 () Bool)

(assert (=> bm!5050 m!431989))

(declare-fun m!431991 () Bool)

(assert (=> b!295107 m!431991))

(declare-fun m!431993 () Bool)

(assert (=> b!295107 m!431993))

(declare-fun m!431995 () Bool)

(assert (=> b!295107 m!431995))

(declare-fun m!431997 () Bool)

(assert (=> b!295107 m!431997))

(declare-fun m!431999 () Bool)

(assert (=> b!295107 m!431999))

(declare-fun m!432001 () Bool)

(assert (=> b!295107 m!432001))

(declare-fun m!432003 () Bool)

(assert (=> b!295107 m!432003))

(declare-fun m!432005 () Bool)

(assert (=> b!295107 m!432005))

(declare-fun m!432007 () Bool)

(assert (=> b!295107 m!432007))

(declare-fun m!432009 () Bool)

(assert (=> b!295107 m!432009))

(declare-fun m!432011 () Bool)

(assert (=> b!295107 m!432011))

(declare-fun m!432013 () Bool)

(assert (=> b!295107 m!432013))

(declare-fun m!432015 () Bool)

(assert (=> b!295107 m!432015))

(declare-fun m!432017 () Bool)

(assert (=> b!295107 m!432017))

(assert (=> b!295107 m!431981))

(declare-fun m!432019 () Bool)

(assert (=> b!295107 m!432019))

(declare-fun m!432021 () Bool)

(assert (=> b!295107 m!432021))

(declare-fun m!432023 () Bool)

(assert (=> b!295107 m!432023))

(declare-fun m!432025 () Bool)

(assert (=> bm!5051 m!432025))

(assert (=> b!294916 d!99436))

(declare-fun d!99470 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99470 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7660 (buf!7723 (_2!12960 lt!428496)))) ((_ sign_extend 32) (currentByte!14220 (_2!12960 lt!428496))) ((_ sign_extend 32) (currentBit!14215 (_2!12960 lt!428496))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7660 (buf!7723 (_2!12960 lt!428496)))) ((_ sign_extend 32) (currentByte!14220 (_2!12960 lt!428496))) ((_ sign_extend 32) (currentBit!14215 (_2!12960 lt!428496)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25442 () Bool)

(assert (= bs!25442 d!99470))

(declare-fun m!432051 () Bool)

(assert (=> bs!25442 m!432051))

(assert (=> b!294916 d!99470))

(declare-fun d!99472 () Bool)

(declare-fun e!211029 () Bool)

(assert (=> d!99472 e!211029))

(declare-fun res!243681 () Bool)

(assert (=> d!99472 (=> (not res!243681) (not e!211029))))

(assert (=> d!99472 (= res!243681 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429006 () Unit!20557)

(declare-fun choose!27 (BitStream!13324 BitStream!13324 (_ BitVec 64) (_ BitVec 64)) Unit!20557)

(assert (=> d!99472 (= lt!429006 (choose!27 thiss!1728 (_2!12960 lt!428496) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99472 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99472 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12960 lt!428496) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!429006)))

(declare-fun b!295131 () Bool)

(assert (=> b!295131 (= e!211029 (validate_offset_bits!1 ((_ sign_extend 32) (size!7660 (buf!7723 (_2!12960 lt!428496)))) ((_ sign_extend 32) (currentByte!14220 (_2!12960 lt!428496))) ((_ sign_extend 32) (currentBit!14215 (_2!12960 lt!428496))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99472 res!243681) b!295131))

(declare-fun m!432107 () Bool)

(assert (=> d!99472 m!432107))

(assert (=> b!295131 m!431707))

(assert (=> b!294916 d!99472))

(declare-fun d!99480 () Bool)

(declare-fun e!211036 () Bool)

(assert (=> d!99480 e!211036))

(declare-fun res!243687 () Bool)

(assert (=> d!99480 (=> (not res!243687) (not e!211036))))

(declare-fun lt!429021 () (_ BitVec 64))

(declare-fun lt!429022 () (_ BitVec 64))

(declare-fun lt!429024 () (_ BitVec 64))

(assert (=> d!99480 (= res!243687 (= lt!429024 (bvsub lt!429022 lt!429021)))))

(assert (=> d!99480 (or (= (bvand lt!429022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!429021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!429022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!429022 lt!429021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99480 (= lt!429021 (remainingBits!0 ((_ sign_extend 32) (size!7660 (buf!7723 (_2!12959 lt!428501)))) ((_ sign_extend 32) (currentByte!14220 (_2!12959 lt!428501))) ((_ sign_extend 32) (currentBit!14215 (_2!12959 lt!428501)))))))

(declare-fun lt!429020 () (_ BitVec 64))

(declare-fun lt!429023 () (_ BitVec 64))

(assert (=> d!99480 (= lt!429022 (bvmul lt!429020 lt!429023))))

(assert (=> d!99480 (or (= lt!429020 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!429023 (bvsdiv (bvmul lt!429020 lt!429023) lt!429020)))))

(assert (=> d!99480 (= lt!429023 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99480 (= lt!429020 ((_ sign_extend 32) (size!7660 (buf!7723 (_2!12959 lt!428501)))))))

(assert (=> d!99480 (= lt!429024 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14220 (_2!12959 lt!428501))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14215 (_2!12959 lt!428501)))))))

(assert (=> d!99480 (invariant!0 (currentBit!14215 (_2!12959 lt!428501)) (currentByte!14220 (_2!12959 lt!428501)) (size!7660 (buf!7723 (_2!12959 lt!428501))))))

(assert (=> d!99480 (= (bitIndex!0 (size!7660 (buf!7723 (_2!12959 lt!428501))) (currentByte!14220 (_2!12959 lt!428501)) (currentBit!14215 (_2!12959 lt!428501))) lt!429024)))

(declare-fun b!295136 () Bool)

(declare-fun res!243686 () Bool)

(assert (=> b!295136 (=> (not res!243686) (not e!211036))))

(assert (=> b!295136 (= res!243686 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!429024))))

(declare-fun b!295137 () Bool)

(declare-fun lt!429019 () (_ BitVec 64))

(assert (=> b!295137 (= e!211036 (bvsle lt!429024 (bvmul lt!429019 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295137 (or (= lt!429019 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!429019 #b0000000000000000000000000000000000000000000000000000000000001000) lt!429019)))))

(assert (=> b!295137 (= lt!429019 ((_ sign_extend 32) (size!7660 (buf!7723 (_2!12959 lt!428501)))))))

(assert (= (and d!99480 res!243687) b!295136))

(assert (= (and b!295136 res!243686) b!295137))

(declare-fun m!432109 () Bool)

(assert (=> d!99480 m!432109))

(declare-fun m!432111 () Bool)

(assert (=> d!99480 m!432111))

(assert (=> b!294916 d!99480))

(declare-fun b!295165 () Bool)

(declare-fun e!211063 () Bool)

(declare-fun e!211062 () Bool)

(assert (=> b!295165 (= e!211063 e!211062)))

(declare-fun res!243713 () Bool)

(assert (=> b!295165 (=> (not res!243713) (not e!211062))))

(declare-fun e!211064 () Bool)

(assert (=> b!295165 (= res!243713 e!211064)))

(declare-fun res!243709 () Bool)

(assert (=> b!295165 (=> res!243709 e!211064)))

(declare-datatypes ((tuple4!880 0))(
  ( (tuple4!881 (_1!12971 (_ BitVec 32)) (_2!12971 (_ BitVec 32)) (_3!1361 (_ BitVec 32)) (_4!440 (_ BitVec 32))) )
))
(declare-fun lt!429058 () tuple4!880)

(assert (=> b!295165 (= res!243709 (bvsge (_1!12971 lt!429058) (_2!12971 lt!429058)))))

(declare-fun lt!429060 () (_ BitVec 32))

(assert (=> b!295165 (= lt!429060 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429059 () (_ BitVec 32))

(assert (=> b!295165 (= lt!429059 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!880)

(assert (=> b!295165 (= lt!429058 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun c!13450 () Bool)

(declare-fun call!5061 () Bool)

(declare-fun bm!5058 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5058 (= call!5061 (byteRangesEq!0 (ite c!13450 (select (arr!8698 arr!273) (_3!1361 lt!429058)) (select (arr!8698 arr!273) (_4!440 lt!429058))) (ite c!13450 (select (arr!8698 lt!428500) (_3!1361 lt!429058)) (select (arr!8698 lt!428500) (_4!440 lt!429058))) (ite c!13450 lt!429059 #b00000000000000000000000000000000) lt!429060))))

(declare-fun b!295167 () Bool)

(declare-fun e!211066 () Bool)

(assert (=> b!295167 (= e!211066 call!5061)))

(declare-fun b!295168 () Bool)

(declare-fun arrayRangesEq!1498 (array!17672 array!17672 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295168 (= e!211064 (arrayRangesEq!1498 arr!273 lt!428500 (_1!12971 lt!429058) (_2!12971 lt!429058)))))

(declare-fun b!295169 () Bool)

(declare-fun e!211065 () Bool)

(assert (=> b!295169 (= e!211065 call!5061)))

(declare-fun b!295170 () Bool)

(declare-fun res!243710 () Bool)

(assert (=> b!295170 (= res!243710 (= lt!429060 #b00000000000000000000000000000000))))

(assert (=> b!295170 (=> res!243710 e!211066)))

(declare-fun e!211061 () Bool)

(assert (=> b!295170 (= e!211061 e!211066)))

(declare-fun b!295171 () Bool)

(assert (=> b!295171 (= e!211065 e!211061)))

(declare-fun res!243711 () Bool)

(assert (=> b!295171 (= res!243711 (byteRangesEq!0 (select (arr!8698 arr!273) (_3!1361 lt!429058)) (select (arr!8698 lt!428500) (_3!1361 lt!429058)) lt!429059 #b00000000000000000000000000001000))))

(assert (=> b!295171 (=> (not res!243711) (not e!211061))))

(declare-fun b!295166 () Bool)

(assert (=> b!295166 (= e!211062 e!211065)))

(assert (=> b!295166 (= c!13450 (= (_3!1361 lt!429058) (_4!440 lt!429058)))))

(declare-fun d!99482 () Bool)

(declare-fun res!243712 () Bool)

(assert (=> d!99482 (=> res!243712 e!211063)))

(assert (=> d!99482 (= res!243712 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99482 (= (arrayBitRangesEq!0 arr!273 lt!428500 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211063)))

(assert (= (and d!99482 (not res!243712)) b!295165))

(assert (= (and b!295165 (not res!243709)) b!295168))

(assert (= (and b!295165 res!243713) b!295166))

(assert (= (and b!295166 c!13450) b!295169))

(assert (= (and b!295166 (not c!13450)) b!295171))

(assert (= (and b!295171 res!243711) b!295170))

(assert (= (and b!295170 (not res!243710)) b!295167))

(assert (= (or b!295169 b!295167) bm!5058))

(declare-fun m!432141 () Bool)

(assert (=> b!295165 m!432141))

(declare-fun m!432143 () Bool)

(assert (=> bm!5058 m!432143))

(declare-fun m!432145 () Bool)

(assert (=> bm!5058 m!432145))

(declare-fun m!432147 () Bool)

(assert (=> bm!5058 m!432147))

(declare-fun m!432149 () Bool)

(assert (=> bm!5058 m!432149))

(declare-fun m!432151 () Bool)

(assert (=> bm!5058 m!432151))

(declare-fun m!432153 () Bool)

(assert (=> b!295168 m!432153))

(assert (=> b!295171 m!432143))

(assert (=> b!295171 m!432145))

(assert (=> b!295171 m!432143))

(assert (=> b!295171 m!432145))

(declare-fun m!432155 () Bool)

(assert (=> b!295171 m!432155))

(assert (=> b!294916 d!99482))

(declare-fun d!99490 () Bool)

(declare-fun e!211073 () Bool)

(assert (=> d!99490 e!211073))

(declare-fun res!243716 () Bool)

(assert (=> d!99490 (=> (not res!243716) (not e!211073))))

(declare-datatypes ((tuple2!23220 0))(
  ( (tuple2!23221 (_1!12972 Unit!20557) (_2!12972 BitStream!13324)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13324) tuple2!23220)

(assert (=> d!99490 (= res!243716 (= (buf!7723 (_2!12972 (increaseBitIndex!0 thiss!1728))) (buf!7723 thiss!1728)))))

(declare-fun lt!429076 () Bool)

(assert (=> d!99490 (= lt!429076 (not (= (bvand ((_ sign_extend 24) (select (arr!8698 (buf!7723 thiss!1728)) (currentByte!14220 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14215 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429075 () tuple2!23206)

(assert (=> d!99490 (= lt!429075 (tuple2!23207 (not (= (bvand ((_ sign_extend 24) (select (arr!8698 (buf!7723 thiss!1728)) (currentByte!14220 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14215 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12972 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99490 (validate_offset_bit!0 ((_ sign_extend 32) (size!7660 (buf!7723 thiss!1728))) ((_ sign_extend 32) (currentByte!14220 thiss!1728)) ((_ sign_extend 32) (currentBit!14215 thiss!1728)))))

(assert (=> d!99490 (= (readBit!0 thiss!1728) lt!429075)))

(declare-fun lt!429079 () (_ BitVec 64))

(declare-fun b!295174 () Bool)

(declare-fun lt!429081 () (_ BitVec 64))

(assert (=> b!295174 (= e!211073 (= (bitIndex!0 (size!7660 (buf!7723 (_2!12972 (increaseBitIndex!0 thiss!1728)))) (currentByte!14220 (_2!12972 (increaseBitIndex!0 thiss!1728))) (currentBit!14215 (_2!12972 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!429081 lt!429079)))))

(assert (=> b!295174 (or (not (= (bvand lt!429081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!429079 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!429081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!429081 lt!429079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295174 (= lt!429079 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295174 (= lt!429081 (bitIndex!0 (size!7660 (buf!7723 thiss!1728)) (currentByte!14220 thiss!1728) (currentBit!14215 thiss!1728)))))

(declare-fun lt!429080 () Bool)

(assert (=> b!295174 (= lt!429080 (not (= (bvand ((_ sign_extend 24) (select (arr!8698 (buf!7723 thiss!1728)) (currentByte!14220 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14215 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429078 () Bool)

(assert (=> b!295174 (= lt!429078 (not (= (bvand ((_ sign_extend 24) (select (arr!8698 (buf!7723 thiss!1728)) (currentByte!14220 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14215 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429077 () Bool)

(assert (=> b!295174 (= lt!429077 (not (= (bvand ((_ sign_extend 24) (select (arr!8698 (buf!7723 thiss!1728)) (currentByte!14220 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14215 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99490 res!243716) b!295174))

(declare-fun m!432157 () Bool)

(assert (=> d!99490 m!432157))

(declare-fun m!432159 () Bool)

(assert (=> d!99490 m!432159))

(declare-fun m!432161 () Bool)

(assert (=> d!99490 m!432161))

(declare-fun m!432163 () Bool)

(assert (=> d!99490 m!432163))

(assert (=> b!295174 m!432157))

(assert (=> b!295174 m!432161))

(declare-fun m!432165 () Bool)

(assert (=> b!295174 m!432165))

(assert (=> b!295174 m!432159))

(assert (=> b!295174 m!431697))

(assert (=> b!294916 d!99490))

(declare-fun d!99492 () Bool)

(declare-fun e!211074 () Bool)

(assert (=> d!99492 e!211074))

(declare-fun res!243718 () Bool)

(assert (=> d!99492 (=> (not res!243718) (not e!211074))))

(declare-fun lt!429084 () (_ BitVec 64))

(declare-fun lt!429085 () (_ BitVec 64))

(declare-fun lt!429087 () (_ BitVec 64))

(assert (=> d!99492 (= res!243718 (= lt!429087 (bvsub lt!429085 lt!429084)))))

(assert (=> d!99492 (or (= (bvand lt!429085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!429084 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!429085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!429085 lt!429084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99492 (= lt!429084 (remainingBits!0 ((_ sign_extend 32) (size!7660 (buf!7723 thiss!1728))) ((_ sign_extend 32) (currentByte!14220 thiss!1728)) ((_ sign_extend 32) (currentBit!14215 thiss!1728))))))

(declare-fun lt!429083 () (_ BitVec 64))

(declare-fun lt!429086 () (_ BitVec 64))

(assert (=> d!99492 (= lt!429085 (bvmul lt!429083 lt!429086))))

(assert (=> d!99492 (or (= lt!429083 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!429086 (bvsdiv (bvmul lt!429083 lt!429086) lt!429083)))))

(assert (=> d!99492 (= lt!429086 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99492 (= lt!429083 ((_ sign_extend 32) (size!7660 (buf!7723 thiss!1728))))))

(assert (=> d!99492 (= lt!429087 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14220 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14215 thiss!1728))))))

(assert (=> d!99492 (invariant!0 (currentBit!14215 thiss!1728) (currentByte!14220 thiss!1728) (size!7660 (buf!7723 thiss!1728)))))

(assert (=> d!99492 (= (bitIndex!0 (size!7660 (buf!7723 thiss!1728)) (currentByte!14220 thiss!1728) (currentBit!14215 thiss!1728)) lt!429087)))

(declare-fun b!295175 () Bool)

(declare-fun res!243717 () Bool)

(assert (=> b!295175 (=> (not res!243717) (not e!211074))))

(assert (=> b!295175 (= res!243717 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!429087))))

(declare-fun b!295176 () Bool)

(declare-fun lt!429082 () (_ BitVec 64))

(assert (=> b!295176 (= e!211074 (bvsle lt!429087 (bvmul lt!429082 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295176 (or (= lt!429082 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!429082 #b0000000000000000000000000000000000000000000000000000000000001000) lt!429082)))))

(assert (=> b!295176 (= lt!429082 ((_ sign_extend 32) (size!7660 (buf!7723 thiss!1728))))))

(assert (= (and d!99492 res!243718) b!295175))

(assert (= (and b!295175 res!243717) b!295176))

(declare-fun m!432167 () Bool)

(assert (=> d!99492 m!432167))

(assert (=> d!99492 m!431835))

(assert (=> b!294916 d!99492))

(declare-fun d!99494 () Bool)

(declare-fun e!211077 () Bool)

(assert (=> d!99494 e!211077))

(declare-fun res!243721 () Bool)

(assert (=> d!99494 (=> (not res!243721) (not e!211077))))

(declare-fun lt!429099 () (_ BitVec 32))

(assert (=> d!99494 (= res!243721 (and (bvsge lt!429099 #b00000000000000000000000000000000) (bvslt lt!429099 (size!7660 arr!273))))))

(declare-fun lt!429098 () (_ BitVec 8))

(declare-fun lt!429097 () (_ BitVec 32))

(declare-fun lt!429096 () Unit!20557)

(declare-fun choose!53 (array!17672 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20557)

(assert (=> d!99494 (= lt!429096 (choose!53 arr!273 from!505 (_1!12960 lt!428496) lt!429099 lt!429097 lt!429098))))

(assert (=> d!99494 (= lt!429098 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8698 arr!273) lt!429099)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429097)))) ((_ sign_extend 24) (ite (_1!12960 lt!428496) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429097) #b00000000)))))))

(assert (=> d!99494 (= lt!429097 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99494 (= lt!429099 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99494 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12960 lt!428496)) lt!429096)))

(declare-fun b!295180 () Bool)

(assert (=> b!295180 (= e!211077 (arrayBitRangesEq!0 arr!273 (array!17673 (store (arr!8698 arr!273) lt!429099 lt!429098) (size!7660 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99494 res!243721) b!295180))

(declare-fun m!432169 () Bool)

(assert (=> d!99494 m!432169))

(declare-fun m!432171 () Bool)

(assert (=> d!99494 m!432171))

(declare-fun m!432173 () Bool)

(assert (=> d!99494 m!432173))

(declare-fun m!432175 () Bool)

(assert (=> b!295180 m!432175))

(declare-fun m!432177 () Bool)

(assert (=> b!295180 m!432177))

(assert (=> b!294916 d!99494))

(declare-fun d!99496 () Bool)

(assert (=> d!99496 (arrayBitRangesEq!0 arr!273 (_3!1356 lt!428501) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429102 () Unit!20557)

(declare-fun choose!49 (array!17672 array!17672 array!17672 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20557)

(assert (=> d!99496 (= lt!429102 (choose!49 arr!273 lt!428500 (_3!1356 lt!428501) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99496 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99496 (= (arrayBitRangesEqTransitive!0 arr!273 lt!428500 (_3!1356 lt!428501) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!429102)))

(declare-fun bs!25444 () Bool)

(assert (= bs!25444 d!99496))

(assert (=> bs!25444 m!431713))

(declare-fun m!432179 () Bool)

(assert (=> bs!25444 m!432179))

(assert (=> b!294916 d!99496))

(declare-fun b!295181 () Bool)

(declare-fun e!211080 () Bool)

(declare-fun e!211079 () Bool)

(assert (=> b!295181 (= e!211080 e!211079)))

(declare-fun res!243726 () Bool)

(assert (=> b!295181 (=> (not res!243726) (not e!211079))))

(declare-fun e!211081 () Bool)

(assert (=> b!295181 (= res!243726 e!211081)))

(declare-fun res!243722 () Bool)

(assert (=> b!295181 (=> res!243722 e!211081)))

(declare-fun lt!429103 () tuple4!880)

(assert (=> b!295181 (= res!243722 (bvsge (_1!12971 lt!429103) (_2!12971 lt!429103)))))

(declare-fun lt!429105 () (_ BitVec 32))

(assert (=> b!295181 (= lt!429105 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429104 () (_ BitVec 32))

(assert (=> b!295181 (= lt!429104 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295181 (= lt!429103 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun c!13451 () Bool)

(declare-fun call!5062 () Bool)

(declare-fun bm!5059 () Bool)

(assert (=> bm!5059 (= call!5062 (byteRangesEq!0 (ite c!13451 (select (arr!8698 arr!273) (_3!1361 lt!429103)) (select (arr!8698 arr!273) (_4!440 lt!429103))) (ite c!13451 (select (arr!8698 (_3!1356 lt!428501)) (_3!1361 lt!429103)) (select (arr!8698 (_3!1356 lt!428501)) (_4!440 lt!429103))) (ite c!13451 lt!429104 #b00000000000000000000000000000000) lt!429105))))

(declare-fun b!295183 () Bool)

(declare-fun e!211083 () Bool)

(assert (=> b!295183 (= e!211083 call!5062)))

(declare-fun b!295184 () Bool)

(assert (=> b!295184 (= e!211081 (arrayRangesEq!1498 arr!273 (_3!1356 lt!428501) (_1!12971 lt!429103) (_2!12971 lt!429103)))))

(declare-fun b!295185 () Bool)

(declare-fun e!211082 () Bool)

(assert (=> b!295185 (= e!211082 call!5062)))

(declare-fun b!295186 () Bool)

(declare-fun res!243723 () Bool)

(assert (=> b!295186 (= res!243723 (= lt!429105 #b00000000000000000000000000000000))))

(assert (=> b!295186 (=> res!243723 e!211083)))

(declare-fun e!211078 () Bool)

(assert (=> b!295186 (= e!211078 e!211083)))

(declare-fun b!295187 () Bool)

(assert (=> b!295187 (= e!211082 e!211078)))

(declare-fun res!243724 () Bool)

(assert (=> b!295187 (= res!243724 (byteRangesEq!0 (select (arr!8698 arr!273) (_3!1361 lt!429103)) (select (arr!8698 (_3!1356 lt!428501)) (_3!1361 lt!429103)) lt!429104 #b00000000000000000000000000001000))))

(assert (=> b!295187 (=> (not res!243724) (not e!211078))))

(declare-fun b!295182 () Bool)

(assert (=> b!295182 (= e!211079 e!211082)))

(assert (=> b!295182 (= c!13451 (= (_3!1361 lt!429103) (_4!440 lt!429103)))))

(declare-fun d!99498 () Bool)

(declare-fun res!243725 () Bool)

(assert (=> d!99498 (=> res!243725 e!211080)))

(assert (=> d!99498 (= res!243725 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99498 (= (arrayBitRangesEq!0 arr!273 (_3!1356 lt!428501) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211080)))

(assert (= (and d!99498 (not res!243725)) b!295181))

(assert (= (and b!295181 (not res!243722)) b!295184))

(assert (= (and b!295181 res!243726) b!295182))

(assert (= (and b!295182 c!13451) b!295185))

(assert (= (and b!295182 (not c!13451)) b!295187))

(assert (= (and b!295187 res!243724) b!295186))

(assert (= (and b!295186 (not res!243723)) b!295183))

(assert (= (or b!295185 b!295183) bm!5059))

(assert (=> b!295181 m!432141))

(declare-fun m!432181 () Bool)

(assert (=> bm!5059 m!432181))

(declare-fun m!432183 () Bool)

(assert (=> bm!5059 m!432183))

(declare-fun m!432185 () Bool)

(assert (=> bm!5059 m!432185))

(declare-fun m!432187 () Bool)

(assert (=> bm!5059 m!432187))

(declare-fun m!432189 () Bool)

(assert (=> bm!5059 m!432189))

(declare-fun m!432191 () Bool)

(assert (=> b!295184 m!432191))

(assert (=> b!295187 m!432181))

(assert (=> b!295187 m!432183))

(assert (=> b!295187 m!432181))

(assert (=> b!295187 m!432183))

(declare-fun m!432193 () Bool)

(assert (=> b!295187 m!432193))

(assert (=> b!294916 d!99498))

(declare-fun d!99500 () Bool)

(assert (=> d!99500 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7660 (buf!7723 thiss!1728))) ((_ sign_extend 32) (currentByte!14220 thiss!1728)) ((_ sign_extend 32) (currentBit!14215 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7660 (buf!7723 thiss!1728))) ((_ sign_extend 32) (currentByte!14220 thiss!1728)) ((_ sign_extend 32) (currentBit!14215 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25445 () Bool)

(assert (= bs!25445 d!99500))

(assert (=> bs!25445 m!432167))

(assert (=> b!294915 d!99500))

(declare-fun b!295188 () Bool)

(declare-fun e!211086 () Bool)

(declare-fun e!211085 () Bool)

(assert (=> b!295188 (= e!211086 e!211085)))

(declare-fun res!243731 () Bool)

(assert (=> b!295188 (=> (not res!243731) (not e!211085))))

(declare-fun e!211087 () Bool)

(assert (=> b!295188 (= res!243731 e!211087)))

(declare-fun res!243727 () Bool)

(assert (=> b!295188 (=> res!243727 e!211087)))

(declare-fun lt!429106 () tuple4!880)

(assert (=> b!295188 (= res!243727 (bvsge (_1!12971 lt!429106) (_2!12971 lt!429106)))))

(declare-fun lt!429108 () (_ BitVec 32))

(assert (=> b!295188 (= lt!429108 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429107 () (_ BitVec 32))

(assert (=> b!295188 (= lt!429107 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295188 (= lt!429106 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun c!13452 () Bool)

(declare-fun call!5063 () Bool)

(declare-fun bm!5060 () Bool)

(assert (=> bm!5060 (= call!5063 (byteRangesEq!0 (ite c!13452 (select (arr!8698 lt!428500) (_3!1361 lt!429106)) (select (arr!8698 lt!428500) (_4!440 lt!429106))) (ite c!13452 (select (arr!8698 (_3!1356 lt!428501)) (_3!1361 lt!429106)) (select (arr!8698 (_3!1356 lt!428501)) (_4!440 lt!429106))) (ite c!13452 lt!429107 #b00000000000000000000000000000000) lt!429108))))

(declare-fun b!295190 () Bool)

(declare-fun e!211089 () Bool)

(assert (=> b!295190 (= e!211089 call!5063)))

(declare-fun b!295191 () Bool)

(assert (=> b!295191 (= e!211087 (arrayRangesEq!1498 lt!428500 (_3!1356 lt!428501) (_1!12971 lt!429106) (_2!12971 lt!429106)))))

(declare-fun b!295192 () Bool)

(declare-fun e!211088 () Bool)

(assert (=> b!295192 (= e!211088 call!5063)))

(declare-fun b!295193 () Bool)

(declare-fun res!243728 () Bool)

(assert (=> b!295193 (= res!243728 (= lt!429108 #b00000000000000000000000000000000))))

(assert (=> b!295193 (=> res!243728 e!211089)))

(declare-fun e!211084 () Bool)

(assert (=> b!295193 (= e!211084 e!211089)))

(declare-fun b!295194 () Bool)

(assert (=> b!295194 (= e!211088 e!211084)))

(declare-fun res!243729 () Bool)

(assert (=> b!295194 (= res!243729 (byteRangesEq!0 (select (arr!8698 lt!428500) (_3!1361 lt!429106)) (select (arr!8698 (_3!1356 lt!428501)) (_3!1361 lt!429106)) lt!429107 #b00000000000000000000000000001000))))

(assert (=> b!295194 (=> (not res!243729) (not e!211084))))

(declare-fun b!295189 () Bool)

(assert (=> b!295189 (= e!211085 e!211088)))

(assert (=> b!295189 (= c!13452 (= (_3!1361 lt!429106) (_4!440 lt!429106)))))

(declare-fun d!99502 () Bool)

(declare-fun res!243730 () Bool)

(assert (=> d!99502 (=> res!243730 e!211086)))

(assert (=> d!99502 (= res!243730 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99502 (= (arrayBitRangesEq!0 lt!428500 (_3!1356 lt!428501) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) e!211086)))

(assert (= (and d!99502 (not res!243730)) b!295188))

(assert (= (and b!295188 (not res!243727)) b!295191))

(assert (= (and b!295188 res!243731) b!295189))

(assert (= (and b!295189 c!13452) b!295192))

(assert (= (and b!295189 (not c!13452)) b!295194))

(assert (= (and b!295194 res!243729) b!295193))

(assert (= (and b!295193 (not res!243728)) b!295190))

(assert (= (or b!295192 b!295190) bm!5060))

(declare-fun m!432195 () Bool)

(assert (=> b!295188 m!432195))

(declare-fun m!432197 () Bool)

(assert (=> bm!5060 m!432197))

(declare-fun m!432199 () Bool)

(assert (=> bm!5060 m!432199))

(declare-fun m!432201 () Bool)

(assert (=> bm!5060 m!432201))

(declare-fun m!432203 () Bool)

(assert (=> bm!5060 m!432203))

(declare-fun m!432205 () Bool)

(assert (=> bm!5060 m!432205))

(declare-fun m!432207 () Bool)

(assert (=> b!295191 m!432207))

(assert (=> b!295194 m!432197))

(assert (=> b!295194 m!432199))

(assert (=> b!295194 m!432197))

(assert (=> b!295194 m!432199))

(declare-fun m!432209 () Bool)

(assert (=> b!295194 m!432209))

(assert (=> b!294914 d!99502))

(push 1)

(assert (not d!99494))

(assert (not b!295109))

(assert (not d!99470))

(assert (not d!99496))

(assert (not bm!5060))

(assert (not b!295187))

(assert (not d!99500))

(assert (not bm!5058))

(assert (not b!295102))

(assert (not b!295181))

(assert (not b!295107))

(assert (not d!99472))

(assert (not b!295174))

(assert (not bm!5051))

(assert (not b!295188))

(assert (not b!295131))

(assert (not b!295165))

(assert (not b!295110))

(assert (not bm!5050))

(assert (not b!295194))

(assert (not d!99436))

(assert (not b!295106))

(assert (not d!99480))

(assert (not b!295184))

(assert (not d!99430))

(assert (not bm!5059))

(assert (not d!99490))

(assert (not b!295180))

(assert (not b!295191))

(assert (not b!295105))

(assert (not d!99492))

(assert (not b!295171))

(assert (not b!295168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

