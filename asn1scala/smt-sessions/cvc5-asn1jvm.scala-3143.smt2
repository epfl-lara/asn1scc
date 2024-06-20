; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72146 () Bool)

(assert start!72146)

(declare-fun b!323507 () Bool)

(declare-fun e!233059 () Bool)

(declare-fun e!233061 () Bool)

(assert (=> b!323507 (= e!233059 e!233061)))

(declare-fun res!265566 () Bool)

(assert (=> b!323507 (=> (not res!265566) (not e!233061))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((array!20677 0))(
  ( (array!20678 (arr!10093 (Array (_ BitVec 32) (_ BitVec 8))) (size!9001 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14164 0))(
  ( (BitStream!14165 (buf!8143 array!20677) (currentByte!15014 (_ BitVec 32)) (currentBit!15009 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14164)

(declare-datatypes ((tuple2!23684 0))(
  ( (tuple2!23685 (_1!13471 Bool) (_2!13471 BitStream!14164)) )
))
(declare-fun lt!445945 () tuple2!23684)

(declare-datatypes ((tuple2!23686 0))(
  ( (tuple2!23687 (_1!13472 (_ BitVec 64)) (_2!13472 BitStream!14164)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23686)

(assert (=> b!323507 (= res!265566 (= (buf!8143 (_2!13472 (readNBitsLSBFirstsLoop!0 (_2!13471 lt!445945) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13471 lt!445945) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!8143 thiss!1793)))))

(declare-fun readBit!0 (BitStream!14164) tuple2!23684)

(assert (=> b!323507 (= lt!445945 (readBit!0 thiss!1793))))

(declare-fun res!265570 () Bool)

(declare-fun e!233058 () Bool)

(assert (=> start!72146 (=> (not res!265570) (not e!233058))))

(assert (=> start!72146 (= res!265570 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72146 e!233058))

(assert (=> start!72146 true))

(declare-fun e!233060 () Bool)

(declare-fun inv!12 (BitStream!14164) Bool)

(assert (=> start!72146 (and (inv!12 thiss!1793) e!233060)))

(declare-fun b!323508 () Bool)

(declare-fun array_inv!8553 (array!20677) Bool)

(assert (=> b!323508 (= e!233060 (array_inv!8553 (buf!8143 thiss!1793)))))

(declare-fun b!323509 () Bool)

(declare-fun res!265569 () Bool)

(assert (=> b!323509 (=> (not res!265569) (not e!233059))))

(assert (=> b!323509 (= res!265569 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun lt!445946 () (_ BitVec 64))

(declare-fun lt!445944 () (_ BitVec 64))

(declare-fun b!323510 () Bool)

(declare-fun lt!445943 () (_ BitVec 64))

(assert (=> b!323510 (= e!233061 (and (= lt!445943 (bvand lt!445944 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!445943 (bvand (bvadd lt!445946 lt!445944) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!323510 (= lt!445943 (bvand lt!445946 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323510 (= lt!445946 (bitIndex!0 (size!9001 (buf!8143 thiss!1793)) (currentByte!15014 thiss!1793) (currentBit!15009 thiss!1793)))))

(declare-fun b!323511 () Bool)

(declare-fun res!265567 () Bool)

(assert (=> b!323511 (=> (not res!265567) (not e!233059))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323511 (= res!265567 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323512 () Bool)

(assert (=> b!323512 (= e!233058 e!233059)))

(declare-fun res!265568 () Bool)

(assert (=> b!323512 (=> (not res!265568) (not e!233059))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323512 (= res!265568 (validate_offset_bits!1 ((_ sign_extend 32) (size!9001 (buf!8143 thiss!1793))) ((_ sign_extend 32) (currentByte!15014 thiss!1793)) ((_ sign_extend 32) (currentBit!15009 thiss!1793)) lt!445944))))

(assert (=> b!323512 (= lt!445944 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(assert (= (and start!72146 res!265570) b!323512))

(assert (= (and b!323512 res!265568) b!323511))

(assert (= (and b!323511 res!265567) b!323509))

(assert (= (and b!323509 res!265569) b!323507))

(assert (= (and b!323507 res!265566) b!323510))

(assert (= start!72146 b!323508))

(declare-fun m!461559 () Bool)

(assert (=> b!323508 m!461559))

(declare-fun m!461561 () Bool)

(assert (=> start!72146 m!461561))

(declare-fun m!461563 () Bool)

(assert (=> b!323507 m!461563))

(declare-fun m!461565 () Bool)

(assert (=> b!323507 m!461565))

(declare-fun m!461567 () Bool)

(assert (=> b!323511 m!461567))

(declare-fun m!461569 () Bool)

(assert (=> b!323512 m!461569))

(declare-fun m!461571 () Bool)

(assert (=> b!323510 m!461571))

(push 1)

(assert (not start!72146))

(assert (not b!323512))

(assert (not b!323511))

(assert (not b!323508))

(assert (not b!323507))

(assert (not b!323510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!323590 () Bool)

(declare-fun res!265633 () Bool)

(declare-fun e!233110 () Bool)

(assert (=> b!323590 (=> (not res!265633) (not e!233110))))

(declare-fun lt!446021 () (_ BitVec 64))

(declare-fun lt!446023 () (_ BitVec 64))

(declare-fun lt!446019 () tuple2!23686)

(assert (=> b!323590 (= res!265633 (= (bitIndex!0 (size!9001 (buf!8143 (_2!13472 lt!446019))) (currentByte!15014 (_2!13472 lt!446019)) (currentBit!15009 (_2!13472 lt!446019))) (bvadd lt!446023 lt!446021)))))

(assert (=> b!323590 (or (not (= (bvand lt!446023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446021 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446023 lt!446021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323590 (= lt!446021 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!323590 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!323590 (= lt!446023 (bitIndex!0 (size!9001 (buf!8143 (_2!13471 lt!445945))) (currentByte!15014 (_2!13471 lt!445945)) (currentBit!15009 (_2!13471 lt!445945))))))

(declare-fun d!106070 () Bool)

(assert (=> d!106070 e!233110))

(declare-fun res!265632 () Bool)

(assert (=> d!106070 (=> (not res!265632) (not e!233110))))

(assert (=> d!106070 (= res!265632 (= (buf!8143 (_2!13472 lt!446019)) (buf!8143 (_2!13471 lt!445945))))))

(declare-fun e!233112 () tuple2!23686)

(assert (=> d!106070 (= lt!446019 e!233112)))

(declare-fun c!15448 () Bool)

(assert (=> d!106070 (= c!15448 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!106070 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!106070 (= (readNBitsLSBFirstsLoop!0 (_2!13471 lt!445945) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13471 lt!445945) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!446019)))

(declare-fun b!323591 () Bool)

(declare-fun lt!446024 () tuple2!23686)

(assert (=> b!323591 (= e!233112 (tuple2!23687 (_1!13472 lt!446024) (_2!13472 lt!446024)))))

(declare-fun lt!446022 () tuple2!23684)

(assert (=> b!323591 (= lt!446022 (readBit!0 (_2!13471 lt!445945)))))

(assert (=> b!323591 (= lt!446024 (readNBitsLSBFirstsLoop!0 (_2!13471 lt!446022) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13471 lt!445945) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13471 lt!446022) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!323592 () Bool)

(assert (=> b!323592 (= e!233112 (tuple2!23687 (bvor acc!161 (ite (_1!13471 lt!445945) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13471 lt!445945)))))

(declare-fun b!323593 () Bool)

(declare-fun res!265634 () Bool)

(assert (=> b!323593 (=> (not res!265634) (not e!233110))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323593 (= res!265634 (= (bvand (_1!13472 lt!446019) (onesLSBLong!0 nBits!548)) (_1!13472 lt!446019)))))

(declare-fun b!323594 () Bool)

(declare-fun lt!446020 () (_ BitVec 64))

(declare-fun e!233111 () Bool)

(declare-datatypes ((tuple2!23700 0))(
  ( (tuple2!23701 (_1!13479 BitStream!14164) (_2!13479 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14164) tuple2!23700)

(assert (=> b!323594 (= e!233111 (= (= (bvand (bvlshr (_1!13472 lt!446019) lt!446020) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13479 (readBitPure!0 (_2!13471 lt!445945)))))))

(assert (=> b!323594 (and (bvsge lt!446020 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!446020 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323594 (= lt!446020 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun b!323595 () Bool)

(assert (=> b!323595 (= e!233110 e!233111)))

(declare-fun res!265635 () Bool)

(assert (=> b!323595 (=> res!265635 e!233111)))

(assert (=> b!323595 (= res!265635 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun b!323596 () Bool)

(declare-fun res!265636 () Bool)

(assert (=> b!323596 (=> (not res!265636) (not e!233110))))

(assert (=> b!323596 (= res!265636 (= (bvand (_1!13472 lt!446019) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13471 lt!445945) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(assert (= (and d!106070 c!15448) b!323592))

(assert (= (and d!106070 (not c!15448)) b!323591))

(assert (= (and d!106070 res!265632) b!323590))

(assert (= (and b!323590 res!265633) b!323596))

(assert (= (and b!323596 res!265636) b!323593))

(assert (= (and b!323593 res!265634) b!323595))

(assert (= (and b!323595 (not res!265635)) b!323594))

(declare-fun m!461619 () Bool)

(assert (=> b!323593 m!461619))

(declare-fun m!461621 () Bool)

(assert (=> b!323596 m!461621))

(declare-fun m!461623 () Bool)

(assert (=> b!323591 m!461623))

(declare-fun m!461625 () Bool)

(assert (=> b!323591 m!461625))

(declare-fun m!461627 () Bool)

(assert (=> b!323590 m!461627))

(declare-fun m!461629 () Bool)

(assert (=> b!323590 m!461629))

(declare-fun m!461631 () Bool)

(assert (=> b!323594 m!461631))

(assert (=> b!323507 d!106070))

(declare-fun d!106080 () Bool)

(declare-fun e!233139 () Bool)

(assert (=> d!106080 e!233139))

(declare-fun res!265657 () Bool)

(assert (=> d!106080 (=> (not res!265657) (not e!233139))))

(declare-datatypes ((Unit!22040 0))(
  ( (Unit!22041) )
))
(declare-datatypes ((tuple2!23702 0))(
  ( (tuple2!23703 (_1!13480 Unit!22040) (_2!13480 BitStream!14164)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14164) tuple2!23702)

(assert (=> d!106080 (= res!265657 (= (buf!8143 (_2!13480 (increaseBitIndex!0 thiss!1793))) (buf!8143 thiss!1793)))))

(declare-fun lt!446078 () Bool)

(assert (=> d!106080 (= lt!446078 (not (= (bvand ((_ sign_extend 24) (select (arr!10093 (buf!8143 thiss!1793)) (currentByte!15014 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15009 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446081 () tuple2!23684)

(assert (=> d!106080 (= lt!446081 (tuple2!23685 (not (= (bvand ((_ sign_extend 24) (select (arr!10093 (buf!8143 thiss!1793)) (currentByte!15014 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15009 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13480 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!106080 (validate_offset_bit!0 ((_ sign_extend 32) (size!9001 (buf!8143 thiss!1793))) ((_ sign_extend 32) (currentByte!15014 thiss!1793)) ((_ sign_extend 32) (currentBit!15009 thiss!1793)))))

(assert (=> d!106080 (= (readBit!0 thiss!1793) lt!446081)))

(declare-fun b!323623 () Bool)

(declare-fun lt!446080 () (_ BitVec 64))

(declare-fun lt!446079 () (_ BitVec 64))

(assert (=> b!323623 (= e!233139 (= (bitIndex!0 (size!9001 (buf!8143 (_2!13480 (increaseBitIndex!0 thiss!1793)))) (currentByte!15014 (_2!13480 (increaseBitIndex!0 thiss!1793))) (currentBit!15009 (_2!13480 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!446080 lt!446079)))))

(assert (=> b!323623 (or (not (= (bvand lt!446080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446079 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446080 lt!446079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323623 (= lt!446079 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323623 (= lt!446080 (bitIndex!0 (size!9001 (buf!8143 thiss!1793)) (currentByte!15014 thiss!1793) (currentBit!15009 thiss!1793)))))

(declare-fun lt!446084 () Bool)

(assert (=> b!323623 (= lt!446084 (not (= (bvand ((_ sign_extend 24) (select (arr!10093 (buf!8143 thiss!1793)) (currentByte!15014 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15009 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446082 () Bool)

(assert (=> b!323623 (= lt!446082 (not (= (bvand ((_ sign_extend 24) (select (arr!10093 (buf!8143 thiss!1793)) (currentByte!15014 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15009 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446083 () Bool)

(assert (=> b!323623 (= lt!446083 (not (= (bvand ((_ sign_extend 24) (select (arr!10093 (buf!8143 thiss!1793)) (currentByte!15014 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15009 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!106080 res!265657) b!323623))

(declare-fun m!461657 () Bool)

(assert (=> d!106080 m!461657))

(declare-fun m!461659 () Bool)

(assert (=> d!106080 m!461659))

(declare-fun m!461661 () Bool)

(assert (=> d!106080 m!461661))

(declare-fun m!461663 () Bool)

(assert (=> d!106080 m!461663))

(assert (=> b!323623 m!461657))

(assert (=> b!323623 m!461661))

(assert (=> b!323623 m!461571))

(declare-fun m!461665 () Bool)

(assert (=> b!323623 m!461665))

(assert (=> b!323623 m!461659))

(assert (=> b!323507 d!106080))

(declare-fun d!106088 () Bool)

(assert (=> d!106088 (= (array_inv!8553 (buf!8143 thiss!1793)) (bvsge (size!9001 (buf!8143 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!323508 d!106088))

(declare-fun d!106090 () Bool)

(declare-fun e!233145 () Bool)

(assert (=> d!106090 e!233145))

(declare-fun res!265666 () Bool)

(assert (=> d!106090 (=> (not res!265666) (not e!233145))))

(declare-fun lt!446121 () (_ BitVec 64))

(declare-fun lt!446123 () (_ BitVec 64))

(declare-fun lt!446122 () (_ BitVec 64))

(assert (=> d!106090 (= res!265666 (= lt!446121 (bvsub lt!446122 lt!446123)))))

(assert (=> d!106090 (or (= (bvand lt!446122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446123 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446122 lt!446123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106090 (= lt!446123 (remainingBits!0 ((_ sign_extend 32) (size!9001 (buf!8143 thiss!1793))) ((_ sign_extend 32) (currentByte!15014 thiss!1793)) ((_ sign_extend 32) (currentBit!15009 thiss!1793))))))

(declare-fun lt!446118 () (_ BitVec 64))

(declare-fun lt!446120 () (_ BitVec 64))

(assert (=> d!106090 (= lt!446122 (bvmul lt!446118 lt!446120))))

(assert (=> d!106090 (or (= lt!446118 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446120 (bvsdiv (bvmul lt!446118 lt!446120) lt!446118)))))

(assert (=> d!106090 (= lt!446120 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106090 (= lt!446118 ((_ sign_extend 32) (size!9001 (buf!8143 thiss!1793))))))

(assert (=> d!106090 (= lt!446121 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15014 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15009 thiss!1793))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106090 (invariant!0 (currentBit!15009 thiss!1793) (currentByte!15014 thiss!1793) (size!9001 (buf!8143 thiss!1793)))))

(assert (=> d!106090 (= (bitIndex!0 (size!9001 (buf!8143 thiss!1793)) (currentByte!15014 thiss!1793) (currentBit!15009 thiss!1793)) lt!446121)))

(declare-fun b!323631 () Bool)

(declare-fun res!265665 () Bool)

(assert (=> b!323631 (=> (not res!265665) (not e!233145))))

(assert (=> b!323631 (= res!265665 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446121))))

(declare-fun b!323632 () Bool)

(declare-fun lt!446119 () (_ BitVec 64))

(assert (=> b!323632 (= e!233145 (bvsle lt!446121 (bvmul lt!446119 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323632 (or (= lt!446119 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446119 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446119)))))

(assert (=> b!323632 (= lt!446119 ((_ sign_extend 32) (size!9001 (buf!8143 thiss!1793))))))

(assert (= (and d!106090 res!265666) b!323631))

(assert (= (and b!323631 res!265665) b!323632))

(declare-fun m!461677 () Bool)

(assert (=> d!106090 m!461677))

(declare-fun m!461679 () Bool)

(assert (=> d!106090 m!461679))

(assert (=> b!323510 d!106090))

(declare-fun d!106094 () Bool)

(assert (=> d!106094 (= (inv!12 thiss!1793) (invariant!0 (currentBit!15009 thiss!1793) (currentByte!15014 thiss!1793) (size!9001 (buf!8143 thiss!1793))))))

(declare-fun bs!27951 () Bool)

(assert (= bs!27951 d!106094))

(assert (=> bs!27951 m!461679))

(assert (=> start!72146 d!106094))

(declare-fun d!106098 () Bool)

(assert (=> d!106098 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!323511 d!106098))

(declare-fun d!106100 () Bool)

(assert (=> d!106100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!9001 (buf!8143 thiss!1793))) ((_ sign_extend 32) (currentByte!15014 thiss!1793)) ((_ sign_extend 32) (currentBit!15009 thiss!1793)) lt!445944) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9001 (buf!8143 thiss!1793))) ((_ sign_extend 32) (currentByte!15014 thiss!1793)) ((_ sign_extend 32) (currentBit!15009 thiss!1793))) lt!445944))))

(declare-fun bs!27952 () Bool)

(assert (= bs!27952 d!106100))

(assert (=> bs!27952 m!461677))

(assert (=> b!323512 d!106100))

(push 1)

(assert (not b!323590))

(assert (not d!106090))

(assert (not b!323596))

(assert (not b!323593))

(assert (not d!106094))

(assert (not b!323591))

(assert (not d!106080))

(assert (not b!323594))

(assert (not b!323623))

(assert (not d!106100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

