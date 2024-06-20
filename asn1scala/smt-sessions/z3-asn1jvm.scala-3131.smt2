; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71986 () Bool)

(assert start!71986)

(declare-fun b!322891 () Bool)

(declare-fun res!265065 () Bool)

(declare-fun e!232653 () Bool)

(assert (=> b!322891 (=> (not res!265065) (not e!232653))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!322891 (= res!265065 (bvslt i!743 nBits!548))))

(declare-fun b!322892 () Bool)

(declare-fun res!265068 () Bool)

(declare-fun e!232650 () Bool)

(assert (=> b!322892 (=> (not res!265068) (not e!232650))))

(declare-fun lt!445577 () (_ BitVec 64))

(declare-datatypes ((array!20607 0))(
  ( (array!20608 (arr!10061 (Array (_ BitVec 32) (_ BitVec 8))) (size!8969 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14100 0))(
  ( (BitStream!14101 (buf!8111 array!20607) (currentByte!14967 (_ BitVec 32)) (currentBit!14962 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23634 0))(
  ( (tuple2!23635 (_1!13446 (_ BitVec 64)) (_2!13446 BitStream!14100)) )
))
(declare-fun lt!445578 () tuple2!23634)

(declare-fun thiss!1793 () BitStream!14100)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322892 (= res!265068 (= (bitIndex!0 (size!8969 (buf!8111 (_2!13446 lt!445578))) (currentByte!14967 (_2!13446 lt!445578)) (currentBit!14962 (_2!13446 lt!445578))) (bvadd (bitIndex!0 (size!8969 (buf!8111 thiss!1793)) (currentByte!14967 thiss!1793) (currentBit!14962 thiss!1793)) lt!445577)))))

(declare-fun b!322893 () Bool)

(declare-fun e!232652 () Bool)

(assert (=> b!322893 (= e!232652 e!232650)))

(declare-fun res!265070 () Bool)

(assert (=> b!322893 (=> (not res!265070) (not e!232650))))

(assert (=> b!322893 (= res!265070 (= (buf!8111 (_2!13446 lt!445578)) (buf!8111 thiss!1793)))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((tuple2!23636 0))(
  ( (tuple2!23637 (_1!13447 Bool) (_2!13447 BitStream!14100)) )
))
(declare-fun lt!445579 () tuple2!23636)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23634)

(assert (=> b!322893 (= lt!445578 (readNBitsLSBFirstsLoop!0 (_2!13447 lt!445579) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13447 lt!445579) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14100) tuple2!23636)

(assert (=> b!322893 (= lt!445579 (readBit!0 thiss!1793))))

(declare-fun b!322894 () Bool)

(declare-fun e!232651 () Bool)

(assert (=> b!322894 (= e!232651 e!232652)))

(declare-fun res!265066 () Bool)

(assert (=> b!322894 (=> (not res!265066) (not e!232652))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322894 (= res!265066 (validate_offset_bits!1 ((_ sign_extend 32) (size!8969 (buf!8111 thiss!1793))) ((_ sign_extend 32) (currentByte!14967 thiss!1793)) ((_ sign_extend 32) (currentBit!14962 thiss!1793)) lt!445577))))

(assert (=> b!322894 (= lt!445577 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!322895 () Bool)

(declare-fun res!265067 () Bool)

(assert (=> b!322895 (=> (not res!265067) (not e!232652))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322895 (= res!265067 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322896 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322896 (= e!232653 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!8969 (buf!8111 thiss!1793))) ((_ sign_extend 32) (currentByte!14967 thiss!1793)) ((_ sign_extend 32) (currentBit!14962 thiss!1793)))))))

(declare-fun b!322897 () Bool)

(declare-fun res!265071 () Bool)

(assert (=> b!322897 (=> (not res!265071) (not e!232653))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322897 (= res!265071 (= (bvand (_1!13446 lt!445578) (onesLSBLong!0 nBits!548)) (_1!13446 lt!445578)))))

(declare-fun res!265072 () Bool)

(assert (=> start!71986 (=> (not res!265072) (not e!232651))))

(assert (=> start!71986 (= res!265072 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71986 e!232651))

(assert (=> start!71986 true))

(declare-fun e!232649 () Bool)

(declare-fun inv!12 (BitStream!14100) Bool)

(assert (=> start!71986 (and (inv!12 thiss!1793) e!232649)))

(declare-fun b!322898 () Bool)

(declare-fun array_inv!8521 (array!20607) Bool)

(assert (=> b!322898 (= e!232649 (array_inv!8521 (buf!8111 thiss!1793)))))

(declare-fun b!322899 () Bool)

(assert (=> b!322899 (= e!232650 e!232653)))

(declare-fun res!265064 () Bool)

(assert (=> b!322899 (=> (not res!265064) (not e!232653))))

(declare-fun lt!445580 () (_ BitVec 64))

(assert (=> b!322899 (= res!265064 (= (bvand (_1!13446 lt!445578) lt!445580) (bvand acc!161 lt!445580)))))

(assert (=> b!322899 (= lt!445580 (onesLSBLong!0 i!743))))

(declare-fun b!322900 () Bool)

(declare-fun res!265069 () Bool)

(assert (=> b!322900 (=> (not res!265069) (not e!232652))))

(assert (=> b!322900 (= res!265069 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!71986 res!265072) b!322894))

(assert (= (and b!322894 res!265066) b!322895))

(assert (= (and b!322895 res!265067) b!322900))

(assert (= (and b!322900 res!265069) b!322893))

(assert (= (and b!322893 res!265070) b!322892))

(assert (= (and b!322892 res!265068) b!322899))

(assert (= (and b!322899 res!265064) b!322897))

(assert (= (and b!322897 res!265071) b!322891))

(assert (= (and b!322891 res!265065) b!322896))

(assert (= start!71986 b!322898))

(declare-fun m!461119 () Bool)

(assert (=> b!322898 m!461119))

(declare-fun m!461121 () Bool)

(assert (=> b!322899 m!461121))

(declare-fun m!461123 () Bool)

(assert (=> start!71986 m!461123))

(declare-fun m!461125 () Bool)

(assert (=> b!322892 m!461125))

(declare-fun m!461127 () Bool)

(assert (=> b!322892 m!461127))

(declare-fun m!461129 () Bool)

(assert (=> b!322895 m!461129))

(declare-fun m!461131 () Bool)

(assert (=> b!322897 m!461131))

(declare-fun m!461133 () Bool)

(assert (=> b!322896 m!461133))

(declare-fun m!461135 () Bool)

(assert (=> b!322894 m!461135))

(declare-fun m!461137 () Bool)

(assert (=> b!322893 m!461137))

(declare-fun m!461139 () Bool)

(assert (=> b!322893 m!461139))

(check-sat (not b!322897) (not b!322892) (not b!322899) (not b!322895) (not start!71986) (not b!322893) (not b!322896) (not b!322898) (not b!322894))
(check-sat)
(get-model)

(declare-fun d!105936 () Bool)

(assert (=> d!105936 (= (array_inv!8521 (buf!8111 thiss!1793)) (bvsge (size!8969 (buf!8111 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322898 d!105936))

(declare-fun e!232678 () Bool)

(declare-fun lt!445607 () (_ BitVec 64))

(declare-fun b!322945 () Bool)

(declare-fun lt!445610 () tuple2!23634)

(declare-datatypes ((tuple2!23642 0))(
  ( (tuple2!23643 (_1!13450 BitStream!14100) (_2!13450 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14100) tuple2!23642)

(assert (=> b!322945 (= e!232678 (= (= (bvand (bvlshr (_1!13446 lt!445610) lt!445607) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13450 (readBitPure!0 (_2!13447 lt!445579)))))))

(assert (=> b!322945 (and (bvsge lt!445607 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!445607 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!322945 (= lt!445607 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun d!105938 () Bool)

(declare-fun e!232680 () Bool)

(assert (=> d!105938 e!232680))

(declare-fun res!265113 () Bool)

(assert (=> d!105938 (=> (not res!265113) (not e!232680))))

(assert (=> d!105938 (= res!265113 (= (buf!8111 (_2!13446 lt!445610)) (buf!8111 (_2!13447 lt!445579))))))

(declare-fun e!232679 () tuple2!23634)

(assert (=> d!105938 (= lt!445610 e!232679)))

(declare-fun c!15436 () Bool)

(assert (=> d!105938 (= c!15436 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!105938 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!105938 (= (readNBitsLSBFirstsLoop!0 (_2!13447 lt!445579) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13447 lt!445579) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!445610)))

(declare-fun b!322946 () Bool)

(assert (=> b!322946 (= e!232679 (tuple2!23635 (bvor acc!161 (ite (_1!13447 lt!445579) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13447 lt!445579)))))

(declare-fun b!322947 () Bool)

(declare-fun lt!445609 () tuple2!23634)

(assert (=> b!322947 (= e!232679 (tuple2!23635 (_1!13446 lt!445609) (_2!13446 lt!445609)))))

(declare-fun lt!445605 () tuple2!23636)

(assert (=> b!322947 (= lt!445605 (readBit!0 (_2!13447 lt!445579)))))

(assert (=> b!322947 (= lt!445609 (readNBitsLSBFirstsLoop!0 (_2!13447 lt!445605) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13447 lt!445579) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13447 lt!445605) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322948 () Bool)

(declare-fun res!265111 () Bool)

(assert (=> b!322948 (=> (not res!265111) (not e!232680))))

(assert (=> b!322948 (= res!265111 (= (bvand (_1!13446 lt!445610) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13447 lt!445579) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!322949 () Bool)

(assert (=> b!322949 (= e!232680 e!232678)))

(declare-fun res!265112 () Bool)

(assert (=> b!322949 (=> res!265112 e!232678)))

(assert (=> b!322949 (= res!265112 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun b!322950 () Bool)

(declare-fun res!265114 () Bool)

(assert (=> b!322950 (=> (not res!265114) (not e!232680))))

(assert (=> b!322950 (= res!265114 (= (bvand (_1!13446 lt!445610) (onesLSBLong!0 nBits!548)) (_1!13446 lt!445610)))))

(declare-fun b!322951 () Bool)

(declare-fun res!265110 () Bool)

(assert (=> b!322951 (=> (not res!265110) (not e!232680))))

(declare-fun lt!445608 () (_ BitVec 64))

(declare-fun lt!445606 () (_ BitVec 64))

(assert (=> b!322951 (= res!265110 (= (bitIndex!0 (size!8969 (buf!8111 (_2!13446 lt!445610))) (currentByte!14967 (_2!13446 lt!445610)) (currentBit!14962 (_2!13446 lt!445610))) (bvadd lt!445606 lt!445608)))))

(assert (=> b!322951 (or (not (= (bvand lt!445606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445608 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445606 lt!445608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322951 (= lt!445608 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!322951 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!322951 (= lt!445606 (bitIndex!0 (size!8969 (buf!8111 (_2!13447 lt!445579))) (currentByte!14967 (_2!13447 lt!445579)) (currentBit!14962 (_2!13447 lt!445579))))))

(assert (= (and d!105938 c!15436) b!322946))

(assert (= (and d!105938 (not c!15436)) b!322947))

(assert (= (and d!105938 res!265113) b!322951))

(assert (= (and b!322951 res!265110) b!322948))

(assert (= (and b!322948 res!265111) b!322950))

(assert (= (and b!322950 res!265114) b!322949))

(assert (= (and b!322949 (not res!265112)) b!322945))

(declare-fun m!461163 () Bool)

(assert (=> b!322945 m!461163))

(declare-fun m!461165 () Bool)

(assert (=> b!322947 m!461165))

(declare-fun m!461167 () Bool)

(assert (=> b!322947 m!461167))

(assert (=> b!322950 m!461131))

(declare-fun m!461169 () Bool)

(assert (=> b!322951 m!461169))

(declare-fun m!461171 () Bool)

(assert (=> b!322951 m!461171))

(declare-fun m!461173 () Bool)

(assert (=> b!322948 m!461173))

(assert (=> b!322893 d!105938))

(declare-fun d!105940 () Bool)

(declare-fun e!232691 () Bool)

(assert (=> d!105940 e!232691))

(declare-fun res!265125 () Bool)

(assert (=> d!105940 (=> (not res!265125) (not e!232691))))

(declare-datatypes ((Unit!22032 0))(
  ( (Unit!22033) )
))
(declare-datatypes ((tuple2!23644 0))(
  ( (tuple2!23645 (_1!13451 Unit!22032) (_2!13451 BitStream!14100)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14100) tuple2!23644)

(assert (=> d!105940 (= res!265125 (= (buf!8111 (_2!13451 (increaseBitIndex!0 thiss!1793))) (buf!8111 thiss!1793)))))

(declare-fun lt!445650 () Bool)

(assert (=> d!105940 (= lt!445650 (not (= (bvand ((_ sign_extend 24) (select (arr!10061 (buf!8111 thiss!1793)) (currentByte!14967 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14962 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445654 () tuple2!23636)

(assert (=> d!105940 (= lt!445654 (tuple2!23637 (not (= (bvand ((_ sign_extend 24) (select (arr!10061 (buf!8111 thiss!1793)) (currentByte!14967 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14962 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13451 (increaseBitIndex!0 thiss!1793))))))

(assert (=> d!105940 (validate_offset_bit!0 ((_ sign_extend 32) (size!8969 (buf!8111 thiss!1793))) ((_ sign_extend 32) (currentByte!14967 thiss!1793)) ((_ sign_extend 32) (currentBit!14962 thiss!1793)))))

(assert (=> d!105940 (= (readBit!0 thiss!1793) lt!445654)))

(declare-fun lt!445652 () (_ BitVec 64))

(declare-fun b!322962 () Bool)

(declare-fun lt!445653 () (_ BitVec 64))

(assert (=> b!322962 (= e!232691 (= (bitIndex!0 (size!8969 (buf!8111 (_2!13451 (increaseBitIndex!0 thiss!1793)))) (currentByte!14967 (_2!13451 (increaseBitIndex!0 thiss!1793))) (currentBit!14962 (_2!13451 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!445652 lt!445653)))))

(assert (=> b!322962 (or (not (= (bvand lt!445652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445653 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445652 lt!445653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322962 (= lt!445653 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322962 (= lt!445652 (bitIndex!0 (size!8969 (buf!8111 thiss!1793)) (currentByte!14967 thiss!1793) (currentBit!14962 thiss!1793)))))

(declare-fun lt!445655 () Bool)

(assert (=> b!322962 (= lt!445655 (not (= (bvand ((_ sign_extend 24) (select (arr!10061 (buf!8111 thiss!1793)) (currentByte!14967 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14962 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445649 () Bool)

(assert (=> b!322962 (= lt!445649 (not (= (bvand ((_ sign_extend 24) (select (arr!10061 (buf!8111 thiss!1793)) (currentByte!14967 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14962 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445651 () Bool)

(assert (=> b!322962 (= lt!445651 (not (= (bvand ((_ sign_extend 24) (select (arr!10061 (buf!8111 thiss!1793)) (currentByte!14967 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14962 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105940 res!265125) b!322962))

(declare-fun m!461185 () Bool)

(assert (=> d!105940 m!461185))

(declare-fun m!461187 () Bool)

(assert (=> d!105940 m!461187))

(declare-fun m!461189 () Bool)

(assert (=> d!105940 m!461189))

(assert (=> d!105940 m!461133))

(assert (=> b!322962 m!461189))

(assert (=> b!322962 m!461187))

(assert (=> b!322962 m!461185))

(declare-fun m!461191 () Bool)

(assert (=> b!322962 m!461191))

(assert (=> b!322962 m!461127))

(assert (=> b!322893 d!105940))

(declare-fun d!105964 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105964 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14962 thiss!1793) (currentByte!14967 thiss!1793) (size!8969 (buf!8111 thiss!1793))))))

(declare-fun bs!27900 () Bool)

(assert (= bs!27900 d!105964))

(declare-fun m!461193 () Bool)

(assert (=> bs!27900 m!461193))

(assert (=> start!71986 d!105964))

(declare-fun d!105966 () Bool)

(declare-fun e!232694 () Bool)

(assert (=> d!105966 e!232694))

(declare-fun res!265131 () Bool)

(assert (=> d!105966 (=> (not res!265131) (not e!232694))))

(declare-fun lt!445670 () (_ BitVec 64))

(declare-fun lt!445672 () (_ BitVec 64))

(declare-fun lt!445668 () (_ BitVec 64))

(assert (=> d!105966 (= res!265131 (= lt!445672 (bvsub lt!445670 lt!445668)))))

(assert (=> d!105966 (or (= (bvand lt!445670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445668 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445670 lt!445668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105966 (= lt!445668 (remainingBits!0 ((_ sign_extend 32) (size!8969 (buf!8111 (_2!13446 lt!445578)))) ((_ sign_extend 32) (currentByte!14967 (_2!13446 lt!445578))) ((_ sign_extend 32) (currentBit!14962 (_2!13446 lt!445578)))))))

(declare-fun lt!445673 () (_ BitVec 64))

(declare-fun lt!445671 () (_ BitVec 64))

(assert (=> d!105966 (= lt!445670 (bvmul lt!445673 lt!445671))))

(assert (=> d!105966 (or (= lt!445673 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445671 (bvsdiv (bvmul lt!445673 lt!445671) lt!445673)))))

(assert (=> d!105966 (= lt!445671 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105966 (= lt!445673 ((_ sign_extend 32) (size!8969 (buf!8111 (_2!13446 lt!445578)))))))

(assert (=> d!105966 (= lt!445672 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14967 (_2!13446 lt!445578))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14962 (_2!13446 lt!445578)))))))

(assert (=> d!105966 (invariant!0 (currentBit!14962 (_2!13446 lt!445578)) (currentByte!14967 (_2!13446 lt!445578)) (size!8969 (buf!8111 (_2!13446 lt!445578))))))

(assert (=> d!105966 (= (bitIndex!0 (size!8969 (buf!8111 (_2!13446 lt!445578))) (currentByte!14967 (_2!13446 lt!445578)) (currentBit!14962 (_2!13446 lt!445578))) lt!445672)))

(declare-fun b!322967 () Bool)

(declare-fun res!265130 () Bool)

(assert (=> b!322967 (=> (not res!265130) (not e!232694))))

(assert (=> b!322967 (= res!265130 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445672))))

(declare-fun b!322968 () Bool)

(declare-fun lt!445669 () (_ BitVec 64))

(assert (=> b!322968 (= e!232694 (bvsle lt!445672 (bvmul lt!445669 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322968 (or (= lt!445669 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445669 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445669)))))

(assert (=> b!322968 (= lt!445669 ((_ sign_extend 32) (size!8969 (buf!8111 (_2!13446 lt!445578)))))))

(assert (= (and d!105966 res!265131) b!322967))

(assert (= (and b!322967 res!265130) b!322968))

(declare-fun m!461195 () Bool)

(assert (=> d!105966 m!461195))

(declare-fun m!461197 () Bool)

(assert (=> d!105966 m!461197))

(assert (=> b!322892 d!105966))

(declare-fun d!105968 () Bool)

(declare-fun e!232695 () Bool)

(assert (=> d!105968 e!232695))

(declare-fun res!265133 () Bool)

(assert (=> d!105968 (=> (not res!265133) (not e!232695))))

(declare-fun lt!445676 () (_ BitVec 64))

(declare-fun lt!445674 () (_ BitVec 64))

(declare-fun lt!445678 () (_ BitVec 64))

(assert (=> d!105968 (= res!265133 (= lt!445678 (bvsub lt!445676 lt!445674)))))

(assert (=> d!105968 (or (= (bvand lt!445676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445674 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445676 lt!445674) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105968 (= lt!445674 (remainingBits!0 ((_ sign_extend 32) (size!8969 (buf!8111 thiss!1793))) ((_ sign_extend 32) (currentByte!14967 thiss!1793)) ((_ sign_extend 32) (currentBit!14962 thiss!1793))))))

(declare-fun lt!445679 () (_ BitVec 64))

(declare-fun lt!445677 () (_ BitVec 64))

(assert (=> d!105968 (= lt!445676 (bvmul lt!445679 lt!445677))))

(assert (=> d!105968 (or (= lt!445679 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445677 (bvsdiv (bvmul lt!445679 lt!445677) lt!445679)))))

(assert (=> d!105968 (= lt!445677 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105968 (= lt!445679 ((_ sign_extend 32) (size!8969 (buf!8111 thiss!1793))))))

(assert (=> d!105968 (= lt!445678 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14967 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14962 thiss!1793))))))

(assert (=> d!105968 (invariant!0 (currentBit!14962 thiss!1793) (currentByte!14967 thiss!1793) (size!8969 (buf!8111 thiss!1793)))))

(assert (=> d!105968 (= (bitIndex!0 (size!8969 (buf!8111 thiss!1793)) (currentByte!14967 thiss!1793) (currentBit!14962 thiss!1793)) lt!445678)))

(declare-fun b!322969 () Bool)

(declare-fun res!265132 () Bool)

(assert (=> b!322969 (=> (not res!265132) (not e!232695))))

(assert (=> b!322969 (= res!265132 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445678))))

(declare-fun b!322970 () Bool)

(declare-fun lt!445675 () (_ BitVec 64))

(assert (=> b!322970 (= e!232695 (bvsle lt!445678 (bvmul lt!445675 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322970 (or (= lt!445675 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445675 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445675)))))

(assert (=> b!322970 (= lt!445675 ((_ sign_extend 32) (size!8969 (buf!8111 thiss!1793))))))

(assert (= (and d!105968 res!265133) b!322969))

(assert (= (and b!322969 res!265132) b!322970))

(declare-fun m!461199 () Bool)

(assert (=> d!105968 m!461199))

(assert (=> d!105968 m!461193))

(assert (=> b!322892 d!105968))

(declare-fun d!105970 () Bool)

(assert (=> d!105970 (= (onesLSBLong!0 nBits!548) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!548))))))

(assert (=> b!322897 d!105970))

(declare-fun d!105972 () Bool)

(assert (=> d!105972 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322895 d!105972))

(declare-fun d!105974 () Bool)

(assert (=> d!105974 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8969 (buf!8111 thiss!1793))) ((_ sign_extend 32) (currentByte!14967 thiss!1793)) ((_ sign_extend 32) (currentBit!14962 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8969 (buf!8111 thiss!1793))) ((_ sign_extend 32) (currentByte!14967 thiss!1793)) ((_ sign_extend 32) (currentBit!14962 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27901 () Bool)

(assert (= bs!27901 d!105974))

(assert (=> bs!27901 m!461199))

(assert (=> b!322896 d!105974))

(declare-fun d!105976 () Bool)

(assert (=> d!105976 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8969 (buf!8111 thiss!1793))) ((_ sign_extend 32) (currentByte!14967 thiss!1793)) ((_ sign_extend 32) (currentBit!14962 thiss!1793)) lt!445577) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8969 (buf!8111 thiss!1793))) ((_ sign_extend 32) (currentByte!14967 thiss!1793)) ((_ sign_extend 32) (currentBit!14962 thiss!1793))) lt!445577))))

(declare-fun bs!27902 () Bool)

(assert (= bs!27902 d!105976))

(assert (=> bs!27902 m!461199))

(assert (=> b!322894 d!105976))

(declare-fun d!105978 () Bool)

(assert (=> d!105978 (= (onesLSBLong!0 i!743) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!743))))))

(assert (=> b!322899 d!105978))

(check-sat (not d!105974) (not d!105964) (not d!105940) (not b!322962) (not b!322950) (not d!105976) (not d!105968) (not b!322951) (not b!322945) (not d!105966) (not b!322947) (not b!322948))
