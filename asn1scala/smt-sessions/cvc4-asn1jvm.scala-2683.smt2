; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65648 () Bool)

(assert start!65648)

(declare-fun b!294405 () Bool)

(declare-fun e!210428 () Bool)

(declare-fun e!210429 () Bool)

(assert (=> b!294405 (= e!210428 (not e!210429))))

(declare-fun res!243102 () Bool)

(assert (=> b!294405 (=> res!243102 e!210429)))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!294405 (= res!243102 (bvsgt from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-datatypes ((array!17631 0))(
  ( (array!17632 (arr!8676 (Array (_ BitVec 32) (_ BitVec 8))) (size!7641 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17631)

(declare-fun lt!427504 () array!17631)

(declare-fun arrayBitRangesEq!0 (array!17631 array!17631 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294405 (arrayBitRangesEq!0 arr!273 lt!427504 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((BitStream!13286 0))(
  ( (BitStream!13287 (buf!7704 array!17631) (currentByte!14195 (_ BitVec 32)) (currentBit!14190 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23156 0))(
  ( (tuple2!23157 (_1!12912 Bool) (_2!12912 BitStream!13286)) )
))
(declare-fun lt!427501 () tuple2!23156)

(declare-datatypes ((Unit!20507 0))(
  ( (Unit!20508) )
))
(declare-fun lt!427500 () Unit!20507)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17631 (_ BitVec 64) Bool) Unit!20507)

(assert (=> b!294405 (= lt!427500 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12912 lt!427501)))))

(declare-fun e!210423 () Bool)

(assert (=> b!294405 e!210423))

(declare-fun res!243106 () Bool)

(assert (=> b!294405 (=> (not res!243106) (not e!210423))))

(declare-fun thiss!1728 () BitStream!13286)

(declare-fun to!474 () (_ BitVec 64))

(declare-datatypes ((tuple3!1798 0))(
  ( (tuple3!1799 (_1!12913 Unit!20507) (_2!12913 BitStream!13286) (_3!1334 array!17631)) )
))
(declare-fun lt!427505 () tuple3!1798)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294405 (= res!243106 (= (bvsub (bvadd (bitIndex!0 (size!7641 (buf!7704 thiss!1728)) (currentByte!14195 thiss!1728) (currentBit!14190 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7641 (buf!7704 (_2!12913 lt!427505))) (currentByte!14195 (_2!12913 lt!427505)) (currentBit!14190 (_2!12913 lt!427505)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13286 (_ BitVec 64) array!17631 (_ BitVec 64) (_ BitVec 64)) tuple3!1798)

(assert (=> b!294405 (= lt!427505 (readBitsLoop!0 (_2!12912 lt!427501) nBits!523 lt!427504 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294405 (validate_offset_bits!1 ((_ sign_extend 32) (size!7641 (buf!7704 (_2!12912 lt!427501)))) ((_ sign_extend 32) (currentByte!14195 (_2!12912 lt!427501))) ((_ sign_extend 32) (currentBit!14190 (_2!12912 lt!427501))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427502 () Unit!20507)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13286 BitStream!13286 (_ BitVec 64) (_ BitVec 64)) Unit!20507)

(assert (=> b!294405 (= lt!427502 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12912 lt!427501) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427506 () (_ BitVec 32))

(declare-fun lt!427503 () (_ BitVec 32))

(assert (=> b!294405 (= lt!427504 (array!17632 (store (arr!8676 arr!273) lt!427503 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8676 arr!273) lt!427503)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427506)))) ((_ sign_extend 24) (ite (_1!12912 lt!427501) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427506) #b00000000))))) (size!7641 arr!273)))))

(assert (=> b!294405 (= lt!427506 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294405 (= lt!427503 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13286) tuple2!23156)

(assert (=> b!294405 (= lt!427501 (readBit!0 thiss!1728))))

(declare-fun b!294406 () Bool)

(declare-fun e!210425 () Bool)

(declare-fun array_inv!7253 (array!17631) Bool)

(assert (=> b!294406 (= e!210425 (array_inv!7253 (buf!7704 thiss!1728)))))

(declare-fun b!294407 () Bool)

(declare-fun e!210424 () Bool)

(assert (=> b!294407 (= e!210429 e!210424)))

(declare-fun res!243107 () Bool)

(assert (=> b!294407 (=> res!243107 e!210424)))

(declare-fun lt!427499 () (_ BitVec 64))

(assert (=> b!294407 (= res!243107 (or (bvsgt from!505 lt!427499) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!427499)))))

(assert (=> b!294407 (= lt!427499 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7641 arr!273))))))

(declare-fun b!294408 () Bool)

(assert (=> b!294408 (= e!210424 (arrayBitRangesEq!0 lt!427504 (_3!1334 lt!427505) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!294409 () Bool)

(declare-fun res!243105 () Bool)

(assert (=> b!294409 (=> (not res!243105) (not e!210428))))

(assert (=> b!294409 (= res!243105 (bvslt from!505 to!474))))

(declare-fun b!294410 () Bool)

(declare-fun res!243104 () Bool)

(assert (=> b!294410 (=> (not res!243104) (not e!210428))))

(assert (=> b!294410 (= res!243104 (validate_offset_bits!1 ((_ sign_extend 32) (size!7641 (buf!7704 thiss!1728))) ((_ sign_extend 32) (currentByte!14195 thiss!1728)) ((_ sign_extend 32) (currentBit!14190 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294411 () Bool)

(assert (=> b!294411 (= e!210423 (and (= (buf!7704 thiss!1728) (buf!7704 (_2!12913 lt!427505))) (= (size!7641 arr!273) (size!7641 (_3!1334 lt!427505)))))))

(declare-fun res!243103 () Bool)

(assert (=> start!65648 (=> (not res!243103) (not e!210428))))

(assert (=> start!65648 (= res!243103 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7641 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65648 e!210428))

(declare-fun inv!12 (BitStream!13286) Bool)

(assert (=> start!65648 (and (inv!12 thiss!1728) e!210425)))

(assert (=> start!65648 true))

(assert (=> start!65648 (array_inv!7253 arr!273)))

(assert (= (and start!65648 res!243103) b!294410))

(assert (= (and b!294410 res!243104) b!294409))

(assert (= (and b!294409 res!243105) b!294405))

(assert (= (and b!294405 res!243106) b!294411))

(assert (= (and b!294405 (not res!243102)) b!294407))

(assert (= (and b!294407 (not res!243107)) b!294408))

(assert (= start!65648 b!294406))

(declare-fun m!430679 () Bool)

(assert (=> b!294408 m!430679))

(declare-fun m!430681 () Bool)

(assert (=> b!294406 m!430681))

(declare-fun m!430683 () Bool)

(assert (=> b!294405 m!430683))

(declare-fun m!430685 () Bool)

(assert (=> b!294405 m!430685))

(declare-fun m!430687 () Bool)

(assert (=> b!294405 m!430687))

(declare-fun m!430689 () Bool)

(assert (=> b!294405 m!430689))

(declare-fun m!430691 () Bool)

(assert (=> b!294405 m!430691))

(declare-fun m!430693 () Bool)

(assert (=> b!294405 m!430693))

(declare-fun m!430695 () Bool)

(assert (=> b!294405 m!430695))

(declare-fun m!430697 () Bool)

(assert (=> b!294405 m!430697))

(declare-fun m!430699 () Bool)

(assert (=> b!294405 m!430699))

(declare-fun m!430701 () Bool)

(assert (=> b!294405 m!430701))

(declare-fun m!430703 () Bool)

(assert (=> b!294405 m!430703))

(declare-fun m!430705 () Bool)

(assert (=> start!65648 m!430705))

(declare-fun m!430707 () Bool)

(assert (=> start!65648 m!430707))

(declare-fun m!430709 () Bool)

(assert (=> b!294410 m!430709))

(push 1)

(assert (not b!294410))

(assert (not b!294408))

(assert (not b!294405))

(assert (not start!65648))

(assert (not b!294406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99350 () Bool)

(assert (=> d!99350 (= (array_inv!7253 (buf!7704 thiss!1728)) (bvsge (size!7641 (buf!7704 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!294406 d!99350))

(declare-fun lt!427894 () tuple3!1798)

(declare-fun b!294555 () Bool)

(declare-fun e!210527 () Bool)

(declare-datatypes ((List!977 0))(
  ( (Nil!974) (Cons!973 (h!1092 Bool) (t!1862 List!977)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13286 array!17631 (_ BitVec 64) (_ BitVec 64)) List!977)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13286 BitStream!13286 (_ BitVec 64)) List!977)

(assert (=> b!294555 (= e!210527 (= (byteArrayBitContentToList!0 (_2!12913 lt!427894) (_3!1334 lt!427894) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12913 lt!427894) (_2!12912 lt!427501) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!294555 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!294555 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!427895 () (_ BitVec 64))

(declare-fun lt!427917 () (_ BitVec 64))

(declare-fun call!5025 () Bool)

(declare-fun bm!5021 () Bool)

(declare-fun lt!427897 () array!17631)

(declare-fun c!13423 () Bool)

(declare-fun lt!427904 () array!17631)

(declare-fun lt!427892 () tuple3!1798)

(assert (=> bm!5021 (= call!5025 (arrayBitRangesEq!0 (ite c!13423 lt!427504 lt!427904) (ite c!13423 (_3!1334 lt!427892) lt!427897) (ite c!13423 #b0000000000000000000000000000000000000000000000000000000000000000 lt!427895) (ite c!13423 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!427917)))))

(declare-fun b!294556 () Bool)

(declare-fun res!243219 () Bool)

(assert (=> b!294556 (=> (not res!243219) (not e!210527))))

(assert (=> b!294556 (= res!243219 (arrayBitRangesEq!0 lt!427504 (_3!1334 lt!427894) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!294557 () Bool)

(declare-fun e!210525 () Bool)

(assert (=> b!294557 (= e!210525 (and (= (buf!7704 (_2!12912 lt!427501)) (buf!7704 (_2!12913 lt!427892))) (= (size!7641 lt!427504) (size!7641 (_3!1334 lt!427892)))))))

(declare-fun bm!5022 () Bool)

(declare-fun lt!427915 () (_ BitVec 64))

(declare-fun call!5024 () Bool)

(assert (=> bm!5022 (= call!5024 (arrayBitRangesEq!0 lt!427504 (ite c!13423 (_3!1334 lt!427892) lt!427504) (ite c!13423 lt!427915 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!13423 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7641 lt!427504)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!210526 () Bool)

(declare-fun b!294558 () Bool)

(declare-fun bitAt!0 (array!17631 (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!23164 0))(
  ( (tuple2!23165 (_1!12919 BitStream!13286) (_2!12919 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13286) tuple2!23164)

(assert (=> b!294558 (= e!210526 (= (bitAt!0 (_3!1334 lt!427894) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12919 (readBitPure!0 (_2!12912 lt!427501)))))))

(declare-fun e!210524 () tuple3!1798)

(declare-fun b!294559 () Bool)

(declare-fun lt!427898 () Unit!20507)

(assert (=> b!294559 (= e!210524 (tuple3!1799 lt!427898 (_2!12912 lt!427501) lt!427504))))

(declare-fun lt!427893 () Unit!20507)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17631) Unit!20507)

(assert (=> b!294559 (= lt!427893 (arrayBitRangesEqReflexiveLemma!0 lt!427504))))

(assert (=> b!294559 call!5024))

(declare-fun lt!427890 () Unit!20507)

(assert (=> b!294559 (= lt!427890 lt!427893)))

(assert (=> b!294559 (= lt!427904 lt!427504)))

(assert (=> b!294559 (= lt!427897 lt!427504)))

(declare-fun lt!427902 () (_ BitVec 64))

(assert (=> b!294559 (= lt!427902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427916 () (_ BitVec 64))

(assert (=> b!294559 (= lt!427916 ((_ sign_extend 32) (size!7641 lt!427504)))))

(declare-fun lt!427920 () (_ BitVec 64))

(assert (=> b!294559 (= lt!427920 (bvmul lt!427916 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!294559 (= lt!427895 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!294559 (= lt!427917 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17631 array!17631 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20507)

(assert (=> b!294559 (= lt!427898 (arrayBitRangesEqSlicedLemma!0 lt!427904 lt!427897 lt!427902 lt!427920 lt!427895 lt!427917))))

(assert (=> b!294559 call!5025))

(declare-fun b!294560 () Bool)

(declare-fun res!243222 () Bool)

(assert (=> b!294560 (=> (not res!243222) (not e!210527))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!294560 (= res!243222 (invariant!0 (currentBit!14190 (_2!12913 lt!427894)) (currentByte!14195 (_2!12913 lt!427894)) (size!7641 (buf!7704 (_2!12913 lt!427894)))))))

(declare-fun b!294562 () Bool)

(declare-fun res!243224 () Bool)

(assert (=> b!294562 (=> (not res!243224) (not e!210527))))

(assert (=> b!294562 (= res!243224 e!210526)))

(declare-fun res!243223 () Bool)

(assert (=> b!294562 (=> res!243223 e!210526)))

(assert (=> b!294562 (= res!243223 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!294563 () Bool)

(declare-fun lt!427918 () Unit!20507)

(assert (=> b!294563 (= e!210524 (tuple3!1799 lt!427918 (_2!12913 lt!427892) (_3!1334 lt!427892)))))

(declare-fun lt!427905 () tuple2!23156)

(assert (=> b!294563 (= lt!427905 (readBit!0 (_2!12912 lt!427501)))))

(declare-fun lt!427913 () (_ BitVec 32))

(assert (=> b!294563 (= lt!427913 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427911 () (_ BitVec 32))

(assert (=> b!294563 (= lt!427911 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427891 () array!17631)

(assert (=> b!294563 (= lt!427891 (array!17632 (store (arr!8676 lt!427504) lt!427913 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8676 lt!427504) lt!427913)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427911)))) ((_ sign_extend 24) (ite (_1!12912 lt!427905) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427911) #b00000000))))) (size!7641 lt!427504)))))

(declare-fun lt!427907 () (_ BitVec 64))

(assert (=> b!294563 (= lt!427907 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!427889 () (_ BitVec 64))

(assert (=> b!294563 (= lt!427889 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!427919 () Unit!20507)

(assert (=> b!294563 (= lt!427919 (validateOffsetBitsIneqLemma!0 (_2!12912 lt!427501) (_2!12912 lt!427905) lt!427907 lt!427889))))

(assert (=> b!294563 (validate_offset_bits!1 ((_ sign_extend 32) (size!7641 (buf!7704 (_2!12912 lt!427905)))) ((_ sign_extend 32) (currentByte!14195 (_2!12912 lt!427905))) ((_ sign_extend 32) (currentBit!14190 (_2!12912 lt!427905))) (bvsub lt!427907 lt!427889))))

(declare-fun lt!427908 () Unit!20507)

(assert (=> b!294563 (= lt!427908 lt!427919)))

(assert (=> b!294563 (= lt!427892 (readBitsLoop!0 (_2!12912 lt!427905) nBits!523 lt!427891 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!243221 () Bool)

(assert (=> b!294563 (= res!243221 (= (bvsub (bvadd (bitIndex!0 (size!7641 (buf!7704 (_2!12912 lt!427501))) (currentByte!14195 (_2!12912 lt!427501)) (currentBit!14190 (_2!12912 lt!427501))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7641 (buf!7704 (_2!12913 lt!427892))) (currentByte!14195 (_2!12913 lt!427892)) (currentBit!14190 (_2!12913 lt!427892)))))))

(assert (=> b!294563 (=> (not res!243221) (not e!210525))))

(assert (=> b!294563 e!210525))

(declare-fun lt!427903 () Unit!20507)

(declare-fun Unit!20517 () Unit!20507)

(assert (=> b!294563 (= lt!427903 Unit!20517)))

(declare-fun lt!427906 () (_ BitVec 32))

(assert (=> b!294563 (= lt!427906 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427900 () (_ BitVec 32))

(assert (=> b!294563 (= lt!427900 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427923 () Unit!20507)

(assert (=> b!294563 (= lt!427923 (arrayBitRangesUpdatedAtLemma!0 lt!427504 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12912 lt!427905)))))

(assert (=> b!294563 (arrayBitRangesEq!0 lt!427504 (array!17632 (store (arr!8676 lt!427504) lt!427906 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8676 lt!427504) lt!427906)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427900)))) ((_ sign_extend 24) (ite (_1!12912 lt!427905) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427900) #b00000000))))) (size!7641 lt!427504)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!427910 () Unit!20507)

(assert (=> b!294563 (= lt!427910 lt!427923)))

(assert (=> b!294563 (= lt!427915 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427899 () Unit!20507)

(declare-fun arrayBitRangesEqTransitive!0 (array!17631 array!17631 array!17631 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20507)

(assert (=> b!294563 (= lt!427899 (arrayBitRangesEqTransitive!0 lt!427504 lt!427891 (_3!1334 lt!427892) lt!427915 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!294563 call!5024))

(declare-fun lt!427909 () Unit!20507)

(assert (=> b!294563 (= lt!427909 lt!427899)))

(assert (=> b!294563 call!5025))

(declare-fun lt!427914 () Unit!20507)

(declare-fun Unit!20518 () Unit!20507)

(assert (=> b!294563 (= lt!427914 Unit!20518)))

(declare-fun lt!427896 () Unit!20507)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17631 array!17631 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20507)

(assert (=> b!294563 (= lt!427896 (arrayBitRangesEqImpliesEq!0 lt!427891 (_3!1334 lt!427892) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!294563 (= (bitAt!0 lt!427891 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1334 lt!427892) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!427922 () Unit!20507)

(assert (=> b!294563 (= lt!427922 lt!427896)))

(declare-fun lt!427912 () Unit!20507)

(declare-fun Unit!20519 () Unit!20507)

(assert (=> b!294563 (= lt!427912 Unit!20519)))

(declare-fun lt!427901 () Bool)

(assert (=> b!294563 (= lt!427901 (= (bitAt!0 (_3!1334 lt!427892) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12912 lt!427905)))))

(declare-fun Unit!20520 () Unit!20507)

(assert (=> b!294563 (= lt!427918 Unit!20520)))

(assert (=> b!294563 lt!427901))

(declare-fun b!294561 () Bool)

(declare-fun res!243220 () Bool)

(assert (=> b!294561 (=> (not res!243220) (not e!210527))))

(assert (=> b!294561 (= res!243220 (and (= (buf!7704 (_2!12912 lt!427501)) (buf!7704 (_2!12913 lt!427894))) (= (size!7641 lt!427504) (size!7641 (_3!1334 lt!427894)))))))

(declare-fun d!99352 () Bool)

(assert (=> d!99352 e!210527))

(declare-fun res!243225 () Bool)

(assert (=> d!99352 (=> (not res!243225) (not e!210527))))

(declare-fun lt!427888 () (_ BitVec 64))

(assert (=> d!99352 (= res!243225 (= (bvsub lt!427888 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7641 (buf!7704 (_2!12913 lt!427894))) (currentByte!14195 (_2!12913 lt!427894)) (currentBit!14190 (_2!12913 lt!427894)))))))

(assert (=> d!99352 (or (= (bvand lt!427888 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!427888 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!427888 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!427921 () (_ BitVec 64))

(assert (=> d!99352 (= lt!427888 (bvadd lt!427921 to!474))))

(assert (=> d!99352 (or (not (= (bvand lt!427921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!427921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!427921 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99352 (= lt!427921 (bitIndex!0 (size!7641 (buf!7704 (_2!12912 lt!427501))) (currentByte!14195 (_2!12912 lt!427501)) (currentBit!14190 (_2!12912 lt!427501))))))

(assert (=> d!99352 (= lt!427894 e!210524)))

(assert (=> d!99352 (= c!13423 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99352 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99352 (= (readBitsLoop!0 (_2!12912 lt!427501) nBits!523 lt!427504 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!427894)))

(assert (= (and d!99352 c!13423) b!294563))

(assert (= (and d!99352 (not c!13423)) b!294559))

(assert (= (and b!294563 res!243221) b!294557))

(assert (= (or b!294563 b!294559) bm!5021))

(assert (= (or b!294563 b!294559) bm!5022))

(assert (= (and d!99352 res!243225) b!294561))

(assert (= (and b!294561 res!243220) b!294556))

(assert (= (and b!294556 res!243219) b!294562))

(assert (= (and b!294562 (not res!243223)) b!294558))

(assert (= (and b!294562 res!243224) b!294560))

(assert (= (and b!294560 res!243222) b!294555))

(declare-fun m!430921 () Bool)

(assert (=> d!99352 m!430921))

(declare-fun m!430923 () Bool)

(assert (=> d!99352 m!430923))

(declare-fun m!430925 () Bool)

(assert (=> bm!5021 m!430925))

(declare-fun m!430927 () Bool)

(assert (=> b!294558 m!430927))

(declare-fun m!430929 () Bool)

(assert (=> b!294558 m!430929))

(declare-fun m!430931 () Bool)

(assert (=> bm!5022 m!430931))

(declare-fun m!430933 () Bool)

(assert (=> b!294555 m!430933))

(declare-fun m!430935 () Bool)

(assert (=> b!294555 m!430935))

(assert (=> b!294563 m!430923))

(declare-fun m!430937 () Bool)

(assert (=> b!294563 m!430937))

(declare-fun m!430939 () Bool)

(assert (=> b!294563 m!430939))

(declare-fun m!430941 () Bool)

(assert (=> b!294563 m!430941))

(declare-fun m!430943 () Bool)

(assert (=> b!294563 m!430943))

(declare-fun m!430945 () Bool)

(assert (=> b!294563 m!430945))

(declare-fun m!430947 () Bool)

(assert (=> b!294563 m!430947))

(declare-fun m!430949 () Bool)

(assert (=> b!294563 m!430949))

(declare-fun m!430951 () Bool)

(assert (=> b!294563 m!430951))

(declare-fun m!430953 () Bool)

(assert (=> b!294563 m!430953))

(declare-fun m!430955 () Bool)

(assert (=> b!294563 m!430955))

(declare-fun m!430957 () Bool)

(assert (=> b!294563 m!430957))

(declare-fun m!430959 () Bool)

(assert (=> b!294563 m!430959))

(declare-fun m!430961 () Bool)

(assert (=> b!294563 m!430961))

(declare-fun m!430963 () Bool)

(assert (=> b!294563 m!430963))

(declare-fun m!430965 () Bool)

(assert (=> b!294563 m!430965))

(declare-fun m!430967 () Bool)

(assert (=> b!294563 m!430967))

(declare-fun m!430969 () Bool)

(assert (=> b!294563 m!430969))

(declare-fun m!430971 () Bool)

(assert (=> b!294556 m!430971))

(declare-fun m!430973 () Bool)

(assert (=> b!294560 m!430973))

(declare-fun m!430975 () Bool)

(assert (=> b!294559 m!430975))

(declare-fun m!430977 () Bool)

(assert (=> b!294559 m!430977))

(assert (=> b!294405 d!99352))

(declare-fun d!99370 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99370 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7641 (buf!7704 (_2!12912 lt!427501)))) ((_ sign_extend 32) (currentByte!14195 (_2!12912 lt!427501))) ((_ sign_extend 32) (currentBit!14190 (_2!12912 lt!427501))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7641 (buf!7704 (_2!12912 lt!427501)))) ((_ sign_extend 32) (currentByte!14195 (_2!12912 lt!427501))) ((_ sign_extend 32) (currentBit!14190 (_2!12912 lt!427501)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25409 () Bool)

(assert (= bs!25409 d!99370))

(declare-fun m!430979 () Bool)

(assert (=> bs!25409 m!430979))

(assert (=> b!294405 d!99370))

(declare-fun d!99372 () Bool)

(declare-fun e!210533 () Bool)

(assert (=> d!99372 e!210533))

(declare-fun res!243234 () Bool)

(assert (=> d!99372 (=> (not res!243234) (not e!210533))))

(assert (=> d!99372 (= res!243234 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!427944 () Unit!20507)

(declare-fun choose!27 (BitStream!13286 BitStream!13286 (_ BitVec 64) (_ BitVec 64)) Unit!20507)

(assert (=> d!99372 (= lt!427944 (choose!27 thiss!1728 (_2!12912 lt!427501) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99372 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99372 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12912 lt!427501) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!427944)))

(declare-fun b!294572 () Bool)

(assert (=> b!294572 (= e!210533 (validate_offset_bits!1 ((_ sign_extend 32) (size!7641 (buf!7704 (_2!12912 lt!427501)))) ((_ sign_extend 32) (currentByte!14195 (_2!12912 lt!427501))) ((_ sign_extend 32) (currentBit!14190 (_2!12912 lt!427501))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99372 res!243234) b!294572))

(declare-fun m!430981 () Bool)

(assert (=> d!99372 m!430981))

(assert (=> b!294572 m!430693))

(assert (=> b!294405 d!99372))

(declare-fun b!294597 () Bool)

(declare-fun e!210561 () Bool)

(declare-fun call!5029 () Bool)

(assert (=> b!294597 (= e!210561 call!5029)))

(declare-fun b!294598 () Bool)

(declare-fun e!210564 () Bool)

(declare-fun e!210559 () Bool)

(assert (=> b!294598 (= e!210564 e!210559)))

(declare-fun res!243254 () Bool)

(assert (=> b!294598 (=> (not res!243254) (not e!210559))))

(declare-fun e!210562 () Bool)

(assert (=> b!294598 (= res!243254 e!210562)))

(declare-fun res!243253 () Bool)

(assert (=> b!294598 (=> res!243253 e!210562)))

(declare-datatypes ((tuple4!874 0))(
  ( (tuple4!875 (_1!12921 (_ BitVec 32)) (_2!12921 (_ BitVec 32)) (_3!1337 (_ BitVec 32)) (_4!437 (_ BitVec 32))) )
))
(declare-fun lt!427976 () tuple4!874)

(assert (=> b!294598 (= res!243253 (bvsge (_1!12921 lt!427976) (_2!12921 lt!427976)))))

(declare-fun lt!427975 () (_ BitVec 32))

(assert (=> b!294598 (= lt!427975 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427977 () (_ BitVec 32))

(assert (=> b!294598 (= lt!427977 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!874)

(assert (=> b!294598 (= lt!427976 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!294599 () Bool)

(declare-fun res!243256 () Bool)

(assert (=> b!294599 (= res!243256 (= lt!427975 #b00000000000000000000000000000000))))

(declare-fun e!210560 () Bool)

(assert (=> b!294599 (=> res!243256 e!210560)))

(declare-fun e!210563 () Bool)

(assert (=> b!294599 (= e!210563 e!210560)))

(declare-fun b!294600 () Bool)

(assert (=> b!294600 (= e!210559 e!210561)))

(declare-fun c!13427 () Bool)

(assert (=> b!294600 (= c!13427 (= (_3!1337 lt!427976) (_4!437 lt!427976)))))

(declare-fun b!294601 () Bool)

(declare-fun arrayRangesEq!1495 (array!17631 array!17631 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!294601 (= e!210562 (arrayRangesEq!1495 arr!273 lt!427504 (_1!12921 lt!427976) (_2!12921 lt!427976)))))

(declare-fun b!294602 () Bool)

(assert (=> b!294602 (= e!210561 e!210563)))

(declare-fun res!243255 () Bool)

(assert (=> b!294602 (= res!243255 call!5029)))

(assert (=> b!294602 (=> (not res!243255) (not e!210563))))

(declare-fun d!99374 () Bool)

(declare-fun res!243257 () Bool)

(assert (=> d!99374 (=> res!243257 e!210564)))

(assert (=> d!99374 (= res!243257 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99374 (= (arrayBitRangesEq!0 arr!273 lt!427504 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!210564)))

(declare-fun b!294603 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!294603 (= e!210560 (byteRangesEq!0 (select (arr!8676 arr!273) (_4!437 lt!427976)) (select (arr!8676 lt!427504) (_4!437 lt!427976)) #b00000000000000000000000000000000 lt!427975))))

(declare-fun bm!5026 () Bool)

(assert (=> bm!5026 (= call!5029 (byteRangesEq!0 (select (arr!8676 arr!273) (_3!1337 lt!427976)) (select (arr!8676 lt!427504) (_3!1337 lt!427976)) lt!427977 (ite c!13427 lt!427975 #b00000000000000000000000000001000)))))

(assert (= (and d!99374 (not res!243257)) b!294598))

(assert (= (and b!294598 (not res!243253)) b!294601))

(assert (= (and b!294598 res!243254) b!294600))

(assert (= (and b!294600 c!13427) b!294597))

(assert (= (and b!294600 (not c!13427)) b!294602))

(assert (= (and b!294602 res!243255) b!294599))

(assert (= (and b!294599 (not res!243256)) b!294603))

(assert (= (or b!294597 b!294602) bm!5026))

(declare-fun m!431009 () Bool)

(assert (=> b!294598 m!431009))

(declare-fun m!431011 () Bool)

(assert (=> b!294601 m!431011))

(declare-fun m!431013 () Bool)

(assert (=> b!294603 m!431013))

(declare-fun m!431015 () Bool)

(assert (=> b!294603 m!431015))

(assert (=> b!294603 m!431013))

(assert (=> b!294603 m!431015))

(declare-fun m!431017 () Bool)

(assert (=> b!294603 m!431017))

(declare-fun m!431019 () Bool)

(assert (=> bm!5026 m!431019))

(declare-fun m!431021 () Bool)

(assert (=> bm!5026 m!431021))

(assert (=> bm!5026 m!431019))

(assert (=> bm!5026 m!431021))

(declare-fun m!431023 () Bool)

(assert (=> bm!5026 m!431023))

(assert (=> b!294405 d!99374))

(declare-fun d!99380 () Bool)

(declare-fun e!210571 () Bool)

(assert (=> d!99380 e!210571))

(declare-fun res!243267 () Bool)

(assert (=> d!99380 (=> (not res!243267) (not e!210571))))

(declare-fun lt!428003 () (_ BitVec 64))

(declare-fun lt!428001 () (_ BitVec 64))

(declare-fun lt!427999 () (_ BitVec 64))

(assert (=> d!99380 (= res!243267 (= lt!428001 (bvsub lt!428003 lt!427999)))))

(assert (=> d!99380 (or (= (bvand lt!428003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!427999 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!428003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!428003 lt!427999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99380 (= lt!427999 (remainingBits!0 ((_ sign_extend 32) (size!7641 (buf!7704 thiss!1728))) ((_ sign_extend 32) (currentByte!14195 thiss!1728)) ((_ sign_extend 32) (currentBit!14190 thiss!1728))))))

(declare-fun lt!428000 () (_ BitVec 64))

(declare-fun lt!428002 () (_ BitVec 64))

(assert (=> d!99380 (= lt!428003 (bvmul lt!428000 lt!428002))))

(assert (=> d!99380 (or (= lt!428000 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!428002 (bvsdiv (bvmul lt!428000 lt!428002) lt!428000)))))

(assert (=> d!99380 (= lt!428002 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99380 (= lt!428000 ((_ sign_extend 32) (size!7641 (buf!7704 thiss!1728))))))

(assert (=> d!99380 (= lt!428001 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14195 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14190 thiss!1728))))))

(assert (=> d!99380 (invariant!0 (currentBit!14190 thiss!1728) (currentByte!14195 thiss!1728) (size!7641 (buf!7704 thiss!1728)))))

(assert (=> d!99380 (= (bitIndex!0 (size!7641 (buf!7704 thiss!1728)) (currentByte!14195 thiss!1728) (currentBit!14190 thiss!1728)) lt!428001)))

(declare-fun b!294613 () Bool)

(declare-fun res!243268 () Bool)

(assert (=> b!294613 (=> (not res!243268) (not e!210571))))

(assert (=> b!294613 (= res!243268 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!428001))))

(declare-fun b!294614 () Bool)

(declare-fun lt!428004 () (_ BitVec 64))

(assert (=> b!294614 (= e!210571 (bvsle lt!428001 (bvmul lt!428004 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294614 (or (= lt!428004 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!428004 #b0000000000000000000000000000000000000000000000000000000000001000) lt!428004)))))

(assert (=> b!294614 (= lt!428004 ((_ sign_extend 32) (size!7641 (buf!7704 thiss!1728))))))

(assert (= (and d!99380 res!243267) b!294613))

(assert (= (and b!294613 res!243268) b!294614))

(declare-fun m!431033 () Bool)

(assert (=> d!99380 m!431033))

(declare-fun m!431035 () Bool)

(assert (=> d!99380 m!431035))

(assert (=> b!294405 d!99380))

(declare-fun d!99386 () Bool)

(declare-fun e!210572 () Bool)

(assert (=> d!99386 e!210572))

(declare-fun res!243269 () Bool)

(assert (=> d!99386 (=> (not res!243269) (not e!210572))))

(declare-fun lt!428007 () (_ BitVec 64))

(declare-fun lt!428005 () (_ BitVec 64))

(declare-fun lt!428009 () (_ BitVec 64))

(assert (=> d!99386 (= res!243269 (= lt!428007 (bvsub lt!428009 lt!428005)))))

(assert (=> d!99386 (or (= (bvand lt!428009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!428005 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!428009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!428009 lt!428005) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99386 (= lt!428005 (remainingBits!0 ((_ sign_extend 32) (size!7641 (buf!7704 (_2!12913 lt!427505)))) ((_ sign_extend 32) (currentByte!14195 (_2!12913 lt!427505))) ((_ sign_extend 32) (currentBit!14190 (_2!12913 lt!427505)))))))

(declare-fun lt!428006 () (_ BitVec 64))

(declare-fun lt!428008 () (_ BitVec 64))

(assert (=> d!99386 (= lt!428009 (bvmul lt!428006 lt!428008))))

(assert (=> d!99386 (or (= lt!428006 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!428008 (bvsdiv (bvmul lt!428006 lt!428008) lt!428006)))))

(assert (=> d!99386 (= lt!428008 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99386 (= lt!428006 ((_ sign_extend 32) (size!7641 (buf!7704 (_2!12913 lt!427505)))))))

(assert (=> d!99386 (= lt!428007 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14195 (_2!12913 lt!427505))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14190 (_2!12913 lt!427505)))))))

(assert (=> d!99386 (invariant!0 (currentBit!14190 (_2!12913 lt!427505)) (currentByte!14195 (_2!12913 lt!427505)) (size!7641 (buf!7704 (_2!12913 lt!427505))))))

(assert (=> d!99386 (= (bitIndex!0 (size!7641 (buf!7704 (_2!12913 lt!427505))) (currentByte!14195 (_2!12913 lt!427505)) (currentBit!14190 (_2!12913 lt!427505))) lt!428007)))

(declare-fun b!294615 () Bool)

(declare-fun res!243270 () Bool)

(assert (=> b!294615 (=> (not res!243270) (not e!210572))))

(assert (=> b!294615 (= res!243270 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!428007))))

(declare-fun b!294616 () Bool)

(declare-fun lt!428010 () (_ BitVec 64))

(assert (=> b!294616 (= e!210572 (bvsle lt!428007 (bvmul lt!428010 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294616 (or (= lt!428010 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!428010 #b0000000000000000000000000000000000000000000000000000000000001000) lt!428010)))))

(assert (=> b!294616 (= lt!428010 ((_ sign_extend 32) (size!7641 (buf!7704 (_2!12913 lt!427505)))))))

(assert (= (and d!99386 res!243269) b!294615))

(assert (= (and b!294615 res!243270) b!294616))

(declare-fun m!431037 () Bool)

(assert (=> d!99386 m!431037))

(declare-fun m!431039 () Bool)

(assert (=> d!99386 m!431039))

(assert (=> b!294405 d!99386))

(declare-fun d!99388 () Bool)

(declare-fun e!210575 () Bool)

(assert (=> d!99388 e!210575))

(declare-fun res!243273 () Bool)

(assert (=> d!99388 (=> (not res!243273) (not e!210575))))

(declare-fun lt!428022 () (_ BitVec 32))

(assert (=> d!99388 (= res!243273 (and (bvsge lt!428022 #b00000000000000000000000000000000) (bvslt lt!428022 (size!7641 arr!273))))))

(declare-fun lt!428021 () (_ BitVec 8))

(declare-fun lt!428020 () (_ BitVec 32))

(declare-fun lt!428019 () Unit!20507)

(declare-fun choose!53 (array!17631 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20507)

(assert (=> d!99388 (= lt!428019 (choose!53 arr!273 from!505 (_1!12912 lt!427501) lt!428022 lt!428020 lt!428021))))

(assert (=> d!99388 (= lt!428021 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8676 arr!273) lt!428022)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428020)))) ((_ sign_extend 24) (ite (_1!12912 lt!427501) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428020) #b00000000)))))))

(assert (=> d!99388 (= lt!428020 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99388 (= lt!428022 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99388 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12912 lt!427501)) lt!428019)))

(declare-fun b!294620 () Bool)

(assert (=> b!294620 (= e!210575 (arrayBitRangesEq!0 arr!273 (array!17632 (store (arr!8676 arr!273) lt!428022 lt!428021) (size!7641 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99388 res!243273) b!294620))

(declare-fun m!431041 () Bool)

(assert (=> d!99388 m!431041))

(declare-fun m!431043 () Bool)

(assert (=> d!99388 m!431043))

(declare-fun m!431045 () Bool)

(assert (=> d!99388 m!431045))

(declare-fun m!431047 () Bool)

(assert (=> b!294620 m!431047))

(declare-fun m!431049 () Bool)

(assert (=> b!294620 m!431049))

(assert (=> b!294405 d!99388))

(declare-fun d!99390 () Bool)

(declare-fun e!210582 () Bool)

(assert (=> d!99390 e!210582))

(declare-fun res!243276 () Bool)

(assert (=> d!99390 (=> (not res!243276) (not e!210582))))

(declare-datatypes ((tuple2!23168 0))(
  ( (tuple2!23169 (_1!12922 Unit!20507) (_2!12922 BitStream!13286)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13286) tuple2!23168)

(assert (=> d!99390 (= res!243276 (= (buf!7704 (_2!12922 (increaseBitIndex!0 thiss!1728))) (buf!7704 thiss!1728)))))

(declare-fun lt!428041 () Bool)

(assert (=> d!99390 (= lt!428041 (not (= (bvand ((_ sign_extend 24) (select (arr!8676 (buf!7704 thiss!1728)) (currentByte!14195 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14190 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!428038 () tuple2!23156)

(assert (=> d!99390 (= lt!428038 (tuple2!23157 (not (= (bvand ((_ sign_extend 24) (select (arr!8676 (buf!7704 thiss!1728)) (currentByte!14195 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14190 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12922 (increaseBitIndex!0 thiss!1728))))))

