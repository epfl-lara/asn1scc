; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72148 () Bool)

(assert start!72148)

(declare-fun res!265583 () Bool)

(declare-fun e!233076 () Bool)

(assert (=> start!72148 (=> (not res!265583) (not e!233076))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!72148 (= res!265583 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72148 e!233076))

(assert (=> start!72148 true))

(declare-datatypes ((array!20679 0))(
  ( (array!20680 (arr!10094 (Array (_ BitVec 32) (_ BitVec 8))) (size!9002 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14166 0))(
  ( (BitStream!14167 (buf!8144 array!20679) (currentByte!15015 (_ BitVec 32)) (currentBit!15010 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14166)

(declare-fun e!233074 () Bool)

(declare-fun inv!12 (BitStream!14166) Bool)

(assert (=> start!72148 (and (inv!12 thiss!1793) e!233074)))

(declare-fun b!323525 () Bool)

(declare-fun res!265581 () Bool)

(declare-fun e!233073 () Bool)

(assert (=> b!323525 (=> (not res!265581) (not e!233073))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323525 (= res!265581 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323526 () Bool)

(assert (=> b!323526 (= e!233076 e!233073)))

(declare-fun res!265584 () Bool)

(assert (=> b!323526 (=> (not res!265584) (not e!233073))))

(declare-fun lt!445957 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323526 (= res!265584 (validate_offset_bits!1 ((_ sign_extend 32) (size!9002 (buf!8144 thiss!1793))) ((_ sign_extend 32) (currentByte!15015 thiss!1793)) ((_ sign_extend 32) (currentBit!15010 thiss!1793)) lt!445957))))

(assert (=> b!323526 (= lt!445957 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!323527 () Bool)

(declare-fun e!233072 () Bool)

(declare-fun lt!445956 () (_ BitVec 64))

(declare-fun lt!445955 () (_ BitVec 64))

(assert (=> b!323527 (= e!233072 (and (= lt!445955 (bvand lt!445957 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!445955 (bvand (bvadd lt!445956 lt!445957) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!323527 (= lt!445955 (bvand lt!445956 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323527 (= lt!445956 (bitIndex!0 (size!9002 (buf!8144 thiss!1793)) (currentByte!15015 thiss!1793) (currentBit!15010 thiss!1793)))))

(declare-fun b!323528 () Bool)

(declare-fun res!265585 () Bool)

(assert (=> b!323528 (=> (not res!265585) (not e!233073))))

(assert (=> b!323528 (= res!265585 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323529 () Bool)

(declare-fun array_inv!8554 (array!20679) Bool)

(assert (=> b!323529 (= e!233074 (array_inv!8554 (buf!8144 thiss!1793)))))

(declare-fun b!323530 () Bool)

(assert (=> b!323530 (= e!233073 e!233072)))

(declare-fun res!265582 () Bool)

(assert (=> b!323530 (=> (not res!265582) (not e!233072))))

(declare-datatypes ((tuple2!23688 0))(
  ( (tuple2!23689 (_1!13473 Bool) (_2!13473 BitStream!14166)) )
))
(declare-fun lt!445958 () tuple2!23688)

(declare-datatypes ((tuple2!23690 0))(
  ( (tuple2!23691 (_1!13474 (_ BitVec 64)) (_2!13474 BitStream!14166)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23690)

(assert (=> b!323530 (= res!265582 (= (buf!8144 (_2!13474 (readNBitsLSBFirstsLoop!0 (_2!13473 lt!445958) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13473 lt!445958) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!8144 thiss!1793)))))

(declare-fun readBit!0 (BitStream!14166) tuple2!23688)

(assert (=> b!323530 (= lt!445958 (readBit!0 thiss!1793))))

(assert (= (and start!72148 res!265583) b!323526))

(assert (= (and b!323526 res!265584) b!323525))

(assert (= (and b!323525 res!265581) b!323528))

(assert (= (and b!323528 res!265585) b!323530))

(assert (= (and b!323530 res!265582) b!323527))

(assert (= start!72148 b!323529))

(declare-fun m!461573 () Bool)

(assert (=> b!323530 m!461573))

(declare-fun m!461575 () Bool)

(assert (=> b!323530 m!461575))

(declare-fun m!461577 () Bool)

(assert (=> start!72148 m!461577))

(declare-fun m!461579 () Bool)

(assert (=> b!323527 m!461579))

(declare-fun m!461581 () Bool)

(assert (=> b!323526 m!461581))

(declare-fun m!461583 () Bool)

(assert (=> b!323529 m!461583))

(declare-fun m!461585 () Bool)

(assert (=> b!323525 m!461585))

(check-sat (not b!323530) (not b!323529) (not b!323526) (not b!323527) (not b!323525) (not start!72148))
(check-sat)
(get-model)

(declare-fun d!106062 () Bool)

(declare-fun e!233094 () Bool)

(assert (=> d!106062 e!233094))

(declare-fun res!265606 () Bool)

(assert (=> d!106062 (=> (not res!265606) (not e!233094))))

(declare-fun lt!445985 () (_ BitVec 64))

(declare-fun lt!445986 () (_ BitVec 64))

(declare-fun lt!445988 () (_ BitVec 64))

(assert (=> d!106062 (= res!265606 (= lt!445985 (bvsub lt!445986 lt!445988)))))

(assert (=> d!106062 (or (= (bvand lt!445986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445988 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445986 lt!445988) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106062 (= lt!445988 (remainingBits!0 ((_ sign_extend 32) (size!9002 (buf!8144 thiss!1793))) ((_ sign_extend 32) (currentByte!15015 thiss!1793)) ((_ sign_extend 32) (currentBit!15010 thiss!1793))))))

(declare-fun lt!445983 () (_ BitVec 64))

(declare-fun lt!445987 () (_ BitVec 64))

(assert (=> d!106062 (= lt!445986 (bvmul lt!445983 lt!445987))))

(assert (=> d!106062 (or (= lt!445983 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445987 (bvsdiv (bvmul lt!445983 lt!445987) lt!445983)))))

(assert (=> d!106062 (= lt!445987 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106062 (= lt!445983 ((_ sign_extend 32) (size!9002 (buf!8144 thiss!1793))))))

(assert (=> d!106062 (= lt!445985 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15015 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15010 thiss!1793))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106062 (invariant!0 (currentBit!15010 thiss!1793) (currentByte!15015 thiss!1793) (size!9002 (buf!8144 thiss!1793)))))

(assert (=> d!106062 (= (bitIndex!0 (size!9002 (buf!8144 thiss!1793)) (currentByte!15015 thiss!1793) (currentBit!15010 thiss!1793)) lt!445985)))

(declare-fun b!323553 () Bool)

(declare-fun res!265605 () Bool)

(assert (=> b!323553 (=> (not res!265605) (not e!233094))))

(assert (=> b!323553 (= res!265605 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445985))))

(declare-fun b!323554 () Bool)

(declare-fun lt!445984 () (_ BitVec 64))

(assert (=> b!323554 (= e!233094 (bvsle lt!445985 (bvmul lt!445984 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323554 (or (= lt!445984 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445984 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445984)))))

(assert (=> b!323554 (= lt!445984 ((_ sign_extend 32) (size!9002 (buf!8144 thiss!1793))))))

(assert (= (and d!106062 res!265606) b!323553))

(assert (= (and b!323553 res!265605) b!323554))

(declare-fun m!461601 () Bool)

(assert (=> d!106062 m!461601))

(declare-fun m!461603 () Bool)

(assert (=> d!106062 m!461603))

(assert (=> b!323527 d!106062))

(declare-fun d!106064 () Bool)

(assert (=> d!106064 (= (inv!12 thiss!1793) (invariant!0 (currentBit!15010 thiss!1793) (currentByte!15015 thiss!1793) (size!9002 (buf!8144 thiss!1793))))))

(declare-fun bs!27948 () Bool)

(assert (= bs!27948 d!106064))

(assert (=> bs!27948 m!461603))

(assert (=> start!72148 d!106064))

(declare-fun d!106066 () Bool)

(assert (=> d!106066 (= (array_inv!8554 (buf!8144 thiss!1793)) (bvsge (size!9002 (buf!8144 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!323529 d!106066))

(declare-fun b!323569 () Bool)

(declare-fun res!265619 () Bool)

(declare-fun e!233103 () Bool)

(assert (=> b!323569 (=> (not res!265619) (not e!233103))))

(declare-fun lt!446003 () tuple2!23690)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323569 (= res!265619 (= (bvand (_1!13474 lt!446003) (onesLSBLong!0 nBits!548)) (_1!13474 lt!446003)))))

(declare-fun d!106068 () Bool)

(assert (=> d!106068 e!233103))

(declare-fun res!265617 () Bool)

(assert (=> d!106068 (=> (not res!265617) (not e!233103))))

(assert (=> d!106068 (= res!265617 (= (buf!8144 (_2!13474 lt!446003)) (buf!8144 (_2!13473 lt!445958))))))

(declare-fun e!233102 () tuple2!23690)

(assert (=> d!106068 (= lt!446003 e!233102)))

(declare-fun c!15445 () Bool)

(assert (=> d!106068 (= c!15445 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!106068 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!106068 (= (readNBitsLSBFirstsLoop!0 (_2!13473 lt!445958) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13473 lt!445958) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!446003)))

(declare-fun b!323570 () Bool)

(declare-fun res!265620 () Bool)

(assert (=> b!323570 (=> (not res!265620) (not e!233103))))

(assert (=> b!323570 (= res!265620 (= (bvand (_1!13474 lt!446003) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13473 lt!445958) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!323571 () Bool)

(declare-fun res!265621 () Bool)

(assert (=> b!323571 (=> (not res!265621) (not e!233103))))

(declare-fun lt!446004 () (_ BitVec 64))

(declare-fun lt!446005 () (_ BitVec 64))

(assert (=> b!323571 (= res!265621 (= (bitIndex!0 (size!9002 (buf!8144 (_2!13474 lt!446003))) (currentByte!15015 (_2!13474 lt!446003)) (currentBit!15010 (_2!13474 lt!446003))) (bvadd lt!446005 lt!446004)))))

(assert (=> b!323571 (or (not (= (bvand lt!446005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446004 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446005 lt!446004) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323571 (= lt!446004 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!323571 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!323571 (= lt!446005 (bitIndex!0 (size!9002 (buf!8144 (_2!13473 lt!445958))) (currentByte!15015 (_2!13473 lt!445958)) (currentBit!15010 (_2!13473 lt!445958))))))

(declare-fun b!323572 () Bool)

(declare-fun e!233101 () Bool)

(assert (=> b!323572 (= e!233103 e!233101)))

(declare-fun res!265618 () Bool)

(assert (=> b!323572 (=> res!265618 e!233101)))

(assert (=> b!323572 (= res!265618 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun b!323573 () Bool)

(assert (=> b!323573 (= e!233102 (tuple2!23691 (bvor acc!161 (ite (_1!13473 lt!445958) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13473 lt!445958)))))

(declare-fun b!323574 () Bool)

(declare-fun lt!446006 () tuple2!23690)

(assert (=> b!323574 (= e!233102 (tuple2!23691 (_1!13474 lt!446006) (_2!13474 lt!446006)))))

(declare-fun lt!446002 () tuple2!23688)

(assert (=> b!323574 (= lt!446002 (readBit!0 (_2!13473 lt!445958)))))

(assert (=> b!323574 (= lt!446006 (readNBitsLSBFirstsLoop!0 (_2!13473 lt!446002) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13473 lt!445958) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13473 lt!446002) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!323575 () Bool)

(declare-fun lt!446001 () (_ BitVec 64))

(declare-datatypes ((tuple2!23696 0))(
  ( (tuple2!23697 (_1!13477 BitStream!14166) (_2!13477 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14166) tuple2!23696)

(assert (=> b!323575 (= e!233101 (= (= (bvand (bvlshr (_1!13474 lt!446003) lt!446001) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13477 (readBitPure!0 (_2!13473 lt!445958)))))))

(assert (=> b!323575 (and (bvsge lt!446001 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!446001 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323575 (= lt!446001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (= (and d!106068 c!15445) b!323573))

(assert (= (and d!106068 (not c!15445)) b!323574))

(assert (= (and d!106068 res!265617) b!323571))

(assert (= (and b!323571 res!265621) b!323570))

(assert (= (and b!323570 res!265620) b!323569))

(assert (= (and b!323569 res!265619) b!323572))

(assert (= (and b!323572 (not res!265618)) b!323575))

(declare-fun m!461605 () Bool)

(assert (=> b!323571 m!461605))

(declare-fun m!461607 () Bool)

(assert (=> b!323571 m!461607))

(declare-fun m!461609 () Bool)

(assert (=> b!323574 m!461609))

(declare-fun m!461611 () Bool)

(assert (=> b!323574 m!461611))

(declare-fun m!461613 () Bool)

(assert (=> b!323575 m!461613))

(declare-fun m!461615 () Bool)

(assert (=> b!323569 m!461615))

(declare-fun m!461617 () Bool)

(assert (=> b!323570 m!461617))

(assert (=> b!323530 d!106068))

(declare-fun d!106078 () Bool)

(declare-fun e!233132 () Bool)

(assert (=> d!106078 e!233132))

(declare-fun res!265654 () Bool)

(assert (=> d!106078 (=> (not res!265654) (not e!233132))))

(declare-datatypes ((Unit!22038 0))(
  ( (Unit!22039) )
))
(declare-datatypes ((tuple2!23698 0))(
  ( (tuple2!23699 (_1!13478 Unit!22038) (_2!13478 BitStream!14166)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14166) tuple2!23698)

(assert (=> d!106078 (= res!265654 (= (buf!8144 (_2!13478 (increaseBitIndex!0 thiss!1793))) (buf!8144 thiss!1793)))))

(declare-fun lt!446061 () Bool)

(assert (=> d!106078 (= lt!446061 (not (= (bvand ((_ sign_extend 24) (select (arr!10094 (buf!8144 thiss!1793)) (currentByte!15015 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15010 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446063 () tuple2!23688)

(assert (=> d!106078 (= lt!446063 (tuple2!23689 (not (= (bvand ((_ sign_extend 24) (select (arr!10094 (buf!8144 thiss!1793)) (currentByte!15015 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15010 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13478 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!106078 (validate_offset_bit!0 ((_ sign_extend 32) (size!9002 (buf!8144 thiss!1793))) ((_ sign_extend 32) (currentByte!15015 thiss!1793)) ((_ sign_extend 32) (currentBit!15010 thiss!1793)))))

(assert (=> d!106078 (= (readBit!0 thiss!1793) lt!446063)))

(declare-fun lt!446062 () (_ BitVec 64))

(declare-fun b!323620 () Bool)

(declare-fun lt!446064 () (_ BitVec 64))

(assert (=> b!323620 (= e!233132 (= (bitIndex!0 (size!9002 (buf!8144 (_2!13478 (increaseBitIndex!0 thiss!1793)))) (currentByte!15015 (_2!13478 (increaseBitIndex!0 thiss!1793))) (currentBit!15010 (_2!13478 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!446064 lt!446062)))))

(assert (=> b!323620 (or (not (= (bvand lt!446064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446062 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446064 lt!446062) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323620 (= lt!446062 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323620 (= lt!446064 (bitIndex!0 (size!9002 (buf!8144 thiss!1793)) (currentByte!15015 thiss!1793) (currentBit!15010 thiss!1793)))))

(declare-fun lt!446060 () Bool)

(assert (=> b!323620 (= lt!446060 (not (= (bvand ((_ sign_extend 24) (select (arr!10094 (buf!8144 thiss!1793)) (currentByte!15015 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15010 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446059 () Bool)

(assert (=> b!323620 (= lt!446059 (not (= (bvand ((_ sign_extend 24) (select (arr!10094 (buf!8144 thiss!1793)) (currentByte!15015 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15010 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446065 () Bool)

(assert (=> b!323620 (= lt!446065 (not (= (bvand ((_ sign_extend 24) (select (arr!10094 (buf!8144 thiss!1793)) (currentByte!15015 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15010 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!106078 res!265654) b!323620))

(declare-fun m!461647 () Bool)

(assert (=> d!106078 m!461647))

(declare-fun m!461649 () Bool)

(assert (=> d!106078 m!461649))

(declare-fun m!461651 () Bool)

(assert (=> d!106078 m!461651))

(declare-fun m!461653 () Bool)

(assert (=> d!106078 m!461653))

(assert (=> b!323620 m!461579))

(assert (=> b!323620 m!461649))

(declare-fun m!461655 () Bool)

(assert (=> b!323620 m!461655))

(assert (=> b!323620 m!461647))

(assert (=> b!323620 m!461651))

(assert (=> b!323530 d!106078))

(declare-fun d!106084 () Bool)

(assert (=> d!106084 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!323525 d!106084))

(declare-fun d!106086 () Bool)

(assert (=> d!106086 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!9002 (buf!8144 thiss!1793))) ((_ sign_extend 32) (currentByte!15015 thiss!1793)) ((_ sign_extend 32) (currentBit!15010 thiss!1793)) lt!445957) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9002 (buf!8144 thiss!1793))) ((_ sign_extend 32) (currentByte!15015 thiss!1793)) ((_ sign_extend 32) (currentBit!15010 thiss!1793))) lt!445957))))

(declare-fun bs!27949 () Bool)

(assert (= bs!27949 d!106086))

(assert (=> bs!27949 m!461601))

(assert (=> b!323526 d!106086))

(check-sat (not b!323620) (not d!106078) (not d!106062) (not b!323570) (not d!106086) (not d!106064) (not b!323569) (not b!323574) (not b!323575) (not b!323571))
