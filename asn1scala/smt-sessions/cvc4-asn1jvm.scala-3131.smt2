; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71988 () Bool)

(assert start!71988)

(declare-fun b!322921 () Bool)

(declare-fun e!232668 () Bool)

(declare-fun e!232670 () Bool)

(assert (=> b!322921 (= e!232668 e!232670)))

(declare-fun res!265095 () Bool)

(assert (=> b!322921 (=> (not res!265095) (not e!232670))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((array!20609 0))(
  ( (array!20610 (arr!10062 (Array (_ BitVec 32) (_ BitVec 8))) (size!8970 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14102 0))(
  ( (BitStream!14103 (buf!8112 array!20609) (currentByte!14968 (_ BitVec 32)) (currentBit!14963 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23638 0))(
  ( (tuple2!23639 (_1!13448 (_ BitVec 64)) (_2!13448 BitStream!14102)) )
))
(declare-fun lt!445591 () tuple2!23638)

(declare-fun lt!445589 () (_ BitVec 64))

(assert (=> b!322921 (= res!265095 (= (bvand (_1!13448 lt!445591) lt!445589) (bvand acc!161 lt!445589)))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322921 (= lt!445589 (onesLSBLong!0 i!743))))

(declare-fun b!322922 () Bool)

(declare-fun e!232666 () Bool)

(declare-fun e!232667 () Bool)

(assert (=> b!322922 (= e!232666 e!232667)))

(declare-fun res!265092 () Bool)

(assert (=> b!322922 (=> (not res!265092) (not e!232667))))

(declare-fun thiss!1793 () BitStream!14102)

(declare-fun lt!445590 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322922 (= res!265092 (validate_offset_bits!1 ((_ sign_extend 32) (size!8970 (buf!8112 thiss!1793))) ((_ sign_extend 32) (currentByte!14968 thiss!1793)) ((_ sign_extend 32) (currentBit!14963 thiss!1793)) lt!445590))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!322922 (= lt!445590 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!322923 () Bool)

(declare-fun res!265098 () Bool)

(assert (=> b!322923 (=> (not res!265098) (not e!232670))))

(assert (=> b!322923 (= res!265098 (= (bvand (_1!13448 lt!445591) (onesLSBLong!0 nBits!548)) (_1!13448 lt!445591)))))

(declare-fun b!322924 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322924 (= e!232670 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!8970 (buf!8112 thiss!1793))) ((_ sign_extend 32) (currentByte!14968 thiss!1793)) ((_ sign_extend 32) (currentBit!14963 thiss!1793)))))))

(declare-fun b!322925 () Bool)

(assert (=> b!322925 (= e!232667 e!232668)))

(declare-fun res!265097 () Bool)

(assert (=> b!322925 (=> (not res!265097) (not e!232668))))

(assert (=> b!322925 (= res!265097 (= (buf!8112 (_2!13448 lt!445591)) (buf!8112 thiss!1793)))))

(declare-datatypes ((tuple2!23640 0))(
  ( (tuple2!23641 (_1!13449 Bool) (_2!13449 BitStream!14102)) )
))
(declare-fun lt!445592 () tuple2!23640)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23638)

(assert (=> b!322925 (= lt!445591 (readNBitsLSBFirstsLoop!0 (_2!13449 lt!445592) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13449 lt!445592) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14102) tuple2!23640)

(assert (=> b!322925 (= lt!445592 (readBit!0 thiss!1793))))

(declare-fun b!322926 () Bool)

(declare-fun res!265091 () Bool)

(assert (=> b!322926 (=> (not res!265091) (not e!232667))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322926 (= res!265091 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322927 () Bool)

(declare-fun res!265094 () Bool)

(assert (=> b!322927 (=> (not res!265094) (not e!232667))))

(assert (=> b!322927 (= res!265094 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun res!265099 () Bool)

(assert (=> start!71988 (=> (not res!265099) (not e!232666))))

(assert (=> start!71988 (= res!265099 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71988 e!232666))

(assert (=> start!71988 true))

(declare-fun e!232669 () Bool)

(declare-fun inv!12 (BitStream!14102) Bool)

(assert (=> start!71988 (and (inv!12 thiss!1793) e!232669)))

(declare-fun b!322928 () Bool)

(declare-fun res!265093 () Bool)

(assert (=> b!322928 (=> (not res!265093) (not e!232668))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322928 (= res!265093 (= (bitIndex!0 (size!8970 (buf!8112 (_2!13448 lt!445591))) (currentByte!14968 (_2!13448 lt!445591)) (currentBit!14963 (_2!13448 lt!445591))) (bvadd (bitIndex!0 (size!8970 (buf!8112 thiss!1793)) (currentByte!14968 thiss!1793) (currentBit!14963 thiss!1793)) lt!445590)))))

(declare-fun b!322929 () Bool)

(declare-fun array_inv!8522 (array!20609) Bool)

(assert (=> b!322929 (= e!232669 (array_inv!8522 (buf!8112 thiss!1793)))))

(declare-fun b!322930 () Bool)

(declare-fun res!265096 () Bool)

(assert (=> b!322930 (=> (not res!265096) (not e!232670))))

(assert (=> b!322930 (= res!265096 (bvslt i!743 nBits!548))))

(assert (= (and start!71988 res!265099) b!322922))

(assert (= (and b!322922 res!265092) b!322926))

(assert (= (and b!322926 res!265091) b!322927))

(assert (= (and b!322927 res!265094) b!322925))

(assert (= (and b!322925 res!265097) b!322928))

(assert (= (and b!322928 res!265093) b!322921))

(assert (= (and b!322921 res!265095) b!322923))

(assert (= (and b!322923 res!265098) b!322930))

(assert (= (and b!322930 res!265096) b!322924))

(assert (= start!71988 b!322929))

(declare-fun m!461141 () Bool)

(assert (=> b!322924 m!461141))

(declare-fun m!461143 () Bool)

(assert (=> b!322925 m!461143))

(declare-fun m!461145 () Bool)

(assert (=> b!322925 m!461145))

(declare-fun m!461147 () Bool)

(assert (=> b!322923 m!461147))

(declare-fun m!461149 () Bool)

(assert (=> b!322921 m!461149))

(declare-fun m!461151 () Bool)

(assert (=> b!322929 m!461151))

(declare-fun m!461153 () Bool)

(assert (=> b!322928 m!461153))

(declare-fun m!461155 () Bool)

(assert (=> b!322928 m!461155))

(declare-fun m!461157 () Bool)

(assert (=> b!322926 m!461157))

(declare-fun m!461159 () Bool)

(assert (=> b!322922 m!461159))

(declare-fun m!461161 () Bool)

(assert (=> start!71988 m!461161))

(push 1)

(assert (not start!71988))

(assert (not b!322921))

(assert (not b!322923))

(assert (not b!322928))

(assert (not b!322925))

(assert (not b!322922))

(assert (not b!322924))

(assert (not b!322929))

(assert (not b!322926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105946 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105946 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8970 (buf!8112 thiss!1793))) ((_ sign_extend 32) (currentByte!14968 thiss!1793)) ((_ sign_extend 32) (currentBit!14963 thiss!1793)) lt!445590) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8970 (buf!8112 thiss!1793))) ((_ sign_extend 32) (currentByte!14968 thiss!1793)) ((_ sign_extend 32) (currentBit!14963 thiss!1793))) lt!445590))))

(declare-fun bs!27897 () Bool)

(assert (= bs!27897 d!105946))

(declare-fun m!461175 () Bool)

(assert (=> bs!27897 m!461175))

(assert (=> b!322922 d!105946))

(declare-fun d!105948 () Bool)

(assert (=> d!105948 (= (onesLSBLong!0 i!743) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!743))))))

(assert (=> b!322921 d!105948))

(declare-fun d!105950 () Bool)

(assert (=> d!105950 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322926 d!105950))

(declare-fun d!105952 () Bool)

(assert (=> d!105952 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8970 (buf!8112 thiss!1793))) ((_ sign_extend 32) (currentByte!14968 thiss!1793)) ((_ sign_extend 32) (currentBit!14963 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8970 (buf!8112 thiss!1793))) ((_ sign_extend 32) (currentByte!14968 thiss!1793)) ((_ sign_extend 32) (currentBit!14963 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27898 () Bool)

(assert (= bs!27898 d!105952))

(assert (=> bs!27898 m!461175))

(assert (=> b!322924 d!105952))

(declare-fun b!322999 () Bool)

(declare-fun e!232709 () tuple2!23638)

(declare-fun lt!445709 () tuple2!23638)

(assert (=> b!322999 (= e!232709 (tuple2!23639 (_1!13448 lt!445709) (_2!13448 lt!445709)))))

(declare-fun lt!445706 () tuple2!23640)

(assert (=> b!322999 (= lt!445706 (readBit!0 (_2!13449 lt!445592)))))

(assert (=> b!322999 (= lt!445709 (readNBitsLSBFirstsLoop!0 (_2!13449 lt!445706) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13449 lt!445592) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13449 lt!445706) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!323000 () Bool)

(declare-fun res!265157 () Bool)

(declare-fun e!232708 () Bool)

(assert (=> b!323000 (=> (not res!265157) (not e!232708))))

(declare-fun lt!445708 () tuple2!23638)

(assert (=> b!323000 (= res!265157 (= (bvand (_1!13448 lt!445708) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13449 lt!445592) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!323001 () Bool)

(declare-fun res!265158 () Bool)

(assert (=> b!323001 (=> (not res!265158) (not e!232708))))

(assert (=> b!323001 (= res!265158 (= (bvand (_1!13448 lt!445708) (onesLSBLong!0 nBits!548)) (_1!13448 lt!445708)))))

(declare-fun d!105954 () Bool)

(assert (=> d!105954 e!232708))

(declare-fun res!265154 () Bool)

(assert (=> d!105954 (=> (not res!265154) (not e!232708))))

(assert (=> d!105954 (= res!265154 (= (buf!8112 (_2!13448 lt!445708)) (buf!8112 (_2!13449 lt!445592))))))

(assert (=> d!105954 (= lt!445708 e!232709)))

(declare-fun c!15441 () Bool)

(assert (=> d!105954 (= c!15441 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!105954 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!105954 (= (readNBitsLSBFirstsLoop!0 (_2!13449 lt!445592) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13449 lt!445592) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!445708)))

(declare-fun b!323002 () Bool)

(declare-fun e!232710 () Bool)

(assert (=> b!323002 (= e!232708 e!232710)))

(declare-fun res!265156 () Bool)

(assert (=> b!323002 (=> res!265156 e!232710)))

(assert (=> b!323002 (= res!265156 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun lt!445707 () (_ BitVec 64))

(declare-fun b!323003 () Bool)

(declare-datatypes ((tuple2!23648 0))(
  ( (tuple2!23649 (_1!13453 BitStream!14102) (_2!13453 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14102) tuple2!23648)

(assert (=> b!323003 (= e!232710 (= (= (bvand (bvlshr (_1!13448 lt!445708) lt!445707) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13453 (readBitPure!0 (_2!13449 lt!445592)))))))

(assert (=> b!323003 (and (bvsge lt!445707 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!445707 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323003 (= lt!445707 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun b!323004 () Bool)

(assert (=> b!323004 (= e!232709 (tuple2!23639 (bvor acc!161 (ite (_1!13449 lt!445592) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13449 lt!445592)))))

(declare-fun b!323005 () Bool)

(declare-fun res!265155 () Bool)

(assert (=> b!323005 (=> (not res!265155) (not e!232708))))

(declare-fun lt!445704 () (_ BitVec 64))

(declare-fun lt!445705 () (_ BitVec 64))

(assert (=> b!323005 (= res!265155 (= (bitIndex!0 (size!8970 (buf!8112 (_2!13448 lt!445708))) (currentByte!14968 (_2!13448 lt!445708)) (currentBit!14963 (_2!13448 lt!445708))) (bvadd lt!445704 lt!445705)))))

(assert (=> b!323005 (or (not (= (bvand lt!445704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445705 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445704 lt!445705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323005 (= lt!445705 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!323005 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!323005 (= lt!445704 (bitIndex!0 (size!8970 (buf!8112 (_2!13449 lt!445592))) (currentByte!14968 (_2!13449 lt!445592)) (currentBit!14963 (_2!13449 lt!445592))))))

(assert (= (and d!105954 c!15441) b!323004))

(assert (= (and d!105954 (not c!15441)) b!322999))

(assert (= (and d!105954 res!265154) b!323005))

(assert (= (and b!323005 res!265155) b!323000))

(assert (= (and b!323000 res!265157) b!323001))

(assert (= (and b!323001 res!265158) b!323002))

(assert (= (and b!323002 (not res!265156)) b!323003))

(declare-fun m!461201 () Bool)

(assert (=> b!323000 m!461201))

(declare-fun m!461203 () Bool)

(assert (=> b!323003 m!461203))

(assert (=> b!323001 m!461147))

(declare-fun m!461205 () Bool)

(assert (=> b!323005 m!461205))

(declare-fun m!461207 () Bool)

(assert (=> b!323005 m!461207))

(declare-fun m!461209 () Bool)

(assert (=> b!322999 m!461209))

(declare-fun m!461211 () Bool)

(assert (=> b!322999 m!461211))

(assert (=> b!322925 d!105954))

(declare-fun d!105980 () Bool)

(declare-fun e!232726 () Bool)

(assert (=> d!105980 e!232726))

(declare-fun res!265168 () Bool)

(assert (=> d!105980 (=> (not res!265168) (not e!232726))))

(declare-datatypes ((Unit!22036 0))(
  ( (Unit!22037) )
))
(declare-datatypes ((tuple2!23652 0))(
  ( (tuple2!23653 (_1!13455 Unit!22036) (_2!13455 BitStream!14102)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14102) tuple2!23652)

(assert (=> d!105980 (= res!265168 (= (buf!8112 (_2!13455 (increaseBitIndex!0 thiss!1793))) (buf!8112 thiss!1793)))))

(declare-fun lt!445749 () Bool)

(assert (=> d!105980 (= lt!445749 (not (= (bvand ((_ sign_extend 24) (select (arr!10062 (buf!8112 thiss!1793)) (currentByte!14968 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14963 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445746 () tuple2!23640)

(assert (=> d!105980 (= lt!445746 (tuple2!23641 (not (= (bvand ((_ sign_extend 24) (select (arr!10062 (buf!8112 thiss!1793)) (currentByte!14968 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14963 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13455 (increaseBitIndex!0 thiss!1793))))))

(assert (=> d!105980 (validate_offset_bit!0 ((_ sign_extend 32) (size!8970 (buf!8112 thiss!1793))) ((_ sign_extend 32) (currentByte!14968 thiss!1793)) ((_ sign_extend 32) (currentBit!14963 thiss!1793)))))

(assert (=> d!105980 (= (readBit!0 thiss!1793) lt!445746)))

(declare-fun lt!445747 () (_ BitVec 64))

(declare-fun lt!445748 () (_ BitVec 64))

(declare-fun b!323017 () Bool)

(assert (=> b!323017 (= e!232726 (= (bitIndex!0 (size!8970 (buf!8112 (_2!13455 (increaseBitIndex!0 thiss!1793)))) (currentByte!14968 (_2!13455 (increaseBitIndex!0 thiss!1793))) (currentBit!14963 (_2!13455 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!445747 lt!445748)))))

(assert (=> b!323017 (or (not (= (bvand lt!445747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445748 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445747 lt!445748) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323017 (= lt!445748 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323017 (= lt!445747 (bitIndex!0 (size!8970 (buf!8112 thiss!1793)) (currentByte!14968 thiss!1793) (currentBit!14963 thiss!1793)))))

(declare-fun lt!445745 () Bool)

(assert (=> b!323017 (= lt!445745 (not (= (bvand ((_ sign_extend 24) (select (arr!10062 (buf!8112 thiss!1793)) (currentByte!14968 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14963 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445750 () Bool)

(assert (=> b!323017 (= lt!445750 (not (= (bvand ((_ sign_extend 24) (select (arr!10062 (buf!8112 thiss!1793)) (currentByte!14968 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14963 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445744 () Bool)

(assert (=> b!323017 (= lt!445744 (not (= (bvand ((_ sign_extend 24) (select (arr!10062 (buf!8112 thiss!1793)) (currentByte!14968 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14963 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105980 res!265168) b!323017))

(declare-fun m!461225 () Bool)

(assert (=> d!105980 m!461225))

(declare-fun m!461227 () Bool)

(assert (=> d!105980 m!461227))

(declare-fun m!461229 () Bool)

(assert (=> d!105980 m!461229))

(assert (=> d!105980 m!461141))

(assert (=> b!323017 m!461227))

(assert (=> b!323017 m!461225))

(declare-fun m!461231 () Bool)

(assert (=> b!323017 m!461231))

(assert (=> b!323017 m!461229))

(assert (=> b!323017 m!461155))

(assert (=> b!322925 d!105980))

(declare-fun d!105984 () Bool)

(assert (=> d!105984 (= (onesLSBLong!0 nBits!548) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!548))))))

(assert (=> b!322923 d!105984))

(declare-fun d!105986 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105986 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14963 thiss!1793) (currentByte!14968 thiss!1793) (size!8970 (buf!8112 thiss!1793))))))

(declare-fun bs!27903 () Bool)

(assert (= bs!27903 d!105986))

(declare-fun m!461233 () Bool)

(assert (=> bs!27903 m!461233))

(assert (=> start!71988 d!105986))

(declare-fun d!105988 () Bool)

(declare-fun e!232730 () Bool)

(assert (=> d!105988 e!232730))

(declare-fun res!265174 () Bool)

(assert (=> d!105988 (=> (not res!265174) (not e!232730))))

(declare-fun lt!445773 () (_ BitVec 64))

(declare-fun lt!445772 () (_ BitVec 64))

(declare-fun lt!445774 () (_ BitVec 64))

(assert (=> d!105988 (= res!265174 (= lt!445774 (bvsub lt!445772 lt!445773)))))

(assert (=> d!105988 (or (= (bvand lt!445772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445773 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445772 lt!445773) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105988 (= lt!445773 (remainingBits!0 ((_ sign_extend 32) (size!8970 (buf!8112 (_2!13448 lt!445591)))) ((_ sign_extend 32) (currentByte!14968 (_2!13448 lt!445591))) ((_ sign_extend 32) (currentBit!14963 (_2!13448 lt!445591)))))))

(declare-fun lt!445771 () (_ BitVec 64))

(declare-fun lt!445775 () (_ BitVec 64))

(assert (=> d!105988 (= lt!445772 (bvmul lt!445771 lt!445775))))

(assert (=> d!105988 (or (= lt!445771 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445775 (bvsdiv (bvmul lt!445771 lt!445775) lt!445771)))))

(assert (=> d!105988 (= lt!445775 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105988 (= lt!445771 ((_ sign_extend 32) (size!8970 (buf!8112 (_2!13448 lt!445591)))))))

(assert (=> d!105988 (= lt!445774 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14968 (_2!13448 lt!445591))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14963 (_2!13448 lt!445591)))))))

(assert (=> d!105988 (invariant!0 (currentBit!14963 (_2!13448 lt!445591)) (currentByte!14968 (_2!13448 lt!445591)) (size!8970 (buf!8112 (_2!13448 lt!445591))))))

(assert (=> d!105988 (= (bitIndex!0 (size!8970 (buf!8112 (_2!13448 lt!445591))) (currentByte!14968 (_2!13448 lt!445591)) (currentBit!14963 (_2!13448 lt!445591))) lt!445774)))

(declare-fun b!323023 () Bool)

(declare-fun res!265175 () Bool)

(assert (=> b!323023 (=> (not res!265175) (not e!232730))))

(assert (=> b!323023 (= res!265175 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445774))))

(declare-fun b!323024 () Bool)

(declare-fun lt!445770 () (_ BitVec 64))

(assert (=> b!323024 (= e!232730 (bvsle lt!445774 (bvmul lt!445770 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323024 (or (= lt!445770 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445770 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445770)))))

(assert (=> b!323024 (= lt!445770 ((_ sign_extend 32) (size!8970 (buf!8112 (_2!13448 lt!445591)))))))

(assert (= (and d!105988 res!265174) b!323023))

(assert (= (and b!323023 res!265175) b!323024))

(declare-fun m!461243 () Bool)

(assert (=> d!105988 m!461243))

(declare-fun m!461245 () Bool)

(assert (=> d!105988 m!461245))

(assert (=> b!322928 d!105988))

(declare-fun d!105998 () Bool)

(declare-fun e!232731 () Bool)

(assert (=> d!105998 e!232731))

(declare-fun res!265176 () Bool)

(assert (=> d!105998 (=> (not res!265176) (not e!232731))))

(declare-fun lt!445778 () (_ BitVec 64))

(declare-fun lt!445779 () (_ BitVec 64))

(declare-fun lt!445780 () (_ BitVec 64))

(assert (=> d!105998 (= res!265176 (= lt!445780 (bvsub lt!445778 lt!445779)))))

(assert (=> d!105998 (or (= (bvand lt!445778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445778 lt!445779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105998 (= lt!445779 (remainingBits!0 ((_ sign_extend 32) (size!8970 (buf!8112 thiss!1793))) ((_ sign_extend 32) (currentByte!14968 thiss!1793)) ((_ sign_extend 32) (currentBit!14963 thiss!1793))))))

(declare-fun lt!445777 () (_ BitVec 64))

(declare-fun lt!445781 () (_ BitVec 64))

(assert (=> d!105998 (= lt!445778 (bvmul lt!445777 lt!445781))))

(assert (=> d!105998 (or (= lt!445777 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445781 (bvsdiv (bvmul lt!445777 lt!445781) lt!445777)))))

(assert (=> d!105998 (= lt!445781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105998 (= lt!445777 ((_ sign_extend 32) (size!8970 (buf!8112 thiss!1793))))))

(assert (=> d!105998 (= lt!445780 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14968 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14963 thiss!1793))))))

(assert (=> d!105998 (invariant!0 (currentBit!14963 thiss!1793) (currentByte!14968 thiss!1793) (size!8970 (buf!8112 thiss!1793)))))

(assert (=> d!105998 (= (bitIndex!0 (size!8970 (buf!8112 thiss!1793)) (currentByte!14968 thiss!1793) (currentBit!14963 thiss!1793)) lt!445780)))

(declare-fun b!323025 () Bool)

(declare-fun res!265177 () Bool)

(assert (=> b!323025 (=> (not res!265177) (not e!232731))))

(assert (=> b!323025 (= res!265177 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445780))))

(declare-fun b!323026 () Bool)

(declare-fun lt!445776 () (_ BitVec 64))

(assert (=> b!323026 (= e!232731 (bvsle lt!445780 (bvmul lt!445776 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323026 (or (= lt!445776 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445776 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445776)))))

